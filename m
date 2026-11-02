Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D78606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xiVTOlkX;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sfc9Pwfc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=; b=xiVTOlkXyhXpmy6vCqqOMRdkQa
	z6EowGghWLbkFGjOfyP/e0PUOb6q/bsJjYVllmZmoPInmudAgL2ytmKSj5WboYycxooBW7B+LEmEI
	MAYjOl9A3TBDudpTkbK/+0tYEzI1uq/aI+e7/UR3nQGE/5yltp2w3gEls1seINSaDlOl8BT4hMEw5
	Xi/YK+nmcvmoVP5yOXt7IUZ35aVgz8DcU5BnzE4+UxURIjsRl0jFkePysszEouFy+Q8TTjuye1+Bs
	tXIUd4fbuyAelRkcQ37CpFJRYM3mUn/SMFnfGF/WcjWtT5TKjEVJK2amS9osEIPQ9G+mUgKyRhmMT
	Y3OHlkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNruB-0000000Ga38-2KEJ;
	Mon, 02 Nov 2026 13:16:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNru9-0000000Ga2j-0BZF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:16:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so13081805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 05:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625411; x=1794230211; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
        b=sfc9PwfcPMGCRadni4YicRCfvjPtdrE3n0P4E3r8bownB8s856fiAMftCTJeycmWRP
         ZedGn59hVo1UdulaqU5HFPM574z7SC0fXud38/q6yqUqxUJn+RFFd/cRq8tRaktlD6oR
         lnm4BZa5jAJLhs/4Ae2pB79bF2escF2W4O7OUtwuPCY3gRpdZkIIS3EKqN2R7Hq8GFSl
         X7yDWgIVjnipWnj6lciXFR3AFtPlhVnh6zHgQwhrUzrsNwuJbfKsbHUulW9g2v5kuxIX
         c4IQQ8gvmb/evHIRkghDbGXTdEkbGg/Qtr9u3M3tF5zGE3v3/c2lRNZ/9wRTEWgztmJb
         fX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625411; x=1794230211;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
        b=PnhTTZrBA+Y7GyIjMvvY6XBsGDQ7TR77yocRialNma98uh2XxZeVFopFzRbzjq5TO6
         Xe5YRwd5fDbYRoPMYk5TLVSHpM9jHm6ViAfdj+YS+OxQs6mA5mW+IwSkp2HQxXmTaRic
         7bl7+kw4sl72cVzrXoGPG2qewEjgmqGwawecDK+sgePktsE1uysgWaJgmoV4gqGsh2o4
         JjMlqwPHocP3GT3+9IGaP4mbuYv0NFrl7nCL5Rt83AHnr/B+eG4Jc0/R3sIPO9N7eBUN
         TBb9lgtY4tWSooc3s+5oROFzx55HcaROttp+nKnL1mRhGzz805QdWUMmo/ZFFuwb5GrM
         Rn5A==
X-Forwarded-Encrypted: i=1; AKwUvBzqz987TSDuO89rrOXRJwc19I1G4TokVl6y6f/3O3wSGkaokZAijjS8UCSlUBiiDZQWY2cVYkvGdU8rMUvmCUit@lists.infradead.org
X-Gm-Message-State: AFq9FYJlpb/j7UfCx7w17xXCkQ/zuK8Sx9LZ46G15CtH5SpFjEsS30Kz
	oJeOox/DoSgkNxwygGCN3GIh4OdXBBvD8Hnvfc//o4DWBl8UX3UN11/u2FltlnKwY8A=
