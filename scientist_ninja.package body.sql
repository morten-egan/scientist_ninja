create or replace package body scientist_ninja

as

  procedure define_experiment  (
    experiment_name             in        varchar2
    , experiment_id             in        varchar2 default null
  )

  as

    l_experiment_id         varchar2(15) := experiment_id;

  begin

    dbms_application_info.set_action('define_experiment');

    if l_experiment_id is null then
      l_experiment_id := replace(substr(experiment_name, 1, 15), ' ', '_');
    end if;

    if sys_context('scientist_ninja_c', l_experiment_id) is null then
      -- Currently not a running experiment.
      -- if experiment not existing in experiment repos then
      dbms_session.set_context('scientist_ninja_c', l_experiment_id, 1);
      -- else add experiment to repos.
      -- end if
    else
      raise_application_error(-20042, 'Experiment with experiment ID "'|| l_experiment_id ||'" already exists.');
    end if;

    dbms_application_info.set_action(null);

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end define_experiment;

begin

  dbms_application_info.set_client_info('scientist_ninja');
  dbms_session.set_identifier('scientist_ninja');

end scientist_ninja;
/
