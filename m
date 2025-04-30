Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF321C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cqpEx5IlRI4YMVXAf0TsRZsn7b3lNTh3Rru00ptozE=; b=M1ILsRzTuondNzB7H7Z3DFxDZx
	W5+1vy9Th0WCNTq/05T40PHLO/+O+KIaEIExKyko7XsYk8Zye6e9UDaYwr7bWHbrR6PkRENklAmnb
	SDMTJewmbk3ZglB9UtWWbbTZvVGDZyUBnYSfNVF9RS4DY1Br9oNhjXGJfJa5zDkfVSqmPURM91Lza
	CG5S9+0O7G498zSaBZu1SAjw7n8EpI/A9AGY7NfocqalvowJlLj+yq+j2hfh6QOLPtl5nFfTgGQ/8
	f0Ls4aTf4ObTZkBK6hmANzQSgW7nA2Pex50tJR4KViOfuOR7GJ19bOTuGTDL9ZpqW142DyC8q2+7e
	6fjvYRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1oU-0000000Bync-0pRe;
	Wed, 30 Apr 2025 07:25:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1Xa-0000000BwVg-1z7p
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9cqpEx5IlRI4YMVXAf0TsRZsn7b3lNTh3Rru00ptozE=; b=icsARsHMcFKvwjVT+0XyksobmM
	t3m7DV4c6vzDHoiv/PNiF/GoNJostIPw3KCDpNTEuDkjQ+S3y0+yB6GliOCcJzK52NaR4QPQ24Zc7
	bm9j/Ad/bbHUKpW6ut9GZ6Yf/ODBDEbaDCek4EAKT1nOJCz6xXi8AVeGFV0L363rszrRQ5K5dPjCj
	swioRQBwaqWlzupklOEmPwObuo09tgxGK5edUAUWcFhddisoA83zhpzchPz3vvQvTiPgP3mpsvDsa
	4ctJRb2td2L5ih63bsnisgE0NHLXYtWvjFFI1NCR98Co9wxo7PWU+DDg/0wVM55oTsZlW/bntaXmm
	Uv9RRpow==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA1XX-0000000DiQI-23bm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:07:33 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso10980258a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996848; x=1746601648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cqpEx5IlRI4YMVXAf0TsRZsn7b3lNTh3Rru00ptozE=;
        b=Qw6LS+XsNrkmUuegxZFsQZzAqbzJlUi0mk5l5KB6QDQdxIBPOzfKB8j4/HeQ0tMZyD
         P4gCrkoLT7cVlkqokFTaT7cdHnWZvy6pguWxySELrbaHG+VewJwdkLi93gh03in5QAb1
         Cxb8QGAf6f4uRef1b+VNfPzXP/CuWMh+IosPgw4t0rPrKX2TgOnVUbhNYrIWnPnk7E6S
         HJLElNW7R195yN3wP+qTjWXmN8UTOvwvRcB1YalbxEj+iXiG1rjc20SVMPYEQeTQE5j0
         noqrc7d6DCeT155w/pDC4NIozzIzr5Z0RrrM/zvbv0mraMfPf9vxszUsXKMocShKCORU
         wjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996848; x=1746601648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cqpEx5IlRI4YMVXAf0TsRZsn7b3lNTh3Rru00ptozE=;
        b=vhGiPgjQJqWSBGWfet7Fv+txAW81WL7k+8bD3xgSeamxGOL2VRd3z3LBBiBeh4bPkT
         ZrHnGwLgBEwLZffAxTj4Rjt2G7LX61ctmQh5K8QzzgI6MDzTVcRJSFuSOStS+ezEHEt6
         BIfnB/WowiMG83suIwkxFq5BDa4RwVa3oPFTJX7RSawRWaecUs/nO3KgcGV4HBuC5uH4
         05lywQkET6+LEv7LUPbhYNY3W55kl/rhyckkCmdjaaQRvqTEdyM8zlgfFkZ6UVrvFemc
         u3t94ZPADUuPloS3RaWpy0n7oIz4rrIdUegwmibXLBDbUS/lEuW6/L1h3wWubSJI6jYf
         anSw==
