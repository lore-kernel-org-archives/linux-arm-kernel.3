Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0416FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTLZpKkP/TpEQa2sQwhu9N+/3VYpz5v7LC9KsygUVyw=; b=xPP/ahvTQfhGR1vK2X2kgIU/rN
	4kw5mmAF7zIyv+vbceiFpPoIglfKv5jO7PFXlZzWPaP6dFS4yMKHLnZinBI5eawe2MpR+QmzBm0Nf
	DfL8C7Ui+hgFnUga1U/VOOHWfSRTfofZjqv9N3+EJf1njr733+s3uxXhRALGXPvpYNGsh89t8kN0h
	VePfZdWkPgMN8s7Q3riZ/tAW1wCM3S8om/UbZF+6p9oqfUhfM8dMeblCmFn9YHuDMXNoFtePuMx9i
	55tJJcd/fx94T0kaLDkdHRvKkXSwC7Hnp4B6vPGvqxOdP9Hrpmr8fAFBDwPKDUq+9odcqOx4V+SDp
	S17Ln9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uot6n-0000000FIco-49aW;
	Thu, 21 Aug 2025 00:24:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uooBW-0000000EkPd-2hz1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 19:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10CA6601D7;
	Wed, 20 Aug 2025 19:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CE2C4CEE7;
	Wed, 20 Aug 2025 19:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755716961;
	bh=QApGMDIX6Oj5p80GmS3mkapVrvJtEATwOMN/ejypAzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMO/A7aHQeBqF2MDvumZjS4atHCyocjn0dxcWaVVrr4owdSOGg/cxhEqkSGvU+LaY
	 WyZpUR0UpGtOqATDz7Everx1X0EJHFu7zkrXD0jTdJwFvNiHFEE5RvG/frZH4fggjp
	 //cW7FpGe0b0W9aKlCtjdkCDHZxPJY7bxfUg0G9JlMFln5npl6BJD8A9b+JXGd2Tt1
	 CJ/SmZVbNRPGjIexEbCiO8cAM++PDsE3Qop0RDlP1XwGtE5HJEw3mjRiqm9XvzJMqv
	 Z5c/aDFatfpqZoQyb1aQlWBwiYmRYuzPuhua1S5RG8uVyf4EmjTEZFs/jYTBrLKhpb
	 5z6cjMy6houFQ==
Date: Wed, 20 Aug 2025 14:09:20 -0500
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: apple: t600x: Comple WiFi properties
Message-ID: <20250820190920.GB538860-robh@kernel.org>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
 <20250813-apple-dt-sync-6-17-v1-2-209f15d10aa0@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-2-209f15d10aa0@jannau.net>
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

On Wed, Aug 13, 2025 at 11:53:34AM +0200, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>

What does 'Comple' in the subject mean?

> 
> Add compatible and antenna-sku properties to the shared node and
> brcm,board-type property to individuall board device trees.
> module and antenna properties
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  arch/arm64/boot/dts/apple/t6000-j314s.dts      | 4 ++++
>  arch/arm64/boot/dts/apple/t6000-j316s.dts      | 4 ++++
>  arch/arm64/boot/dts/apple/t6001-j314c.dts      | 4 ++++
>  arch/arm64/boot/dts/apple/t6001-j316c.dts      | 4 ++++
>  arch/arm64/boot/dts/apple/t6001-j375c.dts      | 4 ++++
>  arch/arm64/boot/dts/apple/t6002-j375d.dts      | 4 ++++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 2 ++
>  8 files changed, 28 insertions(+)

