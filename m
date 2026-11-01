Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B40606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vrENnOOZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re5GAdU8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bj0ltQtv/choXAJqYl6bK+gN567VD4DEe8Wk1o0RXYw=; b=vrENnOOZq//Vek
	h3I5UO80Xig2IjqqEBmssPyt9Yhl2CSsm0zoa06FYuciHEXkD1GIpk31C3w1+HUQMbvz/v1Szit3S
	uwG9QgnFzhng0w/0VAWiHblznGAr2whXd7ag+KMBaQsrqpJwsXTtg8/IycVLFp+OVe4e6o7MRbaQH
	dQ+gwJL289yaok2nKk/QK8dYvUSlI7W4TA71XZYo7USTEvyFeys3vtGLULqHeyzWOLI+kWxS9I895
	+bHdE7/7ddlXcz9Rl1Vv4t8ibg1wCUDFIPlBUnYb7C+pWWVSvsHVkj7FtfCpkA8R4z06DN31QhR0o
	oUpPBqmiy83DHll8aq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYgA-0000000EgLT-1dSf;
	Sun, 01 Nov 2026 16:45:10 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYg7-0000000EgJz-3cCx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 16:45:09 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-313bab9cfe7so410693eec.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 08:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551507; x=1794156307; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bj0ltQtv/choXAJqYl6bK+gN567VD4DEe8Wk1o0RXYw=;
        b=re5GAdU8YewAPQFtbntRZregFR/c9nocQad4RcYQijiCTYij4GKbLt8pSfrGOoynLu
         pYMsuPcmaZYKKUlXmApdt/XBdj74Y8yKcGqaFjG/TTiAl4IlYGtFxwAdLXm3VOaF60PD
         ARwUjvw3JTLgx+azQCd+8KyY5BxVY0+zTdOr+Kcfyw5U3oQvzGxKapD36dyODpxwA1UG
         bysMVAYmO7jvKa7HuyMKJ5FJWLZcrTrFI7n9j4WhUKgurmnd0Fwb5wVukicJjLX2/orW
         fQzD3c488pzGxcWeLB63qaRiiBEzuHFZdYFIyZZz/g4Ia0GMkvNHwwNxnFsrkKB3Rouq
         X6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551507; x=1794156307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bj0ltQtv/choXAJqYl6bK+gN567VD4DEe8Wk1o0RXYw=;
        b=stCpfon/A4HBUAuxCQQ2tRyrqdgnxpFKTHzKn5vOtshQzDsBVozbV2RfEcU18yZ1Sp
         jF6NDCKjS2XmKXqsinRdt5vzNUwP8giUoDUjbEy/ciD9pE5F9A/rNcn7ngs1J6noa2xh
         SFV2PjL0UD8Ju+u+icbTZ9TqQscad1r1w756ndjgTKXmR2jSo6I3/FOgB0gWQP7+7mL1
         4MvDyWlKw1kAaKJFY5oKdvwDpYikgrO1s7dyyzxe9ka75k0hHDizY/FXtaQDj3qvhmYl
         Ekweh8uGlhqjZQvfRrVZv68oStkFl0hag1iqmszk06djQNCDk7kI/kClKmuunDrHV/cn
         nazA==
X-Forwarded-Encrypted: i=1; AKwUvBwEipuEiQxVwBXgvwMpAKCAVIzEtnmNV8ILHEwJWVg40XZx+XEO5/PY0wxII2RByXInKB3IDbcTkztkjBEvRLdr@lists.infradead.org
X-Gm-Message-State: APuU4Z/PxWuatR+OX9z0LxsfGckxZwSd7U1y2vc1pvmAOvZHyhQYxTvw
	SfEriQYLRYBigovkAK1avlxe2EM+GClpGNwPJ+VQFPfy8SHQIWRAJbad
