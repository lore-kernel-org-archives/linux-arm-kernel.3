Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB9D2F326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHMLXYcYeFMLCHsXk+6wPpFG2rT9iu0Lpjf1Mwx26o0=; b=x4jTSVKJHE2QTc3oCMhftceh+z
	KxPl0wF7JtM/9CnISoINdlWi9lKxJa9a4OtZOWvd6y3/udFfg69GTiS1GMkFz7rT3zYY1kTIyXIc+
	xFfEddoi6B6g1PNhCebjhh8nZQzw+C7wPuAQuqEn/6lIFNBeEwG7e+m/FvHESMFcTXeRH/CpgW7v5
	Rt1Xh8j3FDRWizqQX0IX5uCaGAaRwAtW7poZOPxy6FaanfedJZdhfEmlz5qEBItvT6zOvmM8l07qn
	VAKiYYyl3mnAo0HhtKx4dVwFvowKK0WgTgCQHZvR9pDhEHE/UiXmwkWptQn0QgJ/qLOwWW5z5xsZy
	vctV+ZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgZ1-00000007PDg-1PB6;
	Tue, 13 Jan 2026 15:44:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgYx-00000007PCk-0BTB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44E0F40905;
	Tue, 13 Jan 2026 15:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A405C116C6;
	Tue, 13 Jan 2026 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319046;
	bh=PHMLXYcYeFMLCHsXk+6wPpFG2rT9iu0Lpjf1Mwx26o0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=tmNtaCHZhnOPkNQtKmhqE0bQ88+IeHPB6ckoskfF7ruYjI/e08Cv3ldpq51A8gL5K
	 qq0X+J8iT/Grf19XLTgb5OATfWR284kq/RnlqtUlkNoSxo6eibXw0WFnZlU02HB8pw
	 e2+yJczgiszrzdUco7ZUEptG4UiqdKwfUFwhuaLNX9Vu2S9AuNmlZtb6nkEmMVGIhX
	 KwjPuHC0MsPjRd7zhbOpkBnj44uodYV/nc/YhTg7NLH8IvjByTZDT7JyzL6OyBRWNg
	 BTT8J2U3ljOUcbgUGhMiYHM2lYIf0yxPl3TAE7HT3MbvSZLQTMV1LzFo+UA30q7ZDf
	 YE5fPWPxXXfBg==
Message-ID: <0985336fa75f27b7a85dd41e54a88e06@kernel.org>
Date: Tue, 13 Jan 2026 15:44:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 12/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@st.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_074407_575939_4687ED49 
X-CRM114-Status: UNSURE (   7.34  )
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

On Fri, 9 Jan 2026 08:31:43 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done. Also switch to the drm_bridge::next_bridge pointer.
>=20
> This needs to handle both cases: when of_drm_find_panel() succeeds and wh=
en
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

