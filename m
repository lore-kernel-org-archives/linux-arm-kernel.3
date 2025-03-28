Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE948C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 18:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGIl/D/IQlATv1YE3sYc45w/0v7KuPGnvUjACfzSOkA=; b=qJ6y7GaiEdhqKUIwOQOH4Fjpu3
	26EfmEL6inVexn+hLNeq0ju594OVXhdnoS8hiF27zHOJ/w5Oas3LcxvxUZgH5TvnpoWLlSibgYJYT
	in2P5R58vTd8GH3vR23ieZd+seCKEG85gVOMtHwRCtvYkULh1g0YHLFmqIJpysSk/9zcIGz9RTXyI
	BH6cSJsGRkr5rBSAzwdOBgFvcWeg/GQJJojdawbd6VkTnQ+XTACY2pPVC+FHWHdtIl6S5HLfzy4mh
	aPloSgNkeLY4TarUC0Oio6tnoHY4vw22HfAlvIgNfj9HocanA9TujTWt33Ue2pXe9rIaXdEOj3FsN
	wre1rBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyENc-0000000E6AJ-3oMT;
	Fri, 28 Mar 2025 18:24:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyELt-0000000E63U-0EZj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 18:22:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE997FEC;
	Fri, 28 Mar 2025 11:22:45 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43F0D3F694;
	Fri, 28 Mar 2025 11:22:39 -0700 (PDT)
Date: Fri, 28 Mar 2025 18:22:36 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	james.morse@arm.com, conor@kernel.org,
	Yicong Yang <yangyicong@huawei.com>, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linuxarm@huawei.com,
	Yushan Wang <wangyushan12@huawei.com>, linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [RFC PATCH 2/6] arm64: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <Z-bo7AQ1h6VQr65V@arm.com>
References: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
 <20250320174118.39173-3-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320174118.39173-3-Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_112245_136467_C9623A42 
X-CRM114-Status: UNSURE (   9.09  )
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

On Thu, Mar 20, 2025 at 05:41:14PM +0000, Jonathan Cameron wrote:
> +struct system_cache_flush_method {
> +	int (*invalidate_memregion)(int res_desc,
> +				    phys_addr_t start, size_t len);
> +};
[...]
> +int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
> +{
> +	guard(spinlock_irqsave)(&scfm_lock);
> +	if (!scfm_data)
> +		return -EOPNOTSUPP;
> +
> +	return scfm_data->invalidate_memregion(res_desc, start, len);
> +}

WBINVD on x86 deals with the CPU caches as well. Even the API naming in
Linux implies CPU caches. IIUC, devices registering to the above on Arm
SoCs can only deal with system caches. Is it sufficient?

-- 
Catalin

