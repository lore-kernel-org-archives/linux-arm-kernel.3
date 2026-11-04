Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86691606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4RZEvNsM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULUyLJ98
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ubnY4McmoFrrH8E8woK0Dx2b09gWWGMhkGbARjItHnU=; b=4RZEvNsMsXqG7p
	tTL6Qep8/6diPNDg1cKd6kxTj9RlNSCiNtPy1xFQWVBCWhtY0wbgoYRE3GApcqeKH7dCRZ7WW6m7H
	7M44NWmIQE1QXGWeWYEYtwaJF/YvEYZuGkYY+bwoPF5XpsZI2kyDmlx/0qD18nHh1e/MEdpTmmZHN
	6t9Oj+1+ykpNBmWXoqQ7jj/nI6F00aGI6zcJ19xq/EytYGOE0nW8Be3TKoVAwNtyXNwC7PJTPvprZ
	Hoy+PvMMOMKZlOpqWHc1WQar7Cc/N7eS1r7oFEE4lbFB2vVT9hKUuiExBY20NTHO1dxeAVGO01F8J
	D8dsw5DdJo9tUTxHjz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe7J-000000062u9-3j33;
	Wed, 04 Nov 2026 16:45:41 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe7H-000000062o8-25z3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:45:41 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3514b90bb89so1719996eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810738; x=1794415538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubnY4McmoFrrH8E8woK0Dx2b09gWWGMhkGbARjItHnU=;
        b=ULUyLJ98fR0f3U08WHhgolv17o6yRTplTSe4Hg3ZHHTVMqVREy6zN+6kmKAjKx1X3l
         fZzV3MWcIZcRNM8R43FqyGCkJhrh2v4WbMQ8INxGUwHxwHJG7t278Zp/1gI75oz5soI9
         /YEUMRbrhdIYBe3gOr7Zem517HhJIgc2xz3uUoPbf78vqdT3YxwdBkf3R5I8vjWF6T9q
         VuCbzRjMJTfoxvFWruDgzdEdOtyKHbmTHt8eukjhYhZyXcHxs35RlMOqW9hTk4BxuEyj
         Zst8Iz4UdwTDhpxwSt4UVh45tI5VWymKds9l5p5eEkcTj4PMUxRB5IyYPMoFTFjXkj7Y
         RjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810738; x=1794415538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ubnY4McmoFrrH8E8woK0Dx2b09gWWGMhkGbARjItHnU=;
        b=WuD2ehSW5KkHafmzsrTPSq+8ZexkBHtY3f4ZDlqhogFMlVmjcsvzxMvBUhETk7EYwB
         gtiwyw+D4HL2IQXZHcVsEhU0G/ufKy3CdbeEL2XJAPIPgUvUs7Hz3nkFliGW/lpYMGZl
         9dI17DoEBiCG7Hq77V1i/4TZt+S6rhe8xIykm2pTT0OGWNXTanERtC4wriUzsLt/wnQv
         x4y5tgDXZ81U+7mnRWCJehAzMC6qxh8iIJ43B8Hsh6g6GAggxByaZywbnTDtfSKleJBS
         U7catng8JuZftn/mQS3NSG2hkTYE893pSY/TIX5VwpvWK3tOqV1NdZD0skPScRAdYh67
         7aQw==
X-Forwarded-Encrypted: i=1; AKwUvBylPg2JFx8sz4fgnu4LtkmU09KL91RL5LOvfzrGgVrt/rPdb6uxBlPIVOGfJcrqNJu/CaV0YU+NjEL79046/deQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+hu0LPJzBHWLk4ZbOOhgLRSkbEGqeL0hw58aAVXynf2KGXs2oj
	NYd7HH/0Fr7kzmk0uyqcn9GIbUWwB67X2XDXn/wZOG6sReKuOl3+tLFd
