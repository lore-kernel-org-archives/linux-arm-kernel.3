Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313C1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmIWZfNW61AlqLDV5lti3V+Y+HfZggvgwmSk+uB30ww=; b=VnGELW8OKwltE4/q8lFpRXcWyx
	unv2V/LO4jo3QXRtFsKZviPSFuePOSm/IqsOa/WZLysubxwptTeXYQMCnDh59s8bXuti/QvcDoCYp
	9T82heZZkI3xWau6RBO9Xx92wU6wMBODAqxRB3lVjIXZEucWjgdk8Ddi+3lwfsTfKnLqfgOxhOjN2
	UZ05BmMxu6UOxdC0AT6oxYwJXaGnuwwQrSn+TkHIv7ufjb5PCl7QqX0OJLSR9kIRDEAEnN4zVFdSM
	i+m+uvJGY3wy6g10U6E2cMAlfEPjKwJGVU+EN0R7Sdo2mbbdKojX8KfNwLTDUp5jmxkAqepxtRwoS
	1alkzLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVwy-00000005bNJ-3qKU;
	Tue, 04 Mar 2025 17:21:00 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUZI-00000005Ifs-1TKw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:52:29 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0B499A06C2;
	Tue,  4 Mar 2025 16:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=WmIWZfNW61AlqLDV5lti
	3V+Y+HfZggvgwmSk+uB30ww=; b=TfQlwImWIiuaBo5goUiawgvODWdiEZys0s/J
	UP7u+kDMExYT1dg29p5kwD9L7QYXSI/DYZnoUTj9zwDgQpvX9DQnowO2poArfGWn
	YG+ivLwHug0ceL13BWlOT58HgxueSstrCd7/qcup8ibCsi2jDh43EY83udMSOhA0
	lXffaBb4OGxFFxiKgdL3r1t/NNPjAYP8SVU43B6sO1inVHbqM2FyBXu1gURb2Xql
	ZzbZrLWwlT5MzRTTvP53EsEiOvtXGhhFaFDX1IE/Hpx48yeVUkQp9XAR1dAxx//X
	DZ+n0G4Y8+vobgyjhdkaBtT5B9DcSUn2HprQ0oGhJooCqnXLyh7gr50jr344Ww2P
	9DnMaydN6w5ajIVeRHzjkBrzP925/mL9wV7UyKjtnoiDOcqYEYBV11WUHPwFo+A8
	oYHCUSa+24U6qat3eWF4mSy6I5c5SMPdX8sGSHmGnsxoemv6zajz0fjJRPIvADNT
	tJ3/DV15ufes0h63eh23rirBMy2rNtUkyMY8ULX8wlden+COSXzdWsSmIO/zrssU
	nu6Sts9MhWS4SzxOUupp6grwrgE5QLl9lqAMxN1iGNj47bZIl/1YAWB8o3AsdnR0
	h6ztpfXpn7ospQR0DBcGhqjBftji8dRV/orAEJ/4Z7s0YBWKnqwamuEzBb9aX4q6
	T0bPt6s=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v7 2/2] counter: microchip-tcb-capture: Add capture extensions for registers RA/RB
Date: Tue, 4 Mar 2025 16:51:52 +0100
Message-ID: <20250304155156.374150-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304155156.374150-1-csokas.bence@prolan.hu>
References: <20250304155156.374150-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1741103546;VERSION=7985;MC=2493638075;ID=1544448;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_075228_546884_51594321 
X-CRM114-Status: GOOD (  13.54  )
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

TCB hardware is capable of capturing the timer value to registers RA and
RB. Add these registers as capture extensions.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * Add IRQs
    Changes in v3:
    * Move IRQs to previous patch
    Changes in v4:
    * Return the status of the regmap_*() operations
    * Add names for the extension numbers
    Changes in v6:
    * Remove RC, as it is not a capture register
    Changes in v7:
    * Change enums to #define's in UAPI header
    * Return early on error in `mchp_tc_count_cap_read()`

 drivers/counter/microchip-tcb-capture.c       | 58 +++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     |  6 ++
 2 files changed, 64 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index cc12c2e2113a..52493f7e8b57 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -254,6 +254,62 @@ static int mchp_tc_count_read(struct counter_device *counter,
 	return 0;
 }
 
+static int mchp_tc_count_cap_read(struct counter_device *counter,
+				  struct counter_count *count, size_t idx, u64 *val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	u32 cnt;
+	int ret;
+
+	switch (idx) {
+	case COUNTER_MCHP_EXCAP_RA:
+		ret = regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), &cnt);
+		break;
+	case COUNTER_MCHP_EXCAP_RB:
+		ret = regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), &cnt);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	*val = cnt;
+
+	return 0;
+}
+
+static int mchp_tc_count_cap_write(struct counter_device *counter,
+				   struct counter_count *count, size_t idx, u64 val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	int ret;
+
+	if (val > U32_MAX)
+		return -ERANGE;
+
+	switch (idx) {
+	case COUNTER_MCHP_EXCAP_RA:
+		ret = regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), val);
+		break;
+	case COUNTER_MCHP_EXCAP_RB:
+		ret = regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static DEFINE_COUNTER_ARRAY_CAPTURE(mchp_tc_cnt_cap_array, 2);
+
+static struct counter_comp mchp_tc_count_ext[] = {
+	COUNTER_COMP_ARRAY_CAPTURE(mchp_tc_count_cap_read, mchp_tc_count_cap_write,
+				   mchp_tc_cnt_cap_array),
+};
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -262,6 +318,8 @@ static struct counter_count mchp_tc_counts[] = {
 		.num_functions = ARRAY_SIZE(mchp_tc_count_functions),
 		.synapses = mchp_tc_count_synapses,
 		.num_synapses = ARRAY_SIZE(mchp_tc_count_synapses),
+		.ext = mchp_tc_count_ext,
+		.num_ext = ARRAY_SIZE(mchp_tc_count_ext),
 	},
 };
 
diff --git a/include/uapi/linux/counter/microchip-tcb-capture.h b/include/uapi/linux/counter/microchip-tcb-capture.h
index f3ef315fe9f6..136e2faa7730 100644
--- a/include/uapi/linux/counter/microchip-tcb-capture.h
+++ b/include/uapi/linux/counter/microchip-tcb-capture.h
@@ -12,6 +12,8 @@
  * Count 0
  * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
  * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
+ * \__  Extension capture0    (RA register)
+ * \__  Extension capture1    (RB register)
  *
  * It also supports the following events:
  *
@@ -25,6 +27,10 @@
  * - RC compare triggered
  */
 
+/* Capture extensions */
+#define COUNTER_MCHP_EXCAP_RA 0
+#define COUNTER_MCHP_EXCAP_RB 1
+
 /* Event channels */
 #define COUNTER_MCHP_EVCHN_CV 0
 #define COUNTER_MCHP_EVCHN_RA 0
-- 
2.48.1



