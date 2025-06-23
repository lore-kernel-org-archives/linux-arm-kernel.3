Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A806CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UH1bAfPgsbTdwQOw++nDUnjZRfZFJJLgGsLVCvJ6ahA=; b=ujScqoHgPgk3RJ8wkAQA/zSpQz
	2y65Gdk9gXA7OlqCBNzPRjNI+h5znM7Pwq4cbkrNj+IM3ne0rTWxm++KNR642FoQnkGB9marsXE9A
	9yNrgX8EHBl94OKRlhsv1KwxyMyah6aXQR8OGdWqc36DeOSIszZAFOQGC8yDrW6SPYHgQbvPpLDed
	yUYKAHFyCAu/3w0g50FOuoCTxV5yLKbQnfQbElWv2N3TuN2Z4/NBAsYGYqhnLXAPTsdQqHNr5N9Zo
	RG94tGqrwmAAjkUHQWyeNatQW8gTLiFIfGwb296Rsw/mp2EE72SM96R8gNlfvROeMEioG5XOMmRuz
	JuB9Ta8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscU-00000004Nug-3D31;
	Tue, 24 Jun 2025 01:38:42 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpWC-0000000469y-1YKT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 22:20:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89E8E43881;
	Mon, 23 Jun 2025 22:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750717196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH1bAfPgsbTdwQOw++nDUnjZRfZFJJLgGsLVCvJ6ahA=;
	b=idfOPu6CKmH+9DH+hAvWkFB5OofPXN392rj5MHDlHB7xm5A8JpjB/Ngp7ZPM83CWguuY3U
	SsIzspdvUAij3+0eOVlPVAHFCA4wtw9YCQTKyzr/Cgk7NwEl/u3VW00Rz+SGPTO5k9v0Cj
	74swYO9CSSSYiqJU01Wr3uTG3QKqeR1khIuQnv9qKVcZc6Qie+rE7jL4gEuZtOrroZGXbQ
	Dd70dgWo6RiOyY8V3o/XAzc++Hwm/8uGcEyKgfwQhVbnyXRdJNvj5dYbEk8x0fGphnqbWe
	mmaDYf8MBvvzHPZZ5/XXCsf7JIm+N7/LT9F4L0J8S/68pbTpJUOvNxq0YAd5qQ==
Date: Tue, 24 Jun 2025 00:19:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <202506232219552539103b@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
 <20250415160212.GA372032@google.com>
 <2025041715425693974c6d@mail.local>
 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
 <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
 <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveduvefhvdehlefgieelfeetudeugfehgfeugfekleejueefueettdffueetiedvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinhgrrhhordhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhnrgifrhhotghkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtfidttddrtghhohhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprghlihhmrdgrkhhhthgrrhesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_152000_546454_09B15AF2 
X-CRM114-Status: GOOD (  19.08  )
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

On 16/06/2025 12:33:21+0100, André Draszik wrote:
> Hi Alexandre,
> 
> On Mon, 2025-05-19 at 15:41 +0100, André Draszik wrote:
> > Hi Alexandre,
> > 
> > On Mon, 2025-04-28 at 19:17 +0100, André Draszik wrote:
> > > Hi Alexandre,
> > > 
> > > On Thu, 2025-04-17 at 17:42 +0200, Alexandre Belloni wrote:
> > > > On 15/04/2025 17:02:12+0100, Lee Jones wrote:
> > > > > >  drivers/mfd/Kconfig                                |  35 +-
> > > > > >  drivers/mfd/Makefile                               |   5 +-
> > > > > >  drivers/mfd/sec-acpm.c                             | 442 +++++++++++++++++++
> > > > > >  drivers/mfd/sec-common.c                           | 301 +++++++++++++
> > > > > >  drivers/mfd/sec-core.c                             | 481 ---------------------
> > > > > >  drivers/mfd/sec-core.h                             |  23 +
> > > > > >  drivers/mfd/sec-i2c.c                              | 239 ++++++++++
> > > > > >  drivers/mfd/sec-irq.c                              | 460 +++++++-------------
> > > > > 
> > > > > >  drivers/rtc/rtc-s5m.c                              | 197 ++++++---
> > > > > 
> > > > > MFD parts look okay to me now.
> > > > > 
> > > > > With Acks from the Clk and RTC maintainers, I can merge all of the
> > > > > driver stuff together and submit a PR for others to pull from.
> > > > > 
> > > > 
> > > > I don't think the RTC part depends on the MFD one so I was going to
> > > > apply the patches in my tree if this is fine for everyone.
> > > 
> > > RTC patch 27 does depend on the s2mpg10 mfd core driver (due to
> > > using enums and macros introduced there).
> > 
> > Lee has kindly merged all the core driver patches.
> > 
> > Any chance the rtc changes will make it into the same kernel release?
> 
> Friendly ping.

I've applied the patches, I'll try to send them to Linus but there are no
guarantee they will make it for this release.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