X-Gm-Gg: AYBFou3Q5/TwTGoBatrZWjTOwaS/W3c2SUGS7Yd/Q6SfIgMucerPoqu4mPk0V12UfX9
	xFOR1jyht0G1Q5lITdBv5O7gn5goGW+6YeTLy/oSs7j8HcZ3Hrr6AknHvJbOWJWhKf38s23lGs+
	qk8Ge5QJ/kMgEgYH7J5oY6YULNhnp5Si5AuqjinQ6Odmm+v1raEJqEn35Dlr91y6YYj14qBlkkJ
	5i0OAdVVd2FqxxuJzADoubH/McBtsWU+t9XLZC4HT+X8JksWNLY/N+ZV9mFimT5aXEmwyguapYc
	rvE/XYDciU5GfjLw2NtLyS4ZrxFB8Q+ss1e3N3eFg6p2dsf8b9ZRJX86JqbulTj0W8ZWYsWnRq8
	7xXngeAaWFeQ+d0rtIefwdolE/LfPp/obyuH45PDsv6xicTFWHa7TqeSh+eshqCJ8G3lPE10X8D
	zgbNUTlYFmCR9a7SYIFHMMclwYObW2psFqiBojrt3+BjO/oRutr67YBX3OA665Fz7HVJHkXBiP1
	Wg3ENcIoRoyXh83pvPqYEpoiL10IaMghxWQ28OqZ6k/o0SqZ8l7jLsLcfQ9REC2Gp/zyCcRsRz+
	xYTJ4OjkOEpzBMdxeuIQczo6DZWbHLq7/4x2ufa8T5zbfAtRDQ==
X-Received: by 2002:a05:693c:8099:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-36a42236aa1mr18150568eec.2.1793551506628;
        Sun, 01 Nov 2026 08:45:06 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm35700172eec.1.2026.11.01.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:45:06 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
Subject: [PATCH 2/2] regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs
Date: Mon,  2 Nov 2026 01:44:04 +0900
Message-ID: <20261101164405.1743177-3-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101164405.1743177-1-rtx4060@gmail.com>
References: <20261101164405.1743177-1-rtx4060@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_084507_905468_572B128C 
X-CRM114-Status: GOOD (  15.27  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VSRAM_CPUB, VSRAM_CPUM, VSRAM_CPUL and VSRAM_APU have a register of their
own for the enable (bit 0) and low power (bit 1) bits, which the header
defines as MT6363_RG_LDO_VSRAM_*_ADDR. The driver does not use it:
MT6363_LDO_L() takes the registers of the BUCK1 group, which is right only
for the VSRAM_{DIGRF,MDFE,MODEM} LDOs of MT6363_LDO_L_SC().

Bit 0 of the BUCK1 enable register is VS1 and bit 1 of the BUCK1 low power
register is VS3. So disabling one of these LDOs disables VS1, their state
is the state of VS1, and asking for their low power mode puts VS3 in it.
The LDOs themselves are never switched.

Use the register of the LDO, as MediaTek's driver does.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: GIBEOM LEE (이기범) <rtx4060@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index cc2e841..c5de049 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -147,7 +147,7 @@ struct mt6363_regulator_info {
 }
 
 #define MT6363_LDO_LINEAR_OPS(match, vreg, in_sup, vops, min, max,	\
