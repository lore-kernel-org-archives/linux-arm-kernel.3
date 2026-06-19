Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72232CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 17:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcWQEfyndcVQ4O8u6JJ3iRTBsxvYF5kPlllHHSPe0M4=; b=pFy0ZLQr5X18SUIx/BHkOzfB8t
	MqZ0l4wsMe/po1shJ+64byFFKcm2ci7PQKOJfuRGO5FfZ295w2fDaCXhMdvSS72rJudQlaiqDNmGZ
	p+OCzO3lWqNx5+OrilXjfEqwhGpM+IbOjlMnSB8mcQakdep0tE/sTYTV8T0xi9rGsIsSCsztPKatX
	rPbNYPJtBpOewJTz3NuZe4cwsa6ISGY5hI2MhhKAim5tseNhug5mJzNE6n0Ap6XGlpqdxcjZZo531
	BEVTBXHLmPgY6Hp95waeRlLCdBlVEqNCFwzTEG21vnQAvcfkRIekvltJgSDc6kb70fqkhtqnVV18H
	N3TuQtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadLF-00000002qh0-151C;
	Fri, 19 Jun 2026 17:49:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadLB-00000002qgC-3BcV;
	Fri, 19 Jun 2026 17:49:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24165C653DD;
	Fri, 19 Jun 2026 17:49:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0FFC601B7;
	Fri, 19 Jun 2026 17:49:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24D13106C81BC;
	Fri, 19 Jun 2026 19:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781891352; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EcWQEfyndcVQ4O8u6JJ3iRTBsxvYF5kPlllHHSPe0M4=;
	b=Y2f7a2dojfShmm5ayybMiftPF+oIJHP2g2W5ToLaGoJ4n6yTNSwkUNg5izmHKQF6SYkeMG
	yHi/YcOu7iyOYSmPfhOsKORTKqc1LEZg6u4xM1ErPvdncIlw5My/rkedYa6Zdj1LAJmhnG
	hSR6hiXdUKYxu6EkvhLfkemaShh8KZJldAvAp1ifr7bi23gDfabjersMxRQTdgzYVi9xNU
	5hhw+tuuip9xPZC5hYIyjEYzIjJxfo03veVzZJQZTn73KFIlkxipK+S2l3ALJnCyxMdBAL
	9kxP6cCKVik5s2eBRbBtj7YbRSqJNBojsZl189ArNq+C7H1l7+V4rztAHVwRAw==
Date: Fri, 19 Jun 2026 19:49:03 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mark Yacoub
 <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, Manasi Navare
 <navaremanasi@google.com>, Drew Davenport <ddavenport@google.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 0/4] Add support for DisplayPort link training
 information report
Message-ID: <20260619194903.691023e9@kmaincent-XPS-13-7390>
In-Reply-To: <20260619-feat_link_cap-v2-0-a3dec4c02ad9@bootlin.com>
References: <20260619-feat_link_cap-v2-0-a3dec4c02ad9@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_104917_966337_6055A899 
X-CRM114-Status: GOOD (  19.38  )
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

Hello

On Fri, 19 Jun 2026 16:08:42 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> DisplayPort link training negotiates the physical-layer parameters needed
> for a reliable connection: lane count, link rate, and optionally Display
> Stream Compression (DSC). Currently, each driver exposes this state in
> its own way, often through driver-specific debugfs entries, with no
> standard interface for userspace diagnostic and monitoring tools.
>=20
> This series introduces generic, managed and unmanaged DisplayPort
> connector initialization helpers, for exposing DP link capabilities and
> state as standard sysfs entries, modeled after the existing HDMI helper
> drmm_connector_hdmi_init().
>=20
> The aim of such development is to guide users to select the most suitable
> DisplayPort connector for their needs. For example, if you have a USB-C
> hub with lesser capabilities than your computer=E2=80=99s native DisplayP=
ort
> connector (such as HBR2 versus HBR3 support), the system could recommend
> connecting high-resolution displays directly to the computer=E2=80=99s po=
rt
> instead of through the hub to ensure optimal performance.
>=20
> These new drmm_connector_dp_init() and drm_connector_dp_init_with_ddc()
> helpers initialize a DP connector and expose link training capabilities
> and state to userspace via sysfs attributes under dp_link.
>=20
> Additional helpers are provided to manage link capabilities and parameters
> at runtime.
>=20
> Two drivers are updated as reference implementations: i915 (direct
> connector path) and MediaTek (via the bridge connector framework using a
> new DRM_BRIDGE_OP_DP flag).
>=20
> The changes updating the i915 driver to use DRM managed resources have be=
en
> removed due to cleanup path issues. The core problem is that some functio=
ns
> do not consistently propagate errors through their call paths (whether th=
is
> is intentional or not) making it difficult to properly handle cleanup of
> DRM objects (planes, encoders, connectors). A potential solution would be
> to implement something similar to devres_group for each DRM object type,
> but this represents a substantial undertaking that falls outside the scope
> of this patch series.
>=20
> The MST case in i915 driver is not supported yet.

I have seen and fixed the reviews from Sashiko.
I prefer to wait for human reviews about the core design before sending a v=
3, so
don't hesitate to look at the series. Mainly the first patch which tackle c=
ore
DRM changes.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

