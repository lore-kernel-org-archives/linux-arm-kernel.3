Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BA4D35690
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzNRjNZ++sEseGt/Ra7+QgYJtUADHHDL2C2yG0SvrDA=; b=2tAXURq9jBc4f6bi3VCQGWcTMP
	DNBGRO8qlvlLvj2nrvJkWORDyUz3h5/tghNEI0bEfr25CmtTeUR46u1xZzdBadZmuYTQHJhUp8Hxu
	aLCKElJUb1YKxCUk+HLUxlsbIJEo2OQHvYDE8u7FRYrgFoX1PYdf6RoCswDW2TwBfBeBwRVnpxvpb
	Pzmjdgs5CsfapQ1zNvG6T/ayibFoCX+QqvHYEbJygiRd9rn1VnPdOpVfWx2nIXYBOqS/P+dIoDJXL
	muGrAvJEcQlD9bXX1qEE/TAr0dzFj1o+ozYmkzZ7MjzAhMqqdl8DTahho43FLD8JmHGDU6ye71Xln
	+iL2A1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0vo-0000000FfZx-1ua7;
	Wed, 28 Jan 2026 08:29:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0vm-0000000FfZR-3aLG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 08:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lzNRjNZ++sEseGt/Ra7+QgYJtUADHHDL2C2yG0SvrDA=; b=JlyFwdeRXF3c2f7ijVhCPel7Jl
	pDog62sGw1sNDlaDe3NPMHAVk+bSQmGpCgVRSsa2wCc9++OtOgTsM6ibJ2/yl5MGUcANTZXw+1LLq
	tkPhLM2ZJoB4xQWM1x0P9ozKTZWA0erkzD7qfeklpsgxslBa30jQE27qCEG1faewI+ZuF15uMRYY7
	BR9y9EZnb7wzvjSxQqQaSWGs0ygt7Vu7G2ob8t5d5zNLCYjumJJuMvT5886JN6EdaTuKGJb6MigPu
	p3Mm3418fulYV5apTaX0Z7sazTNtlpv+ne01Yv7hxNRoZK9PNOt9xgSNYETzdXJKsCJl9gtCaKyvD
	00Gl66aw==;
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0vj-000000089Gg-0IMI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:29:41 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 99A501D00141;
	Wed, 28 Jan 2026 03:29:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 28 Jan 2026 03:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769588973; x=1769675373; bh=lzNRjNZ++s
	EseGt/Ra7+QgYJtUADHHDL2C2yG0SvrDA=; b=qKk3ceXtv2q0vSNFXERPGLWY24
	vqOeN+Ef3o27W9d/3O//372A2ML0ePYvNo4qtEsbHt9TZ+51n0QRNHN0ISM796/v
	Ewj8B8/zki8QvCHTL1OhXgaI3K8QowNBiOFGcvvyjslySqiKZyfiIaElizV0wQ04
	G+qGM+BJPHjzYqqNPhSBU3bIXhAHPhVxFAEKXbD+s56luEikb1lpIyEVK2pKJsmG
	oR72Y126dAXRFCevgKa8DXjdUd4EqpkIbaCw/BI8kGd16Hp7ZkPcAfUf+s72564K
	gsiHee5yfh9b8XhF1dzCV/r+yAJ1WOE/Jz0eOMQYlBv7PxZoqyH1DjkkBScw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1769588973; x=1769675373; bh=lzNRjNZ++sEseGt/Ra7+QgYJtUADHHDL2C2
	yG0SvrDA=; b=Y3CvMSA+oXcT2o8XYPc1lDo4S+gPxHcjeRI7pF22GNJWYWxfnWP
	1vCooNPsM8Qs9xG0Ekc3pz4v6N34yjq4BEcfZzqn5WQvnlzCe7ckxUuMvM8zo6Uy
	6XFipqQCFYikF2QnJh2rGlRUr1T8bBbV004uNQAHcGe+VV7pklOIjC5Su68emC+V
	Biz02ZBwPA3Qhhz936Mpo8mJO1ORZ/BJ/4hwx9yiN8v+jQjky1UY0Z4QWTD/Rqe5
	MTEBF5qPixI/vosHKFsLGPxXM8dOIFPS1P44JGdGpdDmhLRMA2bvhn1xR/bbuxIu
	4SW8WgxU8QSZH4UNoJy3KT7v8T54/BUkBLQ==
X-ME-Sender: <xms:7ch5aRa7h8dCaQzqAGFVZ_v1ylNY3ld51l7XSXjwqdLAINtj1oEqsA>
    <xme:7ch5aQl9mjWSAio5ASn_H1qljXV2oTcs_4UKhhtbjhQE3if1EOJFRghyncCt4hdZ7
    UtsdZmnG6wwDpRV1mf8uyMWuJGCRkEYdyjxwiz6rNixbCBtwaF9jw>
X-ME-Received: <xmr:7ch5afgU5DrZpU7KKJvGHJE1tM6LLgS90ZooMJsjExpIA8k5bYs2FLATZAE7DExZUUXdYFzWGy-ikyY-7PeQYT-5PKiLT2uk0_4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehtghhlgieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthho
    pehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:7ch5aaRDDMUZbL5aKNd0NsSm6EV_jfw9QE6-LOQymmkb-Zwsrzgt2g>
    <xmx:7ch5aYZofHUfeH7tcCUHonMwk7BTrhwuBMDXTu1uKRh9C3jN3IMB0w>
    <xmx:7ch5afS3TVLs-lDu_I4QuSGRtBIPmXEif-J_NTaecTyny1kmPRS51A>
    <xmx:7ch5af-lF9t_XKCj32sWHJMAwhYeLEpPCXYxHpK7dDGlsH2IbxRKfQ>
    <xmx:7ch5aVGeJiN1Vi2OFOdWOHF3qO5qx_faxELUvo02cZdoX0Il6jdU8z8Q>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 03:29:32 -0500 (EST)
Date: Wed, 28 Jan 2026 09:29:31 +0100
From: Janne Grunau <j@jannau.net>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] irqchip/apple-aic: Add support for "apple,t8122-aic3"
Message-ID: <20260128082931.GC1667597@robin.jannau.net>
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
 <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
 <87fr7scqxl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fr7scqxl.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_082939_773450_6F3FD442 
X-CRM114-Status: GOOD (  11.33  )
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

On Mon, Jan 26, 2026 at 04:52:06PM +0100, Thomas Gleixner wrote:
> On Sun, Jan 25 2026 at 12:08, Janne Grunau wrote:
> > +/*
> > + * AIC v3 registers (MMIO)
> > + */
> > + 
> 
> Pointless newline and please make this a /* Oneline comment */

copy-n-pasted from AICv2 (and AICv1) above, changed locally for v2

> > +#define AIC3_IRQ_CFG		0x10000
> > +
> >  	}
> > +	case 3:
> >  	case 2: {
> 
> 1 3 2 is a weird count order...

version 3 was using a fall-through in the intial version so the order
made sense then. Change locally to 'case 2 ... 3:'

Janne

