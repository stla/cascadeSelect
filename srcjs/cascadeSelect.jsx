import "primereact/resources/themes/bootstrap4-dark-purple/theme.css";
import "primereact/resources/primereact.css"; // core css
//import "./css/styles.css"; // icons
//import "primeicons/primeicons.css";
//import { PrimeIcons } from 'primereact/api';
import "primeflex/primeflex.css"; // css utility
import "./css/card.css";
import { reactShinyInput } from "reactR";
import { CascadeSelect } from "primereact/cascadeselect";

const App = (props) => {
  const [selection, setSelection] = React.useState(props.value);
  const data = props.data;

  const handleChange = (e) => {
    setSelection(e.value);
    props.setShinyValue(e.value);
    console.log(e);
  };

  const optionTemplate = (option) => {
    return (
      <div className="flex align-items-center gap-2">
        {option.subfolders && <i className="x" />}
        {option.files && <i className={option.icon} style={{ color: 'green' }} />}
        {option.fname && <i className={option.icon} style={{ color: 'green' }} />}
        <span>{option.fname}</span>
        <span>{option.name}</span>
      </div>
    );
  };

  return (
    <div className="card flex justify-content-center">
      <CascadeSelect
        value={selection}
        onChange={handleChange}
        placeholder={props.placeholder}
        options={data}
        optionLabel={props.optionLabel}
        optionGroupLabel={props.optionGroupLabel}
        optionGroupChildren={props.optionGroupChildren}
        className="w-full md:w-14rem"
        breakpoint="767px"
        itemTemplate={optionTemplate}
      />
    </div>
  );
};

const CascadeSelectInput = ({ configuration, value, setValue }) => {
  return (
    <App
      value={value}
      placeholder={configuration.placeholder}
      data={configuration.data}
      optionLabel={configuration.optionLabel}
      optionGroupLabel={configuration.optionGroupLabel}
      optionGroupChildren={configuration.optionGroupChildren}
      setShinyValue={setValue}
    />
  );
};

reactShinyInput(
  ".cascadeSelect",
  "cascadeSelect.cascadeSelect",
  CascadeSelectInput
);
