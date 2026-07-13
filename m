Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8881C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTX+G1brkX1DXdkMsu+ZUULVkBS5SUKuLjC/zfb0+Pg=; b=hNMBFsSlm1OA3d2kkeNCSeoEJt
	hrNKeduCjriri59Ms5J3xaTwxqeAiucOAQqnufcRv9vpd9V6eZFUUWGEewBIfyZmQF22CY5Jggdtg
	/6Kpe1yjo6jH44sAKzMlXNo7REUXei7p5koLdnzLoOolagHCh3evjJc5JO1IPdWBfwNqvcRIR/2Ji
	Fl/nPOukWdIkDCb/KN5g0/M7J8rCXeyW72F3iLoVgG4l0bDU+2NJqCJPszZdvv6YgaPn8Ne956zTR
	KTed7SLrdV0SnbbsZI1T0WwHqd/OICXKRA/AXNgRu8unmcMQuSxf7ldRFmSxObZkGHoBS62hqDn+G
	mmw4bCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDdk-00000008q2s-0iZI;
	Mon, 13 Jul 2026 10:11:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDdj-00000008q27-2YDZ;
	Mon, 13 Jul 2026 10:11:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0FF943BA8;
	Mon, 13 Jul 2026 10:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8A52C2BCF4;
	Mon, 13 Jul 2026 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783937514;
	bh=7RJjhSRLrORuQ7QpJYxJUaa7YME47dK6mHpkFjegxhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n/8JA7Sa6F+IOqI2j4Kc9U3arWFbbutuKv+cbzdIWFKidciEdU/TUlLFJMwn+yp+7
	 pwXzr4mz3qgqZN2oMj95164ey9FQ3mbQNWuJ661wUuL8ve7X+MmF6O+vjCIIaKcw9Z
	 8M3cLwMkINDj8rehPrMJF7XW6VH7F1uHLJhhVow3eXlwEmZOKKQT2TLRd1Q7SFJNKB
	 SfIf0Q+yEKKQce3SnTnuXg1cs5DhxCv1/qjrTUuBX6jlY0ClOhNj88RMG9dro/HjBR
	 IAGqar0HPnP1/QdwCJKFpSHCqiK6a30apnDDO4ev1qHHA5IktC0xzX8NBxE2DbBg6S
	 2X9l72wSXt8hQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A597C44507;
	Mon, 13 Jul 2026 10:11:54 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 13 Jul 2026 13:11:37 +0300
Subject: [PATCH v3 3/3] ARM: dts: mediatek: mt6323: add EFUSE support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-mt6323-nvmem-v3-3-205c39267a24@protonmail.com>
References: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com>
In-Reply-To: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937511; l=771;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=oXee/GlWmV/sWGn0ruKkyx1IqiA7OAnfJd9/nLpO/3U=;
 b=hUtTiqd14ZQdojpigTpm73QMzVmaNbdZ2kn15YvOcmRSxBhS2+BjUySxMUTmQJE9mPAta68uO
 ECv+sBLnknJAQNCdu6Qwh8QI7qCN4JaoX2qgnlp+RUOkNxJ37o5cMap
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 efuse.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index c230c865116d..807e000a7ff6 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -14,6 +14,10 @@ pmic: mt6323 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		efuse {
+			compatible = "mediatek,mt6323-efuse";
+		};
+
 		mt6323_leds: leds {
 			compatible = "mediatek,mt6323-led";
 			#address-cells = <1>;

-- 
2.54.0



