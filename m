Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA4D606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 22:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XwjYsrLN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V2cMiT9y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Og+YgCk31Ft1aKtiGGPovDF1opI3usAtawTXGFK4Kuo=; b=XwjYsrLNlmgojZHY0slluYdQyE
	bTK+4sgAkrz86C31/a/+OhcVHtXw3QF5MPBKw81egwvsvgMlMwnx+3+E6vO93g7uGvmIh6DURSviL
	70cDZUwOjWNF8IFAbLtBcm6WJNn1Qkl6LVC2iceGnstTImHBOW280t/LcCdzFDcB+8Yw9TdAUwEDU
	KKxUsY5D7xl/ICbM8nso/L1aogggtV0fse6rBaw3uJtlssnqyTqjdvwQYKUHtc7e2JBIBBhy3Dv79
	cr9laKm/R9rVWOzBSXmlMTIRrXBFRoE5YjgVCKRcLTg7eUNOtLz00emadTtwf7OZFl9lV3xm13AG5
	14VbbMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfCB-0000000D0GW-2x3d;
	Wed, 21 Oct 2026 22:54:07 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfC9-0000000D0G8-2y7T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 22:54:06 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1564968eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623244; x=1793228044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Og+YgCk31Ft1aKtiGGPovDF1opI3usAtawTXGFK4Kuo=;
        b=V2cMiT9ycDbN47iv2vfuqye9j2m/kJLRbjZWGghKT2tptaFb7xcbJPZSd1L/Zt0gHO
         qj0ECpoXCGd6zy0Bq7LBNOwn603ALC0F1+W3TwKg//BviQtCZ2ReY1weoxLTNeE9XWEj
         npjtfxANpjVw4CfQMhbe/UNvm9o/WNBPT7tE8vLuTYx4zZfC/WCVLiMdQx3lp6cS4qh0
         39NxtKUqcQ9+Wv1s8FnJM/IEWAANcZLQQrpnNQjFuFg/b7RMZqGSfvaDpL9GcmnHAPWM
         oMIuaVtCABMn3DA5x8bhOEjR9x8gm7XYKCUL6lXeGg/AR0J4F5cXKRH0/pWy2mwIVvbs
         2m1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623244; x=1793228044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Og+YgCk31Ft1aKtiGGPovDF1opI3usAtawTXGFK4Kuo=;
        b=BWJSl9OPle9CFUAF6V5FUpVVf4PM3nwwVx1Z/Z7MChXqFJxqxupE2uBlnUNveONCRX
         Z94M4zxEanV7OUW86WiXxNTqi7aoeURK7UMJ824Qbe/9HtZaSbfX65VKQGEeEjiHEM5m
         /99yr+LFGOyOGlkHhhnMhGvp351PJvxpuHX4e/lFcVS+1toNpBTLD25PyRGzy7hDqM2q
         ZsNBX9IfEMQrJTNYfwiPnsyV8eQ1b1tvdEJaA/bDnl/Io3+ucCjP8jf2WFXkNze+ORd2
         S+Z2RsPZrqvcc2UBK3wDJiLMom3BfbBU81w/3vZLhV6mVATl2u9JuBWOQSwHTfAva0XL
         XhNg==
X-Forwarded-Encrypted: i=1; AKwUvByaL8rd7c3geVyVjiH39LoYK/ennvwzY/F6TZjbRWMNT65OJzOU/0cvcjzT/P2GPHXQHS0izU//1iqmkUKfW2QV@lists.infradead.org
X-Gm-Message-State: AFq9FYKSftyyFwfeDnthRevdlOsnbireZne1p4Yo8ExGI/9lPn3Biy2s
	RFxDHflAbviTXS7x6cXA1AkSxVdG5MT4dg1TzphrmiRkBLjvgy9i+uLO
