Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C13FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2Nwp2MU876d7dPdKtR5qFqYelXFxh3gg4ETa1w6iR0=; b=Kl1GJ979ywNgU1HFxAEhNV3gAP
	Ol8GNhHRiQAfNcjYR3KKo4DUjjMZaZ3F+A7rvQ3vqW21DmghfzbpOYATk8hGgDscqlm6E6ZY5ZtPv
	tzpO/q7HUQVkkt4XYKUdtInupevErK/E7faiIultSDDutqh+/0lbwb6W8A/Y/WXbkTUgYo5ic09E1
	wNwmfFMFNqWILYEL4ZUVGk2AOB++24+2saU8GmtaC8peGm4Oqd3K/FFfRdnieJrxVRgxmD/FD9B1K
	NHLqkw2MWORfyoUw5EaBHJytAt/M9F1B1EeMaojzdCGLU+ddOJODezmz8jEhYNg+i7+XwOnpyKiyr
	9HGWqHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7lg-0000000DDwv-2W6q;
	Wed, 13 Aug 2025 09:27:36 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7j6-0000000DDUI-3N2f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:24:58 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250813092452euoutp02f75f9d6d0437c3758780eea98e4bcddd~bSVEAe_dM1164611646euoutp02Y
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 09:24:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250813092452euoutp02f75f9d6d0437c3758780eea98e4bcddd~bSVEAe_dM1164611646euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755077092;
	bh=a2Nwp2MU876d7dPdKtR5qFqYelXFxh3gg4ETa1w6iR0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=cgLdIUmc0uLWncfkW57OWD9w8L/LM9xrFTd0Uk372B/uNWAUCD2kvSsngN14RA0Fx
	 5pWE3tqh4SlbYfc/nQA64IxjQlTDfZ14ExrlQjNOHK77MeYIs6MNXp4ZYutbt1Ja9X
	 wgBkzRo+XsLbteVMfYx2L2kqS4O9wekVQoXjdI+A=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250813092451eucas1p11e109563279fd9f71d87ae0ae7054be1~bSVDoQDWX1974719747eucas1p1R;
	Wed, 13 Aug 2025 09:24:51 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250813092450eusmtip236af12d762e8b79623dc70cf3787ce72~bSVCeBDGD2419424194eusmtip2a;
	Wed, 13 Aug 2025 09:24:50 +0000 (GMT)
Message-ID: <7b505aac-0b2d-40b4-9a0b-98b74b0bf987@samsung.com>
Date: Wed, 13 Aug 2025 11:24:49 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] dma/pool: Ensure DMA_DIRECT_REMAP allocations are
 decrypted
To: Shanker Donthineni <sdonthineni@nvidia.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: Robin Murphy <robin.murphy@arm.com>, Gavin Shan <gshan@redhat.com>, Mike
	Rapoport <rppt@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira
	<jsequeira@nvidia.com>, Dev Jain <dev.jain@arm.com>, David Rientjes
	<rientjes@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250811181759.998805-1-sdonthineni@nvidia.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250813092451eucas1p11e109563279fd9f71d87ae0ae7054be1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250811181833eucas1p2632002b6854b082632247829ea0a944c
X-EPHeader: CA
X-CMS-RootMailID: 20250811181833eucas1p2632002b6854b082632247829ea0a944c
References: <CGME20250811181833eucas1p2632002b6854b082632247829ea0a944c@eucas1p2.samsung.com>
	<20250811181759.998805-1-sdonthineni@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_022456_981664_292A8F95 
X-CRM114-Status: GOOD (  11.64  )
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

On 11.08.2025 20:17, Shanker Donthineni wrote:
> When CONFIG_DMA_DIRECT_REMAP is enabled, atomic pool pages are
> remapped via dma_common_contiguous_remap() using the supplied
> pgprot. Currently, the mapping uses
> pgprot_dmacoherent(PAGE_KERNEL), which leaves the memory encrypted
> on systems with memory encryption enabled (e.g., ARM CCA Realms).
>
> This can cause the DMA layer to fail or crash when accessing the
> memory, as the underlying physical pages are not configured as
> expected.
>
> Fix this by requesting a decrypted mapping in the vmap() call:
> pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL))
>
> This ensures that atomic pool memory is consistently mapped
> unencrypted.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>

Thanks, applied to dma-mapping-fixes branch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


