Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA090606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hAS890HU;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g+s8b/GP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TSHFV9p0o4fRFZk9gFzrl1PkSDFKqS4z3PC8jypGJsI=; b=hAS890HUi4TavW
	3FFVJoTgHo/I6saVSCNGzt8zvfSJ0duMklDRb+ZGDJb23aicwApMfhhMcIu28to84naVEdpAk94bq
	a9vzzQpMur+Tg1kE5G3XfEtS5CyPP1wZYrN0QBvQTAzTKdxsbzyg2XTeWzJ9snzcQp416atFlsDxj
	b/VBKttQPJjyO1K27FOkqoWmD91u8xIXKG45xGYUD9dQXU4/r07djP0QypeAJmQ0o268XhxoMzGZS
	5MIFx0556QJZDC0iVgwCy24KwhIyBlt/kMlVn0AJmnkS39IK/sJmpE0Z4oagz0mZNdrY7MVuQxlp8
	hBgDFNZC9/RGuHAA5yDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnCE-0000000BotJ-2a4u;
	Fri, 30 Oct 2026 14:03:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnCC-0000000Borz-0a7b;
	Fri, 30 Oct 2026 14:03:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 551571477;
	Fri, 30 Oct 2026 07:02:59 -0700 (PDT)
Received: from [10.57.13.127] (unknown [10.57.13.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EEBE3F59E;
	Fri, 30 Oct 2026 07:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793368982; bh=I1FUwJlvLdKX7LF1hbS3q4Ks7XyfAy+gx/3lbFUXJwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g+s8b/GPOmL4UjKBohYUzlRu7cb+Lv7nMWcoRTtPnk3ayEIAKWU4tKYFnH6gF245N
	 EJ/BgpFY0HLsFd4A4fdl///R9dePyn6U/pFFFMfXCbyRCTXd7JM7FsJ3lraot/sAHb
	 fOOws9qF1Ev9boGoj3uHhM/UuZbJh8DulbgMkOWU=
Message-ID: <233a55d5-48f4-4e57-b816-3a59d9ab2b73@arm.com>
Date: Fri, 30 Oct 2026 14:03:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] powercap: dtpm: Remove duplicate RK3399 CPU
 hierarchy nodes
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <141ad25a137cb50516bd92f9a13dda7ec940f6da.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <141ad25a137cb50516bd92f9a13dda7ec940f6da.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070304_269329_81FC2554 
X-CRM114-Status: GOOD (  19.50  )
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
> The DTPM CPU backend registers one powercap zone per cpufreq policy,
> not per CPU. On RK3399, CPUs sharing the same cpufreq policy therefore
> map to the same DTPM zone.
> 
> Remove the redundant CPU nodes from the RK3399 hierarchy and keep only
> one CPU node per cpufreq policy. The backend already suppresses duplicate
> registration through its per-CPU state, so the removed entries are
> redundant descriptions of the same zones. Keep both CPU policy domains
> and the GPU in the hierarchy, preparing for one created zone per generic
> hierarchy node.
> 
> Also fix indentation in the Rockchip device match table.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
> Changes in v4 (since v3):
> - Rebase on v7.3; no code or commit-description changes.
> 
> Changes in v3 (since v2):
> - Rebase on v7.3-rc7.
> - Fix Rockchip match-table indentation here rather than in patch 1.
> - Clarify that the existing backend suppresses duplicate registration.
> 
>   drivers/soc/rockchip/dtpm.c | 22 +++++-----------------
>   1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
> index b36d4f752c30..e71f315fbb6b 100644
> --- a/drivers/soc/rockchip/dtpm.c
> +++ b/drivers/soc/rockchip/dtpm.c
> @@ -20,30 +20,18 @@ static struct dtpm_node __initdata rk3399_hierarchy[] = {
>   	[2] = { .name = "/cpus/cpu@0",
>   		.type = DTPM_NODE_DT,
>   		.parent = &rk3399_hierarchy[1] },
> -	[3] = { .name = "/cpus/cpu@1",
> +	[3] = { .name = "/cpus/cpu@100",
>   		.type = DTPM_NODE_DT,
>   		.parent = &rk3399_hierarchy[1] },
> -	[4] = { .name = "/cpus/cpu@2",
> +	[4] = { .name = "/gpu@ff9a0000",
>   		.type = DTPM_NODE_DT,
>   		.parent = &rk3399_hierarchy[1] },
> -	[5] = { .name = "/cpus/cpu@3",
> -		.type = DTPM_NODE_DT,
> -		.parent = &rk3399_hierarchy[1] },
> -	[6] = { .name = "/cpus/cpu@100",
> -		.type = DTPM_NODE_DT,
> -		.parent = &rk3399_hierarchy[1] },
> -	[7] = { .name = "/cpus/cpu@101",
> -		.type = DTPM_NODE_DT,
> -		.parent = &rk3399_hierarchy[1] },
> -	[8] = { .name = "/gpu@ff9a0000",
> -		.type = DTPM_NODE_DT,
> -		.parent = &rk3399_hierarchy[1] },
> -	[9] = { /* sentinel */ }
> +	[5] = { /* sentinel */ }
>   };
>   
>   static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
> -        { .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
> -        {},
> +	{ .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
> +	{},
>   };
>   
>   static int __init rockchip_dtpm_init(void)


Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

