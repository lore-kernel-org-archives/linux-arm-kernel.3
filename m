Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FDA606D818
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tAF4CGcF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5NNP4X1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r6H/wfioZwLAueaE8Bq+/FZi6r32GA/m2joA0LUK87k=; b=tAF4CGcFubIKSYt0KJ0iNlJp33
	zBoxwyqhFTENpI7pjMFWLHJfLQabAmspkOkovTYhvsYLABWl3M13ACXBi0LmOMw8yk+gh+XU7qkOz
	y082pgN0VrWRBwE1VBey2KFzaH48n8CeUzERJCaxpOt0X/ft7ZkcunJy7kS3WZ9FF2NhUEIkew1kG
	MwNM4pFgN+hCGd3WuvIfGFHqjt7rtWWZNXKLZHC99kakUvx8/5wq2iHAdXsPWsTq2FGyOic0Ru8/D
	BwSM92GVqHyd11eqJNyi/Tnpx/+9KwsYkYZWIFWSsVayjNQU6YIeYTlVYgkozt62wi3Ba8vbRfNfh
	DlQ+gtaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHUC-000000038px-3LGh;
	Tue, 03 Nov 2026 16:35:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHUB-000000038oT-2iTy;
	Tue, 03 Nov 2026 16:35:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 048A8435E3;
	Tue,  3 Nov 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793723746;
	b=eNyeXpTtcZo2kIrPd7DXeEnnbgWVII/N1hl7Exe8IoxB28xBRZDPt7BrbPAfNaQ3TC0R
	 P99nt0gfpUnMUtZN1o4KTaJLh5YSRHmsdDDtpVc7wuN1U/iBt9qXpWtO8G9BeRP5Bgfru
	 k4y1gCnh+ZtT0xHUp/B2Go9mqm++wV+p5jYz7rKxgPlsUPNxuTPXf/q9IKSJbc3MN6kIn
	 Qxzbnmoo5Il8mq/0T7yIkTy0SlrP5myKqgs+gO71eI9gK5WMVdbVD89Xmm/lfAxXQ0DIQ
	 A3xKUCm9WOyOXtZvm3uOD6Aqnhd7uF13dVWTQTVVH45KvrmRf8r73BRNMcIoH7HvO4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793723746;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r6H/wfioZwLAueaE8Bq+/FZi6r32GA/m2joA0LUK87k=;
	b=lEv+k5wHW/NCYMZRhZcjKGbgILTMlQMG+fK9uuFoMAg8fftWYPJvflLJt2awKs2Y5LCB
	 mROJ1W92FMXWguot1yXJB/sVpVplzsSwfKI1axLj/sA+QFc+O3KwL3ht0ThYyISUFtN1m
	 AZAeyITMJFi3NgmLAS4UUG2S/QhlyzZl2z3FeGNYVHx6Ruf1ZNJHHSfD0kJp+KBx2K8kS
	 +Vd4KrbBEj7S0lIVIJ8qteGEAY3SFcClkLkBTw88yI4EP0uY/NOMdWe2anNgU0e1ASm7q
	 P/WQUPzmmVPFOrQ3enjbRunE1A8DspLSA8IsF5qNCZFSznxDoUCBHbhX0kp+ApdTcPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53D021F00919;
	Tue,  3 Nov 2026 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723746;
	bh=r6H/wfioZwLAueaE8Bq+/FZi6r32GA/m2joA0LUK87k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B5NNP4X1XL0BTeWLXYx14ezmkN41sCqiNITizWVyjfPq0XqjbnMA70YfY5w+JBXDE
	 vxVLWEtQXOF7+NuCR+tPXAVC7ykB515sh7W7Vm5V+r6ymfTGYty6PQkD1hijw+F17l
	 Ruvc8zeeZBRxwBfi/kg8Nsak3uSGjiPa4r4v/QKIJ83CO7aNlYyUfKIR3bxCJAZ/1L
	 L2q1EfJ5hFmXFogyNRSeMDHth0aZZfd5Q0okKm5Q5t8jV9AywYWw3Yk2MULlpTuS7E
	 YWRVFGqu1dOMp1k8ioHC8oBA2OJX7PuUsV9hQbn2XzxTtWspi5TMDAS1FpfP1CAjeC
	 vzRNsSM0Z2O6Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B91F746A32;
	Tue,  3 Nov 2026 16:35:44 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 03 Nov 2026 18:32:07 +0200
Subject: [PATCH 1/3] iio: adc: mt6359-auxadc: correct channel types to
 IIO_VOLTAGE
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-6768-6358-fixes-v1-1-2a868a33152b@protonmail.com>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
In-Reply-To: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793723743; l=7888;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=Elyoow15C1U46t/lXsCVuv7eCw8753FOI1fRbhwCvZQ=;
 b=1PSfeS1Qg5/GrObEaPnOcal33+Jf9pyHnfR46b5V4Hhm70v59cQ18pSN8gaUzVEmTMDw32hW8
 Tn0rl46T/ZjD7dHdw4otgaz7dvKWANeMkBaTxPwxmOZzROnGfRSRrm7
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

