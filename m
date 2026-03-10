Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDDAFCC9D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cAog/jJiOZAHcF3mfjX+pINQKdf8B7xpYPMgOiBJbE=; b=ipBpw1Wt1kbUrsDcFzvYxrOGwb
	CFVnOvt0vNam/qdyRjNQl3LbiBx4XsyPR9lxPGXIKL8RGmhDBhVgCMZG7N8WQbKCzbpqEl36p90NQ
	76RN8VVwYMvcuZz7Ql3sH2ROMkjVA65+CMMZldbRX4wqLG+J1fO69MWC6oimxe+pVvOLXpTlBXR8d
	DujageZ3D+cBvQCjcCJZDnGzbRtbtp+IgN9vbvwlB6XZvK3AmaVScnWhenNtsb9MEaSU2qSGx71bT
	+7wZvEmA47YWrH7x1/cO8e+kuedgPqFFrwI+VwR2yPR3SNnXQsjEqohBqYtKhExbQ2zFDpSYYo/GC
	16cQdRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzs3V-00000008uEc-370J;
	Tue, 10 Mar 2026 08:03:05 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzs3Q-00000008uDx-07WM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 08:03:04 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 074744D2DF;
	Tue, 10 Mar 2026 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773129778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9cAog/jJiOZAHcF3mfjX+pINQKdf8B7xpYPMgOiBJbE=;
	b=Pll1L/5SSdgvVHPUp4CZ1aQjfzyJQ+b00zOkd3bvTMtSjUlmJBNidBeIKtyY1drHt8c2Bh
	q5QBiWmA1FrCwM40Q0wdnHYx2Y5MMXmei+g2LpFEOPxXWwZrJBH4POd9OaEVSqU6DitYMy
	RqUt3rNFls7AqGVlV3xQH01LfIUAtg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773129778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9cAog/jJiOZAHcF3mfjX+pINQKdf8B7xpYPMgOiBJbE=;
	b=Ohriz17Rr/qAVXIwpWFvkVGtJfrHYByZ89uab60iD5TQe70jkp3l0s62UHd7PbbeUsY6/z
	aNJ1RQkc2CBXCfDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773129778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9cAog/jJiOZAHcF3mfjX+pINQKdf8B7xpYPMgOiBJbE=;
	b=Pll1L/5SSdgvVHPUp4CZ1aQjfzyJQ+b00zOkd3bvTMtSjUlmJBNidBeIKtyY1drHt8c2Bh
	q5QBiWmA1FrCwM40Q0wdnHYx2Y5MMXmei+g2LpFEOPxXWwZrJBH4POd9OaEVSqU6DitYMy
	RqUt3rNFls7AqGVlV3xQH01LfIUAtg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773129778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9cAog/jJiOZAHcF3mfjX+pINQKdf8B7xpYPMgOiBJbE=;
	b=Ohriz17Rr/qAVXIwpWFvkVGtJfrHYByZ89uab60iD5TQe70jkp3l0s62UHd7PbbeUsY6/z
	aNJ1RQkc2CBXCfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A70E3F353;
	Tue, 10 Mar 2026 08:02:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AmIhIDHQr2nVdgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Mar 2026 08:02:57 +0000
Message-ID: <c6d68974-fd3e-42a6-bdff-35f15d2a1a24@suse.de>
Date: Tue, 10 Mar 2026 09:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/4] drm/gem-dma: Support dedicated DMA device for
 allocation and mapping
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260310032511.2545500-1-wenst@chromium.org>
 <20260310032511.2545500-3-wenst@chromium.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260310032511.2545500-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[chromium.org,gmail.com,collabora.com,kernel.org,pengutronix.de,linux.intel.com,sholland.org,ffwll.ch];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,chromium.org:email,suse.de:mid,suse.de:email,suse.com:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_010300_360103_1AD7BF68 
X-CRM114-Status: GOOD (  27.14  )
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



