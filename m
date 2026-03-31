Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B67109B47A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72m2TIJKvAyvCq88CEBugebJ+antOx8xqwjTjQMwlk0=; b=2QVGEJboyI2S58yVWqpOvGVIOv
	MDquvPaTnN0Dx9/gccsdQyVzZwcD1ZUgH5eIHQ5yIjPJXG33z9E2QsCd2V6F/Xyv0VzG9LyDv479q
	BMiv2NFhAgyONx7HuazfMEa6FJPe1TDm3ZPSIyXZvsKNd7PhoYxBw8kV47eedYAtfacYuhG7c5kJA
	kEFb8r6+hnpxMWfRfmOMrcGRl7tMoPh5fMVTgof54q32SEglCxZffCbAT/Viy5qubJ9umIlUEWVuL
	Rp212IYNWuFjMn5RRamjHgMreM2UO6UETABzdYshPDpvVZKFMAYix4NjkMulEoA1kjTIrQ/Yb8Y9U
	NpeABwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a9b-0000000D6qb-4AIY;
	Tue, 31 Mar 2026 14:33:15 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a9Y-0000000D6pL-2D9U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:33:14 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260331143307euoutp011aeeb12f56e9ceaf313505937a573fe0~h8535sjAC0694306943euoutp01H
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 14:33:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260331143307euoutp011aeeb12f56e9ceaf313505937a573fe0~h8535sjAC0694306943euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774967588;
	bh=72m2TIJKvAyvCq88CEBugebJ+antOx8xqwjTjQMwlk0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gn+F3vmqJQPGn2xsJQqpdX4RtvRpmsHTAaGUD0tpt1g+Ew6zJljspU4j6kURwLMQ9
	 ERo1PX5RiXLPVAzyUO1QwHs3BkahpzMYKyidf9OSKDioGxkcum9vgNrhgpgyNpZxPi
	 prhflKqFUyBmBLoFHEoFlFc2p6OjbWzOpm30sCVI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260331143307eucas1p10710d28fbb1407571cce7f29547133df~h853mCCVw0263502635eucas1p1A;
	Tue, 31 Mar 2026 14:33:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260331143306eusmtip19f8a3609e5a023afe620e4c1c98035cb~h852vSnAr0271202712eusmtip1G;
	Tue, 31 Mar 2026 14:33:06 +0000 (GMT)
Message-ID: <52a26d5b-67ec-4a99-98f6-6216e930cdb7@samsung.com>
Date: Tue, 31 Mar 2026 16:33:06 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/4] drm/exynos: Random cleanups
To: Chen-Yu Tsai <wenst@chromium.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAGXv+5G2H3CSic5hCSd2g6RrfGyNSbpYS7Z9uo-XUn6No3a4Rw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260331143307eucas1p10710d28fbb1407571cce7f29547133df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260327054445eucas1p2d1ac645faccf16272c3a12406400a364
X-EPHeader: CA
X-CMS-RootMailID: 20260327054445eucas1p2d1ac645faccf16272c3a12406400a364
References: <20260326094308.1161335-1-wenst@chromium.org>
	<CGME20260327054445eucas1p2d1ac645faccf16272c3a12406400a364@eucas1p2.samsung.com>
	<CAGXv+5G2H3CSic5hCSd2g6RrfGyNSbpYS7Z9uo-XUn6No3a4Rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_073313_020527_9C3F8950 
X-CRM114-Status: GOOD (  12.07  )
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

On 27.03.2026 06:44, Chen-Yu Tsai wrote:
> On Thu, Mar 26, 2026 at 5:43 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>> Here are some cleanups for the exynos drm driver. This was done as part
>> of the conversion of the driver to GEM DMA helpers. These patches have
>> no dependency, unlike the actual conversion, so I am sending them
>> separately for inclusion now.
>>
>> Please take a look.
> I should add that these patches were only compile tested.

I've tested this on the real hardware and it works fine.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


