Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D8AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwURMR915CTbYb07LaM/xpAOPf64S6EJL9O/N9i05RY=; b=YaRWc8MsE9PKHE4LlvhBQgY8EW
	ttgIPkUFHUm+2Vzy17uSp+qO1P+0AgVgPtTcxRPTkBsQCV5aymfVsijOTyb9NHJ2C1Hwc3rgyL/K9
	83KFc4JdO1IUPozqAj6yoeL6Z7gJXRJeb2pl2wZ3xp85QW0epXlh3aM5UrX2G+qRuQQJ9fAKvsuVT
	97bxPtIQ6ik76yC+BTBJcbf1PijgGzLc1shD6YktHqP88FjA3/cyGPxtSehZhZ9+crVHVu9IqPucZ
	DZuAhABX1v6c+cCDZvbXmGq0u5eBwFt6+dJ0AWNSLTOMWdJYMD72cbjZhdXE8gFK3tIA81yLK11Cm
	csZ8KXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJVF-00000004q7R-0SXf;
	Thu, 02 Jul 2026 15:39:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJVD-00000004q6d-2Jnc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:38:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 856AE601ED;
	Thu,  2 Jul 2026 15:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDD41F00A3A;
	Thu,  2 Jul 2026 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006738;
	bh=IwURMR915CTbYb07LaM/xpAOPf64S6EJL9O/N9i05RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2V0+7ELQGqQAd7sEVIVbP6pFh+c4EMQTIsyOJX3uWWlRR0XC5sqh9iLzgvypZEFr
	 MCYwPJQ1JqUdN2KsXxotRHYTIc7iTlkYz7s6/Lj9Y2G6seTf35mOk2bhYGAO/nKfV+
	 YvR3nedHklCOJI1If3RTDzW0/MsM5hdpnGjuEW312MB9IQBqfZc1HKNbWg6zdLXI2v
	 299Lk7QuyM4kLMu1S82jx3Qj+sjA8OvzICobeZYh7rRgZ5QiExjPFDb42ITzBskVxw
	 73GNr/N00NcYAzfCwFhtGufjo6jy6nFfS4LoEIOe7fXrYvv6GLYpo0LLyJOwxCPkwP
	 wczFHD4n0tSbw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id D4ED6F40068;
	Thu,  2 Jul 2026 11:38:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 02 Jul 2026 11:38:56 -0400
X-ME-Sender: <xms:EIZGahWeuVA8H8V2CYPQFmEImWdYZeq8xvbAKQwvejWgfFRwpLluvg>
    <xme:EIZGatA-tBORQdhRyNScLUnydoLmE7pnrxsu8kO3fw7YTpsUpzRrMpjvU1MIj1eWz
    EiUOUvrhK9vlkxt6j1vTNz-d0o5uJVOX35gdw4v172hYU4EyCXvmSA>
X-ME-Received: <xmr:EIZGasHE3usmO8SugVccsdSV_klloDxcwHZCuFX7tiaofiPheGk2hd05SQC3mQ>
X-ME-Proxy-Cause: dmFkZTEwQOjPdUgEUF/zj9zIWxYWCudWk5ov27ppwihUDlHHjgYJjMp/Z01BHkffqoH534
    7z+IElUhPIbERwk+0qBfxHoZf3BGgwtTB3pcYXVchNztlxrHJPdAnUnpUmN+sWk9GN3WTV
    uzkPx3WdGew/i45LqmqtkNl2A6rag+vIrFay8WE6BTXqojLkpLYom0vkMglk1+QVyWPC9m
    1NBsEVF/QtyzEzdzqM++vAc0KL8CTLF6jVJldZc4IMFs0Udh7LtZQ16TSxmnhhD6s8R+6A
    QYKOWMci5v+WymLIssgTHuoP+T9Yj1E09VJ5Kw9c35KB9n8+KzKarSJYU1SwlRubSS6AeJ
    i0+hOizX0DFaJ0KRHZ9+fyprtVN/RrNttwKp31mvQd0uTleevKBpuMTxctPERMD2DbmYYH
    JTSj1TnYBOL7mbQ+WdTEgDWr7XaOisRXGNtNKaO8K4ZWFXSjPkk/2O5778HYl75kn9nA3G
    hfDNw7ScMv2NaUtzgRTl0iJt9yVfSzFcmqc4MRZi4XAOrkcbffvnBnToRrPscUri7uyLiL
    kXlQJRtmBEC3ic9QP1JKUUFFKhPIVC8wJEzeOz/5aRnMYw4HRuobZLQTwtUHtujb3QSxER
    psvw3fzFLESgucZzUaZufcYg8SZRC4UR8j3OmfBB/uMlNa+1HDN90pCwNBRA
X-ME-Proxy: <xmx:EIZGahdbLavMIi9zdVSR5X9sAS8Y48TOBqfra8H8TA6eZetoYwwCiQ>
    <xmx:EIZGah-_pLW43hCitLpck93CJjPVYjG8jK6pFGQyexW4izCKZ-z4Gg>
    <xmx:EIZGanbVywB32-aFcoh3NEkOGtT1748pXw_Yb4QvZQtWJd_2k1V4UA>
    <xmx:EIZGaieYWJINgbfGY-b0JzuTVq2jMD4Y3tjl8Uax77vNh509AVyebA>
    <xmx:EIZGalTIzlfw4_YKu9Gq7cTQ8dlFNRHnVfDeHIeV1qFn-joYP3nimcHJ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 11:38:56 -0400 (EDT)
Date: Thu, 2 Jul 2026 16:38:55 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, Kyle McMartin <jkkm@meta.com>, Breno Leitao <leitao@debian.org>, 
	Usama Arif <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <akaFcwcSHVGeT8PZ@thinkstation>
References: <20260702112825.781750-1-kas@kernel.org>
 <akZ-KIVJlmP4LEcQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZ-KIVJlmP4LEcQ@google.com>
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

On Thu, Jul 02, 2026 at 03:05:12PM +0000, Pranjal Shrivastava wrote:
> On Thu, Jul 02, 2026 at 12:28:25PM +0100, Kiryl Shutsemau (Meta) wrote:
> > The command, event and PRI queues are sized from the maxima the hardware
> 
> A minor note here is PRI & EVT queues are disabled for the kdump kernel
> (see arm_smmu_device_reset). We could just mention all SMMU queues are
> sized [...] in the commit message. 

Fair enough.

Here's updated commit message (I will send v3 in few days, if no new
feedback):

Subject: [PATCH v3] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel

All SMMU queues are sized from the maxima the hardware advertises in IDR1,
which can be several megabytes each, and are allocated at probe. The kdump
kernel already disables the event and PRI queues (arm_smmu_device_reset()
drops CR0_EVTQEN/CR0_PRIQEN) but still allocates them at full size. On
systems with many SMMUv3 instances that cost is paid per instance and adds
up to tens of megabytes of coherent DMA in the capture kernel.

A kdump capture kernel runs from a small crashkernel reservation and only
has to drive the few devices used to save the dump, so deep queues serve
no purpose. The queues are not on the DMA data path, so dump throughput is
unaffected; a shallower command queue only bounds how many commands may be
in flight before a sync, which does not matter for the capture kernel's
small device count and modest I/O.

Clamp every queue to a single page when is_kdump_kernel() is true. Doing
it in arm_smmu_init_one_queue() covers the command, event and PRI queues
in one place. The command queue still holds at least one batch plus a sync
(256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
command batching keeps working.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

