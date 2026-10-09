Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C255CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g12nnmx2URm15ceIKI7TQ1hob+O8zuALvg+ycI7aBOQ=; b=CbnyRezvikqz0uQ/+DmC+5ODzg
	UffLf5+Y0wSI974HDKnMf9+h8DUFk1AFHDsKfVdGDbR1hRIBgIrP904RafQoVcoZNHMTYKGqArb40
	Hu1j/aKOSJ1Di+sZVXQx5E2jdkuHlNkhx2Zp/pit59TBk7KSGoxBiNM2JDQcsLCElrvSF6rQJfgVm
	zT3jmfYXjRWe4ph8WvWLfAd5e0TMnxYr4FI1MZR21lGAMVDbtp64ajoTxKsrDsj/r3YkplkusFy2f
	7YUAuwyLz/1iljbiBKrZRBGjpPbMoFBHVOXXWeEq4BchTcIruaKjjput2NugLu+ZluPvs7lMGO7Jb
	jFE4B1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7sy-000000064Qu-0Eie;
	Fri, 09 Oct 2026 10:31:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7su-000000064QT-3ryg;
	Fri, 09 Oct 2026 10:31:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D60860DBB;
	Fri,  9 Oct 2026 10:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B30B1F000FF;
	Fri,  9 Oct 2026 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541888;
	bh=g12nnmx2URm15ceIKI7TQ1hob+O8zuALvg+ycI7aBOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K/kRAwFY9Q+MWWgCT3W+Q7iElzNrv5q3mGba5eAbc6Du5nrDbhqp/oigOYRxiacmj
	 9z2DF366U6XE8r7IyKSUN7iRHmRpidMGrqBMCqyUP79gV62mJnezWlYkx+jyqL51WS
	 6D4XUbh9TqgnTmejUj21EENabGH685/KDjgmrxURCp630//qOCi5V1ukDYraKdXFBb
	 e5I44YFaI0srFzYCgEgsF1LQ4QMIZrIygxeU/nCEWr3Ma6e570+40g2DVFx85JOpNa
	 tefA6Irn7hqOLqh4wO7bLvMM8XxrIvP6u2dzZcbB+bLAuO5GwoaD80UxkEjAddWmZc
	 CzXcukw7iQ08w==
Date: Fri, 9 Oct 2026 12:31:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
Message-ID: <20261009-vehement-mature-mackerel-f7bc87@quoll>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
 <20261008-aspeed_pcie_phy-v1-1-96764937aef0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-aspeed_pcie_phy-v1-1-96764937aef0@aspeedtech.com>
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

On Thu, Oct 08, 2026 at 07:28:19PM +0800, Jacky Chou wrote:
> Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
> The PHY provides the physical layer used by the PCIe
> controller when operating in root complex mode.
> 
> Describe the compatible strings, register range, clocks and
> phy-cells value required by the PHY provider.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
> new file mode 100644
> index 000000000000..686b2e3d9457
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml

What? v9 here:
https://lore.kernel.org/all/20260115-upstream_pcie_rc-v9-1-d6c82a1556a7@aspeedtech.com/
from the same person, reviewed, but you ask us to do the same work
second time? Really?

Best regards,
Krzysztof


