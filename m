Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E59C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 10:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1tA8E6tSEi8pgyo2l3+8V+xZmJstOXrEmGOQAE1ENI=; b=CWPN2hDMUYboE4r2nWeHfAfp0d
	YgzWihtGrRiNx9WwazPP1jd5uNIX+KnuMLx5KRbXGKXplGq/k+zywp+Yue8bmnUoLrSZ4qBytTe8h
	fWuB+9+geH3ejDKwLFPBOGsV6yL98xV0ambJV9hAjQADwrdzAAla1zUpzSiQSjtvcBTR6wxfk+zdB
	01KC9dZRqeUWN/XH/wMRpgdQ8v28wbNc90k0aqurj/KZvfnRM4ziLRQsAnSsz9D/WbwFF10jqw4qs
	dN50+hRKbNeLajH4ssLvq6XE4m9a7lePRCT+ct2gdqdlGKl5P0U88kYAJaw1ZRDJ/4T7fs42xsxQ4
	AssHXPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQtg-0000000F7K3-3Dqe;
	Sun, 20 Jul 2025 10:03:56 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQrA-0000000F7Ej-3xTW;
	Sun, 20 Jul 2025 10:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1753005618;
	bh=+1tA8E6tSEi8pgyo2l3+8V+xZmJstOXrEmGOQAE1ENI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cYgkGmLOW5UXXgi77aCRniusISuzdZqJNdJG+0P6z4awB+K1aZqw0Y9yragh+RTCe
	 tcP5l+wSVqFVAOvEBoFPflV8ErZKTw+J755pRmNzdAqUaywK/FrFdOb3KYJaqJKADZ
	 +nMuTFef2T+lascapQxXJrAV96+8vHn1aGxJlX6o=
X-QQ-mid: zesmtpgz4t1753005609tc12dd885
X-QQ-Originating-IP: S7vlnT4f2Oeduz39Y0mGFUhDJP76sxEqA7iKr+yzmUg=
Received: from [192.168.0.103] ( [117.25.58.172])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 20 Jul 2025 18:00:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13950434152620915006
Message-ID: <E5C0D340064F22D9+c44656c5-6c20-4662-b331-40fc943e30b3@airkyi.com>
Date: Sun, 20 Jul 2025 18:00:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support
 for DisplayPort
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-6-kernel@airkyi.com>
 <skvceiwrg77ysx74bmywp6buk6yp6dlllrwpkfea4brposrveh@2rqtawpiaikk>
From: air windows <kernel@airkyi.com>
In-Reply-To: <skvceiwrg77ysx74bmywp6buk6yp6dlllrwpkfea4brposrveh@2rqtawpiaikk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OBlwWD/GWDEo8CT5u5pNZbXQyZ+EIDb92U6uNdnIJyJ1KIkFp/AHRxsX
	GWLPATpYIwQgPVzS/pAlyYHtJ/klWKaQcFOKVukx1JL4FTMe4QMlcpRTTIFaecxrq6d1qMR
	lgqzlfmSpOgbn3CGtJVneYxDWgvuw4qh2fHk/mmLm1ADUX4F0ytd2bzwU6ZSfr2me2qjjAr
	zdySvyxoc0SHNbVkLJXqH6FWqYRTH1NptJAhLBdGlh6IPIyj4UxPWxc4zKaTzb+Nb3KhUXs
	kUW3W3dn9VAObdIXceTAmcXzGm0ar1Wv9ftof/o4DGPj2hwFGE6Czjv0FuVkEEi3U6cuDgC
	D8kGPnznO3JqqXBBs3j8O+ubx8pklHjZVb8bxtj+uqcVwrKR4vugacc5VRbqOtmLj77efDZ
	RsgMz69eCouYaS1wlSNsjTbrl4lR+e3hKPjo1fxqMmRj+++fwoGcWk+yPp96YAPirgVt+pG
	8Q6yZdkk/hzs7uB/Lvt5OtzY2NbbiztX0wQFBRVfbKX2+miMOHBNJp+hx/rLYdV0sqWf/Qj
	yW5SAcsvbd/4JKbJAraN/wo7+DHlLpXlL0TeluAT2MwJ3sY6vq+bsdTEPKr/Qk/YQe/gAKB
	HNmY3RW29GBLkMGQLOdop7kGwKxPzwr8QfOt0U2LL/SL48XLztO9Pts85NlSlKhmZJ9L+lz
	okhGP1wA4M0J4HMGqsBvfQoGUf4xA2RZorlUAQ5YzE6LbN7HvgjdpZlJD1S2gIatEsEeD9F
	gLDXd/BO4HOU+k0kxakDLIsyyzUmnQH6ahLOWA8PMcwAg1U+JbTu5ACkTgAtyC3QgrFrj5+
	ci6EffEMjbG1HEny9mkSFkDjS0De8yz7pJEQQPommY4xu2bCo2woO6fmSnGy7raFqCzui8C
	3aKUJl0dRgoFH/iUeijHfYKK+yvOjxdkw68khx7/FcliavI8BUJQgIcAtWdTVd4E2m6U8Jk
	1TlZS2Sv0qaVVNbTAh4Yn2U/UeySbY0jW3k8=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_030121_441579_A9CA02AA 
X-CRM114-Status: GOOD (  17.35  )
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

在 2025/7/19 18:50, Dmitry Baryshkov 写道:

