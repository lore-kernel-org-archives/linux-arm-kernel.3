Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3QsqKiz/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GhJfjsrl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=i0wp/mm6haAP0V/K/nQCNw1NRVKeQLSfU1S8NxuwQDQ=; b=3QsqKiz/SI/ZvWTH2kmVgg6lKO
	3LnIkot6noLdvVYjVDBINl8BH6mn05c95+UsvG3nfcJluZFGQmdzENRHbRfMLtCmR2rsLJVcm5Are
	JEGqYQ55O53e8478scp4ympUxLixrjYR+J9ijPPMbNoQq+fMJYWoLB3wQD6DoDO/8RhQJ7DqD1dq+
	UgAXlHePD7Wkc2NaKI/VF8vNnAbQrTr231qPChESu6PQdZbGEqzK73A8IfCM+G4gSk4DBXhOiww99
	dMRpQT00+NKJa+A52BLm7arHhOT6FWqgE2+wAbLtWWJYqpo66Co+BQKkUxNA5seWEZBnANeXGlU7I
	cVTQdPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSbA-00000009jNO-0p3v;
	Thu, 29 Oct 2026 16:03:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSb6-00000009jN7-0jUA;
	Thu, 29 Oct 2026 16:03:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC96A434B8;
	Thu, 29 Oct 2026 16:03:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793289801;
	b=3NouYxLtblll+fibHA640MjR88teZn3wNrBNUceF+tOjHIXZZ/XEtYz7OynPEyE+jjgc
	 dEP0ko4GRKBpl/RhB44qKjZuhOl3PLXjiUoX90OgcD9Um6G6h5q0GtojZKEptcA8vb9rt
	 YdEOVXEoSByKhTqtsDdaYEMB6QCd6Q0eoiDKppEe1aW+I1IzcKiW089afWXs/xjgknz64
	 +3LsjTD1E6Vfl4U4fqw1EMBTfPJyGrXqCntb8C0GYEzWgD/h7G5XBLE+wuxkRGDuDnqWa
	 ZfTQkyMtGUdY5kS1tyD+Xe7B45CficZylqcLrWe/1jdzfcV7SCQ17+7Yk50WtBB8KDA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793289801;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=i0wp/mm6haAP0V/K/nQCNw1NRVKeQLSfU1S8NxuwQDQ=;
	b=K8yDwhx0y4kv1sEtmWtrCAkNWQMjzRxYONFpP499PU7LWUYZlslfiifcCnuMnfnDuG7S
	 +v6lYojilhrCgRGhAX82NKT6F9hu7FKfqcfKFL7bqh4u+skAMJ67BHPQRCPF8fgmks3Xz
	 TO+943a2yZSXsfnVUXZqY8lBGxtkdn8S5aAAVc8mg9B5g+4YWQ43wVgyqsLDSRvwQcBVm
	 NN7n9ExCycq77a63fOqyXy8RM3+eG6P5SyESi1rZUvMI4WK/QiKws5GsyTrUg+K0gPNLo
	 R+eX1iCtq/sY500b6H2MCxu82VaQb2cvSPnWa5h4s/Rq/n8ubn7atw8sLgB16xVyshQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFCEA1F01816;
	Thu, 29 Oct 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793289801;
	bh=i0wp/mm6haAP0V/K/nQCNw1NRVKeQLSfU1S8NxuwQDQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=GhJfjsrlCuCw0OSIETBXxl10iwXWD3c4naGs9sDVveqkd0WJI6zVaWic0JsF0thNA
	 w4NDwmb4w+2S4ZTjltHhfM9/ZAQvDZ+DiWQ4U0y1X+2FLrVjwvQiEdJUmPPxs0QW+N
	 8s4j4SHL1CGcomxeC+Te6Mc6ZXHD4/7lq65bQOVsFUxA7wDd+wYp2+4O7CSur3r+12
	 FqgUUpRCYmvjjtghW2Qtf6LEfNiEJw3YbzSU68XOArTa7JuR6yjqYsaphh2Rce68Ae
	 dQXU/li8+bt+DaDXjAobwKgnXEIxjKoPCMYF2eIrlyvK/bCOrgbzJlNe/o99C4UI0e
	 XN3waOn5E8hMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 42276458F2;
	Thu, 29 Oct 2026 16:03:20 +0000 (UTC)
From: Valerii Bokov via B4 Relay <devnull+vlry.bkv.gmail.com@kernel.org>
Date: Thu, 29 Oct 2026 17:03:13 +0100
Subject: [PATCH v2] media: rkvdec: vdpu383: configure the reference read
 cache
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261029-rkvdec-vdpu383-cache-v2-1-859bb44e03a0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0Jm7RjaEdK48h6ERWkHmCg/abXRE
 O5u5QIu30u+920QOQhHuBYbBE4SZZkz6FMBbrTzwCg+M+hS16rUBsM9eXaY/PoiQ+isGxlN33W
 9IUXeEuTpGriX95Ft2syjxOcSPsdLUj/7J5gUKvRUXYynjipT34bJyuPslgnafd+/F+3q4LgAA
 AA=
