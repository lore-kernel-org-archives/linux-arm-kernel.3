Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E71FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYo5c+rLavjOyKXng9tdbmfl/aYS8e9K80pSkjlAyJY=; b=odmfU5UxhU4p5zZfpK8rTKgO4T
	BqcXqENobwbOPWUL5Cbzot5u66eEdHOrrCDmrIQwlVTfSk1joPpgfJJfdcvhZZ2VZGDq5xFZXlRxb
	X0MGTxtT9WTqfER0pRZsNcjqcMNVxJjjnn8HJrGvJKxbwmgX1AHbBbeEwCSh7ZVUUUdcEbe5lOT8l
	0BuinGIOx01fvglrJx8mLYjBoyZfICXVIkgm4UUooXUQsj/MOYGMXhL6HG6cILqa1wagkLSM7g2iJ
	+KQWkS7qz7GAw1KIH7aalaD5eqwKXXc3CAoOjlETX88PgRAgBga83OH2z86Td6MHoKC7LJycB5Gpw
	4/zV7NeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR02-0000000CU1S-1v7I;
	Thu, 03 Jul 2025 20:57:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM4s-0000000BrsG-0HTw;
	Thu, 03 Jul 2025 15:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751557340;
	bh=OXXezo9jCjAPl/UpmJAtt4tT5kGKJpblJSn0+4s/R7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QkQWGDr7oijzoJ/CcZpmfAsXzc2dhIE1KfQkr7shBqz81sJIhCpgghJzVcQXfdATO
	 adlhFw/0DYmtGoDgMP2bSKdBZs3ZjCDbOYBxM+1AVYVo63cgR7+cEAw253NQIkdQyJ
	 pEHHh5O0QN5Q3sBovTXm4UZTPz324D1sFlAog1oKKpQDliEtYzCYXJ3C801OPXRBtO
	 F3+sZbWMrDaIMXPrajESgKxbdIBfR4+foUn1s2rvlqz0CUGsG1d96RMTn1LnNQSYN8
	 CzHYOOaqMOpM5ZfiUZf19j+ziUlaoafgh26+q48GbK08wPv7hRf4iL4Ms+6Up361Hf
	 i02dbupo2OeEw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FD2617E0EC0;
	Thu,  3 Jul 2025 17:42:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 03 Jul 2025 17:41:05 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-genio-1200-evk: Add
 MT6359 PMIC key support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-add-mt6359-pmic-keys-support-v1-3-21a4d2774e34@collabora.com>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751557337; l=1095;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=OXXezo9jCjAPl/UpmJAtt4tT5kGKJpblJSn0+4s/R7Q=;
 b=7QKFk6Yce77TlmxpQVpDSTveC0jBucm9jpilEQAqsvQ5BKzG2pC3sDQRkDKqSC6iqomdV5jTd
 da5pjVybZWxAA8ZjU7FOsjYWqVDSTY5NeHQa6NL1joHXGzf1OAGu15D
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_084222_273092_D019A13D 
X-CRM114-Status: UNSURE (   9.66  )
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

Add in mt8395-genio-1200-evk devicetree file a sub node in pmic for
the mt6359-keys compatible to add the Power and Home MT6359 PMIC keys
support.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 9f0734731b5ef3c6b86693a389adc399707d5212..cf8cd37f570845a836a97564fd64a6a9a0e4e4d0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -990,6 +990,21 @@ pins {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+
+	mt6359keys: keys {
+		compatible = "mediatek,mt6359-keys";
+		mediatek,long-press-mode = <1>;
+		power-off-time-sec = <0>;
+
+		power-key {
+			linux,keycodes = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		home {
+			linux,keycodes = <KEY_HOME>;
+		};
+	};
 };
 
 &scp {

-- 
2.50.0