X-Forwarded-Encrypted: i=1; AJvYcCUdwnmdjWokj8kX1qfFm2zYVKDXNvYVQP44wC0yrREUEmmbMtNhwmhLE9Q+JTbjReCKwyRyDbv1ErmR/44mlggx@lists.infradead.org
X-Gm-Message-State: AOJu0YyvYKkz6v0gp859TGUfkxb+KaPvJizwaECylZvC8ZzMjMHVl0aw
	zW5MNtsf1JK8d+DpjtQooD0E4WZuViQPXgZCnjKBZ+lnFasF2+L5
X-Gm-Gg: ASbGncvvg1UXHoEoyBREwweO23eB1Q98R7WzGM92e8A17D0F0ydGBGJz0zf9YCC0ETE
	8bmcXVgG72NdwBC1KySFHis2V7yhI2JAHOASZw0AFnhShf4fd8OWXJCckohukEuc1tJd/JWSnjd
	GcM9M79HzzaRUHCBfP/hEq5Ui4ideKrhvdjFnh4nPIscTmscqMhISa2DrYDMUCPpMg49jZsR3bd
	wf+IlRDSZJPCW35zrsIhHyL6ptn3IFsWU3jDOVTtmjUodw/EvpojNsJYuSbxL3nLc5ApdKOWjuU
	yFrdXOCjR9YCUHzEPRsap3qM0kUdZDHKU+6MhwvjgPCzSot8YhSWmRirGzzdTw7LQ1VS4yD1TMc
	VxGYhe/mfeJE=
X-Google-Smtp-Source: AGHT+IHtIyQrgA81OxhQpz8Ef3LQQfXlVZmgS9b4cayUg7aqSAsn7+4VqLKjjIsWlZSloqYCcnEN2A==
X-Received: by 2002:a05:6402:28c4:b0:5ed:2e84:4f1f with SMTP id 4fb4d7f45d1cf-5f89bf170cfmr1490027a12.22.1745996848449;
        Wed, 30 Apr 2025 00:07:28 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:28 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:12 +0200
Subject: [PATCH v8 8/9] regulator: bcm590xx: Rename BCM59056-specific data
 as such
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-8-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=21159;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=c0tJmmCnUeOZyIArkXvIiUpPqsv4cYLd1LFqYmvQkiQ=;
 b=dEzz4NTq4us0Tk75LB7vROJb9/60JlMpRqITYoYjPc1uZJU0yJcYLFNfGYwwLXzTG5yMUs4tc
 3xp5SABibjtBXzf2lKAEwOJo7OvTuk8L0Tba5NbHQKN12BsKrvkmqRX
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_080731_658701_B1078226 
X-CRM114-Status: GOOD (  15.96  )
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

Previously, the driver used the BCM590XX prefix for register data
specific to the BCM59056. As we will be introducing other regulators
to this driver as well, make the BCM59056-specific values use the
BCM59056 prefix.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v5:
- Adapt to rename of bcm590xx_reg_info to bcm590xx_reg_data

Changes in v4:
- Drop unused BCM590XX_MAX_NUM_REGS constant

Changes in v3:
- Added this commit
---
 drivers/regulator/bcm590xx-regulator.c | 369 +++++++++++++++++----------------
 1 file changed, 189 insertions(+), 180 deletions(-)

diff --git a/drivers/regulator/bcm590xx-regulator.c b/drivers/regulator/bcm590xx-regulator.c
index c2427ea166626bdc1eb7cfb99997d95e5125ed91..f35b2b72e46f70496e16be5244529a5d95d0546d 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -18,146 +18,11 @@
 #include <linux/regulator/of_regulator.h>
 #include <linux/slab.h>
 
