//import "primereact/resources/themes/bootstrap4-dark-purple/theme.css";
import "primereact/resources/primereact.css"; // core css
import "primeflex/primeflex.css"; // css utility
import "./css/styles.css";
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
        {option[props.optionGroupChildren[0]] && (
          <i
            className={option.icon.icon}
            style={{ color: option.icon.color, fontSize: option.icon.size }}
          />
        )}
        {option[props.optionGroupChildren[1]] && (
          <i
            className={option.icon.icon}
            style={{ color: option.icon.color, fontSize: option.icon.size }}
          />
        )}
        {option[props.optionLabel] && (
          <i
            className={option.icon.icon}
            style={{ color: option.icon.color, fontSize: option.icon.size }}
          />
        )}
        <span>{option[props.optionLabel]}</span>
        <span>{option[props.optionGroupLabel]}</span>
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
        className="w-fit md:w-14rem"
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
