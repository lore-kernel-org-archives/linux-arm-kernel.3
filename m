Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD828D46603
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTQZnv34DAjTZEd7quvl5eWf+Bs88jcQBsc8cMge4ow=; b=Vm9lQmsSBD9g2CVxvZcz7ZqiaO
	srMS0A1w14zwgxaKHpmZ++QdRl/sZsXM9bsj/QeOuN9J6c+z2Ayk3wU/EO8IY6gNPrCZEozlxSMrV
	z7QgNFr3Jxl9VuyvzUUDNksOTVprJIBA45U6bT/wbEJZQRcdTSFpc0QzQ4W25/rJhBvKFabnWYqdF
	cRDUYavzpBs1EEps1OWIESKL0PmVhcvHizS0+ZxkaH+Mve+5HVkudMyEIK1Aur1l29aS+Ef5DVYzu
	TBCFfH/shtDOXtnT/+JISlTfFV3L4/z+wQo8xukGVvEj1e4pUdLPB4ThOEIzUTfyLGJ+I6LkiAHjz
	UUbcK9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQxX-0000000CpoE-0m1t;
	Thu, 15 Jan 2026 17:16:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQxV-0000000Cpns-2OIY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7D5060007;
	Thu, 15 Jan 2026 17:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E66C116D0;
	Thu, 15 Jan 2026 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768497392;
	bh=EoDuHPKYADtTQ3CbH8ajn3cz4Fwrwq6IKHjrNnSNqVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlESdXIRDi4LaDQt/CNKvfnKjJ7Y6Snc9KH+I3n6uqvXVDaiD4jZonAkz0RnY/GL4
	 GArii35s6IZn9a/VYHwwlHrTzMC3vtBQ3r7Ytdvly+/ZbnHNqztKL/2BdT/FpIX642
	 pXqXb8QllzIwqfiOB3DMMA+jIvzb/MPRjHqx9o5KgjbLEp+bDjg4MBGAUHkyvsfGkL
	 YAiO6lSUymNqEMVRqCF8UlmBAu5tURwePPF/G1aNsiGLYTLamyrpQmYvHf8k+ISQnT
	 9NVBQ/Paj2Z6XSTvkKb5IWXSVGtGudZO50YkPbINj2jsI9QIjJrNz5/9Vm5igbRy1Z
	 Hp9f4ilsveKnQ==
Date: Thu, 15 Jan 2026 11:16:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: Document smp-memram subnode for
 aspeed,ast2x00-scu
Message-ID: <176849739064.906870.7559981756194987059.robh@kernel.org>
References: <20260109-dev-dt-warnings-mfd-v1-1-1aabe37e9a14@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-dev-dt-warnings-mfd-v1-1-1aabe37e9a14@codeconstruct.com.au>
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


On Fri, 09 Jan 2026 17:05:18 +1030, Andrew Jeffery wrote:
> The platform initialisation code for the AST2600 implements the custom
> SMP bringup protocol, and searches for the relevant compatible. As a
> consequence, define the requisite node and the compatible string, which
> in-turn tidies up the dtb check results.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Hello,
> 
> This change was original part of an RFC series tidying up the AST2600
> EVB devicetree at [1]. Many of those ended up being merged directly, so
> I'm splitting out what remains into separate, smaller series.
> 
> Please review.
> 
> Changes since RFC:
> - Address the warning from Rob's bot
> - Tidy a description line that was dropped unnecessarily
> - Remove RFC label
> 
> Link: https://lore.kernel.org/all/20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au/ [1]
> ---
>  .../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