-/* I2C slave 0 registers */
-#define BCM590XX_RFLDOPMCTRL1	0x60
-#define BCM590XX_CAMLDO1PMCTRL1	0x62
-#define BCM590XX_CAMLDO2PMCTRL1	0x64
-#define BCM590XX_SIMLDO1PMCTRL1	0x66
-#define BCM590XX_SIMLDO2PMCTRL1	0x68
-#define BCM590XX_SDLDOPMCTRL1	0x6a
-#define BCM590XX_SDXLDOPMCTRL1	0x6c
-#define BCM590XX_MMCLDO1PMCTRL1	0x6e
-#define BCM590XX_MMCLDO2PMCTRL1	0x70
-#define BCM590XX_AUDLDOPMCTRL1	0x72
-#define BCM590XX_MICLDOPMCTRL1	0x74
-#define BCM590XX_USBLDOPMCTRL1	0x76
-#define BCM590XX_VIBLDOPMCTRL1	0x78
-#define BCM590XX_IOSR1PMCTRL1	0x7a
-#define BCM590XX_IOSR2PMCTRL1	0x7c
-#define BCM590XX_CSRPMCTRL1	0x7e
-#define BCM590XX_SDSR1PMCTRL1	0x82
-#define BCM590XX_SDSR2PMCTRL1	0x86
-#define BCM590XX_MSRPMCTRL1	0x8a
-#define BCM590XX_VSRPMCTRL1	0x8e
-#define BCM590XX_RFLDOCTRL	0x96
-#define BCM590XX_CAMLDO1CTRL	0x97
-#define BCM590XX_CAMLDO2CTRL	0x98
-#define BCM590XX_SIMLDO1CTRL	0x99
-#define BCM590XX_SIMLDO2CTRL	0x9a
-#define BCM590XX_SDLDOCTRL	0x9b
-#define BCM590XX_SDXLDOCTRL	0x9c
-#define BCM590XX_MMCLDO1CTRL	0x9d
-#define BCM590XX_MMCLDO2CTRL	0x9e
-#define BCM590XX_AUDLDOCTRL	0x9f
-#define BCM590XX_MICLDOCTRL	0xa0
-#define BCM590XX_USBLDOCTRL	0xa1
-#define BCM590XX_VIBLDOCTRL	0xa2
-#define BCM590XX_CSRVOUT1	0xc0
-#define BCM590XX_IOSR1VOUT1	0xc3
-#define BCM590XX_IOSR2VOUT1	0xc6
-#define BCM590XX_MSRVOUT1	0xc9
-#define BCM590XX_SDSR1VOUT1	0xcc
-#define BCM590XX_SDSR2VOUT1	0xcf
-#define BCM590XX_VSRVOUT1	0xd2
-
-/* I2C slave 1 registers */
-#define BCM590XX_GPLDO5PMCTRL1	0x16
-#define BCM590XX_GPLDO6PMCTRL1	0x18
-#define BCM590XX_GPLDO1CTRL	0x1a
-#define BCM590XX_GPLDO2CTRL	0x1b
-#define BCM590XX_GPLDO3CTRL	0x1c
-#define BCM590XX_GPLDO4CTRL	0x1d
-#define BCM590XX_GPLDO5CTRL	0x1e
-#define BCM590XX_GPLDO6CTRL	0x1f
-#define BCM590XX_OTG_CTRL	0x40
-#define BCM590XX_GPLDO1PMCTRL1	0x57
-#define BCM590XX_GPLDO2PMCTRL1	0x59
-#define BCM590XX_GPLDO3PMCTRL1	0x5b
-#define BCM590XX_GPLDO4PMCTRL1	0x5d
-
 #define BCM590XX_REG_ENABLE	BIT(7)
 #define BCM590XX_VBUS_ENABLE	BIT(2)
 #define BCM590XX_LDO_VSEL_MASK	GENMASK(5, 3)
 #define BCM590XX_SR_VSEL_MASK	GENMASK(5, 0)
 