Am 10.03.26 um 04:25 schrieb Chen-Yu Tsai:
> Support for a dedicated DMA device for prime imports was added in commit
> 143ec8d3f939 ("drm/prime: Support dedicated DMA device for dma-buf imports").
> This allowed the DRM driver to provide a dedicated DMA device when its
> own underlying device was not capable of DMA, for example when it is a
> USB device (the original target) or a virtual device. The latter case is
> common on embedded SoCs, on which the display pipeline is composed of
> various fixed function blocks, and the DRM device is simply a made-up
> device, an address space managing the routing between the blocks, or
> whichever block the implementor thought made sense at the time. The
> point is that the chosen device is often not the actual device doing
> the DMA. Various drivers have used workarounds or reimplemented the
> GEM DMA helpers to get the DMA addresses and IOMMUs to work correctly.
>
> Add support for the dedicated DMA device to the GEM DMA helpers.
>
> No existing driver currently uses the GEM DMA helpers and calls
> drm_dev_set_dma_dev() to set a dedicated DMA device, so no existing
> users should be affected.

In these patches (or at least the series' cover letter) you should 
mention that drm_dev_dma_dev() returns the regular device if no DMA 
device has been set.

>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_gem_dma_helper.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> index ecb9746f4da8..70f83e464476 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -146,12 +146,13 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
>   		return dma_obj;
>   
>   	if (dma_obj->map_noncoherent) {
> -		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
> +		dma_obj->vaddr = dma_alloc_noncoherent(drm_dev_dma_dev(drm),
> +						       size,
>   						       &dma_obj->dma_addr,
>   						       DMA_TO_DEVICE,
>   						       GFP_KERNEL | __GFP_NOWARN);
>   	} else {
> -		dma_obj->vaddr = dma_alloc_wc(drm->dev, size,
> +		dma_obj->vaddr = dma_alloc_wc(drm_dev_dma_dev(drm), size,
>   					      &dma_obj->dma_addr,
>   					      GFP_KERNEL | __GFP_NOWARN);
>   	}
> @@ -236,12 +237,14 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
>   		drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
>   	} else if (dma_obj->vaddr) {
>   		if (dma_obj->map_noncoherent)
> -			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
> +			dma_free_noncoherent(drm_dev_dma_dev(gem_obj->dev),
> +					     dma_obj->base.size,
>   					     dma_obj->vaddr, dma_obj->dma_addr,
>   					     DMA_TO_DEVICE);
>   		else
> -			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
> -				    dma_obj->vaddr, dma_obj->dma_addr);
> +			dma_free_wc(drm_dev_dma_dev(gem_obj->dev),
> +				    dma_obj->base.size, dma_obj->vaddr,
> +				    dma_obj->dma_addr);
>   	}
>   
>   	drm_gem_object_release(gem_obj);
> @@ -432,7 +435,7 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
>   	if (!sgt)
>   		return ERR_PTR(-ENOMEM);
>   
> -	ret = dma_get_sgtable(obj->dev->dev, sgt, dma_obj->vaddr,
> +	ret = dma_get_sgtable(drm_dev_dma_dev(obj->dev), sgt, dma_obj->vaddr,
>   			      dma_obj->dma_addr, obj->size);
>   	if (ret < 0)
>   		goto out;
> @@ -539,12 +542,12 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
>   	if (dma_obj->map_noncoherent) {
>   		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>   
> -		ret = dma_mmap_pages(dma_obj->base.dev->dev,
> +		ret = dma_mmap_pages(drm_dev_dma_dev(dma_obj->base.dev),
>   				     vma, vma->vm_end - vma->vm_start,
>   				     virt_to_page(dma_obj->vaddr));
>   	} else {
> -		ret = dma_mmap_wc(dma_obj->base.dev->dev, vma, dma_obj->vaddr,
> -				  dma_obj->dma_addr,
> +		ret = dma_mmap_wc(drm_dev_dma_dev(dma_obj->base.dev), vma,
> +				  dma_obj->vaddr, dma_obj->dma_addr,
>   				  vma->vm_end - vma->vm_start);
>   	}
>   	if (ret)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



