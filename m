Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C60D29F9D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cprnL8UiFwQzL/WrdFftKzEgHGjA7PfGU1YQSXHETos=; b=o67Lskqirnua+PPA9ahKuJLb6A
	sQf+XJZtZnNinF4umnmfk5OLudeftZxcBnFmjvxZSjEGkokaSlTjdF+gXWy1LIjACoeXKVxc5uCNB
	mwEqCCWlgwmrqxi3A+fwWmJfKgre0arTEKL3XsKAEDwwZl4w82p9GaCnOJmXOaWtvUZQ4xRIeGhQG
	Z/Pc3ZLmi2NU61MUag1GkLJoit3XscCbx0aTFwV0p2/bDkxNWVjH92pAEegKbbyxQT+w8cmK1RRg7
	A9Rn4Pc8muVdyNj22tbjdNbmwbnA+HRsBwqRPaRkpyxLvTEaRsjvIm34ulbJ7dSsQN6ZfzWNCrWKq
	AdUGLmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8a4v-000000023l5-3ysE;
	Wed, 06 Nov 2024 07:03:46 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8a3C-000000023ZT-3Gzb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:02:00 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 1D21F138013C;
	Wed,  6 Nov 2024 02:01:57 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 06 Nov 2024 02:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730876517;
	 x=1730962917; bh=cprnL8UiFwQzL/WrdFftKzEgHGjA7PfGU1YQSXHETos=; b=
	Bu7zWX9KLsSF8WY/LuaCK1MPoVWnK7l4Y0Llv7OHZeA7gSbfQevck3AgeRQ2qvwS
	A0ZQDKguQUOuCka+ZBJKqudJkbCjTdWfQaPX193UlGK6nOG9RIrfJK0KYrQg8XZ1
	r1RpuH/sbfX2d7fhVcqYrZfAVgdSjkpg2V6UQGvyP8tSGnQZ/1E+Sa68sgDxNcQO
	IFJrO1//EhADGVIU0MIp6QEqSY3LaaGnulJsppen99aCmt15OZwQ6P9XFSXuOMuL
	nop5bM4QuQIYJ7KWArKaude2uhh86EbD19xAmTBNPuqn/qjYDU8lxX6lNccjXuNX
	dPtNq/lwzoIECGDMK7NIMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730876517; x=
	1730962917; bh=cprnL8UiFwQzL/WrdFftKzEgHGjA7PfGU1YQSXHETos=; b=e
	9Q77xqHbWl/KJ3XbEP3ujy1zzen0vLcdby60M3Af4yXhkIoa36tzBb3qDn+u//S/
	iO3YFM6TMc9/TMrTwJvOcC/IZNTq4UlvQqDJYXSYntnguF1MevJxmvjX2OoVjcS2
	PBcqd28yuXYUxCElS0Jw3waO7nK7Wb4+IyCtplJv+IJ/ACviaXnlL0zz0Hlyd9rR
	hV2cNc4KOv/n1XDjnDY/1H95kKY8KAv/+mTn3+Zfid5jmlyizo4ZGLglMniAExKm
	wJGFEu5srp0Yu1pKYJ2mYgSasPrkPvlFl1cfNhboYqaWoRXP3tHcHvTI/bdDaJhb
	8yLSrDnq1DIUPwzaS/MQQ==
X-ME-Sender: <xms:YxQrZ-4PL29SD9AMNCjrk4Fg2oPhCy1s-z1Z1whB_-9yVRaI-_NXRA>
    <xme:YxQrZ364t_ptQHLMZsW_XrVTFKTOIyeTb7bXRlcyI5PoTDlXS5tHWonRATwVLGZB2
    7cBakYHBy_KaSn4W8w>
