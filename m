Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D1EFCBDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhwLCFj1K33dcEqv/kiFh30HJo0bl8qoV3C5IgbXAEE=; b=wIg6iLdkw3Umeo
	eR1nx9aklLOV1GUKNlPq5+YYkNvlQD1rNPvTurDdChRiiZNib5xs5wiIATR653lsBek+6Cs/qBYMs
	7gOsRmNhWHcB6AHI/caZjEYnjL3AicJgN+M9dSyDNiplIlPdbgvpTX8JhhX8La7zvyFZ2V3aMUHsm
	hMYbfyP1r5xVpxAK1AGN/sOhozuu/Vcg2Ed2mNuRl6DTo8LEhLBGe5MXlAyCtixccJ26Wib/8BlU9
	n1tevEFwYCKPsDJQ5DCrECh7K5oH++GiiDFmJ4fGkONoYTx5A5wRXmAqN3QQ6LUpJh9IeJFNe+jm2
	gilWo6bdHxNHaAuwP48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22JL-00000003Tk5-0HHR;
	Mon, 16 Mar 2026 07:24:23 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22JH-00000003Tie-0mnl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 07:24:21 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260316072413euoutp010343450876d182766ced942698e4682e~dQYG0dsu51993819938euoutp01P
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 07:24:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260316072413euoutp010343450876d182766ced942698e4682e~dQYG0dsu51993819938euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773645853;
	bh=uhwLCFj1K33dcEqv/kiFh30HJo0bl8qoV3C5IgbXAEE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Z1+KruBIiw+ApvkZId0hSluHfmdnIY9Owm3K8P0+xPVHAaK/bJFHPAgh8M3IlXHC0
	 JF6TTYRGs3luDLp6Y7McSCdy2lFPz4ntZMvx/t3fS7p2lWSd7NlkgWZs85XQwbbTbh
	 WBmhlpHDz/whDosr6YOixVSGAPie4sRA8MmC31N8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260316072413eucas1p19a5d7fa66dc5b41f46d1902cb1f23f4c~dQYGhJqwM1822818228eucas1p1f;
	Mon, 16 Mar 2026 07:24:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260316072412eusmtip27d300c8399f0712ba101524571c37dba~dQYFirlLa0581405814eusmtip2-;
	Mon, 16 Mar 2026 07:24:12 +0000 (GMT)
Message-ID: <7e7a708a-6238-416c-96e4-c1d46f6be528@samsung.com>
Date: Mon, 16 Mar 2026 08:24:11 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 0/5] dma-mapping: arm64: support batched cache sync
To: Catalin Marinas <catalin.marinas@arm.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <abRnUk-vfvS51FtW@arm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260316072413eucas1p19a5d7fa66dc5b41f46d1902cb1f23f4c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260228221143eucas1p12a276d4216b6ce0f3c374b093f73acd5
X-EPHeader: CA
X-CMS-RootMailID: 20260228221143eucas1p12a276d4216b6ce0f3c374b093f73acd5
References: <CGME20260228221143eucas1p12a276d4216b6ce0f3c374b093f73acd5@eucas1p1.samsung.com>
	<20260228221125.59863-1-21cnbao@gmail.com>
	<3ece80c7-697e-4d46-a6f8-49c07b0117a1@samsung.com>
	<abRnUk-vfvS51FtW@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_002419_823769_2709BFEF 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: Juergen Gross <jgross@suse.com>, Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, will@kernel.org, Joerg Roedel <joro@8bytes.org>, Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Xueyuan Chen <xueyuan.chen21@gmail.com>, Marc Zyngier <maz@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, Huacai Zhou <zhouhuacai@oppo.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13.03.2026 20:36, Catalin Marinas wrote:
> On Tue, Mar 03, 2026 at 05:33:37PM +0100, Marek Szyprowski wrote:
>> On 28.02.2026 23:11, Barry Song wrote:
>>> From: Barry Song <baohua@kernel.org>
>>>
>>> Many embedded ARM64 SoCs still lack hardware cache coherency support, which
>>> causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.
>>>
>>> For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
>>> sync APIs perform cache maintenance one entry at a time. After each entry,
>>> the implementation synchronously waits for the corresponding region’s
>>> D-cache operations to complete. On architectures like arm64, efficiency can
>>> be improved by issuing all entries’ operations first and then performing a
>>> single batched wait for completion.
>>>
>>> Tangquan's results show that batched synchronization can reduce
>>> dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
>>> phone platform (MediaTek Dimensity 9500). The tests were performed by
>>> pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
>>> running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
>>> sg entries per buffer) for 200 iterations and then averaging the
>>> results.
>>>
>>> Thanks to Xueyuan for volunteering to take on the testing tasks. He
>>> put significant effort into validating paths such as IOVA link/unlink
>>> and SWIOTLB on RK3588 boards with NVMe.
>> Catalin, Will, I would like to merge this to dma-mapping tree, give Your
>> ack or comment if You are okay with ARM64 related parts.
> Sorry for the delay. Yes, feel free to pick them up. I doubt there would
> be any conflicts in this area with what I'm merging through the arm64
> tree.

Thanks, applied to dma-mapping-for-next.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


