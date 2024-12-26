Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C524E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXPgWv/039w1DyrPkw5OOxKhH6440KjCye1nUeVurvk=; b=k6LYEbQ2tcKO2XEbyw4TU+faiC
	B2XT03RH/68LaPwtXlHIixL7zYucUz8DmklGF4oEwECTPG7Yh22FHleZ2jBh6phkM9fBGteceMo6T
	za+3ZlNAUSiN+FPba1NtwumaEAPsCh1V07y14iOGV5RPVApenjbx934KCpo6ilNPrxlE6Lqc0R3xn
	p6/q7llGx/kDs1BtFtzyAdLTzNB3rEuBJG7O4/rtJj1NTOQgmKv7Gm0Hcsu+MJtE8vAhEcdIxrdVy
	kKA0YH2gbPKIuc0+4BWqmcMVUguKEKIrvJ1bXJSiayuF3YowTPALM0BC7gIrJ3Z3VGTU5wA55fgNU
	hv6al6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdl3-0000000EzDc-2te1;
	Thu, 26 Dec 2024 02:37:53 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdbu-0000000Ey0h-3ldZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 02:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=yXPgWv/039w1DyrPkw5OOxKhH6440KjCye1nUeVurvk=; b=OWjTPVYFBHSCtQMs
	8L78DLn9tCBaDou3Ky31EIG4UabrDzOUFYegaOp0IXEQSpBiUYDy/H/uSuWiU1NleRQg2jzFqyMbt
	AssPaAXJy47TFNuFXaAyiA6aLn4Yw9GbFQN1KdVc7rQuS/5TcukA/Ih5LGmrJGsHs0f1BEssx5JfD
	p5v3xFFui/5Bc/BivfJ90lClLt3vskDfhQZPmex16Ny0katC6ZqdOADSj7O3Zk2KqF6r+WwDqPa3R
	FEU76F6ahoRcPC+1LqfMrlSNdu72IwTsjEma31ba+yIp4//bDnzFmdZ2TxRJavmKNgNJfA+xWKtJd
	RiUDMxUtLrXmi9UkHg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQdbP-007F0L-2Z;
	Thu, 26 Dec 2024 02:27:55 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	deller@gmx.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/7] gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
Date: Thu, 26 Dec 2024 02:27:48 +0000
Message-ID: <20241226022752.219399-4-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_182826_937172_EB9794F3 
X-CRM114-Status: UNSURE (   7.77  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of ipu_idmac_channel_busy() was removed in 2017 by
commit eb8c88808c83 ("drm/imx: add deferred plane disabling")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-common.c | 6 ------
 drivers/gpu/ipu-v3/ipu-prv.h    | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index a8570e1bdf28..fa77e4e64f12 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -484,12 +484,6 @@ int ipu_idmac_enable_channel(struct ipuv3_channel *channel)
 }
 EXPORT_SYMBOL_GPL(ipu_idmac_enable_channel);
 
-bool ipu_idmac_channel_busy(struct ipu_soc *ipu, unsigned int chno)
-{
-	return (ipu_idmac_read(ipu, IDMAC_CHA_BUSY(chno)) & idma_mask(chno));
-}
-EXPORT_SYMBOL_GPL(ipu_idmac_channel_busy);
-
 int ipu_idmac_wait_busy(struct ipuv3_channel *channel, int ms)
 {
 	struct ipu_soc *ipu = channel->ipu;
diff --git a/drivers/gpu/ipu-v3/ipu-prv.h b/drivers/gpu/ipu-v3/ipu-prv.h
index 3884acb7995a..16322b2137f8 100644
--- a/drivers/gpu/ipu-v3/ipu-prv.h
+++ b/drivers/gpu/ipu-v3/ipu-prv.h
@@ -216,8 +216,6 @@ void ipu_srm_dp_update(struct ipu_soc *ipu, bool sync);
 int ipu_module_enable(struct ipu_soc *ipu, u32 mask);
 int ipu_module_disable(struct ipu_soc *ipu, u32 mask);
 
-bool ipu_idmac_channel_busy(struct ipu_soc *ipu, unsigned int chno);
-
 int ipu_csi_init(struct ipu_soc *ipu, struct device *dev, int id,
 		 unsigned long base, u32 module, struct clk *clk_ipu);
 void ipu_csi_exit(struct ipu_soc *ipu, int id);
-- 
2.47.1


