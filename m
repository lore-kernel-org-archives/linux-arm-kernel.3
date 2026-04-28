Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F76FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eDSxHPFVITJWTk2gdeJMS3ZeqDn/bBRGYXZhg7OwYQ=; b=XdbS710brtS2c8+0ufKj1CdX+d
	Zoc8H3KBRt+Dw/C3tVwsQt32Ch57URe1nFxmTfBLJMx/LduujvkGVG0FSwse2qj0KHVaNQ99orZTW
	xZVrD+OB5NHFvOOSeGSGrC3VgUpbTxygEx5mN50M8vOQOR258G2fY1s5qIk3+6RpMLr+4sRzdAfqC
	nzHRsncu4GUmNU5U8o4OKE1dvzjnKmrZzlpBOwI0Nzvk/W5S6W0l+/7H5k9wKjmHZwI8u+QFo7XuY
	Uy7bupe8JEqEp68B3vNvvTOsJH/WWERXoexuy1gcnqrbVbrUvUPaZJEp+LRhJlI8bSuX9ulRYHzO4
	KLvG+sbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcHo-00000000eQE-2rE3;
	Tue, 28 Apr 2026 06:51:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcHn-00000000eQ8-2rR2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 06:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A45E760133;
	Tue, 28 Apr 2026 06:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34C7C2BCAF;
	Tue, 28 Apr 2026 06:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359070;
	bh=xRCvIjFm1qRPY86c8XK+wqrLdiC4ZGv6pNeFUGIqFMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISl2U9pcz5S+w16MG1ZHzMg58ZG8NpDuh9JFPoQtHaqXTAKKIMUo0oQZ4rqCm8tSY
	 KX0XzV1X9O0F2DSTrfcSvPowRgmSQbMKhq+NXyJlg3tg9HD5lmxn9U2FXnIjp1itlS
	 QQ88a1yAoS3C+cHOdQPxFF1+nTaD3WP7BRssmiymvP0LPO2vZjrVcthGlZzeDkYg+1
	 dc6XkOSBYNlwfzR5QyyXJdvjAPOd2LUQ9fq/SO2nkJvy+gTsqjrMsiE4ZD25W7E5kr
	 MyFVA6JBG174k92s65x/c1KJzYgen8KYkxXtgLmQcOaM4wrOF5knc4ru497Y/G6/VY
	 CrraCjnoIc04A==
Date: Tue, 28 Apr 2026 08:51:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robin Murphy <Robin.Murphy@arm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add Hawi compatible for
 Application processor
Message-ID: <20260428-pristine-rose-whale-35db39@quoll>
References: <20260427174915.3639641-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427174915.3639641-1-mukesh.ojha@oss.qualcomm.com>
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

On Mon, Apr 27, 2026 at 11:19:15PM +0530, Mukesh Ojha wrote:
> Commit 5e8323c3d528 ("dt-bindings: arm-smmu: qcom: Add compatible for
> Hawi SoC") was intended for the APSS SMMU but was mistakenly placed

Would be nice to see explanation what is APSS. We do ask for that every
couple of months.

> under the Adreno GPU SMMU section. Since that compatible is also valid
> for the Hawi GPU SMMU, keep that commit as-is and add proper
> documentation for the Hawi APSS SMMU here.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/20260422083329.885979-1-mukesh.ojha@oss.qualcomm.com/
>  - Not a fix commit after discussion.
>  - Not removing the earlier commit change instead add one for APSS
>    SMMU.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


