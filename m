Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEA6F588EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtHJitgOXiKvhtJ9W9j2071qDpvbTTZCmk6P6HSe3v0=; b=1rhgOjOmjNIR07wY/agqtldwa8
	WzFLdvKj9S8f7KBqBk+BZteSH3LBQf9zWAkyIqcP9kndwZYf2AOpcegDrV521as63qBv8IOdeouJt
	4zIV2OJhbLScKXwCFB3uunwEU5vE9jZNO2/pEQ1uJXfxlUASsmybXjEUqy7WALDujbxfi010iBnN1
	/AobIXNGyIikcMW7ZKsSPzg2ipTFL2NLNAAnnBRMbsMoPzuLwcrGL+NedXxXDSPzwLXutjbeI6IRC
	OmsSl50dgjb5OSYIPZ0iufy9cTFvFPjFLacQqtWBbDeD/zow4S4ZgFgaJy/CKnRGfRhp5WnI+CEYK
	MMbCXMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErQO-00000007QMT-3zuw;
	Mon, 20 Apr 2026 16:24:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErQM-00000007QLR-28T8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 16:24:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso36985825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 09:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776702276; x=1777307076; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtHJitgOXiKvhtJ9W9j2071qDpvbTTZCmk6P6HSe3v0=;
        b=FboYsomp++RkMX3VXlIKu3ZQTIsjuuViwuSnLRilzIa8sBdCaqnDnuvky9YnK5TpnC
         J584GroczhJ2OP7lsLbsMd9Uy6v1LikSFlOsRMKlchxyS6vLSJpTLIk+J0AihQBr0meK
         LcBx+28xiEyaB4uncOUIUjLwKBeOH/p4JJoHL1fae/JMXmCeIXrZNSTY+S2qigkA2WHq
         f4moSHANPoh5C52Jq8//WXkkUE8NdBek+KxJDLkxccN+vXsQU5W1UUsubg2HIZ1fiJqg
         wn5a5jkb6U/m2Vr1GvhVtzm3FDYsZg5vhkaXi/iV6s10uFNjtx1W4NPlGHZ+kgVWELFb
         VmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702276; x=1777307076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtHJitgOXiKvhtJ9W9j2071qDpvbTTZCmk6P6HSe3v0=;
        b=M1UI1dnSQxdaoymkcH4eqI8XPWhJXEJ4khzQ/TvKfLYDYbqgWAtP2d/8/r+eNH+xyk
         YB+L/HU74pybVM/0FAM1dF0YLE+pEE7kGpIz1kftBaMOkLKHT5NMt30lcGS+b+ztvljl
         ssdoWG++WfpsvDwoHBpoHsifyZR9zB8zNZMzYr/22ruVagtPF4CTKZNwPL9EyZOpjsF8
         uP/TbluPeightZeMDdV5kjTbFzjcuc5eXcZQro44sbLS+Lt2fa1fA3XYzcjJl15PhOTr
         KzGZ0aLrfEpsFyvDNZEuVe6OrFctbffp2opTtd8Rd6R7RALKH5EDseu/WrfLPmCInJNE
         mUrA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZD/L64pC0Fu+Kit11uEsWszWan00TbQOzGBYljYXdaPJdVClTEcfySa+8aZyzMg0RqnAb0S4b6IiZADq2lQxl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhcny0MzB1fXrNvUIpV9eH3IxN8UlTbTY5HbUX7yXG3EmSxPvf
	jGuy/r8/6Bk+Olaz7C5XvpZVSNSN7QKl/dFWQwe50+pQYLITaYU3w+shPVZ08BdOgbg=
