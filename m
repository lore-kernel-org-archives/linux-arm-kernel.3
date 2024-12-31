Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EBBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 00:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMEB8NCZ8QveU/RhcsTwV/DZjVBc049BfdXpRNTavFw=; b=d/RubXjg6wkBU7Kef5T0FO3xGz
	4fNKzSY3W2dkdoeYth1Aelaxl9DBvUqi0IeYMW4SBmYkK2a0ORdk+jcZYv8f78NnUpEGhL/OmrE6g
	zRQET4HYebNMlHDCEf0I8qNLngYieK5n02jP5kTPUqy3zNBf7hQluN6px1HyHvI+wZyn7XmlI8sRo
	IeU+exGemccn+5FjtzU2wYgHAryy0jlDB99T2vBN0rCuxk0SaV4hcB6wlZoYcsdUe25fgqBsN82Nj
	nl5KQ9noS9un4wQAoJVEuU0KZ8lIJnzet34ertAi1ai0HORmburETguIxxRfNpR/4n6Zc1PS68wCs
	Jw+UouAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQNO-00000006E1y-040V;
	Tue, 31 Dec 2024 00:44:50 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQME-00000006DvZ-0i5A;
	Tue, 31 Dec 2024 00:43:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa69107179cso1586459366b.0;
        Mon, 30 Dec 2024 16:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735605816; x=1736210616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMEB8NCZ8QveU/RhcsTwV/DZjVBc049BfdXpRNTavFw=;
        b=LlemakNdrIdzbU2fLxjmpooWZF8IoJ79sNs+nSjJNV10BTiLRH8pyy0RwKiF1D5oM7
         JpZOcWUCNlz4FJSErMC1S9vgVftlhjPTdgaQPSJKUkinfK9PhWc52s6X5+nYwFQGLM74
         2iQ8T1wVkIZ6D4A89RlBlSgL2FCezvUYJDMIkkHDHj3nn1E01c2Tzap1D1iJnapiz+6U
         F0u8EdZCFGcTzZR4HaWkmZBhr+JA8s3920kiD4RZwZXfMH4/ziZ93FNAGCZ5cU1JDCzZ
         ugdxNh3dM1L4TnJCQkyWQBUYIgBuEU5B6yGlWMh35j3PQNK08NhtthK0fw11pE5r5xVe
         NB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735605816; x=1736210616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMEB8NCZ8QveU/RhcsTwV/DZjVBc049BfdXpRNTavFw=;
        b=faof8Pg8ZMHRrX/Rja+TXtHfzS93N8M7lMDSOwcRWnzNLYStL1JBN80M6FFAG3R2lN
         CrIlsKUsXEH0KE+cYGuKxfXMwZaEsrIvFUw4QZgwt8lcvKPVddybUfjSouS8SPjdRaYz
         gsWUuykdM3z8xbup4plqqBlZjckoe7bs/7RWKv4LA5KNq6z75Tc2Zu8qWAlH3Yvt8OaS
         tY/A0PRAZv3O/BkeHvN4fAmDK9ntqDqmvREYXQ82HKUItv4aj687PafI5WXlV9/d0R4E
         arVjBkgWNtRUMOdiGsYjfZ/W7gwsHkvWOhbsMFMt2cmEVb+ABNbyw7jubBwW5vf1aKKK
         zV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJSuuHZQQaty8n7iwKTG9fSZZYMK5xVGggZan2tpPyIWLq2bxH6L4lejkMB+Vm8RKrAPpVahjurAX91ukz5hRF@lists.infradead.org, AJvYcCUtAjj3owCJbsHpuWaP3Aefj5wJHt3X4isJgmey4jr0hAJw/eagK1PQQqWAVM2q6no0P+y9jEZmzhWcdRJvS9I=@lists.infradead.org, AJvYcCWgxGWeCR7f60crf1e0donQLcR3b+cpK8k9lf/OUYRgcj5+/YZOD9lm68T8qI7i9z4rBPjPusmb2rg9xq1k4DU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRqNCn7ezwphzUtjrhOIxrOya14VjeXfdKmxyPqD1pZcJLeeHB
	esFOeQPoAhFpt0UUSv1K6s57nWYdetbWbraFrivvJfNJ/jxlHqpq
