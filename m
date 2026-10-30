Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDD606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C87wzwo/;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oLwAGCkI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NLCu8TR6LhnwPxFua00Dj/D0rG0UINndH2TWXr2KdOI=; b=C87wzwo/uxNlsG
	/yTRjwM6PEk2ql1aSC/XeN2oTKcCU3uWPL+8ZLM17DDbtDkJ4navrZjGDNyXQ0cNrZ0t277bETI5H
	JvOg8bqBECAhme7LNYkLXpc46wCrMTvg+8Txu1Ehwe17wIKFU8lddEHXF/JM284R02K9FPlPS+cbN
	11r5xdioZY+eL4+P+tcBR2bTYm1EgGhU9kYqYDV8GQa3+U5NOOHM0Z8rGjPlal0EHVZLhK8sV+lF6
	gAa3RA9I9m9MoQbzas9+Q/uJXAmtPDzQpb3SDuCXm5v0zOuR6syEXM6Qzd/N/F94Kosy1+1pfH5Mo
	YEo1kX8AWPCPamJiViOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnFe-0000000BpKE-3LaY;
	Fri, 30 Oct 2026 14:06:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnFc-0000000BpJi-1ijk;
	Fri, 30 Oct 2026 14:06:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33EE21CE0;
	Fri, 30 Oct 2026 07:06:31 -0700 (PDT)
Received: from [10.57.13.127] (unknown [10.57.13.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52E613F673;
	Fri, 30 Oct 2026 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793369194; bh=nLI0d8mXJNn/1KyLy0u4f2Q9bqsXsorDpHIkyD1jVKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oLwAGCkIDoNHp61txC4fL7ZJCs4qQYngVcfJ2CSGI4ojTpNgZAprg/Rq1FXuLe42A
	 05w9BZyMNji5KigDN4knB8DovlU0Zv3wssp/SDxbh9c+2S77mDiwpm0MRrK3f9hRoy
	 3IEAoz0haSQbyjIIE0YciD3qITM9mqorpbHRvcKI=
Message-ID: <825d47ed-9656-4467-bf37-39c65a7d4d79@arm.com>
Date: Fri, 30 Oct 2026 14:07:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] powercap: dtpm: Rename Rockchip virtual node
 descriptor
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <063f0587a6c951ca57e941ebab39617a0d0a305c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <063f0587a6c951ca57e941ebab39617a0d0a305c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070636_521749_D68BA8CA 
X-CRM114-Status: GOOD (  18.94  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/29/26 16:56, Daniel Lezcano wrote:
> The virtual DTPM node descriptor is named after the RK3399 even though
> it does not contain any SoC-specific information.
> 
> Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
> hierarchies.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
> Changes in v4 (since v3):
> - Rebase on v7.3; no code or commit-description changes.
> 
> Changes in v3 (since v2):
> - Rebase on v7.3-rc7 and refresh context after patch 4 style cleanup.
> - No functional changes.
> 
>   drivers/soc/rockchip/dtpm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
> index 222d9098cc98..5ae00680602f 100644
> --- a/drivers/soc/rockchip/dtpm.c
> +++ b/drivers/soc/rockchip/dtpm.c
> @@ -11,7 +11,7 @@
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
>   
> -static struct dtpm_node rk3399_virtual = {
> +static struct dtpm_node rockchip_virtual = {
>   	.type = DTPM_NODE_VIRTUAL,
>   };
>   
> @@ -33,12 +33,12 @@ static struct dtpm_node rk3399_gpu = {
>   static struct powercap_node rk3399_nodes[] __initdata = {
>   	[0] = {
>   		.name = "rk3399",
> -		.data = &rk3399_virtual,
> +		.data = &rockchip_virtual,
>   	},
>   	[1] = {
>   		.name = "package",
>   		.parent = &rk3399_nodes[0],
> -		.data = &rk3399_virtual,
> +		.data = &rockchip_virtual,
>   	},
>   	[2] = {
>   		.name = "cpu0-cpufreq",


Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