X-Change-ID: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerii Bokov <vlry.bkv@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793289799; l=10924;
 i=vlry.bkv@gmail.com; s=20261028; h=from:subject:message-id;
 bh=vPKssOpH7rm17FJw7zQKtZ43E9tGtwv6Ww4Ilm5fdec=;
 b=NJ2r8ar99fkcqCDQWka9Y8mDyUdUbetqcb3yBxSNBm++tTqt10b7NvOFyN6IcYAyHuR+yUDqP
 NEaAyB+Qip7C6gU9HqEOzAEaHfshR9tDbYZ/dbpHqPIGfYucWdwi5nL
X-Developer-Key: i=vlry.bkv@gmail.com; a=ed25519;
 pk=u/rk2lx5DMp734XMF4ThLZD2H0AqvfYuikR7wu2iyNA=
X-Endpoint-Received: by B4 Relay for vlry.bkv@gmail.com/20261028 with
 auth_id=1342
X-Original-From: Valerii Bokov <vlry.bkv@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: vlry.bkv@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Valerii Bokov <vlry.bkv@gmail.com>

The VDPU383 has a reference read cache with its own register region,
"cache" in the device tree, which the driver does not map. Its
configuration and read limit are therefore left at their power-on
values, and those differ between power-ups. On RK3576 this makes H.264
decoding of a 2688x1520 stream take either 22.5 ms or 65.4 ms per
frame, depending on the power-up, while the values the vendor driver
programs bring it to 3.6 ms per frame.

Map the "cache" region and configure it statically: enable cacheable
read-allocate accesses with 64-byte lines and set the read limit
(MAX_READS in the vendor driver) to 0x1c. The registers lose their
configuration whenever the decoder is powered down, so they are
programmed from runtime resume, which also covers the first use after
probe. As the vendor driver does (rkvdec_vdpu38x_run() in
mpp_rkvdec2.c), the cache is still cleared before every frame, because
reference buffers are rewritten between frames.

The region is optional: on a device tree that does not describe it, the
driver probes as before and leaves the cache unconfigured.

Decode time per frame for a 2688x1520 H.264 stream on RK3576, within
one decoder power-up, with the registers set between runs:

  MAX_READS  CACHE0_CFG  ms/frame
  0x0        power-on        65.4  (slow power-up)
  0x2        power-on        22.5  (fast power-up)
  0x1c       power-on         7.2
  0x2        0x13             8.6
  0x1c       0x13             3.6

The decoded output was bit-identical in all five cases. These numbers
were taken by setting the registers from user space through /dev/mem.

The registers were identified with the help of an AI coding assistant
(Claude, model claude-opus-5-5), which diffed register dumps of fast
and slow power-ups and matched the result against the vendor driver.
It also drafted this patch and its changelog, which I reviewed. The
measurements and tests were run on an RK3576 board.

Link: https://lore.kernel.org/r/20260619111810.564384-1-laszlo.fiat@tuta.io
Signed-off-by: Valerii Bokov <vlry.bkv@gmail.com>
---
Testing on RK3576 (Smatek T10PE) with this patch applied, on top of
6.18.34 with Simon's priming patch:
- The cache registers are programmed on every runtime resume: zeroed
  by hand while powered, then suspended and resumed without decoding,
  they read back 0x1c/0x13 (4/4).
- 2688x1520 H.264: 4.0-4.2 ms/frame on a 257-frame clip across 8
  separate power-ups, no fast/slow lottery left.
- Output is bit-exact against FFmpeg's software decoder (per-frame md5,
  all 257 frames) for that H.264 clip and for an HEVC Main clip with
  B-frames encoded from it.
- 10 minutes of a live 2688x1520 H.264 RTSP stream at the camera's
  25 fps: 24.4 fps average (23-25 fps in every 30 s window), 14% of
  one CPU core, no kernel or decoder errors.

Open questions:
- I have not checked whether the decoder's soft reset (after a timeout
  or error) also resets the cache registers. If it does, they need to
  be reprogrammed after a reset as well.
- Simon's out-of-tree priming patch also modifies
  rkvdec_runtime_resume(), so the two will conflict textually there.

Possibly related, not part of this patch:
- VDPU381 (RK3588) may have the same problem. The vendor driver
  programs three caches there before every frame (CACHE0/1/2 in
  rkvdec2_run(): cacheable, read-allocate and 64-byte lines, plus a
  clear of each), and mainline programs none. I have no RK3588 board to
  check whether its decode speed also varies between power-ups.
---
Changes in v2:
- Configure the cache statically from runtime resume instead of before
  every frame, as suggested in review. The values are constants, so
  "restore" is a plain rewrite; there is nothing to save.
- Keep clearing the cache before every frame, as the vendor driver
  does. Happy to drop it if that is preferred, but I have only shown
  bit-exactness with a single clear on one clip, which is not enough to
  rely on.
