Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9894CC6B3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+I/3X+irMuzq/3rgZ8Cj+WqCOlwwkdDBCPYtiBzJmY=; b=MuzkzIC6YzQNpDv65f30M56hGN
	jFoI4IpYQ4gtD5CsrdMvw1r79wvX4zV7Mv/+F8cT3KRMPYBxtB6jpyEM9FqPFOm9H0GGyAxsfJ2fK
	pRkr3BusjBx7CgAcsDdtREQ3kDBxKlVxuMoLZSunjRot+06X6H7+ctDMnT+UN2XWFa98u1I5aAO68
	khnIZeY25fHxploY1cBEWSUvWfQU45trrW6E99W+18PNI04iDtKuRG941vT8vW4khmNyjhfCrjlR1
	YvujfAqVWeSoU0H41NqJDC28gfgs0ajfpbTeB/aiwryRCAC2p944AFIgsmZPN6EUYVXX2Fb4Fs985
	4wk7pO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHsK-0000000HHf5-2RUv;
	Thu, 15 Oct 2026 09:35:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHsK-0000000HHew-0QfT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:35:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99053402F9;
	Thu, 15 Oct 2026 09:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804001F000C4;
	Thu, 15 Oct 2026 09:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056947;
	bh=5+I/3X+irMuzq/3rgZ8Cj+WqCOlwwkdDBCPYtiBzJmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LdZWmYvwFv1u17wMa2tZYnb0BYEDsvSPOHar6lj6RIcNgNU//Z2nDtOMxKC93t2Es
	 Yi2OIEnZ8AcvRCC0ufFGbQZekKtAa0ckUjxnNLp+fI3vjr/6mbFSCpzp7xjpbA8jB1
	 +H4snZkgp8yxmr4WHyS9mlqLQORO4TWT2K1dYJEBoysFm4ThQUyDUDdzuN/Mm02QZX
	 cLfsTFbH3pcNa3EmJSK+T5jQGJnuhzGKvhNzNsWEdFvBfSiuk98reiZfWs7x/wajU3
	 cu7+TV/jnMocNhoid/tfIXiiuy4LZOSOT6Cw+HlJqzNbXSOs9Py3eI6RngMsLaL45V
	 m0kvLulgP2IUg==
Date: Thu, 15 Oct 2026 11:35:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash
 controller binding
Message-ID: <20261015-khaki-gibbon-of-persistence-a552df@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-20-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-20-ghahramani.navid@gmail.com>
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

On Wed, Oct 14, 2026 at 08:20:59AM +0100, Navid Ghahremani wrote:
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - zte,zx29-qspi
> +      - zte,zx279128s-spifc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: work clock, the source of the SPI clock
> +      - description: register (APB) clock
> +
> +  clock-names:
> +    items:
> +      - const: wclk
> +      - const: pclk

Where are all other properties your driver is using? DMAs? Resets and
whatnot?

Did you actually test your DTS against bindings?

Best regards,
Krzysztof


