import { reactShinyInput } from "reactR";
import { CascadeSelect } from "primereact/cascadeselect";
import "primereact/resources/themes/bootstrap4-dark-purple/theme.css";
import "primereact/resources/primereact.css"; // core css
import "primeicons/primeicons.css"; // icons
import "primeflex/primeflex.css"; // css utility
import "./css/card.css";

const App = (props) => {
  const [selection, setSelection] = React.useState(props.value);
  const data = props.data;

  const handleChange = (e) => {
    setSelection(e.value);
    props.setShinyValue(e.value.cname);
    console.log(e);
  };

  return (
    <div className="card flex justify-content-center">
      <CascadeSelect
        value={selection}
        onChange={handleChange}
        options={data}
        optionLabel="cname"
        optionGroupLabel="name"
        optionGroupChildren={["states", "cities"]}
        className="w-full md:w-14rem"
        breakpoint="767px"
        placeholder="Select a City"
      />
    </div>
  );
};

const CascadeSelectInput = ({ configuration, value, setValue }) => {
  return (
    <App value={value} data={configuration.data} setShinyValue={setValue} />
  );
};

reactShinyInput(
  ".cascadeSelect",
  "cascadeSelect.cascadeSelect",
  CascadeSelectInput
);
