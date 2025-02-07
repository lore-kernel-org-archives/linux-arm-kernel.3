Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EE9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C42kTFuQ0a+Iy/q2899HMRKX4dk5Wr5ajbcwGL6zv/4=; b=KUysoQSU0ooMkkxtHnLw79R+SX
	Dq8zuMdITubMrSNUAIgbjZDb3hHJf1nxY2ImmIxmvQjvbCPOwOCZ8RAM+0IPlSGmmk26YMUQgSRFs
	sLwSVyTxGM/30r9BBPgFAPAVwFDe4lHv5nV9u+3LeykG26QRDXcJ7B7ziJKehe0HnwGRmPOtNgcIg
	5mWckuAf7ENdx9SISk1YntS2Jo2O/myWWcSBcyAXih4S9VSfajSOzHbtL6Cbk84PIxy/zen4pbDUq
	o9hXkKD/z4+X656mezkB+6M+jacrWsfc5xBoRIbW5JmBXGQoL9vottGVPgnVeIm6xvfxaqpRBh3H1
	8Cqc7f7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSVh-0000000AZE4-0cwT;
	Fri, 07 Feb 2025 17:51:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSMK-0000000AWzd-2gPs;
	Fri, 07 Feb 2025 17:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738950102;
	bh=gt6tOFngHm78d/hp3pS3kUPBsTjqkKCK6t6jGboTc54=;
	h=From:Date:Subject:To:Cc:From;
	b=bXEOx/MHPCuwaFB3A2Twmd8u6znm+0tGgUhhzmh9uzYGjaXB9gQ3CEvOZMFFka3Hj
	 4cmg+btcIpUG45tv1Ln1rkA7ldl1nJbETO1rHKsmjiBy7XHpxPARsolUk1tw5za+li
	 GnE5wYbtOJc8NU27T+HpYdgQ4mjU+w9/nnVxVKmSDknYJEA/bis8BzT3PpDK0+I03x
	 hcaPaWigjIk5e8C8EA8avIzJHF23wI//md21gk6GLudKV1V0jsmvSoe6UMv6W5xukA
	 eCg80pBZGGZnJa2Ek9Pwr4S32HtdGtICZtttWLEa0S1PYz6Bel66hBJWj8qf/ydsy3
	 x8inU3vDae/yg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 346D717E02AF;
	Fri,  7 Feb 2025 18:41:38 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 07 Feb 2025 14:41:24 -0300
Subject: [PATCH v2] arm64: dts: mediatek: mt8188: Assign apll1 clock as
 parent to avoid hang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250207-mt8188-afe-fix-hang-disabled-apll1-clk-v2-1-a636d844c272@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMNFpmcC/5WNSwqDMBRFtyIZ95W8KE3oqPsoDvKzPhqNJBJax
 L03uoMOz+Vwz8ayT+QzuzcbS75QpjhXEJeG2VHPLw/kKjPBRYeCtzCtCpUCPXgY6AOHA46yNsE
 70EsICDa8wbQWUSphjR5YPVuSr/oZevaVR8prTN+zW/BY/04UBAQurXNS3rhqu4eNIWgTk77aO
 LF+3/cf2tTWM+AAAAA=
X-Change-ID: 20241203-mt8188-afe-fix-hang-disabled-apll1-clk-b3c11782cbaf
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fei Shao <fshao@chromium.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Trevor_Wu_=28=E5=90=B3=E6=96=87=E8=89=AF=29?= <Trevor.Wu@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_094144_824741_C2AE692D 
X-CRM114-Status: GOOD (  12.96  )
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

Certain registers in the AFE IO space require the apll1 clock to be
enabled in order to be read, otherwise the machine hangs (registers like
0x280, 0x410 (AFE_GAIN1_CON0) and 0x830 (AFE_CONN0_5)). During AFE
driver probe, when initializing the regmap for the AFE IO space those
registers are read, resulting in a hang during boot.

This has been observed on the Genio 700 EVK, Genio 510 EVK and
MT8188-Geralt-Ciri Chromebook, all of which are based on the MT8188 SoC.

Assign CLK_TOP_APLL1_D4 as the parent for CLK_TOP_A1SYS_HP, which is
enabled during register read and write, to make sure the apll1 is
enabled during register operations and prevent the MT8188 machines from
hanging during boot.

Cc: stable@vger.kernel.org
Fixes: 4dbec3a59a71 ("arm64: dts: mediatek: mt8188: Add audio support")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Changed patch from explicitly enabling apll1 clock in the driver to
  assigning apll1_d4 as the parent for the a1sys_hp clock in the
  mt8188.dtsi
- Link to v1: https://lore.kernel.org/r/20241203-mt8188-afe-fix-hang-disabled-apll1-clk-v1-1-07cdd7760834@collabora.com
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 5d78f51c6183c15018986df2c76e6fdc1f9f43b4..6352c9bd436550dce66435f23653ebcb43ccf0cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1392,7 +1392,7 @@ afe: audio-controller@10b10000 {
 			compatible = "mediatek,mt8188-afe";
 			reg = <0 0x10b10000 0 0x10000>;
 			assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
-			assigned-clock-parents =  <&clk26m>;
+			assigned-clock-parents = <&topckgen CLK_TOP_APLL1_D4>;
 			clocks = <&clk26m>,
 				 <&apmixedsys CLK_APMIXED_APLL1>,
 				 <&apmixedsys CLK_APMIXED_APLL2>,

---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20241203-mt8188-afe-fix-hang-disabled-apll1-clk-b3c11782cbaf

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


