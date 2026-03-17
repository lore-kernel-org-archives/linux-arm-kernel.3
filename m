Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8550CFB5E93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 00:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQ+41XhojNRDlvELUO4SV+VvEzjzTBdb6mPvK55w48A=; b=2sZqL6e6sPe/KIZXC/XjNkj3Od
	ZZ07rRAV8LL/R7BeCjgbNGaxL2r0Vw/uLglrkoal4HEUlJvvlk9AlffgVUJZLaVyaAZlgdDYJYwPI
	BE+aF4NUuU0cBZ6hAKe4yNwJrcjJ21K3sCDAmHh81T2AzLaVs0DeHKJkHcWu4FL6xm/JNR7QyWcv9
	voBqio9cSEW76szNGGeVzWG+RsWgQi1ksFkycezZSdhrwjOoxYZM0HHFyyEWVV7QPBFvzGV+X1JX5
	5nDuLRdv7ZO08c5OWFQxsDqx3xfD3zh7zvJVVF8YfHY2UJ5JZsna0JBOz4UinH2giwe6bq9aH0Bof
	zOdyQ/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2I3s-00000005740-2YVE;
	Tue, 17 Mar 2026 00:13:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2I3q-0000000573b-2sVR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 00:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF48244510
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 00:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F12C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 00:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773706405;
	bh=Kn3hnu/kLCbXlV8YMtYksGThcWoS4aEUofiHoSMyjcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DLWuFyMQwRBw5QfxxZ9pDNRCM7ePNYEUYJSI8OtmacY7caIsqPhh7HVesTEWfOJIc
	 qRwfqeeFUgmuEl0VUYPsaNIXVQlVQOsOZ001680+VJnWrM0BirrXFZgku3dPY0aPPw
	 fiewEoChiNUAP17jexi2qrcg7rhQA8h0Ds2mR4EqEY8YpeOXmSMyLIWEwHW1/pAIIf
	 dKMhJ5dMUeLACw0vwbVSFm9j945KpG3vfgHoTwzjzUTMluNHDy5llb4P8zyTRB1k39
	 GnC3UmFZKAF5vbP8A2nKjh2/tNuA5sjkebFiJYWfg8NGFc1Zi30QSpftH1BPD3/HfX
	 dbZaVxa+pnLYw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-794719afcd4so45815927b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 17:13:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTWHz58aBKe4TXU7Xpk83lx41+txJCu2YRbIrvhhmdx+EVsf5w+QPAudjSClQ2KtsOBDCNZma3zwSUPZ3F5qqR@lists.infradead.org
X-Gm-Message-State: AOJu0YzZvFNTlyr7Gu1ieAD16AGggKdQdwz/ZqKGr5LRmkyrlztrCee3
	LQ5pJ+7ilzDZEr4ZAgh9RKAKqJ/jAMh8oHhT8wfbuzFHhC0avVUUVvRemSwqdOnasJKiFxkiE0C
	ucpGtYbl0wi92uAonMcTYErUtWGTjZTQ=
X-Received: by 2002:a05:690c:3387:b0:799:266:83cf with SMTP id
 00721157ae682-79a1c1b51acmr158135067b3.43.1773706404888; Mon, 16 Mar 2026
 17:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com> <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com> <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
In-Reply-To: <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Mar 2026 01:13:14 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
X-Gm-Features: AaiRm539yxW1CnWC8D8QmZdr1BxL5U68_GUe3uuuPSgXK1xikaSSDcXUyqDMApY
Message-ID: <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: stmmac: fix pinctrl management during suspend/resume
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	antonio.borneo@foss.st.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_171326_771421_C7B6ADA4 
X-CRM114-Status: GOOD (  27.60  )
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

On Sat, Mar 14, 2026 at 1:37=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Sat, Mar 14, 2026 at 12:44:56AM +0100, Linus Walleij wrote:
> > On Fri, Mar 13, 2026 at 12:08=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Fri, Mar 13, 2026 at 11:57:16AM +0100, Christophe Roullier wrote:
> > > > In the deepest low-power modes, the pinctrl configuration is lost
> > > > and is never restored if the interface is down.
> > > > This commit ensures that the pinctrl state is set in all cases.
> > >
> > > Shouldn't the pin state be restored by the pinctrl layer?
> >
> > What we have in the device core only applies "init" and "default"
> > states, and provides these handles for transitioning to "sleep"
> > and "default" again (like a state machine).
>
> What I was meaning is that - for a driver using the "default" state,
> if the hardware loses the pinctrl state during sleep, isn't it the
> responsibility of the pinctrl driver to restore the state rather
> than leaving it in whatever states it happens to be when the SoC
> comes back from suspend?

Aha I understand.

Some pin controllers are aware of the different states from an
electronic point of view, so different states are programmed into
the hardware for suspend/sleep and "active". This programming
can be both implicit (fixed in the pin controller hardware) or
programmable by the operating system. Then a hardware
line tells the pin controller when the system goes to sleep so it
autonomously apply some sleep mode settings to the pins
and reverse this back when waking up. These pin controllers
themselves are "always on", in a specific power domain that
never shuts down so they can keep track of this.

In other cases the pin controller lacks this autonomous ability
and then each driver need to transition its pin state to the
right one when going to sleep and coming back up.

In some further cases the pin controller does some power
management but it's sub-optimal such as leaving I2C bus lines
floating on pull-up when they should be pulled to VDD
to minimize leaks during sleep (for example). The default
is OK but with some pin control state intervention we can do
better, sometimes.

> If that is not the case, then don't we have a major issue where
> drivers using pinctrl but do not issue any pinctrl calls in the
> resume function are buggy?

Sadly, in my experience, the power management features of an
SoC is the last step or an "afterthought" when companies
upstream their changes to the Linux kernel, this comes last
and often never. The code is there in the downstream (vendor)
kernels. Running the mainline kernel works but eats power :(

I think what we see when we do:
$ git grep  pinctrl_pm_select_sleep_state |wc -l
107
are the companies that have actually gotten around to do this
properly and test it. There are some very generic hardware blocks
such as the designware USB controller in that list.

Some SoCs may benefit from autonomous power state control
in the hardware, all ACPI platforms for example, I *think* have
the ambition that firmware/BIOS deals with this and we need not
think about it. For devicetree I think it depends, it's up to the
SoC how much is autonomous and how much needs to be
initiated by the driver.

Yours,
Linus Walleij

