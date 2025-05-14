Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3650FC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vio1/DgL/TF18EpHmKORorBpP2INImPkqjoGxwAAKnc=; b=KF+gGuXFaPWCkNx2C560S43chF
	Q88lCt0SdAstMWr+I2qxR38gvhujQQjwth+NpyvOt9OxCsKbcrB1h39vziSjfFnpRkNmzgIvT38KG
	ybKZaEpL1A+NahLU+BCORuajxm0bzZsH0iFo1zeptb8hJL1+ovAOAzuy1yO2lblCX5b6Tu87SdDz0
	O8bnJROIU2hN10RaS8MTVThIKmv/WWLc40MEruQzb2DWx7pGBY29YDCNXC4QOsaAW99oRsS2brela
	DuYUHVZbQhsjB5zcEqS6GzV99cp3bnObzt1napr5fxVBcAV+hCnYzn5p+O6NPwiYtU6r728vVfuRl
	AHIQ9I/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFI6u-0000000GDIT-1LyG;
	Wed, 14 May 2025 19:49:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHpt-0000000GBMQ-3S1S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E0AB5C48AA;
	Wed, 14 May 2025 19:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B462C4CEE3;
	Wed, 14 May 2025 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747251131;
	bh=XQmm91tOOOb6ELaFi19N2c7s4ctZ5809sg6+f0gqEzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O22C4XmllEaIIwaJhatMl3lpHJ+8YEq1ZOgLY3zlXyjDhQqMc5TiQdrekB2LLtMCP
	 L0RSqrtcucZ4m2epJLnLgbUyO1M7v9fPruRCQUH1ux4DetAXN3RqH4GfST5BWVgLCy
	 cF/s1vfeC7a97UF7cAPdeazKgAx1R8IxDnGElxyOJ7LNjgZKQLIeI2AYYZ4zvuXw7z
	 kFiL/cyo8ub9oxXfd1Pf4WdxbjGoI5uuXl9ie7ydrTiPyW4FByscVsHDlUwlu4OE3V
	 ngDtNPGA367g8U4ZSTfYKpr8T0igWxt6CQD75LhwCYJ9IKkUreSm9JkhfbpV3sKPVM
	 NvDX+luGFHS+Q==
Date: Wed, 14 May 2025 14:32:09 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: dma: Add Tegra264 compatible string
Message-ID: <20250514193209.GA2869871-robh@kernel.org>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507143802.1230919-2-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_123213_914902_66EE887B 
X-CRM114-Status: GOOD (  10.30  )
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

On Wed, May 07, 2025 at 04:37:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the compatible string used for the GPCDMA controller on
> Tegra264.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml         | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

