Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8B1C88E5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6NP2n58U5Yq4A+QRjecBvr6xX2Ma/D1EOfK7iAPVBA=; b=zcnEeEkZphcOJY3ZLSk31Rjcuo
	wWJB6zqRCrK/lOuPKLCn30zy0nIsBz2vOgYaFBKqTCcs4ymPCiNvd37GKIpVp8kcum20UGwaD82G7
	B09AKTXRHC0/JJLW1n7ovOTNg7y7T6JSWG8PPW7C7sy1z37wN9MBcu9TGE/0x4vxDDoxI4h3QzTZx
	j/XPF7gzvdR4CFEq8dwK9VR9eiB/KPJLMbIJ/OKMnsx/MBEoSBymEou5GIQWwp1P4OlL/FPiBrE7O
	o+O6BGPboRv9AGOtK52/NcBjYVWJBcm/lSH6xkZoaLgyzUW31TBA4Nbi5u/w5TtrLQs7aiyYDxHJK
	L0HZbJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcy-0000000G7l5-17g4;
	Fri, 11 Sep 2026 08:28:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7hE-2seX;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B1A0447C6;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E1F1C32786;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=d9gRokGuXMnRj4EGFfmt+XQXkpFvGjH7tDqGf3GPJhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RBAItL4EiM2w+F3HGB/si/RZQE/CjCgEQwQ3SvOwEe4+lZ+S4rDCh+1r3C3jYq7sm
	 lP2pQVWC6pzMMm2vWJphnjwkAOXGWeZ71tR+fBb6PqaPoXJ6FrEnIZvWX3wQul+bKu
	 R82dwBiY7lJ0I25H2kQTNrLlF8ZVExBTxwAJKAFLRXkfAmoI8XDGHETOTg0q1IX1l/
	 BArOerJGVEKoZgm4DpbzlQ2LT8wHKmdygjUISKOYyio285JpDEp3wjnqTCRcHNgEJ3
	 u7EThFobH6SgMBZz4G1U0Fdx0j6Mou34oPNGpCOrHxgK1h0DQjOiEaa5QWjXwNjvmb
	 u6GhknDgOvuhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5A6C88E54;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:35 +0800
Subject: [PATCH 08/10] arm64: dts: amlogic: s7d: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-8-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=732;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=pLxRAmolmQ/S413sGcYNxtsPZfazg1P2W2c2iMu9cJc=;
 b=5jEF9+NW5uv6CsNF/LzrnrBni98XNjLVUd3mokEMOltHexGMhim45lH6pshmEUkWDO0hu1wnH
 UNomb5cyUyKDMFpwdox98lFHyws2wCMmz5QHTXM5dWvVD6B20XWhem6
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S7D SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 0c4417bcd682..5593ff9e07eb 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -212,6 +212,11 @@ ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s7d-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 	};
 };

-- 
2.42.0



