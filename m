Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F821606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1e+SdKFD;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cWUKTqoK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z5UoptergY0pXPhOZfV8qVoo9ZyI9tAXpbNaS7WGsPs=; b=1e+SdKFDBNnSgs
	TAkxd+WGsuLU9ZDCEiU/9r0lfe3bJa3a+J1Cp209xEwIjDz/SRlQNfMAj4+/qqoTigMt3JWHHAw5f
	7ASaxe8vjn4tYa3XOgtZ6cq5cQEPL+pQucXnc6CpUjXvY3P/0YlYlW3DoT1XOjDxuvA3kspqnf8jP
	sscoKvSh1XRzLVJRbniAtMImeNzf0fj4ww7yt9nixmPWzIm/TKf/PCkTS07fDhvE+b5ySrCp2sobM
	3Ua8EIdzX06U2VD/amc8zXgXQQdW+q4omYs7zIfxuVK4zySBOxeErIJDA4G4MzRguoiXcX5a6kEL8
	rpWDdFSg/Ukas6ndDWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtpe-00000008Jjr-3fL5;
	Thu, 05 Nov 2026 09:32:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtpb-00000008JiE-1ytx;
	Thu, 05 Nov 2026 09:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793871145;
	bh=ViE9NczNde3sg3tSsZ6L6dOH8qK0mpgSPv6HZO+Nxe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cWUKTqoKhaQ4sKoovGnmI/gRFqHkGnWmdGuM1ntYMoEqoOaNLBtr8w/T9NsZmwD6c
	 dW/ybKa/MwXQ4MpYnlmgcCiyxNp+wfeC8pLT8ug3M4LlmZ2OSjEdlJ+pt8s3o0rZso
	 grIFRe7j71llFUcjdQTHBgPEmO5siwISdAsXDXOD+xyztkSV0GA8mbpmAH54FJXQZE
	 yMBOxYYEzSk4fa8/VkmGSjAVdr2alyoTs2FNBJqdDYg9GNTKAu0wUfS/TQFjFXmey7
	 GZ9gECALLvYOx84X0V1MxDrk6QhW0CwcCzUb9TUdvEsVruBu79PWBQcB9c8Z/Ca1F/
	 Ul/7S471OvMRg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6BE717E096A;
	Thu, 05 Nov 2026 10:32:24 +0100 (CET)
Message-ID: <26d45091-592d-4be1-8017-b9937c9df071@collabora.com>
Date: Thu, 5 Nov 2026 10:32:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Validate gamma_lut size
To: Fei Shao <fshao@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20261105091054.3993611-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261105091054.3993611-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_013228_063524_1AB856FD 
X-CRM114-Status: GOOD (  22.02  )
X-Spam-Score: -2.1 (--)
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 10:10, Fei Shao wrote:
> The DRM core only checks that a GAMMA_LUT blob size is a multiple of
> sizeof(struct drm_color_lut), not that its entry count matches the
> hardware LUT size. mtk_gamma_set() and mtk_aal_gamma_set() then read
> the blob up to the hardware LUT size, which is an OOB read when the blob
> is shorter.
> 
> Add mtk_crtc_atomic_check() and reject gamma_lut with invalid length.
> 
> Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>   drivers/gpu/drm/mediatek/mtk_crtc.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
> index 2920f3198ef6..fd9b51fd00ea 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -880,6 +880,26 @@ static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
>   	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
>   }
>   
> +static int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
> +{
> +	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
> +	unsigned int lut_size;
> +	int i;
> +
> +	if (!gamma_lut)
> +		return 0;
> +
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {

Yet another iterator in an array of components, slowing down this driver...

I know it's not merged yet, but please, do it on top of my restructuring for
mediatek-drm...

Cheers,
Angelo

> +		lut_size = mtk_ddp_gamma_get_lut_size(mtk_crtc->ddp_comp[i]);
> +		if (lut_size && gamma_lut->length != lut_size * sizeof(struct drm_color_lut))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct drm_crtc_funcs mtk_crtc_funcs = {
>   	.set_config		= drm_atomic_helper_set_config,
>   	.page_flip		= drm_atomic_helper_page_flip,
> @@ -899,6 +919,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>   	.atomic_flush	= mtk_crtc_atomic_flush,
>   	.atomic_enable	= mtk_crtc_atomic_enable,
>   	.atomic_disable	= mtk_crtc_atomic_disable,
> +	.atomic_check	= mtk_crtc_atomic_check,
>   };
>   
>   static int mtk_crtc_init(struct drm_device *drm, struct mtk_crtc *mtk_crtc,

