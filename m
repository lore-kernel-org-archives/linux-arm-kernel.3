Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEE0E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 03:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQC3j5Ek6Z11VytwhSrPAsd3aj9RY+6HVSAePtyNtM8=; b=iPGJvRVDENXsevXtiDK3MG6A1d
	d88Ya2et5NE1m7NDwsER9RR8rbQkvSlSkRSDzhyAuVR7FpKR6rDOrzsFwTKLuGhoNvh2R+Ciff/k0
	omVvAGCUbif7kAMnkOGWiMArRhzXgyfhCgYH1j1QuYmaDKKz215daEZZnZHMYHMs+b7KQzEZb24O2
	h8sD9e+V7UOnvmv4llc8Nob3E5gas9eTCaRKmz6aV1pZtW398FTNdppCFWPj8v0u38h88pbOzErg6
	qEhhtqvL9n6V0lU88felx6coB/pcW4vQ0cBlEaL0sTwDj2StKUEut8Y9EGxw5EJbFRiHIqDpT5Jlm
	lw+mQkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJPTS-00000000TAb-3uZp;
	Fri, 06 Dec 2024 03:57:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJPSR-00000000T5C-391h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 03:56:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF41169E;
	Thu,  5 Dec 2024 19:57:08 -0800 (PST)
Received: from [10.163.50.12] (unknown [10.163.50.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201353F58B;
	Thu,  5 Dec 2024 19:56:34 -0800 (PST)
Message-ID: <e48df345-0946-4b34-a463-e89aa89680f9@arm.com>
Date: Fri, 6 Dec 2024 09:26:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: add a new document for the fine-tuning tips
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, ardb@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, mark.rutland@arm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 cl@os.amperecomputing.com
References: <20241126085647.4993-1-shijie@os.amperecomputing.com>
 <20241126085647.4993-5-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241126085647.4993-5-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_195647_836951_3492519E 
X-CRM114-Status: GOOD (  18.86  )
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

On 11/26/24 14:26, Huang Shijie wrote:
> Put some fine-tuning tips in this file:
> 	1.) rodata=noalias
> 	2.) slab_strict_numa
> 	3.) CONFIG_SCHED_CLUSTER
> 
> We can add more tips in future.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  Documentation/arch/arm64/fine-tuning-tips.rst | 23 +++++++++++++++++++
>  Documentation/arch/arm64/index.rst            |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 Documentation/arch/arm64/fine-tuning-tips.rst
> 
> diff --git a/Documentation/arch/arm64/fine-tuning-tips.rst b/Documentation/arch/arm64/fine-tuning-tips.rst
> new file mode 100644
> index 000000000000..70ef1cef92fb
> --- /dev/null
> +++ b/Documentation/arch/arm64/fine-tuning-tips.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +================
> +fine-tuning tips
> +================
> +
> +This file contains some fine-tuning tips for arm64 machines.
> +These tips do not gurantee that you can get better performance,
> +but you can try them with your workload.
> +
> +rodata=noalias
> +----------------
> +It can provide us more block mappings and contiguous hits
> +to map the linear region which minimizes the TLB footprint.
> +
> +slab_strict_numa
> +----------------
> +In NUMA, it will provide the local memory allocation by SLUB.
> +
> +CONFIG_SCHED_CLUSTER
> +----------------
> +Some arm64 machines have cpu core cluster, enable it may
> +helps you get better performance.
> diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
> index 6a012c98bdcd..36d1ef09bd71 100644
> --- a/Documentation/arch/arm64/index.rst
> +++ b/Documentation/arch/arm64/index.rst
> @@ -16,6 +16,7 @@ ARM64 Architecture
>      cpu-feature-registers
>      cpu-hotplug
>      elf_hwcaps
> +    fine-tuning-tips
>      gcs
>      hugetlbpage
>      kdump
Although the idea for such a file makes sense, to help system admins
tune the kernel command line for required behaviour, I am concerned
about the overall structure and scope for such a document. Should it
contain tips regarding all the subsystems on the platform, till what
extent these details should be described in there and then there are
so many aspects for a required behaviour etc ?

Besides maintaining such a document might also be very difficult as
well given how implementations will change over time thus requiring
different tuning etc. Hence kernel source might not be a place for
such a document.

