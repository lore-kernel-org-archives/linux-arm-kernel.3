Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0zS9SUGt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q6/rx8QK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tF8DCvJy02dv/dGl/c2kjNebK24DBSFwD813ICPFVCg=; b=0zS9SUGtuhguRt/4UlUwUhtGvG
	yvsM85jMa0/A13pCHVl8OeQn6vh3IsIH5LVFCiutOnitqcf5uQKNTAorF9mX2+62HDsGrcQxokqOi
	w1Z24XNACuFzSTsd448QTt4uSNRJpw4tY1CePdscF2HNvy6Xi7Y2NcjdsiVvGSsR00fp19p8LCMhW
	hJgZc5+ecYVpbe/sarbWfppOx7rSWnM04FwZbeGKUZNRWtFwAerUWyytSEb/56qWaQ+xj0nbW8ksE
	Kt8/OJWzdITt90JqAW3P6O7Pr6tpDiaayBRQA6B71Zu9uEjsl7ODdgeoZQFFgPWHqbjEcr0oTysBV
	Mnne7IpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKRv-0000000Gorw-0JKj;
	Fri, 23 Oct 2026 18:57:07 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKRr-0000000GorK-0vjq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:57:05 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3535a54bed9so1892768eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 11:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792781822; x=1793386622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tF8DCvJy02dv/dGl/c2kjNebK24DBSFwD813ICPFVCg=;
        b=q6/rx8QKI0Qrma6S46AQ79SkZjQMwNjNvsFJAWssJCwpdlrfhrIVJUPaqHb1rDcxvM
         txmZWY72cC1GoEa8VR5JulRr61/KxIgGVlspyopMHuYPk69DBarX+jiBl+cHMNzjnUWN
         YTrnmZZcXQNwOWXnNdy5ykeVZiXtAjGjIsC8mp3cf2ndh9S39KlCTGeGSF7Zb1NBN/ik
         Bg1tn4EYATeOmGlIj0hI6yGxMTcAarDl7HalIuslWGnmQVRboOO5PEmhDqLwqaLNEmSU
         F3+KHHYCui3maXsslZLlyNdwfd9xlD5c86PfsjiifDkS+qwSubPM05u7N9tWS3C1CqNd
         EMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792781822; x=1793386622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tF8DCvJy02dv/dGl/c2kjNebK24DBSFwD813ICPFVCg=;
        b=VzViUi4wNhqa7BIR56GDH8AxevlXf+a0Flx3SNm/xxLnZatgXx0IpaXQSwdOLJiPLl
         dVXpm07pmKb6Jqp3QH5PhGeovrCn4P/wrrZJX4VO0iAspViOD0aKxM5mgdBW2fNeVIW4
         1TPMUI6VoZKMP3Be6jcr+BuK8FFHWZ4Rof3y3Lk13vSxxdJ9ioWQIn2my42vgRTDpeZ7
         5dfKAwPv1Nzf0eAh1PdTORjqKgEDH1ikPCBjmsecK5HcEWC1Vpa0FITK4jRHMfORVudo
         q7AflQbw6hZirgVCMK6fAp6TUYv3h8MoM8CLfqak5PH8Kepo5wBsrVf9t9BiOSfO0IqN
         atqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCqN5wvvhqvznu43P2jZOZk3IpgleZFsZ1Z4tcyhKBALrPTdlQ/ff7/cGGEPEp253H9mBeGx6Y2JHMfbiZbaRE@lists.infradead.org
X-Gm-Message-State: AFq9FYKmZD9NDC5WYTT7sMlg+8tBkAbbEelSGEqiAn3jntorHG+j2Vby
	Nwt9bMTK44WnUEP2Qh6K6UswOesxSYDLWS5aTHAxq4LMaGItHE2papKw
