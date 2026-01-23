Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7746D778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dvHLrUlmqkQeL19Sblxu6Z+6kt6QSvJtvxPDdkLrTI=; b=DZfPDE2r8G+hHnHBnC4/Fn3PLG
	47R1WFqzI7NfbgO9Nxy143zGt3bqi3H4Not4UTmXBG/xNf7+Vb6IVRqJPsxQgR3BSGacBBVxfuBsd
	TGYLqXTN+9N7DUavfd87u0leoR2PD+5E8ofHRINlMwpW0UJAinOOZurCQLt1k9NfF2PpBuq0VFDI1
	Cx8hHtfbn8e8yz4aSMTo/2dikuoGVStmlrdMFbjFuspIcbpt2lzHuUTlh4tqEnDsSYfO7nsGdG/gG
	1RWASG9ZBNawvn9KJU0pJbR26JqDKFFkkdYmbCor8u5GBuXSYHLjGeHgvF2TLrEFgbZ9Dlns7kxoi
	nXBxUTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNKV-00000009SF4-0ME9;
	Fri, 23 Jan 2026 20:00:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNKT-00000009SDy-1gw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 20:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DF7760053;
	Fri, 23 Jan 2026 20:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7C6C4CEF1;
	Fri, 23 Jan 2026 20:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769198423;
	bh=U8CShDL+HLmggcuSs2HkcE9CVVxs2HO1HfWPj5PHjlA=;
	h=From:Date:Subject:To:Cc:From;
	b=B2xgJ2F8xg/452CkkJj6fFPSUl6q6Y2wanezT63cUfBnAJCVrXViSOyOfpp0dzIy6
	 N594T5gpXhfOLblN0ShunDy8yIBxilTVL9eGkPdj2q2LKGZLUceRMIGLN1Z3LgGyS9
	 iPNCsZhsAPql4/9tstcmHwWI7LAYim9R8b5JaQDAc7KSuF7K/C6c+hynt8bjMBxKAH
	 VYbMq3gZfHZZfIhjiG9CPSOIdn0dzF0FoDeUjaegA8pdFxNKhN5lKzjdluTC9ZjiIw
	 2cXn5Gg+1XfavKg4LCmQ9xvLuNGv9NSPvWSmm11jZMD+EfkFFlGKfXf2VeuRKbm6Qv
	 w1MfF5pMBZ8hw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 23 Jan 2026 21:00:21 +0100
Subject: [PATCH] ARM: dts: gemini: Fix partition offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-gemini-fix-sq201-fis-offset-v1-1-a046625f8846@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDQAwAvyI5N7BJZQt+RTxYm9UcuuqmiLD4d
 0NvMzBMBZOiYtA1FYocarpmF3o0MC1jngX14w4cOAbiJ87y1ayY9ETbOZCT4ZqSyQ/Ta6JAI3N
 s3+CHrYh3/3s/XNcNeelQvm0AAAA=
X-Change-ID: 20260123-gemini-fix-sq201-fis-offset-f7c101a2264b
To: soc@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

These FIS partition offsets were never right: the comment clearly
states the FIS index is at 0xfe0000 and 0x7f * 0x200000 is
0xfe0000.

Tested on the iTian SQ201.

Fixes: d88b11ef91b1 ("ARM: dts: Fix up SQ201 flash access")
Fixes: b5a923f8c739 ("ARM: dts: gemini: Switch to redboot partition parsing")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
SoC folks: please apply this patch directly for fixes.
---
 arch/arm/boot/dts/gemini/gemini-sl93512r.dts | 2 +-
 arch/arm/boot/dts/gemini/gemini-sq201.dts    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/gemini/gemini-sl93512r.dts b/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
index 4992ec276de9..341dec9b636a 100644
--- a/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
+++ b/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
@@ -146,7 +146,7 @@ flash@30000000 {
 			partitions {
 				compatible = "redboot-fis";
 				/* Eraseblock at 0xfe0000 */
-				fis-index-block = <0x1fc>;
+				fis-index-block = <0x7f>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/gemini/gemini-sq201.dts b/arch/arm/boot/dts/gemini/gemini-sq201.dts
index f8c6f6e5cdea..bfd1e8581ad6 100644
--- a/arch/arm/boot/dts/gemini/gemini-sq201.dts
+++ b/arch/arm/boot/dts/gemini/gemini-sq201.dts
@@ -134,7 +134,7 @@ flash@30000000 {
 			partitions {
 				compatible = "redboot-fis";
 				/* Eraseblock at 0xfe0000 */
-				fis-index-block = <0x1fc>;
+				fis-index-block = <0x7f>;
 			};
 		};
 

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260123-gemini-fix-sq201-fis-offset-f7c101a2264b

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


