Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ABECDB471
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 12:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQoETzVYL7/fMAukFP1/FEY+oMvDH3rg5mFsB8017XU=; b=gF7heCUXcHQGpuPIfM3ytj/94o
	x8ZEXlEsGxaeUK+JDY4uKOUMiVIAAIFy6Szu0Ytph/rKqI0JQ9oLbEcgG4oLOiRHwwI8GPmHs9+bq
	/FA9V4h3zUmlZ0vsDnUccnwwnrGPybnsTfW0cNlS2r47tr7h+IdqvZsnDb7tUX/Y6xqG3FdDRw5e5
	wGrx5+Tqq5AvFTdd7+BPAFnEW+nNfG88mgQ4HSIFdU/XvithLGKUxoWNE/1XS6PtkDcOcrcmxYTzq
	b8uTvocyWg4rmp2szA4Fg6AIgGEWJCnvVTNyOgFPRbnY4moiql0heymqP6HajWyJ0lq6W/VhYHhaG
	tKsP3JDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMZY-00000007k5J-1U2Q;
	Wed, 24 Jun 2026 12:19:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMZV-00000007k4d-0URu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 12:19:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E52C0C6B3AC;
	Wed, 24 Jun 2026 12:19:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBC89601C5;
	Wed, 24 Jun 2026 12:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEFE4106C83D2;
	Wed, 24 Jun 2026 14:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782303545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xQoETzVYL7/fMAukFP1/FEY+oMvDH3rg5mFsB8017XU=;
	b=KEv1cfu/jYGfDwre6OwZ+P4Da5g/P5DLOoi4ufNgHjjSXbNTPwIbnYk/UOh9ec76Xi6r/G
	DFd6/DHGMh414txRBF40PoSxV+VlfEMI0dV693nAwprxYHVOsiF4l+Nu7k56WcpLJ+plKt
	M19npB/jcwdfaojICtMPjr+ioXw/rsjoqIyL5YLlhgzfWwm7gkFRNvDV3r+5fmxgiNLiGR
	Fpg//myj41KpNJxvcsa7CgwV2XAA3Pq1OFhNBG6SiZNr209BBBOm7pZ+5lA6O75NrZhmgM
	/YrgBuSybieaZhN5mTMsjq+GstetuZsbblHI6ibs2ayVSjRRAtJDYNmvgfkWLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 14:18:48 +0200
Message-Id: <DJH9VDITIVKV.1UZLU2S53MLO9@bootlin.com>
Subject: Re: [PATCH 00/37] drm/bridge: Convert all bridges to atomic
Cc: "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 "Sasha Finkelstein" <k@chaosmail.tech>, "Janne Grunau" <j@jannau.net>,
 <asahi@lists.linux.dev>, "Benson Leung" <bleung@chromium.org>, "Guenter
 Roeck" <groeck@chromium.org>, <chrome-platform@lists.linux.dev>, "Francesco
 Dolcini" <francesco@dolcini.it>, "Peter Senna Tschudin"
 <peter.senna@gmail.com>, "Ian Ray" <ian.ray@ge.com>, "Martyn Welch"
 <martyn.welch@collabora.co.uk>, "Manikandan Muralidharan"
 <manikandan.m@microchip.com>, "Dharma Balasubiramani"
 <dharma.b@microchip.com>, "Russell King" <linux@armlinux.org.uk>, "Inki
 Dae" <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Alain Volmat"
 <alain.volmat@foss.st.com>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260617-drm-all-atomic-bridges-v1-0-b63e6316166b@kernel.org>
In-Reply-To: <20260617-drm-all-atomic-bridges-v1-0-b63e6316166b@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_051913_350320_DFE7AFE0 
X-CRM114-Status: GOOD (  10.59  )
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

On Wed Jun 17, 2026 at 12:14 PM CEST, Maxime Ripard wrote:
> Hi,
>
> Over the years, most of the bridges have been converted to atomic
> modesetting and hooks, but not all of them. This forces us to maintain
> two different code path in quite a few places, which is pretty
> bothersome. The switch to atomic modesetting for legacy bridges though
> is pretty trivial, and we don't have a lot of drivers still using the
> legacy path.
>
> This series converts all bridges to atomic modesetting and drops the
> legacy codepaths where relevant.
>
> Let me know what you think,
> Maxime
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Lovely cleanup!

Apart from what Laurent pointed out, it all LGTM. Instead of spamming with
an R-by on all patches except 37, I'll just wait for v2 to send a
full-series R-by in reply to the cover letter.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

