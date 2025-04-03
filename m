Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB9AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=30oQvrGSZEjw3gm4x4DE/e3UUZtvtmEF/owD0Qg3a+M=; b=1O0A23sZp0st10HEUUaCX8yO8e
	Pn9VsJIWTL5oOVYlKk39XAm0RSDTns77qajF7T89q+99EB16vWHjTgu3FjuBJL78K5vZT/P1qsuIc
	o+SvbXlxJQ3kQSJY8aSobeQ/odMz00Q+dAQWOjWCv89vxuuLKf6WlgXzrAqu5RZ9yUfvqVPrItwMB
	xyivoaGN8WNffeUjOAPjq3MkUEsHPAc2t4vQEnsbyx5ya+pFs6wJK0IvFkjWVLC2QD+GJMPZijoxi
	9jKmp59zPTWRFjz08Y2uFOV7erq7OsU9BCFFpB+dd9Gv+iv6zNi2N/rGI+noiO5MFl9dYypw0QVMz
	HC6DbvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FbV-00000008DNW-2wXv;
	Thu, 03 Apr 2025 08:07:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FZj-00000008DED-0p9j;
	Thu, 03 Apr 2025 08:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743667520;
	bh=3jgx9m/tc8Q/3nq8eQJ9H+Pb7YFZEbjz/3rHdIWLlt4=;
	h=From:Date:Subject:To:Cc:From;
	b=mOguEV4KvjPQo8ewEkVvdMIuyU2YpiHN/rTPLbICbi9j9HAIr26DNSfYQClWtb1K8
	 4IJXR60OeMn2Rt4Tldnppu7rDY4DXP/4YDgpIs5Q9OlXkW8hXOBrR2ngQo6dy6tpvI
	 RTRPHnOLeKpBDx4sKADOG8ErTnhMJDmeT4MQ8wYTuNJV3ya61e6PLL7tdy5zLaETj+
	 KJXVFYAtvURgRHZ5bK9DfV6Y3iFQ8/aTwdAcd/pwPFudmPhgRAlYmAiimYBP8r2tgq
	 NdmuQzfze5Di/rOJZzR/Nyq45mbtrKhQlcPn23L39hcNHHoIR4It2Y/Xa7Ut+JnwMy
	 W3bSrZ9RWJ64w==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BB0C17E00A3;
	Thu,  3 Apr 2025 10:05:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 03 Apr 2025 10:05:16 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix pcie
 pinctrl dtbs_check error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
X-B4-Tracking: v=1; b=H4sIADtB7mcC/y2NywqDMBBFf0Vm3YGofWh/pbjQeKtDMbGTtAjiv
 zdol+dyOWelABUEumcrKb4SxLsE+SkjO7ZuAEufmApTXMzZFDzFqqwND3Di2fpp8o6fsvBsBdz
 HLrAdYV8MVa+cl52pkN/M1daUnLMinffeozlY8f6kbDxG6tqA3Svxnjkskf/pkppt+wHpJwcYs
 AAAAA==
X-Change-ID: 20250402-mt8390-genio-common-fix-pcie-dtbs-check-error-13b08e1706c9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743667520; l=1463;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=3jgx9m/tc8Q/3nq8eQJ9H+Pb7YFZEbjz/3rHdIWLlt4=;
 b=DGJlIapdDR+iZz5p9XnvZUlxdGgftQwKuv0ds4ImZlAWeMW7/VvuzhIpiG7xZddEfaFXHyw1j
 KonucL+EtDPCuNnqQE2RQbWmAxj9E8xpnnwyVyHwHgNhU+lh89/iE3Z
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_010523_768597_BFE5EEC7 
X-CRM114-Status: UNSURE (   9.78  )
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

Rename pcie pinctrl definition to fix the following dtbs_check error
for mt8370-genio-510-evk and mt8390-genio-700-evk devicetree files:
```
pinctrl@10005000: 'pcie-default' does not match any of the regexes:
  '-pins$', 'pinctrl-[0-9]+'
```

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 60139e6dffd8e0e326690d922f3360d829ed026b..e9d57f44475b00f19983a968ae113deb4d86bf12 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -501,7 +501,7 @@ &mt6359codec {
 
 &pcie {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie_pins_default>;
+	pinctrl-0 = <&pcie_default_pins>;
 	status = "okay";
 };
 
@@ -874,8 +874,8 @@ pins-rst {
 		};
 	};
 
-	pcie_pins_default: pcie-default {
-		mux {
+	pcie_default_pins: pcie-default-pins {
+		pins {
 			pinmux = <PINMUX_GPIO47__FUNC_I1_WAKEN>,
 				 <PINMUX_GPIO48__FUNC_O_PERSTN>,
 				 <PINMUX_GPIO49__FUNC_B1_CLKREQN>;

---
base-commit: 9eb5f358d46764a8be92f04a7b4340366f715c5b
change-id: 20250402-mt8390-genio-common-fix-pcie-dtbs-check-error-13b08e1706c9

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


