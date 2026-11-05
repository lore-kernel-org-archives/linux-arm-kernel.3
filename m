Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046BD606A339
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eg1sepav;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y9zUq+Fm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jEFthDeOw857Vl1Txv+y9bOC3ebCcB7q3/QmLSqJflg=; b=eg1sepavWqpwXqhRhSWyhcZhm6
	cV3vbzPxS35YYGlopQJywzwd8MPrRfcg5hNpssZASmAwqYuKOjq8rRid2xcYecmcPMZlczi/CSklZ
	L+ssSzQkx1VsjqtUtUNqD/w0HQ0nd62ASocj5RTXlaoeYydIPLi+yAhNzbJ4sNw75i3WdygvHny/r
	mHMk2PtukCd7zvBFjNOs9nDJoDWObHNTI2mRIj9kLq9ZmkfnqspT3kxh1cr6yKEiWvxfd2TKR/zgO
	Xbs2wA6trVw5r514hjWz3or9p1mzXA1/PQBeLfyIqrUP90UHSntBbdCK9u+XwP12z4ldcvtrBmaXQ
	UGo2HY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzgV-00000009RUj-0nDP;
	Thu, 05 Nov 2026 15:47:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzgQ-00000009RRX-2ElN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:47:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-491aaed7565so475650f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893639; x=1794498439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEFthDeOw857Vl1Txv+y9bOC3ebCcB7q3/QmLSqJflg=;
        b=y9zUq+FmL/IL0xdUPKTj9cbeyuurQxfGMFYaKgkF5y0aTLprn53l3aFRF/n/GU3HFX
         YolSz7G0pRKeH8uzhYdHPynI8m5RNARByMznyJzqy+NfegvgMlvv8RFlg2WciMij2DaD
         FzCqtQ/QzcCPR1SlW2tG4Uk1WhDq0kLB957GEECzyxiU2ln0/hgHi6t6r2H73IndDjxi
         uA3N9H30gkV5RNcCzkv4nFM9W209oFI0vwzR965bFX8QTA+K5e3evspNcm3WPRNIkJgk
         4+AzRKb5Wj5dPDX3OEYK4amDDf/j/Z12YPpLk0lSq6vAIlfvzreQkQz8rGzdYs+0gkN5
         Tb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893639; x=1794498439;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEFthDeOw857Vl1Txv+y9bOC3ebCcB7q3/QmLSqJflg=;
        b=1SB/uuIern9fXoVZxyuSCG5chyliHUa2cjLJwgHGFk27Jk5XqODaP8s6U3avGvdfeF
         jpqpMD+Eo8hWj13gKKmlCMZCrx/n5LIQOwZaq5ND4jU/dFvcCSLeP9cQNcEoiI/FuNmt
         /ofyuDYmJkesHR7Gf1U+jEgd1OlY7+IRkobdu4k13oLhZ/zI9T/cifO3ZsSylnCtt/qO
         mT/XkEmzQMznq9bb8OeyiwuJYmPswmoilecl9FTWebyEWwhMmT/3Lg4/5Mc8dj7j2djV
         MHzY0beRV/JCUFQnVSSZFAdXkBaAipzEBLf61bD31QPAgO0qVVHFM8jUBcxd2LzoxuX6
         guZg==
X-Forwarded-Encrypted: i=1; AKwUvBx9urnlYsQJCd4zxpYE6Gh8dRGbz87tV4dwFptoCu6T8SA1A4KDMiSHrMafB9YHCUrh4fww3CgVgPNaosXL3OX5@lists.infradead.org
X-Gm-Message-State: APuU4Z/VofjObTSewvid9fwFYq0hDnQT9zPbMyfCYGx+IvCt1XP5MlwJ
	Y2TFj2qpjk7QvIOdqkXY0VWuGvfqgV388tPT5oMSmyLYBvvmbopihBekual+u93dlKo=
