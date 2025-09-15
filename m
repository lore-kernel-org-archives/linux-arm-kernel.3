Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F38CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiSuNHGevmd26kBGyenDRGXjSi97SCJVo++uujoK+0o=; b=jGnGC8EwVCkK1oCAH3qGxl3BaO
	6r7I1uegne+5eH1geI6oquw4vQ9PwT4eH7plqmg4QAlxab0HP04dH8Ef89w9FaApJRdqake8e4vCY
	c5wUFmIR91hBWmGMWZE2nJaMDjUHzWXOLFaxyCUTe6aX/nuDgKv+O9z4bZ++JXX8k4B9lGYn+fEFX
	pbypG+zSuwhFXJg7/Mm5fgLyeD5QVFwToUFhakkDAzja3LOwTUDzEFFz456G65yWtLkBx/eSPH/Vi
	vJ4BZD9Whlja7IWung9+/R2fAajowaKDWLO2LlkoPmxO5ugMmsYKYYkLIq/s+MxPXA5NMme9AqjhW
	XCo4rNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyERD-00000005T7x-36sK;
	Mon, 15 Sep 2025 19:00:31 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyERB-00000005T6l-0beG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:00:30 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C3CFA240104
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 21:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1757962826; bh=FiSuNHGevmd26kBGyenDRGXjSi97SCJVo++uujoK+0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=qYwMM0uJt0emo9l9oKVYRQkXmV5TMQ8v2qimaK3ope+jk4wup3FjZE5yAuNPT/gwS
	 +wm81n+/EXK8s7HNFxUin2JAnedb5iPuyEuhvdOwSQI8faKuZ2ySkVjqYqJ9vzng0K
	 sM/PjJw24iIzT1/nZ0jYO4vMQ2MVqwpQWM7lwj3XfaY6/BRRNWy7NCcXevivxsDcAw
	 7hx6k2GYeMjvr63wrUXMPlKfquB92vqAVCjwlNWi15CbxC3+TjTpTy947HdSIqglof
	 fgvYfNrHkkfmUYYfD0pjdLHoSwroMZalIBnPJbYPGQCh4WiYGLC2Eun4jrM23lp0FS
	 HtDq3mypkt6wA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cQZ9N5wG8z9rxG;
	Mon, 15 Sep 2025 21:00:24 +0200 (CEST)
Date: Mon, 15 Sep 2025 19:00:26 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Initial Amediatech X96Q support based on Allwinner
 H313
Message-ID: <aMhiSDKgc7lnv802@probook>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
 <20250912110222.5e4153ec@donnerap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912110222.5e4153ec@donnerap>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_120029_322576_1E9C12D6 
X-CRM114-Status: GOOD (  17.72  )
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

On Fri, Sep 12, 2025 at 11:02:22AM +0100, Andre Przywara wrote:
> On Fri, 12 Sep 2025 01:52:08 +0200
> J. Neuschäfer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> Hi,
> 
> > This patchset adds an initial devicetree for the X96Q set-top box.
> > WiFi, Ethernet, and HDMI depend on drivers that are currently not
> > available in mainline Linux, and I didn't enable them in the devicetree.
> > The builtin infrared receiver produces IRQs when a nearby remote sends
> > events, but I have not checked whether the events are decoded correctly.
> 
> You can either do a simple "cat /dev/input/event<x>", then check whether
> keypresses generate (unreadable) output, or you use the "evtest" tool to
> decode some information:
> https://cgit.freedesktop.org/evtest/

I get nothing out of /dev/input/event0 (the sunxi-ir device) or
/dev/lirc0, which is quite strange. After putting some printks into
drivers/media/rc/sunxi-cir.c, I do see the raw events, but they are
somehow not forwarded to the input device.

> 
> But I guess if you see interrupts consistent with remote keypresses, it's
> a good enough indication it should work.
> 
> Cheers,
> Andre

