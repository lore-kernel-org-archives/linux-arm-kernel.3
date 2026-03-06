Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4EEFCC07C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvcXC7sIjqmGLKC/5FhKigrrCQ0ylyAc98DLYW2pSBc=; b=RDNRpjzq/S4xxjODLhIIe/Cfq7
	ImbkAgGJ/qNEkbCge3zikx7zWTMW26erQbVUpTJE7clxq3FvhXazijBoq5Og3VwER6RUtmg+0giUG
	C5C+ylxFdGBO8VBJoAVZrECKQH93wuHkNZ9IO/mVSBv6STtiNA/8xjOwIsLXVpmCF+TlcCkkyQf2u
	tmPnMBHGct7lKcB/wpWzsulzPdO4k1zy57GqiQ7Fv3ZQidmqyI6EgxNWazfgy8t8VsByUx7if9ZCr
	wO5G2MnzmDEtozov4arU9qr8wvdq0ixa4dXXg/kX4jPSI/2Kr+adXSPqpcY/n6y1AhrHoOBi9ePs+
	sIsCAUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycmY-00000004Wy7-23HY;
	Fri, 06 Mar 2026 21:32:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycmV-00000004Wxf-2dIs;
	Fri, 06 Mar 2026 21:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772832740;
	bh=aHU0GZS6zTBPMdXOwCrTKTzH8C6YwZmjPue47grujys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFUrMb1I3poRqCks/sKIZUbqF9uYwi2jBuezsO7ZNqi43m8Ilf2849gKI7YKgafAK
	 W08P8uJd7EPMfKmi9NkYCLwmb2UprPhWzXTmW/onNnKBLX0LFz6IKErczKao9jvGa7
	 sN9XEc2xvnSQzjo70mWuXzqTxwm+zzU63DGLYn3sUUPm8wWFKhhSFO85gAQZqs7GGW
	 eJ4Fa4zVu8xkypUJPZ4IYRYQtSNJ/g0FUnaHlW2OaGYJfDSe+sI+vnxGqYpjizQCM3
	 /yd7pd+cbrDQBSSHWUlKAH/HTSeJTG6mkjtS3soVaeDbWhOSL9qTLeAxA3SaCyhNKR
	 NyV/BtVeDPn7A==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D56CB17E0071;
	Fri,  6 Mar 2026 22:32:18 +0100 (CET)
Message-ID: <7ec93603-8d30-4f7c-99f8-64b09da13346@collabora.com>
Date: Fri, 6 Mar 2026 23:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/22] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
 <20260305-color-format-v10-16-a58c68a11868@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260305-color-format-v10-16-a58c68a11868@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_133223_841944_646724A6 
X-CRM114-Status: GOOD (  10.32  )
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

On 3/5/26 4:19 PM, Nicolas Frattaroli wrote:
> With the introduction of the supported_formats member in the
> dw-hdmi-qp platform data struct, drivers that have access to this
> information should now set it.
> 
> Set it in the rockchip dw_hdmi_qp glue driver.
> 
> This allows this information to be passed down to the dw-hdmi-qp core,
> which sets it in the bridge it creates, and consequently will allow the
> common HDMI bridge code to act on it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

