Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C376CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 19:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Rv9+GNHpAi2HfuuKWBkFi5HLdOTr5ZqDPmBHHtDUKM=; b=t1relvUUWjZLP2pI1nFefIR6F8
	IH5AXIcYQciwsyb/bg3JAa/Xceah4VNtafWJNraqx5EeJMmdK7zldXhrDrE3aWPyVg3az4dacsb2j
	N8aUqMftogii1GaoYMJzizTKk9ql5JB/mxjIdy+vT7Dphcu5XfTCUlDyDMNrqJ+/1wvnR5rTBuZ8Y
	F6bX9qxzKPnKke9wUb2x9HIvH9ym+oteoicGHwoGPtRxR4PVPV12g7FDIrKqGb3Ca49GiGtDFXpmX
	qWPTyolxIoaYiT+cwtFYoa1QwtKRLqqa5UClC5Jfz49Bsgsoo/OH9x+YQmGZwlMGxvFZIgVRnY0mz
	EbsJQLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL4N5-00000004i8N-45qq;
	Thu, 07 May 2026 19:26:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL4N4-00000004i7x-1Uu4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 19:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A7876024D;
	Thu,  7 May 2026 19:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFFDC2BCB2;
	Thu,  7 May 2026 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778182013;
	bh=CWoQLSknCfPM9HhQka4GqpdKh5SuMZsj0KISVOGm2kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZStBxt2G04rbxl9c+I/zkYmIGdMjBvSV7plTnA6ryDVwDzzJUh3Q/qRZCmtYeB8cS
	 viVDw8KFENEHtYTeuN7N8UwUyvWBOKcmO27Er2NF+v3i+ixok2AI7rHuTX0Op6/ABb
	 e3KEk9rUjhg93MAWTrvMAxc3Hr/85Pd/+rbZBXC/u+uQ1G25TAwo88dmgDdUFjO0fs
	 s/FIwAoPR5Q77QjsqxmGgfTzlheFzUQ/Vx8WlTR7U3IjjLl94oe5arRbgSWRFaTs7b
	 Gn7jX55FlTYcdmmuGoJydjq8NbeCMjAq+zq1vSAHUkxhTLpmVVdEt6Gds8NG2DRoGx
	 Nn6PTC7BKqybA==
Date: Thu, 7 May 2026 14:26:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Constrain clocks for newer
 Qualcomm variants
Message-ID: <177818201019.2428078.9991648853065913089.robh@kernel.org>
References: <20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Tue, 05 May 2026 09:14:54 +0200, Krzysztof Kozlowski wrote:
> Many of SMMU on Qualcomm SoCs come in two flavors using same front
> compatible but a bit different fallback:
> 
> 1. For application processor, usually without any controllable
>    clocks,
> 
> 2. For the Adreno GPU, with some controllable clock(s) and using
>    additionally qcom,adreno-smmu fallback compatible.
> 
> Add missing constraints for Glymur SMMU on Adreno GPU and several other
> Qualcomm SMMUs for application processors, to restrict the clocks
> property to a specific value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 38 ++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