X-Gm-Gg: AYBFou1Wv/S4NYAc9g3njp4C0A+7oNqCYiKDtq0cx3S0+AMJNz/yEW2/qWCNDiD935O
	26A3yWeynRUxXOmf2j8NE+zLbCgAXwDJpWdlulTJyvxM2HQ4PAeLJ8px7JtgLzEtsIvlFL7+Kzk
	H/v5HWgogymg8B0vkzKu9IEmo8uoe8ZJGEHYIpywJ3nTmRRSmsrocsDqGMCFS4OrxhkqXXIQxeM
	zyf6X4PhXU6tTtWz2SZiti5/w1FwFS4Av5/k747emp0nGvO4zQpwXD5t2ifSoWWY8bx2vOEPg2v
	JhQKQkxcDWIqtRTdiyQQ6769nsT7FC2egbFgJe2wGcbs5wXoAQLW5RO22HRI6jZwk6hHmCYItDw
	19b4EBT4e/pdkHTz3dj7H63LNNnubT6vRMWlnSZOX4cthoXvcCbmWo+rKccf+PxruWg2wYfdEWP
	znS14HT0od/bAUKGji9CvwC5jXvZ9a/moFSKJDSOxL6ukogU7yBEbhaifJwUWbj3WwPqwPGW1Gp
	7n7dnN9INBnySK573CWRpfRKHwGO3ErwE5htn+eDkMuhxwopWVPf22GHFgFgqCziLAyY9tgblIM
	19HOLqMmIFiCf7x80P08qTjk8GTNmleBxaasjHRsQ5+bzSb28pbgVr5n19aGnQ3U4mL9Y8kDeVw
	7K8dRkVQW1zY=
X-Received: by 2002:a05:7300:d58a:b0:35b:9f06:e383 with SMTP id 5a478bee46e88-3674e450e8emr5262441eec.8.1792623244093;
        Wed, 21 Oct 2026 15:54:04 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm11999808eec.15.2026.10.21.15.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:54:03 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	"Conall O'Griofa" <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
	Manish Narani <manish.narani@xilinx.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	stable@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: xilinx-ams: fix out-of-bounds accesses when
