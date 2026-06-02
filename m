Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0385CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOL4oVcXwoiI4c1ezwww44jwDWGsyrBXEaQDVMmabaM=; b=AGP2cjKFMh56JNQfPrq4TPXgWV
	AcBL2rKEV1Td90gyWDmRA1qivRUXIgPdEdpOJtvKh6m6uErwHbG3nqEVw9M/UVEutCNpVg6eF98cn
	wnoKA08PvESehbEht089nGc4+fVRNNUHp8Ugvi8z7TjUGXzk+ldQctwpq+CbQJ06XlhXUKBdT57sv
	NuIAjI5RrSJqqJDRGlEHTg0ddf0CaPZhh+aftmgAfMv5E71EuAtwsge5VDWDAU9jDrph/B5LcpT9v
	XOBULXhxc1bLuzkPlhb7HKvUdeh5D+QI7fC3SXp0DmHDbhqPPOwW8+iY2NAD0BTHtrW723CtGeodg
	lAtvykMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULQE-0000000Cf9U-42Gx;
	Tue, 02 Jun 2026 09:28:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULQB-0000000Cf8C-2pFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:28:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D10EE3532;
	Tue,  2 Jun 2026 02:28:21 -0700 (PDT)
Received: from [10.1.25.162] (e121487-lin.cambridge.arm.com [10.1.25.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD0AC3F7D8;
	Tue,  2 Jun 2026 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780392506; bh=dZrUdnqAf9XrzV7pvUqn+kP9qXBcqosGRgnk/2w21Mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QPhYm6gK4mC+PEzhaxpriTDtkt9wexQpUn5bZD3nhFZ1OPU1VQxd8/DvJ7tY/23iK
	 3ru7ryoDFTi3yePlTC+aVsBG+cOKyu7AvcegU8To6luKr26XNXII3U00CXMz3R8UAD
	 Vb/IUQUHxHFDn/C0cS7hVQcTjH0r5Gog2bi94yL8=
Message-ID: <c3aa7bac-4770-4179-b433-15e421ae2e96@arm.com>
Date: Tue, 2 Jun 2026 10:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP
 capability
To: Zeng Heng <zengheng@huaweicloud.com>, xuwei5@huawei.com,
 wangyushan12@huawei.com, yangyicong@hisilicon.com, maz@kernel.org,
 yeoreum.yun@arm.com, miko.lenczewski@arm.com, james.clark@linaro.org,
 corbet@lwn.net, skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
 lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
 lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
 tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, will@kernel.org, Sascha.Bischoff@arm.com
Cc: linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260601112000.1145391-1-zengheng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_022827_804007_7E406DF0 
X-CRM114-Status: GOOD (  10.31  )
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

Hi,

On 6/1/26 12:19, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
> 
> Changes in v3:
>   - Keep CONFIG_ARM64_WORKAROUND_DISABLE_CNP config and generalise
>     ARM64_WORKAROUND_DISABLE_CNP capability.
> 
> Changes in v2:
>   - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
> 
> Zeng Heng (2):
>   arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
>   arm64: kernel: Disable CNP on HiSilicon HIP09
> 
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 20 ++++++++++++++++++++
>  arch/arm64/include/asm/cpucaps.h            |  4 ++--
>  arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
>  arch/arm64/kernel/cpufeature.c              |  2 +-
>  arch/arm64/tools/cpucaps                    |  2 +-
>  6 files changed, 38 insertions(+), 9 deletions(-)
> 
> --
> 2.43.0
> 

Thanks a lot for going the extra mile and putting everything
together! I have no further comments, but let's give others some
time to chime in.

Cheers
Vladimir

