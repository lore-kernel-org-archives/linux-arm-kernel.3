Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389EACA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI82e/NGrEgL982m3jFpDg0rZzP4BATxfWAjL6LrwSo=; b=MCUtm2hSRglyZWtuyNrIuGAfid
	aj22PNnvB5Lfv9T9bbSbS7T/JPmCnC3gyZMVPU0lcOdNCjq0A2j/6l7aOilhtXUdCClm77I9s52QS
	1c4uHyN3rMWFwSDZWWrnY9/I6GONbQdepW2nFs3uhJmr2KtEtBeR1EJYo1Of5KxaJ1Ptrgyd5NMRd
	IR4fMnW/zDS7XARZUw4Zmg3C5iT6ieByZVDVJrpZzT1MlFj9o97tykr+7rwxd0nP+kHaIdU/DlorA
	h1dZnYOSgdyuQg22K4RU5LG5xwSlRcScjE/pmLFwCDmjQ1LMoZ9H7/mVx8UeTkHxiKL9LCtEQ0tcM
	XnCxj4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0mYq-0000000BNss-13fl;
	Mon, 22 Sep 2025 19:50:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0mYp-0000000BNsk-1ykI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 19:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB8286023D;
	Mon, 22 Sep 2025 19:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0876CC4CEF0;
	Mon, 22 Sep 2025 19:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758570654;
	bh=PJ14tEXKCCze1FgoKpPEwcWDdS3QXMtPv/Gt8dbIO8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSM2LXk3MJBdfinmJaWTBhkL2yIyaDcKjFJjIv44irmcaMcPiq+Ttz9tgc3JWyPr4
	 T+BcYpvAl5sNAI2PUrC94gt1A6PQ1Mr8uNLGxJIr3BGii+VYCliwzIbIoVMCCtzkly
	 6azOYfxTxCyYHpLu+3vA19jAokfAhaHMhFM0zdehy0JlJU5J8MzfQuP9CeACezbh1u
	 XishcU1dwE7cn8yQiCKGjYQx2T0m4/1SIFB8USrXo/tQXMdU6IdzOiUfB2YsPn8KrT
	 S7J1m1xPv+Fjp+xTH6KwE/2eF1+w/dO1sb0FDxCfAdGN+OHN/caAfLDD7eb5D2gdSj
	 bUYWPg+hxRMHw==
Date: Mon, 22 Sep 2025 14:50:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, robin.murphy@arm.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joro@8bytes.org,
	will@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document Glymur SMMU
Message-ID: <175857065066.1064671.10595725300353083455.robh@kernel.org>
References: <20250919133439.965595-1-pankaj.patil@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919133439.965595-1-pankaj.patil@oss.qualcomm.com>
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


On Fri, 19 Sep 2025 19:04:39 +0530, Pankaj Patil wrote:
> Document the compatible for Qualcomm Glymur APPS smmu
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


