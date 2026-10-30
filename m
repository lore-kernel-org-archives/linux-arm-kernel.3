Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1069E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSU5w1Dv;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=iGejnlw9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2SEJFh+LRxwXXlyrTQik91s/Kz05ep2+6P2vUZ4sEQY=; b=CSU5w1DvGNCKw4cV3JvBLPFgla
	vT/qPI7nobONjymdsLrVrMMWOkGgM9mnoyH6V7XF0Twc3EFxJzPhPS3vgNgBwPdiHnQmWwbIhKQMA
	aBKswr5TRrsWpeTDJaDtHtzXDaCTDdBY571bSAeXtATyJRNRmaCw3rxvYaiQ+6aHEU7aft7HdpBNQ
	jJI6Y88H+yZ6NGyCFMnGH12qdF1fjnbRUFahoTuHNb+NnfbCWcmkM6bUXQfxVhdefmIfhECwn9B+y
	mp5CiPODdrmcD/LNQ7k03EeFAl7OCXSPJwaoJl8XXmVWaxpiV3DQtbNzIDDVBMzJQepxd5zEB3sbt
	wRMc3alA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhpi-0000000B5zc-01JK;
	Fri, 30 Oct 2026 08:19:30 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhpc-0000000B5yk-4B7K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:19:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92B7D10BE43;
	Fri, 30 Oct 2026 09:19:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793348355; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2SEJFh+LRxwXXlyrTQik91s/Kz05ep2+6P2vUZ4sEQY=;
	b=iGejnlw9tE4nldq8GEJwD76geEShEcplvgy2j5ywp1hc95+TEFevLKorMIWO7eoy379ABq
	e3iWsHctftr8MYZoS7Vds3fZclDKJ4wEXL5yh8Ij8X4H6l7khMvKJrLHSK+HTV9+XzoSO2
	4stRlzKPeJAx0sx1MFc8tbcc167ywRbXGrQxGeJ11pRRc+MI4aCt0x6rNPI0M+NbFnm4Ic
	MYvEUMbWpWux5r/74m/dksWm/L0XArjH2Tkh2KWLdKKEahH5eD/pQzR4JO+otmu7Tv0eCD
	dPP5bcaT8ENwD2bRWiYLlUOVMxolRroMz5e1mrUqYugATKELCN/2DWSFXikBtQ==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/mxsfb: Update MAINTAINERS entry
Date: Fri, 30 Oct 2026 09:18:49 +0100
Message-ID: <20261030081908.324212-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_011925_263817_D5F32A0A 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fill in updated email address and imx@ list, no functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add the imx@ list
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75ef3d1aa9d6e..4476471b58445 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19168,9 +19168,10 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/tuners/mxl5007t.*
 
 MXSFB DRM DRIVER
-M:	Marek Vasut <marex@denx.de>
+M:	Marek Vasut <marex@nabladev.com>
 M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
+L:	imx@lists.linux.dev
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
-- 
2.53.0