X-Gm-Gg: AYBFou1vT2pUcbg6ETs/VJVbTBvR21bs23JnZT96nOch9EzUBSKWsSy26LYWGd3mQ0X
	Ur2dPJO3K4DwNdur0GvetVuow8XaoPtGrqJYqLDvjkO/ntbwMOgy0rxuvdNOA7nSF1GMo63NgOp
	G09EQq4v3zFURVnbScRY4EYsM6pUyC1NEwDa+hlT8qkLvktnD5A+Vhf+XtMNrE3A5fk4tsQGoK5
	Sks9DC9i7l0I/KC0CmH4ueqkvfpXMw+GSfP8mBKPt8D4YlkqP+vF9Tr9Z3mR/mVYz6PMV8S0U3z
	C/SIutNfE2ec2JfhmAW9sToouigF2ah5/mHhqGZdDotOMIXiodTT/3VDztBnIxXvOBxI8/dm62B
	N62ANtEy+jMjRGnzr84NF0GDj3z3sujWenWEIOJlDtux8gjA7Kti1Dv6IKHq+u7jt+t2ODNiCpu
	5ngk2VBOOs4ggRTn4E7W/AUKOgouOIHE8igk21KQgHyHaWkYgcONpRwavQgpGBOlfqxccEVyNaJ
	Z8MrIIUASaANnqfir2e0Yw/xufLYIFFHJ5v5xyyBUvmidIcigqPD/P/rP1AsIuOtnvSzYy8H0w6
	rVbS19gnB7UuZzxaAHIfFVTdIIWAoDGLSX2J+oCfft0Ar1By89EncWuRnibnjFZzHOdAW9cq07a
	4txvVjbUY
X-Received: by 2002:a05:6000:41d1:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-48e6e5196ffmr44933021f8f.54.1793893638733;
        Thu, 05 Nov 2026 07:47:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9899:e54b:a2f2:3695? ([2a01:e0a:106d:1080:9899:e54b:a2f2:3695])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181085sm10757871f8f.1.2026.11.05.07.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:47:18 -0800 (PST)
Message-ID: <62271e1c-7a4d-4fe2-a68e-41066e7849af@linaro.org>
Date: Thu, 5 Nov 2026 16:47:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: plane: add pixel blend mode property
To: Jose Nieto <jnieto.alaber@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104155119.284708-1-jnieto.alaber@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261104155119.284708-1-jnieto.alaber@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_074722_702756_58D5D214 
X-CRM114-Status: GOOD (  18.71  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 16:51, Jose Nieto wrote:
> The primary plane exposes ARGB8888, a format with alpha, but never set up
> the pixel blend mode property. This makes the DRM core warn at boot:
> 
>    [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
>    blend mode not setup. Please fix.
> 
> Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
> requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
> previous opaque behaviour.
> 
> Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index cf8c90158fcf..115849a0b0c8 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -233,18 +233,13 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>   		}
>   	}
>   
> -	switch (fb->format->format) {
> -	case DRM_FORMAT_XRGB8888:
> -	case DRM_FORMAT_XBGR8888:
> -		/* For XRGB, replace the pixel's alpha by 0xFF */
> +	if (!fb->format->has_alpha ||
> +	    new_state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
> +		/* Ignore the pixel's alpha */
>   		priv->viu.osd1_ctrl_stat2 |= OSD_REPLACE_EN;
> -		break;
> -	case DRM_FORMAT_ARGB8888:
> -	case DRM_FORMAT_ABGR8888:
> -		/* For ARGB, use the pixel's alpha */
> +	else
> +		/* Use the pixel's alpha */
>   		priv->viu.osd1_ctrl_stat2 &= ~OSD_REPLACE_EN;
> -		break;
> -	}
>   
>   	/* Default scaler parameters */
>   	vsc_bot_rcv_num = 0;
> @@ -536,6 +531,7 @@ int meson_plane_create(struct meson_drm *priv)
>   	struct drm_plane *plane;
>   	const uint64_t *format_modifiers = format_modifiers_default;
>   	int ret;
> +	unsigned int blend_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) | BIT(DRM_MODE_BLEND_COVERAGE);
>   
>   	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
>   				   GFP_KERNEL);
> @@ -566,6 +562,10 @@ int meson_plane_create(struct meson_drm *priv)
>   	/* For now, OSD Primary plane is always on the front */
>   	drm_plane_create_zpos_immutable_property(plane, 1);
>   
> +	ret = drm_plane_create_blend_mode_property(plane, blend_modes);
> +	if (ret)
> +		return ret;
> +
>   	priv->primary_plane = plane;
>   
>   	return 0;

Sounds good, thanks !


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