X-Gm-Gg: AYBFou2pfQ8TztCQYF0pl9LdfRwhtbB95nR+lqS+ALHg6yOnpzYQTHpvWYVnnZhHEfY
	ZEKN5lS7zJs1zJtbLEb+onrleUyuwTFb7jmqSWtkdnL+gbjyF+MolqBYDONEVol38zTQwTeUAdz
	7qYi5xzy9ukTpFKzGqQjywKweexStWZDyE/PUzzE3y9piM93jdEdxVVpDza1iAMT3218UkaHjev
	AF+us3cVWJZLdhbtJ4FlQpf+sh1zhVtxthv4L2UlIKy2kPfiTjNgGxegOefMImvInFkaBLdomvs
	9v9QubOkQCsJqSGQkeqi2S5tIFkHtxhigzOp4PNOQCoGTLPJzh+4KKxmFadUZr/eaevJWAIaNzG
	uU02KGVN0Wt/cuAFEdMOJeCrkd7Qg+YFcPhbSxX7OeDvqTYU5R4Q7vOws5FmjZoxh1wUObmwpUs
	rTbFb0ztASkfSM5yTbe6Pp1yM5LvXlSfIPLVREyPyUAvEBbFITWaG8Yu9EFndooNp/j+PmF3Wh5
	HmlZUduLoBEl3jGK0Rn/DGuTnmG5kAOWdPAdcK2ZwphKnFSz/0PUnnmgF+trBt0SZBGowzeTXO6
	l0m9ZmJ+rGDp9JiwfpWDrkLDD3NA95O9qteEpTSsmycuVGBwheLXpzdI66AINadAMYODVowiaj9
	gFZ8DhrCsJr8=
X-Received: by 2002:a05:701b:4587:b0:195:238:b632 with SMTP id a92af1059eb24-195c72d8a3bmr3336033c88.38.1792781821511;
        Fri, 23 Oct 2026 11:57:01 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm308388c88.21.2026.10.23.11.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:57:00 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Sat, 24 Oct 2026 00:26:48 +0530
Message-ID: <20261023185652.195025-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_115703_271468_5DD2C239 
X-CRM114-Status: GOOD (  23.39  )
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

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Fix the truncated subject line (Andy)
- Drop the paragraph about an earlier report, I could not find that
  thread again to reference it properly
- Pass the remaining capacity as unsigned int and drop the casts (Andy)
- Keep the ams_get_ext_chan() call on one line (Andy)
- Rebase on fixes-togreg
- Drop the bouncing @xilinx.com and @huawei.com addresses from Cc

v1: https://lore.kernel.org/all/20261021225356.625288-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have ZynqMP hardware.

 drivers/iio/adc/xilinx-ams.c | 54 ++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 158e6133abf5..7f0f7778d6aa 100644
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
@@ -1183,7 +1201,8 @@ static void ams_iounmap_pl(void *data)
 
 static int ams_init_module(struct iio_dev *indio_dev,
 			   struct fwnode_handle *fwnode,
-			   struct iio_chan_spec *channels)
+			   struct iio_chan_spec *channels,
+			   unsigned int max_channels)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct ams *ams = iio_priv(indio_dev);
@@ -1191,6 +1210,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 	int ret;
 
 	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
+		if (max_channels < ARRAY_SIZE(ams_ps_channels))
+			return -ENOSPC;
+
 		ams->ps_base = fwnode_iomap(fwnode, 0);
 		if (!ams->ps_base)
 			return -ENXIO;
@@ -1202,6 +1224,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
 		memcpy(channels, ams_ps_channels, sizeof(ams_ps_channels));
 		num_channels = ARRAY_SIZE(ams_ps_channels);
 	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
+		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
+			return -ENOSPC;
+
 		ams->pl_base = fwnode_iomap(fwnode, 0);
 		if (!ams->pl_base)
 			return -ENXIO;
@@ -1213,9 +1238,14 @@ static int ams_init_module(struct iio_dev *indio_dev,
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
@@ -1245,7 +1275,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 		return -ENOMEM;
 
 	if (fwnode_device_is_available(fwnode)) {
-		ret = ams_init_module(indio_dev, fwnode, ams_channels);
+		ret = ams_init_module(indio_dev, fwnode, ams_channels, ams_size);
 		if (ret < 0)
 			return ret;
 
@@ -1253,7 +1283,9 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 	}
 
 	device_for_each_child_node_scoped(dev, child) {
-		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
+		ret = ams_init_module(indio_dev, child,
+				      ams_channels + num_channels,
+				      ams_size - num_channels);
 		if (ret < 0)
 			return ret;
 

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0


