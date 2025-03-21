Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DA6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 21:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ub4NJLTCmNC8PLQMEsKYzWE8LoAtBXMJm+3L1r28Cek=; b=PCP47orvevZbrfwGJPsIvEJjqu
	Crio7/3gPlSQGbID7ViiBDqF+UgEhgMeyUFzCfjeAQKBwVnK/SORxlCWWHrtmr6PacLMDmzj/+Z1H
	fIQBicmc9aCYX8z+wgwibRzu6ZGgiaQQPKav7qDjRVEMqXm7fHv8LgXcpKz9VFYs6kd6YEhvMzRoX
	B4I7OYj/hXpJwPT/NQsnTi103Z9NdxL9vF1w4ZtQtFsGH6uC/E9YkRyjLjAh0J9p0DNS7HrB8yxWA
	SJ0wyNplgt8xRGj9WZSnNOyEhcROtOb5WaGE1HUgkgcoc8fYPR6tmsgRRq2DwDncC9Bv7nKDQSV76
	ACgvSGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvk7e-0000000GOF7-3KGT;
	Fri, 21 Mar 2025 21:41:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvk5y-0000000GO4H-2bYV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 21:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C1CFA494F8;
	Fri, 21 Mar 2025 21:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122D9C4CEE3;
	Fri, 21 Mar 2025 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742593201;
	bh=uG1o0DY+GJVVCupYP5Q6vsH9tFoXa2TJsrh44k6zKl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6Pa/PehUaF69lIIfMgtgZhuBTeyvNMIWT92RiOv5dVZSKXU+jFqtBf9E6rJ8p2eZ
	 VK2tHeM47fDed0TspAIxRkFMHC3qzJV/O19mCSLqWibA7Ayn6AKJYm+v9TyE6Q9DxX
	 Md7ncFFXRUHqEwbPU2bw7Lm4WKtxD5fONIv2QtD8rT6Z34WVFUbUh3RDlARxfHeW0p
	 T/8Fg3xf/aINftiEEbJsxfRRSOH9E8ihKcnev16YmXley9Se3ROglb0LtM6zCJyEc0
	 ZSUz1cUoNZFimmffdMfE9thBVfyOA75lw3ynW/BmiHyrRkfc4S1aF8uLgJftulcEKj
	 jfmKyRwQ5ABZQ==
Date: Fri, 21 Mar 2025 16:40:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Steven Price <steven.price@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
Message-ID: <174259137507.3955133.798395163716870826.robh@kernel.org>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321200625.132494-2-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_144002_729991_4A494BB5 
X-CRM114-Status: GOOD (  13.85  )
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


On Fri, 21 Mar 2025 21:05:51 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Document support for this reset register.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Fix dt_binding_check errors in example, temporarily use fixed
>       numbers to refer to IMX95_CLK_GPUAPB clock and IMX95_PD_GPU
>       power-domain
>     - Drop trailing pipe after description:
>     - Drop leading dash before const in compatible:
>     - Switch from fsl, to nxp, vendor prefix
> ---
>  .../reset/nxp,imx95-gpu-blk-ctrl.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