All mt6357, mt6358, mt6359 and mt6363 declare their channel types as
voltage, resistance and temperature. This is wrong, since the PMIC
doesn't include any built-in conversion block. It simply measures
voltage, while consumers are supposed to convert these readings to
the actual temperature or resistance using efuse calibration.

Correct all channel types to IIO_VOLTAGE.

Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Fixes: d6f49313272b ("iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC")
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 78 ++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 88b0e26309e5..951d236f972b 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -205,18 +205,18 @@ struct mtk_pmic_auxadc_info {
 }
 
 static const struct iio_chan_spec mt6357_auxadc_channels[] = {
-	MTK_PMIC_IIO_CHAN(MT6357, bat_adc, BATADC, 0, 15, IIO_RESISTANCE),
-	MTK_PMIC_IIO_CHAN(MT6357, isense, ISENSE, 1, 12, IIO_CURRENT),
-	MTK_PMIC_IIO_CHAN(MT6357, cdt_v, VCDT, 2, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6357, batt_temp, BAT_TEMP, 3, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6357, chip_temp, CHIP_TEMP, 4, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6357, acc_det, ACCDET, 5, 12, IIO_RESISTANCE),
+	MTK_PMIC_IIO_CHAN(MT6357, bat_adc, BATADC, 0, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, isense, ISENSE, 1, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, cdt_v, VCDT, 2, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, batt_temp, BAT_TEMP, 3, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, chip_temp, CHIP_TEMP, 4, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, acc_det, ACCDET, 5, 12, IIO_VOLTAGE),
 	MTK_PMIC_IIO_CHAN(MT6357, dcxo_v, VDCXO, 6, 12, IIO_VOLTAGE),
-	MTK_PMIC_IIO_CHAN(MT6357, tsx_temp, TSX_TEMP, 7, 15, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6357, hp_ofs_cal, HPOFS_CAL, 9, 15, IIO_RESISTANCE),
-	MTK_PMIC_IIO_CHAN(MT6357, dcxo_temp, DCXO_TEMP, 36, 15, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6357, vcore_temp, VCORE_TEMP, 40, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6357, vproc_temp, VPROC_TEMP, 41, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6357, tsx_temp, TSX_TEMP, 7, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, hp_ofs_cal, HPOFS_CAL, 9, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, dcxo_temp, DCXO_TEMP, 36, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, vcore_temp, VCORE_TEMP, 40, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6357, vproc_temp, VPROC_TEMP, 41, 12, IIO_VOLTAGE),
 
 	/* Battery impedance channels */
 	MTK_PMIC_IIO_CHAN(MT6357, batt_v, VBAT, 0, 15, IIO_VOLTAGE),
@@ -251,19 +251,19 @@ static const u16 mt6357_auxadc_regs[] = {
 };
 
 static const struct iio_chan_spec mt6358_auxadc_channels[] = {
-	MTK_PMIC_IIO_CHAN(MT6358, bat_adc, BATADC, 0, 15, IIO_RESISTANCE),
-	MTK_PMIC_IIO_CHAN(MT6358, cdt_v, VCDT, 2, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6358, batt_temp, BAT_TEMP, 3, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6358, chip_temp, CHIP_TEMP, 4, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6358, acc_det, ACCDET, 5, 12, IIO_RESISTANCE),
+	MTK_PMIC_IIO_CHAN(MT6358, bat_adc, BATADC, 0, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6358, cdt_v, VCDT, 2, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6358, batt_temp, BAT_TEMP, 3, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6358, chip_temp, CHIP_TEMP, 4, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6358, acc_det, ACCDET, 5, 12, IIO_VOLTAGE),
 	MTK_PMIC_IIO_CHAN(MT6358, dcxo_v, VDCXO, 6, 12, IIO_VOLTAGE),
-	MTK_PMIC_IIO_CHAN(MT6358, tsx_temp, TSX_TEMP, 7, 15, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6358, hp_ofs_cal, HPOFS_CAL, 9, 15, IIO_RESISTANCE),
-	MTK_PMIC_IIO_CHAN(MT6358, dcxo_temp, DCXO_TEMP, 10, 15, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6358, tsx_temp, TSX_TEMP, 7, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6358, hp_ofs_cal, HPOFS_CAL, 9, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6358, dcxo_temp, DCXO_TEMP, 10, 15, IIO_VOLTAGE),
 	MTK_PMIC_IIO_CHAN(MT6358, bif_v, VBIF, 11, 12, IIO_VOLTAGE),
-	MTK_PMIC_IIO_CHAN(MT6358, vcore_temp, VCORE_TEMP, 38, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6358, vproc_temp, VPROC_TEMP, 39, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6358, vgpu_temp, VGPU_TEMP, 40, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6358, vcore_temp, VCORE_TEMP, 38, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6358, vproc_temp, VPROC_TEMP, 39, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6358, vgpu_temp, VGPU_TEMP, 40, 12, IIO_VOLTAGE),
 
 	/* Battery impedance channels */
 	MTK_PMIC_IIO_CHAN(MT6358, batt_v, VBAT, 0, 15, IIO_VOLTAGE),
@@ -299,18 +299,18 @@ static const u16 mt6358_auxadc_regs[] = {
 };
 
 static const struct iio_chan_spec mt6359_auxadc_channels[] = {
-	MTK_PMIC_IIO_CHAN(MT6359, bat_adc, BATADC, 0, 15, IIO_RESISTANCE),
-	MTK_PMIC_IIO_CHAN(MT6359, batt_temp, BAT_TEMP, 3, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6359, chip_temp, CHIP_TEMP, 4, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6359, acc_det, ACCDET, 5, 12, IIO_RESISTANCE),
+	MTK_PMIC_IIO_CHAN(MT6359, bat_adc, BATADC, 0, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6359, batt_temp, BAT_TEMP, 3, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6359, chip_temp, CHIP_TEMP, 4, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6359, acc_det, ACCDET, 5, 12, IIO_VOLTAGE),
 	MTK_PMIC_IIO_CHAN(MT6359, dcxo_v, VDCXO, 6, 12, IIO_VOLTAGE),
-	MTK_PMIC_IIO_CHAN(MT6359, tsx_temp, TSX_TEMP, 7, 15, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6359, hp_ofs_cal, HPOFS_CAL, 9, 15, IIO_RESISTANCE),
-	MTK_PMIC_IIO_CHAN(MT6359, dcxo_temp, DCXO_TEMP, 10, 15, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6359, tsx_temp, TSX_TEMP, 7, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6359, hp_ofs_cal, HPOFS_CAL, 9, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6359, dcxo_temp, DCXO_TEMP, 10, 15, IIO_VOLTAGE),
 	MTK_PMIC_IIO_CHAN(MT6359, bif_v, VBIF, 11, 12, IIO_VOLTAGE),
-	MTK_PMIC_IIO_CHAN(MT6359, vcore_temp, VCORE_TEMP, 30, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6359, vproc_temp, VPROC_TEMP, 31, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6359, vgpu_temp, VGPU_TEMP, 32, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6359, vcore_temp, VCORE_TEMP, 30, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6359, vproc_temp, VPROC_TEMP, 31, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6359, vgpu_temp, VGPU_TEMP, 32, 12, IIO_VOLTAGE),
 
 	/* Battery impedance channels */
 	MTK_PMIC_IIO_CHAN(MT6359, batt_v, VBAT, 0, 15, IIO_VOLTAGE),
@@ -349,15 +349,15 @@ static const u16 mt6359_auxadc_regs[] = {
 };
 
 static const struct iio_chan_spec mt6363_auxadc_channels[] = {
-	MTK_PMIC_IIO_CHAN(MT6363, bat_adc, BATADC, 0, 15, IIO_RESISTANCE),
-	MTK_PMIC_IIO_CHAN(MT6363, cdt_v, VCDT, 2, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6363, batt_temp, BAT_TEMP, 3, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6363, chip_temp, CHIP_TEMP, 4, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6363, bat_adc, BATADC, 0, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, cdt_v, VCDT, 2, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, batt_temp, BAT_TEMP, 3, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, chip_temp, CHIP_TEMP, 4, 12, IIO_VOLTAGE),
 	MTK_PMIC_IIO_CHAN(MT6363, sys_sns_v, VSYSSNS, 6, 15, IIO_VOLTAGE),
 	MTK_PMIC_IIO_CHAN(MT6363, tref_v, VTREF, 11, 12, IIO_VOLTAGE),
-	MTK_PMIC_IIO_CHAN(MT6363, vcore_temp, VCORE_TEMP, 38, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6363, vproc_temp, VPROC_TEMP, 39, 12, IIO_TEMP),
-	MTK_PMIC_IIO_CHAN(MT6363, vgpu_temp, VGPU_TEMP, 40, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6363, vcore_temp, VCORE_TEMP, 38, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, vproc_temp, VPROC_TEMP, 39, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, vgpu_temp, VGPU_TEMP, 40, 12, IIO_VOLTAGE),
 
 	/* For VIN, ADC12 holds the result depending on which GPIO was activated */
 	MTK_PMIC_IIO_CHAN(MT6363, in1_v, VIN1, 45, 15, IIO_VOLTAGE),

-- 
2.56.0



