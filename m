Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867FEC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=past/mepzg6rqY2RYWZlZQLkBpCV2fVSE/34MT/V+r8=; b=Pr00ibwfmgN/7oM9TdBjyFV8nV
	AySlBymPuNxlO0aD+d4z81waVKJQkhHpeUE6VybAm8GMSxshnDOmhivRuRxORJLKtU5gPegX3WhJK
	tUDdQEtVuCD1rTOmRJ+jIh03tqo6KiApoL7KH6xiwE+Tbe0W1SHCianFTfdqx+Tf/Fl4Z6j30eac3
	3edecTGFj/eB5S7LN2RVkPBQqpUC/2BXBFB+88L1PJj+WoOypVGy6CjLDvQj95UHf1zeeB10nK40d
	Xm834P30sg0e/N+V6YzPgwPTtkr6xAdygcCgPOxhCz/FJW3APMORx68PIPZaoGTL1mJ+29sNH680N
	4JImmUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0Ez-0000000Bmto-3Stt;
	Wed, 30 Apr 2025 05:44:17 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA04L-0000000BldK-0GfT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:33:18 +0000
Received: from [127.0.0.1] (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D62F4342FF8;
	Wed, 30 Apr 2025 05:33:10 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 30 Apr 2025 13:32:07 +0800
Subject: [PATCH v3 5/5] arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-01-sun55i-emac0-v3-5-6fc000bbccbd@gentoo.org>
References: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
In-Reply-To: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KQtVVkxqKgq++RrOtQPY3AP4zXz78fWySFRMQ+WV2cw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoEbXxaftpe1NJ9cfpRt022XLIsXHhvqeP/+lrN
 m3gmTKPy3uJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaBG18V8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dNvEACeKULnlu5Zk1MfpK
 yFz42975F08U5nXUWjXpJ+dsJ+loBIeJ/f2vkvtVqTj89Rm7vG3CLPPpjS7Oy7EEumMogyINsP5
 q9F8GateiqiLR7QU5FsoaB90gavEActY7+USEUqEE5UmFxuRX6AhhKG6aUy8VVkyiPokgkptcvB
 pz3pPsyg22fBo3Tz4TBVp7O9TyJLGvW+++BPewKoc0PFPUOlcarVraKMm+I+9uAwLsgGSjL0hz5
 Ka6uCcZVQf6VpkUMBfoVj+CqUfbrLAdrMs2SUgxUC2QwMLKRtthXF41CKYSSrVtw/isObSgBPPw
 932xGk//aOyGX4mEYRTttXm5mgFUnB84/y6N/s8FrVUK0/+y1fVSqi0MnX1NsGa/LOsQn4+CBWs
 NhThpLovc21IjaVakM3bgkL2QzGKfOmA6e/Qek4c3Iq78GGNJ8WccjktK1I/+uWer/4FUePaRQL
 +I0IPjaTSFiG4Qkgv/0NJUFcMSO5R9J3ddEwFLjyuEzOUk/3L3OkPBevxnUN8uTBrYa13Yq3QLu
 puGs9vF+R+41UZFqAOl3nAsQmUwHqY5XGusqKXaDukMAK6Uh3iFENHt7saULfWyY/J4MLu5oP82
 mITBKX8eCawg617cCed6gQvKRtTJWR5aXcV4d880ZlDm2eJIdFSZW2+Db43GwT+/CXJg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_223317_132213_C5D9071C 
X-CRM114-Status: UNSURE (   9.70  )
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

On Avaota A1 board, the EMAC0 connect to an external RTL8211F-CG PHY,
which features a 25MHz crystal, and using PH8 pin as PHY reset.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
I don't own this board, only compose this patch according to the
schematics. Let me know if it works.
---
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 85a546aecdbe149d6bad10327fca1fb7dafff6ad..4524a195e86d20089cc35610495424ed2dec7e95 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -12,6 +12,7 @@ / {
 	compatible = "yuzukihd,avaota-a1", "allwinner,sun55i-t527";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 
@@ -64,6 +65,24 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac0 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_dcdc4>;
+
+	allwinner,tx-delay-ps = <100>;
+	allwinner,rx-delay-ps = <300>;
+
+	status = "okay";
+};
+
+&mdio0 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */

-- 
2.49.0


