Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0F7CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/+Z+Favm+t+/n2ZoUWyfSz+zAc7TBbQH4WLVqU0wsY=; b=5Bd8azIIKREMKsZ8Yyo7X7eGTK
	D1PxKaskOohyErfcHRxm2e20weBLjHlxIaFXOs7fYnp59sqNhwpnSc6f5da2M1VpYqHcV67VXa01J
	slv5+nncHzomA89tWrWvf1iXwOx3xgEu0vaa+6vnb9xPwmnZUYH4iwZ7eYQ78OfQ2SMiuLZZmGQIU
	lag2ORY9OqZCRQQSxO2wjvQqTA8Wptqjhb9k6x86ljS4w56MCjvyqji2Xp4TN7bVQ0YmnFGQfyOzC
	G+wAqqBIL6vi+PNuJaoID556KgVZovguDPzqRceKqUP8/D5tqR4Gr/kfMwnR2iMNJZv4IgT+aKBrP
	uI4LauoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWVv-00000008aCE-20oj;
	Mon, 11 Aug 2025 17:40:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUDD-000000089r5-2kSC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:13:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E58C2661;
	Mon, 11 Aug 2025 08:13:14 -0700 (PDT)
Received: from [192.168.20.57] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E7C43F63F;
	Mon, 11 Aug 2025 08:13:22 -0700 (PDT)
Message-ID: <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
Date: Mon, 11 Aug 2025 10:13:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, cl@linux.com,
 Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org,
 bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be, arnd@arndb.de,
 nm@ti.com, ebiggers@kernel.org, nfraprado@collabora.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christoph Lameter <cl@gentwo.org>
References: <20250808025533.6422-1-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20250808025533.6422-1-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081323_745447_2382C0F8 
X-CRM114-Status: GOOD (  18.26  )
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

On 8/7/25 9:55 PM, Huang Shijie wrote:
> In the server, if some workload which will create lot of
> tasks, and will have many task migrations, we can get better
> performance when we enable the CONFIG_SCHED_CLUSTER.
> 
> For example, the Specjbb may have better performance:
>      Critical-jops : 26%
>      Max-jops      : 7%
> 
> So enable it by default.

 From what I've seen, SCHED_CLUSTER seems to be a bit of give and take 
depending on benchmark and machine. I'm not sure if it should be default 
enabled or not, but it would really be nice to have at least a larger 
sweep of benchmarks/machines in order to be sure of the decision.


Thanks,


> 
> Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 58f87d09366c..054c96ea2235 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -82,6 +82,7 @@ CONFIG_ARCH_VISCONTI=y
>   CONFIG_ARCH_XGENE=y
>   CONFIG_ARCH_ZYNQMP=y
>   CONFIG_SCHED_MC=y
> +CONFIG_SCHED_CLUSTER=y
>   CONFIG_SCHED_SMT=y
>   CONFIG_NUMA=y
>   CONFIG_XEN=y