Date: Thu, 22 Oct 2026 04:23:34 +0530
Message-ID: <20261021225356.625288-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_155405_754325_E6C8D2F5 
X-CRM114-Status: GOOD (  22.12  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ams_parse_firmware() allocates room for ARRAY_SIZE(ams_ps_channels) +
ARRAY_SIZE(ams_pl_channels) + ARRAY_SIZE(ams_ctrl_channels) = 51
channel specs and lets ams_init_module() fill them for the AMS node and
each of its children, without telling it how much room is left.

For the PL-SYSMON node, ams_get_ext_chan() appends one channel per
"channel@N" child after the 10 fixed PL channels. The binding allows
reg values 20..50, so a PL node can have up to 31 such children, i.e.
up to 41 PL channels, while only 31 are budgeted for it. Together with
the 13 PS and 7 AMS control channels, this writes past the end of the
buffer. Since the modules are filled in device tree order, the fixed
channel blocks copied after the PL node can overflow as well.

ams_get_ext_chan() also only checks the upper bound of reg. ext_chan is
unsigned, so a reg below 20 makes it wrap and ams_pl_channels[] is read
far out of bounds.

Pass the remaining capacity down to ams_init_module() and
ams_get_ext_chan() and fail with -ENOSPC when a module does not fit,
instead of writing past the buffer. Also reject reg values below 20, as
the binding requires.

This was previously reported by Weigang He, but the thread stalled
before the changes were picked up.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/adc/xilinx-ams.c | 57 ++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 158e6133abf5..0077a88da52c 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -144,7 +144,14 @@
 #define AMS_PL_CSTS_ACCESS_MASK		BIT(1)
 
 #define AMS_PL_MAX_FIXED_CHANNEL	10
-#define AMS_PL_MAX_EXT_CHANNEL		20
+/*
+ * The external PL channels are addressed by their channel number. The
+ * binding allows the range from AMS_PL_EXT_CHANNEL_MIN to
+ * AMS_PL_EXT_CHANNEL_MAX. AMS_PL_EXT_CHANNEL_MIN maps onto the first
+ * ams_pl_channels[] entry, AMS_PL_EXT_CHANNEL_MAX onto the last one.
+ */
+#define AMS_PL_EXT_CHANNEL_MIN		20
+#define AMS_PL_EXT_CHANNEL_MAX		50
 
 #define AMS_INIT_POLL_TIME_US		200
 #define AMS_INIT_TIMEOUT_US		10000
@@ -1142,20 +1149,31 @@ static const struct iio_chan_spec ams_ctrl_channels[] = {
 };
 
 static int ams_get_ext_chan(struct fwnode_handle *chan_node,
-			    struct iio_chan_spec *channels, int num_channels)
+			    struct iio_chan_spec *channels, int num_channels,
+			    int max_channels)
 {
 	struct iio_chan_spec *chan;
-	struct fwnode_handle *child;
 	unsigned int reg, ext_chan;
 	int ret;
 
-	fwnode_for_each_child_node(chan_node, child) {
+	fwnode_for_each_child_node_scoped(chan_node, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg > AMS_PL_MAX_EXT_CHANNEL + 30)
+		if (ret)
+			continue;
+
+		/*
+		 * Anything outside of the range of channel numbers allowed
+		 * by the binding is not a valid channel.
+		 */
+		if (reg < AMS_PL_EXT_CHANNEL_MIN ||
+		    reg > AMS_PL_EXT_CHANNEL_MAX)
 			continue;
 
+		if (num_channels >= max_channels)
+			return -ENOSPC;
+
 		chan = &channels[num_channels];
-		ext_chan = reg + AMS_PL_MAX_FIXED_CHANNEL - 30;
+		ext_chan = reg - AMS_PL_EXT_CHANNEL_MIN;
 		memcpy(chan, &ams_pl_channels[ext_chan], sizeof(*channels));
 
 		if (fwnode_property_read_bool(child, "xlnx,bipolar"))
@@ -1183,7 +1201,7 @@ static void ams_iounmap_pl(void *data)
 
 static int ams_init_module(struct iio_dev *indio_dev,
 			   struct fwnode_handle *fwnode,
-			   struct iio_chan_spec *channels)
+			   struct iio_chan_spec *channels, int max_channels)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct ams *ams = iio_priv(indio_dev);
@@ -1191,6 +1209,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 	int ret;
 
 	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
+		if (max_channels < ARRAY_SIZE(ams_ps_channels))
+			return -ENOSPC;
+
 		ams->ps_base = fwnode_iomap(fwnode, 0);
 		if (!ams->ps_base)
 			return -ENXIO;
@@ -1202,6 +1223,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_ps_channels, sizeof(ams_ps_channels));
 		num_channels = ARRAY_SIZE(ams_ps_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
+		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
+			return -ENOSPC;
+
 		ams->pl_base = fwnode_iomap(fwnode, 0);
 		if (!ams->pl_base)
 			return -ENXIO;
@@ -1213,9 +1237,15 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		/* Copy only first 10 fix channels */
 		memcpy(channels, ams_pl_channels, AMS_PL_MAX_FIXED_CHANNEL * sizeof(*channels));
 		num_channels += AMS_PL_MAX_FIXED_CHANNEL;
-		num_channels = ams_get_ext_chan(fwnode, channels,
-						num_channels);
+		ret = ams_get_ext_chan(fwnode, channels, num_channels,
+					max_channels);
+		if (ret < 0)
+			return ret;
+		num_channels = ret;
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams")) {
+		if (max_channels < ARRAY_SIZE(ams_ctrl_channels))
+			return -ENOSPC;
+
 		/* add AMS channels to iio device channels */
 		memcpy(channels, ams_ctrl_channels, sizeof(ams_ctrl_channels));
 		num_channels += ARRAY_SIZE(ams_ctrl_channels);
@@ -1234,7 +1264,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	size_t ams_size;
 	int ret, ch_cnt = 0, i, rising_off, falling_off;
-	unsigned int num_channels = 0;
+	int num_channels = 0;
 
 	ams_size = ARRAY_SIZE(ams_ps_channels) + ARRAY_SIZE(ams_pl_channels) +
 		ARRAY_SIZE(ams_ctrl_channels);
@@ -1245,7 +1275,8 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 		return -ENOMEM;
 
 	if (fwnode_device_is_available(fwnode)) {
-		ret = ams_init_module(indio_dev, fwnode, ams_channels);
+		ret = ams_init_module(indio_dev, fwnode, ams_channels,
+				      (int)(ams_size - num_channels));
 		if (ret < 0)
 			return ret;
 
@@ -1253,7 +1284,9 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	}
 
 	device_for_each_child_node_scoped(dev, child) {
-		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
+		ret = ams_init_module(indio_dev, child,
+				      ams_channels + num_channels,
+				      (int)(ams_size - num_channels));
 		if (ret < 0)
 			return ret;
 