X-Gm-Gg: ASbGncsPVix0OWTDzQ9rlrMHrW3++3PIaXTtEigIObSR0tZRgID4iM4BBActuNbh/0H
	/9k1pZwchqTh2ndjXmfDdNPGtveJNzh262FeG6PTUuffY9ox2pH3i/aYBLiBJYcGF6+5y+E+kGN
	0S4GF9jQCREk1htUU/APdQX1hZguLHZ0QfVQZfly5ATBzE4OdlyDuC/Acsi6dFayaJIWKqX8x1q
	sKzMo1kThtqCjIFY+b3zagFlufPI9KzS/NISKpI0tjR7gnPNuS/jSOvwn0cfmhNrb/q61gS8F1Y
	kLd/i+RwqWFDtSK3ygc5QDrPa2MPJ7Z1EKL0JLGQDT4D1y+DR3FgHbuzVPt8FxqZWd5lgX21WN7
	2SSfogIvQz/KWuf/nPQM/BcBRHA==
X-Google-Smtp-Source: AGHT+IHEGIcJK+SSB1VqPTnorkRP+VtiC6uvv9JG0CKDkLO9JdbaG0jU5yoLZ0jcvFezMTEsCCv8Bg==
X-Received: by 2002:a17:906:99cc:b0:aae:85a9:5b66 with SMTP id a640c23a62f3a-aae85a95d37mr2281685866b.60.1735605815987;
        Mon, 30 Dec 2024 16:43:35 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a465-b000-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a465:b000:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0f06dc7esm1523425066b.193.2024.12.30.16.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 16:43:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dmitry.baryshkov@linaro.org
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	alain.volmat@foss.st.com,
	alim.akhtar@samsung.com,
	andrzej.hajda@intel.com,
	andy.yan@rock-chips.com,
	angelogioacchino.delregno@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	dave.stevenson@raspberrypi.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	inki.dae@samsung.com,
	jani.nikula@linux.intel.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kernel-list@raspberrypi.com,
	krzk@kernel.org,
	kyungmin.park@samsung.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux@armlinux.org.uk,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mcanal@igalia.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	perex@perex.cz,
	ple@baylibre.com,
	rfoss@kernel.org,
	rgallaispou@gmail.com,
	simona@ffwll.ch,
	sw0312.kim@samsung.com,
	tiwai@suse.com,
	tzimmermann@suse.de
Subject: RE: [PATCH v10 03/10] drm/connector: implement generic HDMI audio helpers
Date: Tue, 31 Dec 2024 01:43:11 +0100
Message-ID: <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_164338_207095_A8EECEE4 
X-CRM114-Status: GOOD (  17.28  )
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

Hello Dmitry,

this is great work - thanks for your efforts!

To give some context:
I am working on a HDMI controller driver for the Amlogic Meson8/8b/8m2
SoCs. Unfortunately the driver is not mature enough for upstream
submission (all I have is the vendor driver which serves as reference).
That said, my goal is to upstream the driver at some point. I have
already switched my driver to use hdmi_{clear,write}_infoframe. Now
I'm trying this series to simplify my code even further - by using
your audio helper work!

> --- /dev/null
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -0,0 +1,190 @@
> [...]
> +static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> +	.audio_startup = drm_connector_hdmi_audio_startup,
> +	.prepare = drm_connector_hdmi_audio_prepare,
> +	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> +	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> +	.get_eld = drm_connector_hdmi_audio_get_eld,
> +	.get_dai_id = drm_connector_hdmi_audio_get_dai_id,
> +	.hook_plugged_cb = drm_connector_hdmi_audio_hook_plugged_cb,
> +};
On my platform drm_connector_hdmi_audio_prepare() is never called. As
a result of that the audio infoframe is never written to my HDMI
controller hardware (hdmi_write_infoframe() is never called with type
HDMI_INFOFRAME_TYPE_AUDIO). My hack to make it work is to add the
following line to drm_connector_hdmi_audio_ops:
  .hw_params = drm_connector_hdmi_audio_prepare,

I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
seems that there is only a single driver which uses the .prepare
callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
implement .hw_params instead.

The audio controller code for my platform is already upstream:
- sound/soc/meson/aiu-codec-ctrl.c
- sound/soc/meson/aiu-encoder-i2s.c
- sound/soc/meson/aiu-fifo-i2s.c

My understanding is that you have a platform with a lontium-lt9611
HDMI controller available for testing. Can you please help me
investigate and find out which piece of code is calling
hdmi_codec_prepare() and therefore lt9611_hdmi_audio_prepare() on
your board?


Thank you and best regards,
Martin

