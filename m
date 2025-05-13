Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5A6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5tvjBN6sLqRna3oIEOaD/F1aRnQQUktpzOF8V/AnkcQ=; b=b12sQqcKOnYixloFnMB32fRWEK
	slrR1oBy1Jq40lTZsQ3bzXAyEQwHH/0g/Ym9eXmikPHLcAN5MQGnxdfUUp4QqBigQNed2ITjnJPNS
	Z1ZKFHwwGZrBziO5gh+1sdkrMI1TZFYwR/rNOkbhR4WWSQNTJ7HcUeCZh6JC8uptfxn14CHpXgMQs
	qFiPjGF//+hSpSTuY6SUpTXJRkv98lIgMMYTPHDMURExaBVKBSIw8XJCUvazl/GmKQ+HV5KpPqOp1
	t/Nr+x8QgRtbZ7oAM96AIFm+rduh+MKxwibFdqpVYqRYH5WDoTbcRoSRsK17liPEE+aX5ODZi7our
	UzyJaAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEs57-0000000Crx4-3A9c;
	Tue, 13 May 2025 16:02:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEs30-0000000CrkM-3hEf;
	Tue, 13 May 2025 16:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747152000;
	bh=mohnBTgRq5hJWAWvTrGhcgzyELjLPTMvvBK794EokQc=;
	h=From:Date:Subject:To:Cc:From;
	b=T+6grY7a9XfRcjaFcnPMsUcs5C6Z9b3mtTVCsTePn04YoYMG7E/xf+SCeJCuhc1W6
	 /WgbF5sNpeO7qBqxBwcJ6rGGg5eNyuH7KE3NaiesSpscGRuujV7Gld6nvZL7I2HW39
	 FM6ANw7tULThKMndMSgmA4059gGj8joRhOuaHINIXVS8bXE60O13h90/MIxcUc3r7M
	 Y+9xaEeSgUtazEZGGjnVBrZqFxXILE2gAiG/GCF0TufU1pIhkTE7ypKDIQ+uZvQNkE
	 QBJOyZT1taAT/VIFt7jzNqqU9+8/2Z0JR03joJcc9CtFPni3JLaCEuZlMyhmoT/NyL
	 b+eca/gbUm5iw==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7700217E0858;
	Tue, 13 May 2025 17:59:58 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 13 May 2025 11:59:53 -0400
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Describe CPU
 supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250513-genio-1200-evk-cpu-supplies-v1-1-6f0066bb93db@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHhsI2gC/x3MQQqAIBAAwK/EnltYNaH6SnQI22opTJQkiP6ed
 JzLPJA4CifoqwciZ0ly+gJVV+C2ya+MMheDJm3JKoMrezlRaSLkvKMLF6YrhKMk2LrGWKfJzG0
 HZQiRF7n/fRjf9wNg0uZxbQAAAA==
X-Change-ID: 20250513-genio-1200-evk-cpu-supplies-8c435c203d89
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Ben Lok <ben.lok@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_090003_076997_F7B5E332 
X-CRM114-Status: UNSURE (   9.33  )
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

The Genio 1200 EVK board has the big and little CPU clusters fed by the
same regulators as MT8195-Cherry boards, so describe them in the same
way as commit 17b33dd9e4a3 ("arm64: dts: mediatek: cherry: Describe CPU
supplies").

This prevents the system from hanging during boot in the case that the
cpufreq-mediatek-hw driver tries to probe before the drivers for the
regulators have probed (which happens when using the current defconfig).

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index be5e5f339e811728e91b1ffec45ada25f9b0208b..a71f1b70b0fd61792ac29e9568c30f723ed7c162 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -179,6 +179,38 @@ wifi_fixed_3v3: regulator-2 {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
 &disp_pwm0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&disp_pwm0_pins>;

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-genio-1200-evk-cpu-supplies-8c435c203d89

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