> On Fri, Jul 18, 2025 at 02:26:19PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The RK3399 EVB IND board has a Type-C interface DisplayPort.
>> It use fusb302 chip as Type-C controller.
>>
>> fusb302 chip ---> USB/DP PHY0 <----> CDN-DP controller
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v2:
>> - Add endpoint to link DP PHY and DP controller.
>> - Fix devicetree coding style.
>>
>>   .../boot/dts/rockchip/rk3399-evb-ind.dts      | 133 ++++++++++++++++++
>>   1 file changed, 133 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
>> index 70aee1ab904c..997b822a57ff 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
>> @@ -4,6 +4,7 @@
>>    */
>>   
>>   /dts-v1/;
>> +#include <dt-bindings/usb/pd.h>
>>   #include "rk3399.dtsi"
>>   
>>   / {
>> @@ -19,6 +20,21 @@ chosen {
>>   		stdout-path = "serial2:1500000n8";
>>   	};
>>   
>> +	sound: sound {
>> +		compatible = "rockchip,rk3399-gru-sound";
>> +		rockchip,cpu = <&i2s0 &spdif>;
>> +	};
>> +
>> +	vbus_typec: regulator-vbus-typec {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vcc5v0_typec0_en>;
>> +		regulator-name = "vbus_typec";
>> +		vin-supply = <&vcc5v0_sys>;
>> +	};
>> +
>>   	vcc5v0_sys: regulator-vcc5v0-sys {
>>   		compatible = "regulator-fixed";
>>   		enable-active-high;
>> @@ -31,6 +47,11 @@ vcc5v0_sys: regulator-vcc5v0-sys {
>>   	};
>>   };
>>   
>> +&cdn_dp {
>> +	phys = <&tcphy0_dp>;
>> +	status = "okay";
>> +};
>> +
>>   &cpu_b0 {
>>   	cpu-supply = <&vdd_cpu_b>;
>>   };
>> @@ -55,6 +76,12 @@ &cpu_l3 {
>>   	cpu-supply = <&vdd_cpu_l>;
>>   };
>>   
>> +&dp_out {
>> +	dp_controller_output: endpoint {
>> +		remote-endpoint = <&dp_phy_in>;
>> +	};
>> +};
>> +
>>   &emmc_phy {
>>   	status = "okay";
>>   };
>> @@ -341,6 +368,63 @@ regulator-state-mem {
>>   	};
>>   };
>>   
>> +&i2c4 {
>> +	i2c-scl-rising-time-ns = <475>;
>> +	i2c-scl-falling-time-ns = <26>;
>> +	status = "okay";
>> +
>> +	usbc0: typec-portc@22 {
>> +		compatible = "fcs,fusb302";
>> +		reg = <0x22>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&usbc0_int>;
>> +		vbus-supply = <&vbus_typec>;
>> +
>> +		usb_con: connector {
>> +			compatible = "usb-c-connector";
>> +			label = "USB-C";
>> +			data-role = "dual";
>> +			power-role = "dual";
>> +			try-power-role = "sink";
>> +			op-sink-microwatt = <1000000>;
>> +			sink-pdos =
>> +				<PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
>> +			source-pdos =
>> +				<PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
>> +
>> +			altmodes {
>> +				displayport {
>> +					svid = /bits/ 16 <0xff01>;
>> +					vdo = <0xffffffff>;
> I don't think that this VDO is correct. Please adjust it according to
> the spec.

Will fix in v3.


>
>> +				};
>> +			};
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					usbc0_orien_sw: endpoint {
>> +						remote-endpoint = <&tcphy0_orientation_switch>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					dp_mode_sw: endpoint {
>> +						remote-endpoint = <&tcphy_dp_altmode_switch>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>>   &i2s2 {
>>   	status = "okay";
>>   };
>> @@ -354,6 +438,16 @@ &io_domains {
>>   };
>>   
>>   &pinctrl {
>> +	usb-typec {
>> +		usbc0_int: usbc0-int {
>> +			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +
>> +		vcc5v0_typec0_en: vcc5v0-typec0-en {
>> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +
>>   	pmic {
>>   		pmic_int_l: pmic-int-l {
>>   			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
>> @@ -400,10 +494,48 @@ &sdmmc {
>>   	status = "okay";
>>   };
>>   
>> +&sound {
>> +	rockchip,codec = <&cdn_dp>;
>> +	status = "okay";
>> +};
>> +
>> +&spdif {
>> +	status = "okay";
>> +};
>> +
>>   &tcphy0 {
>>   	status = "okay";
>>   };
>>   
>> +&tcphy0_dp {
>> +	mode-switch;
> But not an orientation-switch? Shouldn't it also note the SBU pins
> orientation? Or DP lanes orientation?

Ah, you will find it in tcphy0_usb3. Yes this should also apply to DP, it's combo PHY.


>
>> +
>> +	port {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		tcphy_dp_altmode_switch: endpoint@0 {
>> +			reg = <0>;
>> +			remote-endpoint = <&dp_mode_sw>;
>> +		};
>> +
>> +		dp_phy_in: endpoint@1 {
>> +			reg = <1>;
>> +			remote-endpoint = <&dp_controller_output>;
>> +		};
>> +	};
>> +};
>> +
>> +&tcphy0_usb3 {
>> +	orientation-switch;
>
> Hmmm.

Well, I put it under &tcp_phy0 at first, but it looks like someone has already added this in other dtsi. So I put the two prop under each "child" phy...


>
>> +
>> +	port {
>> +		tcphy0_orientation_switch: endpoint {
>> +			remote-endpoint = <&usbc0_orien_sw>;
>> +		};
>> +	};
>> +};
>> +
>>   &tcphy1 {
>>   	status = "okay";
>>   };
>> @@ -461,6 +593,7 @@ &usb_host1_ohci {
>>   };
>>   
>>   &usbdrd_dwc3_0 {
>> +	usb-role-switch;
> This is an SoC-level property.

Will fix in v3.


>
>>   	status = "okay";
>>   };
>>   
>> -- 
>> 2.49.0
>>
>>


