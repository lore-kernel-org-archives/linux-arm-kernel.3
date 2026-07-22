Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C78DC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 19:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/13IFkourPJ3q+Gp0lTQXJ7Ps7+KWl80QhcTpK/ZKb4=; b=r3y/PgP6apF8mTvt+McBFP9brY
	7w9kI11Y/OyCUFC2UuVqyhQJ2wWHFMIiUeV/fqcmI2wDwJmBjM9kaCbbzwkJY8ZKwV7EnFuarn6iH
	LAlwiYU51aB1Hx0zhMUthUGCNU2ceBLyfyNDFOchjtBO+eOU0ef/icMGCUYiv2YHFXU6afluhimxc
	FO0QWEB72EwH14a1YcozTeHZfH/zGzc5BIR8J8nGpVuW3IH8QLj0k3yLElp/F4h7OBXhLeIj+V4pm
	Ymr1+oGJOREcUrZ6wVkEcm9yYk5n/FKNvYnxNIqPPEuCO3t8sjVdWLEqMhS8q6AO+BWt/LccvvQLX
	eUZ21axA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmd3l-0000000CfX7-3lv3;
	Wed, 22 Jul 2026 19:56:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmd3l-0000000CfX1-0dmV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 19:56:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1288142455;
	Wed, 22 Jul 2026 19:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD6C1F000E9;
	Wed, 22 Jul 2026 19:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784750209;
	bh=/13IFkourPJ3q+Gp0lTQXJ7Ps7+KWl80QhcTpK/ZKb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ERXAovC5lP6dgMDxc7azFX/mcUyyspLfo7aPNJxkjChKLzwZj5sDA7Teh7Pn79bxq
	 frCrORlm0jkSZ7FBBjlA5Dc6eWuAxJo03RDvycMKosJ/8yLamF9XqbzMGj9yktXB8G
	 2xRPH+06zN04ZdtBwcXKXbigqMH2qH/m+pC2FgzhEm37vmCPrtfkvyUcf5Mw5829Kj
	 EcVI0OWhjuA/LzYBOWApWrGiR1wptJiIPJHk5GfNsA9Bi0qNR1UiQ4OtSc4Cwgpxgo
	 P7gBM+G1oXn4oj+0t0907SaSr4pxg7ohFDaxubbWBXgjMBc6hhzW+vGEODq6UE7xml
	 0hfwBmsCtco8g==
Date: Wed, 22 Jul 2026 14:56:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: justin.jiang@nxp.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, joy.zou@nxp.com,
	Frank Li <Frank.Li@nxp.com>, qijian.guo@oss.nxp.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX952 FRDM board
Message-ID: <178475020884.1686663.9740518227138895376.robh@kernel.org>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
 <20260720-imx952_frdm-v1-1-6d145eaaa5c4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-imx952_frdm-v1-1-6d145eaaa5c4@nxp.com>
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


On Mon, 20 Jul 2026 15:28:53 +0900, Joseph Guo wrote:
> Add DT compatible string for NXP i.MX952 FRDM board.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


