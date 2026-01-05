Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FE9C79FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQiw5ZuqbRa/R+rOzhfPK59j8NEJ1LOlep90YkURlxE=; b=oJtxdnfKN90wnrRubbLbR/OCSq
	Zf/Q/jVRIGpsGlfjZQZF5gIphF4aML5pwCnkBvaaTn+2Incrlja0WxIw0bFblnIOqpTjWxdxsr6YV
	EA386lQEX8SyBxUPde+Z1ctVnqPROPgORo+rsdR/QeySketI+ImKMqYlambLxUXcFkxyyFhs4ECyZ
	GscS7rKPvU2HIXP+g0ghISuGXEyEG8lR5vAHdnSB+9qA4UJaYcrhWkeFVhzLMZl5MrX2C6dxOi9GK
	3JcyOHDgkOmnqZhY4bbhTpTwxUemiOCak/lppYNEZbGzy0yTTEU8EI3D5rIi68pW2XL0Yegq20Osk
	9REWDSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqQA-0000000BzTV-2jzZ;
	Mon, 05 Jan 2026 19:39:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqQ8-0000000BzSz-0G21;
	Mon, 05 Jan 2026 19:39:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0934339;
	Mon,  5 Jan 2026 11:39:07 -0800 (PST)
Received: from [10.57.46.243] (unknown [10.57.46.243])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1CB63F694;
	Mon,  5 Jan 2026 11:39:12 -0800 (PST)
Message-ID: <c76ae679-d05a-4192-8ffe-189649799ee4@arm.com>
Date: Mon, 5 Jan 2026 19:39:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec
 HD702E
To: Doug Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com,
 sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <cover.1767111804.git.robin.murphy@arm.com>
 <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
 <CAD=FV=VB9XOm33VvsTN4cd22rBf9A-7ie4hN80TAByciQropfg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAD=FV=VB9XOm33VvsTN4cd22rBf9A-7ie4hN80TAByciQropfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_113916_219286_DE8F3682 
X-CRM114-Status: GOOD (  31.71  )
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

Hi Doug,

On 2026-01-05 5:39 pm, Doug Anderson wrote:
> Hi,
> 
> On Tue, Dec 30, 2025 at 9:21 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> +&{/} {
>> +       pwm_bl: backlight {
> 
> nit: up to you, but I happened to notice that other rk3399 boards just
> use the label "backlight:" instead of "pwm_bl:"

Sure, if you prefer.

>> +               compatible = "pwm-backlight";
>> +               pwms = <&pwm0 0 25000 0>;
> 
> 40kHz is awfully fast for a PWM backlight. Are you sure you need it that fast?

I guess I just copied this from somewhere without too much thought, but 
double-checking the schematic[1] now, the backlight driver where this 
signal ends up is apparently a SY7200A, whose datasheet says "And the 
recommend dimming frequency range is 20kHz~1MHz." So relative to that 
range it doesn't seem too bad!

> 
>> +               enable-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
> 
> Not that I'm doing a thorough review here, but I happened to notice
> that you're referring to a GPIO without adding a pinctrl entry. I
> think the usual convention is to add one.

Ah yes, good point! (Too easy to forget the boring details when doing a 
holiday project away from home...)

>> +               brightness-levels = <0 255>;
>> +               default-brightness-level = <200>;
>> +               num-interpolated-steps = <255>;
>> +       };
>> +};
>> +
>> +&edp {
>> +       force-hpd;
>> +       status = "okay";
>> +
>> +       aux-bus {
>> +               edp-panel {
>> +                       compatible = "friendlyarm,hd702e";
> 
> As per my response in your driver patch, any chance this can just be
> "edp-panel"?

Per the cover letter, I did try...

>> +                       backlight = <&pwm_bl>;
>> +                       no-hpd;
>> +                       power-supply = <&vcc12v0_sys>;
> 
> While not strictly required, it seems highly likely that you want
> "hpd-absent-delay-ms". It's highly unlikely that you would have
> "no-hpd" plus a "power-supply" but no hardcoded delay to wait here. I
> haven't seen panels that turn on and respond instantly.

...but even with both delays bumped up and up and up to a ridiculous 
2000ms it still didn't work. It reads the EDID as all-zeros then fails 
to probe due to a lack of modes. Whereas with the hard-coded mode, the 
display lights up immediately upon probe, so I don't think it's a timing 
issue. My working theory is that there's some fundamental ordering issue 
based on the comments in analogix_dp_detect_hpd() about aux not working 
until HPD is forced at the controller end, and from a brief skim of the 
history, quite possibly related to f2600d08d4e8 ("drm/bridge: 
analogix_dp: Improve panel on time") which maybe prevents that happening?

By that point it's well beyond my expertise, hence my conclusion that 
since I'm not *adding* the legacy panel data, just rearranging what's 
already upstream to finally put it to proper use, that's just about 
acceptable :)

The power-supply entry is really just for cleanliness, to avoid a "dummy 
regulator" message - the screen module has all its own regulation on 
board, which didn't seem worth modelling in detail as it's all fixed and 
always-on, but the source is the board's main 12V input, so that much 
*is* true.

>> +
>> +                       port {
>> +                               panel_in_edp: endpoint {
>> +                                       remote-endpoint = <&edp_out_panel>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&edp_out {
>> +       edp_out_panel: endpoint {
>> +               remote-endpoint = <&panel_in_edp>;
>> +       };
>> +};
>> +
>> +&i2c4 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
> 
> The base dts already specifies #address-cells and #size-cells, right?

Indeed, but dtc doesn't know that when compiling the .dtbo in isolation.

>> +       touchscreen@5d {
>> +               compatible = "goodix,gt9271";
>> +               reg = <0x5d>;
>> +               interrupt-parent = <&gpio1>;
>> +               interrupts = <RK_PC4 IRQ_TYPE_EDGE_FALLING>;
>> +               irq-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
>> +               reset-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
> 
> There's no power supply here, so I'll assume it follows the power
> supply of the panel? You probably want to be a "panel-follower" then,
> right? AKA you'd want to add a "panel = " node here to refer to your
> edp-panel.
> 
> Oh, except that the goodix driver you're using doesn't support
> panel-follower. That's annoying. I guess you'd have to add support for
> that (see history around "is_panel_follower" in "i2c-hid-core.c")?
> Without it then I assume you'll just be lucky that things work? ...or
> you'd need to mark the power supply as always-on?

Yeah, as above it is in fact always-on anyway - somehow I missed that 
the goodix driver is getting regulators too. The 12V input is stepped 
down to a main VDD_3.3V rail from which everything else is derived, so 
if I add a fixed-regulator node for that which is sufficiently close to 
the truth for both these and the panel supply, would that be clear enough?

> I guess I can also note the same comment that there is no pinctrl for
> your GPIOs here.

Ack.

Cheers,
Robin.

[1] https://wiki.friendlyelec.com/wiki/images/f/f3/LCD-HD702E-2106_SCH.PDF

