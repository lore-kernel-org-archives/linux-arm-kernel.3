Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA486CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcnKwcptdZmAR7FEOX0Ip4lpsm46DvyazI1BjoyxjZw=; b=pyJnH1htDk3GOQxNqCbET+gO9E
	aWqyvJ08CB5EaStQ8UJJWLOepr9gy+HWYG/zKfp7OMOBF6X4gGts2Dv1get8qZtjHOq9E6AC0PVUS
	Rd7Q5EJQ7d46DaSoNZLiPvbf4rsh5cpfRrmy7GUs3hsc1HZVhN7Yj3bpynh2RSANO/yedIjTvAlEf
	ev3opznlQEyjt9BGPSDkiwMwFny1bwbETQJnaiM9WQspIWXfa298eeF8giEWFKvx3ZB+Q6mcKhzNi
	35+PU+39PJImqR3dcNfBEbxaeWuEtLfa5LiGkmYMR7vPDTNUTJLuVXp/WPAJW3xJiygud2iaWqc+7
	xq9SovGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvGAe-0000000BQxN-33Om;
	Sun, 07 Sep 2025 14:15:08 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFtq-0000000BN77-1ynJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:57:50 +0000
DKIM-Signature: a=rsa-sha256; bh=lcnKwcptdZmAR7FEOX0Ip4lpsm46DvyazI1BjoyxjZw=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1757253363; v=1; x=1757685363;
 b=sdunyu2ZyuIIaJX5/IZGfGJkuuCgrzqz6u35NGpW9HZl3g2AwHxxwnAanZloA6gZfh6IXHZn
 EBGHjWEe3PAz7PxiZhCc3f5V4CAHih9/0oAiZjs04uIaWeAd3bxH+bdeTnfpPPv/Tiyf/cD7bcF
 y72V3U3JGxWgPdCy/QAc0XtIov2myVIJ48oHNoIHEO4p/G2qn8FeByMNeS8wwqZTZj6OSoe6pP4
 69zF7kO+JxQAcloszuJxPsIN2tu3VgY8dTNRbZUOk6VoXMkQuwUIP2Hf5/I9SGMIy1P1h/IWvbo
 xjWGKIHaLtVS26J+kd7i0nh55pLba5HWTxHbY0Tbbcd6Q==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 4fddfee5; Sun, 07 Sep 2025 15:56:03 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Sun, 07 Sep 2025 15:55:17 +0200
Subject: [PATCH 4/9] arm64: dts: marvell: pxa1908: Add PWMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250907-pxa1908-dts-v1-4-da776eb29e45@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=6njTuJu0UcIU1bHrsjDWk5PZ/WvBeIzNhePT57xOd78=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBl7+94d17a4EnPw3aFWjnmWvwVU40sd0jUXNyw8/8Jfd
 bZs+ek3HaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjCRsxcY/hctKJd9fPLJ9/Tl
 vFOFNn9tMvzJXPlY4ey0Qw4zTYJnXVJi+CutzKmXtKtKQXEqh9tKz5xfu2ae3JJVuTXhwMEX3Be
 6NZkB
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_065747_375506_925F8F6B 
X-CRM114-Status: UNSURE (   7.84  )
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

The SoC has 4 onboard PWMs. Add a node for each of them.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index cf2b9109688ce560eec8a1397251ead68d78a239..61498fd75d1dcaf0d068943c1ac14d3e5a7ca9ae 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -195,6 +195,38 @@ gpio@100 {
 				};
 			};
 
+			pwm0: pwm@1a000 {
+				compatible = "marvell,pxa250-pwm";
+				reg = <0x1a000 0x10>;
+				clocks = <&apbc PXA1908_CLK_PWM0>;
+				#pwm-cells = <1>;
+				status = "disabled";
+			};
+
+			pwm1: pwm@1a400 {
+				compatible = "marvell,pxa250-pwm";
+				reg = <0x1a400 0x10>;
+				clocks = <&apbc PXA1908_CLK_PWM1>;
+				#pwm-cells = <1>;
+				status = "disabled";
+			};
+
+			pwm2: pwm@1a800 {
+				compatible = "marvell,pxa250-pwm";
+				reg = <0x1a800 0x10>;
+				clocks = <&apbc PXA1908_CLK_PWM2>;
+				#pwm-cells = <1>;
+				status = "disabled";
+			};
+
+			pwm3: pwm@1ac00 {
+				compatible = "marvell,pxa250-pwm";
+				reg = <0x1ac00 0x10>;
+				clocks = <&apbc PXA1908_CLK_PWM3>;
+				#pwm-cells = <1>;
+				status = "disabled";
+			};
+
 			pmx: pinmux@1e000 {
 				compatible = "marvell,pxa1908-padconf", "pinconf-single";
 				reg = <0x1e000 0x330>;

-- 
2.51.0


