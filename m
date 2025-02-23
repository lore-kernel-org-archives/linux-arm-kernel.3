Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DCDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snjxivABr1OyDqYb2NVPxunB52diksXhIJ5NrLLPtwA=; b=2/KPw7nFqGZMdCnp4/0Fp3M1Eh
	FEluC7h03TUcvjjx8fYFpk49SNVJSCS/I6vfFwAYWFeZnDjn9w9a9HAuAiw+kzlsxErjn9MN7E2Lb
	0VgYFcATcmaj1KfR7ZRP3P5jrsBVmUcHT97QqtI8U6IQXrDjDdX66pDVL3agc6Uvba1PS2+/dAGKT
	Zp3bctk70ZDFKu1t5FCagEMn/Ktzr9WEaPOFOAepqRBwsmlm13BnWmD3yZInXu+CFVGgXYMc2M/v7
	Nb8ReK4Ls7icxTMkf/U4PlhsU2O96/NmHxht5KBB49Inu5hyQgv94waYyh+abXGoxvaL31M0epIeX
	+Q3OH+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBEi-0000000B72H-0oMh;
	Sun, 23 Feb 2025 12:37:32 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB1L-0000000B54N-3zPS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 12:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=snjxivABr1OyDqYb2NVPxunB52diksXhIJ5NrLLPtwA=;
	b=eRTbiZ7C2HzhplWvs668ZS3GL4umJm5x5LFASkoRGSETScNulnTjRECIP0N2qg
	LJjI6/yLL6PMYe+JlohMdMxDdVmqHgYcs0gZQvAkH4G1m3innCX8fH44Vsh6zIYZ
	T3hF4SScFaLi4FR8iEYTSyqXI1z3qju5RjMO1iamFp4TI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHbxscE7tnTfSOCQ--.21898S3;
	Sun, 23 Feb 2025 20:22:54 +0800 (CST)
Date: Sun, 23 Feb 2025 20:22:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Brown <broonie@kernel.org>, soc@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on
 ARCH_MXC
Message-ID: <Z7sTG4yMsek11nLe@dragon>
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
 <Z7rMdg7+m6qa0Hft@dragon>
 <CAMuHMdW=ZH7D+m54rh-25nFShCYhRhEjkjaB1LtOrRF5RyrXiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW=ZH7D+m54rh-25nFShCYhRhEjkjaB1LtOrRF5RyrXiQ@mail.gmail.com>
X-CM-TRANSID: M88vCgBHbxscE7tnTfSOCQ--.21898S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrur45ur18tFW3AFWUGFykZrb_yoWDGwbEyr
	4vkw1DC345GryDCF1qgr1avr17t3y2qFWYq3s5Ga17WayfXayDAFn5CrWfAwnakay0gF1a
	krnIqrnYk34aqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnI38UUUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgH8ZWe63ifITQAAsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042344_342149_75159213 
X-CRM114-Status: GOOD (  15.55  )
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

+ Uwe

On Sun, Feb 23, 2025 at 09:29:29AM +0100, Geert Uytterhoeven wrote:
> Hi Shawn,
> 
> On Sun, 23 Feb 2025 at 08:21, Shawn Guo <shawnguo2@yeah.net> wrote:
> > On Wed, Feb 05, 2025 at 03:41:43PM +0100, Geert Uytterhoeven wrote:
> > > The i.MX System Controller Management Interface firmware is only present
> > > on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> > > asking the user about this driver when configuring a kernel without
> > > Freescale i.MX platform support.
> > >
> > > Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks for the patch, Geert!  But I have just picked up the change from
> > Uwe [1].
> 
> Thanks, but mine has been upstream since Friday ;-)
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=be6686b823b30a69b1f71bde228ce042c78a1941

Ah, Arnd beat me to it.  Thanks for information!

Shawn


