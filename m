Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C90606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yaplX1su;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=idlCCDht
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ab/Xs7UPUYjpSmnpYKvXDQOlhcAF6s7Z01ajFvB7yE=; b=yaplX1suhxFzTdgs0HIcsQwLtq
	1skhcLNZi2jsLvTX4uvGT4CKxt+PfA1zIsm+Z0b9cygd2MMUkbDtBKbvlv80NDCDYKDYTyElw6Qqr
	KHOOihbCgiTjuSfgdTGBgzL8bIiCqlFM+Jq4cKkMNy+eoR71OB5hosp0/3tQXDEj9CZCF2nH4Kc9j
	DsGJ/qjF/REirqLklQY7X8mEWhZqdkYS448TS8kzsa6GXBd+BzyUWe4eeXsqC1yUiZvoRsyESew//
	4/mU922UUcORGddKGnxgCR126XcCrfAkNTJwlu4mtjGw3NoqFa7smgLrI0zcJRpnFGqiyiBUlskjm
	0ii0V9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAsj-00000009xBk-3t2V;
	Tue, 20 Oct 2026 14:32:01 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAsf-00000009x8V-1png
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:31:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-885cd98d226so341802b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506717; x=1793111517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ab/Xs7UPUYjpSmnpYKvXDQOlhcAF6s7Z01ajFvB7yE=;
        b=idlCCDhtuJ5hLLpV4wa1t6ls/gfapsaolDkpoJ8HtSTtfg9Tnn5Ed1eLRy6kFkLjwG
         nPqxSLhf5RPUJzllyNzqawzEXcpbc5ZIa9f4tOn2JNkQ6YnKaDHhhCDrHnvuvxE9BkFf
         U6S7wtFzpvKsNI7i0xRthiaj1Hz9LMTLigbHs4i7KBlIOqhdDAsVbt89z8NC3ty8NnHm
         OG8XvpwxuZavTCdRMJBh3rL+XvVgYrZ8RkL7Z6QC7hFDoib8RfHAb/kbCFdBDATaVR04
         UE6+MT+qemzmlMXFmf4zHpquMu3nXAFGT+nnuubSTJyskCornz8KrSjazB1i+Sy/Odhn
         Otqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506717; x=1793111517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Ab/Xs7UPUYjpSmnpYKvXDQOlhcAF6s7Z01ajFvB7yE=;
        b=Z5AJ4zSUozasWG9EZEYEcGHQcumlb5XUfHd111dLFSqeJ+9OgBRX9Jt2Mr69BCv8o4
         MdNlZpOHekDG838hs8FA/r2WTx7VYZVBON2fJYSI6/+fpv2QSuBonsdjBtvyCcKxqkw0
         zX0sjQ7RGfP4ZcWLy3NOQ7OWkC9E7LBSsNPjcQfsUTuoK4AXTIAN0Tzyb/RmLSHeBJ6I
         CLxRvHsXtR13Uf9tglKWdPev6dyUxs1Xkn95VW2bC9xaPSv24+m7n7N+4GLWJQelMuiS
         tzJ/OeBcKYDFndQBZGtMrRhbLM/S0zRbJucLvFdAdNq/iKQDFhPxKvPjWCkh9Zo+BX7i
         xE3A==
X-Forwarded-Encrypted: i=1; AKwUvBxwl1KH721c8FuDswYU+jZcsMUrB+0WkjwjuiUi0jsd1Rg8Gn4MHjudFiUgMjhrwOaxe/ufIdvY2LIJQL1kqdbj@lists.infradead.org
X-Gm-Message-State: AFq9FYKExw5jsy9tv4s2wqvHAaRGW+elJ+ktmEjgRf8qVKjtqll+kLSE
	hUounITxDsHKR+cJO3YKvG79DIDdz0E2ShKfsu7O4gPW/XTDSG2JZLDv
