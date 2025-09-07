Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ED4CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sSbxqZIjC+5BHDd/ITsJrERU+gsQ/puZHCH23YTbD8=; b=1hexXTufU84NVJE6KCvgqB70QJ
	wrdneX9r/Zr6damdNs+fO9Z/kKJwqKL24aZbxGQlESQ/DmQLVG1Q93ubBW2HcnwMpyWnmPrMln8H5
	9C37MENDpbGf1/J9x6qh5xwpVbOrkbte8kmGJ+PUJPsVNfWrsdEEtBNFKL/5dq8v+h2DKkb6YjnZC
	4ZzQyBfOQfaack5rFVdQ/+fWyXVAHYzVUGUAk41n/f593birYopsbhFnXiAb1jFHlP5/LeSZ7J4Xs
	xwONG2CXi21MPFuX7FIivWUi1ESemm0Ju/KOflKhs7xYIsVn/SBXLuSl+F0zizyq6b0djluLLKH6r
	guq1YkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvG54-0000000BPsJ-2FfP;
	Sun, 07 Sep 2025 14:09:22 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFtq-0000000BN6v-1wga
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:57:49 +0000
DKIM-Signature: a=rsa-sha256; bh=0sSbxqZIjC+5BHDd/ITsJrERU+gsQ/puZHCH23YTbD8=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1757253366; v=1; x=1757685366;
 b=RVL5sz43eKUvf+1Hxv4AOchsxeJ7CbR8KrTTeZoBq+/I54XbuCGYKsp+5A/zxzY0CGTlHL6a
 zrvI2Lmfv5per6DLhyahkXeEWFLWNBEjzoDG0yEHcmcBqD5Gl9eV/fFpuC2tL4zWCIs1w+2iNfc
 cNZYTu4J8SX38Mpw8EW/4KoDeRWnKIvpzh3uZFiY0KD7nxtmWMcRQA46HJU0vALOBkQ7bpm7av3
 o9+IDxu+4966H0A3C+VwVXv+MrNk4tYW4+LTq0TRaswTDzSqv1jp1qH+5DC7cKcx9A59wMk5Io8
 N8bh5n6OMLZ3wY0BSHa8rhxIcih786JH4M+113F/lJKfw==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 02ff93f3; Sun, 07 Sep 2025 15:56:06 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Sun, 07 Sep 2025 15:55:21 +0200
Subject: [PATCH 8/9] arm64: dts: marvell: samsung,coreprimevelte: Fill in
 memory node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250907-pxa1908-dts-v1-8-da776eb29e45@dujemihanovic.xyz>
References: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
In-Reply-To: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=nM2aOAL4Rd5X1oThp5ECWAxcNFIMgGN60dxwZOl4zsk=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBl7+96djNkqqLDWXy8lfXtfz0Yd33l+07YYqa+Pd9R+p
 XVXlJ+5o5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACYieZXhD9fLgsz48x+2ixw6
 Pe3QS83MWQdCmy82yCx5rnNlc/abPVYM/1R22p1gfdGSMrN239SrgkUR2RZLErRueLO67Yu8IvF
 wOQMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_065747_372403_128990AC 
X-CRM114-Status: GOOD (  11.00  )
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

The board is known to have 1 GiB of DRAM with the first 16 MiB unusable.
Instead of relying on the bootloader to fill in the memory node, do it
ourselves.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 13a726d86e65ad836166325e0958a6ec3e6d022e..b3741389e2ae056714ff4235b972bc72b5560455 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -30,13 +30,22 @@ fb0: framebuffer@17177000 {
 		};
 	};
 
-	/* Bootloader fills this in */
 	memory@0 {
 		device_type = "memory";
-		reg = <0 0 0 0>;
+		reg = <0 0 0 0x40000000>;
 	};
 
 	reserved-memory {
+		/*
+		 * Reserved by the vendor bootloader as a "secure region".
+		 *
+		 * TODO: See if the responsible stage of the bootloader can be
+		 * replaced
+		 */
+		secure-region@0 {
+			reg = <0 0 0 0x1000000>;
+		};
+
 		framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;

-- 
2.51.0


