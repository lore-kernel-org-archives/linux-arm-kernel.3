Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD64C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozQD9R+T65iAXfWtpkBIJpYmbD7YAYiEDjJbuw0jJD0=; b=zUsWU/06VE/VH4j8Zd+0nxE0Q8
	+D9uj0Z/FKMcdh2sOdixFYy2pikGDqGbLuGargxJ+rWjgckLIFVNKxRdG0L76BvWbKLN+t+CaqPZX
	fBlWU2lHPoCz1JGfWJg+VXTwW06OrGHENgtxqw+2j07zixs2jItDlna6bW+yVM6rq645Rytkvm0dn
	RdeaV/G2cf5uKSn26DpHv917d6hYi/XCV3/3sEbbMgLqpSNiMrODQi6GlGdI5eqTXoSb6PSkOqmRd
	E9JRUohltOEo48AfwIixwWT8B50J+GjMI+xHBWTtTFO783NeVpBpXeHSRTbo0RQ1Kyw5rSBzUlf2m
	IoiYTyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vce6i-0000000AsIN-0JPD;
	Mon, 05 Jan 2026 06:30:24 +0000
Received: from mail-m19731109.qiye.163.com ([220.197.31.109])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vce6a-0000000AsGa-2Q3T;
	Mon, 05 Jan 2026 06:30:19 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f8176a56;
	Mon, 5 Jan 2026 14:30:02 +0800 (GMT+08:00)
Message-ID: <458ed33d-ab28-406c-9a0e-ca54ab5afa6c@rock-chips.com>
Date: Mon, 5 Jan 2026 14:30:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Alexey Charkov <alchark@gmail.com>, Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260104023703.118-1-kernel@airkyi.com>
 <20260104023703.118-3-kernel@airkyi.com>
 <CABjd4Yz6Hp780DU_Z8j6D0-gQfT_ag86N8Vv=Q4TxUait_6-Mw@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CABjd4Yz6Hp780DU_Z8j6D0-gQfT_ag86N8Vv=Q4TxUait_6-Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b8cd92fc403abkunmcefd5ae1b378a8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0sYS1ZDQh8dTUNKSB1KH0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=iC8+jclDlBqNhnqNbmPthW5WYhOTqVnL1em2uG3hMeKGxDNMKeyLf7QSQW/b8nNXqhD0B9bvv8hLodoZIlgMuw0TNVUZ4soMPLf2KZttXAbO0yBmGb6BMVGi3gDXbzkmJ4wrCJYjw7YihpAhQnffqR/HVQH7Ni3E+6UVMShMhZE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ozQD9R+T65iAXfWtpkBIJpYmbD7YAYiEDjJbuw0jJD0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_223018_256547_1F7B9FC0 
X-CRM114-Status: GOOD (  21.02  )
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

Hi Alexey,

On 1/4/2026 3:36 PM, Alexey Charkov wrote:
> Hi Chaoyi,
> 
> On Sun, Jan 4, 2026 at 6:38 AM Chaoyi Chen <kernel@airkyi.com> wrote:
>>
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> General features for rk3576 evb2 board:
>>     - Rockchip RK3576
>>     - LPDDR4/4X
>>     - eMMC5.1
>>     - RK806-2x2pcs + DiscretePower
>>     - 1x HDMI2.1 TX / HDMI2.0 RX
>>     - 1x full size DP1.4 TX (Only 2 Lanes)
>>     - 2x 10/100/1000M Ethernet
>>     - 5x SATA3.0 7Pin Slot
>>     - 2x USB3.2 Gen1 Host
>>     - 3x USB2.0 Host
>>     - WIFI/BT
> 
> Would you like to highlight which features are tested/enabled with
> this version of the DTS? That might help set the expectations right
> for whoever tries it out.

Sure, I will add this in v2.

