Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999FAF417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JSKon7KOnWBP0LJ2cGOvfjSkyGFqecN346MquezPp8s=; b=z9newCLoZy4CUFN4kig0+iDz+N
	ioff++w3IudUjxzJ52Cur/t35ZvwHGb7O3wpqQ7y7gDWtFxqxqE3t56LJFvmypwQnfk1z74gwVeYi
	JMeJcU/2jzE7IhzpNSEfP5gyz1rbL7OQfTSNwr2evNc5271HTdve08u+Q2UZzgbC9KpsZvUxHs3Eh
	rOs4qU19pACYbAc+t6UWT62KM342bTEVqqAlEkBpTVsIr7mZN2yFNhvga0YWzCeH/MzDIeJlJgIfr
	/H/r6qGtC3P+pX3XUyqbkgJwDt649qjZodfxvq3kL3KqAVODupnR82EDMJXLdiknnuoj1ZezP1E59
	nFFVOG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcT4-00000007asG-0vZq;
	Mon, 09 Mar 2026 15:24:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcT2-00000007aru-3zTm;
	Mon, 09 Mar 2026 15:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E1A660054;
	Mon,  9 Mar 2026 15:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692CAC2BC86;
	Mon,  9 Mar 2026 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069863;
	bh=sE7CqWgrb+zFP0Cr5jOTclWiaWDkF1Z32PDAvIwjeuU=;
	h=From:Date:Subject:To:Cc:From;
	b=StIOsqFWXfbZVtGbJOoV/8SKumKR7F8HtQXaecihqzAAH0OOUwGBfx82SQEGsMAdb
	 DVTM5HsrJqBniAitHZ4QWn2A63Z8CTgu1IkE++yH3yhJVmn3xauYXEisDlVlDQhsBN
	 o1DWAW00rIGOvrKM3qhr/LqBKR/46s9ll0bf5rDXMq+Yk5QDjOOoRzhxbIIRxFf522
	 aljfq3ZIjKkKwNQbw8Zn36SBVCXm1AqYaAk1c0VSLf7UZNm+SgWRESZdQzZmQ6Uw6v
	 4+3QmNl0Qvkhkr4RXdWE7mara2hdfcKXt711eCF3l1vlGdpa0gXeuW5sYaoPpQy2rF
	 iqttA/lfVhQCA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 09 Mar 2026 16:24:15 +0100
Subject: [PATCH] arm64: dts: airoha: en7581: Add wdt node to to EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-airoha-7581-wdt-v1-1-ee5f09dbd7af@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bmE1LOsr0UFqq71oaFQQ/j3pO
 AMzLySOwgmG6oXIlyQJvoCqK5h35zdGWQqDJt1SQz06iWF32Bmr8F5OLJpJWzLMDkp1RF7l+Y/
 jlPMH+6nmCWEAAAA=
X-Change-ID: 20260309-airoha-7581-wdt-260e02805eea
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Introduce watchdog controller node to EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8eb6cf91343495d1fe531a868e41fb..97d0ee5d8315c2c838eff46efe57bf7657e60c68 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -150,6 +150,14 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		watchdog@1fbf0100 {
+			compatible = "airoha,en7581-wdt";
+			reg = <0x0 0x1fbf0100 0x0 0x38>;
+
+			clocks = <&scuclk EN7523_CLK_BUS>;
+			clock-names = "bus";
+		};
+
 		spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,

---
base-commit: 405c09548a695ca7be58b5b9d3ac8388630e907f
change-id: 20260309-airoha-7581-wdt-260e02805eea

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


