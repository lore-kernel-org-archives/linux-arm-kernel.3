Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F46D44165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5Yti427vjItxR8gDApv3DIwkQAOytNVn88L/IZUW/k=; b=F5/P9OJEjuhdnhXf3obMxqpnK0
	2EJZWIF8iBWL8Te69jbefLXvKY9xq7T8RV9svjUuWzHMMr7nZH0TR2TU+K5NaHUgpXml6HcXiRnU2
	vMVCN0nwxSX8MmsQxbgjQL78hZ8lbgucSac8yCPsB/Z16jwN76fnXwx2bkL0nOOt28fCmmku0oBzx
	ZSmt27fqBIxWp/gPjFYdiN/RgGF0pOdH6Dmo5aloIH4X6CRLaFFK88W0y+ZRBHzaplKlFmeKoOzB8
	K1oEBEhvyjDLxCiitpnCE5elgULNoyADTJGVAJ00Un6p0nooY4l5QTWMjLjAt87Kg26X1ScqmISVg
	LF0dBDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPXs-0000000CjnR-07qe;
	Tue, 19 Nov 2024 14:49:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPWv-0000000CjgW-2rWo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 14:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B4305C5524;
	Tue, 19 Nov 2024 14:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9881AC4CED2;
	Tue, 19 Nov 2024 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732027716;
	bh=DaEi8UO26z5ignH1PEJ3LNN/E8nGWO1/gOyys3l7KTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWdlVinfVMv6wD026au4cvMZkWhlNayip6cTvjlLRhDwrIghUHG9tEC3c+a6LGLUa
	 o3/g3oywbU+ItcrYOLxHPuLup2dSNb/7xSuOCAKwAdnkpnYEfOMXtjtefDqDEunm6B
	 kUfksj67Fx4DmbKxHP5a6FS81oXuK3+hlv0BxCLjJUi7hwekAS+OOQcI8wEOZOp5rR
	 dA4p/+GCQQtR3k/RlmHAncNbgdWuhsRQVV8p+OioIs0g/n+2a/MbuBTexgJaGrlwg/
	 voiuVm51LFZZBJh8Vf8ABu5m/KYkSsbhw7almXrEICFEFtkeSwYkJtNrEiW0mYPKCY
	 NtP4QfYxwweYQ==
Date: Tue, 19 Nov 2024 08:48:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sota4Ever <wachiturroxd150@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy S20 FE (SM-G780F)
Message-ID: <173202771422.1534150.8231777309282960542.robh@kernel.org>
References: <20241114143636.374-1-wachiturroxd150@gmail.com>
 <20241114143636.374-2-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114143636.374-2-wachiturroxd150@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_064837_762670_11959FD0 
X-CRM114-Status: GOOD (  10.61  )
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


On Thu, 14 Nov 2024 14:36:35 +0000, Sota4Ever wrote:
> From: Denzeel Oliva <wachiturroxd150@gmail.com>
> 
> Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
> based on the Samsung Exynos990 SoC.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


