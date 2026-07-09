Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDB6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgGKi9S4QU0JXZQ0JRxauGx7Ke57SwuX2CnwV9V0dK0=; b=Vngq9edAupxPMIGFLEOlMdXLS5
	usSzpeENaGpKE+w4vxpNDROX0KZbMSO1wj2Jym9G2vk3wb/T+FcJmWrnbUP5qHWjG9xxmear0ZS76
	tDYBIhmr2hrjTqRi9zfUY7jK+GhhgQlKNMh5J7PRfomcLv/IqFVgFjcx6clYXmFknn+/dZ9zDjzbp
	UBzUsdj1wh7ZZCNRMI3H0hF52B57R7liv/sik4c4irgeDP091gS6I5YEx982tqd1i0DOK95OdfjAZ
	JfXpp82IB1J3PgvqH1QNd7oNBYR3tHmfziVhv5zgfbsaKcK+vUSMvj5iryj2NnNsda4+bmi4L3aYe
	PyLbrHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whknD-00000001jrJ-20OZ;
	Thu, 09 Jul 2026 09:11:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whknA-00000001jqe-3at0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:11:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 962E225E9;
	Thu,  9 Jul 2026 02:11:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2CBA3F66F;
	Thu,  9 Jul 2026 02:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783588295; bh=XVa2/2af4zyUk4BXRT0V5f6lx5mVLn9UQAweGjedc54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUdc9LBco2n7+qPRxWRoUgrZz61VLMyz51iyvuUWI1xTHpFkZXAO//2KPnyjIYZ/p
	 QDX/gOqs1dzr1n0DOoJzFd31aI25vbxCYbLZRKXQE3/ZJkWZuxzq8Co7YYwpIl8uhz
	 E7EaYqIiTnBIBmTC2kbQT7SbxfXiuSlnUyNBkm+s=
Date: Thu, 9 Jul 2026 10:11:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, will@kernel.org, rppt@kernel.org,
	maz@kernel.org, aneesh.kumar@kernel.org
Subject: Re: [PATCH 3/3] arm64/coco: Add pKVM as a CC platform
Message-ID: <ak9lxJ79rS4MVibf@arm.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603110522.3331819-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_021136_941051_BB3A54D3 
X-CRM114-Status: GOOD (  11.99  )
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

On Wed, Jun 03, 2026 at 11:05:22AM +0000, Mostafa Saleh wrote:
> pKVM does support memory encryption, expose that to the rest of
> the kernel through cc_platform_has()
> 
> At the moment, all devices inside the guest are emulated which
> requires its memory to be shared back to the host (decrypted), so
> set force_dma_unencrypted() to always return true.
> 
> Although, typically pKVM guests rely on restricted-dma-pools to
> bounce traffic, with this change, it is possible to solely rely on
> the default SWIOTLB for that (assuming the appropriate size is set
> from the command line)
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Good to see reamls and pkvm guests aligned, easier to reason about the
code paths. Thanks!

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

