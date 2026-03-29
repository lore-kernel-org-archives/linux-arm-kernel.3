Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D62F3D5FF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 12:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOlBMggKOzDX9Ye5XiGyMCn6XgPjZaJN4792ud0dJuc=; b=vkvrUlZSP+dHQXcb0mcm0OPFKT
	YXhdu8oS6w+VILTr47pUYIojUaG2iDjfs7IVN8oAlTmQOL67Q0/fwPIcVAjwPbQP/odctrILLlGcv
	u/LxkFR5ICZYRgXenvM5tTiFp3OAOYq7fMH7+Zjr6Wjz3/MidlrAdNGK8PBhDmytx+SuHH4UHKu0m
	cVRDmuRHefYhSwRAoReYCKnKzuecazD0sVcxvnKXE1wjTJKk6R5lq2JlXyRosDRBpHmq88NHEa+/v
	alGvHZrL26HsdQR5dv6dBLCWC8nawDV01/DJ7iyYgf6QfHu86MQR4QtTkiEvzhC3PJV7g9OqU14PP
	0QZclh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ovP-00000009tmt-0oK7;
	Sun, 29 Mar 2026 12:07:27 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ovL-00000009tm6-0S3b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 12:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JOlBMggKOzDX9Ye5XiGyMCn6XgPjZaJN4792ud0dJuc=; b=q/Ydot2MmGM3Wr1NwgXeCzbhAI
	KDATv3TNIU1rDjD/oWiqFLoEO9rR5KUXiRqLTbtF0oAUbPwTif529V5+bEF0YrH4Wmq4RPVg3h7BY
	EA31XWiN373S1oR+VQLT+jYQC7TZgMsStVl0EtDVeyX7kiPLs7c3Dvkq3sow6ZJ270jh6U0U77AuC
	1Rb7LZKMuwhhhNLyMwXp4jpvWtQexynwhf5WVeTSQUSquSvYzaqLVgi3n5G9URF8nNQh3+0gmNyAj
	JneMxxA6EmP8nrS6X7iH06sfzqk7JN17ISdZXA7Dewgbilc0PCA4nyBaVVgnlHNz6KOw/ydwoZngE
	gdx0ofww==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w6ovI-0000000GxJ9-0wwi;
	Sun, 29 Mar 2026 14:07:20 +0200
Date: Sun, 29 Mar 2026 14:07:19 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Message-ID: <n2bupd37br2mp7ls6c5z5ueoancr53tn4mywg2vvrlpyhmkex4@lxe6tfdhwz5e>
References: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
 <5977334.DvuYhMxLoT@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5977334.DvuYhMxLoT@jernej-laptop>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_050723_488149_2FC6B566 
X-CRM114-Status: GOOD (  22.13  )
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

On Sun, Mar 29, 2026 at 01:53:45PM +0200, Jernej Škrabec wrote:
> Dne nedelja, 29. marec 2026 ob 13:43:04 Srednjeevropski poletni čas je Michal Piekos napisal(a):
> > Add support for timer by reusing existing sun4i timer driver.
> > 
> > H616 timer is compatible with earlier sunxi timer variants and provides
> > both clocksource and clockevent functionality. It runs from 24 MHz
> > oscillator. It can serve as broadcast clockevent for wake up from idle
> > states.
> > 
> > Tested on Orange Pi Zero 3:
> > - timer is registered as clocksource:
> > - switching clocksource at runtime works
> > - timer operates as a broadcast clockevent device
> > - no regression observed compared to arch_sys_counter
> > 
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > Test results:
> > 
> > Clocksource switching:
> >   cat /sys/devices/system/clocksource/clocksource0/available_clocksource
> >     arch_sys_counter timer
> >   echo timer > /sys/devices/system/clocksource/clocksource0/current_clocksource
> >     [ 5031.105997] clocksource: Switched to clocksource timer
> > 
> > Clockevent configuration:
> >   cat /proc/timer_list
> >     ...
> >     Tick Device: mode:     1
> >     Broadcast device
> >     Clock Event Device: sun4i_tick
> >      max_delta_ns:   178956969070
> >      min_delta_ns:   1000
> >      mult:           51539608
> >      shift:          31
> >      mode:           1
> >      next_event:     9223372036854775807 nsecs
> >      set_next_event: sun4i_clkevt_next_event
> >      shutdown:       sun4i_clkevt_shutdown
> >      periodic:       sun4i_clkevt_set_periodic
> >      oneshot:        sun4i_clkevt_set_oneshot
> >      resume:         sun4i_clkevt_shutdown
> >      event_handler:  tick_handle_oneshot_broadcast
> >     ...
> > 
> > Cyclictest measurements:
> >   Dominated by system scheduler latency and do not reflect clocksource
> >   precision.
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > index 8d1110c14bad..bf054869e78b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > @@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
> >  			};
> >  		};
> >  
> > +		timer0: timer@3009000 {
> > +			compatible = "allwinner,sun50i-h616-timer",
> > +				     "allwinner,sun8i-a23-timer";
> 
> You have to add above combo to DT bindings.
> 
> Best regards,
> Jernej

Not sure I understand your comment correctly but binding for h616 is already
there:

Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml:21-27
  - items:
    - enum:
        - allwinner,sun20i-d1-timer
        - allwinner,sun50i-a64-timer
        - allwinner,sun50i-h6-timer
        - allwinner,sun50i-h616-timer
    - const: allwinner,sun8i-a23-timer

BR
Michal

> 
> > +			reg = <0x03009000 0xa0>;
> > +			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&osc24M>;
> > +		};
> > +
> >  		watchdog: watchdog@30090a0 {
> >  			compatible = "allwinner,sun50i-h616-wdt",
> >  				     "allwinner,sun6i-a31-wdt";
> > 
> > ---
> > base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> > change-id: 20260328-h616-timer-046e6ac3549e
> > 
> > Best regards,
> > 
> 
> 
> 
> 

