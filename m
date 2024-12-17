Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F12EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RolKsme1G9Rjox6sw68grNTuofAMfeweMCbeaFaOjdE=; b=P2oS7aqQYmLNwVu8qp3vy918h2
	lKlZ1Fg6MsmZbLlvj7cpsM5mh8quomGYJZIHectKpRmbrs3qxmkyJUSEhY+psrsppqPa+3cfyD1aJ
	qckW51aXjAI1fJG9o1n1+J9yUeNJqBXztHFr1eFjBmTg4W+j9w0bqS0sN0lvnZ5YtLSGuISOY2UsE
	4B6d6IiVzjlQN0dKGUpjctSbS+4dqvUCkjh/o11Rs7pb2i7uZgHmnRNI3wCBK64+KnrMT+353U/Cn
	sbxT1fKvYM1QKzkTqywcvnZodkMl3pDZAjVNHUWQFk4Wedl3EFHDsmsbfyzT3OQzMiyXF0cUdzBw1
	Z4puG1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWpm-0000000DP7O-1LeW;
	Tue, 17 Dec 2024 12:37:54 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWog-0000000DOzR-2B7d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 12:36:48 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1734439003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RolKsme1G9Rjox6sw68grNTuofAMfeweMCbeaFaOjdE=;
	b=WrnXm66oWyjzl5/KX5EDjjmy8k7gwxzTP0hDuvZDpj1vGd/1V7BBy61LdZaM5wSNYAjoXj
	FnPekO+HSxOYXxOIIoW+7HgnRyQlCdmWs3uMcVxDzMYbEns3wmGenx0D2dzkfH6HdiiTxV
	QtU7idQ6FjTQmrXHPWjFWO9yfp7MCANXq3Svn8ytWYeGIeiCMf3GYKb+i+J6nOqVHRgP/+
	XIa2cUnJ8EppY4xpTSJQTwcrVpDLqGmSQHRChEs0mQvjWib/fprlCbFw7GlXcE1cLBKvId
	84zo5MHicnENQIC+c1VQLKfyj2A0lXBQXWzen4IfKjBWGQMtbqrepa8h8eDALg==
Content-Type: multipart/signed;
 boundary=213d8d12555ec1eb5ee8f786b8c3bbdacf37d77fd939badb04e2ddb33646;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 17 Dec 2024 13:36:29 +0100
Message-Id: <D6DZB443IQ7A.3P1135M6DMF2S@cknow.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Phong LE"
 <ple@baylibre.com>, "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Russell King" <linux@armlinux.org.uk>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sandy Huang" <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, "Andy Yan" <andy.yan@rock-chips.com>, "Alain Volmat"
 <alain.volmat@foss.st.com>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Raspberry Pi Kernel
 Maintenance" <kernel-list@raspberrypi.com>
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_043646_831543_515920A9 
X-CRM114-Status: UNSURE (   6.02  )
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

--213d8d12555ec1eb5ee8f786b8c3bbdacf37d77fd939badb04e2ddb33646
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Dec 17, 2024 at 1:40 AM CET, Dmitry Baryshkov wrote:
> This series depends on the ELD mutex series [1]
>
> [1] https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a=
6545c03@linaro.org

There's a v2 of that patch series here:
https://lore.kernel.org/all/20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8=
bea@linaro.org/

HTH,
  Diederik

--213d8d12555ec1eb5ee8f786b8c3bbdacf37d77fd939badb04e2ddb33646
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ2FwVAAKCRDXblvOeH7b
btcgAQCrCEekrUY/E2pSYqYaHT6HKwkoEGuruBblZdydAr68eAEAsy2oRKKCWk/8
hitjosySt34ZoKPme2E/QoeOAZUr1gA=
=oJtw
-----END PGP SIGNATURE-----

--213d8d12555ec1eb5ee8f786b8c3bbdacf37d77fd939badb04e2ddb33646--

