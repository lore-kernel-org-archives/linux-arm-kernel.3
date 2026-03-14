Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0DD10706C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VT63MoyDk2yYg/aMmxJ3ylplQ1G1el+CFqngQaWxD9Y=; b=d6l1z69xcct75lokDeRyGYFSfd
	iSiT685nsm7w7HWnKbMHTtvVG8+Z18plxkY6zp3bouUjHM3UyuJ9vUk4RhTUfHWa+O6V4n5Qb/1N2
	8bziPec+bURsKWT3v7uABfXmxcntM+jV0V4IeiZEjK0D84ku+Ty+OW7MD1Mdzo+nTumMBmXqLAlQC
	FrKUDC6SviYwgfI7JSdpWCax0uXKti4SLqnnD9++P2WM8Dx0GyZwRtC35KO3xCW6l/pX+fp7/Zi7i
	oMwkowBy8tu5hZu/2RO+7JWscsVx/NCbW3S3hOjohoEw5W/L/uq8lkbnqA2VDqgkctYIrzm/OSKWs
	+0rHSXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MAR-00000001kAv-32k5;
	Sat, 14 Mar 2026 10:24:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MAP-00000001kAJ-0xcs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 10:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBF10440A5;
	Sat, 14 Mar 2026 10:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F45C116C6;
	Sat, 14 Mar 2026 10:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773483860;
	bh=Ml/lEKonYkIliYF/LMmTBJQ2qVPdHCM46twoQHPrNRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQDW6WnVIy3RVOdnc3BHCsn3XXqrqpnd2AvzdZZ6jrrQAw9WJsdW5yO+Ppow/KV3y
	 FtgNQaV9jv2MDtwed31KOHgxokOTuyavl8vkljbG7mau4u+XMfn9U/zgDQ40dbWWwT
	 A7NErRvwFl4pfvg/tmLP5Oz1m2Cl8KhkTCbFXj64+ot8INpfqS/Mz6PyxDRN0AE1kj
	 7vHEnSZDW3XFLMGt+N+SSiDPrJWbNG3kvB3dYMsBoBGEBrBbIdZflpxniq2ioGg6kj
	 RJW34RJhg12PgAlPWmt4uRL+ghUyONP3iygDFL0397wIr33UbzzkbC8+uz8CSNQA2x
	 qMomNsmNPtbSA==
Date: Sat, 14 Mar 2026 11:24:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mmc: sdhci-of-aspeed : Add ast2700
 support
Message-ID: <20260314-perch-of-eminent-swiftness-e4efcf@quoll>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
 <20260313-sdhci-v1-1-91cea19c8a67@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313-sdhci-v1-1-91cea19c8a67@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_032421_283945_C54FF256 
X-CRM114-Status: GOOD (  13.26  )
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

On Fri, Mar 13, 2026 at 01:27:56PM +0800, Ryan Chen wrote:
> Add the "aspeed,ast2700-sd-controller" compatible. The ast2700 sdhci
> controller requires an reset, so make the "resets" property mandatory
> for this compatible to reflect the hardware requirement.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index d24950ccea95..a2ff9a94db13 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -26,6 +26,7 @@ properties:
>        - aspeed,ast2400-sd-controller
>        - aspeed,ast2500-sd-controller
>        - aspeed,ast2600-sd-controller
> +      - aspeed,ast2700-sd-controller

Also, not matching your driver.

Best regards,
Krzysztof


