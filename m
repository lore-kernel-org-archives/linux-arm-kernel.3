Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2E7CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GUtOegaKaEuoYIe2gUZnPLzIbi1AdAO1i885UCYWnOw=; b=QhxitDUzv8ACbU+ETexXi6ckOe
	TuMLjqnKjGGA0koEINNKeifjKXyPdm3UdO/VPDYXU6SlAKtpuETM0ZN3PmR75WoWBu31a54hlFl7b
	45lZ6iRq20x96zz3FWVdXLGCNWrSI4HVUAefkBaM2xoyA5N5ZYpNyGXC2FekmV3V1+gdt+JLRtaSJ
	sehgVwzToyulgXHDEKI+cqUC2QNIBx0gM7of9GkLBq1qc2jh2rhkzYmMGe2Em0hlLVTCRDY24eOo+
	UDjj3oPc+Mwpo6tSxt1TpupOLdGlIheLRQ9rfngFGCi+y+eXd2hLASOXP66ePXNhZQI4wPXH6W3Tv
	9H8TJBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQVR-00000002Q0Q-0iDI;
	Wed, 07 Oct 2026 12:12:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQVL-00000002PyZ-0D6X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:12:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EDC6B4E41117;
	Wed,  7 Oct 2026 12:12:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0B8C6074B;
	Wed,  7 Oct 2026 12:12:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4F7811D5125C;
	Wed,  7 Oct 2026 14:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791375124; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GUtOegaKaEuoYIe2gUZnPLzIbi1AdAO1i885UCYWnOw=;
	b=CKh025rStRMBgZIVwBBXXj0sJ15EK70JxNCCPgLoxkdy2JWTZb0xNXJF432x3eRKRxezBx
	pu9f+f3RpPSPCxIlAifyuScZNFYWv4XpEAzOXBt8b+YR6coMz9qBpAmqYKPlyWWye8LCRh
	uFycpdgAKtcSHfqntQt5C8ShN1FXT7GwuV6dC0P/Lw1aQyNebkHFwIAU5UH7bv0eTa8cVT
	omepT2dvoc17fz/FRRRvBWgB3pJjKvF+ZkV1Cty9APpqkNbY3yd1SQ7jBQrCCc3yycqUGe
	S47LnapQECD9rebkrfAqEtAa3J9YgJ3ls2imv7nrA+P6/kFWl4WKGMJhB72naA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Oct 2026 14:11:53 +0200
Subject: [PATCH] drm/imx/lcdc: fix inconsistent indenting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-drm-bridge-imx-lcdc-indentation-v1-1-3bcf98f3951e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0Q6CMBAEf4Xcs5eUihD9FcNDaVc9I9VcKyEh/
 DtFHyeTnV0oQQWJLtVCikmSvGOB+lCRf7h4B0soTNbYtjam46AjDyphN+PMLx88SwyI2eWyZXv
 uTmgauBZHKpWP4ibz7+Ha/zl9hyd83rO0rhssPO7ogwAAAA==
X-Change-ID: 20261007-drm-bridge-imx-lcdc-indentation-2975e44ea6e3
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_051215_252540_5F5D76A7 
X-CRM114-Status: UNSURE (   9.73  )
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

Fix incorrect indentation introduced by mistake while fixing patch
conflict.

Fixes: 4136a58ced8e ("drm/imx/lcdc: stop using deprecated devm_drm_of_get_bridge()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610060513.s5yUX86m-lkp@intel.com/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 0f95b5592980..30469f98acd1 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -542,7 +542,7 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
 
-lcdc->connector = drm_bridge_connector_init(drm, encoder);
+	lcdc->connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(lcdc->connector))
 		return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init bridge connector\n");
 

---
base-commit: 5d7b464a4f517d1db533b1b231f42ddcf4e1dff4
change-id: 20261007-drm-bridge-imx-lcdc-indentation-2975e44ea6e3

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


