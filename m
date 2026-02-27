Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7F7FEFB49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 12:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzUgyY6XArK7xlLQHB2iX8OFX1RQ6gkyPzaXdCwHhwM=; b=nxr+oknMvcJPUMrSPCQ3gRNJu/
	r6wgQa8+67e/6+4JWGamOWYtgeC+8acwqOCwK5RhxAv6/+RdfWEylEC/LKmG7AmZcSNb9rM8JMJUE
	EI10n4LPRhbaVBYDflGoQw509vt+qC3FXENdOrc1Wodtu4TvpHHd+45gF/IdHdCrLuxkNC4Gwl0gn
	KRdxQ3WmQ4fFPVP0wOQbOBwbpZTodVOIl+8mA/Pn41VwZTt5ELpwcpVF2qmwNGFsazAOPJ3+M1qpC
	2YqJfQqE2ZRsg8aXdZgG8A0V48Q4qwAG55Ihtq2Oog1ERdcXBqkN/NVf8eDFy2AkYdg5NeXnRv8i8
	wzKz4b6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxED-00000008LFD-1505;
	Fri, 27 Feb 2026 12:45:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxEA-00000008LEn-1523
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 12:45:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5079414BF;
	Fri, 27 Feb 2026 04:45:44 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C13B3F73B;
	Fri, 27 Feb 2026 04:45:49 -0800 (PST)
Date: Fri, 27 Feb 2026 12:45:46 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, daizhiyuan@phytium.com.cn
Subject: Re: [PATCH 0/3] Arm SMMU errata updates
Message-ID: <aaGR-i8pIO8WYH9E@arm.com>
References: <cover.1772125743.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772125743.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_044554_360757_340BC62B 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, Feb 26, 2026 at 06:10:19PM +0000, Robin Murphy wrote:
> As promised (well OK, it's not Monday...), here's a more comprehensive
> SMMU errata update since I finally found time to pick through all the
> latest SDENs in detail. Includes some bonus cleanup since I despair at
> just adding to a messy table, but that could be split up if you have a
> preference for what to base on what.
> 
> Cheers,
> Robin.
> 
> 
> Robin Murphy (3):
>   arm64: errata: Reformat table for IDs
>   iommu/arm-smmu-v3: Update Arm errata
>   arm64: errata: Sort Arm entries
> 
>  Documentation/arch/arm64/silicon-errata.rst | 114 +++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  18 +++-
>  2 files changed, 77 insertions(+), 55 deletions(-)

For the errata doc changes:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

