Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AE6F01804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzCIPpoaD9QQX7dBVHIK78hpgkrJQ9ROJhg4f0rn9QE=; b=mROb0la+Lr1ji8fZltQMTsx1sc
	/xHPpyXIqpwzCgigJqacuohiK8tvsJkwLAVB12nb/QxWnu190JxCycLkB3PbmpOGw4pQQDWI3I6i2
	uSYkYrp49NmdbtqqkFmEOhO/LsFS5Aw+2TZmzwhwgyD/mr/2qWzSF3jYlN4krWRghPhN15J6/CBA7
	GBzv9eVAi4cEojCJ3a6tAxqIL7GyDqYV8SA4yzw0qDK3UwY9m/DKRyQEPaShOQKkLB6gOvgFmZwGT
	kEAPnbTWYYKDVtS2q5cIMw1zvNXLgkQ1cO1oWipEdRvCbrIzlK/uv4Q42PagUNVhTrK8JktTFbTot
	RzMN1A6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQcW-00000003Gae-2scE;
	Fri, 06 Mar 2026 08:33:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQcU-00000003GaW-3I3v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 08:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3CBA60126;
	Fri,  6 Mar 2026 08:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05709C19422;
	Fri,  6 Mar 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772785993;
	bh=SN5+pzGWNBQz6tOepDPonTQdUd634bUktGHyYoxmwEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D33jCfOzP6hQmRqt0yEZJ81e7N++jbMf+uMWy2FBD75wnT3/xVstWsPVT37htqmMg
	 dVbfJk5I49PrB1dm5u/RutRJvG0A/G47n83jMN7eKhxhjoK1T+NNnwfeyszXecRBb7
	 sPptfG2Oo8Gxb2g3B+XUjj4Rr4LhQlO1/B1jP+vqROd6454zhZ4Mbl0Ci2o7kNIMFs
	 nho66IXZqp4Bf95Y/DwAkiLCGyZdlvPHGk5qhvTOqOHuxDKcMOlmJHFZzbIs+6qpoa
	 Eiz4d/GVnSCuMLTWOBe2K12b187MAc+GMzhfwSuQBtQxEqeEOTSPDjweDVoSsyp7pV
	 WT875zij2TRGw==
Date: Fri, 6 Mar 2026 09:33:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: fsl: add Verdin iMX95
Message-ID: <20260306-berserk-dormouse-of-efficiency-dd4dbe@quoll>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
 <20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com>
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

On Thu, Mar 05, 2026 at 06:24:29PM +0100, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> Add DT compatible strings for the Verdin i.MX95 SoM and its supported
> carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
> Mallow and Yavia carrier boards.
> 
> Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
> Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
> Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
> Link: https://www.toradex.com/products/carrier-board/yavia
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


