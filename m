Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26BA10D148A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 00:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcjE38flg+beXCyYhvfc5FSyv3vszAeQaaEqYfMJIcQ=; b=4NrcjHAPKh1wrTxN49MoQpDtWL
	fhqJh5KuJIxHnY3ulw6t6pH2kuTU3rofYM2tNXGJqFqkH/H/NpcFFSjln5xK6AZ5di8oVTj5s4FtB
	Rby0ZtBgA3vQqdAhPdLvirzOM5YTOx9NRV2rbDJpWgnrBEYXMs5BH+//tsVFVLrDIx6nxpLsH+Mny
	ZEAcNzyuSYqZeC/up8shaibc/H6UhQvmc7VoEUerBzCzpJAQunLCCdxHM3VmjmjkdvJuYpGu35O+y
	7pOpn1s1Xrf2eiZVPz15CT3m2GC0sha9LXIrR5wwA97e6kJe3eTjGprGD3kmYDbs3mHIz3v7QzYx/
	g14QohkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6df3-00000009P9N-340n;
	Sun, 29 Mar 2026 00:05:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6df1-00000009P8y-0QBy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 00:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xcjE38flg+beXCyYhvfc5FSyv3vszAeQaaEqYfMJIcQ=; b=lxv/6hvbzGP/4c4zEr2Q8luyNd
	xhBfyzkSNK3UwaeDM0XQhZTPo6PSZvgstOY2FjpTSHPPr7pD+ZtpA2U5i1pBHMyLUgxy0g+r4k3R3
	AdHyEp6Ln/1O9K7lvIRr0aUCkGuFvkJE7m7Jz1grPsHZVkEhCns1Gu2Zgw7Rx9ENC+Tw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w6dek-00DqEm-Fj; Sun, 29 Mar 2026 01:05:30 +0100
Date: Sun, 29 Mar 2026 01:05:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
Message-ID: <ed3d39df-0a0e-427b-86cf-b9b2d2094b51@lunn.ch>
References: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_170547_140926_F1AE3730 
X-CRM114-Status: GOOD (  17.07  )
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

On Sat, Mar 28, 2026 at 06:39:59PM -0500, Anirudh Srinivasan wrote:
> Adds the DT nodes needed for ethernet support for Asus Kommando, with
> phy mode set to rgmii-id.
> 
> When this DT was originally added, the phy mode was set to rgmii (which
> was incorrect). It was suggested to remove networking support from the
> DT till the Aspeed networking driver was patched so that the correct phy
> mode could be used.
> 
> The discussion in [1] mentions that u-boot was inserting clk delays that
> weren't needed, which resulted in needing to set the phy mode in linux
> to rgmii incorrectly. The solution suggested there was to patch u-boot to
> no longer insert these clk delays and use rgmii-id as the phy mode for
> any future DTs added to linux.
> 
> This DT was tested with a u-boot DT modified to insert clk delays of 0
> (instead of patching u-boot itself). [2] adds a u-boot DT for this
> device (without networking) and describes how to patch it to add
> networking support. If this patched DT is used, then networking works
> with rgmii-id phy mode in both u-boot and linux.

I've been looking at

https://elixir.bootlin.com/u-boot/v2026.04-rc5/source/drivers/clk/aspeed/clk_ast2600.c

And i don't see where mac2-clk-delay is implemented. Could you point
out the code?

Thanks
	Andrew

