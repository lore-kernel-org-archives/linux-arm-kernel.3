Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CFECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DP1EX41Sj96oKEwSm3MfFoxX9JfNAO0MnfCRTYo41rc=; b=KMm26MW1vkWiCBW/woB3NABsHV
	d/nR1P9iaLay7BmjWo5wzjV7YBFH6TUVEkAV42QGhIUP0Grb0z2Agb3JqrW0HMUJCAk2RA/SOYSms
	U9dVRi/4xrSxHgKmKo+n06s/ma5oFK1pub/yQqXvXeDowW5D5p8QkvQRZsRu6V9pR7DSFmmN9zDqx
	cA4/+tyOJVzlG1eawWkZintxqOkisstc+9cTHKBAIxup4PZ/SQG86GuzgpzawtS3LMrTMEA4OUVif
	uLnkjCisSdhHpD59mcD+VIIdKIPiUKtfBJELCJeyg7lbtJUODzccAJi8NRtfIkbJtXr4PANWU2mGV
	+I/eDzgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCSO-00000005BJe-0Oux;
	Mon, 15 Sep 2025 16:53:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCSM-00000005BJ1-2jWN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2A9660202;
	Mon, 15 Sep 2025 16:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AA7C4CEF1;
	Mon, 15 Sep 2025 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757955213;
	bh=mr8xIGCKnB4G5+8TaKxfsscKPKoQFGfQ1GJ3Zixoh1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C0t4FdCPYoAMS0qiePdSzxlUy4bYXgvPVm9AkkdzHGgMNB2ehUk20gtEjPgZPpsQ0
	 XfToX+19n7fkRGseSXXsxkLj0bA5cIdR01fH40KBWHlnCCCHH+mFdgaxyHw0DtDEOq
	 dZ52gcJayhVjEDVjxl64jdBE7aMgsO3ysiA7FB4pyAXQHEzFRWCXEJro+IIhxa2YOW
	 jZ+joc7AMg2WHweYuJ0Y7ZxrL60gJO6p/NjrRZk4wtwRgsBAuYigbO4Almu5OCQ+2H
	 62x/K4utH1BxPUNP/HfVt73xoIwGFPRd6qbOnrG7zN2gCj2HFepJ2cFM1jFPZ0zMKe
	 CygUEu0mz6H1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyCSJ-00000006SZG-1Jin;
	Mon, 15 Sep 2025 16:53:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Peter Collingbourne <pcc@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] KVM: arm64: Update stale comment for sanitise_mte_tags()
Date: Mon, 15 Sep 2025 17:53:28 +0100
Message-Id: <175795518947.664776.2321133557894998741.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915155234.196288-1-alexandru.elisei@arm.com>
References: <20250915155234.196288-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, alexandru.elisei@arm.com, pcc@google.com, catalin.marinas@arm.com, steven.price@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 15 Sep 2025 16:52:34 +0100, Alexandru Elisei wrote:
> Commit c911f0d46879 ("KVM: arm64: permit all VM_MTE_ALLOWED mappings
> with MTE enabled") allowed VM_SHARED VMAs in a VM with MTE enabled, so
> remove the comment to the contrary.
> 
> Commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag initialisation")
> removed the race that can lead to tags being zeroed more than once when
> multiple threads attempt initialisation at the same time, so remove the
> comment about mmap_lock too. Note that sanitise_mte_tags() was never called
> with the mmap_lock held from user_mem_abort() and the race was prevented by
> kvm->mmu_lock.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Update stale comment for sanitise_mte_tags()
      commit: 597f41e1743882db32f99dde062adbec29104586

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