X-Gm-Gg: AYBFou1713QFMPrR2CQ0hG8nLos8SN0Rtl3f7JRrIXrmSnkdFVWmv3yzMT9oDHDEEKR
	2hnJID4VMQnO6QceBr0P3wTpdERnkvrFRbdyV31OEBXTuZqIoEky0+9s33JNEQCJXEbAwUtx6QT
	5jxu7RqiRE7oD4PPlC6PBGBPAAGxFrL9IUnNufSqjuX7zXequQrjMdY1Ig1mvq6lC6yFijAwZ8Y
	01mGl4nOIf7PeJhZvcNucZu7preg7Vl2HdRrLorJA3JrWlo8uGF4ZAsEaxMTUf+NhTKjbTEBJVR
	NQMm5zTQjm0Kfhbl7215uKttHos5N7NOTpVYSsmMdz/ehvGetP5mzRvfTr/Ll7xIXAOwRShlOrJ
	xI+qfCtvGATHfDn4e5D2Qg16b/wDE5hS4UWh5qItZXD41zCfQv0Y6YFCu58gocVhATi8wlO9U2i
	nk2dKzPo+D2u2KPcYi8lN/WuZJYwPRdThdxkqB5JhlE+LYqIT/3HEfQZ1yorpw17Y1gzbO4cVg1
	+55Tmzn073NFWEt4XB2+knR2xlOdQNPDh9BbdvU3CAItWQ16uhfmNGjxN5SvtTgADb2DmfWNp1t
	tga6uqEVYI7g64FRhryt9hVucLtaZQhDb5C5qBm3S7L7jx08KDCrsLtFf27ynfZYKmfcDgi3l/F
	XYs87N8ok23F1bk08oIP6NArDL2oaF48eO9txwIeVDBoLYwNmuRfdm5wejjpj9fivFOMt07Dz5z
	ASWvazn4rNQ2ewarYDRT0Ymr9GHozDms7hFWIf4oWxJw==
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr23360620eec.9.1793810738064;
        Wed, 04 Nov 2026 08:45:38 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm10368825eec.12.2026.11.04.08.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:45:37 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Wed,  4 Nov 2026 22:15:01 +0530
Message-ID: <20261104164510.105359-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104164510.105359-1-kapoorarnav43@gmail.com>
References: <20261104164510.105359-1-kapoorarnav43@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_084539_551964_540882AB 
X-CRM114-Status: GOOD (  23.90  )
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

For the PL-SYSMON node, ams_init_module() always adds the 10 fixed PL
channels, numbered 20 to 29, and ams_get_ext_chan() then appends one
channel per "channel@N" child as ams_pl_channels[N - 20]. Only channels
30 to 50 are external ones, but any N from 20 to 50 is accepted, so a
child numbered 20 to 29 duplicates a fixed channel. A PL node can then
have up to 41 channels while only 31 are budgeted for it, and together
with the 13 PS and 7 AMS control channels this writes past the end of
the buffer. Since the modules are filled in device tree order, the fixed
channel blocks copied after the PL node can overflow as well.

ams_get_ext_chan() also only checks the upper bound of reg. ext_chan is
unsigned, so a reg below 20 makes it wrap and ams_pl_channels[] is read
far out of bounds.

Only accept the external channels 30 to 50. Also pass the remaining
capacity down to ams_init_module() and ams_get_ext_chan() and fail with
-ENOSPC when a module does not fit, so that a device tree repeating a
reg value can't write past the buffer either.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/adc/xilinx-ams.c | 57 +++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 158e6133abf5..745edcf7c735 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -144,7 +144,14 @@
 #define AMS_PL_CSTS_ACCESS_MASK		BIT(1)
 
 #define AMS_PL_MAX_FIXED_CHANNEL	10
-#define AMS_PL_MAX_EXT_CHANNEL		20
+/*
+ * The PL channels are numbered from 20 in the binding. The first
+ * AMS_PL_MAX_FIXED_CHANNEL of them are always present, the external ones
+ * from AMS_PL_EXT_CHANNEL_MIN to AMS_PL_EXT_CHANNEL_MAX follow them in
+ * ams_pl_channels[].
+ */
+#define AMS_PL_EXT_CHANNEL_MIN		30
+#define AMS_PL_EXT_CHANNEL_MAX		50
 
 #define AMS_INIT_POLL_TIME_US		200
 #define AMS_INIT_TIMEOUT_US		10000
