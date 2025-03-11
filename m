Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF35C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71ookR0140qL4gthFY6a+igAOhN6mQUxaVKbWakg7eA=; b=k20l+TL1NYSw4kuWbtLq06ukXq
	swxs8FmmZ6KW2qZcdWhjiq5jebMSwy3zX97o7FmYS3lBZdBQOvnkNPyC+m2w8kswjoeJPIGqj2I8m
	CfG/09hIYMHExIXjQesvaPnUKvmNaPfu/xmLrSqRCsi7Q7jqFkDmz/jKPxaVovMBDMh5pc8v0NW0B
	+XnKlpMeZLACnauOShVmm/sFMhpdaLsRuElYAgI0oFQ1xT3dX4KLu81cHfkq5a/VQ+QAdCQ8n+i5L
	/SpWcJb2oFj42vav1Xj4c/TtWc4wNa31AICG53e+q+hxMs97/2FV4bFT/IIBWJ0SMABNm/Wp75O5R
	rubYq05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvl5-000000057ZO-2opa;
	Tue, 11 Mar 2025 09:18:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvcN-0000000560J-48s3;
	Tue, 11 Mar 2025 09:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741684182;
	bh=6Y/kqe4ESlLKPPwAdQRMQdrAIo89CgPRwwvqGj8Dd8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IPqCIJR154BY6tFPErElSqI5KpX6LmqlGrxjLYgykbMbKI4AhzvIyiebJs1qcEKcl
	 rS5yBrFJt4ENvvdHd3nD+eEz69JQuNKA/CXITBeYTe3s+yUlEbkamtX+AbLgRexF+P
	 ZiFTOB7eMEKXUFhPO3XCrVyMDSAKUwaTYW6UCyS00H6Idclv6vLEL3d3OGsSOjCnkH
	 4cZjsjvkxUwjm+fb2xfdS3m4m/G27lyBXBPWQYK9XdBFsXwXuy88TgxvvrEyT6Rlmn
	 N2f826TK0hYW7dofQ4k3u3aCvAJqBrcZezwtPyJFEhPcWQizhd6WaVzGjxC3jxtGY4
	 YBBORT+bdRvZA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 617C717E087E;
	Tue, 11 Mar 2025 10:09:41 +0100 (CET)
Message-ID: <55b8bc40-0a29-46c2-ba5d-c7cc7742cf5f@collabora.com>
Date: Tue, 11 Mar 2025 10:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table format
 on mediatek_mt8188
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-6-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250310195921.157511-6-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_020944_182649_EF69F3C9 
X-CRM114-Status: GOOD (  12.31  )
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

Il 10/03/25 20:59, Ariel D'Alessandro ha scritto:
> Now that Panfrost supports AARCH64_4K page table format, let's enable it
> on Mediatek MT8188.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 0f3935556ac76..d7b8bded6d784 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -824,6 +824,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
>   	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>   	.pm_domain_names = mediatek_mt8183_pm_domains,
>   	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +	.gpu_configs = BIT(GPU_CONFIG_AARCH64_4K),
>   };
>   
>   static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };

Didn't that work on MT8195/8395 as well? I also recall hearing that it was somewhat
giving ever-so-slightly better performance?

If it does, please enable it on 8195 as well :-)

also s/mediatek_mt8188/MediaTek MT8188/g

...and btw
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

