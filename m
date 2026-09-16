Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C46C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qxk4hZKrvnvA0PquoaWC/xjCQiHNru1wowbzmQvX2Mc=; b=DW7fWT8RZeIK7H9kmbLNRxBljb
	Ql2GlANQmlH/Wk/lV8YoQtK9NRECgvvbl44V0pGkM05drriH58abPSlzO1S14KlcDDeWdWigXesJS
	Rjx5iiGczejB0lRk8+bMXD71yPNoDgRA9dDalviv5Gyf64+ZQwjq+TgOqj/azG4LlQQidhDbLzdTj
	MnBYKZC+qFCtRed2xPZLFgElQlDEllbRml+1GIYxVH2iqsivbQeM91gvPFuHMT86DsgrNFpJKRwcx
	gQe6wYp/F6BVYGa9ZINnr8uhufxTdBqVZUadP8Nl18pJ6sl8pkwrGv85k+cDPK6eqTYTi0LwCI0dS
	Bi4BYgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rLw-00000009Xqv-2Nim;
	Wed, 16 Sep 2026 15:15:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rLq-00000009Xgi-2bGj;
	Wed, 16 Sep 2026 15:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Qxk4hZKrvnvA0PquoaWC/xjCQiHNru1wowbzmQvX2Mc=; b=GRF52u+x8/DRhBnhjewZAdEiOl
	vcw6/LNPmGgWoZX5JTaRQBaihw+faiOQNOmmvPfj6XeVUmCO7m22UWWXr/gXt90XPJIKqBf2yqupm
	TAroCiB2SP1Rv1JG55w1MHxKYUkdlOWN7faw0PWCmG+DFINAzFqOKJSKMeaZFxbZoZeJs9phL0WOZ
	u3+VSX7ZRN9v1mGn3oPrtSbZTUNHYDDXBbIEOEjNKmdzC6zgz2+RtdepWpLLDFKl4U/br4NXFDGMG
	v5xtMJ1b+0UUJcZTm+MXwt8oYH34e++uFoPZPLgVIiyuknkaMikqvPjxZ0HQ9V8qdVl7xfJJ6dhUL
	QUrYIN3g==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6rLg-000000081m0-1Mfv;
	Wed, 16 Sep 2026 15:15:07 +0000
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BCA07205A04;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGn-001Fsx-0N;
	Wed, 16 Sep 2026 17:09:57 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:56 +0200
Subject: [PATCH v2 15/17] media: rockchip: rga: bind all cores to the
 master
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-15-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_161505_359194_3F2745BF 
X-CRM114-Status: GOOD (  23.14  )
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

Bind all core components to the master component. Previously only the
first core has been added to the master device to avoid creating
multiple video devices. As the video device creation has been moved to
the master component, it allows us to bind all cores without creating
additional video devices.

We expect that all cores to report the same version number, as we only
add cores with the same compatible value. This is important, as  we
setup the command buffer before actually scheduling the work to a
specific core. Therefore adjusting command buffers depending on the
version register only works when all cores have the same value.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2:
- Fail (instead of warn) on a multi-core version mismatch
- Also decrease the num_cores when unbinding a core
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=13)
- move rga->cores at the end of core_bind here
  (previously done while moving code to rga_core_probe)
---
 drivers/media/platform/rockchip/rga/rga.c | 36 +++++++++++++++++++++----------
 drivers/media/platform/rockchip/rga/rga.h |  1 +
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 39fcb5623095b..5348fcc03c525 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -746,23 +746,33 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rockchip_rga *rga = data;
 	struct rga_core *core = dev_get_drvdata(dev);
+	struct rockchip_rga_version version;
 	int ret = 0;
 
 	core->rga = rga;
 
-	rga->cores[0] = core;
-
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
 		return ret;
 
-	rga->version = rga->hw->get_version(core);
+	version = rga->hw->get_version(core);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
 		  rga->version.major, rga->version.minor);
 
+	if (rga->num_cores) {
+		/* we are not the first core, expect that we have the same version */
+		if (rga->version.major != version.major || rga->version.minor != version.minor) {
+			v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with different core versions!\n");
+			return -ENODEV;
+		}
+	} else
+		rga->version = version;
+
 	pm_runtime_put(core->dev);
 
+	rga->cores[rga->num_cores++] = core;
+
 	return 0;
 }
 
@@ -770,6 +780,18 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct rga_core *core = dev_get_drvdata(dev);
+	struct rockchip_rga *rga = core->rga;
+	u8 i;
+
+	/* Remove our core from the list */
+	for (i = 0; i < rga->num_cores; i++) {
+		if (rga->cores[i] != core)
+			continue;
+
+		rga->cores[i] = rga->cores[rga->num_cores - 1];
+		rga->num_cores--;
+		break;
+	}
 
 	core->rga = NULL;
 }
@@ -992,14 +1014,6 @@ static int rga_probe(struct platform_device *pdev)
 		component_match_add_release(dev, &match, component_release_of,
 					    component_compare_of, core_node);
 		num_cores++;
-
-		/*
-		 * As multi core is not implemented yet,
-		 * break out of the loop to only have one core per rockchip_rga struct.
-		 * Also put the node, which otherwise would've been done by the loop iteration.
-		 */
-		of_node_put(core_node);
-		break;
 	}
 
 	rga = devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cores), GFP_KERNEL);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 94e14c2a2ba6e..522021c3e0249 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -89,6 +89,7 @@ struct rockchip_rga {
 
 	const struct rga_hw *hw;
 
+	u8 num_cores;
 	struct rga_core *cores[];
 };
 

-- 
2.55.0


