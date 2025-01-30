Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD979C02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4shPxN5Zjg8CWO7oqCIY3l3k+e0q+fmoz+kF6bIkmVM=; b=hRQv348rJx/cpNstcjag5e7FXE
	0njh9se/yqgDgCFVUHWS03dW4la/pxImYRumAOu0oJmA1kUu37XOiJTHGHXVKVpQ9IxP2J4oIskNm
	5GoXqlxuZS5dgBOsL2dVlff1Zf0Ig41YT0OSg4wb8PlYqMHO2VFSgmvxUnOmSgUuith4S1vbz329x
	vt6wfuEiZDdyErcUMDG5fGk/HA4CCxWpCRLfWtSxZgI4guWIZhspqRqiykCL2QEtU03gKNSH9dkWG
	691oNZd0apiS5fvVwdBELo4rwA3Q/fSg4jFZ9zXc+Lrl+Mlk2+hhnB+xr+K/grAWOlOb/sEvsqIJj
	pxTuyMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVht-000000090L2-44NP;
	Thu, 30 Jan 2025 14:39:49 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVgZ-0000000907m-0vHm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 14:38:28 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 66B9DA0A58;
	Thu, 30 Jan 2025 15:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=4shPxN5Zjg8CWO7oqCIY3l3k+e0q+fmoz+kF6bIkmVM=; b=
	U0wkuDXZ+YCja8dGH6AgFVUuhRRiTGpVsVSgrioEsLNMSaRslidLO77DUIz95Fvg
	LJqArNXFUbe+iqINh8q6JwEVMFrbOKWxKw44i2iTbQs9JUeeYOsrqCco1iG+EOpm
	0CuZ8fY1Pecu6VbX9mz5AOWSavH3W+T6aISUqYv78/JLihcKJ/bTGdz05ICqv6Fb
	HCp1EtU3wq3IUQftnD+Nc2A/2Md0pa/FWr5Q/+cSIgPlFs/3bhasMhH6bPK8O88Z
	Q52FtabKvw4/JcHIQrM9D+vDBRBzHePWb3p4nP3U5JKOh/mV+HFVRZPcGCJwRpMt
	MfwkhHmjgNyDz3PPj9UX1rr7n49koEDj1oIJ2Gf3d0vdC9gKWG/Ke+gKFCqyW8a6
	rKxqZfc5udt8/BGNEYdAMDOxyGD3toCnHmDq3HOsAn3kYuEg+EdqFbiAvor0WSPl
	XhpoaUb34qBhfc6Lgvg8Xc/B+Ayz6y9G2xZwxx7IKJph43piKHeJVIU7W4tsyHD+
	5GE4BgXNDusoNpGH410FCvwDk+BSqd6q2yXmpOrSTSLdDD97KtRKNBa2HH6fK8NY
	a325R2RuPYzDpYeuGeBbzOFVnZS3FLLq5vZTDx3HwFDvfF2QQaBReBfkSfSpP63L
	8jdxXRNOIIcMxyc97HbxaUnhlTCZ/45i8IaN7ES2yxM=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH] counter: microchip-tcb-capture: Add capture extensions for registers RA-RC
Date: Thu, 30 Jan 2025 15:38:16 +0100
Message-ID: <20250130143817.41625-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738247904;VERSION=7984;MC=3846925481;ID=123382;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_063827_416316_B6C723DF 
X-CRM114-Status: GOOD (  10.10  )
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
RB. On top, it is capable of triggering on compare against a third
register, RC. Add these registers as extensions.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/counter/microchip-tcb-capture.c | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 2f096a5b973d..524b9edfaa5f 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -247,6 +247,62 @@ static int mchp_tc_count_read(struct counter_device *counter,
 	return 0;
 }
 
+static int mchp_tc_count_cap_read(struct counter_device *counter,
+				  struct counter_count *count, size_t idx, u64 *val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	u32 cnt;
+
+	switch (idx) {
+	case 0:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), &cnt);
+		break;
+	case 1:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), &cnt);
+		break;
+	case 2:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), &cnt);
+		break;
+	default:
+		return -EINVAL;
+	}
+	*val = cnt;
+
+	return 0;
+}
+
+static int mchp_tc_count_cap_write(struct counter_device *counter,
+				   struct counter_count *count, size_t idx, u64 val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+
+	if (val > U32_MAX)
+		return -ERANGE;
+
+	switch (idx) {
+	case 0:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), val);
+		break;
+	case 1:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), val);
+		break;
+	case 2:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static DEFINE_COUNTER_ARRAY_CAPTURE(mchp_tc_cnt_cap_array, 3);
+
+static struct counter_comp mchp_tc_count_ext[] = {
+	COUNTER_COMP_ARRAY_CAPTURE(mchp_tc_count_cap_read, mchp_tc_count_cap_write,
+				   mchp_tc_cnt_cap_array),
+};
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -255,6 +311,8 @@ static struct counter_count mchp_tc_counts[] = {
 		.num_functions = ARRAY_SIZE(mchp_tc_count_functions),
 		.synapses = mchp_tc_count_synapses,
 		.num_synapses = ARRAY_SIZE(mchp_tc_count_synapses),
+		.ext = mchp_tc_count_ext,
+		.num_ext = ARRAY_SIZE(mchp_tc_count_ext),
 	},
 };
 
-- 
2.48.1



