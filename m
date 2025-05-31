Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0447C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 00:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TSkccxQJyPBTeulTuTiETCwXsKbLhBcWM3wPWtnLY8U=; b=ECzYebiezjtekuWoTimwqA0Dfl
	SgE2qyN6j4ciVGwxIykdIMx1/mnUFC9Xx1zCq9JRzRxusBCCyC1HCm98G2dQIcIs8I4/66UjoX5nB
	40svSZ6xcN9BWR8V1ky32ASbQ9VyZpTrjjV3Xcpb5ncjryV4EaM9M357TS0zE/G3hWQhUQ9gMeeOe
	/idIBiZ0ieoO9gC+ia0rhRGyxj+6CD0tvhHlsaqPpNmDmjPJzGalT9HIWSN01U3Vj7g9kDRKpyAKU
	SfhrMe0vPGkmreQL3eliGmZZy6XjuJlCPiQ6K510xc64SF8ALhedABd8d/rTUfQDJeg+Z3CelpmJp
	sLa6KQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLATr-00000002oUx-2Gkk;
	Sat, 31 May 2025 00:53:47 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLAQw-00000002ntn-1q8i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 00:50:47 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747af0bf0ebso1884242b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 17:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748652645; x=1749257445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TSkccxQJyPBTeulTuTiETCwXsKbLhBcWM3wPWtnLY8U=;
        b=EPBZyHTKFSKHjpeVeW+VFgwypJiBxINEss1496QSpUmGewX3ChNDZVlfBhLsFpGBoY
         WpLekyYVQOPadEDx0sDg97ShUJUYyqpsIAdZ9PaAozomHu7Fes4ChvW8UKbQQckqtiF5
         wPcRihW9j1FwvlU5K0otQc3qC5O9XEi86Eph7KVHepye7n+EI5mFZbSwuSETT3gsHcwS
         yYyKq+hFfnajmNBgkPwAzNf63H+/MtvUpIm41Tu7mT8a0icoF//oTZ5bLpVd9U1EppDr
         QteQri3pyPJkCdGQeshQu9vcHx5Xdy2ka9BrZbkt67v10upnV9Wx9EGBLVWj8+SpSCHx
         sVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748652645; x=1749257445;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSkccxQJyPBTeulTuTiETCwXsKbLhBcWM3wPWtnLY8U=;
        b=wSJN/g6TpAn6eqp+gUxgrejDOCVmOLcld1SodKfopKNXPwWZdNkd5+6xR3aD5jQQEE
         dxo0J2/AhCLe2LbDFXa/8PLTzDAL9hMQHHaIYp36oJrP/vGyWYhUKpCKiFz5GmhjW7Rd
         4YlMYeNaMGX92O5jICdq7RrCQU+uTruVkySdjmvW6BwFQfF9TLlX17ZspwBfEVuJhB4P
         5qDfGuyXOgeScTGK90b1ruHHemgauFREs4O9j38s53KblefVQ8e2O8UKKIBtPnw4y4kv
         8+hJuIrWNtpoW/X9klq+ZvwsJVy6NBhdaJtB4XAuTVyrY7+ZLlm/U0RwxRkB1IS6RFm7
         m81A==
X-Gm-Message-State: AOJu0Yy67c9dNeeDhj1R6N1Iu02MHUS5JnlYDlB9K/XNvkPISY0IMgcl
	4dkP6aZaawJbWvdsmrKVfCWLhXd7QwJqCK71M5CC8iASQ4GWgSdNfMKC7UVyqj/7up8RRk1LGZP
	Kkeif0Sl4/5H7T6jmMxUZqeJBNA==
X-Google-Smtp-Source: AGHT+IE6IJa1RG94dsyK59ObFUYWG3ikzXtO5FeZ3ZagvGmSKHUDVu3iu1nBqkQJvGQX5Pvaf2CfmSWgk82ftyglOA==
X-Received: from pfbgc4.prod.google.com ([2002:a05:6a00:62c4:b0:747:a8e8:603e])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3c89:b0:740:afda:a742 with SMTP id d2e1a72fcca58-747d156608emr751484b3a.0.1748652644826;
 Fri, 30 May 2025 17:50:44 -0700 (PDT)
Date: Sat, 31 May 2025 00:50:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250531005038.1118215-1-dylanbhatch@google.com>
Subject: [PATCH v6] arm64/module: Use text-poke API for late relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_175046_518708_80062EB3 
X-CRM114-Status: GOOD (  17.99  )
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

To enable late module patching, livepatch modules need to be able to
apply some of their relocations well after being loaded. In this
scenario however, the livepatch module text and data is already RX-only,
so special treatment is needed to make the late relocations possible. To
do this, use the text-poking API for these late relocations.

This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
text_poke() for late relocations").

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Acked-by: Song Liu <song@kernel.org>
---
 arch/arm64/kernel/module.c | 105 +++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 06bb680bfe975..fdfb71c8fc929 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -23,6 +23,7 @@
 #include <asm/insn.h>
 #include <asm/scs.h>
 #include <asm/sections.h>
+#include <asm/text-patching.h>
 
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
@@ -48,7 +49,15 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 	return 0;
 }
 
-static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
+#define WRITE_PLACE(place, val, mod) do {				\
+	if (mod->state == MODULE_STATE_UNFORMED)			\
+		*(place) = val;						\
+	else								\
+		aarch64_insn_copy(place, &(val), sizeof(*place));	\
+} while (0)
+
+static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
+		      struct module *me)
 {
 	s64 sval = do_reloc(op, place, val);
 
@@ -66,7 +75,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 
 	switch (len) {
 	case 16:
-		*(s16 *)place = sval;
+		WRITE_PLACE((s16 *)place, sval, me);
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U16_MAX)
@@ -82,7 +91,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 		}
 		break;
 	case 32:
-		*(s32 *)place = sval;
+		WRITE_PLACE((s32 *)place, sval, me);
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U32_MAX)
@@ -98,7 +107,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 		}
 		break;
 	case 64:
-		*(s64 *)place = sval;
+		WRITE_PLACE((s64 *)place, sval, me);
 		break;
 	default:
 		pr_err("Invalid length (%d) for data relocation\n", len);
@@ -113,11 +122,13 @@ enum aarch64_insn_movw_imm_type {
 };
 
 static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
-			   int lsb, enum aarch64_insn_movw_imm_type imm_type)
+			   int lsb, enum aarch64_insn_movw_imm_type imm_type,
+			   struct module *me)
 {
 	u64 imm;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
+	__le32 le_insn;
 
 	sval = do_reloc(op, place, val);
 	imm = sval >> lsb;
@@ -145,7 +156,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction with the new encoding. */
 	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	WRITE_PLACE(place, le_insn, me);
 
 	if (imm > U16_MAX)
 		return -ERANGE;
@@ -154,11 +166,13 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 }
 
 static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
-			  int lsb, int len, enum aarch64_insn_imm_type imm_type)
+			  int lsb, int len, enum aarch64_insn_imm_type imm_type,
+			  struct module *me)
 {
 	u64 imm, imm_mask;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
+	__le32 le_insn;
 
 	/* Calculate the relocation value. */
 	sval = do_reloc(op, place, val);
@@ -170,7 +184,8 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction's immediate field. */
 	insn = aarch64_insn_encode_immediate(imm_type, insn, imm);
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	WRITE_PLACE(place, le_insn, me);
 
 	/*
 	 * Extract the upper value bits (including the sign bit) and
@@ -189,17 +204,18 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 }
 
 static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
-			   __le32 *place, u64 val)
+			   __le32 *place, u64 val, struct module *me)
 {
 	u32 insn;
+	__le32 le_insn;
 
 	if (!is_forbidden_offset_for_adrp(place))
 		return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
-				      AARCH64_INSN_IMM_ADR);
+				      AARCH64_INSN_IMM_ADR, me);
 
 	/* patch ADRP to ADR if it is in range */
 	if (!reloc_insn_imm(RELOC_OP_PREL, place, val & ~0xfff, 0, 21,
-			    AARCH64_INSN_IMM_ADR)) {
+			    AARCH64_INSN_IMM_ADR, me)) {
 		insn = le32_to_cpu(*place);
 		insn &= ~BIT(31);
 	} else {
@@ -211,7 +227,8 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 						   AARCH64_INSN_BRANCH_NOLINK);
 	}
 
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	WRITE_PLACE(place, le_insn, me);
 	return 0;
 }
 
@@ -255,23 +272,23 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		/* Data relocations. */
 		case R_AARCH64_ABS64:
 			overflow_check = false;
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 64);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 64, me);
 			break;
 		case R_AARCH64_ABS32:
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 32);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 32, me);
 			break;
 		case R_AARCH64_ABS16:
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 16);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 16, me);
 			break;
 		case R_AARCH64_PREL64:
 			overflow_check = false;
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 64);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 64, me);
 			break;
 		case R_AARCH64_PREL32:
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 32);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 32, me);
 			break;
 		case R_AARCH64_PREL16:
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 16);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 16, me);
 			break;
 
 		/* MOVW instruction relocations. */
@@ -280,88 +297,88 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G0:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_UABS_G1_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G1:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_UABS_G2_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G2:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_UABS_G3:
 			/* We're using the top bits so we can't overflow. */
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 48,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_SABS_G0:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_SABS_G1:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_SABS_G2:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G0_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G0:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G1_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G1:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G2_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G2:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G3:
 			/* We're using the top bits so we can't overflow. */
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 48,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 
 		/* Immediate instruction relocations. */
 		case R_AARCH64_LD_PREL_LO19:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
-					     AARCH64_INSN_IMM_19);
+					     AARCH64_INSN_IMM_19, me);
 			break;
 		case R_AARCH64_ADR_PREL_LO21:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 0, 21,
-					     AARCH64_INSN_IMM_ADR);
+					     AARCH64_INSN_IMM_ADR, me);
 			break;
 		case R_AARCH64_ADR_PREL_PG_HI21_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_ADR_PREL_PG_HI21:
-			ovf = reloc_insn_adrp(me, sechdrs, loc, val);
+			ovf = reloc_insn_adrp(me, sechdrs, loc, val, me);
 			if (ovf && ovf != -ERANGE)
 				return ovf;
 			break;
@@ -369,46 +386,46 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		case R_AARCH64_LDST8_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 0, 12,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_LDST16_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 1, 11,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_LDST32_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 2, 10,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_LDST64_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 3, 9,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_LDST128_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 4, 8,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_TSTBR14:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 14,
-					     AARCH64_INSN_IMM_14);
+					     AARCH64_INSN_IMM_14, me);
 			break;
 		case R_AARCH64_CONDBR19:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
-					     AARCH64_INSN_IMM_19);
+					     AARCH64_INSN_IMM_19, me);
 			break;
 		case R_AARCH64_JUMP26:
 		case R_AARCH64_CALL26:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 26,
-					     AARCH64_INSN_IMM_26);
+					     AARCH64_INSN_IMM_26, me);
 			if (ovf == -ERANGE) {
 				val = module_emit_plt_entry(me, sechdrs, loc, &rel[i], sym);
 				if (!val)
 					return -ENOEXEC;
 				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2,
-						     26, AARCH64_INSN_IMM_26);
+						     26, AARCH64_INSN_IMM_26, me);
 			}
 			break;
 
-- 
2.49.0.1204.g71687c7c1d-goog