> 
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>  .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 941 ++++++++++++++++++
>>  2 files changed, 942 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
>> index c7617e06e1c1..cff95657d406 100644
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -153,6 +153,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb2-v10.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
>> new file mode 100644
>> index 000000000000..4f7d9f2027ca
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
>> @@ -0,0 +1,941 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
>> + *
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/pinctrl/rockchip.h>
>> +#include <dt-bindings/soc/rockchip,vop2.h>
>> +#include "rk3576.dtsi"
>> +
>> +/ {
>> +#include "rk3576.dtsi"
>> +
>> +/ {
>> +       model = "Rockchip RK3576 EVB2 V10 Board";
>> +       compatible = "rockchip,rk3576-evb2-v10", "rockchip,rk3576";
>> +
>> +       aliases {
>> +               ethernet0 = &gmac0;
>> +               ethernet1 = &gmac1;
>> +       };
>> +
>> +       chosen: chosen {
>> +               stdout-path = "serial0:1500000n8";
>> +       };
>> +
>> +       adc_keys: adc-keys {
>> +               compatible = "adc-keys";
>> +               io-channels = <&saradc 1>;
>> +               io-channel-names = "buttons";
>> +               keyup-threshold-microvolt = <1800000>;
>> +               poll-interval = <100>;
>> +
>> +               button-back {
>> +                       label = "back";
>> +                       linux,code = <KEY_BACK>;
>> +                       press-threshold-microvolt = <1235000>;
>> +               };
>> +
>> +               button-menu {
>> +                       label = "menu";
>> +                       linux,code = <KEY_MENU>;
>> +                       press-threshold-microvolt = <890000>;
>> +               };
>> +
>> +               button-vol-down {
>> +                       label = "volume down";
>> +                       linux,code = <KEY_VOLUMEDOWN>;
>> +                       press-threshold-microvolt = <417000>;
>> +               };
>> +
>> +               button-vol-up {
>> +                       label = "volume up";
>> +                       linux,code = <KEY_VOLUMEUP>;
>> +                       press-threshold-microvolt = <17000>;
>> +               };
>> +       };
>> +
>> +       hdmi-con {
>> +               compatible = "hdmi-connector";
>> +               type = "a";
>> +
>> +               port {
>> +                       hdmi_con_in: endpoint {
>> +                               remote-endpoint = <&hdmi_out_con>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       leds: leds {
>> +               compatible = "gpio-leds";
>> +
>> +               work_led: led-0 {
>> +                       gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
>> +                       linux,default-trigger = "heartbeat";
>> +               };
>> +       };
>> +
>> +       sdio_pwrseq: sdio-pwrseq {
>> +               compatible = "mmc-pwrseq-simple";
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&wifi_pwren>;
>> +
>> +               /*
>> +                * On the module itself this is one of these (depending
>> +                * on the actual card populated):
>> +                * - SDIO_RESET_L_WL_REG_ON
>> +                * - PDN (power down when low)
>> +                */
>> +               post-power-on-delay-ms = <200>;
>> +               reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
>> +       };
>> +
>> +       vbus5v0_typec: regulator-vbus5v0-typec {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vbus5v0_typec";
>> +               regulator-min-microvolt = <5000000>;
>> +               regulator-max-microvolt = <5000000>;
>> +               enable-active-high;
>> +               gpio = <&gpio0 RK_PD1 GPIO_ACTIVE_HIGH>;
>> +               vin-supply = <&vcc5v0_device>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&usb_otg0_pwren>;
>> +       };
>> +
>> +       vcc12v_dcin: regulator-vcc12v-dcin {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc12v_dcin";
>> +               regulator-always-on;
>> +               regulator-boot-on;
>> +               regulator-min-microvolt = <12000000>;
>> +               regulator-max-microvolt = <12000000>;
>> +       };
>> +
>> +       vcc1v2_ufs_vccq_s0: regulator-vcc1v2-ufs-vccq-s0 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc1v2_ufs_vccq_s0";
>> +               regulator-boot-on;
>> +               regulator-always-on;
>> +               regulator-min-microvolt = <1200000>;
>> +               regulator-max-microvolt = <1200000>;
>> +               vin-supply = <&vcc_sys>;
>> +       };
>> +
>> +       vcc1v8_ufs_vccq2_s0: regulator-vcc1v8-ufs-vccq2-s0 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc1v8_ufs_vccq2_s0";
>> +               regulator-boot-on;
>> +               regulator-always-on;
>> +               regulator-min-microvolt = <1800000>;
>> +               regulator-max-microvolt = <1800000>;
>> +               vin-supply = <&vcc_1v8_s3>;
>> +       };
>> +
>> +       vcc3v3_lcd_n: regulator-vcc3v3-lcd0-n {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc3v3_lcd0_n";
>> +               regulator-boot-on;
>> +               enable-active-high;
>> +               gpio = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
>> +               vin-supply = <&vcc_3v3_s0>;
>> +       };
>> +
>> +       vcc3v3_pcie1: regulator-vcc3v3-pcie1 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc3v3_pcie1";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               enable-active-high;
>> +               gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
>> +               startup-delay-us = <5000>;
>> +               vin-supply = <&vcc12v_dcin>;
>> +       };
>> +
>> +       vcc3v3_rtc_s5: regulator-vcc3v3-rtc-s5 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc3v3_rtc_s5";
>> +               regulator-boot-on;
>> +               regulator-always-on;
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               vin-supply = <&vcc_sys>;
>> +       };
>> +
>> +       vcc5v0_device: regulator-vcc5v0-device {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc5v0_device";
>> +               regulator-always-on;
>> +               regulator-boot-on;
>> +               regulator-min-microvolt = <5000000>;
>> +               regulator-max-microvolt = <5000000>;
>> +               vin-supply = <&vcc12v_dcin>;
>> +       };
>> +
>> +       vcc5v0_host: regulator-vcc5v0-host {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc5v0_host";
>> +               regulator-boot-on;
>> +               regulator-always-on;
>> +               regulator-min-microvolt = <5000000>;
>> +               regulator-max-microvolt = <5000000>;
>> +               enable-active-high;
>> +               gpio = <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
>> +               vin-supply = <&vcc5v0_device>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&usb_host_pwren>;
>> +       };
>> +
>> +       vcc_sys: regulator-vcc5v0-sys {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc_sys";
>> +               regulator-always-on;
>> +               regulator-boot-on;
>> +               regulator-min-microvolt = <5000000>;
>> +               regulator-max-microvolt = <5000000>;
>> +               vin-supply = <&vcc12v_dcin>;
>> +       };
>> +
>> +       vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
>> +               regulator-always-on;
> 
> The name says "S3", so isn't it supposed to be able to go off in S5?
> Then perhaps only "regulator-boot-on" is needed, but not
> "regulator-always-on"?
>

No, it will not go off in S5. Additionally, we cannot dynamically switch
it on or off, as this would affect the system's functioning. 
Therefore, the "regulator-always-on" is essential. 

The configuration of regulator is consistent with EVB1.

>> +               regulator-min-microvolt = <1100000>;
>> +               regulator-max-microvolt = <1100000>;
>> +               vin-supply = <&vcc_sys>;
>> +       };
>> +
>> +       vcc_1v8_s0: regulator-vcc-1v8-s0 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc_1v8_s0";
>> +               regulator-boot-on;
>> +               regulator-always-on;
> 
> Ditto
>
>> +               regulator-min-microvolt = <1800000>;
>> +               regulator-max-microvolt = <1800000>;
>> +               vin-supply = <&vcc_1v8_s3>;
>> +       };
>> +
>> +       vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc_2v0_pldo_s3";
>> +               regulator-boot-on;
>> +               regulator-always-on;
> 
> Ditto
> 
>> +               regulator-min-microvolt = <2000000>;
>> +               regulator-max-microvolt = <2000000>;
>> +               vin-supply = <&vcc_sys>;
>> +       };
>> +
>> +       vcc_3v3_s0: regulator-vcc-3v3-s0 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc_3v3_s0";
>> +               regulator-boot-on;
>> +               regulator-always-on;
> 
> Ditto
> 
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               vin-supply = <&vcc_3v3_s3>;
>> +       };
>> +
>> +       vcc_ufs_s0: regulator-vcc-ufs-s0 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc_ufs_s0";
>> +               regulator-boot-on;
>> +               regulator-always-on;
> 
> Ditto
> 
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               vin-supply = <&vcc_sys>;
>> +       };
>> +};
>> +
>> +&cpu_l0 {
>> +       cpu-supply = <&vdd_cpu_lit_s0>;
>> +};
>> +
>> +&cpu_b0 {
>> +       cpu-supply = <&vdd_cpu_big_s0>;
>> +};
> 
> Shall we list all of &cpu_l{0,1,2,3} and &cpu_b{0,1,2,3} here for completeness?
>

