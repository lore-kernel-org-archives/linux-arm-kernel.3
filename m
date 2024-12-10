Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77687E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK5K8PlOLl5EA88EJqgffxDjUZCIHwT5dMGU4v73DsI=; b=gWLEzal+R8aUQHm9Tlks1GHAFB
	8RjuGVpDJYPCTdQsY969fN+a2h4MH7Qle8t2jovuh2ZBl/ILFlQJDtSmPZ+VxlbonQVfRkeUPb+Cm
	tIPDo/oDsVtBfQEj6SD0Yw8yTnOx0WunO0AA/s1pyUPSXzwdvKXI/EEy3by/XEjNCAqbz2P+1gKMH
	1Ymz5INLwqP4q9GFoDyqdZGoaD+SXeE3TCZORaZiJx87svIRc6F9KU8uqmy/WIAWB8th0IW/Y4hsc
	4w4cllw28rCBZvQQ4fuMGpAiB1QUYBsbGlGaVJIT/GUC3ZmCvhVdJkypVsMWnND35Me+7kl0ODKOL
	jdZhqvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8TR-0000000CxEF-48Zi;
	Tue, 10 Dec 2024 22:12:57 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8SK-0000000Cwsc-3WVf;
	Tue, 10 Dec 2024 22:11:53 +0000