X-Gm-Gg: AeBDietUYsQc14k5vyGJPMg/1Bh5Kf2wEun4/wUf95k/E1LLJOk9aQvlMeGF1gXpHRr
	bi5XgaUYsssxZeR5jy4kb8brGezI8EhsUXnGPhoqSQ5e04uHGK0rG1/3oYLsoR2ULRITp0wGVrw
	zaOyBdBtQ9mRqWQoB0UWTrypDEHuz13OE5m2jzZNXAMYz10mce02b4Dv+AgIrRZxDunUaBHdaZj
	fyoFIv/kk/3m3HAfZpDbac7kM+xxAonZ0dvfRJZYDm/k9AomhzEPKudw9S3nWEpvDq9tcndb1qu
	0h/7EIeJ23Z8e9qhstxKwygvKspDiEyFLjyHyVW/LpVzB27Qi/jGTdPjhW1wkW+uqfDDHQKZk5w
	CyN0KkDNYf0lr7V3yJBMUkgmlRc7OULqR12xb6cw3Sp2NdDUafuWhZUJqQxe1bCk40RUrVoFrYG
	PLxBg6i5MDSgHbQHhyBDOGUN+JNIwmoWrNzhWCmUCesscBUfWyfadfNvz+Lsp7rR5UOTOCF4neQ
	1DAJWE=
X-Received: by 2002:a05:600c:1f94:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-4891c2d2213mr68819025e9.5.1776702275866;
        Mon, 20 Apr 2026 09:24:35 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489393ddd69sm16749795e9.10.2026.04.20.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:24:35 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 20 Apr 2026 18:27:45 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aeZUAaQkHGqBL8st@apocalypse>
References: <cover.1775829499.git.andrea.porta@suse.com>
 <0d99317b9150310dfbd98de1cb2a890f0bffe7cd.1775829499.git.andrea.porta@suse.com>
 <adkrHkANCzxO8KUP@monoceros>
 <aeC6U7D6TfWm8JPx@apocalypse>
 <aeDmk-t5Lc1zpkg9@monoceros>
 <aeH373a_xmr6fnAy@apocalypse>
 <aeIGxfQ7AoIVR5n6@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeIGxfQ7AoIVR5n6@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_092438_597477_5AEC4934 
X-CRM114-Status: GOOD (  56.75  )
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

Hi Uwe,

On 12:50 Fri 17 Apr     , Uwe Kleine-König wrote:
> Hello Andrea,
>
 
<...snip...>
 
> > I stand corrected here: after some more investigation it seems that only the
> > enable/disable (plus osme other not currently used registers) depends on the
> > global update flag, while the period and duty per-channel registers are
> > independtly updatable while they are latched on the end of (specific channel)
> > period strobe.
> > I'd say that this should avoid any cross-channel glitches since they are managed
> > independently. Unfortunately I'm not able to test this with my current (and
> > rather old) equipment, this would require at least an external trigger channel.
> > Regarding the setup of a new value exactly during the strobe: I think this is
> > quite hard to achieve.
> 
> To sum up: period and duty_cycle changes might result in glitches unless
> the channel is disabled. This is ok, please just document it.

Maybe the glitch can occur if we're changing period and duty exactly during
the strobe, unless the register writing is somehow in sync with the PWM clock.
Disabling the channel immediately stops any execution and the line goes suddenly
low (if polarity is normal, otherwise stays high). See also next.

> 
> The purpose of the update flag then is only to start several channels in
> sync?

Citing the datasheet:

"To prevent mis-sampling of multi-bit bus signals in the PWM clock domain,
this bit (SET_UPDATE) should be used to trigger a settings update. This
ensures that all PWM channel settings update on the same PWM clock cycle."

From my testing though, channels can be started in sync only if they have the
same period. I'll add a comment for all this, and other edge cases.

> What happens if sync is asserted while a disabled channel didn't
> complete the last period yet?

The output stops immediately without waiting for the current period to finish.

> 
> Maybe it's worth to test the following procedure for updating duty and
> period:
> 
> 	disable channel
> 	configure duty
> 	configure period
> 	enable
> 	set update flag
> 
> Assumint disable is delayed until the end of the currently running
> period, the effect of this procedure might be that no glitch happens if
> the update flag is asserted before the currently running period ends and
> the anormality is reduced to a longer inactive state if the updates are
> not that lucky (in contrast to more severe glitches).

The disable isn't delayed as explained above. Setting just the new period/duty
(which do not depend on the sync bit) correctly waits for the end of the current
period without noticeable glitches (tested with a scope).

