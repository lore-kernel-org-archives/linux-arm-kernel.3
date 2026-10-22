Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D6606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ja0Scm7M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GsUzD+VO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ny7Snfey
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t3RexKatP1kjoAD+7UX1aOwf4BjKeEG2GX7OI7aVWc0=; b=Ja0Scm7MeFWD4+2RzeMjLlZCkQ
	64NIVlKOK32k4nbBuitv9Toeft6onK6knuwnOSB74VwVhskSNkfSFRItfKKx+cNp9U4hVI2hlWar6
	Bd2GY045xhoDI+p8SsuqL1niRQCR53h4JlQCWaQPkgZeE7DhfCE896Ti8Vc0r1uBQZatTsXnTzz8/
	fqZLJh2/2AaYJtkQb/P9AAvir9UonMc+4jVmNuR3QY7p7Zcl3l+36K2r+8OkEKjMLmw2rf+L9wlH+
	d2y07ejdUgPYxQLoS5DQgOnYsHz+8f+W3fStoDrAdv6V4E3m5ep0KkIDp/TM71ncBA2Gkijo/O6Pa
	pHnOQThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtRB-0000000EGaV-2EAv;
	Thu, 22 Oct 2026 14:06:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtRA-0000000EGaO-15I2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 14:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=t3RexKatP1kjoAD+7UX1aOwf4BjKeEG2GX7OI7aVWc0=; b=GsUzD+VOMjf/QdGNyLMzJ8IzFM
	AUX3D84DDhYVtBQqEn6R0p6Waz7o7xXs1ye/9Htc69s59wgC+gMFs9R3pK86lOQqdj4eYSm7+ZOTh
	L6DNYFUWaDxSMhCnvMvCyUxEQvIrT0oTNXl1Q2RbxQMUoVgQuadJPdZiUiOaN1XWNcnHtjgLo+q7I
	MZ70EaR20CJm2fyoxmqxLocted4/2FpD3aHDbpZUvj7Vjw1XNNixAFU1Om4MCIOUHCcNdUjTrug5Y
	V8wf0L+eWL959L9LUJ5VTgBpJXgsoPRsZQlACQUeF/7demcSR2ORkt0smwgtSz1SwoQq8PS6GmAIG
	QhNxnfCQ==;
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtR5-00000007GOj-1PRf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:06:30 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-3282db206d3so4309323eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792677984; x=1793282784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3RexKatP1kjoAD+7UX1aOwf4BjKeEG2GX7OI7aVWc0=;
        b=Ny7SnfeyoPPDi2YGT9V+dXlxZHLjl0MPccp1qLARifsjGY95JxEOplduhAgyBMwWB1
         QfgantgH943fJuMcDW45jqY2oFMObREL7GBV4qnOqLvCBs/46QFBjZllcdoadtnapGuq
         nspBiNlLIBqX4MBITZteaETMa0IdzPhUuTwsXhwnHJZhUndt6QgejQ8VGu34RxZ/ckPm
         N/clbKxuWw6tFJelKgPoPjbqt7fWS9CLHxV0jxqFWG3y7EJMero9wrTjNhBHxa3vfZrr
         mGTga9GDoAzi4QkNEy4zb3HVibrD2JtQdiYAbbc5YuPFB69pf90QBnLjSpFFsoFXFRMj
         0otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677984; x=1793282784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3RexKatP1kjoAD+7UX1aOwf4BjKeEG2GX7OI7aVWc0=;
        b=i9H9om2d1qEg7sodMSwVSflGaM+fUXQs5sWJG8rPr60VZ5ccj/l2dRKIN0Ljbr9n74
         G0733msGYZe9sMIFggqYVLzlrmSl0lnwq4vxZGGVSKQjzURywdgqzVmX8CzxJediWK4g
         nCtkv03srTVOgHWIyN7iPZZF02Z4nTpspSkwx/cC+eKh4ItR8sflMY5oYxvI+Ab4CPe2
         S9RNhRnhWk/4geYhPltQLn3/jsNTO+/aOkhMOdFg3OU/5TnfeocOIWkDwg9KN0/F8U9u
         P1bsQv5eOkeLhqAAxOn8sbR1eHMwjzqv2VQXf96340PH8z68aQteqbOXn/49/jFtptjj
         5wRg==
X-Forwarded-Encrypted: i=1; AKwUvBzViPSOpd769JpTeV/2cK3j0b+G425qRUCXQqK0aAl33JcO34Roj+J68sJT/yme5msd2CoGf8gGtBMn+p0qgTX/@lists.infradead.org
X-Gm-Message-State: AFq9FYIVuvX6c3+X6u+LEeiFiegG7aO0b7att1wLVGEXenqm2HjTmWLr
	Yb3MFA2j7MdYODlvDDH18HJIIuhcz/6zB31lHcJCeeTga6a+3NlPVZ7U
X-Gm-Gg: AYBFou2Ats7XpY6JM09eCpeF4BuLBAMNIJF/L7EfEMER4FszKIdArXto5Mg3rh2rP1N
	RZeQ5mPcA2RcxOXExaGkhRoxm+YBxkOZYfGUc4/LzFXP9yjirgYnBVSQp8bQIC8ypWcSuPOsB4S
	jPxE2vPC1XFbkgPeg1h7nOWiQ6ydgmNS0/o/b7eZJPzEhFAMKT48reE+a4LhyASHqKGwo9R65o+
	oCUF0uSPk4pN8oxEOXzYwEfAeIEODxqiAy7zXg8K5Mc0mR3+x2EqTtIM6dMHCoZwGuzGtxX1W/l
	SV0Tt2ldCPPBAqhBysojnrBhmzkUejhV8dGoqKRiLJv0bOSm/J6qOqngKytzgZH3In1Ed6PfpFc
	Pwq9LPCv1R6QOm66o2H1Oy9FNHruSvp8/6OhM+1D0rHzXoKHYPqp6crXIzTT50/PdtMQDkMOGzK
	I0JBhffRsLFRe2cdVGB3YqKfGzGf6jrUE266rmxPq1XHTYApoP155Kkvprk185pVlDDefo9dOkC
	mTW1AGLyjd5ewAhCUhyyKiLUv6kr1/usr+eCI4Pg85Un/eiphlT0ik2rFK0LfaJhZavAiuo5NRE
	JUAKYo6oCaMeYb07qlgUoh/av0l55KbrgoMQR03ud8jDAcFDRAk7wMc2fDYvq27dzkOxTdO4iRI
	0i9eYBdFkWTc=
X-Received: by 2002:a05:693c:810e:b0:367:941:c253 with SMTP id 5a478bee46e88-3674c93b096mr7616489eec.11.1792677983998;
        Thu, 22 Oct 2026 07:06:23 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ee5eesm14960559eec.8.2026.10.22.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:06:23 -0700 (PDT)
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
Date: Thu, 22 Oct 2026 19:36:13 +0530
Message-ID: <20261022140615.30710-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_150627_743902_A35B343E 
X-CRM114-Status: GOOD (  25.13  )
X-Spam-Score: 0.1 (/)
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
Assisted-by: LLM
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