X-QQ-mid: bizesmtpip4t1733868658t2yooom
X-QQ-Originating-IP: is2dtZlVyv163ZGx/pSgk725Pe4YDEi/f+aGkZ+195Y=
Received: from [IPV6:240f:10b:7440:1:9e54:d32d ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Dec 2024 06:10:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1576610226982818791
Message-ID: <6A24DF29AE2F3CDC+70602cc7-2c03-470d-955f-06b2db116e20@radxa.com>
Date: Wed, 11 Dec 2024 07:10:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: rockchip: Add USB-C support to ROCK 5B
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20241210163615.120594-1-sebastian.reichel@collabora.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20241210163615.120594-1-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Nco2gOFShP5naH7TxSTL+WtrlsrIPepNzEeGmmfpnMsl19Y2oHDyvB4m
	gGix6au8x4iwmgoIeV8iQeQp+XJsIFN/YJ6TpoM/uVfula6cfv8Ot18tErjjm65cewWBvkd
	sYI4wWoNe0OJ4lL9zrmyZkL2WbePFgrPCmw7EfMwRpz0yiCRttFUEOAUTTYJGSlzqpJwBhk
	zhua4zaGaXON/mUbZ5lFCBKuPbBr1T3M5Y0s3jDr4RaRG7TxvtMb38gV/CvyBXvrCvaLUEj
	6d13GSXOYgT3z4nTkzIJVd0PqkJgqST6b3E61Wv2m7aKLDIHfn6lNnoLnFiz8acdTlVa2et
	ovX7Vp6T1PofVZhz3xTkym6MjOwxf3o3mCfMcjDC9q8IfQVTTQM7Bo44WpP48x7opzEsMhl
	OXNrGZ4Moh3irCeZ3w2g56i/QK9KUFHAQmoqmd55N+izvB9dZgbE5c1cIvi55m3aDNMRxxc
	ibeakUKHtGptQZriefX2PCbZDgmlVqJVfk28+02mVTE1K5sylGXiP9tBOSr2E82qKhS8h7K
	Ro0b4LgaET50fpplSLbF1+QZNggeEAV5IIzYCE7Wtpm9J9bQV8iQ5HRtnm3/z3JYd+aBErL
	nPakD1OxSRvtwusUYKyl00s8jVB4N+ZaEtVqlqmeT0NaNtjuhnOpufOnpAJkxETTKFEfJBk
	JndikrYdDgBKJInZyFuANgNmxG5zP8OH3iq5oYLP+FhM//7NDGV2+MYaUxOm9eTNc3G9WIR
	/+v/Ijqoh8OMriAL6PycAVORcFDnf4Smvc2qsfY9ZN6KWaCOjMSt4z/lnIKb6lH45tbBPG5
	9cdwSrbmBm0MLygxpfSaALDnLjMDOFyJNXDYhCLc4bxgAZmRkF1ivVykqJAZWWeqIUnl9FC
	kSZlQllgi+98E1jz82H7t6Gpwnmg571Z
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_141149_277216_6917C3F5 
X-CRM114-Status: GOOD (  25.04  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Sebastian,

Thank you very much for your work!

$ cat 
/sys/class/power_supply/tcpm-source-psy-4-0022/{current_max,current_now,online,type,usb_type,voltage_max,voltage_min,voltage_now}
1500000
1500000
1
USB
C [PD] PD_PPS
20000000
20000000
20000000

$ cat 
/sys/class/power_supply/tcpm-source-psy-4-0022/{current_max,current_now,online,type,usb_type,voltage_max,voltage_min,voltage_now}
5000000
5000000
1
USB
C PD [PD_PPS]
20000000
20000000
20000000

$ ls /sys/class/udc/
fc000000.usb

I can configure it as CDC-NCM and host detects it.
But I could not use it as a HOST port. How to use it?

some minor nitpick is below:

On 12/11/24 01:36, Sebastian Reichel wrote:
> Add hardware description for the USB-C port in the Radxa Rock 5 Model B.
> This describes the OHCI, EHCI and XHCI USB parts, but not yet the
> DisplayPort AltMode (bindings are not yet upstream).
> 
> The fusb302 node is marked with status "fail", since the board is usually
> powered through the USB-C port. Handling of errors can result in hard
> resets, which removed the bus power for some time resulting in a board
> reset.
> 
> The main problem is that devices are supposed to interact with the
> power-supply within 5 seconds after the plug event according to the
> USB PD specification. This is more or less impossible to achieve when
> the kernel is the first software communicating with the power-supply.
> 
> Recent U-Boot (v2025.01) will start doing USB-PD communication, which
> solves this issue. Upstream U-Boot doing USB-PD communication will also
> set the fusb302 node status to "okay". That way booting a kernel with
> the updated DT on an old U-Boot avoids a reset loop.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   .../boot/dts/rockchip/rk3588-rock-5b.dts      | 121 ++++++++++++++++++
>   1 file changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> index d597112f1d5b..cb5990df6ccb 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -5,6 +5,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/leds/common.h>
>   #include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
>   #include "rk3588.dtsi"
>   
>   / {
> @@ -84,6 +85,15 @@ rfkill-bt {
>   		shutdown-gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
>   	};
>   
> +	vcc12v_dcin: regulator-vcc12v-dcin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc12v_dcin";

typec_vin by schematic.

> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
>   	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
>   		compatible = "regulator-fixed";
>   		enable-active-high;
> @@ -142,6 +152,7 @@ vcc5v0_sys: regulator-vcc5v0-sys {
>   		regulator-boot-on;
>   		regulator-min-microvolt = <5000000>;
>   		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc12v_dcin>;

typec_vin.

>   	};
>   
>   	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> @@ -264,6 +275,67 @@ regulator-state-mem {
>   	};
>   };
>   
> +&i2c4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4m1_xfer>;
> +	status = "okay";
> +
> +	usbc0: usb-typec@22 {

Is "usbc0" label necessary?

> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;

cc_int_l by schematic.

> +		vbus-supply = <&vcc12v_dcin>;

typec_vin

> +		/*
> +		 * When the board is starting to send power-delivery messages
> +		 * too late (5 seconds according to the specification), the
> +		 * power-supply reacts with a hard-reset. That removes the
> +		 * power from VBUS for some time, which resets te whole board.

... resets "the" whole board.

> +		 */
> +		status = "fail";
> +
> +		usb_con: connector {

Is "usb_con" label necessary?

> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "sink";
> +			try-power-role = "sink";
> +			op-sink-microwatt = <1000000>;
> +			sink-pdos =
> +				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>,
> +				<PDO_VAR(5000, 20000, 5000)>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					usbc0_role_sw: endpoint {
> +						remote-endpoint = <&dwc3_0_role_switch>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					usbc0_orien_sw: endpoint {
> +						remote-endpoint = <&usbdp_phy0_orientation_switch>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					dp_altmode_mux: endpoint {
> +						remote-endpoint = <&usbdp_phy0_dp_altmode_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
>   &i2c6 {
>   	status = "okay";
>   
> @@ -423,6 +495,10 @@ usb {
>   		vcc5v0_host_en: vcc5v0-host-en {
>   			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
> +
> +		usbc0_int: usbc0-int {

cc_int_l

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> +			rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
>   	};
>   };
>   
> @@ -835,6 +911,14 @@ &uart2 {
>   	status = "okay";
>   };
>   
> +&u2phy0 {
> +	status = "okay";
> +};
> +
> +&u2phy0_otg {
> +	status = "okay";
> +};
> +
>   &u2phy1 {
>   	status = "okay";
>   };
> @@ -866,6 +950,29 @@ &usbdp_phy1 {
>   	status = "okay";
>   };
>   
> +&usbdp_phy0 {
> +	mode-switch;
> +	orientation-switch;
> +	sbu1-dc-gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usbdp_phy0_orientation_switch: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&usbc0_orien_sw>;
> +		};
> +
> +		usbdp_phy0_dp_altmode_mux: endpoint@1 {
> +			reg = <1>;
> +			remote-endpoint = <&dp_altmode_mux>;
> +		};
> +	};
> +};
> +
>   &usb_host0_ehci {
>   	status = "okay";
>   };
> @@ -874,6 +981,20 @@ &usb_host0_ohci {
>   	status = "okay";
>   };
>   
> +&usb_host0_xhci {
> +	usb-role-switch;
> +	status = "okay";
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dwc3_0_role_switch: endpoint {
> +			remote-endpoint = <&usbc0_role_sw>;
> +		};
> +	};
> +};
> +
>   &usb_host1_ehci {
>   	status = "okay";
>   };