> 
> If you can configure a short and a long period that is distinguishable
> "manually" with an LED I think this should be testable even without
> further equipment.
> 
> > > > > > +	if (ticks > U32_MAX)
> > > > > > +		ticks = U32_MAX;
> > > > > > +	wfhw->period_ticks = ticks;
> > > > > 
> > > > > What happens if wf->period_length_ns > 0 but ticks == 0?
> > > > 
> > > > I've added a check, returning 1 to signal teh round-up, and a minimum tick of 1
> > > > in this case.
> > > 
> > > Sounds good. Are you able to verify that there is no +1 missing in the
> > > calculation, e.g. using 1 as register value really gives you a period of
> > > 1 tick and not 2?
> > 
> > You are right. The scope reveals there's always one extra (low signal) tick at the
> > end of each period.
> 
> So the hardware cannot do 100% relative duty, right? Please document
> that.
> 
> > Let's say that teh user want 10 tick period, we have to use
> > 9 instead to account for the extra tick at the end, so that the complete period
> > contains that extra tick?
> 
> I would describe that a bit differently, but in general: yes.
> 
> The more straight forward description is that setting
> 
> 	RP1_PWM_RANGE(pwm->hwpwm) := x
> 
> results in a period of x + 1 ticks.

Exactly. So whatever the user request I have to subtract one from the value
to be written to the RANGE register.

> 
> > This also means that if we ask for 100% duty cycle, the output waveform will
> > have the high part of the signal lasting one tick less than expected.a I guess
> > this is the accepted compromise.
> 
> I assume you considered something like:
> 
> 	RP1_PWM_RANGE(pwm->hwpwm) := 17
> 	RP1_PWM_DUTY(pwm->hwpwm) := 18
> 
> to get a 100% relative duty?

Ah right! It's working fine and I've got 100% duty. So at hw register level
the duty can be greater that the period.

> 
> If this doesn't work that means that this has to be formalized in the
> callbacks. That is the fromhw function has to always report
> duty_length_ns less than period_length_ns.

No need, it's working indeed.

> 
> > OTOH, the minimum tick period would be 2 tick, less than that will otherwise
> > degenerate in a disabled channel.
> 
> It's expected that in general for a period_length of 1 tick you can only
> have 0% and 100% relative duty. IIUC for this hardware you cannot do the
> 100% case so there is only a single valid duty_length for period_length
> = 1 tick.

Minimum tick confirmed to be 1.

> 
> I think it would be more complicated to consistently filter out
> period_length = 1 tick in the driver than to just accept the conceptual
> limitations. (Otherwise: What would you report in the fromhw callback if
> period_length = 1 tick is configured in wfhw? Would you refuse to commit
> that wfhw to hardware in .write_waveform()? The pwm core handles that
> just fine and consumers have all the means to detect and prevent that if
> they care enough.)
> 
> > > > > On remove you miss to balance the call to clk_prepare_enable() (if no
> > > > > failed call to clk_prepare_enable() in rp1_pwm_resume() happend).
> > > > 
> > > > Since this driver now exports a syscon, it's only builtin (=Y) so
> > > > it cannot be unloaded.
> > > > I've also avoided the .remove callback via .suppress_bind_attrs.
> > > 
> > > Oh no, please work cleanly here and make the driver unbindable. This
> > > yields better code quality and also helps during development and
> > > debugging.
> > 
> > I wish to, but the issue here is that this driver exports a syscon via 
> > of_syscon_register_regmap() which I think doesn't have the unregister
> > counterpart. So the consumer will break in case we can unbind/unload
> > the module and the syscon will leak. 
> > If you have any alternative I'll be glad to discuss.
> 
> My (not so well articulated) point is: Please be stringent about clock
> handling to not bank up technical dept more than necessary and such that
> the driver can be made unbindable if and when syscons grow
> that feature. Optionally wail at the syscon guys :-)

Hmmm not sure I've understood your point: is it a requirement that the driver
must be unbindable? In this case I should avoid registering the syscon. Or
should I just provide a .remove callback in case there will be a way to
unregister the syscon (even if this callback will not be called as of now)?

Many thanks,
Andrea

> 
> Best regards
> Uwe



