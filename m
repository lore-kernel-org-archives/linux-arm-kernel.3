Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 00:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiN/LZFCsKgQyxRz2BR31upiLpgtwwU44jehvptF9Ps=; b=qpok0++wdpyONrPIwPzZMowv0v
	9JuhS7Hzoe/XGbERfQwd9QDrfizbBhSG4gKoHK1leli+iZFf0LqHQgpHvdFbyOHKyg6IvpQh0/LU8
	46oPC+4oSRREC2rpmkj22IzAd90o2Rbp0BXUVlPFiVYsCuoJz0JIStuDXMe37Iij3/jwNaL1yRGgH
	JZZDq4gX45p/3lo/8Sl89HRZJBH4b3B3jTRKllKI9y+fI1z2YGn+IcFqUse07EaDuqPDWhYCpYzVS
	fUDq0uiozyLLT0ByJ9zFp/O2CYruEI3kA22VO5qXMz09L7z9I8WVDj4h0NeRKzYu/jYnaV2GyI6+w
	vK5YpEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAoA-0000000DJvD-1SkT;
	Wed, 11 Dec 2024 00:42:30 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAmp-0000000DJfy-3sHf;
	Wed, 11 Dec 2024 00:41:10 +0000
X-QQ-mid: bizesmtpip4t1733877616ty8czwh
X-QQ-Originating-IP: YCAB/W5lc5XhIctXFs+ypJMkuS4H4EsdXpj2oghLazI=
Received: from [IPV6:240f:10b:7440:1:9e54:d32d ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Dec 2024 08:40:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 306073378999332624
Message-ID: <3D830E407DCD15A2+de00ea1d-96d5-4766-9dc5-616fc76f404b@radxa.com>
Date: Wed, 11 Dec 2024 09:40:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: rockchip: Add USB-C support to ROCK 5B
From: FUKAUMI Naoki <naoki@radxa.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20241210163615.120594-1-sebastian.reichel@collabora.com>
 <FFD6E87BED20DB1B+38b8064e-9945-4cd8-a30e-7800a8c6f37b@radxa.com>
Content-Language: en-US
In-Reply-To: <FFD6E87BED20DB1B+38b8064e-9945-4cd8-a30e-7800a8c6f37b@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OHcJgPpQFonKT4cjqi5uhJ+oDJt3cHW4mhpP6EN4oVPCgHnu+xKGTDnM
	CfTFPpH+bPn7Rvg8+hOLIN0KohfWYGJJ8zsPxZUvHwmh7A9kGYLUcZ4+j66wBLSE6HPDH2r
	uQTmLRe6qmygW+c1djF1K8CxJW9KdEj1xPTa0qqM6FnSnNXT+bx3AHcqyAS0J8xh/4Qexhy
	y2fyF7UXL+VkQogBlNf6VFCb1TUJa06zEHK8sCcI7FSxdO5ofj3NHlB4PN9mgPe68Hb0Yif
	0yznI7SJCN1rtw7l0hUkptVfY0uggWYZeDMXvkHCuj5Vk5J6jfZ9vrKl+FM2qRg6K/ZdKPX
	5+pIoNq9e8xhIPOBYx00wDpd5wyJ1IyarvT2ddsftwcljhQC8IlUGuSugsvRC4WBLHOs3Gc
	C9wZp7TBaAchbjxkGnSKGnC8//AudJysAXPISYZOAqhTgnLW8h61Otytm1vqLcKvz7bNWi1
	D40TJNTWAqZQB4d6RC8ICUHk9BHJ1Q7mp2ztpqoxriud9t2Vg6YK+kZ26VuPAEO40CxcKar
	SgD6myOPIFmYp9hMjyaVue+jPmK9ojZb4KAJqg1e/g3/EL5MfDZuyuqHLvBIwgXSdoQF13A
	hbN3eVxLw5z8HXkeYZ+ZPhr0QD+a05ZgDWlYdOFG8WP0yWbNmmN/IGQkRZNvsmhICKovK0f
	X3TE9CZkRfHKbAVo1DhglrzmQVhP+WNG7pOneMBxZ6441F/kg3gAGUOc1whIzOOIndk6rfw
	+Ga+yQXFY8CeaIxKzX8ARkCLopJQG8s467x5P0ZSsQ9scrZNJP1x7RGqlJc12IdKTT7AX8O
	zrv9BvQnaYRh/ZrcCThXqrGJ84vzPP6QxQgCjXt32KfLDdGF2reZTUImABA+b9wexIXlWnO
	M3xShQ5PDfXXA4eh4Hs5T+S+bW7YglMNP6pDcq4dXWHzxBRxukG74KDNHLJAnNh4jFBf9ck
	zOfiK6OsrKGgr0iJrk8UWZKCAkLbjktttvY0=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_164108_925126_38691EEF 
X-CRM114-Status: GOOD (  21.17  )
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

Sorry for many emails...

I got random reboot during booting kernel/userland...

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 12/11/24 09:06, FUKAUMI Naoki wrote:
> Sorry, I forgot to write one thing...
> 
> On 12/11/24 01:36, Sebastian Reichel wrote:
>> Add hardware description for the USB-C port in the Radxa Rock 5 Model B.
>> This describes the OHCI, EHCI and XHCI USB parts, but not yet the
>> DisplayPort AltMode (bindings are not yet upstream).
>>
>> The fusb302 node is marked with status "fail", since the board is usually
>> powered through the USB-C port. Handling of errors can result in hard
>> resets, which removed the bus power for some time resulting in a board
>> reset.
>>
>> The main problem is that devices are supposed to interact with the
>> power-supply within 5 seconds after the plug event according to the
>> USB PD specification. This is more or less impossible to achieve when
>> the kernel is the first software communicating with the power-supply.
>>
>> Recent U-Boot (v2025.01) will start doing USB-PD communication, which
>> solves this issue. Upstream U-Boot doing USB-PD communication will also
>> set the fusb302 node status to "okay". That way booting a kernel with
>> the updated DT on an old U-Boot avoids a reset loop.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> 
> -- 
> FUKAUMI Naoki
> Radxa Computer (Shenzhen) Co., Ltd.
> 
>> ---
>>   .../boot/dts/rockchip/rk3588-rock-5b.dts      | 121 ++++++++++++++++++
>>   1 file changed, 121 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/ 
>> arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>> index d597112f1d5b..cb5990df6ccb 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>> @@ -5,6 +5,7 @@
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/leds/common.h>
>>   #include <dt-bindings/soc/rockchip,vop2.h>
>> +#include <dt-bindings/usb/pd.h>
>>   #include "rk3588.dtsi"
>>   / {
>> @@ -84,6 +85,15 @@ rfkill-bt {
>>           shutdown-gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
>>       };
>> +    vcc12v_dcin: regulator-vcc12v-dcin {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "vcc12v_dcin";
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        regulator-min-microvolt = <12000000>;
>> +        regulator-max-microvolt = <12000000>;
>> +    };
>> +
>>       vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
>>           compatible = "regulator-fixed";
>>           enable-active-high;
>> @@ -142,6 +152,7 @@ vcc5v0_sys: regulator-vcc5v0-sys {
>>           regulator-boot-on;
>>           regulator-min-microvolt = <5000000>;
>>           regulator-max-microvolt = <5000000>;
>> +        vin-supply = <&vcc12v_dcin>;
>>       };
>>       vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
>> @@ -264,6 +275,67 @@ regulator-state-mem {
>>       };
>>   };
>> +&i2c4 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c4m1_xfer>;
>> +    status = "okay";
>> +
>> +    usbc0: usb-typec@22 {
>> +        compatible = "fcs,fusb302";
>> +        reg = <0x22>;
>> +        interrupt-parent = <&gpio3>;
>> +        interrupts = <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&usbc0_int>;
>> +        vbus-supply = <&vcc12v_dcin>;
>> +        /*
>> +         * When the board is starting to send power-delivery messages
>> +         * too late (5 seconds according to the specification), the
>> +         * power-supply reacts with a hard-reset. That removes the
>> +         * power from VBUS for some time, which resets te whole board.
>> +         */
>> +        status = "fail";
>> +
>> +        usb_con: connector {
>> +            compatible = "usb-c-connector";
>> +            label = "USB-C";
>> +            data-role = "dual";
>> +            power-role = "sink";
>> +            try-power-role = "sink";
>> +            op-sink-microwatt = <1000000>;
>> +            sink-pdos =
>> +                <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>,
>> +                <PDO_VAR(5000, 20000, 5000)>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    usbc0_role_sw: endpoint {
>> +                        remote-endpoint = <&dwc3_0_role_switch>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    usbc0_orien_sw: endpoint {
>> +                        remote-endpoint = 
>> <&usbdp_phy0_orientation_switch>;
>> +                    };
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +                    dp_altmode_mux: endpoint {
>> +                        remote-endpoint = <&usbdp_phy0_dp_altmode_mux>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +};
>> +
>>   &i2c6 {
>>       status = "okay";
>> @@ -423,6 +495,10 @@ usb {
>>           vcc5v0_host_en: vcc5v0-host-en {
>>               rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>>           };
>> +
>> +        usbc0_int: usbc0-int {
>> +            rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
>> +        };
>>       };
>>   };
>> @@ -835,6 +911,14 @@ &uart2 {
>>       status = "okay";
>>   };
>> +&u2phy0 {
>> +    status = "okay";
>> +};
>> +
>> +&u2phy0_otg {
>> +    status = "okay";
>> +};
>> +
>>   &u2phy1 {
>>       status = "okay";
>>   };
>> @@ -866,6 +950,29 @@ &usbdp_phy1 {
>>       status = "okay";
>>   };
>> +&usbdp_phy0 {
>> +    mode-switch;
>> +    orientation-switch;
>> +    sbu1-dc-gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
>> +    sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
>> +    status = "okay";
>> +
>> +    port {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        usbdp_phy0_orientation_switch: endpoint@0 {
>> +            reg = <0>;
>> +            remote-endpoint = <&usbc0_orien_sw>;
>> +        };
>> +
>> +        usbdp_phy0_dp_altmode_mux: endpoint@1 {
>> +            reg = <1>;
>> +            remote-endpoint = <&dp_altmode_mux>;
>> +        };
>> +    };
>> +};
>> +
>>   &usb_host0_ehci {
>>       status = "okay";
>>   };
>> @@ -874,6 +981,20 @@ &usb_host0_ohci {
>>       status = "okay";
>>   };
>> +&usb_host0_xhci {
>> +    usb-role-switch;
>> +    status = "okay";
>> +
>> +    port {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        dwc3_0_role_switch: endpoint {
>> +            remote-endpoint = <&usbc0_role_sw>;
>> +        };
>> +    };
>> +};
>> +
>>   &usb_host1_ehci {
>>       status = "okay";
>>   };
> 