X-Gm-Gg: AYBFou04HRELXPzDJZ9Ko8Diobvi1I0H9kgao66vIIDSdQBLfqGtfBbNCaLajeJkzpR
	/1cTfgLfSpw7x7DlggKu2AZqL9xu43YZ3Kd/P/z66Kim0/DLsitdXZubtQmj02yH+hnSIa/a1RU
	YqLZkN7JXzJVxHWfxghZldymKjTQ40OAh6SR/UAm0lMF7P3UJ2xG4XTkgGbOkLOFSpoQa4UIw3r
	7H8uLh5eak70mMa6Gjn+ALubhwAR3XuA4k0zDNV6y5B9TrTA3YtIGqLYokJrwtzK9tIp34oBC/2
	/LKfvSSYzutgqOSDF/CAMEGwFAnxosYhdM8ZL0RIgEG+xLzoFPOy12RsWR3xtKHP1MlSREXKGvZ
	l803BbHbLOwP/CWLB86/1yptazhsmfvnymg04BHHmqaOBtsOtX1yQXdS3F9phtqMT31p9q49jg7
	R8xY0vbe0IqsyK/+zP4WRlkkhacjpP7va/OZvfzB+9iTufYDAgQ6aeXLKAD2PDgEro1NRN2ZWZ6
	hmy2UfrcGSVV+p3gidCKWXMM7lr7UjeSfOqXap7NCmsH03eR6kyqbwN3w0NTlA8WlKbJCMCRPm1
	U3pniI52bER+d+E=
X-Received: by 2002:a05:6a00:13a4:b0:8a0:5b29:269c with SMTP id d2e1a72fcca58-8a07bfe865fmr1392400b3a.13.1792506716474;
        Tue, 20 Oct 2026 07:31:56 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:56 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 2/2] ASoC: codecs: add support for Everest ES7202 PDM ADC
Date: Tue, 20 Oct 2026 22:31:32 +0800
Message-ID: <20261020143135.623897-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020143135.623897-1-jerrysteve1101@gmail.com>
References: <20261020143135.623897-1-jerrysteve1101@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_073157_507566_60669E5A 
X-CRM114-Status: GOOD (  25.58  )
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the Everest ES7202, a 2-channel PDM analog-to-digital
converter controlled over I2C. The device outputs PDM data to the SoC
PDM controller and is configured through registers for supply voltage,
analog front-end and per-channel PGA gain.

Based on the Rockchip BSP driver[1] by Binyuan Lan <lby@rock-chips.com>
(committed by Tao Huang <huangtao@rock-chips.com>), originally written
by David Yang <yangxiaohua@everest-semi.com>.

[1] https://github.com/rockchip-linux/kernel/blob/develop-6.1/sound/soc/codecs/es7202.c

Link: https://archive.org/details/es-7202-ds
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 sound/soc/codecs/Kconfig  |  10 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/es7202.c | 372 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/es7202.h | 133 ++++++++++++++
 4 files changed, 517 insertions(+)
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba59dabeeccd..c1eeebd12cf0 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1274,6 +1274,16 @@ config SND_SOC_HDMI_CODEC
 config SND_SOC_ES7134
 	tristate "Everest Semi ES7134 CODEC"
 
+config SND_SOC_ES7202
+	tristate "Everest Semi ES7202 CODEC"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Enable support for the Everest Semiconductor ES7202, a 2-channel
+	  PDM analog-to-digital converter controlled over I2C. The device
+	  outputs PDM data to a SoC PDM controller and is configured through
+	  registers for supply voltage, analog front-end and PGA gain.
+
 config SND_SOC_ES7241
 	tristate "Everest Semi ES7241 CODEC"
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 3826f9e4fce8..2a56fad9073a 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -129,6 +129,7 @@ snd-soc-da732x-y := da732x.o
 snd-soc-da9055-y := da9055.o
 snd-soc-dmic-y := dmic.o
 snd-soc-es7134-y := es7134.o
