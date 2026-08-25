Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB46C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPEEjswSDO/gFHKbIJmQiHOXlTLMfTr0a94c/bav9hw=; b=czLCIM+S/W+XFgvbQKp4ESfaZs
	/8bjnA3qdZX0KN62AJH8Al23bwhIzcW0i/bFWeuQsrnR0t2VI1OhKNLWjnKCsvM0PXBsxZcZrSa/c
	gPi1NLS8EZ9mNlsfHFE2p/DWgz9hjpirtS7vaD6f4M6/J78LINjdbkMKnAocKJgIhdIVYC3MHBUe6
	wzLvAE6mXKCiGVutor93ipXPwDPbwvcDQpQf+8KtvnLbQH2XJYwhFKCQy+ZLAB9SBMjMxt3mw70om
	fKe//GNMrnxYaZ4qRQInN+dQXUCGueeGN+ik4lbrwFUjO4Y7OY+R+Vx3PZ+Fq6CcTeuSMxHzSRVy0
	cSaYgRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymL8-00000000MRf-47BH;
	Tue, 25 Aug 2026 08:17:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymL5-00000000MOw-1TTj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:17:02 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260825081656euoutp027ffbedf05f32b17f76bc31bc5588836c~O-mYDeEHO2408824088euoutp02j
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:16:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260825081656euoutp027ffbedf05f32b17f76bc31bc5588836c~O-mYDeEHO2408824088euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787645816;
	bh=dPEEjswSDO/gFHKbIJmQiHOXlTLMfTr0a94c/bav9hw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=cag1I/HWyHb/HG0Pa8d+qG8w+OqFFuO1UiH9PUeqtiKj3qOOXjaxKDAaD4Zo/yUIA
	 MxJGx9eSHJMsMDezAD26PvO/OJmJfvRVOX1VoOs4MK/LwbJU419qBc+IGeXoB1fmnA
	 FJ0zqBOEEOrJ88GRzqCrWN7Dqn6aWtPw2n3bKS0M=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260825081655eucas1p29f0cc0d9604e2dff85a94172a801988f~O-mXZ_S6o2874228742eucas1p2V;
	Tue, 25 Aug 2026 08:16:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260825081654eusmtip18c8296a5e03cc9251dcd1fa1ead918ff~O-mWzOWYz3027330273eusmtip1g;
	Tue, 25 Aug 2026 08:16:54 +0000 (GMT)
Message-ID: <eb0618b6-f2bc-4ed7-9178-e66ccee4962d@samsung.com>
Date: Tue, 25 Aug 2026 10:16:54 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/4] IOMMU driver improvements for modern Exynos SysMMUs
To: markuss.broks@gmail.com, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will
	Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Krzysztof
	Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260825081655eucas1p29f0cc0d9604e2dff85a94172a801988f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260820191213eucas1p10a8b83c2c6ab0505f80a0b469c7ae487
X-EPHeader: CA
X-CMS-RootMailID: 20260820191213eucas1p10a8b83c2c6ab0505f80a0b469c7ae487
References: <CGME20260820191213eucas1p10a8b83c2c6ab0505f80a0b469c7ae487@eucas1p1.samsung.com>
	<20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_011659_997496_390CD538 
X-CRM114-Status: GOOD (  18.40  )
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

On 20.08.2026 21:12, Markuss Broks via B4 Relay wrote:
> Newer SysMMU v7+ instances can lack BLOCK mode: CAPA1 bit 15 reports
> that the CTRL_BLOCK function is not implemented, and MMU_STATUS never
> reports a blocked state. The SysMMUs on Exynos 8835 are such
> instances.
>
> The driver currently assumes blocking always works, with two
> consequences on such hardware:
>
> The enable path writes CTRL_BLOCK first, which there acts as a plain 
> enable and starts translation before the page table base is programmed.
>
> Worse, both TLB invalidation paths gate the invalidation writes on
> sysmmu_block() succeeding, which it never does - so every unmap silently
> skips the invalidation. A stale TLB entry is a valid entry pointing
> at a freed page, so nothing ever faults: the device reads back garbage
> and its writebacks corrupt whatever the kernel has since reused those pages for.
>  
> This was tracked down on Exynos 8835 with the MFC, where the
> first decoder session of a boot worked and later sessions produced
> garbage along with random kernel memory corruption.
> Patches 1-3 add detection of the capability bit and adapt the enable
> sequence and the invalidation paths, matching the vendor driver's
> handling of these parts. Patch 4 is an independent debugging
> improvement: decode the v7 fault transaction info word (AxID/AxLEN),
> which identifies the issuing port when a master containing several
> DMA engines faults.
>
> Tested on the Samsung Galaxy Tab S9 FE (Exynos 8835/Exynos 1380).
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>

For the whole patchset:

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Markuss Broks (4):
>       iommu/exynos: detect SysMMUs without BLOCK mode
>       iommu/exynos: fix the enable sequence for no-block SysMMUs
>       iommu/exynos: fix TLB invalidation for no-block SysMMUs
>       iommu/exynos: decode the v7 fault transaction info
>
>  drivers/iommu/exynos-iommu.c | 37 +++++++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
> ---
> base-commit: 415606a7be939835db9b0d6b711887586646346d
> change-id: 20260820-exynos-iommu-fixes-e0e4d8f0fc06
>
> Best regards,
> --  
> Markuss Broks <markuss.broks@gmail.com>
>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


