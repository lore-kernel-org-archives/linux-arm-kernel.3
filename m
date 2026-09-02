Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8D4C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VI+zTa/H4brk4hljsWHx5rnTWZGudrTivFOtubthDSY=; b=igI2LmeuwDoYM2d0CnUPeRbULz
	LT4An+dFxjcGAI1Z3VgSWPygGc7Lgp7zcI1nVChHx/OmR5REg0UPPFAtcrJ1lCRRY0wIViYgpunKl
	CjcuQghu+hOD4qTraXU6Idv9grHG8iwqiv8Jz8ngYuA9R9SKeuLK9MoLQqxmqzK6+gkahdFkiwOfc
	aP3z9gzIcy8yoExijFKVT95SXPSMW4KvPWnFjgPpcAsLC4cf0/GeH2UiyHXxuq9NZKCxsvhGKFoUs
	0kPYRUcebtcDlr2eTt79Zi4gY9UPnXYnJ29DXw3XJxg/N3Devn790c90ZM4ozNuQ7gA1i5eAEJWeR
	qTFXbdKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1j3F-0000000EUOb-1p7i;
	Wed, 02 Sep 2026 11:22:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1j3D-0000000EUOP-2NjX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:22:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5612443D4E;
	Wed,  2 Sep 2026 11:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEED1F00A3D;
	Wed,  2 Sep 2026 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788348163;
	bh=VI+zTa/H4brk4hljsWHx5rnTWZGudrTivFOtubthDSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XUT8yFQFIDAXpJNheMQDAc0u9jQeTZYSg6YEzu3bttwqEFwjfRvwneXYGPOPvT3do
	 1AHDF3G8NEShvO5v/yxoQTav/PLUJRBdY/qGxocMEvdFe5dDJeR9keggoBS64Q91Wl
	 N5Kpbazegv+XETjnI5S55SxA6pij6Ye8shiUFa0VgJ9SKHXpdyYeYlK5rHcI9X9WX+
	 TCc4kIk/23CsoMmoQtjuLIMyKa+9djFumuYiKepkDd1PPUgmnTZvSQ8JJOrsqtGYNg
	 Z926LX0rZkRzyFwif0h1ZLRm22R9hD0JPofEKDATAbHh6I2bNhRKOY2xqY5VQTCD/c
	 Puq7EMndNkPGw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 5622A198003A;
	Wed,  2 Sep 2026 07:22:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 02 Sep 2026 07:22:41 -0400
X-ME-Sender: <xms:_gaYaivawVJwMuL9zUKR0N0wUoDQHsvFMWRhd3fVHlDEVSYpdqRdwQ>
    <xme:_gaYai6Yec-jc2kQ7kNbWqp2eEC8TnOxxQjiNHahL1ufRXnGyZsZ6kj-RbfMg8f8_
    WbH9VuFpYu_UK6mBOboPS0f9UkXNv3kaer1kXaQY7gzR9ZEb9Nm0fU8>
