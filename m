Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A36C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AS/MseAZNiwcFBJmOS/F4a/wQ4SpwXPmdblJclCDRo=; b=rPfuCtjG1ftd+HjwGCKAUoDLxr
	kKCrr1tyKfiy1o3+Xg51wiwK61tgUTALjr/fJHmp+7ii+ir+S8nhF38WxONY7OpN4p5VjBaX0Qq7V
	kr8EPmsHgzFzreHyHQ5R0jhh+nJwf/v4CPulCFA93HvJZE/zbWvQ9QrG2kjnulhOaUFhWm3wMaXBe
	+5apmPW0T977PDyiWtCSfXR/osYcsQQQEr9GLMQemSLCtRNnstRKMPxlwPU8Y2aSpBbNPEead1xxH
	U9MhZPnWL4GgOXD3fg67oTnCcNk0GyzPArg3vghOVFBfwSPN6vGSyq0Sc9iTz2+EXDk9WP4XyDgya
	B+RVg9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhls-000000016H2-387k;
	Thu, 09 Jul 2026 05:58:04 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhlp-000000016Fa-3jQL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 05:58:03 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260709055759euoutp0208aca6254b1c3aa832410b25a171b4f5~AiYo0pGbj0221202212euoutp02Q
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 05:57:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260709055759euoutp0208aca6254b1c3aa832410b25a171b4f5~AiYo0pGbj0221202212euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783576679;
	bh=3AS/MseAZNiwcFBJmOS/F4a/wQ4SpwXPmdblJclCDRo=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=nHsfvq04mcs9lAJV0tb0DvDsS+ZAduXZsZWLBXd5Ab/sZEMepat3GolmgrUjUvWa2
	 TcSj22Oaop91mT+UPdF300HesSlGhl0uCZmIjUIiISUlyUxOsBW4I1mK9lLVm3qIJn
	 RDLEhPOcAvOprRaM8NhXjorWVelWlGDs5FX2laSw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260709055758eucas1p184de37a1e60c04038218737c814f70e6~AiYoq3JnI0814308143eucas1p15;
	Thu,  9 Jul 2026 05:57:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260709055758eusmtip26d8a30a9996f75174508660d9fc97912~AiYn0yFQ63000330003eusmtip2G;
	Thu,  9 Jul 2026 05:57:58 +0000 (GMT)
Message-ID: <586acc4d-2a59-4cee-a774-70786c586893@samsung.com>
Date: Thu, 9 Jul 2026 07:57:57 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 4/5] media: s5p-mfc: Treat bitmap size as allocation
 failure
To: Yury Norov <ynorov@nvidia.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260709020312.133977-5-ynorov@nvidia.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260709055758eucas1p184de37a1e60c04038218737c814f70e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260709020355eucas1p2dc8d045376aadfd3860eb0a88da2aca6
X-EPHeader: CA
X-CMS-RootMailID: 20260709020355eucas1p2dc8d045376aadfd3860eb0a88da2aca6
References: <20260709020312.133977-1-ynorov@nvidia.com>
	<CGME20260709020355eucas1p2dc8d045376aadfd3860eb0a88da2aca6@eucas1p2.samsung.com>
	<20260709020312.133977-5-ynorov@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_225802_151229_23C1D095 
X-CRM114-Status: GOOD (  14.95  )
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

On 09.07.2026 04:03, Yury Norov wrote:
> bitmap_find_next_zero_area() uses an out-of-range return value to
> indicate failure. Check for values greater than or equal to the bitmap
> size so the caller does not depend on the exact failure sentinel.
>
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
> index 5ba791fa3676..b25ad2a37196 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
> @@ -43,7 +43,7 @@ int s5p_mfc_alloc_priv_buf(struct s5p_mfc_dev *dev, unsigned int mem_ctx,
>  
>  	if (dev->mem_virt) {
>  		start = bitmap_find_next_zero_area(dev->mem_bitmap, bits, 0, count, align);
> -		if (start > bits)
> +		if (start >= bits)
>  			goto no_mem;
>  
>  		bitmap_set(dev->mem_bitmap, start, count);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


