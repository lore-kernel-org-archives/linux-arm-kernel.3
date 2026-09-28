Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B31EC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TrL1LK87jREhsshgj9afbV5g3GJEMSvHjNMsw4bwYc=; b=kecrPxR+BsKqpFOn14f9cTCBKn
	Na8Ok9y6Hsdw/7MI7chuorcY0Y/YnzLPE7H7wFGZOvAdODoFjnNYyWN8Fv1WR4zwS/3sa6yuTXXFQ
	hd/blJieQglDKsPX25R0RgLEnoCiPcj4G5EQCC0qBdDQiQFVLY2VoYeZxywxMO0/3ZHpLLNb8SLYQ
	IKlHhjZMFdEseo0q0KQ0nzlY0iiHFy9TW+ReV6LHWHjis3+uRLYl35pc3WHpEVw5r15kGXroX2x9j
	63/NXqqRlyzt1xst/VkrD3AINfgNfj4cdibaAN20Y+OVQR4teg4TjnkL9TDeONREBLxg/bVVReLDB
	zebj37Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB72U-000000008pV-43iu;
	Mon, 28 Sep 2026 08:48:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB72S-000000008oC-0Dxh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:48:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 003371A0D72;
	Mon, 28 Sep 2026 08:48:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA3E4601BD;
	Mon, 28 Sep 2026 08:48:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9ED0102F1EA6;
	Mon, 28 Sep 2026 10:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790585317; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4TrL1LK87jREhsshgj9afbV5g3GJEMSvHjNMsw4bwYc=;
	b=ZDa58Au2RHTizRo43gJ1JRUszIzTyZQkH6fdz231iZk+mFK47kmlmDY+0VETY5yPpnsekI
	H2W47fDdg16ql/VlkfIClEu+3ESEBPzsHVxHQwSdkpqq7xS/LmLFAZ+c1Cwv0IKbwSw7wN
	UNguMPFymrWlqGCyroCsOi8X9w+cBGPYBNKhNvYG1RBg11GdeNJxoWlU5ueicQVxlBuyqM
	rssKNaxcGDmyEx8/mRYdRbY6UDDqUJjccvTKQdvCwKLp+ozx2FfNr7mFPECEsnr5mrfBuE
	Qly9BUoYG+GYmxYZ6jpGEQOn3mIhX3sFqMhz33riAziOXByw/e3sDqg5nym3vw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 10:48:20 +0200
Message-Id: <DLQTIJA71AQ1.1RASTM0D6GMGX@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>,
 "Lucas Stach" <l.stach@pengutronix.de>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Linus Walleij" <linusw@kernel.org>, "Inki Dae" <inki.dae@samsung.com>,
 "Jagan Teki" <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Sean Paul" <sean@poorly.run>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 00/19] drm/panel: embed a drm_bridge into every
 drm_panel
Cc: "Albert Esteve" <aesteve@redhat.com>, "Anusha Srivatsa"
 <asrivats@redhat.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mips@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <asahi@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_014844_221191_18F9C426 
X-CRM114-Status: UNSURE (   4.91  )
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

On Wed Sep 16, 2026 at 3:45 PM CEST, Luca Ceresoli wrote:
> This series embeds a drm_bridge into every drm_panel, as previously
> discussed [1][2] and in previous iterations.

Series applied to drm-misc-next.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

