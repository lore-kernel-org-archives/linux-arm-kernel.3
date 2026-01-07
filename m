Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270B7CF6C1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJ29vmPQ/ukN7U65dl2KKv0O9PB5zVwuQMGVoX2Yrsg=; b=mwGVZ6xCjazGweVhVM7YJvgR9a
	2nW5eSVKLiMGrCMsIcWERuTcjBWdoTKDoXXCBjXNYFv2vy3MRBlWvy6TCiQ3erMm8t4FqIzPzq5RU
	e8CWTyFNXMV5PQA12tHkqMM53s0o4hwWoBnldwSiE0DqES0Y2a2Q4H7LAKhD9XcIdGHnZLy4LgYvY
	JyiVlcJLmVgRK7GNCAoxgx27aD0MnOouIwAcOcsxfkxXe9hAnz0NkBBnJByhq/MCUBEu45oyZ7R6R
	/m/H7LE1T4+lECTE4yRfHEZepN/0Ily0MpmyVsm6/9U320olWBu9K95TAl8JAz8qKAcNTs7UdybTE
	A6Aq4C2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQBm-0000000Eb5T-37WU;
	Wed, 07 Jan 2026 09:50:50 +0000
Received: from mail-m49248.qiye.163.com ([45.254.49.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQBj-0000000Eb3U-3KzS;
	Wed, 07 Jan 2026 09:50:49 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fcf59e8a;
	Wed, 7 Jan 2026 17:50:39 +0800 (GMT+08:00)
Message-ID: <37faeb47-37ef-4dda-80e4-8eb88b4dbf21@rock-chips.com>
Date: Wed, 7 Jan 2026 17:50:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
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
References: <20260107070322.323-1-kernel@airkyi.com>
 <20260107070322.323-3-kernel@airkyi.com>
 <CABjd4Yw1Dqsa9EsMRFT8LOvyU8QN1C8VP+j0tY6h1uJhhXRSSw@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CABjd4Yw1Dqsa9EsMRFT8LOvyU8QN1C8VP+j0tY6h1uJhhXRSSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b97dd915703abkunm7f43c40ddca48f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhhJTVZISR8YT0pPQ0lPGUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=coBE8/g0RMK+gqbJ8rXNfM09N7CXjdkvVqA5CUHBP0KvVmvqdIgZQFJf8r2J0tujQ/Gi3BznCwfz4fOeSu3jEObMIe5ahDGEyzkFMmkYBXH4AdjP/DzkBZN/zPKFL/VQYoDtlmzXTGv8rvDoWiGhX6ytlYaU4k0zFPBRXAHNihg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=gJ29vmPQ/ukN7U65dl2KKv0O9PB5zVwuQMGVoX2Yrsg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015048_058338_A477A985 
X-CRM114-Status: GOOD (  23.16  )
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

On 1/7/2026 3:56 PM, Alexey Charkov wrote:
> Hi Chaoyi,
> 
> On Wed, Jan 7, 2026 at 11:04 AM Chaoyi Chen <kernel@airkyi.com> wrote:
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
>>     - ...
>>
>> Tested with eMMC/SDMMC/HDMI/USB/Ethernet/WIFI/BT module.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v2:
>> - Enable hdmi_sound and sai6.
>> - Add more cpu-supply.
>> - Use regulator to control sata power.
>> - Remove "cap-mmc-highspeed" prop in sdmmc.
>> - Add regulator supply for ufshc.
>> - Add the missing vcc3v3_hubreset regulator.
>> - Add otg capability for usb_drd0_dwc3.
>>
>>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>  .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 997 ++++++++++++++++++
>>  2 files changed, 998 insertions(+)
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
>> index 000000000000..52788c514ec0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
>> @@ -0,0 +1,997 @@
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
> 
> This might better be renamed, given that last time you mentioned this
> board doesn't have a Type-C connector. Perhaps regulator-vbus5v0-otg?
> 

Sorry, I missed this part. I will fix it in v3.

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
>> +       vcc3v3_hubreset: vcc3v3-hubreset {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc3v3_hubreset";
>> +               regulator-boot-on;
>> +               regulator-always-on;
> 
> If this regulator supplies a soldered-on discrete hub and is required
> to power it up, won't it be better to describe the hub in the device
> tree (see binding at [1]), make the regulator its supply, and perhaps
> drop the "regulator-boot-on/regulator-always-on" annotation here,
> letting the regulator core deal with its enabling instead?
> 
> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/usb-device.yaml

Yes. I will try to do this in v3. Thank you!

> 
> [snip]
> 
> Other than these, LGTM - thanks for addressing my comments from v1!
> Feel free to include my:
> 
> Reviewed-by: Alexey Charkov <alchark@gmail.com>
> 
> Best regards,
> Alexey
> 
> 

-- 
Best, 
Chaoyi