- Make the "cache" region optional. v1 returned an error from probe
  when it was missing, which would make the decoder disappear on any
  device tree that does not describe it.
- Map the region only for the VDPU383 variant, since the configured
  values are specific to it and are now applied from shared code.
- Link to v1: https://lore.kernel.org/r/20261028-rkvdec-vdpu383-cache-v1-1-d3548d3b3586@gmail.com
---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  2 +
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  2 +
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h |  9 +++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 46 +++++++++++++++++++++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  2 +
 5 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index 5ec755733..efb1f6975 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -441,6 +441,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 	timeout_threshold = h264_ctx->regs.common.reg013_core_timeout_threshold;
 	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
 
+	rkvdec_vdpu383_clear_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
 	writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3462d995d..6223b89e2 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -568,6 +568,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	timeout_threshold = hevc_ctx->regs.common.reg013_core_timeout_threshold;
 	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
 
+	rkvdec_vdpu383_clear_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
 	writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
index 04eb23297..f64d56a22 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
@@ -42,6 +42,15 @@
 #define VDPU383_STA_INT_SOFTRESET_RDY	(BIT(10) | BIT(11))
 #define VDPU383_STA_INT_ALL		0x3ff
 
+/* Reference read cache, in the "cache" register region */
+#define VDPU383_CACHE_CLR_CACHE0	0x10
+#define VDPU383_CACHE_MAX_READS		0x18
+#define VDPU383_CACHE_CACHE0_CFG	0x1c
+#define VDPU383_CACHE_CFG_CACHEABLE	BIT(0)
+#define VDPU383_CACHE_CFG_READ_ALLOCATE	BIT(1)
+#define VDPU383_CACHE_CFG_LINE_64B	BIT(4)
+#define VDPU383_CACHE_MAX_READS_VAL	0x1c
+
 struct vdpu383_regs_common {
 	u32 reg008_dec_mode;
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index fbcd0f175..405df54cc 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1158,6 +1158,29 @@ void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold)
 	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchdog_time));
 }
 
+/*
+ * The reference read cache and the read limit lose their configuration at
+ * every power-down and come up with values that vary between power-ups,
+ * several times slower than the vendor driver's. Program them whenever the
+ * decoder is powered up.
+ */
+static void rkvdec_vdpu383_config_cache(struct rkvdec_dev *rkvdec)
+{
+	writel(VDPU383_CACHE_CFG_CACHEABLE | VDPU383_CACHE_CFG_READ_ALLOCATE |
+	       VDPU383_CACHE_CFG_LINE_64B, rkvdec->cache + VDPU383_CACHE_CACHE0_CFG);
+	writel(VDPU383_CACHE_MAX_READS_VAL, rkvdec->cache + VDPU383_CACHE_MAX_READS);
+}
+
+/*
+ * Reference buffers are rewritten between frames, so the cache is cleared
+ * before every frame, as the vendor driver does.
+ */
+void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec)
+{
+	if (rkvdec->cache)
+		writel(1, rkvdec->cache + VDPU383_CACHE_CLR_CACHE0);
+}
+
 static void rkvdec_device_run(void *priv)
 {
 	struct rkvdec_ctx *ctx = priv;
@@ -1807,6 +1830,19 @@ static int rkvdec_probe(struct platform_device *pdev)
 		rkvdec->link = devm_platform_ioremap_resource_byname(pdev, "link");
 		if (IS_ERR(rkvdec->link))
 			return PTR_ERR(rkvdec->link);
+
+		/* VDPU383 reference read cache; device trees may not describe it */
+		if (rkvdec->variant == &vdpu383_variant) {
+			if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "cache")) {
+				rkvdec->cache =
+					devm_platform_ioremap_resource_byname(pdev, "cache");
+				if (IS_ERR(rkvdec->cache))
+					return PTR_ERR(rkvdec->cache);
+			} else {
+				dev_info(&pdev->dev,
+					 "no \"cache\" region, reference read cache not configured\n");
+			}
+		}
 	}
 
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
@@ -1875,8 +1911,16 @@ static void rkvdec_remove(struct platform_device *pdev)
 static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
+	int ret;
 
-	return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
+	ret = clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
+	if (ret)
+		return ret;
+
+	if (rkvdec->cache)
+		rkvdec_vdpu383_config_cache(rkvdec);
+
+	return 0;
 }
 
 static int rkvdec_runtime_suspend(struct device *dev)
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638..ab13b880a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -136,6 +136,7 @@ struct rkvdec_dev {
 	struct clk *axi_clk;
 	void __iomem *regs;
 	void __iomem *link;
+	void __iomem *cache;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct gen_pool *sram_pool;
@@ -180,6 +181,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
 void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold);
+void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec);
 
 void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
 

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3

Best regards,
-- 
Valerii Bokov <vlry.bkv@gmail.com>