-/*
- * RFLDO to VSR regulators are
- * accessed via I2C slave 0
- */
-
-/* LDO regulator IDs */
-#define BCM590XX_REG_RFLDO	0
-#define BCM590XX_REG_CAMLDO1	1
-#define BCM590XX_REG_CAMLDO2	2
-#define BCM590XX_REG_SIMLDO1	3
-#define BCM590XX_REG_SIMLDO2	4
-#define BCM590XX_REG_SDLDO	5
-#define BCM590XX_REG_SDXLDO	6
-#define BCM590XX_REG_MMCLDO1	7
-#define BCM590XX_REG_MMCLDO2	8
-#define BCM590XX_REG_AUDLDO	9
-#define BCM590XX_REG_MICLDO	10
-#define BCM590XX_REG_USBLDO	11
-#define BCM590XX_REG_VIBLDO	12
-
-/* DCDC regulator IDs */
-#define BCM590XX_REG_CSR	13
-#define BCM590XX_REG_IOSR1	14
-#define BCM590XX_REG_IOSR2	15
-#define BCM590XX_REG_MSR	16
-#define BCM590XX_REG_SDSR1	17
-#define BCM590XX_REG_SDSR2	18
-#define BCM590XX_REG_VSR	19
-
-/*
- * GPLDO1 to VBUS regulators are
- * accessed via I2C slave 1
- */
-
-#define BCM590XX_REG_GPLDO1	20
-#define BCM590XX_REG_GPLDO2	21
-#define BCM590XX_REG_GPLDO3	22
-#define BCM590XX_REG_GPLDO4	23
-#define BCM590XX_REG_GPLDO5	24
-#define BCM590XX_REG_GPLDO6	25
-#define BCM590XX_REG_VBUS	26
-
-#define BCM590XX_NUM_REGS	27
-
-/* LDO group A: supported voltages in microvolts */
-static const unsigned int ldo_a_table[] = {
-	1200000, 1800000, 2500000, 2700000, 2800000,
-	2900000, 3000000, 3300000,
-};
-
-/* LDO group C: supported voltages in microvolts */
-static const unsigned int ldo_c_table[] = {
-	3100000, 1800000, 2500000, 2700000, 2800000,
-	2900000, 3000000, 3300000,
-};
-
-/* DCDC group CSR: supported voltages in microvolts */
-static const struct linear_range dcdc_csr_ranges[] = {
-	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
-	REGULATOR_LINEAR_RANGE(1360000, 51, 55, 20000),
-	REGULATOR_LINEAR_RANGE(900000, 56, 63, 0),
-};
-
-/* DCDC group IOSR1: supported voltages in microvolts */
-static const struct linear_range dcdc_iosr1_ranges[] = {
-	REGULATOR_LINEAR_RANGE(860000, 2, 51, 10000),
-	REGULATOR_LINEAR_RANGE(1500000, 52, 52, 0),
-	REGULATOR_LINEAR_RANGE(1800000, 53, 53, 0),
-	REGULATOR_LINEAR_RANGE(900000, 54, 63, 0),
-};
-
-/* DCDC group SDSR1: supported voltages in microvolts */
-static const struct linear_range dcdc_sdsr1_ranges[] = {
-	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
-	REGULATOR_LINEAR_RANGE(1340000, 51, 51, 0),
-	REGULATOR_LINEAR_RANGE(900000, 52, 63, 0),
-};
-
 enum bcm590xx_reg_type {
 	BCM590XX_REG_TYPE_LDO,
 	BCM590XX_REG_TYPE_GPLDO,
@@ -203,43 +68,187 @@ static const struct regulator_ops bcm590xx_ops_vbus = {
 	.disable		= regulator_disable_regmap,
 };
 
-#define BCM590XX_REG_DESC(_name, _name_lower)				\
-	.id = BCM590XX_REG_##_name,					\
+#define BCM590XX_REG_DESC(_model, _name, _name_lower)			\
+	.id = _model##_REG_##_name,					\
 	.name = #_name_lower,						\
 	.of_match = of_match_ptr(#_name_lower),				\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.type = REGULATOR_VOLTAGE,					\
 	.owner = THIS_MODULE						\
 
-#define BCM590XX_LDO_DESC(_name, _name_lower, _table)			\
-	BCM590XX_REG_DESC(_name, _name_lower),				\
+#define BCM590XX_LDO_DESC(_model, _model_lower, _name, _name_lower, _table) \
+	BCM590XX_REG_DESC(_model, _name, _name_lower),			\
 	.ops = &bcm590xx_ops_ldo,					\
-	.n_voltages = ARRAY_SIZE(_table),				\
-	.volt_table = _table,						\
-	.vsel_reg = BCM590XX_##_name##CTRL,				\
+	.n_voltages = ARRAY_SIZE(_model_lower##_##_table),		\
+	.volt_table = _model_lower##_##_table,				\
+	.vsel_reg = _model##_##_name##CTRL,				\
 	.vsel_mask = BCM590XX_LDO_VSEL_MASK,				\
-	.enable_reg = BCM590XX_##_name##PMCTRL1,			\
+	.enable_reg = _model##_##_name##PMCTRL1,			\
 	.enable_mask = BCM590XX_REG_ENABLE,				\
 	.enable_is_inverted = true
 
-#define BCM590XX_SR_DESC(_name, _name_lower, _ranges)			\
-	BCM590XX_REG_DESC(_name, _name_lower),				\
+#define BCM590XX_SR_DESC(_model, _model_lower, _name, _name_lower, _ranges) \
+	BCM590XX_REG_DESC(_model, _name, _name_lower),			\
 	.ops = &bcm590xx_ops_dcdc,					\
 	.n_voltages = 64,						\
-	.linear_ranges = _ranges,					\
-	.n_linear_ranges = ARRAY_SIZE(_ranges),				\
-	.vsel_reg = BCM590XX_##_name##VOUT1,				\
+	.linear_ranges = _model_lower##_##_ranges,			\
+	.n_linear_ranges = ARRAY_SIZE(_model_lower##_##_ranges),	\
+	.vsel_reg = _model##_##_name##VOUT1,				\
 	.vsel_mask = BCM590XX_SR_VSEL_MASK,				\
-	.enable_reg = BCM590XX_##_name##PMCTRL1,			\
+	.enable_reg = _model##_##_name##PMCTRL1,			\
 	.enable_mask = BCM590XX_REG_ENABLE,				\
 	.enable_is_inverted = true
 
-static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
+#define BCM59056_REG_DESC(_name, _name_lower)				\
+	BCM590XX_REG_DESC(BCM59056, _name, _name_lower)
+#define BCM59056_LDO_DESC(_name, _name_lower, _table)			\
+	BCM590XX_LDO_DESC(BCM59056, bcm59056, _name, _name_lower, _table)
+#define BCM59056_SR_DESC(_name, _name_lower, _ranges)			\
+	BCM590XX_SR_DESC(BCM59056, bcm59056, _name, _name_lower, _ranges)
+
+/* BCM59056 data */
+
+/* I2C slave 0 registers */
+#define BCM59056_RFLDOPMCTRL1	0x60
+#define BCM59056_CAMLDO1PMCTRL1	0x62
+#define BCM59056_CAMLDO2PMCTRL1	0x64
+#define BCM59056_SIMLDO1PMCTRL1	0x66
+#define BCM59056_SIMLDO2PMCTRL1	0x68
+#define BCM59056_SDLDOPMCTRL1	0x6a
+#define BCM59056_SDXLDOPMCTRL1	0x6c
+#define BCM59056_MMCLDO1PMCTRL1	0x6e
+#define BCM59056_MMCLDO2PMCTRL1	0x70
+#define BCM59056_AUDLDOPMCTRL1	0x72
+#define BCM59056_MICLDOPMCTRL1	0x74
+#define BCM59056_USBLDOPMCTRL1	0x76
+#define BCM59056_VIBLDOPMCTRL1	0x78
+#define BCM59056_IOSR1PMCTRL1	0x7a
+#define BCM59056_IOSR2PMCTRL1	0x7c
+#define BCM59056_CSRPMCTRL1	0x7e
+#define BCM59056_SDSR1PMCTRL1	0x82
+#define BCM59056_SDSR2PMCTRL1	0x86
+#define BCM59056_MSRPMCTRL1	0x8a
+#define BCM59056_VSRPMCTRL1	0x8e
+#define BCM59056_RFLDOCTRL	0x96
+#define BCM59056_CAMLDO1CTRL	0x97
+#define BCM59056_CAMLDO2CTRL	0x98
+#define BCM59056_SIMLDO1CTRL	0x99
+#define BCM59056_SIMLDO2CTRL	0x9a
+#define BCM59056_SDLDOCTRL	0x9b
+#define BCM59056_SDXLDOCTRL	0x9c
+#define BCM59056_MMCLDO1CTRL	0x9d
+#define BCM59056_MMCLDO2CTRL	0x9e
+#define BCM59056_AUDLDOCTRL	0x9f
+#define BCM59056_MICLDOCTRL	0xa0
+#define BCM59056_USBLDOCTRL	0xa1
+#define BCM59056_VIBLDOCTRL	0xa2
+#define BCM59056_CSRVOUT1	0xc0
+#define BCM59056_IOSR1VOUT1	0xc3
+#define BCM59056_IOSR2VOUT1	0xc6
+#define BCM59056_MSRVOUT1	0xc9
+#define BCM59056_SDSR1VOUT1	0xcc
+#define BCM59056_SDSR2VOUT1	0xcf
+#define BCM59056_VSRVOUT1	0xd2
+
+/* I2C slave 1 registers */
+#define BCM59056_GPLDO5PMCTRL1	0x16
+#define BCM59056_GPLDO6PMCTRL1	0x18
+#define BCM59056_GPLDO1CTRL	0x1a
+#define BCM59056_GPLDO2CTRL	0x1b
+#define BCM59056_GPLDO3CTRL	0x1c
+#define BCM59056_GPLDO4CTRL	0x1d
+#define BCM59056_GPLDO5CTRL	0x1e
+#define BCM59056_GPLDO6CTRL	0x1f
+#define BCM59056_OTG_CTRL	0x40
+#define BCM59056_GPLDO1PMCTRL1	0x57
+#define BCM59056_GPLDO2PMCTRL1	0x59
+#define BCM59056_GPLDO3PMCTRL1	0x5b
+#define BCM59056_GPLDO4PMCTRL1	0x5d
+
+/*
+ * RFLDO to VSR regulators are
+ * accessed via I2C slave 0
+ */
+
+/* LDO regulator IDs */
+#define BCM59056_REG_RFLDO	0
+#define BCM59056_REG_CAMLDO1	1
+#define BCM59056_REG_CAMLDO2	2
+#define BCM59056_REG_SIMLDO1	3
+#define BCM59056_REG_SIMLDO2	4
+#define BCM59056_REG_SDLDO	5
+#define BCM59056_REG_SDXLDO	6
+#define BCM59056_REG_MMCLDO1	7
+#define BCM59056_REG_MMCLDO2	8
+#define BCM59056_REG_AUDLDO	9
+#define BCM59056_REG_MICLDO	10
+#define BCM59056_REG_USBLDO	11
+#define BCM59056_REG_VIBLDO	12
+
+/* DCDC regulator IDs */
+#define BCM59056_REG_CSR	13
+#define BCM59056_REG_IOSR1	14
+#define BCM59056_REG_IOSR2	15
+#define BCM59056_REG_MSR	16
+#define BCM59056_REG_SDSR1	17
+#define BCM59056_REG_SDSR2	18
+#define BCM59056_REG_VSR	19
+
+/*
+ * GPLDO1 to VBUS regulators are
+ * accessed via I2C slave 1
+ */
+
+#define BCM59056_REG_GPLDO1	20
+#define BCM59056_REG_GPLDO2	21
+#define BCM59056_REG_GPLDO3	22
+#define BCM59056_REG_GPLDO4	23
+#define BCM59056_REG_GPLDO5	24
+#define BCM59056_REG_GPLDO6	25
+#define BCM59056_REG_VBUS	26
+
+#define BCM59056_NUM_REGS	27
+
+/* LDO group A: supported voltages in microvolts */
+static const unsigned int bcm59056_ldo_a_table[] = {
+	1200000, 1800000, 2500000, 2700000, 2800000,
+	2900000, 3000000, 3300000,
+};
+
+/* LDO group C: supported voltages in microvolts */
+static const unsigned int bcm59056_ldo_c_table[] = {
+	3100000, 1800000, 2500000, 2700000, 2800000,
+	2900000, 3000000, 3300000,
+};
+
+/* DCDC group CSR: supported voltages in microvolts */
+static const struct linear_range bcm59056_dcdc_csr_ranges[] = {
+	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
+	REGULATOR_LINEAR_RANGE(1360000, 51, 55, 20000),
+	REGULATOR_LINEAR_RANGE(900000, 56, 63, 0),
+};
+
+/* DCDC group IOSR1: supported voltages in microvolts */
+static const struct linear_range bcm59056_dcdc_iosr1_ranges[] = {
+	REGULATOR_LINEAR_RANGE(860000, 2, 51, 10000),
+	REGULATOR_LINEAR_RANGE(1500000, 52, 52, 0),
+	REGULATOR_LINEAR_RANGE(1800000, 53, 53, 0),
+	REGULATOR_LINEAR_RANGE(900000, 54, 63, 0),
+};
+
+/* DCDC group SDSR1: supported voltages in microvolts */
+static const struct linear_range bcm59056_dcdc_sdsr1_ranges[] = {
+	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
+	REGULATOR_LINEAR_RANGE(1340000, 51, 51, 0),
+	REGULATOR_LINEAR_RANGE(900000, 52, 63, 0),
+};
+
+static const struct bcm590xx_reg_data bcm59056_regs[BCM59056_NUM_REGS] = {
 	{
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(RFLDO, rfldo, ldo_a_table),
+			BCM59056_LDO_DESC(RFLDO, rfldo, ldo_a_table),
 		},
 	},
 
@@ -247,7 +256,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(CAMLDO1, camldo1, ldo_c_table),
+			BCM59056_LDO_DESC(CAMLDO1, camldo1, ldo_c_table),
 		},
 	},
 
@@ -255,7 +264,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(CAMLDO2, camldo2, ldo_c_table),
+			BCM59056_LDO_DESC(CAMLDO2, camldo2, ldo_c_table),
 		},
 	},
 