X-ME-Received: <xmr:_gaYasdF2BPNtoAy21DfX8FMRVmh1bFwOSyk-ZKYAt-0SFm8Ob1C1h6h2ag>
X-ME-Proxy-Cause: dmFkZTFz6itMPqahSEtPkdJJ9WVlua6VjGYOXQgtB6H3nUwkTCAeCZ7daCaLn5zON1t/5A
    MwWZ4U0HUxKeDH0x08LvUy2Gpht1F9Gi71lOZ5nSHj0qarS92q8yZpXwg0ERpN7IexVqoQ
    rCXc+94u/RibKKQ9IAsd+X4y4hMuNhJyDmQvT5hKcDPMF120/cUdT4/Tq6AmKcsnk6v++5
    /oMEJEwD2wTfPUps0KMjrJxACRV2mqyYw3yu2TEQqOIdZmcFBbdRWzRh0bZZ8Gg7jrLNBY
    /TrgKqBEcdSeQqKtKM3yTlGC1/LlhFGaVy0VgQb9RdHKxxi/xfP8tbOhqqNspPwC1LnlR4
    RG00hbJbFkJixN0Y1uvZGtWRKNW9GgQv0IUgu6Oj3n7otFGxiy5XG76k+BR8k/O5iTYyF/
    FwpvXpT5pTGZbkjJlNIncDpg8NyX3LveylVcs+7DDs+LjyVgJVc3vR2rX+orXLmT+GbvLo
    UB1XA2t094+SPBpEqpc0W3Veap6B3/IUiWyZ/VzXmA7W6UgTdY78NL3S2pjVQh9yv2zF3w
    y0j/VnrJMFr4g4vKBArfmHHGNrIMnN2ZwIswOcTI1aL8aaWcvaLXiHk3aRV9kK8TY9zKSc
    2Tx3FbzLtX8FSrS4lQBH+Qxvy4hUXNh7dUkgEPSxc9dcoig7jpmfVyTyjLNw
X-ME-Proxy: <xmx:_gaYaqWu3P8bxchyU4iAh9qlll9KgTrepKuTfuum4GUdJ6UuUGsaKA>
    <xmx:_gaYapXmRHSBDfLJpqErgSpOQTwWnhY_mn92ggpAUG_HmjSIG9rO7w>
    <xmx:_gaYarSmOMMgSDvkOfA8PkuNSGYnT6lbGfMqM985o2faUNa_DsYlYQ>
    <xmx:_gaYao1j08e-Eqgp_24jYNAKcMcrnhJ7jNSbbbhUPeLUfzLxa1xscA>
    <xmx:_gaYasIG3WWRsMQITpsJ2YlV5g3ZKL1IU4QAICJOX_RDeg8ll1NKyqXd>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 07:22:38 -0400 (EDT)
Date: Wed, 2 Sep 2026 12:22:36 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, 
	praan@google.com, kevin.tian@intel.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	jamien@nvidia.com
Subject: Re: [PATCH v10 04/13] iommu/arm-smmu-v3: Disable the EVTQ and the
 PRIQ in a kdump kernel
Message-ID: <apgG2jvqgd4T58br@thinkstation>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <861f488cbbfa84a4d222a22615adbe5d2617bc87.1788130528.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861f488cbbfa84a4d222a22615adbe5d2617bc87.1788130528.git.nicolinc@nvidia.com>
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

On Sun, Aug 30, 2026 at 04:18:05PM -0700, Nicolin Chen wrote:
> A kdump kernel cannot use either queue. The crashed kernel's CDs and page
> tables might be corrupted, so events would spam the EVTQ, and there is no
> way to serve the page requests that would arrive at the PRIQ.
> 
> The reset routine still enables both of the queues and then masks the two
> enable bits back out, having already programmed the queue bases and taken
> the interrupts of both.
> 
> Clear ARM_SMMU_FEAT_EVTQ and ARM_SMMU_FEAT_PRI in the probe instead, so all
> of the queue handling, i.e. the interrupts, the IRQ_CTRL bits and the CR0
> enables, keeps away from a kdump kernel via the feature tests.
> 
> Both queues also go unallocated now, as the two allocations test the same
> features. Each of them is sized from the maxima that IDR1 advertises, so up
> to 4MB apiece on a 4K-page kernel, which a kdump kernel would otherwise pay
> for every SMMU instance out of a small crashkernel reservation.
> 
> The IOPF workqueue of the event queue stays allocated here, as untangling
> it from the SVA and the stall features takes a pair of changes carried by
> the PRI series. It costs a struct and a workqueue rather than the megabytes
> that the two queues take, so leave it to that series.
> 
> Suggested-by: Kevin Tian <kevin.tian@intel.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Suggested-by: Will Deacon <will@kernel.org>
> Link: https://lore.kernel.org/all/amiBagGKn-Aym1DK@willie-the-truck/
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