+snd-soc-es7202-y := es7202.o
 snd-soc-es7241-y := es7241.o
 snd-soc-es83xx-dsm-common-y := es83xx-dsm-common.o
 snd-soc-es8311-y := es8311.o
@@ -577,6 +578,7 @@ obj-$(CONFIG_SND_SOC_DA732X)	+= snd-soc-da732x.o
 obj-$(CONFIG_SND_SOC_DA9055)	+= snd-soc-da9055.o
 obj-$(CONFIG_SND_SOC_DMIC)	+= snd-soc-dmic.o
 obj-$(CONFIG_SND_SOC_ES7134)	+= snd-soc-es7134.o
+obj-$(CONFIG_SND_SOC_ES7202)	+= snd-soc-es7202.o
 obj-$(CONFIG_SND_SOC_ES7241)	+= snd-soc-es7241.o
 obj-$(CONFIG_SND_SOC_ES83XX_DSM_COMMON)    += snd-soc-es83xx-dsm-common.o
 obj-$(CONFIG_SND_SOC_ES8311)    += snd-soc-es8311.o
diff --git a/sound/soc/codecs/es7202.c b/sound/soc/codecs/es7202.c
new file mode 100644
index 000000000000..c30b0123c91f
--- /dev/null
+++ b/sound/soc/codecs/es7202.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright Everest Semiconductor Co., Ltd.
+ *
+ * Author: David Yang <yangxiaohua@everest-semi.com>
+ * Author: Jun Yan <jerrysteve1101@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+#include "es7202.h"
+
+/*
+ * The main supply voltage selects the analog front-end configuration:
+ * below this threshold the device is configured for 1.8 V, otherwise 3.3 V.
+ */
+#define ES7202_SUPPLY_1V8_MAX_UV	1980000
+#define ES7202_SUPPLY_3V3_DEFAULT_UV	3300000
+
+struct es7202_priv {
+	struct regmap *regmap;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+	unsigned int supply_uv;
+};
+
+static bool es7202_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* status and device-id registers are read-only, never cached */
+	return reg == ES7202_CHIP_STA ||
+	       reg == ES7202_DEV_ID1 ||
+	       reg == ES7202_DEV_ID0;
+}
+
+static const struct reg_default es7202_reg_defaults[] = {
+	{ ES7202_RESET,		0x10 },
+	{ ES7202_SOFT_MODE,	0x00 },
+	{ ES7202_CLK_DIV,	0x04 },
+	{ ES7202_CLK_EN,	0x00 },
+	{ ES7202_T1_VMID,	0x01 },
+	{ ES7202_T2_VMID,	0x18 },
+	{ ES7202_PDM_INF_CTL,	0x30 },
+	{ ES7202_MISC_CTL,	0x02 },
+	{ ES7202_ANALOG_EN,	0xff },
+	{ ES7202_BIAS_VMID,	0x0c },
+	{ ES7202_PGA1_BIAS,	0x55 },
+	{ ES7202_PGA2_BIAS,	0x55 },
+	{ ES7202_MOD1_BIAS,	0x8c },
+	{ ES7202_MOD2_BIAS,	0x33 },
+	{ ES7202_VREFP_BIAS,	0x33 },
+	{ ES7202_VMMOD_BIAS,	0x33 },
+	{ ES7202_MODS_BIAS,	0x44 },
+	{ ES7202_ANALOG_LP1,	0x00 },
+	{ ES7202_ANALOG_LP2,	0x00 },
+	{ ES7202_ANALOG_MISC1,	0x00 },
+	{ ES7202_ANALOG_MISC2,	0xf8 },
+	{ ES7202_PGA1,		0x18 },
+	{ ES7202_PGA2,		0x18 },
+};
+
+static const struct regmap_config es7202_regmap = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= ES7202_DEV_ID0,
+	.reg_defaults	= es7202_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(es7202_reg_defaults),
+	.volatile_reg	= es7202_volatile_reg,
+	.cache_type	= REGCACHE_MAPLE,
+};
+
+/*
+ * PGA gain per the datasheet: code 0 is 0 dB, codes 1..10 step +3 dB from
+ * 2.25 dB, and codes 11 and 12 are 30.75 dB and 32.25 dB respectively.  As
+ * the steps are not uniform, a linear TLV (the vendor driver's
+ * DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 300, 0)) would misreport the gain,
+ * so use a piecewise range matching the datasheet instead.
+ */
+static const DECLARE_TLV_DB_RANGE(mic_boost_tlv,
+	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
+	1, 10, TLV_DB_SCALE_ITEM(225, 300, 0),
+	11, 11, TLV_DB_SCALE_ITEM(3075, 0, 0),
+	12, 12, TLV_DB_SCALE_ITEM(3225, 0, 0),
+);
+
+static const struct snd_kcontrol_new es7202_controls[] = {
+	SOC_SINGLE_TLV("PGA1 Capture Volume", ES7202_PGA1, 0, 0x0c, 0,
+		       mic_boost_tlv),
+	SOC_SINGLE_TLV("PGA2 Capture Volume", ES7202_PGA2, 0, 0x0c, 0,
+		       mic_boost_tlv),
+};
+
+static const struct snd_soc_dapm_widget es7202_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("MIC1"),
+	SND_SOC_DAPM_INPUT("MIC2"),
+	SND_SOC_DAPM_ADC("ADC", "Capture", SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route es7202_dapm_routes[] = {
+	{ "ADC", NULL, "MIC1" },
+	{ "ADC", NULL, "MIC2" },
+};
+
+static int es7202_mute_pdm(struct es7202_priv *es7202, bool mute)
+{
+	return regmap_update_bits(es7202->regmap, ES7202_PDM_INF_CTL,
+				  ES7202_PDM_INF_CTL_MUTE,
+				  mute ? ES7202_PDM_INF_CTL_MUTE : 0);
+}
+
+static int es7202_hw_init(struct es7202_priv *es7202)
+{
+	struct regmap *regmap = es7202->regmap;
+	bool is_1v8 = es7202->supply_uv > 0 &&
+		      es7202->supply_uv <= ES7202_SUPPLY_1V8_MAX_UV;
+	/*
+	 * Power-up sequence from the vendor driver.
+	 * The analog front-end is configured for the actual supply voltage
+	 * (1.8 V vs 3.3 V) and the analog blocks are ramped out of
+	 * power-down in stages.
+	 */
+	const struct reg_sequence init_seq[] = {
+		{ ES7202_SOFT_MODE,	ES7202_MODE_SOFT_MODE_SEL },
+		{ ES7202_ANALOG_MISC1,	ES7202_ANALOG_MISC1_OFFSETSEL1 |
+					(is_1v8 ? 0 : ES7202_ANALOG_MISC1_SUPPLYSEL) },
+
+		/* 30.75 dB gain */
+		{ ES7202_PGA1,		ES7202_PGA_SELMIC1 |
+					FIELD_PREP(ES7202_PGA_MIC1_GAIN, 11) },
+		{ ES7202_PGA2,		ES7202_PGA_SELMIC2 |
+					FIELD_PREP(ES7202_PGA_MIC2_GAIN, 11) },
+
+		/* analog on, rest powered down */
+		{ ES7202_ANALOG_EN,	ES7202_ANALOG_EN_PDN_ADCVREFGEN |
+					ES7202_ANALOG_EN_MODTOP1_RST |
+					ES7202_ANALOG_EN_MODTOP2_RST |
+					ES7202_ANALOG_EN_PDN_MOD1 |
+					ES7202_ANALOG_EN_PDN_MOD2 |
+					ES7202_ANALOG_EN_PDN_PGA1 |
+					ES7202_ANALOG_EN_PDN_PGA2 },
+
+		{ ES7202_BIAS_VMID,	FIELD_PREP(ES7202_BIAS_ADCBIAS_SWH1, 3) |
+					ES7202_BIAS_ENDITHER |
+					FIELD_PREP(ES7202_BIAS_VMIDSEL, 3) },
+
+		/* VREFGEN on; 3.3 V also drops MODTOP reset */
+		{ ES7202_ANALOG_EN,	is_1v8 ?
+					(ES7202_ANALOG_EN_MODTOP1_RST |
+					 ES7202_ANALOG_EN_MODTOP2_RST |
+					 ES7202_ANALOG_EN_PDN_MOD1 |
+					 ES7202_ANALOG_EN_PDN_MOD2 |
+					 ES7202_ANALOG_EN_PDN_PGA1 |
+					 ES7202_ANALOG_EN_PDN_PGA2) :
+					(ES7202_ANALOG_EN_PDN_MOD1 |
+					 ES7202_ANALOG_EN_PDN_MOD2 |
+					 ES7202_ANALOG_EN_PDN_PGA1 |
+					 ES7202_ANALOG_EN_PDN_PGA2) },
+
+		{ ES7202_ANALOG_EN,	0 },
+		{ ES7202_MOD1_BIAS,	FIELD_PREP(ES7202_MOD1_BIAS_SW0, 5) |
+					FIELD_PREP(ES7202_MOD1_BIAS_SW1, 8) },
+		{ ES7202_CLK_DIV,	FIELD_PREP(ES7202_CLK_DIV_MCLK_DIV, 1) },
+		{ ES7202_T2_VMID,	0x01 },
+		{ ES7202_MISC_CTL,	ES7202_MISC_DSM_DITHER_ON },
+		{ ES7202_RESET,		ES7202_RESET_CSM_ON },
+		{ ES7202_CLK_EN,	ES7202_CLK_ANA_CLK_ON | ES7202_CLK_MCLK_ON },
+		{ ES7202_BIAS_VMID,	FIELD_PREP(ES7202_BIAS_ADCBIAS_SWH1, 3) |
+					ES7202_BIAS_ENDITHER |
+					FIELD_PREP(ES7202_BIAS_VMIDSEL, 2) },
+	};
+	int ret;
+
+	ret = regmap_multi_reg_write(regmap, init_seq, ARRAY_SIZE(init_seq));
+	if (ret)
+		return ret;
+
+	return es7202_mute_pdm(es7202, false);
+}
+
+static int es7202_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es7202_priv *es7202 = snd_soc_component_get_drvdata(component);
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return 0;
+
+	return es7202_mute_pdm(es7202, mute);
+}
+
+static const struct snd_soc_dai_ops es7202_dai_ops = {
+	.mute_stream = es7202_mute_stream,
+};
+
+static struct snd_soc_dai_driver es7202_dai = {
+	.name = "es7202-hifi",
+	.capture = {
+		.stream_name	= "Capture",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= SNDRV_PCM_RATE_8000_96000,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.ops = &es7202_dai_ops,
+};
+
+static int es7202_suspend(struct snd_soc_component *component)
+{
+	struct es7202_priv *es7202 = snd_soc_component_get_drvdata(component);
+
+	return es7202_mute_pdm(es7202, true);
+}
+
+static int es7202_resume(struct snd_soc_component *component)
+{
+	struct es7202_priv *es7202 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	regcache_mark_dirty(es7202->regmap);
+	ret = regcache_sync(es7202->regmap);
+	if (ret)
+		return ret;
+
+	return es7202_mute_pdm(es7202, false);
+}
+
+static const struct snd_soc_component_driver es7202_component_driver = {
+	.controls		= es7202_controls,
+	.num_controls		= ARRAY_SIZE(es7202_controls),
+	.dapm_widgets		= es7202_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(es7202_dapm_widgets),
+	.dapm_routes		= es7202_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(es7202_dapm_routes),
+	.suspend		= es7202_suspend,
+	.resume			= es7202_resume,
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+};
+
+static void es7202_disable_supply(void *data)
+{
+	regulator_disable(data);
+}
+
+static int es7202_i2c_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct es7202_priv *es7202;
+	unsigned int id1, id0, device_id;
+	int ret;
+
+	es7202 = devm_kzalloc(dev, sizeof(*es7202), GFP_KERNEL);
+	if (!es7202)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, es7202);
+
+	es7202->regmap = devm_regmap_init_i2c(i2c, &es7202_regmap);
+	if (IS_ERR(es7202->regmap))
+		return dev_err_probe(dev, PTR_ERR(es7202->regmap),
+				     "failed to init regmap\n");
+
+	es7202->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(es7202->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(es7202->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	es7202->supply = devm_regulator_get_optional(dev, "vdd");
+	if (IS_ERR(es7202->supply)) {
+		if (PTR_ERR(es7202->supply) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(es7202->supply),
+					     "failed to get supply\n");
+
+		es7202->supply = NULL;
+		es7202->supply_uv = ES7202_SUPPLY_3V3_DEFAULT_UV;
+	} else {
+		ret = regulator_enable(es7202->supply);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to enable supply\n");
+
+		ret = devm_add_action_or_reset(dev, es7202_disable_supply,
+					       es7202->supply);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to add supply disable action\n");
+
+		es7202->supply_uv = regulator_get_voltage(es7202->supply);
+		if (es7202->supply_uv < 0)
+			es7202->supply_uv = ES7202_SUPPLY_3V3_DEFAULT_UV;
+	}
+
+	/* take the device out of reset */
+	gpiod_set_value_cansleep(es7202->reset_gpio, 0);
+	usleep_range(1000, 2000);
+
+	/* verify the chip is present by reading its device id */
+	ret = regmap_read(es7202->regmap, ES7202_DEV_ID1, &id1);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read device id\n");
+	ret = regmap_read(es7202->regmap, ES7202_DEV_ID0, &id0);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read device id\n");
+
+	device_id = (id1 << 8) | id0;
+	if (device_id != ES7202_DEVICE_ID)
+		return dev_err_probe(dev, -ENODEV,
+				     "unexpected device id 0x%04x, expected 0x%04x\n",
+				     device_id, ES7202_DEVICE_ID);
+
+	ret = es7202_hw_init(es7202);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init device\n");
+
+	return devm_snd_soc_register_component(dev, &es7202_component_driver,
+					       &es7202_dai, 1);
+}
+
+static void es7202_i2c_remove(struct i2c_client *i2c)
+{
+	struct es7202_priv *es7202 = i2c_get_clientdata(i2c);
+
+	es7202_mute_pdm(es7202, true);
+}
+
+static void es7202_i2c_shutdown(struct i2c_client *i2c)
+{
+	struct es7202_priv *es7202 = i2c_get_clientdata(i2c);
+
+	es7202_mute_pdm(es7202, true);
+}
+
+static const struct of_device_id es7202_of_match[] = {
+	{ .compatible = "everest,es7202" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, es7202_of_match);
+
+static const struct i2c_device_id es7202_i2c_id[] = {
+	{ "es7202" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, es7202_i2c_id);
+
+static struct i2c_driver es7202_i2c_driver = {
+	.driver = {
+		.name		= "es7202",
+		.of_match_table	= of_match_ptr(es7202_of_match),
+	},
+	.probe		= es7202_i2c_probe,
+	.remove		= es7202_i2c_remove,
+	.shutdown	= es7202_i2c_shutdown,
+	.id_table	= es7202_i2c_id,
+};
+module_i2c_driver(es7202_i2c_driver);
+
+MODULE_DESCRIPTION("Everest Semi ES7202 PDM ADC ALSA SoC Codec Driver");
+MODULE_AUTHOR("David Yang <yangxiaohua@everest-semi.com>");
+MODULE_AUTHOR("Jun Yan <jerrysteve1101@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/es7202.h b/sound/soc/codecs/es7202.h
new file mode 100644
index 000000000000..15811b73c20a
--- /dev/null
+++ b/sound/soc/codecs/es7202.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright Everest Semiconductor Co., Ltd.
+ *
+ * Author: David Yang <yangxiaohua@everest-semi.com>
+ * Author: Jun Yan <jerrysteve1101@gmail.com>
+ */
+
+#ifndef _ES7202_H
+#define _ES7202_H
+
+#include <linux/bits.h>
+
+/* Register addresses */
+#define ES7202_RESET		0x00
+#define ES7202_SOFT_MODE	0x01
+#define ES7202_CLK_DIV		0x02
+#define ES7202_CLK_EN		0x03
+#define ES7202_T1_VMID		0x04
+#define ES7202_T2_VMID		0x05
+#define ES7202_CHIP_STA		0x06
+#define ES7202_PDM_INF_CTL	0x07
+#define ES7202_MISC_CTL		0x08
+#define ES7202_ANALOG_EN	0x10
+#define ES7202_BIAS_VMID	0x11
+#define ES7202_PGA1_BIAS	0x12
+#define ES7202_PGA2_BIAS	0x13
+#define ES7202_MOD1_BIAS	0x14
+#define ES7202_MOD2_BIAS	0x15
+#define ES7202_VREFP_BIAS	0x16
+#define ES7202_VMMOD_BIAS	0x17
+#define ES7202_MODS_BIAS	0x18
+#define ES7202_ANALOG_LP1	0x19
+#define ES7202_ANALOG_LP2	0x1a
+#define ES7202_ANALOG_MISC1	0x1b
+#define ES7202_ANALOG_MISC2	0x1c
+#define ES7202_PGA1		0x1d
+#define ES7202_PGA2		0x1e
+#define ES7202_DEV_ID1		0xfd
+#define ES7202_DEV_ID0		0xfe
+
+#define ES7202_DEVICE_ID		0x7201
+
+#define ES7202_RESET_RST_REGS		BIT(5)
+#define ES7202_RESET_RST_DIG		BIT(4)
+#define ES7202_RESET_SEQ_DIS		BIT(1)
+#define ES7202_RESET_CSM_ON		BIT(0)
+
+#define ES7202_MODE_SOFT_MODE_SEL	BIT(0)
+
+#define ES7202_CLK_DIV_MCLK_DIV		GENMASK(3, 0)	/* 0/1 = /16 ... 15 = /240 */
+
+#define ES7202_CLK_MCLK_INVERT		BIT(2)
+#define ES7202_CLK_ANA_CLK_ON		BIT(1)
+#define ES7202_CLK_MCLK_ON		BIT(0)
+
+#define ES7202_CHIP_STA_CSM_STATE	GENMASK(5, 4)
+#define ES7202_CHIP_STA_FORCE_CSM	GENMASK(2, 0)
+
+#define ES7202_PDM_NEG_DATA_VALID	BIT(5)
+#define ES7202_PDM_POS_DATA_VALID	BIT(4)
+#define ES7202_PDM_CHN_CROSS		BIT(3)
+#define ES7202_PDM_IF_DLY		BIT(2)
+#define ES7202_PDM_DATA2_MUTE		BIT(1)
+#define ES7202_PDM_DATA1_MUTE		BIT(0)
+#define ES7202_PDM_INF_CTL_MUTE		(ES7202_PDM_DATA2_MUTE | \
+					 ES7202_PDM_DATA1_MUTE)
+
+#define ES7202_MISC_CLKDET_RST_DIS	BIT(2)
+#define ES7202_MISC_DSM_DITHER_ON	BIT(1)
+#define ES7202_MISC_PDN_CLKDET		BIT(0)
+
+#define ES7202_ANALOG_EN_PDN_ANA	BIT(7)
+#define ES7202_ANALOG_EN_PDN_ADCVREFGEN	BIT(6)
+#define ES7202_ANALOG_EN_MODTOP1_RST	BIT(5)
+#define ES7202_ANALOG_EN_MODTOP2_RST	BIT(4)
+#define ES7202_ANALOG_EN_PDN_MOD1	BIT(3)
+#define ES7202_ANALOG_EN_PDN_MOD2	BIT(2)
+#define ES7202_ANALOG_EN_PDN_PGA1	BIT(1)
+#define ES7202_ANALOG_EN_PDN_PGA2	BIT(0)
+
+#define ES7202_BIAS_ADCBIAS_SWH0	GENMASK(7, 6)
+#define ES7202_BIAS_ENDITHER		BIT(5)
+#define ES7202_BIAS_ADCBIAS_SWH1	GENMASK(3, 2)
+#define ES7202_BIAS_VMIDSEL		GENMASK(1, 0)	/* 0 = off, 1 = 50k, 2 = 500k, 3 = 5k */
+
+/* bias levels 0x12-0x18 (SW0 for 1.8 V, SW1 for 3.3 V) */
+#define ES7202_PGA1_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_PGA1_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_PGA2_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_PGA2_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_MOD1_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_MOD1_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_MOD2_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_MOD2_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_VREFP_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_VREFP_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_VMMOD_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_VMMOD_BIAS_SW1		GENMASK(3, 0)
+#define ES7202_MODS_BIAS_SW0		GENMASK(7, 4)
+#define ES7202_MODS_BIAS_SW1		GENMASK(3, 0)
+
+#define ES7202_LP1_LP_VRP		BIT(7)
+#define ES7202_LP1_LP_VRPOUT		BIT(6)
+#define ES7202_LP1_LP_VMMOD1		BIT(5)
+#define ES7202_LP1_LP_VMMOD2		BIT(4)
+#define ES7202_LP1_LP_MODS1		BIT(3)
+#define ES7202_LP1_LP_MODS2		BIT(2)
+#define ES7202_LP1_LP_MODI1		BIT(1)
+#define ES7202_LP1_LP_MODI2		BIT(0)
+
+#define ES7202_LP2_LP_PGA1		BIT(5)
+#define ES7202_LP2_LP_PGA2		BIT(4)
+#define ES7202_LP2_PDN_DETCT		BIT(3)
+
+#define ES7202_ANALOG_MISC1_OFFSETSEL1	BIT(6)
+#define ES7202_ANALOG_MISC1_OFFSETSEL0	BIT(5)
+#define ES7202_ANALOG_MISC1_SUPPLYSEL	BIT(4)	/* 0 = 1.8 V, 1 = 3.3 V */
+#define ES7202_ANALOG_MISC1_DITHERSEL	GENMASK(2, 0)
+
+#define ES7202_ANALOG_MISC2_VX2OFF_SW0	BIT(7)
+#define ES7202_ANALOG_MISC2_VX1SEL_SW0	BIT(6)
+#define ES7202_ANALOG_MISC2_VMIDLOW_SW0	GENMASK(5, 4)
+#define ES7202_ANALOG_MISC2_VX2OFF_SW1	BIT(3)
+#define ES7202_ANALOG_MISC2_VX1SEL_SW1	BIT(2)
+#define ES7202_ANALOG_MISC2_VMIDLOW_SW1	GENMASK(1, 0)
+
+#define ES7202_PGA_SELMIC1		BIT(4)
+#define ES7202_PGA_MIC1_GAIN		GENMASK(3, 0)
+#define ES7202_PGA_SELMIC2		BIT(4)
+#define ES7202_PGA_MIC2_GAIN		GENMASK(3, 0)
+
+#endif
-- 
2.56.0


