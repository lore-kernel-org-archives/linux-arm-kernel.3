Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EEFCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HABxEvQyJK0R9CLJi/lOyrdwH6VtU+tq1uPecCvVqSw=; b=mV9N3figLhqsaCRTCffelvrGlp
	idZx8F47AKuD5IwHq6hnUgpVbK0OOi0jaOtMc5LFJ9K7qMAH/ILwvRogvxme/B3SjUgG3IYBeSpD4
	JTzlG7XE5IG07JbRBUzvKWeMeuQ4bmVy8JVjNChrIbEFs7Pz7giM9MYGvL9eGwTsfhI5dzNlIvjFP
	7CI+C1NG9q6wRHeg3M0VqD4lu5Px7wg7A3vpf7sDj4CVzKGqC9H+WHohWlBXkaEcddVc70PxeyeVM
	9Mv6/vmecADNUWLkT90grvpw3JUdJAT7ilKHSJA/LMImXgqHOCglVA9yLNkKWitBfiv3/M6WSuyI9
	g/Q56Lhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvGGD-0000000BS3y-1alL;
	Sun, 07 Sep 2025 14:20:53 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFua-0000000BN6s-1Ns9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:58:33 +0000
DKIM-Signature: a=rsa-sha256; bh=HABxEvQyJK0R9CLJi/lOyrdwH6VtU+tq1uPecCvVqSw=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1757253366; v=1; x=1757685366;
 b=DUHC9pkNTY4IiaYE2EvNjNjVniiwrVbtNFUB5GW0Kx3PtUAZEPWNcjzyY2dvYAESZaC/f2nI
 AZt6MK6m5h3LNCAH+G/j3UhhLcTAAHk8/IMp40/MwsNBY2pT/ytPhYuk02bXBbudtdHAzsXXwhH
 Q+FOMRVshwtswT5jhQH6HHilUR6b/NLNZAz5CnD2P8ZQrU7aXdA1xu7GEcErfR0UV0KvpmS/Y+C
 XWu5cZUGgATaJkQaqO3Th+paZ5Da+50DnwXbh4y6mU9+67p7Epw4Qp7RwlHmNKeBbkzr7tRt6fa
 C7MMFMy3PbdSrUtXIgmXEe87whr6Mmi5r8c89LBC3R+3A==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id bd31aaf8; Sun, 07 Sep 2025 15:56:06 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Sun, 07 Sep 2025 15:55:20 +0200
Subject: [PATCH 7/9] arm64: dts: marvell: samsung,coreprimevelte: Drop some
 reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250907-pxa1908-dts-v1-7-da776eb29e45@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=AOTuIRkZ7qxukusobcqK/hGoYlqb/lfC8O75aryw37k=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBl7+959srfgSt5Zdch3QoByA6M/I3uYtuDTAKM0c7u8C
 j6JzSYdpSwMYlwMsmKKLLn/Ha/xfhbZuj17mQHMHFYmkCEMXJwCMJHwtYwM17K/Jj4Kv7W8rXny
 hdtupnO0Fjps2hr29l7N9wkcM/jKtjMyvLu/y0/6Q8aevk3Mq+f+VljE8WjVsX/Sz+InBRvuTvy
 TwwIA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_065832_528902_4E5EC40C 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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

Most of the memory marked as reserved is actually usable. Delete its
reserved-memory nodes so that the memory can be used.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index dc58b19ef5d11c69f52ea7804323fe2fb2257ca7..13a726d86e65ad836166325e0958a6ec3e6d022e 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -41,23 +41,6 @@ framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;
 		};
-
-		gpu@9000000 {
-			reg = <0 0x9000000 0 0x1000000>;
-		};
-
-		/* Communications processor, aka modem */
-		cp@5000000 {
-			reg = <0 0x5000000 0 0x3000000>;
-		};
-
-		cm3@a000000 {
-			reg = <0 0xa000000 0 0x80000>;
-		};
-
-		seclog@8000000 {
-			reg = <0 0x8000000 0 0x100000>;
-		};
 	};
 
 	i2c-muic {

-- 
2.51.0


