Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA18C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFVhdNPjhoHrtnLl95wgqafah0cJHWjdbvVPIokm+2w=; b=alApaufMswwiVnlUIqG/5E2Pcb
	dQQRs4pFBQvcBgIJ5IZbdTkPRcJUPGC9usX4+pTNSKGV1Xi+rH/8WSR3P6OvoXBf3w0fGImRZWmR8
	Hhh6mIt0zN6FDzhNjkFjsthX2t2LHF++tih1BxYRdH5qmX5prz6yRkRJF0+vdLswqJbKqghbqLj61
	ZCISQjuBFbPBQOY/4Q/sytZA0klWKR4e7tC8oRVQqH9ncXIPMoqcxqEq9Py31ZU41ALInWNXum2EL
	Gm96aOLhizU0rOFPekumeQgE/CkIfFn/MSK8vfDqopQFzGE60FEebJY4mx610mw+K8+k6cQdShjiK
	86KxpxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFK72-0000000GRHb-09Gg;
	Wed, 14 May 2025 21:58:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFK51-0000000GR4y-0zn9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 21:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9939061155;
	Wed, 14 May 2025 21:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3FBC4CEE3;
	Wed, 14 May 2025 21:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259758;
	bh=B9AnOxBtfLbjXRuIemT0SPiTgpAkH53dyjMLTG03uJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8MVsKQkHOYg7EXRVD3ZDrSrO2k+hAlBFUJKCHvJ2fV+xipeA0DOsJnGHNQC06Bym
	 mDkzxwrtQgzVIr/O546cxLfSxSfhB6PJfNtDoHISvjUMshzvyovV7P5iM3Y9r4t3XJ
	 6dx7CBqfp6qF2seWxnY6DYrDT9uSjpvhUq9vgCqGSxBBvaWg1aPVRrDOl1EZhU6VfZ
	 ySsLVyfW6TgIpMQiT5aFHdPvCMsFq3RlQ/ez703BwVrbIzInvkx2QRXIVhYPWaSl6n
	 vJCnywafz84hvTTnvxTJkQoFO1FXNOzbuGt53PdvBWm3cUyb+ZrmWh8gPb1p6OcM92
	 BV/RbuekkgRjg==
Date: Wed, 14 May 2025 16:55:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: linux-crypto@vger.kernel.org, claudiu.beznea@tuxon.dev,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, olivia@selenic.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	herbert@gondor.apana.org.au, davem@davemloft.net
Subject: Re: [PATCH 4/9] dt-bindings: rng: atmel,at91-trng: add sama7d65 TRNG
Message-ID: <174725975592.3107278.8713820681723567309.robh@kernel.org>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <68e45a56e70e0b0b001870905917e8f7ddac61a3.1747077616.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68e45a56e70e0b0b001870905917e8f7ddac61a3.1747077616.git.Ryan.Wanner@microchip.com>
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


On Mon, 12 May 2025 12:27:30 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add compatible for Microchip SAMA7D65 SoC TRNG.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