@@ -1131,6 +1138,9 @@ static const struct iio_chan_spec ams_pl_channels[] = {
 	AMS_PL_AUX_CHAN_VOLTAGE(15),
 };
 
+static_assert(ARRAY_SIZE(ams_pl_channels) ==
+	      AMS_PL_MAX_FIXED_CHANNEL + AMS_PL_EXT_CHANNEL_MAX - AMS_PL_EXT_CHANNEL_MIN + 1);
+
 static const struct iio_chan_spec ams_ctrl_channels[] = {
 	AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCC_PSPLL, AMS_VCC_PSPLL0, "VCC_PSPLL"),
 	AMS_CTRL_CHAN_VOLTAGE(AMS_SEQ_VCC_PSBATT, AMS_VCC_PSPLL3, "VCC_PSBATT"),
@@ -1142,20 +1152,31 @@ static const struct iio_chan_spec ams_ctrl_channels[] = {
 };
 
 static int ams_get_ext_chan(struct fwnode_handle *chan_node,
-			    struct iio_chan_spec *channels, int num_channels)
+			    struct iio_chan_spec *channels, int num_channels,
+			    unsigned int max_channels)
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
+		 * The fixed channels have been added already, anything else
+		 * outside of the external range is not a valid channel.
+		 */
+		if (reg < AMS_PL_EXT_CHANNEL_MIN ||
+		    reg > AMS_PL_EXT_CHANNEL_MAX)
 			continue;
 
+		if (num_channels >= max_channels)
+			return -ENOSPC;
+
 		chan = &channels[num_channels];
-		ext_chan = reg + AMS_PL_MAX_FIXED_CHANNEL - 30;
+		ext_chan = reg - AMS_PL_EXT_CHANNEL_MIN + AMS_PL_MAX_FIXED_CHANNEL;
 		memcpy(chan, &ams_pl_channels[ext_chan], sizeof(*channels));
 
 		if (fwnode_property_read_bool(child, "xlnx,bipolar"))
@@ -1183,7 +1204,8 @@ static void ams_iounmap_pl(void *data)
 
 static int ams_init_module(struct iio_dev *indio_dev,
 			   struct fwnode_handle *fwnode,
-			   struct iio_chan_spec *channels)
+			   struct iio_chan_spec *channels,
+			   unsigned int max_channels)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct ams *ams = iio_priv(indio_dev);
@@ -1191,6 +1213,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 	int ret;
 
 	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
+		if (max_channels < ARRAY_SIZE(ams_ps_channels))
+			return -ENOSPC;
+
 		ams->ps_base = fwnode_iomap(fwnode, 0);
 		if (!ams->ps_base)
 			return -ENXIO;
@@ -1202,6 +1227,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_ps_channels, sizeof(ams_ps_channels));
 		num_channels = ARRAY_SIZE(ams_ps_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
+		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
+			return -ENOSPC;
+
 		ams->pl_base = fwnode_iomap(fwnode, 0);
 		if (!ams->pl_base)
 			return -ENXIO;
@@ -1213,9 +1241,14 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		/* Copy only first 10 fix channels */
 		memcpy(channels, ams_pl_channels, AMS_PL_MAX_FIXED_CHANNEL * sizeof(*channels));
 		num_channels += AMS_PL_MAX_FIXED_CHANNEL;
-		num_channels = ams_get_ext_chan(fwnode, channels,
-						num_channels);
+		ret = ams_get_ext_chan(fwnode, channels, num_channels, max_channels);
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
@@ -1245,7 +1278,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 		return -ENOMEM;
 
 	if (fwnode_device_is_available(fwnode)) {
-		ret = ams_init_module(indio_dev, fwnode, ams_channels);
+		ret = ams_init_module(indio_dev, fwnode, ams_channels, ams_size);
 		if (ret < 0)
 			return ret;
 
@@ -1253,7 +1286,9 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	}
 
 	device_for_each_child_node_scoped(dev, child) {
-		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
+		ret = ams_init_module(indio_dev, child,
+				      ams_channels + num_channels,
+				      ams_size - num_channels);
 		if (ret < 0)
 			return ret;
 
-- 
2.53.0


