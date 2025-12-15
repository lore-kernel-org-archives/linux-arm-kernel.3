Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2915CD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mKuCA0Z50HT6gGEmCoX13yW85L+S++ZeY240sfmtbY=; b=EoTlqut8bvpw/V9fRmK6sOstSs
	1Ajy3TcFpCqYB2sWILYm6Up0MX0lkoRCzPFJLcivn0+0Zxdy5sqIkpF3b5gQe+CnBqnIjyE9t8ZOR
	Aa8u6tqfEBuBHAOt4bfF82D2t7D8cDTd+5MnfCjOwoulioO8k9c72BhfCFka5faqMXeYqxltkN23K
	vhhXt2rFHXl0NoLwi/LSCWccYwpdh+SR9Y20p4UIKywV6C2rgG/ICQ+QoL4AEEwuCS3F94BRt1mzQ
	CqRiY+KxEKAYZyUWIqubTQhwaYf6Os5+Hst6rGX+5lNo6FbjaKs4zQ0PvkiiFj/dXKdrVl0sSv2mK
	C9dgnfdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV72N-00000003YRq-1W8g;
	Mon, 15 Dec 2025 11:46:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV72K-00000003YRU-0qGM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:46:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7322F497;
	Mon, 15 Dec 2025 03:46:36 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F1B63F73B;
	Mon, 15 Dec 2025 03:46:41 -0800 (PST)
Date: Mon, 15 Dec 2025 11:46:38 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Leo Yan <leo.yan@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, james.clark@linaro.org,
	mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 05/35] KVM: arm64: Add KVM_CAP_ARM_SPE capability
Message-ID: <aT_1HimOyJk6H1ko@raptor>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-6-alexandru.elisei@arm.com>
 <20251214121842.GA16796@debian-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214121842.GA16796@debian-dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034644_294958_F8713194 
X-CRM114-Status: GOOD (  13.03  )
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

Hi Leo,

On Sun, Dec 14, 2025 at 08:18:42PM +0800, Leo Yan wrote:
> On Fri, Nov 14, 2025 at 04:06:46PM +0000, Alexandru Elisei wrote:
> 
> [...]
> 
> > +void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
> > +{
> > +	struct arm_spu_entry *entry;
> > +
> > +	guard(mutex)(&arm_spus_lock);
> > +
> > +	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
> > +	if (!entry)
> > +		return;
> > +
> > +	entry->arm_spu = arm_spu;
> > +	list_add_tail(&entry->link, &arm_spus);
> > +
> > +	if (list_is_singular(&arm_spus))
> > +		static_branch_enable(&kvm_spe_available);
> 
> We can simply check if list_empty(&arm_spus) in kvm_supports_spe(), thus
> the static key kvm_spe_available is not needed.  Another benefit is this
> is consistent with CPU PMU's virt implementation.

Sure, that makes sense. I think I added a static key because I was thinking
about performance on hot paths, but looking at the series I forgot to actually
make use of it.

Thanks,
Alex