@@ -263,7 +272,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(SIMLDO1, simldo1, ldo_a_table),
+			BCM59056_LDO_DESC(SIMLDO1, simldo1, ldo_a_table),
 		},
 	},
 
@@ -271,7 +280,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(SIMLDO2, simldo2, ldo_a_table),
+			BCM59056_LDO_DESC(SIMLDO2, simldo2, ldo_a_table),
 		},
 	},
 
@@ -279,7 +288,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(SDLDO, sdldo, ldo_c_table),
+			BCM59056_LDO_DESC(SDLDO, sdldo, ldo_c_table),
 		},
 	},
 
@@ -287,7 +296,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(SDXLDO, sdxldo, ldo_a_table),
+			BCM59056_LDO_DESC(SDXLDO, sdxldo, ldo_a_table),
 		},
 	},
 
@@ -295,7 +304,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(MMCLDO1, mmcldo1, ldo_a_table),
+			BCM59056_LDO_DESC(MMCLDO1, mmcldo1, ldo_a_table),
 		},
 	},
 
@@ -303,7 +312,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(MMCLDO2, mmcldo2, ldo_a_table),
+			BCM59056_LDO_DESC(MMCLDO2, mmcldo2, ldo_a_table),
 		},
 	},
 
@@ -311,7 +320,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(AUDLDO, audldo, ldo_a_table),
+			BCM59056_LDO_DESC(AUDLDO, audldo, ldo_a_table),
 		},
 	},
 