-			      step, buck_reg, ocp_intn)			\
+			      step, en_reg, lp_reg, ocp_intn)		\
 [MT6363_ID_##vreg] = {							\
 	.desc = {							\
 		.name = match,						\
@@ -160,13 +160,13 @@ struct mt6363_regulator_info {
 		.n_voltages = (max - min) / step + 1,			\
 		.min_uV = min,						\
 		.uV_step = step,					\
-		.enable_reg = MT6363_RG_##buck_reg##_EN_ADDR,		\
+		.enable_reg = en_reg,					\
 		.enable_mask = BIT(MT6363_RG_LDO_##vreg##_EN_BIT),	\
 		.vsel_reg = MT6363_RG_LDO_##vreg##_VOSEL_ADDR,		\
 		.vsel_mask = MT6363_RG_LDO_##vreg##_VOSEL_MASK,		\
 		.of_map_mode = mt6363_map_mode,				\
 	},								\
-	.lp_mode_reg = MT6363_RG_##buck_reg##_LP_ADDR,			\
+	.lp_mode_reg = lp_reg,						\
 	.lp_mode_mask = BIT(MT6363_RG_LDO_##vreg##_LP_BIT),		\
 	.hw_lp_mode_reg = MT6363_LDO_##vreg##_HW_LP_MODE,		\
 	.hw_lp_mode_mask = 0x4,						\
@@ -176,12 +176,15 @@ struct mt6363_regulator_info {
 #define MT6363_LDO_L_SC(match, vreg, inp, min, max, step, buck_reg,	\
 			ocp_intn)					\
 	MT6363_LDO_LINEAR_OPS(match, vreg, inp, mt6363_vreg_setclr_ops,	\
-			      min, max, step, buck_reg, ocp_intn)
+			      min, max, step,				\
+			      MT6363_RG_##buck_reg##_EN_ADDR,		\
+			      MT6363_RG_##buck_reg##_LP_ADDR, ocp_intn)
 
-#define MT6363_LDO_L(match, vreg, inp, min, max, step, buck_reg,	\
-		     ocp_intn)						\
+#define MT6363_LDO_L(match, vreg, inp, min, max, step, ocp_intn)	\
 	MT6363_LDO_LINEAR_OPS(match, vreg, inp, mt6363_ldo_linear_ops,	\
-			      min, max, step, buck_reg, ocp_intn)
+			      min, max, step,				\
+			      MT6363_RG_LDO_##vreg##_ADDR,		\
+			      MT6363_RG_LDO_##vreg##_ADDR, ocp_intn)
 
 #define MT6363_LDO_LINEAR_CAL_OPS(match, vreg, in_sup, vops, vrnum,	\
 				  ocp_intn)				\
@@ -754,10 +757,10 @@ static struct mt6363_regulator_info mt6363_regulators[] = {
 	MT6363_LDO_VT("vio0p75", VIO075, "vs1-ldo1", 5, 36),
 	MT6363_LDO_VT("vio18", VIO18, "vs1-ldo2", 3, 35),
 	MT6363_LDO_VT("vm18", VM18, "vs1-ldo1", 4, 40),
-	MT6363_LDO_L("vsram-apu", VSRAM_APU, "vs3-ldo1", 400000, 1193750, 6250, BUCK1, 30),
-	MT6363_LDO_L("vsram-cpub", VSRAM_CPUB, "vs2-ldo1", 400000, 1193750, 6250, BUCK1, 27),
-	MT6363_LDO_L("vsram-cpum", VSRAM_CPUM, "vs2-ldo1", 400000, 1193750, 6250, BUCK1, 28),
-	MT6363_LDO_L("vsram-cpul", VSRAM_CPUL, "vs2-ldo2", 400000, 1193750, 6250, BUCK1, 29),
+	MT6363_LDO_L("vsram-apu", VSRAM_APU, "vs3-ldo1", 400000, 1193750, 6250, 30),
+	MT6363_LDO_L("vsram-cpub", VSRAM_CPUB, "vs2-ldo1", 400000, 1193750, 6250, 27),
+	MT6363_LDO_L("vsram-cpum", VSRAM_CPUM, "vs2-ldo1", 400000, 1193750, 6250, 28),
+	MT6363_LDO_L("vsram-cpul", VSRAM_CPUL, "vs2-ldo2", 400000, 1193750, 6250, 29),
 	MT6363_LDO_L_SC("vsram-digrf", VSRAM_DIGRF, "vs3-ldo1", 400000, 1193750, 6250, BUCK1, 23),
 	MT6363_LDO_L_SC("vsram-mdfe", VSRAM_MDFE, "vs3-ldo1", 400000, 1193750, 6250, BUCK1, 24),
 	MT6363_LDO_L_SC("vsram-modem", VSRAM_MODEM, "vs3-ldo2", 400000, 1193750, 6250, BUCK1, 25),

