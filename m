Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED71C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rVIc3YXAPNKeRBKRO+kcpmDUDUsEdoUffccwiP9wS4=; b=2h3a6wjV0rYFJGLylx4CxP4twQ
	EXx8A6liHF+wlRNiV1bCUZykObnSqQbPNZaPVCpv/qnHkzvzEjijdc2+6riuI1QzgqstczSTIjxv8
	adpvMfxzla8ut9wXPxt/+wKHxd55lsconaEWwypuoxmyerAzpM5FXMH3BR0qbbK+wFm58xb0KsI/7
	CDx262MyhaejhjmeF7tGgChQKK8fD73kOGe4FwkpU9bjzH1Ow+b2VZfrG1gvjHETmDAN7UHFqiDmo
	hkZXJse+07YvWBQAruux2D5lB2JfRHYuf2XCQ+cyxZPBV3zYDOeldaySbUUnsFqBn6f2274mlux0J
	W5gD4rzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBWy-0000000EYCs-2Wxx;
	Fri, 11 Jul 2025 11:03:05 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAUm-0000000EORb-1vIi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1752227803;
 bh=4rVIc3YXAPNKeRBKRO+kcpmDUDUsEdoUffccwiP9wS4=;
 b=lwBuWiZhtGBEy0rbTRyWCHa1hStsuC/J74uadx0kDP62iDnnJLFnDU/vAJ31zg9zx48GRyQeZ
 ZM7qOrC6SfbEoSaUeSWxrR3GQfXQan2ZUKbvtkpdVzh8IAmc5F3XxZZ6sfRCjfHz5P5aTH+qbFE
 PgteQVss/mHM/7+lrag1Bj/VxkWr58rRRKOK+sLEBNccx1gzNbZ7TpptyuqlurNREj/1z1b59rW
 5KgqlyUHNe1aZYVdl7arxMDBToY6TZeCX8pRmXmQTkNx4BnvLS79dw8rsT9MzF4LAkGvJi7fjWX
 L+7ZaRxr4OV/UxyKIEtalA48xqdAjXumkpiR41+LGtjQ==
X-Forward-Email-ID: 6870dfd1f6410632f515ce81
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <acbbf570-7a56-4d88-a631-32acd13d29c7@kwiboo.se>
Date: Fri, 11 Jul 2025 11:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 ziyao@disroot.org
References: <20250710202958.3717181-5-jonas@kwiboo.se>
 <20250711080009.72677-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250711080009.72677-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_025644_840409_8A8FBBD2 
X-CRM114-Status: GOOD (  15.29  )
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

On 7/11/2025 10:00 AM, Chukun Pan wrote:
> Hi,
> 
>> +	leds {
>> +		compatible = "gpio-leds";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&g_led>, <&r_led>;
>> +
>> +		led-green {
> 
> Should this label be named as led-0/led-1?

The nodes must include 'led' anywhere in their name according to schema:

"""
patternProperties:
  # The first form is preferred, but fall back to just 'led' anywhere in the
  # node name to at least catch some child nodes.
  "(^led-[0-9a-f]$|led)":
"""

Using the color name similar to the the pin labels in schematics made
most sense to me.

Do you want me to change these to conform to the more restricted
^led-[0-9a-f]$ pattern?

> 
>> +&sdio0 {
>> +	bus-width = <4>;
>> +	cap-sd-highspeed;
>> +	cap-sdio-irq;
>> +	disable-wp;
>> +	keep-power-in-suspend;
>> +	mmc-pwrseq = <&sdio_pwrseq>;
>> +	no-mmc;
>> +	no-sd;
>> +	non-removable;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>;
> 
> This pinctrl is the same as that of rk3528.dtsi, we can remove it.

I will drop the pinctrl props in a v3.

> 
> BTW there is a fan connector on the board (connected to pwm6m2),
> so pwm6 should be enabled.

I only try to enable controllers for devices that are properly described,
so I ignored the pwm-fan and its required pwm6 controller. Mostly
because it make more sense to describe the fan once thermal support is
completed, work [1] currently being blocked by a rk356x otp series [2]
and that depends on a rk3576 thermal series [3].

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250620-rk3528/
[2] https://lore.kernel.org/r/20250415103203.82972-1-kever.yang@rock-chips.com
[3] https://lore.kernel.org/r/20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com

> 
>> +&uart2 {
>> +	dma-names = "tx", "rx";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
>> +	uart-has-rtscts;
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "brcm,bcm43438-bt";
>> +		clocks = <&cru CLK_DEEPSLOW>;
>> +		clock-names = "lpo";
>> +		device-wakeup-gpios = <&gpio3 RK_PC3 GPIO_ACTIVE_HIGH>;
> 
> Is host-wakeup-gpios needed?

The host-wakeup interrupt is described using interrupt* props, not
using the deprecated host-wakeup-gpios prop.

Regards,
Jonas

> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


