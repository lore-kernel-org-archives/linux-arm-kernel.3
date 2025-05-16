Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C9EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfnC4eiEaVP1GJXYOurLN9SyampP8bseNiBrmwv7zXU=; b=rjprmY0LhwdRnCbbJIevfNf+Q0
	clqMJedY3Q6hBH7T0c8ury1mBGSea13zZBRwjTTyhwE4OI5gcAC1LRPc/9pBfJ1l2oUduGIbPaWFR
	dJ0jnA+XoX8j14FuBFIH5PIZrkp6V0NhGh7bKLxcLEuxDpgP9ylSzE+PIIQZZxhsDytqbi2hUnkBy
	ZKmlS2JYAB7U4j165/G80U185BItjYoWT4mBvdfhpkqFBb3yo4E4bSYu/kexjNXOtw3ci7ro7SJvj
	zRPgmM9LMX+XKZoAwe4lOUV/RObA61Z61tnhmTuiQCZNcmQzt7UWkvhfVJvYUHLOSxjX0Fc8DcaFh
	G6Af/FqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtYd-00000003Ivu-3XcU;
	Fri, 16 May 2025 11:48:55 +0000
Received: from mail-m1973196.qiye.163.com ([220.197.31.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtWb-00000003IfR-2PpB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 11:46:51 +0000
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 154cedd92;
	Fri, 16 May 2025 19:46:37 +0800 (GMT+08:00)
Message-ID: <448a316c-3101-431c-b108-f2656283c06a@hj-micro.com>
Date: Fri, 16 May 2025 19:46:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] perf/arm-ni: IRQ improvements
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, peter.du@hj-micro.com,
 andy.xu@hj-micro.com, allen.wang@hj-micro.com
References: <cover.1747149165.git.robin.murphy@arm.com>
Content-Language: en-US
From: Shouping Wang <allen.wang@hj-micro.com>
In-Reply-To: <cover.1747149165.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUpDVh1LTk5LTRkfTktIHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSlVKS0
	tVSkJLS1kG
X-HM-Tid: 0a96d8eaee4709d9kunm6f5b345b23a9be
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQw6CRw6KjE5NjQxKh8jURke
	SglPCgtVSlVKTE9MSEJOQkJDSk1OVTMWGhIXVRoXFx4VVQwaFRw7ExFWFhIYCRRVGBQWRVlXWRIL
	WUFZSklJVUlJT1VJT0pVSE9ZV1kIAVlBSkxCSzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_044649_802779_002DE88C 
X-CRM114-Status: GOOD (  12.35  )
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

Tested this patch set in the scenario of PMU shared interruption within
an individual NI instance, and no issues were found.

Tested-by: Shouping Wang <allen.wang@hj-micro.com>

On 5/13/2025 11:38 PM, Robin Murphy wrote:
> Hi all,
> 
> While the previous attempt[1] was missing some important aspects, it's
> a valid problem to solve, so I figured I'd take a look myself. This
> ended up turning into a slightly wider cleanup, but I think the end
> result is nice enough.
> 
> As usual I don't have anything to test this on, so if there are any
> silly mistakes left that the compiler couldn't catch please do let me
> know.
> 
> Thanks,
> Robin.
> 
> [1] https://lore.kernel.org/all/20250410114214.1599777-3-allen.wang@hj-micro.com/
> 
> 
> Robin Murphy (2):
>   perf/arm-ni: Set initial IRQ affinity
>   perf/arm-ni: Consolidate CPU affinity handling
> 
> Shouping Wang (1):
>   perf/arm-ni: Support sharing IRQs within an NI instance
> 
>  drivers/perf/arm-ni.c | 148 ++++++++++++++++++++++++------------------
>  1 file changed, 84 insertions(+), 64 deletions(-)
> 


