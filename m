Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDD7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0MLUzu4/38/rnGJWlGUx8+09X/UZJgiNMjr2bABd+o=; b=hBMh7pcDAjqFqYiYk7c9/wfW/a
	y4+t2iPY2ks1Ivu95Su2LH2DfIEsNvOI1Av/atPRqJ1yWpyoZFY/MnE5cIWCOjd8x5BS6LoToIu5F
	Lb/4BRFZOTtRwts95vCZ96U5b78CjXfNcv760fp0+kBu7EriUUPhekzYdjUJwyCwxQlS8JaVXpZ5Q
	l427cvx0JadGgTf+V3919SXkqIrQffUo187/OY38iBhMLcBAsLbRywuqCU9lsfMd5nyHtSf5FH+nY
	v9GdA/9v/x1fmhTok2s2YNy1fiqMWdxZaznkdFKlTNcioGX9m23D5EEoJJx2g5K1qH06IPseTnE9T
	EEFNefKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGzn-0000000Ghg5-0WIM;
	Thu, 16 Jul 2026 07:59:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGzl-0000000Ghfk-3H0m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 07:59:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8943D42E7E;
	Thu, 16 Jul 2026 07:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25E21F000E9;
	Thu, 16 Jul 2026 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784188741;
	bh=t0MLUzu4/38/rnGJWlGUx8+09X/UZJgiNMjr2bABd+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a3+2Dbelza/k2TLM3XoF5e9KFenkg4LEg6+mY40znphC2+LfGks8VxxltmEbEE0DV
	 ROrNX0AYnzCCL8PmAqF439DkOII0i9xS0jdvKqmnL3Mk5WUjY0DVwg7k+EkW5Hjyj2
	 OF4ejYshlmcUQf3nVcBMnVNdigTka4+gom0w9FUoegGvhlcTyTRz7uhlm0o3fEr/Is
	 JvI1tCmH2Yo79eBCF+u8tMfU6VyP21UX4rgUC9e0Jdhtl/flB+RDF9rKRvxEOKLsLp
	 GdMHSXfkqxopCDS4vzcUybGjNunNOs7SdxSCLNeC+BuKrY7O9aRf2bF4F+I9qJ1hiK
	 XUL1F6QnnPrkA==
Date: Thu, 16 Jul 2026 09:58:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: net: altr,socfpga-stmmac: Add
 altr,socfpga-stmmac-agilex5-tsn compatible
Message-ID: <20260716-turtle-of-massive-thunder-be8283@quoll>
References: <20260716021932.20037-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260716021932.20037-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716021932.20037-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Wed, Jul 15, 2026 at 07:19:31PM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The Agilex5 SoCDK TSN Config2 board uses a GMII-to-RGMII converter
> implemented as FPGA soft IP between gmac1 and its PHY. This converter
> provides the RGMII TX/RX clock delays. Document a new compatible string
> for this MAC variant so the driver can detect it and configure the
> interface accordingly.

Last sentence is completely redundant. You are not supposed to reference
drivers here. I even EXPLICITLY marked this with BOLD font (as a common
mistake) in DTS101 speech.

Explain why devices are or are not compatible. You claim they are
compatible, but driver still treats them partially incompatible.

Best regards,
Krzysztof


