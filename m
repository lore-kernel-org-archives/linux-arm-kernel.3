Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56550C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkzGTyOITc308rJc6tl6Kyt48/Uz9TVy8Lf7s0aXZQQ=; b=p8syKuQqbbqGZbXdyLYIwblrFQ
	bYX5SOcCs/pILU1RE4rVHAiaDEkhb/JLb/hUoZjEnpjoBiAIOcuVGi75vaN6AFHMznHLD7+CFPSEM
	yiTusnTtHaQODqKmdLgPAVLVWkw9/dnHbTgav6H5n185Y9uO6upwSJzrMV78K8N84+1AVPyk46rNs
	yQdGbrI/Nq5no4DT6oZiCWygxdFEtEIbjILIUPLkDLwmGJUZNlj5rGbDidKHWNmgNbpF8mbfEsjuX
	UTZcd3niU6yUzcdUtpfYUuZJlKh3f7RuZFLOFRBrvkDnDWi5ISomzrDMDJUvpPLHtl6PZ0WJVDt6A
	dfUOtKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaR-0000000DuTA-3JxZ;
	Wed, 07 May 2025 02:32:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNBs-0000000D8Bi-2pK2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 18:38:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E05475C2E3A;
	Tue,  6 May 2025 18:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2DCC4CEE4;
	Tue,  6 May 2025 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746556731;
	bh=gENiHVaxO1cmf80wqivECEs5b1lWHjuxUFcc5Rj9v6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hNW8K3TynJZ598S3ASeaKe4sOs3uOQkWpdFHo/Y28/zJqReUoGqgw96wPFLXEg7c8
	 DXVCawoIXOjLNaeRRtRs6TI7X8px0pUVXuv1jsIuUB5zM16vPj2OBl0EcwaMlJGsor
	 jWQtdG7gawM8KGta69yM5E3ZruZBgEK7GZ2v8w4ff3u+bwXR/cDakLDkZGrhHtLol4
	 1nLRZM7rosYjZr5ljtrdzAiApiNT3j5ei5jrqJH+QmEtH/CaNyEo2XVtwO3ABD1vJm
	 44/GUvOBqDGzRZTL8Tr0j/lWMttWjwj7zR3LoTeoarYbswG0gfh+gWoA5RqG8UX3yD
	 30sr6kKqDZA2w==
Message-ID: <2e0efc8f-516e-47fb-9a8f-f140bf8a47c9@kernel.org>
Date: Tue, 6 May 2025 20:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] MAINTAINERS: Add CIX SoC maintainer entry
To: Peter Chen <peter.chen@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 maz@kernel.org, kajetan.puchalski@arm.com, sudeep.holla@arm.com,
 eballetb@redhat.com, Fugang Duan <fugang.duan@cixtech.com>
References: <20250506090752.3695666-1-peter.chen@cixtech.com>
 <20250506090752.3695666-10-peter.chen@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250506090752.3695666-10-peter.chen@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_113852_811848_2402BF5E 
X-CRM114-Status: GOOD (  14.66  )
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

On 06/05/2025 11:07, Peter Chen wrote:
> Using this entry as the maintainers information for CIX SoCs.
> 
> Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c59316109e3f..169b89eabea3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2404,6 +2404,17 @@ F:	arch/arm/boot/compressed/misc-ep93xx.h
>  F:	arch/arm/mach-ep93xx/
>  F:	drivers/iio/adc/ep93xx_adc.c
>  
> +ARM/CIX SOC SUPPORT
> +M:	Peter Chen <peter.chen@cixtech.com>
> +M:	Fugang Duan <fugang.duan@cixtech.com>
> +R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
I am confused. I see this patchset already applied (3 weeks ago!) to
above git repo:
https://web.git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/log/?h=cix-for-next

in a branch claiming this is for the next. This is the branch which you
are supposed to be feeding next, so:
1. Are you properly feeding linux-next (see for example my beginners
talk from 2023 plumbers how to do it)?

2. If so, how can you send something for review - v7 - while this is
already applied and scheduled for next cycle (that is the meaning of
"for-next")?

Best regards,
Krzysztof