X-Gm-Gg: AYBFou0HlSvR6eJ5iRWzbtR7rFg0JMpDVBc194ZQxuCMkdvhSxiWXjiZp3+rDHXSsvB
	dfJ+T5gw3iLV/QThjhYvpzRB4IWhIAhb8/Wxp+7H+y4kzgtHZpbWQ/M29bebCQ9neMLL5YF5q4D
	JAYSKjud7x1zomDuUZdQ8o1iNFNMK65fihnBpKMRing8BZ45VBRV3tCGaaoLlFhW5g7LJiuTjGD
	PtIh2HFr5B91DqzzKzYoKArvDxl8GbJx0f8EPQFyVXbhnxEmR0Okcmll2YFyZwP58z+VDNOpjWD
	z9M93Ovb7kNN9vgiwYwoDSLOw06TxoLjSiBlOaisPKSQTRvicG//rSB6uj4bYb+D/LvFiFP4SjL
	+f0wqpBOL4XKw+FEwfgKMHFem2LC8cBCaTHmqeGnNq04Ck3bzd+f+mWha+tPfiavbKssCw6bmk1
	27aRNnWpoq5cTEdEEGzrmWHWp/Xk3ieW0Nvtlnh+QeGDDCYokhFLlJfgdu3uelellGD69lM67PO
	+GPTRZ6deAP+hpjDJjjVSKVrheNXs+EuHvRyqASoDf7dUzvWQ9kC3BrXoEMi7iugR49IpGg4g2U
	ecKS7Rzep6lqMoZiLARV/tqlYQHN8UPImwgq2jQsbqYrHrnX5kExkaBuUtVhohjYl6lWpriZGYj
	nfbOFjQ==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4ac1709ae4emr246187665e9.14.1793625410523;
        Mon, 02 Nov 2026 05:16:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm331607645e9.2.2026.11.02.05.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:16:50 -0800 (PST)
Message-ID: <fbf54a00-33c6-4b5f-a9d9-3f6c23744ae9@linaro.org>
Date: Mon, 2 Nov 2026 14:16:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/7] drm/panel: simple: Add Waiken WKS101WX001-WCT
 panel support
To: Frank.Li@oss.nxp.com, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
References: <20261027-dxl_lcdif-v5-0-3a974e4b94b2@nxp.com>
 <20261027-dxl_lcdif-v5-3-3a974e4b94b2@nxp.com>
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
In-Reply-To: <20261027-dxl_lcdif-v5-3-3a974e4b94b2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_051653_150719_5FEB41C6 
X-CRM114-Status: GOOD (  20.90  )
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

On 10/27/26 16:00, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add support for the Waiken WKS101WX001-WCT, an industrial-grade 10.1-inch
> IPS TFT LCD panel with a capacitive touchscreen.
> 
> Although the module advertises LVDS support, enabling LVDS operation
> requires hardware modification, including the removal of several on-board
> resistors. As there are currently no known users of the LVDS configuration,
> only the default interface mode is supported.
> 
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v5
> - drop "If LVDS..." in commit message (Liu ying).
> 
> change in v4
> - s/LDB/DPI
> - variable use 101wx001_wct
> 
> change in v3
> - add wct surfix and change to use MEDIA_BUS_FMT_RGB888_1X24
> - Add information about lvds support plan.
> 
> change in v2
> - update height to 135 from 136 (sashiko)
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d7dbd7442919b..5ef6a79f0de95 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -5252,6 +5252,34 @@ static const struct panel_desc vl050_8048nt_c01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct drm_display_mode waiken_101wx001_wct_mode = {
> +	.clock = 71100,
> +	.hdisplay = 1280,
> +	.hsync_start = 1280 + 70,
> +	.hsync_end = 1280 + 70 + 10,
> +	.htotal = 1280 + 70 + 10 + 80,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 10,
> +	.vsync_end = 800 + 10 + 3,
> +	.vtotal = 800 + 10 + 3 + 10,
> +	.width_mm = 217,
> +	.height_mm = 135,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc waiken_101wx001_wct_panel = {
> +	.modes = &waiken_101wx001_wct_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 135,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +};
> +
>   static const struct drm_display_mode waveshare_28_lcd_mode = {
>   	.clock = 50000,
>   	.hdisplay = 480,
> @@ -6248,6 +6276,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "vxt,vl050-8048nt-c01",
>   		.data = &vl050_8048nt_c01,
> +	}, {
> +		.compatible = "waiken,101wx001-wct",
> +		.data = &waiken_101wx001_wct_panel,
>   	}, {
>   		.compatible = "waveshare,2.8inch-panel",
>   		.data = &waveshare_28_lcd_panel
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

