Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE207CF45D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 22:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrJfO/MQHE9ORLIzDzoDaJky/dFJ+1X4uifWZxqiplY=; b=0K7VlnQn5iiBYJo+7f0VwMzm+v
	PM+jJ54d4jIgOA+TrnEsgPlhWsB08//8LTQ8c5AdcWcf4/0jshrNClShinJaiAAIvmUg1WhYNZj4z
	LtSwVCwjj26hsTF7KfyNVG6SuezXJlSA0EvxVnvzOyYcPTAcmVTOj3AfkTUtxeRYm6dQ+llz4ytBB
	5emPnA5guwNwExqrM7DwL8Mqd/mGjbgGB5oKEu/ji+BGss4Q4uipNqfNpIXHkKNtZD9L/213gmD4f
	ojaFZb+d746YjX90YuexlUq0aq+NZMfgrVlPQroYz0dcXlBrrNYPQXqNP8PIvfxYKBFEIU9AK5F7a
	n/WRVsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQal-00000006Gap-0CB4;
	Mon, 12 Jan 2026 22:40:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQah-00000006GaR-1pWE;
	Mon, 12 Jan 2026 22:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768257647;
	bh=36qLqTSDEnjJClGk7t0KNXMJeK/xpEkNJs2C1xB0rkQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Sd439CFmcd/A+4IKZDBrmZby+gwWEWv71fOHlhPZG6pLWjdY8WSGBmXZ0IzGOgTBf
	 dfD9iJBdpB5x3IhAx+QD3YflxcRkvACP+kwFzStbPD6zN7CLpecZwijbQDaw5eL2rT
	 LyiKW62IKPCDG/N6+HgwihPc1XXQdOtzw1VdoLzqayp+Jkkv2QATnM56FRDn/xcZBS
	 yfJVWAygvVbC19rITn8mwK1+7XU80CFOZwHIJHrHDiB50gy3opZ+IZipXWKJ143NNz
	 CGe+VrZvG9FVgzTntJCvEv2vAB2VOr0kGOb0n/apKoo0nXGNb921j4XyWboh+xHRg9
	 GD74FBHo2o64Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C146F17E0A49;
	Mon, 12 Jan 2026 23:40:46 +0100 (CET)
Message-ID: <0b28ae6d-295d-4958-9571-190fedd95efe@collabora.com>
Date: Tue, 13 Jan 2026 00:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add HDMI 2.0 support to DW HDMI QP TX
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
Content-Language: en-US
In-Reply-To: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_144051_651141_6DFB9ACA 
X-CRM114-Status: GOOD (  13.83  )
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

On 1/13/26 12:26 AM, Cristian Ciocaltea wrote:
> This patch series provides the missing support for high TMDS clock ratio
> and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
> display modes on RK3576 & RK3588 SoCs.
> 
> In order to allow addressing the SCDC status lost on sink disconnects,
> it adds an atomic variant of the drm_bridge_funcs.detect callback and a
> new drm_bridge_detect_ctx() helper, which is further used in
> drm_bridge_connector to switch to ->detect_ctx hook.
> 
> Furthermore, it optimizes HPD event handling in dw_hdmi_qp Rockchip
> platform driver to run the detect cycle on the affected connector only.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Collected Tested-by tags from Diederik and Maud
> - Rebased onto latest drm-misc-next
> - Ensured the recently introduced 'no-hpd' support for dealing with
>   unconnected/repurposed/broken HPD pin is limited to HDMI 1.4 rates

Chris, could you please confirm no-hpd is still functional with this series on
your Gameforce Ace board when testing with a HDMI 2.0 display?

Thanks,
Cristian


