Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD867D59F68
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgwHKb2GqFqjlOKeWsyt+EQnMg954jRHbFfwtF7+VIo=; b=PTFvsD9qHuzq4J9Rz2f3ZHXFUO
	b8nVuNxjZFoEMEfS8HG2qEOjLBGrQEp1iOKmFyZOteM+A7r16IkhgC/ab09ppLwxO2ny1DeABD75L
	fWIBSnAl2neqY1WGxEUV4BYplT6+V5r/U+disumMAHakGtPJquM9L/f8ctchUE0Dp7XwLNldAVy45
	DJgUxDPSGypbsyepQRf1VNDGijT1hyAkwfhc/NMCPZE8koFOniFYWA11pCQxJRsuGaqUWjdJBg4yG
	GnuBUHXQY+IbChObdsfJLyd97Pv2mCSFJYz7vUYVQoQIXP9y0Z1oUPXOAlV4/c95ci1hm5P4iHuoW
	2drLTW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lF4-00000004QAA-2k4d;
	Wed, 06 Nov 2024 18:58:58 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lBg-00000004Pgu-09DQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:55:29 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-37d5ca192b8so79315f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730919325; x=1731524125; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rgwHKb2GqFqjlOKeWsyt+EQnMg954jRHbFfwtF7+VIo=;
        b=mxZBJEN2U/73/BlaR9hYAjyVkHeRKkQ+VG2AqnblHm91r1Ced7fOsWlXEFtdHAM+vG
         9vy/fArZSE6w34CDzNZ7cHO/CMEvtX9o5U7tAqpZAjWXKCBc2LEWVEf/cGnzAoxRkM6C
         yn9yrltC6nW3k6xUIn/gsHEclzaq4+Vu6IhXkbucROV27toS34U8AQYtCHPG98hff89k
         DtPpLL/l0qOh6yslpTKj+PScRcwO1kde3MP45WqjdzkN8qpiOcMbbJdemY4xaMillFGX
         jsMkJJlLQxGqAPFvaF+cuC19g5QpGAsVgp/EbtvBstD6EZH6duo2L0fzwrinIUdeMi0B
         izVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919325; x=1731524125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgwHKb2GqFqjlOKeWsyt+EQnMg954jRHbFfwtF7+VIo=;
        b=ebHXECNrPgk/Hxo3sBERfVow+LBGNLiOUl0zsxetcmyiljxtiCtBEqZdO72FavLfzb
         SV3669sLn3U+qGOvb3Lyu8TwIS53L7l+s1ZIfT4w+ACSyaIxBFWOVs5PsfzMnwJHg4Ju
         BBkuitxOGVlE5wivPSS9LtBbobHS6V/7ZvEGVe8bfEPlsuTgx3t46ByKatLi6uaqZ6nG
         dop5OPtYfkhGl0bKMzZhOiVuEThc8LFngAVC9NLI30kcDKNvTVj6uEYYTETO27wEyCPv
         p3+I8SU5DicDUvWBRdR7MA1EyeG/HoDMeDBWQw1E3NTCKfk7tPml4lfA8EnnedHs636e
         bueQ==
X-Gm-Message-State: AOJu0YxNzoFnPrT9X+JKjF8cbFKXA1N1+vRsZeeYgEqxXm4jmNHaDJF2
	EvHIue34/1zNVvT3vGe7heLX2Qbf7eHc+MTcBYIzx5R9nQS+qCgZoL6wPUolu0fDnyriyplQtee
	4fGD7pLqF1sCh+VSQGVdJVzTpiF+mQuoIJ+k8n38Vz1ICXy9AoXIDqQnOWjdY461boKh+qT+s0C
	WYpVuWywrhtOWj1yQ6qCf7EftqsclZlk9Qid/mNEUL
X-Google-Smtp-Source: AGHT+IHpMI0YI7UU6jYcxNW1VgmRyWpMRzMCbohgzZJW6PuuM03Rjb83PD2E377wCi+LnHpIyC5qOFrB
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:6683:0:b0:37c:ccea:1ab with SMTP id
 ffacd0b85a97d-381ec60a868mr213f8f.6.1730919325098; Wed, 06 Nov 2024 10:55:25
 -0800 (PST)
