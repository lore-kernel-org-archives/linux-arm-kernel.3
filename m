Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2422DC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGmQmcU6nGcC18gst/c1lOQz4TJAHzdj/MA0mXZlKY4=; b=wQUuLPXVjxuGExlMCbZrgyyFMy
	Ycu4e50NkRuciJ2DSlnsVl7U1ogD0DymYv7kimzQIXDC3tq+DURS6ORbA1Qa3ISkB9jogJcNo8EYd
	QV7qEesA9HgADBcuWzW1l8A66Gv8n53S/diy7PO2AY3P8UcJLr5hVY7IY6iEpNCBtXj4R01IyVgzM
	cQU/z5Gkiiug80+dQ4bDm0/poznvTZf8PlsABdvOj40YSFxs0Hi2/0G26VSmVw7RqXBSZq6fKwi0d
	QjqXkqtcHUBuMDJbSeXed5skoqB+Gi1w8i61Ha691WqJTt4xGI281ZsAkq/TmJ17dA4cA95IcdU0O
	9hA1SJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Je1-00000007oKF-0jFL;
	Wed, 23 Sep 2026 09:52:05 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jdy-00000007oIK-3NXS;
	Wed, 23 Sep 2026 09:52:04 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hqXLM2X8GzKn9j;
	Wed, 23 Sep 2026 11:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790157115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGmQmcU6nGcC18gst/c1lOQz4TJAHzdj/MA0mXZlKY4=;
	b=CZKCgZbG6y8Jh6iBQuevbo4X2YLgYdqoLdnnKeV63ytkSZhkQRlEhm7ANMYuMNF/Tdk9AW
	vuaYVsoL/ac9vOFodcOrZSxjcgxcfc7DWIh1rJ+65P2wTTaoOXEXH8iX3k2kFF4cCT77Em
	btpAFaRXLI8ThR+pzkPiddIfIpQ6/Qrg3JhPmj1E2vjlbwJ3wgIlhT7C2fqAZZFRYHpkbu
	xCBYiYj5xNFlg0NNGMq0bK72YlK0VNExo4bYyRLwN+9iEArDvEBS7S3oUwkGh499B+u1vg
	TX+66Wx25gBpWNsfbCRAdPsVjKQPXo7MiK5k17yGv3ImqXFgg5enhFsAFliAmg==
Message-ID: <588442c7-2589-4026-a8f8-e03f944318c3@mailbox.org>
Date: Wed, 23 Sep 2026 11:51:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH RFC 13/25] drm: Add VRR target frame rate properties
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 wayland-devel@lists.freedesktop.org
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-13-2fcd7d011646@collabora.com>
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20260921-vrr-limiter-uapi-v1-13-2fcd7d011646@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 079bfa1140171f5da20
X-MBO-RS-META: 3rdb1snwyxz3ufm4r4fm5o4bk18hbw86
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_025203_011414_C8DB0639 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

On 9/21/26 17:51, Nicolas Frattaroli wrote:
> 
> + * .. _VRR-MIN-NUMERATOR:
> + *
> + * "VRR_MIN_NUMERATOR":
> + *	Default &drm_crtc integer property forming the numerator of a
> + *	numerator/denominator pair of a frame rate to set as the minimum VRR
> + *	target rate. Set to 0 to disable.
> + *
> + * "VRR_MIN_DENOMINATOR":
> + *	Default &drm_crtc integer property forming the denominator of a
> + *	numerator/denominator pair of a frame rate to set as the minimum VRR
> + *	target rate. If :ref:`VRR_MIN_NUMERATOR <VRR-MIN-NUMERATOR>` is not
> + *	zero, it must be non-zero.
> + *	Otherwise, must also be zero.
> + *
> + * .. _VRR-MAX-NUMERATOR:
> + *
> + * "VRR_MAX_NUMERATOR":
> + *	Default &drm_crtc integer property forming the numerator of a
> + *	numerator/denominator pair of a frame rate to set as the maximum VRR
> + *	target rate. Set to 0 to disable.
> + *
> + * "VRR_MAX_DENOMINATOR":
> + *	Default &drm_crtc integer property forming the denominator of a
> + *	numerator/denominator pair of a frame rate to set as the maximum VRR
> + *	target rate. If :ref:`VRR_MAX_NUMERATOR <VRR-MAX-NUMERATOR>` is not
> + *	zero, it must be non-zero. Otherwise, must also be zero.
>   */

Is there a reason that DENOMINATOR must be 0 when the corresponding NUMERATOR is? 0 divided by any number is still 0.


Either way, should these rules be enforced in drm_atomic_crtc_set_property?


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast

