Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC8CE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnE1IS/N69gAfY6FSVAz7xd5P6XrzkMhmNSZ88dWnIw=; b=bpWCS3nT8MiFWAxaQvC1LuALQg
	uvHsHCKfHTe0iHyhIMsOTLDMyQTFJaSzJHnthaRBGEDO/hnWwPh9zGOBTk2K7PrmD/QmTuTJ/U8sX
	wdtKHmOLJGBmbQ3PSpiQfHSEBrMzz1x5dLQnlNwQOVNh9nXZGXEd9DxSyrbY21cbvX9G41T7lMHl5
	meIBYJmhPe1t6/HpbcDRZ84dyNqGG3KfcDObc8cbv8LDZFp/Ryey25uVJ1ry72fzmx7965bb+Pffv
	cEwjm51wOlPxziy+IlhrrnlYBlwvVy4aMu3eVnHqmKYYKm6UuQOIElCMu4vSBZxw1N68elY4R4lUQ
	oz1kM8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXc7V-0000000DW1t-1xud;
	Mon, 22 Dec 2025 09:22:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXc7S-0000000DW1U-00NI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:22:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4428497;
	Mon, 22 Dec 2025 01:22:10 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FD183F5A1;
	Mon, 22 Dec 2025 01:22:17 -0800 (PST)
Date: Mon, 22 Dec 2025 09:22:15 +0000
From: Leo Yan <leo.yan@arm.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@redhat.com, james.clark@arm.com, namhyung@kernel.org,
	irogers@google.com, mark.rutland@arm.com, jolsa@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-tegra@vger.kernel.org,
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com,
	ywan@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com
Subject: Re: [PATCH 0/2] arm64: Support NVIDIA Olympus for Perf Arm SPE
Message-ID: <20251222092215.GE9788@e132581.arm.com>
References: <20251219231325.2742580-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219231325.2742580-1-bwicaksono@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_012222_171636_5E688E8D 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, Dec 19, 2025 at 11:13:23PM +0000, Besar Wicaksono wrote:
> This series support NVIDIA Olympus CPU in Perf Arm SPE.
> The first patch syncs the kernel header to the tools header.

Yes, I saw the kernel change has been merged.  For the series:

Reviewed-by: Leo Yan <leo.yan@arm.com>

> The second patch adds NVIDIA Olympus into perf's Neoverse SPE data source list.
> 
> Besar Wicaksono (2):
>   tools headers arm64: Add NVIDIA Olympus part
>   perf arm-spe: Add NVIDIA Olympus to neoverse list
> 
>  tools/arch/arm64/include/asm/cputype.h | 2 ++
>  tools/perf/util/arm-spe.c              | 1 +
>  2 files changed, 3 insertions(+)
> 
> -- 
> 2.43.0
> 