Date: Wed,  6 Nov 2024 19:55:15 +0100
In-Reply-To: <20241106185513.3096442-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20241106185513.3096442-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6569; i=ardb@kernel.org;
 h=from:subject; bh=hpEqkAuAH4m6BoctFK29ndCaAoho3ibLF1ND93uwZQI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV1792Sb4LteDayfLUIsbK27JY5arhRcxN+859IZDU3RX
 ym+nc86SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwES8ahn+6dps5vzcYDz3//vD
 5hGbPa/uV89rFJ4yPyzyxu77q67pRDH8ryudG9aabM+Y5FwpwdPKcT/g8vWdyhzJJd++SHCde8j EBAA=
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241106185513.3096442-6-ardb+git@google.com>
Subject: [PATCH 1/3] arm64/scs: Fix handling of DWARF augmentation data in
 CIE/FDE frames
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_105528_109032_2F5B50D5 
X-CRM114-Status: GOOD (  27.22  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The dynamic SCS patching code pretends to parse the DWARF augmentation
data in the CIE (header) frame, and handle accordingly when processing
the individual FDE frames based on this CIE frame. However, the boolean
variable is defined inside the loop, and so the parsed value is ignored.

The same applies to the code alignment field, which is also read from
the header but then discarded.

This was never spotted before because Clang is the only compiler that
supports dynamic SCS patching (which is essentially an Android feature),
and the unwind tables it produces are highly uniform, and match the
de facto defaults.

So instead of testing for the 'z' flag in the augmentation data field,
require a fixed augmentation data string of 'zR', and simplify the rest
of the code accordingly.

Also introduce some error codes to specify why the patching failed, and
log it to the kernel console on failure when this happens when loading a
module. (Doing so for vmlinux is infeasible, as the patching is done
extremely early in the boot.)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/scs.h     |  7 +++
 arch/arm64/kernel/module.c       | 10 +++-
 arch/arm64/kernel/pi/patch-scs.c | 63 +++++++++++---------
 3 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/include/asm/scs.h b/arch/arm64/include/asm/scs.h
index 2e010ea76be2..934e9217cd74 100644
--- a/arch/arm64/include/asm/scs.h
+++ b/arch/arm64/include/asm/scs.h
@@ -46,6 +46,13 @@ static inline void dynamic_scs_init(void)
 static inline void dynamic_scs_init(void) {}
 #endif
 
+enum {
+	EDYNSCS_INVALID_CIE_HEADER		= 1,
+	EDYNSCS_INVALID_CIE_SDATA_SIZE		= 2,
+	EDYNSCS_INVALID_FDE_AUGM_DATA_SIZE	= 3,
+	EDYNSCS_INVALID_CFA_OPCODE		= 4,
+};
+
 int __pi_scs_patch(const u8 eh_frame[], int size);
 asmlinkage void __pi_scs_patch_vmlinux(void);
 
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 36b25af56324..06bb680bfe97 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -462,14 +462,20 @@ int module_finalize(const Elf_Ehdr *hdr,
 		    struct module *me)
 {
 	const Elf_Shdr *s;
+	int ret;
+
 	s = find_section(hdr, sechdrs, ".altinstructions");
 	if (s)
 		apply_alternatives_module((void *)s->sh_addr, s->sh_size);
 
 	if (scs_is_dynamic()) {
 		s = find_section(hdr, sechdrs, ".init.eh_frame");
-		if (s)
-			__pi_scs_patch((void *)s->sh_addr, s->sh_size);
+		if (s) {
+			ret = __pi_scs_patch((void *)s->sh_addr, s->sh_size);
+			if (ret)
+				pr_err("module %s: error occurred during dynamic SCS patching (%d)\n",
+				       me->name, ret);
+		}
 	}
 
 	return module_init_ftrace_plt(hdr, sechdrs, me);
diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-scs.c
index 49d8b40e61bc..cec8f0a52bbc 100644
--- a/arch/arm64/kernel/pi/patch-scs.c
+++ b/arch/arm64/kernel/pi/patch-scs.c
@@ -120,7 +120,11 @@ struct eh_frame {
 	union {
 		struct { // CIE
 			u8	version;
-			u8	augmentation_string[];
+			u8	augmentation_string[3];
+			u8	code_alignment_factor;
+			u8	data_alignment_factor;
+			u8	return_address_register;
+			u8	augmentation_data_size;
 		};
 
 		struct { // FDE
@@ -132,25 +136,21 @@ struct eh_frame {
 };
 
 static int scs_handle_fde_frame(const struct eh_frame *frame,
-				bool fde_has_augmentation_data,
 				int code_alignment_factor,
 				bool dry_run)
 {
 	int size = frame->size - offsetof(struct eh_frame, opcodes) + 4;
 	u64 loc = (u64)offset_to_ptr(&frame->initial_loc);
 	const u8 *opcode = frame->opcodes;
+	int l;
 
-	if (fde_has_augmentation_data) {
-		int l;
+	// assume single byte uleb128_t for augmentation data size
+	if (*opcode & BIT(7))
+		return EDYNSCS_INVALID_FDE_AUGM_DATA_SIZE;
 
-		// assume single byte uleb128_t
-		if (WARN_ON(*opcode & BIT(7)))
-			return -ENOEXEC;
-
-		l = *opcode++;
-		opcode += l;
-		size -= l + 1;
-	}
+	l = *opcode++;
+	opcode += l;
+	size -= l + 1;
 
 	/*
 	 * Starting from 'loc', apply the CFA opcodes that advance the location
@@ -201,7 +201,7 @@ static int scs_handle_fde_frame(const struct eh_frame *frame,
 			break;
 
 		default:
-			return -ENOEXEC;
+			return EDYNSCS_INVALID_CFA_OPCODE;
 		}
 	}
 	return 0;
@@ -209,12 +209,11 @@ static int scs_handle_fde_frame(const struct eh_frame *frame,
 
 int scs_patch(const u8 eh_frame[], int size)
 {
+	int code_alignment_factor = 1;
 	const u8 *p = eh_frame;
 
 	while (size > 4) {
 		const struct eh_frame *frame = (const void *)p;
-		bool fde_has_augmentation_data = true;
-		int code_alignment_factor = 1;
 		int ret;
 
 		if (frame->size == 0 ||
@@ -223,28 +222,36 @@ int scs_patch(const u8 eh_frame[], int size)
 			break;
 
 		if (frame->cie_id_or_pointer == 0) {
-			const u8 *p = frame->augmentation_string;
-
-			/* a 'z' in the augmentation string must come first */
-			fde_has_augmentation_data = *p == 'z';
+			/*
+			 * Require presence of augmentation data (z) with a
+			 * specifier for the size of the FDE initial_loc and
+			 * range fields (R), and nothing else.
+			 */
+			if (strcmp(frame->augmentation_string, "zR"))
+				return EDYNSCS_INVALID_CIE_HEADER;
 
 			/*
 			 * The code alignment factor is a uleb128 encoded field
 			 * but given that the only sensible values are 1 or 4,
-			 * there is no point in decoding the whole thing.
+			 * there is no point in decoding the whole thing.  Also
+			 * sanity check the size of the data alignment factor
+			 * field, and the values of the return address register
+			 * and augmentation data size fields.
 			 */
-			p += strlen(p) + 1;
-			if (!WARN_ON(*p & BIT(7)))
-				code_alignment_factor = *p;
+			if ((frame->code_alignment_factor & BIT(7)) ||
+			    (frame->data_alignment_factor & BIT(7)) ||
+			    frame->return_address_register != 30 ||
+			    frame->augmentation_data_size != 1)
+				return EDYNSCS_INVALID_CIE_HEADER;
+
+			code_alignment_factor = frame->code_alignment_factor;
 		} else {
-			ret = scs_handle_fde_frame(frame,
-						   fde_has_augmentation_data,
-						   code_alignment_factor,
+			ret = scs_handle_fde_frame(frame, code_alignment_factor,
 						   true);
 			if (ret)
 				return ret;
-			scs_handle_fde_frame(frame, fde_has_augmentation_data,
-					     code_alignment_factor, false);
+			scs_handle_fde_frame(frame, code_alignment_factor,
+					     false);
 		}
 
 		p += sizeof(frame->size) + frame->size;
-- 
2.47.0.277.g8800431eea-goog