X-ME-Received: <xmr:YxQrZ9cZgx8Tqjtq3IES5qYtOJoDCEuTvUyg8R4JL3bNC7eLYyOCkZ3tyFYn2Vxkfuq3eIv2tBma-gZTqoITqqlHaCPSOMVmTGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddugddutdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepveefkeeuudettddvffevhfevvdekhffgveehfefhffehfeet
    gfetffeugfevfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtohepshhvvghn
    sehsvhgvnhhpvghtvghrrdguvghvpdhrtghpthhtoheprghlhihsshgrsehrohhsvghnii
    ifvghighdrihhopdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrod
    gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhish
    htshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:YxQrZ7KWIL1PLVuPebP1JPoj7LZvkenJ7gD4QKAymmGiswEcPaq5LA>
    <xmx:YxQrZyLan1K6P42UA47EhgE6HyUodfJpQKT9Ghcl1s3vVpO_6aBbbA>
    <xmx:YxQrZ8wISeA-D-fL7XRz-oJvFTh9m65ZaDvkzD1uG-M0GP6ljoqldg>
    <xmx:YxQrZ2KYrZPynxOMFFO_cBqC3lwgl8uRvvvSslDGpfZhfOGEXd80Gw>
    <xmx:ZRQrZ0B1WE2iuezHwdzgTKxzPlPsBLu-fGR0Fs36Jo5hJ-_5eee0Ncue>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Nov 2024 02:01:55 -0500 (EST)
Date: Wed, 6 Nov 2024 08:01:52 +0100
From: Janne Grunau <j@jannau.net>
To: Mark Brown <broonie@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] spi: apple: Add driver for Apple SPI controller
Message-ID: <20241106070152.GA928468@robin.jannau.net>
References: <20241105-asahi-spi-v4-0-d9734f089fc9@jannau.net>
 <20241105-asahi-spi-v4-2-d9734f089fc9@jannau.net>
 <947246c5-b9e6-43e7-a516-7b82136e6e8e@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <947246c5-b9e6-43e7-a516-7b82136e6e8e@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_230159_586752_184054BC 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, Nov 05, 2024 at 01:58:36PM +0000, Mark Brown wrote:
> On Tue, Nov 05, 2024 at 09:08:30AM +0100, Janne Grunau wrote:
> > From: Hector Martin <marcan@marcan.st>
> > 
> > This SPI controller is present in Apple SoCs such as the M1 (t8103) and
> > M1 Pro/Max (t600x). It is a relatively straightforward design with two
> > 16-entry FIFOs, arbitrary transfer sizes (up to 2**32 - 1) and fully
> > configurable word size up to 32 bits. It supports one hardware CS line
> > which can also be driven via the pinctrl/GPIO driver instead, if
> > desired. TX and RX can be independently enabled.
> 
> This breaks the build with current code:
> 
> /build/stage/linux/drivers/spi/spi-apple.c: In function ‘apple_spi_probe’:
> /build/stage/linux/drivers/spi/spi-apple.c:463:16: error: implicit declaration o
> f function ‘devm_spi_alloc_master’; did you mean ‘devm_spi_alloc_target’? [-Werr
> or=implicit-function-declaration]
>   463 |         ctlr = devm_spi_alloc_master(&pdev->dev, sizeof(struct apple_spi
> ));
>       |                ^~~~~~~~~~~~~~~~~~~~~
>       |                devm_spi_alloc_target
> /build/stage/linux/drivers/spi/spi-apple.c:463:14: error: assignment to ‘struct 
> spi_controller *’ from ‘int’ makes pointer from integer without a cast [-Werror=
> int-conversion]
>   463 |         ctlr = devm_spi_alloc_master(&pdev->dev, sizeof(struct apple_spi
> ));
>       |              ^
> cc1: all warnings being treated as errors
> 
> It needs an update for the retirement of the old API name.

A pitty that there is no good way to enable deprecated warnings just for
new code.
Switched to devm_spi_alloc_host() and changed the prefix for
the bindings commit msg to "spi: dt-bindings:".

thanks
Janne

