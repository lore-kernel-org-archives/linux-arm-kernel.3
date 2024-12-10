Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CE3E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8U9OITzuCGVbUE4VFrB21WXXS4XhHNs8SP2M8B7r1S8=; b=VjBAu8erqMO6O+eSWBYrw/0dVh
	r0KUpa4ggNt1unqk4h235A/9+StetLH7hgVJaAx8uD32Ej7bK/imOGMRQZedlwsTbnDUsaka01TeE
	5AnR5GCDQnct38ceY4NI3IeD6oUjryLzj1Ep6i6vzGvFrcZf+mNnaV7YbcCnw77po3JcstvaUzqt1
	F317PbPDJgVM/i4w82dDH8/WI/475FPNGhDDauOf7ebiQjO81k3asd3UjlgucYB54CCbIpJZnlkEi
	6yyCZEwMLuo0tTOb6nNFxLmjRrp3sNbTjpxzR5JFOZ+XyFnXnC4VivA5oRWAVz685XFERmTEZke/Z
	PPRFF5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnyd-00000009gXA-1ANp;
	Tue, 10 Dec 2024 00:19:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnwb-00000009g1h-29zC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 00:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55C71A41A79;
	Tue, 10 Dec 2024 00:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F623C4CEE0;
	Tue, 10 Dec 2024 00:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733789860;
	bh=NP473M91KfDU5hAbkVpyFF0JS9tQapuKfRqfLoOzGtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WDVfORutvSU532Nrnz9oMLZZaXBASMmecU6EPI6cu2iXUWjbffC2s3iSrc0eA3ikK
	 t6IB70kecdz6wQE2MX2hAcBXkc4O7J45203xCTKOyVzXVgiThv41/QYWP2D/H8qQru
	 SP7JbB1IrEWZ/5GD4mbwNpF1lrAiLkINqaFEe1BKUq7gYqT5JvhjfRg9cNUZP1gfSN
	 yEPYpidYlxkzYCHbFvZn7pd7v5gp2Q85jVNTATtmZCceilAjiA8tY5frxs6aP87wNA
	 sSIneVYRs52/17P0h6txb97tvz8tWYr3ck0KDQAmwi/ErsP8fc1WlJEqw7gFuB6wbX
	 3a5YcFMbi6Wxw==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Michael Shavit <mshavit@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	patches@lists.linux.dev,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH] iommu/arm-smmuv3: Update comments about ATS and bypass
Date: Tue, 10 Dec 2024 00:17:27 +0000
Message-Id: <173378410349.4185561.4875058023954953472.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0-v1-f27174f44f39+27a33-smmuv3_ats_note_jgg@nvidia.com>
References: <0-v1-f27174f44f39+27a33-smmuv3_ats_note_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161741_612155_FC8B69CD 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On Thu, 05 Dec 2024 11:40:15 -0400, Jason Gunthorpe wrote:
> The SMMUv3 spec has a note that BYPASS and ATS don't work together under
> the STE EATS field definition. However there is another section "13.6.4
> Full ATS skipping stage 1" that explains under certain conditions BYPASS
> and ATS do work together if the STE is using S1DSS to select BYPASS and
> the CD table has the possibility for a substream.
> 
> When these comments were written the understanding was that all forms of
> BYPASS just didn't work and this was to be a future problem to solve.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmuv3: Update comments about ATS and bypass
      https://git.kernel.org/will/c/9b640ae7fbba

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

