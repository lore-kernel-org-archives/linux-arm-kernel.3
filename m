Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AE6C3ABAD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpYcoCSmBf9k9o0P39jyqYiBWRrYK9C3ngdTq1mO0sE=; b=t0OE7+H+/GcTU9qXj/wWZ3h/5m
	1Ybusk+jg/SD/uSYQoO5Y7knAlXxgOpohDIR8nyy/AREXCvgq8p3SR76JKcRePx9yghzNmozH71Vx
	wSbs2FKzMUN6GU4zlT6uj8eqLNeLf1VY5q38tXgPE/7mGruY+ef+HJgijU8GETu92WOTUzz+PZmIW
	MsX9L7Xh/dOYDw9zZbOnjXvzd9e/GxAuUK7zaDTt8LxAEim8Am23IqLrFPjMDNVD0qpACr7HCD8Oa
	Kp/FP4+rut1uK+Kr4oBKrhH6jHzZ6VM72Pg+rG0+PPrgo/YHCt0SVBoUtqwonVdIndp91dRKsCN5s
	T4pMwNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT4O-0000000Fg4J-29MJ;
	Thu, 01 May 2025 12:31:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASXi-0000000FKWp-2yVN;
	Thu, 01 May 2025 11:57:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6270A4B4CB;
	Thu,  1 May 2025 11:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8558AC4CEE3;
	Thu,  1 May 2025 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100649;
	bh=AaFZYNZaVoJdnT4CJkDiw+CwenfpvYlqV7aZGMXp690=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfPs0BOFLsZdNpTmh1FdTynzp23DXKkkIxax057Ff51k1w8vZZ+RKuJA7/JDu7Hph
	 X4wHVGmBW2/sHPBNUDziYUc5m6jD17F2E/67GCMoqiDJJGF6L1vA6V1j/tTyt8sCi3
	 gJjVE4wRNIMN35yYpLJF0Q0NehqftjQQ1GK8wBHSJ+RJqEaibETUTsrVE374flGRIe
	 Ficrw/H4B/TOonZxIpIfTlGiLFpBEGh3ZbLt51fzEtCvA9hrTd73cJgAsPdh8+jZp9
	 ZrU/YVHxyh7LRJJl0rb11iLes/8EgOHITgVbuvE7vTqzcA0BGCxU38v0S0VhJ91TfP
	 T4C/pghSNIY/A==
Date: Thu, 1 May 2025 13:57:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: imx8mq-usb: fix
 fsl,phy-tx-vboost-level-microvolt property
Message-ID: <20250501-jovial-sassy-rottweiler-9e416a@kuoka>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430094502.2723983-1-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_045730_810654_79895CC9 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 30, 2025 at 05:44:59PM GMT, Xu Yang wrote:
> The ticket TKT0676370 shows the description of TX_VBOOST_LVL is wrong in
> register PHY_CTRL3 bit[31:29].
> 
>   011: Corresponds to a launch amplitude of 1.12 V.
>   010: Corresponds to a launch amplitude of 1.04 V.
>   000: Corresponds to a launch amplitude of 0.88 V.
> 
> After updated:
> 
>   011: Corresponds to a launch amplitude of 0.844 V.
>   100: Corresponds to a launch amplitude of 1.008 V.
>   101: Corresponds to a launch amplitude of 1.156 V.
> 
> This will correct it accordingly.
> 
> Fixes: b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning properties")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


