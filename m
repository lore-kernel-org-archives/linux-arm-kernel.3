Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22610606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 02:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SHXPq9HX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zTvHoWVK2MnY6BXYoqcKq7jXZ7I8mh27KAsKSWJ+yVU=; b=SHXPq9HX7b210yTnjFcbQLlKKp
	wZFUO2UCtBFyE7Mi3La2R7P1RBZt6I+sDYrFtglfcWHokiBKttKq+WzLP2s0XPLIkub8f/R8pfSHa
	bHT7Aa+3jb0tnxeJZcF+zUfbiGXWLUSmt9SRAfgSyCrLGNkPF6KhIHdVaxIRxal5w3/hL65z/tqDU
	OzilKtOy1UTKoF5UL3weJp16MWg2lxCf/MDPvgyZvw/JWCDHE9Xd/Gu7ZF6uTfoDyRRa6X6RQ6OHg
	jEbGB7VUc+7hC4jkk6J5+u+c3xoeJ22n8y6EkZdGf00mGfxHyEKE/psiPtTeMJmjU2lwTSTrEKTEE
	k3GHOICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLm3-0000000Avj6-3BlG;
	Wed, 21 Oct 2026 02:09:51 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLlz-0000000AviT-3Uev
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 02:09:50 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 21 Oct
 2026 10:09:44 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 21 Oct 2026 10:09:44 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 21 Oct 2026 10:09:39 +0800
Subject: [PATCH v4] arm64: dts: aspeed: Add syscon phandle to AST2700 ADC
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261021-ast27xx-adc-dts-syscon-v4-1-4fab164f10b4@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAOIe2GoC/x3MPQqAMAxA4atIZgO1/qFXEYfSRM1SpRGpiHe3O
 H7Dew8oR2GFsXgg8iUqe8hoygL85sLKKJQN1tiuMrZCp6ftU0JHHulU1Fv9HnDwS0t9XTMZhhw
 fkRdJ/3ia3/cDMRTar2gAAAA=
X-Change-ID: 20261021-ast27xx-adc-dts-syscon-9cf5d733ed0e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Arnd Bergmann <arnd@arndb.de>, Jonathan Cameron <jic23@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792548584; l=1915;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=IZUjXmUfedJ5IwJ86vwzPPmrXl0gfhcW6O8UO+QoZco=;
 b=hpsOaG9Ce6jXRrKDFl/kBKvsWHyz/Sq5Ys08ygSSCBVLWf1flEZBUOpaFZRR4mkAg5IG+L1WX
 lJXwEwYjufqDQ7syQ+sp8bYGfbzkOpnagPjO5KBXdfl6Ddg2O37HL7T
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_190947_871527_AA4C34E8 
X-CRM114-Status: GOOD (  10.59  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Point the ADC nodes at their own syscon1 so the driver can correctly
locate the reference-voltage trimming data on AST2700, where syscon0
and syscon1 share the same device-tree node name and would otherwise
resolve to the wrong SCU.

Fixes: e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device tree")
Assisted-by: LLM
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
This was patch 3/3 of "iio: adc: aspeed: Fix SCU lookup for multi-SCU
AST2700" (https://lore.kernel.org/r/20261005-ast27xx-adc-upstream-v3-0-ef25552d3a59@aspeedtech.com).
Jonathan has applied patches 1 and 2 to the testing branch of iio.git;
this resends patch 3 on its own, now with a Fixes tag, since the
driver falls back to the old global syscon lookup whenever this
property is absent, so patches 1 and 2 alone don't change AST2700's
behaviour without it.
---
 arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
index bc990f79e693..053673cc4b8e 100644
--- a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
+++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
@@ -246,6 +246,7 @@ adc0: adc@14c00000 {
 		clocks = <&syscon1 SCU1_CLK_AHB>;
 		resets = <&syscon1 SCU1_RESET_ADC>;
 		interrupts-extended = <&intc1 80>;
+		aspeed,trim-syscon = <&syscon1>;
 		#io-channel-cells = <1>;
 		status = "disabled";
 	};
@@ -256,6 +257,7 @@ adc1: adc@14c00100 {
 		clocks = <&syscon1 SCU1_CLK_AHB>;
 		resets = <&syscon1 SCU1_RESET_ADC>;
 		interrupts-extended = <&intc1 80>;
+		aspeed,trim-syscon = <&syscon1>;
 		#io-channel-cells = <1>;
 		status = "disabled";
 	};

---
base-commit: 43ffda3c7f8456bbe641ae8249a077a361b97880
change-id: 20261021-ast27xx-adc-dts-syscon-9cf5d733ed0e

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


