Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5FDC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENgg144+K/LFoBOMAkxQ/vRCNIFP/WT7XCgMLXS8a+Y=; b=fhKSHr44n3yBeNlwsJvGqqYs5P
	dF1UeIUxvgD5FzeRfsnI4hp6HJYPWNVkQyRyI4Ec8/wwMaj/BRq6yJOZJBpmQNbntPftHigxRMkJS
	sC1mFkicYQuQ4wbJvoNq9m0kpmQeD7QUKyHIhYXyvfcymkBl6n0oggPclgzlQJXjCBNsmmhPdkG89
	dzYuHCZbuF0G6IbZ9zaxUOF3h6P7tKM+w8GOeRhVg/DAeTHLHnESNAdqR0TBjqPTYY8YH+4fc5reT
	R+PLzUX6EOhpYEfFi9nGhhPqCcPafI+gChP6dFwGtucP7OAzSYZWgjX5ZneiO2oy1WOB0Tu0R/3RU
	djZ8Ec+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Efo-0000000BJ7o-11NV;
	Wed, 09 Sep 2026 09:32:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Efm-0000000BJ7a-1Msv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:32:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDD4043476;
	Wed,  9 Sep 2026 09:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77841F00A3E;
	Wed,  9 Sep 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946373;
	bh=ENgg144+K/LFoBOMAkxQ/vRCNIFP/WT7XCgMLXS8a+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3wGIwqQrnMdX2cCwOPhDa1Na7aLFlcNAymviUj2y8gXlRAjPSJVot59ygcg9ymkM
	 V3OKmePVMfM4a7OFuxN6mkG807GjhjzsmIi6TufRNu3lnrNbYuWngzMSV80lSWHdZo
	 vMZ7rzWg+MacSolN7WPbyVpDU5qOQ1kM1EO+FvHNSLPFbWnl9ZRcwjKNEtRHg66oDH
	 z2t/2Pcwl25eQ3EQhObI15zDiEzMx/x6T4CQRfMZD4OLiXBwEMoYVibIrSXQrdsVAD
	 X7bF1xNia1Xymf+FdA6YbQlP8r6xj/iWsFKh3BINwwfQGrIRRgIgHvkhK+CeHjiOOG
	 pjppWwhsJGW5w==
Date: Wed, 9 Sep 2026 11:32:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: fsl: add freemobile,nbxv3 board
Message-ID: <20260909-notorious-hog-of-rain-8bdc19@quoll>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
 <20260908-for-upstream-nbxv3-dts-v3-2-1d88b2c11680@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-2-1d88b2c11680@free.fr>
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

On Tue, Sep 08, 2026 at 04:12:44AM +0200, Vincent Jardin wrote:
> Add the Free Mobile Nodebox v3 CPU module to the list of
> NXP, former Freescale, LX2160A-based boards.
> 
> The board's root is:
>   "freemobile,nbxv3", "fsl,lx2160a"
> and the DTS is at
>   arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts.

This paragraph is irrelevant.

> 
> It is needed for
>   make CHECK_DTBS=y

So is this. Also not really correct, ABI needs to be documented
regardless.

Please use `git log` to understand how such commits can be written.

Best regards,
Krzysztof


