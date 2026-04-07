Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2181FFF5134
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 19:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAYj3Czk1oUUWUZUdBnkkK69kXFDTguRUjI1xwumzIQ=; b=c8Kwg4IdOd8TdWBZLWVFPW3AzS
	+S9mjuXH/AsMj61QYGTY4Vgztyv3W5B46L5I5iPrKs7CwC4LlP2MIVbJW9p9ePMLYb+wNWkIoD45F
	qAYi1hF8Qts0YMtP5lt5CYaT9p2A6k25w5bH8m85jpCMYpUZG0KAwMtIjfVfBYx4659/IPN++SZP8
	0YsBF+kCIB8gClq5MUOjtjjQaaDJmf3/6/3WpHfnFAWW4LP8aEOIZqkD3mBTxr6axm0qudWCjF4rd
	w1Zm6q/AX9FXU0v89AnN7y4lJ/nWP/A8hIanUUcO6kjKGgCHElsxOMZ30tXKIH/Gy53KRCzwSfvbc
	SWRrLlUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wABpT-00000007APn-2rXU;
	Tue, 07 Apr 2026 19:11:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wABpR-00000007APN-2pLB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 19:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BF5743235;
	Tue,  7 Apr 2026 19:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0373AC116C6;
	Tue,  7 Apr 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775589073;
	bh=i+fig20ggwsT9pZlJH2S534mhEFL//GXWbZnSmgwt9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTVT5w2tU4EyoSvbsHol1yPfBqgnOVuEharMt+6ku2UFnYRiD7BhFCTiuee+ijdYQ
	 3ulJOpGs1IJ0PDBq7YCzgKKDqSg6T2dLqJ0/7vErGxpbxe4ExmP2871k7vcqq3WCGU
	 3jbjOAye9CbG8NYZcrIvhzCTFhG9M5F4vnBQaPWOSh6CWe5a70CZRrim2VLPNmVwqw
	 BVRg9v2Q0Hg4RFQ5ZyhNkXTJJDHftAj8RfQC/sUB+IkyF8LZguqaHNrIo3nrT6fpxA
	 gpISpS64OkOCkS/z13OPMRJjVN+EC50vcVC/o3RTaYvVorj8srS5te3BihkiC2KJdg
	 SwruxLCf6+neg==
Date: Tue, 7 Apr 2026 14:11:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Herve Codina <herve.codina@bootlin.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: usb: atmel,at91sam9rl-udc: convert
 to DT schema
Message-ID: <177558906473.3430958.14870529222355203210.robh@kernel.org>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
 <20260327-atmel-usb-v4-5-eb8b6e49b29d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-atmel-usb-v4-5-eb8b6e49b29d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_121113_728080_CD9EB968 
X-CRM114-Status: GOOD (  11.16  )
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


On Fri, 27 Mar 2026 16:47:46 +0000, Charan Pedumuru wrote:
> Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
> Changes during conversion:
> - Make the "clock-names" property flexible enough to accept the items
>   in any order as the existing in tree DTS nodes doesn't follow an order.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91sam9rl-udc.yaml         | 74 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/atmel-usb.txt          | 46 --------------
>  2 files changed, 74 insertions(+), 46 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


