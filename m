Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53D7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2T1LGcWE;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B4rTpt+C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cYVEhmFXBYWgKUnLGpmzVsxJ6ulxA2Owk59YswCIlXg=; b=2T1LGcWEsOI5z8WZgZSROTuMZm
	ZZKEE0Wi/FGnHaVxrAC0y1szEgARKdrJok1UsWX8irTJAQhvDvoR5JbzQZDyTN3/mDBPzTZNgDiFt
	U5HzRqmq5fHjv9kZNGEJrO7E90vnsUoxKCxkz2J7/HSAwW56FvRnk7OD0YxibT8Owq7bCKviZlEU7
	V1gujM4o0MZQDJ1+b159w/HDGH9DWH5fHZ8sR2XLpOZ+ME6jd7RX7cysJCzNFRDaQruAhRwv1l9WM
	MKj7nCWv73G/mhhVUlTXZyiAIkanC7lGaWM0KI5ZF5ypk8E6tzQX/C4ACr6l4zcQn+2z9SejZZH/O
	FUpIpdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAH6-00000001dx6-2xLY;
	Tue, 03 Nov 2026 08:53:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAH0-00000001dum-1uY2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:53:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so2293915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696020; x=1794300820; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYVEhmFXBYWgKUnLGpmzVsxJ6ulxA2Owk59YswCIlXg=;
        b=B4rTpt+CUrrv14grfn6G8/KlP32wqI7Gb8oVCzu5U7u9Nri7gso33fRma/8GWKw4lr
         1b2ZTHMJgJrzC1NimQY7JCnZrIR+BBCpg3hyikHswkZFEeEHpObcVlte4JHp3Ko65pYM
         Dyg0gXYU1fbEFVyyjb9FIXAHN/heJccuEW6HYAFFG30YSOna90txoRf4vQcGaRVF1j5H
         uS/1hFxsqveygqVn+OQXtef7CJjcGd3RvOJEtJYecC5Xfyoffm8KPI5Pss86nGUdAByk
         Oiujtr46doOdTA9be1qpT2ACxp03Zid65Vh7/JctWMvK4eCvxFO+hEkO8i6H5h06KURz
         Re0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696020; x=1794300820;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYVEhmFXBYWgKUnLGpmzVsxJ6ulxA2Owk59YswCIlXg=;
        b=w3Zgp+DkQhoZg/Qeu/52VB2LRDJ2O6BZWPhpS7ZKrGpGGMLr7/a7XvpxbPpsc6f2XO
         diezvBiTiGLEBdUa4HmTL3r4PgLiZdj7sPbgs02A2fbSkFyi2vRmvkuvJ9cGnEpI9m2d
         g3ZgMoHDqQxzkDRURiQzO72rmIT31h9TL3ehOO0DC0SiY+R3ZIQInL8FwRbjHkuZRrYq
         Bt0g7ZnmKe6uHHeML9xLgZQo2gWFRJZWiLIsyjqsYi1nCdsGmHd7gtciII47F3HHoVs/
         Yv512yAkUnXO/PN03klG0w2lTvOpbLIopKQzpZw/saxFi/Yp3+MMXTmNOuNo9SE1OdnQ
         YRCA==
X-Gm-Message-State: APuU4Z8rOS6d9T6OsXskFFkyQC6HI1w/g1vRd9pjz0lN3Tb8vFTwCkZZ
	sia1Ky6obDH/bIDnuicMyZYn70fKrHWDhsmtr6nahlAWNaXRbHJzGWoB5fmcAcILfaE=
X-Gm-Gg: AYBFou0OM9fg1IVGSGm/RDz8eXrzQofFcoEuhe0ZEGNqca6Ts0JPkhIzgmpHkN6xHLX
	Dbasjle9W3milMMWlPrZmMmy350e6DtLdGGoHkUAqCXbEnuuiyFqu+hb6cflzajR+OFP8AQzag0
	LVCmWUNHAXZHesHq7VzRrcVB80ZL3+CtkN40A9lyo8MewskHenYEOcte32QogfKXmAicdCZ76rA
	rpsAwFlUZNfn/EXZ2jpHYgy4osef0NqaqZmyD1v3HGCUPhi+RwbjR3ON+G8IdzZjxMRGrVylSUJ
	SpG9RqpEas12Hr8VBptzN7+OuKMWtxXlMiSfIGsewoICJ7mhlWJAT3e0ozEePI7MTdrvyiAbqVe
	23TspfVBXWmYA2LrXKEqFdqKJXaZ5sdQ4waMiJH79Jnny7JbRtyuryNYm5ILBxwldE+hyuf2B4K
	7uIh+DICkasF+WnDaGhEx/tY6wJuwapFuowYfwMJOGlzVG7KbQ2wA09VeSs74xQO5U7py7fD7gN
	+EJVrG66sIYpJtQaV/VY9MP13WUvKMLdk04DUeIO9NpZurGtvIeU3PRzBClcO+SkZcvA6NiMeTP
	PpzC3z/TLQCDhZLW5rhzWZCqxBsxfS50sa9fM9wcXDYwOH8gLh799QWWaAizEhxhmyZTLhBcF0T
	o8bGob7ykXssjWO4AplvRbe13hhCd
X-Received: by 2002:a05:600c:2541:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4aa8b060adcmr301144395e9.18.1793696020400;
        Tue, 03 Nov 2026 00:53:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm23606102f8f.9.2026.11.03.00.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:53:40 -0800 (PST)
Message-ID: <2fdcea84-8b95-4ec1-af62-07e1803cb418@linaro.org>
Date: Tue, 3 Nov 2026 09:53:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH re-send] drm/meson: add support for higher bandwidth HDMI
 DTDs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
References: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005342_515118_39BDB922 
X-CRM114-Status: GOOD (  23.89  )
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

On 11/2/26 22:28, Martin Blumenstingl wrote:
> There's a report from a user with a DELL U3415W monitor and a Khadas
> VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
> edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
>    DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
>                 Hfront   80 Hsync  32 Hback   48 Hpol P
>                 Vfront   28 Vsync  10 Vback    3 Vpol N
> 
> Those high clock rates are currently not supported by the meson_vclk
> code as it limits the PLL OD (output divider) to a minimum of 2. The
> formula to calculate the clock internally is (ignoring fractional
> dividers):
>    319.750MHz * 10 * od = 24MHz * m
> 
> With od = 2 this results in m = 266, which is outside the supported
> range of the PLL on G12A SoCs (the driver limits m to 106..247).
> Using od = 2 results in m = 133, which is supported.
> 
> Allow the driver to pick OD = 1 to gain support for modes such as
> 3440x1440@60Hz.
> 
> Link: https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for-dell-monitor/26271/12
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Re-send of [0] which seems to have slipped through.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20260109204836.790096-1-martin.blumenstingl@googlemail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index dfe0c28a0f05..c0be0b7655bf 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -700,8 +700,8 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
>   				       unsigned int *frac,
>   				       unsigned int *od)
>   {
> -	/* Cycle from /16 to /2 */
> -	for (*od = 16 ; *od > 1 ; *od >>= 1) {
> +	/* Cycle from /16 to /1 */
> +	for (*od = 16 ; *od > 0 ; *od >>= 1) {
>   		*m = meson_hdmi_pll_get_m(priv, freq * *od);
>   		if (!*m)
>   			continue;
> @@ -750,7 +750,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
>   		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
>   		od3 = 1;
>   		if (od < 4) {
> -			od1 = 2;
> +			od1 = od;
>   			od2 = 1;
>   		} else {
>   			od2 = od / 4;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

