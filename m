Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C2BC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4MzLIKdVcx/R3G/gHJETc70ma/fOUw5XK2bbIYAJnQ=; b=WJ9IK4R7DqV6zAWlKbJ3Gfvt9a
	akNhBeSGXEi8USE9eN3d8+vmcPuSrU7jmT02gc1RciN0ZUQZlPntanY1k6aUBZXTkr/yjYb9Volyy
	Rh0uNenV5DmesWBRnhGqm9IgYiTVd1T/Iu96faatiU1E+52rxaqq7WBlNJ8K6M0zKv9zhHkvUhw0O
	1muDYraiMaetpK10jO6zoKnFjbzJj9MVOXlq6hh6ldR6tsiwq40P8sHlIBwEkJy4tJt2HE0ZByQFF
	U7h9uAK/tZd3dgNIAtn1fXPymL9Wx7smwklzTqPDUK7AZMvR+0X8wTVPAzcEhPnS6tiwNCMm6fv73
	glMbMNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxL2W-0000000CqaQ-3M8E;
	Fri, 21 Aug 2026 08:55:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxL2U-0000000CqZJ-00xA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:55:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9E71596;
	Fri, 21 Aug 2026 01:55:45 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 085EB3F66F;
	Fri, 21 Aug 2026 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787302548; bh=wcdTd5B/RaOOWV5qretAunfQFbsYHOpwzyHoWc18erI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWdFNY3b68iy0MWDcR3xLM88mOwb4xQ08AlfOCA1myAiymVJh+Tw6lBpIILF/CvNR
	 VSseBE1KnZG9LMpSHVGBtblrEpb18HK5IF3Ih1BHtw1ZxB00xBPKLFbHZ7TvhMCp9Y
	 OEOZvff9FSOJmW4QdM0vtk6Ul7ejpOvX3sL+26fI=
Date: Fri, 21 Aug 2026 09:55:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Message-ID: <aogSkJxWf9QndjuE@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-5-usama.anjum@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_015550_407242_0F4508C3 
X-CRM114-Status: GOOD (  17.57  )
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

On Thu, Aug 20, 2026 at 04:33:26PM +0100, Muhammad Usama Anjum wrote:
> The arm64 selftest collection has no Kconfig fragment, so kernels built
> with the selftest requirements are not guaranteed to provide the support
> used by the MTE tests.
> 
> Add a fragment covering the userspace MTE and tagged-address ABIs, KSM
> and its sysfs interface, explicit HugeTLB mappings and their proc/sysctl
> interfaces, and tmpfs-backed file mappings.
> 
> Do not request NUMA solely for the optional KSM merge_across_nodes.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  tools/testing/selftests/arm64/mte/config | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 tools/testing/selftests/arm64/mte/config
> 
> diff --git a/tools/testing/selftests/arm64/mte/config b/tools/testing/selftests/arm64/mte/config
> new file mode 100644
> index 0000000000000..8587ce70c294a
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/mte/config
> @@ -0,0 +1,8 @@
> +CONFIG_ARM64_MTE=y
> +CONFIG_ARM64_TAGGED_ADDR_ABI=y
> +CONFIG_HUGETLBFS=y
> +CONFIG_KSM=y
> +CONFIG_PROC_FS=y
> +CONFIG_SYSCTL=y

You may want CONFIG_PROC_SYSCTL.

> +CONFIG_SYSFS=y
> +CONFIG_TMPFS=y

These are all covered by defconfig. Are these fragments still necessary?
Or are they supposed to work on custom configs? If the latter EXPERT may
be set, hence the PROC_SYSCTL above. You probably also need SHMEM.

-- 
Catalin

