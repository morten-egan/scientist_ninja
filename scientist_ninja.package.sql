create or replace package scientist_ninja

as

  /** PLSQL implementation to mimick the behaviour of Github/Trello scientist packages.
  * See here for more: http://www.codemonth.dk/scientist_ninja
  * @author Morten Egan
  * @version 0.0.1
  * @project SCIENTIST_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Define experiment.
  * @author Morten Egan
  * @param experiment_name The name of the experiment.
  */
  procedure define_experiment (
    experiment_name             in        varchar2
    , experiment_id             in        varchar2 default null
  );

end scientist_ninja;
/
