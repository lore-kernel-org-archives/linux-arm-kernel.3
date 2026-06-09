Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FF4CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zF4YvrG+EB8JDL3R6ViMoPNp6HVm/PdHGw9XeWtWNP0=; b=PWnzMvVR0mS8SfMDaArYSS51rN
	3Mwx+mLorK6NF1o48LfBOluBGjviDb2Q5bHzhQO61MxPJ5EKxCFj1XLGHrV84QeHQV50Szoi6iw3K
	xpIAifwFAb3pldjohuut3D3Dv2AucGmPC2zPxYR542OR6jSSWyowDcRS0I6fM5UicOEoCXV7d/bqI
	WTPfMrMzPvQ+lTVnRpHgrK/MRNBu+b1Bv6oDrqCF9jR1UIwbi1eBSEKQ0gLUPLTikBcxQRYEtjYau
	XDltKjFwm0qMoGNtywizMgX9HIHjGp1hCOpsEU+ltBqO1wWsfBC1PFfvi3jOM7SSquioZkbsQSF5X
	F0tYIhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrC0-00000004zNj-25Ey;
	Tue, 09 Jun 2026 07:48:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrBw-00000004zNR-1aOh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 07:48:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3687F4E42C86;
	Tue,  9 Jun 2026 07:48:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04C3D5FFC1;
	Tue,  9 Jun 2026 07:48:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E3FA106A2A94;
	Tue,  9 Jun 2026 09:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780991280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zF4YvrG+EB8JDL3R6ViMoPNp6HVm/PdHGw9XeWtWNP0=;
	b=xXMrahGTUeXtXkGJ1zr5F+G2D852jhc0/A03F6lBVcfVrqhzqKmoQEv40R2zqW46cZb6d6
	hjDKHl0Ur5/kPTFE/PJ/7TEAjbBgzB6uQhLLJIkJYFDjjTSoEOx9QwzRYfA118qcc/odXr
	Hz/1d4uUwhmoOmPoq/n2fCNgxMgvxOg4lZKcSBkP3v6OqjqmkI66vOm0TiK0yPR/5+ohAD
	2Cf5wZnQShXjtrfW5ZZQIXYEN2Wj3ewmIrG+S4x/muNFYbtWCjIstkGSpo+yflrDbrMyEs
	KBFw/VyPOjX/cHVPSscxfEfQ2IftJzHJEmcwawDGO+k0XjHEt/hZ44sXn9MRdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 09:47:51 +0200
Message-Id: <DJ4CPR3MZ41U.2HKE3R0WUGSOY@bootlin.com>
Subject: Re: [PATCH 00/37] drm bridge hotplug
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <DIXTUCXAU68V.1T7X89LMEUF2F@bootlin.com>
In-Reply-To: <DIXTUCXAU68V.1T7X89LMEUF2F@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_004808_731784_56385D7B 
X-CRM114-Status: UNSURE (   5.58  )
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

Hello,

On Mon Jun 1, 2026 at 5:44 PM CEST, Luca Ceresoli wrote:
> Hello,
>
> I presented this series last Friday during the Display Next Hackfest
> 2026. Here's a summary of the discussion.

For the records, the presentation slides are available at
https://bootlin.com/pub/conferences/2026/display-next-hackfest/ceresoli-drm=
-bridge-hotplug.pdf

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

