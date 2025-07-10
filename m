Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A196C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkPooPX6zi3QRoM9CrTsbZoAxP36NlshDQEMrww4eZw=; b=nsWeeC73/b5JsG/fV9Bo4deuXX
	CCdQ/mKJ0cGKE39RHui6B3Km2Fcx856nl0qcUtUARFPjE8CLhA++18vYZEVKsWJVwlZ43+3ifdezQ
	M5QBf9mGSIx330bsE87Nu4PDw4OqnBGcgb3mUM9m3/R1ArcWiNprwbQGzeNaOJwyHJB9tzoz5cij3
	jT56vRS/1aSONsP2VUEFuzU9ymbs5yidI9NlbABpefDOC6O7kWgLDyuadjGPzLW9fqGjbwiMRFqyd
	8rU9jXZmC0A2Vn/ujl781IBXiwh8dTRHxAJbX8jemoRkU7K0Dx6RDXL7sZWFPjhtL8HhVXpSNam5/
	+827Zcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZekq-0000000AICp-1M2w;
	Thu, 10 Jul 2025 00:03:12 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeiW-0000000AI65-0Nip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1752105647;
 bh=vkPooPX6zi3QRoM9CrTsbZoAxP36NlshDQEMrww4eZw=;
 b=VI+ZFD4VGTbl0Mt2nkneaZFrhRsdkR3VRes9kbe8ah6qiOjBOHRDHB4XvE6X5CXY89xv02OqP
 tBvcErNOLM5CBJrcaKno72OgEV+uH4lBmN+6Z2qsfGjz4AyUOYhy0lIxrZfqZoodwynNsprktk2
 OWCDJ1wfXXeuFfQP4j2dRnZCentHaKdLsCvdx4RyBlFMKwcfEGpYQLDBW/1DPveKMrfitASAaON
 +jDca65VtxQrJ0p76OSNr/lLllj8QP84YSxjfc0FS1788FEaCMuKWucYUC140CqLkSmFFAm+V+S
 UvgaTts3fM6zTMSAlJBcpKn1f9WoySEABlHM4Td9DYDA==
X-Forward-Email-ID: 686f02a6cecacbdaffda9867
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <87c6249a-96f1-4557-b4eb-70e69e6d773f@kwiboo.se>
Date: Thu, 10 Jul 2025 02:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, ziyao@disroot.org
References: <20250708224921.2254116-5-jonas@kwiboo.se>
 <20250709070003.53484-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250709070003.53484-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_170048_187596_EBD50D69 
X-CRM114-Status: GOOD (  14.41  )
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

Hi,

On 7/9/2025 9:00 AM, Chukun Pan wrote:
> Hi,
> 
>> +	vcc5v0_usb1_host: regulator-5v0-vcc-usb1-host {
>> +		compatible = "regulator-fixed";
>> ...
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> ...
>> +	vcc5v0_usb2_host: regulator-5v0-vcc-usb2-host {
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> ...
> 
> I think these two regulators do not need boot-on?

Agree, will remove the boot-on in v2.

> 
>> +	rfkill {
>> +		compatible = "rfkill-gpio";
>> +		label = "rfkill-wlan";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_reg_on_h>;
>> +		radio-type = "wlan";
>> +		shutdown-gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_HIGH>;
>> +	};
> 
> Why not use mmc-pwrseq instead of rfkill?

Not sure, have changed to use mmc-pwrseq in v2.

> 
>> +	rfkill-bt {
>> +		compatible = "rfkill-gpio";
>> +		label = "rfkill-bt";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_reg_on_h>;
>> +		radio-type = "bluetooth";
>> +		shutdown-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
>> +	};
> 
> Why not use shutdown-gpios of bcm43438-bt?

Sure, will use that in v2.

> 
>> +&i2c0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&i2c0m0_xfer>;
>> +	status = "okay";
>> +
>> +	hym8563: rtc@51 {
>> +		compatible = "haoyu,hym8563";
>> +		reg = <0x51>;
>> +		#clock-cells = <0>;
>> +		clock-output-names = "hym8563";
> 
> CLKOUT pin is not connected.

Thanks, will remove the clock-output-names for the Sige1 and the NanoPi
Zero2 in v2, #clock-cells seem to be required by the dt-bindings.

> 
>> +&sdio0 {
>> +	bus-width = <4>;
>> +	cap-sd-highspeed;
>> +	cap-sdio-irq;
>> +	disable-wp;
>> +	keep-power-in-suspend;
>> +	no-mmc;
>> +	no-sd;
>> +	non-removable;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>, <&clkm1_32k_out>;
> 
> I recommend using clkm1_32k_out at the sdio-pwrseq node.

Will do so in v2.

> 
>> +	sd-uhs-sdr104;
>> +	vmmc-supply = <&vcc_3v3>;
>> +	vqmmc-supply = <&vcc_1v8>;
>> +	status = "okay";
> 
> Maybe `brcm,bcm4329-fmac` nodes can be added here?

Will add to in v2.

> 
>> +&uart2 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
>> +	uart-has-rtscts;
>> +	status = "okay";
> 
> You can add `brcm,bcm43438-bt` nodes here:
> 
> 	bluetooth {
> 		compatible = "brcm,bcm43438-bt";
> 		device-wakeup-gpios = <&gpio3 RK_PC3 GPIO_ACTIVE_HIGH>;
> 		host-wakeup-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> 		shutdown-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
> 		...
> 	};

Will use something similar in v2.

See [1] for fixups I am testing for v2.

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250708-rk3528-boards/

Regards,
Jonas

> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


