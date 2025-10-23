Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CFACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 21:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlCb57iogblLAGrq1TTAe6rWqqwvLuhqxliEU/1dNM4=; b=tJlNZrZsnGZvd7+MNf1Tdba/Tn
	uV3wMbAalLalh0B1TLh/nk56q/U6EtFE9/vItV7eL2nXGIK4yihisJDhgkUqBB0oAG0L8yeq6/7pf
	EHUGHwtF6Dgk8TxcqqcS4/PwjBY8pPuAc/hPdXT0Uau2Q0KlQWhdxs9qg443kKWvkaR6sidz/OAdJ
	6KZFwoz8ZBtUX7cajt3Gjfg8bK89e6jSFcSiFVOhPdxq9c2MB1duz69rVfwu4TPlAQ/v44jsO7s6D
	GAu2fYG8bzqbSVXtPYUn6Gs1pp7eAtbEUyOra+WCujQBhnS7cAAmreHbIeKWG3pVL9CJdnD88kp+r
	pb1Ay/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC35y-00000007fkY-2svx;
	Thu, 23 Oct 2025 21:43:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC35m-00000007fPe-2ieR;
	Thu, 23 Oct 2025 21:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YlCb57iogblLAGrq1TTAe6rWqqwvLuhqxliEU/1dNM4=; b=ZXbgCQF/uRuoF8mpXuCw1nJz6e
	20eI0db+2DjVtBCV2grLUGATJWCSUqPqJsrl+esF6dUszhgDb1M9jF7vazIb13U3pprisJ3ibzNeS
	QY++WjFZhjt67V4Kyl5TLBF00ip3prrNFZQy2/dEEqnf2N6z/yL9rKvZFEoH1vHq3aOObnVRK4YPq
	TN2JDQ0E1fkTIcOJB5lrlR2xieC7fJinexpaC7iMkQ4NDYANV1CiWQ+ExOyRHF6FrkOVuDhghJ4a2
	s5o+kBR8i8IcFekLI40OOKkA8P89cNNOtmuqPzMp88xfmcCpCayjng27XNiVPbFJBTTQ/At6lJ6IA
	FT0QalNA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2E4-00000001n2S-0P7z;
	Thu, 23 Oct 2025 20:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761255805;
	bh=YZK2TjreEOWDue2oa+J/BEkl8c+2PLz43fBpdNiil1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AAqhbXk7pnknoFyroevHAtQ20ltqJhzXpxHyshJreB5Z8ONxcGlkSo8GXnVWLq/uZ
	 ujEtpqRnA9a1AmfXlDW/WlPE7YlEHCsBUVSUGM8DcJF3tVUnaVARo2P0xn7M10rMWI
	 HxjdUmaXBTku1PIuv0dBo7AD5R+0Uk6nGu0/EeRApp9aEV2pL4VpSCyaYjWkPZIzc2
	 6St3khEHYg1iJD2N9kogEuF61CMvv5vyOnIOa5l/TiBtzvqZaDBPZrvN1rJXhXHXmX
	 aMDBwfM07Yc3EVDClOw38bMUp3cdudZmGxA29cF4wJWaLVQtU1TzIkGHnB9D+CKKJc
	 gRF8JgsFaFewg==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6B1717E1340;
	Thu, 23 Oct 2025 23:43:22 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v5 11/15] media: rkvdec: Enable all clocks without naming them
Date: Thu, 23 Oct 2025 17:42:42 -0400
Message-ID: <20251023214247.459931-12-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251023214247.459931-1-detlev.casanova@collabora.com>
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_214800_371483_5D4DCFA4 
X-CRM114-Status: GOOD (  17.08  )
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

For other variants, the clock names and number will differ.

There is no need to keep track of the clock names in the driver so drop
them to avoid having a list for each variant.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 26 +++++--------------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  1 +
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 36193cff6448..f043b07c8e7d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1311,15 +1311,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
 
-static const char * const rkvdec_clk_names[] = {
-	"axi", "ahb", "cabac", "core"
-};
-
 static int rkvdec_probe(struct platform_device *pdev)
 {
 	const struct rkvdec_variant *variant;
 	struct rkvdec_dev *rkvdec;
-	unsigned int i;
 	int ret, irq;
 
 	variant = of_device_get_match_data(&pdev->dev);
@@ -1336,19 +1331,12 @@ static int rkvdec_probe(struct platform_device *pdev)
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
-	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
-				      sizeof(*rkvdec->clocks), GFP_KERNEL);
-	if (!rkvdec->clocks)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
-		rkvdec->clocks[i].id = rkvdec_clk_names[i];
-
-	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
-				rkvdec->clocks);
-	if (ret)
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
+	if (ret < 0)
 		return ret;
 
+	rkvdec->num_clocks = ret;
+
 	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rkvdec->regs))
 		return PTR_ERR(rkvdec->regs);
@@ -1426,16 +1414,14 @@ static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
 
-	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec_clk_names),
-				       rkvdec->clocks);
+	return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
 }
 
 static int rkvdec_runtime_suspend(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec_clk_names),
-				   rkvdec->clocks);
+	clk_bulk_disable_unprepare(rkvdec->num_clocks, rkvdec->clocks);
 	return 0;
 }
 #endif
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 0c36e8e9b0a3..7bfe88698616 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -127,6 +127,7 @@ struct rkvdec_dev {
 	struct v4l2_m2m_dev *m2m_dev;
 	struct device *dev;
 	struct clk_bulk_data *clocks;
+	unsigned int num_clocks;
 	void __iomem *regs;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
-- 
2.51.1.dirty