It make sense. I will add them in v2.

>> +&combphy0_ps {
>> +       status = "okay";
>> +};
>> +
>> +&combphy1_psu {
>> +       status = "okay";
>> +};
>> +
>> +&gmac0 {
>> +       clock_in_out = "output";
>> +       phy-mode = "rgmii-rxid";
>> +       phy-handle = <&rgmii_phy0>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&eth0m1_miim
>> +                    &eth0m1_tx_bus2
>> +                    &eth0m1_rx_bus2
>> +                    &eth0m1_rgmii_clk
>> +                    &eth0m1_rgmii_bus>;
>> +       tx_delay = <0x1d>;
>> +       status = "okay";
>> +};
>> +
>> +&gmac1 {
>> +       clock_in_out = "output";
>> +       phy-handle = <&rgmii_phy1>;
>> +       phy-mode = "rgmii-rxid";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&eth1m0_miim
>> +                    &eth1m0_tx_bus2
>> +                    &eth1m0_rx_bus2
>> +                    &eth1m0_rgmii_clk
>> +                    &eth1m0_rgmii_bus>;
>> +       tx_delay = <0x1e>;
>> +       status = "okay";
>> +};
>> +
>> +&gpu {
>> +       mali-supply = <&vdd_gpu_s0>;
>> +       status = "okay";
>> +};
>> +
>> +&hdmi {
>> +       status = "okay";
>> +};
>> +
>> +&hdmi_in {
>> +       hdmi_in_vp0: endpoint {
>> +               remote-endpoint = <&vp0_out_hdmi>;
>> +       };
>> +};
>> +
>> +&hdmi_out {
>> +       hdmi_out_con: endpoint {
>> +               remote-endpoint = <&hdmi_con_in>;
>> +       };
>> +};
> 
> Would you like to enable &hdmi_sound and &sai6 here, or is there a
> reason not to?