@@ -319,7 +328,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(MICLDO, micldo, ldo_a_table),
+			BCM59056_LDO_DESC(MICLDO, micldo, ldo_a_table),
 		},
 	},
 
@@ -327,7 +336,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(USBLDO, usbldo, ldo_a_table),
+			BCM59056_LDO_DESC(USBLDO, usbldo, ldo_a_table),
 		},
 	},
 
@@ -335,7 +344,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(VIBLDO, vibldo, ldo_c_table),
+			BCM59056_LDO_DESC(VIBLDO, vibldo, ldo_c_table),
 		},
 	},
 
@@ -343,7 +352,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(CSR, csr, dcdc_csr_ranges),
+			BCM59056_SR_DESC(CSR, csr, dcdc_csr_ranges),
 		},
 	},
 
@@ -351,7 +360,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(IOSR1, iosr1, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(IOSR1, iosr1, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -359,7 +368,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(IOSR2, iosr2, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(IOSR2, iosr2, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -367,7 +376,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(MSR, msr, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(MSR, msr, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -375,7 +384,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(SDSR1, sdsr1, dcdc_sdsr1_ranges),
+			BCM59056_SR_DESC(SDSR1, sdsr1, dcdc_sdsr1_ranges),
 		},
 	},
 
@@ -383,7 +392,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(SDSR2, sdsr2, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(SDSR2, sdsr2, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -391,7 +400,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(VSR, vsr, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(VSR, vsr, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -399,7 +408,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO1, gpldo1, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO1, gpldo1, ldo_a_table),
 		},
 	},
 
@@ -407,7 +416,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO2, gpldo2, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO2, gpldo2, ldo_a_table),
 		},
 	},
 
@@ -415,7 +424,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO3, gpldo3, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO3, gpldo3, ldo_a_table),
 		},
 	},
 
