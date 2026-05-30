Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0B9CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZOkOiUGphlye6XMDBEWeJg+3upNBwM3JqNA5E14kxQ=; b=VP2RVTDm5oHm4ZChROggaWsvpN
	OYP8IgidmpZKX3f/WtRHMCpA0frBdFs9bxH6pH9SCl2IOA/q5pXglNDeqG/xxb8L4iZ4qBGLTGurr
	mzcV9vuwFvGMp76zJ1vDOVU9FcKM6FpddRdcHA8P8/mpNKnhZW8+iKiMmHgI3Xfce865utHxFvZPS
	tf0p+ieFNKI8O8sE16giJMCO19+ndYSyjXsn0O94Y1jZ71lqcxElAFy6kae6k4UeN1ViwoN+lVXel
	JcCp1fyvY33GoB1bpDt7edru9zqeHKnLQAOfKHygSsOI8QP5UIdD6mxy5d9DeD7sN/Wv6ZhEE0Tyf
	CyUqUk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHEl-00000008eWI-3HYF;
	Sat, 30 May 2026 10:48:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHEj-00000008eVs-2Kn9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 10:48:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A94A740184;
	Sat, 30 May 2026 10:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49D91F00893;
	Sat, 30 May 2026 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780138092;
	bh=8ZOkOiUGphlye6XMDBEWeJg+3upNBwM3JqNA5E14kxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MP5c73d9myscEqyCSzql55cJ27CeS+f0OyRedHnif8Ny44lNNrYxpOuTIVQqlUmbf
	 iS1Lyx17qVCiER0uLQcw/OIH0j42Zi70dtGt9eAGTS/iaMEbnbbJWVK087lh5ZFMxM
	 A3/9LnhWwT0BqzFAtrPh16o3vvzNTryX+Y/nRsNJnx1fCvA1jtMqVZywrgd8KKCpie
	 uIVjnR//3JbS0erZg+8JCOyPZcGQIpSHvFTXXasBuyrM8Wjj+vFAV7YPzM1vyla2cc
	 NvugdXL2GIQfechTmq05Y2/AzeIldT2WGT955Dw4r3FgkJFM3d3094zUQVxzplrOvC
	 DkP0oorkhEPgw==
Date: Sat, 30 May 2026 12:48:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <20260530-unbeatable-supportive-wren-c27de8@quoll>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260524204537.GB110177@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_034813_666708_FE51F1E0 
X-CRM114-Status: GOOD (  25.37  )
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

On Sun, May 24, 2026 at 03:45:37PM -0500, Eric Biggers wrote:
> On Sun, May 24, 2026 at 10:29:28PM +0200, Krzysztof Kozlowski wrote:
> > On 24/05/2026 22:12, Demi Marie Obenour wrote:
> > > On 5/24/26 12:42, Dmitry Baryshkov wrote:
> > >> On Sat, May 23, 2026 at 03:03:56PM -0400, Demi Marie Obenour via B4 Relay wrote:
> > >>> From: Demi Marie Obenour <demiobenour@gmail.com>
> > >>>
> > >>> It's slower than the generic C code and causes problems.
> > >>
> > >> Which problems?
> > > 
> > > See https://lore.kernel.org/all/20260522024912.GC5937@quark/.
> > 
> > Your commit is still incomplete and other people's opinion is poor
> > reason. If you do not know what to write, ask that person to make
> > necessary changes.
> > 
> > Not mentioning that removing driver is not even necessary to achieve the
> > goal Eric was mentioning and if I understood correctly: you are removing
> > even the pieces Eric found useful.
> 
> This driver is more than an order of magnitude slower than the CPU for
> both encryption and hashing.  See:
> 
>     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
>     https://lore.kernel.org/r/20250615031807.GA81869@sol/
> 
> There are many examples of it having bugs as well, for example see the
> second link above.
> 
> That's why it had to be disabled via the cra_priority system.  This
> driver was actively making Linux worse.
> 
> This isn't particularly unique to drivers/crypto/, of course.  This one
> we just have data on, so it's a bit clearer.
> 
> I've yet to see any real reason to keep this driver.
> 
> Crypto drivers need to be held to a higher standard than other device
> drivers, as well.  The onus is on those who want to keep a particular
> crypto driver to prove that it's worth keeping.

Commit doing the work should have all these explanations, including
numbers. External references are not a proper justification for commits.

Make your case, describe the findings including impact (or lack of
impact) on ongoing hw wrapped keys work and inlined encryption for other
devices (ICE).

Best regards,
Krzysztof


