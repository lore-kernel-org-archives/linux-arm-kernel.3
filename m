Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488EAD597B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 22:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuUhsWmnwS3Wq04jwBtV8xlb7rkCU2Qg5LzNdH/FNA4=; b=PmK/V+xbHvHw+F7V6DnwDH18Hb
	4/n/ggqLELXnhyxz4v8j1Rv7ZyDEpLy5V8al0DSNcG2et+R8fWiooRyBXs1TMiW4YKrWyJ2uEKrU4
	Hb4s17ZwdbOzF1aHJmVIP3JnCNAdkOYB2gTcd+Xj2We5BZDOkZa4qQjCCqmbRiallPU9vCjb0Ha/r
	4SD6SUZNX3FUERo4KKfkT0Z7y8xMfH55PcHtpHxqWa5oZgsmZMR0A7PsZFXVXC6GG1wHkGDWxJ8Dn
	2FfKn6Tk4MVKt6vh9kvZaYX0b3f0xVr82dGHR/sHcphA7NnRc7qONtFQLNbbcQT84fKtsVPPou+CD
	4iMe8qzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzJ0-000000058Y2-0wia;
	Tue, 12 Nov 2024 22:24:14 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzHC-000000058Mp-1NjS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 22:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1731450113;
 bh=AuUhsWmnwS3Wq04jwBtV8xlb7rkCU2Qg5LzNdH/FNA4=;
 b=V31rFO1Cs7EX8K1z/q0Z0B+MvegdFxr9jea0Z53oW3CjvNvvaf0N84dNRTFF/ecESeUL4ecU2
 TgUtD12239FwfIO3uJWdKyAwZM3Qzt8x/ix7XlAkK2OPQ/9kOTJvnFRFtEmszlYhV7BBeKW59Du
 tmOIcssHgcwBtTTX7im0mnMmCUO760w0q6/W5YlZhH8si3SyvDURRhIm8WYigKUbYSc3fT/P0aI
 dw0SphJ9zNJ516rAPeYLWy+HBa12R2bdQMdAqyml/7IiiyF/E2HW77KbRS5KGvfo9cRg8Ktc0Oc
 kbB+GXkCv1Pq/zdci3ssnHeVZEWTIhMfOHiohVX9+ECg==
Message-ID: <79f13cef-1630-491f-8525-b2b44c0d42fb@kwiboo.se>
Date: Tue, 12 Nov 2024 23:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
To: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>,
 Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 FUKAUMI Naoki <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-4-tszucs@linux.com>
 <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se>
 <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
 <9330ebb370780c001fd2aaee49aec9e8@manjaro.org>
 <CA+GksrJjDPve29Vh7ZFhM+JFp058xmXZAPeuLuFth7v=JeiH2w@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CA+GksrJjDPve29Vh7ZFhM+JFp058xmXZAPeuLuFth7v=JeiH2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6733d4fe9402f7538d196cc3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_142222_736865_BA22AFDB 
X-CRM114-Status: GOOD (  25.44  )
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

Hi Tamás,

On 2024-11-12 22:04, Tamás Szűcs wrote:
> Hi Dragan,
> 
> On Tue, Nov 12, 2024 at 4:07 PM Dragan Simic <dsimic@manjaro.org> wrote:
>> Please correct me if I'm wrong, but isn't this UART supposed to be
>> used for the Bluetooth part of an SDIO WiFi + Bluetooth module, in
>> form of a non-standard M.2 module that Radxa sells?
> 
> UART8 is supposed to be used for any radio module connected to the M2E
> connector.
> It will typically be responsible for Bluetooth or BLE but it could be
> 802.15.4 or whatever. In any case, all wanting to use it will need the
> uart8 node enabled.

Do you have any specific sdio+uart module you are testing these changes
with? The pinout for sdio+uart on Radxa's M.2 Key E slot is their own,
pinout for pcie and usb should be closer to a common standard.

https://dl.radxa.com/accessories/wireless-module/ROCKPi_M2_Wireless_Module_Pinout_v10.xlsx

> 
>>
>> With that in mind, I see very little sense in just enabling the UART,
>> without defining the entire Bluetooth interface, which AFAIK produces
> 
> Defining a bluetooth node would hardwire idiosyncrasies of a given
> radio module's Bluetooth core. Sure you could add a sleep clock, all
> kind of sideband signals for wakeups, reset, power down, etc. But hey,
> some will use them, some won't. I think it's undesirable and
> unnecessary. You can hciattach from here and most will work just like
> that. Tighter integration or anything special, module specific on top
> should be handled individially, on a case-by-case basis. This is a dev
> board after all. I say trick of all trades.

Changing to status=okay for sdmmc2 and uart8 should be fine, it does not
cause any issue for my pcie wifi module testing with a Radxa A8 module.

Testing with a Radxa A2 module (sdio+uart), the sdio/wifi part is
automatically discovered, however bluetooth require a DT overlay for
automatic probe. Something like this seem to work:

diff --git a/rk3568-rock-3b-radxa-a2.dtso b/rk3568-rock-3b-radxa-a2.dtso
new file mode 100644
index 000000000000..746b04e601af
--- /dev/null
+++ b/dts/rk3568-rock-3b-radxa-a2.dtso
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * DT-overlay for Radxa ROCK Pi Wireless Module A2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&sdmmc2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD6 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_wake_host_h>;
+	};
+};
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&rk809 1>;
+		clock-names = "lpo";
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PB5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wakeup";
+		device-wakeup-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_reg_on_h &bt_wake_host_h &host_wake_bt_h>;
+		vbat-supply = <&vcc3v3_sys2>;
+		vddio-supply = <&vcc_1v8>;
+	};
+};

With that applied wifi and bt module is detected and firmware loaded
during startup:

[    4.684687] mmc_host mmc2: Bus speed (slot 0) = 150000000Hz (slot req 150000000Hz, actual 150000000HZ div = 0)
[    4.699412] dwmmc_rockchip fe000000.mmc: Successfully tuned phase to 360
[    4.707429] mmc2: new ultra high speed SDR104 SDIO card at address 0001
[    4.717034] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43456-sdio for chip BCM4345/9
[    4.760907] Bluetooth: hci0: BCM: chip id 130
[    4.763736] Bluetooth: hci0: BCM: features 0x0f
[    4.787714] Bluetooth: hci0: BCM4345C5
[    4.788482] Bluetooth: hci0: BCM4345C5 (003.006.006) build 0000
[   11.417553] Bluetooth: hci0: BCM: features 0x0f
[   11.441621] Bluetooth: hci0: BCM4345C5 Ampak_CL1 UART 37.4 MHz BT 5.2 [Version: 1039.1086]
[   11.442423] Bluetooth: hci0: BCM4345C5 (003.006.006) build 1086

Regards,
Jonas

> 
>> nasty looking error messages in the kernel log when there's actually
>> nothing connected to the UART.
> 
> My dmesg is clean as a whistle
> root@rock-3b:~# dmesg | grep -E 'fe6c0000|ttyS0'
> [    0.344818] fe6c0000.serial: ttyS0 at MMIO 0xfe6c0000 (irq = 26,
> base_baud = 1500000) is a 16550A
> What kind of nasty errors do you recall?
> 
> Kind regards,
> Tamas


