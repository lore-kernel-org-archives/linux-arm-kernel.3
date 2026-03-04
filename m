Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DBFEB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsvRD4cFUfZG8OZibfY1jkyvnc1twBB3a0mO7hOEVWU=; b=oih3TaALNyxmuUfUPFj5mrBcPm
	i3JuncYHpZ6XLR+X5hQ+iqKi2AaCJW341645zD7U03NliXxGbEEq2AU3vLmBt1c+t0doZfYHFmW/P
	9EnJ5O9AlnoihZwDyTAHRLbDIXBQMovYM7rwDZ7qB/vnFcVqEFymil4EztnEhyN4zxgv9hV+8mZah
	9I40cK+x2q/1mgLmk3j+Mx5TSW+7/xPGltzEyczXqMu83RrTGj7EBYKDuCTofSDQYa6wixKklU4us
	fS72E0idq4ZJzOarlJILW0/Rgbbp03XzeEVZJrc9CsEQoKOw2p4FuoV+ykOluHynGor450/Iygjja
	JKkgiMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxj21-0000000GwjP-2uWa;
	Wed, 04 Mar 2026 10:00:41 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxj1y-0000000Gwic-15U3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:00:40 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260304100032euoutp02fef4af1b8737c6833d034ce632ba4fb3~ZmxKfhp3l3259532595euoutp02H
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 10:00:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260304100032euoutp02fef4af1b8737c6833d034ce632ba4fb3~ZmxKfhp3l3259532595euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772618432;
	bh=MsvRD4cFUfZG8OZibfY1jkyvnc1twBB3a0mO7hOEVWU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tqavopu7Ld00D70aw5KmgP0g4kQXjdyq+7bZrbcBc3zeuzGdTjhjt/C2RKsVkmCpp
	 4naspZ5+9AidaczMHg/bQrewYncAg6VvSyUXaQUSG3y4jn4yhSBxGqei+7Bg2SXIVE
	 GJnjdrNK8obNuN/6GfIZqO3SczU1sC+ZoUOgJZoU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260304100032eucas1p244a7c9f991575cafb653f812ffd7e89e~ZmxKEZPio3115531155eucas1p2c;
	Wed,  4 Mar 2026 10:00:32 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260304100031eusmtip1d611a4c01234db781b2da6218263306f~ZmxJoTmkK1157411574eusmtip12;
	Wed,  4 Mar 2026 10:00:31 +0000 (GMT)
Message-ID: <cd026591-c278-4f89-9d21-1a2125a85a44@samsung.com>
Date: Wed, 4 Mar 2026 11:00:30 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gYXJtNjQ6IHN3aW90bGI6IERvbuKAmXQgc2hyaW5r?=
 =?UTF-8?Q?_default_buffer_when_bounce_is_forced?=
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, suzuki.poulose@arm.com, steven.price@arm.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <yq5a8qd6iep6.fsf@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260304100032eucas1p244a7c9f991575cafb653f812ffd7e89e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260206061145eucas1p1917446df9763565b2b5ef829c5350a69
X-EPHeader: CA
X-CMS-RootMailID: 20260206061145eucas1p1917446df9763565b2b5ef829c5350a69
References: <20260120070102.182977-1-aneesh.kumar@kernel.org>
	<aYOVf066Fdr9L-nw@arm.com>
	<CGME20260206061145eucas1p1917446df9763565b2b5ef829c5350a69@eucas1p1.samsung.com>
	<yq5a8qd6iep6.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_020038_738423_FFDCF225 
X-CRM114-Status: GOOD (  14.60  )
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

On 06.02.2026 07:11, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
>> On Tue, Jan 20, 2026 at 12:31:02PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>> arm64 reduces the default swiotlb size (for unaligned kmalloc()
>>> bouncing) when it detects that no swiotlb bouncing is needed.
>>>
>>> If swiotlb bouncing is explicitly forced via the command line
>>> (swiotlb=force), this heuristic must not apply. Add a swiotlb helper to
>>> query the forced-bounce state and use it to skip the resize when
>>> bouncing is forced.
>> I think the logic you proposed in reply to Robin might work better but
>> have you actually hit a problem that triggered this patch? Do people
>> passing swiotlb=force expect a specific size for the buffer?
>>
> This issue was observed while implementing swiotlb for a trusted device.
> I was testing the protected swiotlb space using the swiotlb=force
> option, which causes the device to use swiotlb even in protected mode.
> As per Robin, an end user using the swiotlb=force option will also
> specify a custom swiotlb size

Does the above mean that it works fine when user provides both 
swiotlb=force and custom swiotlb size, so no changes in the code are 
actually needed?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