@@ -423,7 +432,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO4, gpldo4, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO4, gpldo4, ldo_a_table),
 		},
 	},
 
@@ -431,7 +440,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO5, gpldo5, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO5, gpldo5, ldo_a_table),
 		},
 	},
 
@@ -439,7 +448,7 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO6, gpldo6, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO6, gpldo6, ldo_a_table),
 		},
 	},
 
@@ -447,11 +456,11 @@ static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_VBUS,
 		.regmap = BCM590XX_REGMAP_SEC,
 		.desc = {
-			BCM590XX_REG_DESC(VBUS, vbus),
+			BCM59056_REG_DESC(VBUS, vbus),
 			.ops = &bcm590xx_ops_vbus,
 			.n_voltages = 1,
 			.fixed_uV = 5000000,
-			.enable_reg = BCM590XX_OTG_CTRL,
+			.enable_reg = BCM59056_OTG_CTRL,
 			.enable_mask = BCM590XX_VBUS_ENABLE,
 		},
 	},
@@ -471,8 +480,8 @@ static int bcm590xx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pmu->mfd = bcm590xx;
-	pmu->n_regulators = BCM590XX_NUM_REGS;
-	pmu->regs = bcm590xx_regs;
+	pmu->n_regulators = BCM59056_NUM_REGS;
+	pmu->regs = bcm59056_regs;
 
 	platform_set_drvdata(pdev, pmu);
 

-- 
2.49.0