Hmm, I will add them in v2.

> 
>> +&hdptxphy {
>> +       status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +       status = "okay";
>> +
>> +       rk806: pmic@23 {
>> +               compatible = "rockchip,rk806";
>> +               reg = <0x23>;
>> +               interrupt-parent = <&gpio0>;
>> +               interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
>> +                           <&rk806_dvs2_null>, <&rk806_dvs3_null>;
>> +               system-power-controller;
>> +
>> +               vcc1-supply = <&vcc_sys>;
>> +               vcc2-supply = <&vcc_sys>;
>> +               vcc3-supply = <&vcc_sys>;
>> +               vcc4-supply = <&vcc_sys>;
>> +               vcc5-supply = <&vcc_sys>;
>> +               vcc6-supply = <&vcc_sys>;
>> +               vcc7-supply = <&vcc_sys>;
>> +               vcc8-supply = <&vcc_sys>;
>> +               vcc9-supply = <&vcc_sys>;
>> +               vcc10-supply = <&vcc_sys>;
>> +               vcc11-supply = <&vcc_2v0_pldo_s3>;
>> +               vcc12-supply = <&vcc_sys>;
>> +               vcc13-supply = <&vcc_1v1_nldo_s3>;
>> +               vcc14-supply = <&vcc_1v1_nldo_s3>;
>> +               vcca-supply = <&vcc_sys>;
>> +
>> +               rk806_dvs1_null: dvs1-null-pins {
>> +                       pins = "gpio_pwrctrl1";
>> +                       function = "pin_fun0";
>> +               };
>> +
>> +               rk806_dvs2_null: dvs2-null-pins {
>> +                       pins = "gpio_pwrctrl2";
>> +                       function = "pin_fun0";
>> +               };
>> +
>> +               rk806_dvs3_null: dvs3-null-pins {
>> +                       pins = "gpio_pwrctrl3";
>> +                       function = "pin_fun0";
>> +               };
>> +
>> +               rk806_dvs1_slp: dvs1-slp-pins {
>> +                       pins = "gpio_pwrctrl1";
>> +                       function = "pin_fun1";
>> +               };
>> +
>> +               rk806_dvs1_pwrdn: dvs1-pwrdn-pins {
>> +                       pins = "gpio_pwrctrl1";
>> +                       function = "pin_fun2";
>> +               };
>> +
>> +               rk806_dvs1_rst: dvs1-rst-pins {
>> +                       pins = "gpio_pwrctrl1";
>> +                       function = "pin_fun3";
>> +               };
>> +
>> +               rk806_dvs2_slp: dvs2-slp-pins {
>> +                       pins = "gpio_pwrctrl2";
>> +                       function = "pin_fun1";
>> +               };
>> +
>> +               rk806_dvs2_pwrdn: dvs2-pwrdn-pins {
>> +                       pins = "gpio_pwrctrl2";
>> +                       function = "pin_fun2";
>> +               };
>> +
>> +               rk806_dvs2_rst: dvs2-rst-pins {
>> +                       pins = "gpio_pwrctrl2";
>> +                       function = "pin_fun3";
>> +               };
>> +
>> +               rk806_dvs2_dvs: dvs2-dvs-pins {
>> +                       pins = "gpio_pwrctrl2";
>> +                       function = "pin_fun4";
>> +               };
>> +
>> +               rk806_dvs2_gpio: dvs2-gpio-pins {
>> +                       pins = "gpio_pwrctrl2";
>> +                       function = "pin_fun5";
>> +               };
>> +
>> +               rk806_dvs3_slp: dvs3-slp-pins {
>> +                       pins = "gpio_pwrctrl3";
>> +                       function = "pin_fun1";
>> +                       function = "pin_fun3";
>> +               };
>> +
>> +               rk806_dvs2_dvs: dvs2-dvs-pins {
>> +                       pins = "gpio_pwrctrl2";
>> +                       function = "pin_fun4";
>> +               };
>> +
>> +               rk806_dvs2_gpio: dvs2-gpio-pins {
>> +                       pins = "gpio_pwrctrl2";
>> +                       function = "pin_fun5";
>> +               };
>> +
>> +               rk806_dvs3_slp: dvs3-slp-pins {
>> +                       pins = "gpio_pwrctrl3";
>> +                       function = "pin_fun1";
>> +               };
>> +
>> +               rk806_dvs3_pwrdn: dvs3-pwrdn-pins {
>> +                       pins = "gpio_pwrctrl3";
>> +                       function = "pin_fun2";
>> +               };
>> +
>> +               rk806_dvs3_rst: dvs3-rst-pins {
>> +                       pins = "gpio_pwrctrl3";
>> +                       function = "pin_fun3";
>> +               };
>> +
>> +               rk806_dvs3_dvs: dvs3-dvs-pins {
>> +                       pins = "gpio_pwrctrl3";
>> +                       function = "pin_fun4";
>> +               };
>> +
>> +               rk806_dvs3_gpio: dvs3-gpio-pins {
>> +                       pins = "gpio_pwrctrl3";
>> +                       function = "pin_fun5";
>> +               };
>> +
>> +               regulators {
>> +                       vdd_cpu_big_s0: dcdc-reg1 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <550000>;
>> +                               regulator-max-microvolt = <950000>;
>> +                               regulator-ramp-delay = <12500>;
>> +                               regulator-name = "vdd_cpu_big_s0";
>> +                               regulator-enable-ramp-delay = <400>;
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vdd_npu_s0: dcdc-reg2 {
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <550000>;
>> +                               regulator-max-microvolt = <950000>;
>> +                               regulator-ramp-delay = <12500>;
>> +                               regulator-name = "vdd_npu_s0";
>> +                               regulator-enable-ramp-delay = <400>;
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vdd_cpu_lit_s0: dcdc-reg3 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <550000>;
>> +                               regulator-max-microvolt = <950000>;
>> +                               regulator-ramp-delay = <12500>;
>> +                               regulator-name = "vdd_cpu_lit_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                                       regulator-suspend-microvolt = <750000>;
>> +                               };
>> +                       };
>> +
>> +                       vcc_3v3_s3: dcdc-reg4 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <3300000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                               regulator-name = "vcc_3v3_s3";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-on-in-suspend;
>> +                                       regulator-suspend-microvolt = <3300000>;
>> +                               };
>> +                       };
>> +
>> +                       vdd_gpu_s0: dcdc-reg5 {
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <550000>;
>> +                               regulator-max-microvolt = <900000>;
>> +                               regulator-ramp-delay = <12500>;
>> +                               regulator-name = "vdd_gpu_s0";
>> +                               regulator-enable-ramp-delay = <400>;
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                                       regulator-suspend-microvolt = <850000>;
>> +                               };
>> +                       };
>> +
>> +                       vddq_ddr_s0: dcdc-reg6 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-name = "vddq_ddr_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vdd_logic_s0: dcdc-reg7 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <550000>;
>> +                               regulator-max-microvolt = <800000>;
>> +                               regulator-name = "vdd_logic_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vcc_1v8_s3: dcdc-reg8 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                               regulator-name = "vcc_1v8_s3";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-on-in-suspend;
>> +                                       regulator-suspend-microvolt = <1800000>;
>> +                               };
>> +                       };
>> +
>> +                       vdd2_ddr_s3: dcdc-reg9 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-name = "vdd2_ddr_s3";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-on-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vdd_ddr_s0: dcdc-reg10 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <550000>;
>> +                               regulator-max-microvolt = <1200000>;
>> +                               regulator-name = "vdd_ddr_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vcca_1v8_s0: pldo-reg1 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                               regulator-name = "vcca_1v8_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vcca1v8_pldo2_s0: pldo-reg2 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                               regulator-name = "vcca1v8_pldo2_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vdda_1v2_s0: pldo-reg3 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1200000>;
>> +                               regulator-max-microvolt = <1200000>;
>> +                               regulator-name = "vdda_1v2_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vcca_3v3_s0: pldo-reg4 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <3300000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                               regulator-name = "vcca_3v3_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vccio_sd_s0: pldo-reg5 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                               regulator-name = "vccio_sd_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vcca1v8_pldo6_s3: pldo-reg6 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                               regulator-name = "vcca1v8_pldo6_s3";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-on-in-suspend;
>> +                                       regulator-suspend-microvolt = <1800000>;
>> +                       vdda_ddr_pll_s0: nldo-reg2 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <850000>;
>> +                               regulator-max-microvolt = <850000>;
>> +                               regulator-name = "vdda_ddr_pll_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vdda0v75_hdmi_s0: nldo-reg3 {
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <837500>;
>> +                               regulator-max-microvolt = <837500>;
>> +                               regulator-name = "vdda0v75_hdmi_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vdda_0v85_s0: nldo-reg4 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <850000>;
>> +                               regulator-max-microvolt = <850000>;
>> +                               regulator-name = "vdda_0v85_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +
>> +                       vdda_0v75_s0: nldo-reg5 {
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               regulator-min-microvolt = <750000>;
>> +                               regulator-max-microvolt = <750000>;
>> +                               regulator-name = "vdda_0v75_s0";
>> +
>> +                               regulator-state-mem {
>> +                                       regulator-off-in-suspend;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&i2c2 {
>> +       status = "okay";
>> +
>> +       hym8563: rtc@51 {
>> +               compatible = "haoyu,hym8563";
>> +               reg = <0x51>;
>> +               clock-output-names = "hym8563";
>> +               interrupt-parent = <&gpio0>;
>> +               interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&rtc_int>;
>> +               wakeup-source;
>> +               #clock-cells = <0>;
>> +       };
>> +};
>> +
>> +&mdio0 {
>> +       rgmii_phy0: ethernet-phy@1 {
>> +               compatible = "ethernet-phy-id4f51.e91b";
>> +               reg = <0x1>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&rgmii_phy0_rst>;
>> +               reset-assert-us = <20000>;
>> +               reset-deassert-us = <100000>;
>> +               reset-gpios = <&gpio3 RK_PD3 GPIO_ACTIVE_LOW>;
> 
> Do you need to assign a clock here, or does EVB2 use a different PHY
> clock arrangement vs. EVB1? See the patch [1] by Sebastian for EVB1
> 
> [1] https://lore.kernel.org/linux-rockchip/20250910-rk3576-evb-network-v1-1-68ed4df272a2@collabora.com/
>

Yes, EVB2 uses a different PHY. I have tested it and it can work fine
without assigning a clock, so I removed them.

>> +       };
>> +};
>> +
>> +&mdio1 {
>> +       rgmii_phy1: ethernet-phy@1 {
>> +               compatible = "ethernet-phy-id4f51.e91b";
>> +               reg = <0x1>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&rgmii_phy1_rst>;
>> +               reset-assert-us = <20000>;
>> +               reset-deassert-us = <100000>;
>> +               reset-gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_LOW>;
> 
> Ditto
> 
>> +       };
>> +};
>> +
>> +&pinctrl {
>> +       bluetooth {
>> +               bt_reg_on: bt-reg-on {
>> +                       rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
>> +               };
>> +
>> +               bt_wake_host: bt-wake-host {
>> +                       rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
>> +               };
>> +
>> +               host_wake_bt: host-wake-bt {
>> +                       rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
>> +               };
>> +       };
>> +
>> +       hym8563 {
>> +               rtc_int: rtc-int {
>> +                       rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
>> +               };
>> +       };
>> +
>> +       network {
>> +               rgmii_phy0_rst: rgmii-phy0-rst {
>> +                       rockchip,pins = <3 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
>> +               };
>> +
>> +               rgmii_phy1_rst: rgmii-phy1-rst {
>> +                       rockchip,pins = <3 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
>> +               };
>> +       };
>> +
>> +       pcie1 {
>> +               pcie1_rst: pcie1-rst {
>> +                       rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
>> +               };
>> +       };
>> +
>> +       sata {
>> +               satapm_pwren: satapm-pwren {
>> +                       rockchip,pins = <4 RK_PC7 RK_FUNC_GPIO &pcfg_output_high>;
> 
> Should this one become a regulator, instead of just statically
> configuring it for high output? This looks fragile: I can imagine a
> user toggling GPIOs at random in search for some pin they need, and
> suddenly powering down their SATA port, potentially with data loss.
> With a pin configured as a fixed voltage regulator the kernel would
> say that it's in use in such a scenario.
>

Thank you for your reminder. I will try to do this in v2.

>> +               };
>> +       };
>> +
>> +       usb {
>> +               usb_host_pwren: usb-host-pwren {
>> +                       rockchip,pins = <0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
>> +               };
>> +
>> +               usb_otg0_pwren: usb-otg0-pwren {
>> +                       rockchip,pins = <0 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
>> +               };
>> +
>> +               usbc0_int: usbc0-int {
>> +                       rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
> 
> You don't seem to be requesting this pin config from anywhere, do you?
> Does EVB2 use a HUSB311 chip lacking mainline Linux support, like EVB1
> does?
> 

Sorry, actually there is no Type-C interface on the EVB2. I copied
this part from the EVB1 and forgot to delete it.

>> +               };
>> +       };
>> +
>> +       wifi {
>> +               wifi_host_wake: wifi-host-wake {
>> +                       rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
>> +               };
>> +
>> +               wifi_pwren: wifi-pwren {
>> +                       rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
>> +               };
>> +       };
>> +};
>> +
>> +&sata0 {
>> +       pinctrl-0 = <&satapm_pwren>;
>> +       pinctrl-names = "default";
>> +       status = "okay";
>> +};
>> +
>> +&sdio {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       bus-width = <4>;
>> +       cap-sd-highspeed;
>> +       cap-sdio-irq;
>> +       disable-wp;
>> +       keep-power-in-suspend;
>> +       max-frequency = <150000000>;
>> +       mmc-pwrseq = <&sdio_pwrseq>;
>> +       no-sd;
>> +       no-mmc;
>> +       non-removable;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&sdmmc1m0_bus4 &sdmmc1m0_clk &sdmmc1m0_cmd>;
>> +       sd-uhs-sdr104;
>> +       status = "okay";
>> +
>> +       brcmf: wifi@1 {
>> +               compatible = "brcm,bcm4329-fmac";
>> +               reg = <1>;
>> +               interrupt-parent = <&gpio0>;
>> +               interrupts = <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
>> +               interrupt-names = "host-wake";
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&wifi_host_wake>;
>> +       };
>> +};
>> +
>> +&sdhci {
>> +       bus-width = <8>;
>> +       full-pwr-cycle-in-suspend;
>> +       max-frequency = <200000000>;
>> +       mmc-hs400-1_8v;
>> +       mmc-hs400-enhanced-strobe;
>> +       no-sdio;
>> +       no-sd;
>> +       non-removable;
>> +       status = "okay";
>> +};
>> +
>> +&sdmmc {
>> +       bus-width = <4>;
>> +       cap-mmc-highspeed;
> 
> This seems to contradict the "no-mmc" just below, remove perhaps?
>

Yes, I will remove this in v2.

>> +       cap-sd-highspeed;
>> +       disable-wp;
>> +       max-frequency = <200000000>;
>> +       no-sdio;
> 
> Can't this SD slot support an external SDIO card?
>

No support for it.

>> +       no-mmc;
>> +       sd-uhs-sdr104;
>> +       vqmmc-supply = <&vccio_sd_s0>;
>> +       status = "okay";
>> +};
>> +
>> +&saradc {
>> +       vref-supply = <&vcca_1v8_s0>;
>> +       status = "okay";
>> +};
>> +
>> +&u2phy0 {
>> +       status = "okay";
>> +};
>> +
>> +&u2phy0_otg {
>> +       phy-supply = <&vbus5v0_typec>;
>> +       status = "okay";
>> +};
>> +
>> +&u2phy1 {
>> +       status = "okay";
>> +};
>> +
>> +&u2phy1_otg {
>> +       phy-supply = <&vcc5v0_host>;
>> +       status = "okay";
>> +};
>> +
>> +&uart0 {
>> +       status = "okay";
>> +};
>> +
>> +&uart4 {
>> +       pinctrl-0 = <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
>> +       pinctrl-names = "default";
>> +       uart-has-rtscts;
>> +       status = "okay";
>> +
>> +       bluetooth {
>> +               compatible = "brcm,bcm43438-bt";
>> +               clocks = <&hym8563>;
>> +               clock-names = "lpo";
>> +               device-wakeup-gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
>> +               interrupt-parent = <&gpio0>;
>> +               interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
>> +               pinctrl-0 = <&bt_reg_on &bt_wake_host &host_wake_bt>;
>> +               pinctrl-names = "default";
>> +               shutdown-gpios = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
>> +               vbat-supply = <&vcc_3v3_s3>;
>> +               vddio-supply = <&vcc_1v8_s3>;
>> +       };
>> +};
>> +
>> +&ufshc {
> 
> Given that you have the required regulators defined already, it sounds
> like a good idea to reference them here. Something like this perhaps?
> 
> + vcc-supply = <&vcc_ufs_s0>;
> + vccq-supply = <&vcc1v2_ufs_vccq_s0>;
> + vccq2-supply = <&vcc1v8_ufs_vccq2_s0>;
>

Thanks for point out this. I will fix this in v2.

>> +       status = "okay";
>> +};
>> +
>> +&usbdp_phy {
>> +       rockchip,dp-lane-mux = <2 3>;
> 
> Do you need static lane muxing here, or is it connected to a Type-C DP
> AltMode port? You don't seem to be defining a regular DP connector
> anywhere (although I realise that there isn't mainline DP support on
> RK3576 yet, anyway), but you do mention a Type-C IRQ line in pin
> configs.
> 

These config should be added when connected to full size DP
connector. Conversely, the Type-C DP does not require these 
descriptions. Sorry for the confusion, but there is indeed no
Type-C interface on the EVB2.

And yes, I believe this is a beginning for us to upstream the RK3576 DP
in mainline :)

>> +       status = "okay";
>> +};
>> +
>> +&usb_drd0_dwc3 {
>> +       dr_mode = "host";
> 
> No OTG capability here? Is it connected somewhere else than USB2.0
> OTG0, where you link up an OTG regulator?
>

Oh, this part was missed. I will add them in v2.

>> +       status = "okay";
>> +};
>> +
>> +&usb_drd1_dwc3 {
>> +       dr_mode = "host";
>> +       status = "okay";
>> +};
>> +
>> +&vop {
>> +       status = "okay";
>> +};
>> +
>> +&vop_mmu {
>> +       status = "okay";
>> +};
>> +
>> +&vp0 {
>> +       vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>> +               reg = <ROCKCHIP_VOP2_EP_HDMI0>;
>> +               remote-endpoint = <&hdmi_in_vp0>;
>> +       };
>> +};
>> --
>> 2.51.1
> 
> Best regards,
> Alexey
> 
> 

-- 
Best, 
Chaoyi

