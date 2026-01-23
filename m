Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE37DD6CFDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fBcCQm9NyZ0vqrWTWSks2RCjzRprPiaBDpkQYmaQu7M=; b=OlAsNVAGTxU3z3
	dS8H4Oshu1dLLmGlLhlDDOd2PyY5zmS+RcH/bnulj6v5L1JdSPB2BMJjhD/hmVXHcZKqUNYJPJ+77
	Wl6BkqRTUE4XTc1W6VeZQzJTTBLzm03pbgPSM3qhu0pRTSHVrkjK6hyKF8TTJthu/GVzuTb2frwzg
	DcBZ87YOdbygQBxfxWoLVzFj3KXuZjhw0t8xU7M0UJak23B7WcsNXegVisxwLsE2G8Fn0aKMeX1i7
	zsZddj0Yl8YN5Tb8/9xIU1VNa5P81NnJggucxlBv5wYiatCl1nuDmWUiM7ZDCOP30BHFCwWxBW3au
	aOGulEoM1/QuEqP5AbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAt4-00000008JEC-42DI;
	Fri, 23 Jan 2026 06:43:18 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAt2-00000008JD0-0O4A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:43:17 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3DA5C201A6A;
	Fri, 23 Jan 2026 07:43:12 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 06633201A58;
	Fri, 23 Jan 2026 07:43:12 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 33F661800098;
	Fri, 23 Jan 2026 14:43:09 +0800 (+08)
From: Yanan Yang <yanan.yang@nxp.com>
Subject: [PATCH v4 0/2] Add NXP FRDM-IMX91S board support
Date: Fri, 23 Jan 2026 15:41:58 +0900
Message-Id: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYYc2kC/23MSw6CMBSF4a2Qjq3pvUDxOnIfxgH0IR3wSGsaD
 GHvFhKjGIfnJN8/s2C8M4Gds5l5E11wQ59GcciYauv+brjTaTMUWAKKkrtuIgjcet1xVHlOjVJ
 opWVJjN5YN2216y3t1oXH4J9bPML6/u9E4ILXVkulBSgkuvTTeFRDx9ZKxC8JPxKTPFVEstF1X
 ZLay/wtpQCQe5knSSdZgTayICw/clmWFynZPG8YAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
 Xiaofeng Wei <xiaofeng.wei@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769150588; l=2468;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=67q89WD0bKZAOBMLjge5JhBMek2CR8lI575BsdEeo1g=;
 b=m6aU0YC/6tLLPp25SYwaax61igDTFxTO3DMgGOxCJLOEyn5QiPmAZHze+aMwnK7N7l8rPQDIH
 xll//jyCjQCCuORqPqQedqRcpMmmXDibk0bq0D9/gSmpf1sShl4AB0k
X-Developer-Key: i=yanan.yang@nxp.com; a=ed25519;
 pk=d4hHTp5SW/PyyxexLEo/3c2RAaQDwym0zuYlifH95PI=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_224316_407646_FFBC9534 
X-CRM114-Status: GOOD (  10.77  )
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

This patch set introduces DeviceTree support for the NXP FRDM-IMX91S
development board based on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized
variant of FRDM-IMX91 and differs in several hardware aspects:

- 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
- 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
- Single GbE port (FRDM-IMX91 has dual GbE)
- PMIC PF9453 (FRDM-IMX91 uses PCA9451A)

This patch has been tested on FRDM-IMX91S board and verified for basic
functionality.

For more details about the FRDM-IMX91S board, see:
https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S

Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
---
Changes in v4:
- Remove the board-specific "fsl,imx6sx-sdb-mqs" compatible from the sound-mqs node
- Remove redundant address and size cells from lpi2c2 node
- Link to v3: https://lore.kernel.org/r/20260116-imx91s-frdm-v3-0-98671de64925@nxp.com

Changes in v3:
- add bootph- property for nodes should be kept in bootloader phase
- add code-review trailers
- Link to v2: https://lore.kernel.org/r/20251215-imx91s-frdm-v2-0-87996bdaa59c@nxp.com

Changes in v2:
- Correct author name: removed extra period in "Yanan.Yang"
- Removed aliases pointing to disabled nodes from DTS
- Add "rtc0 = &pcf2131;" in aliases to make external RTC the primary device
- Fix DT node name: change
  "usdhc1_pwrseq: usdhc1_pwrseq" to "usdhc1_pwrseq: usdhc1-pwrseq"
- Renamed LED node from 'status' to 'led-0' to comply with gpio-leds binding
- Replace regulator-based transceiver (reg_can_stby) with CAN PHY (nxp,tja1051)
- Replaced 'xceiver-supply' property with 'phys' in flexcan1 node
- Adjusted alignment in fsl,pins property: used spaces between pin names and values for proper DTS style.
- Refined commit message in dt binding patch to clarify board differences
- Link to v1: https://lore.kernel.org/r/20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com

---
Yanan Yang (2):
      dt-bindings: arm: fsl: Add FRDM-IMX91S board
      arm64: dts: freescale: add NXP FRDM-IMX91S board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 769 +++++++++++++++++++++
 3 files changed, 771 insertions(+)
---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20251205-imx91s-frdm-2c339bcc2f6f

Best regards,
-- 
Yanan Yang <yanan.yang@nxp.com>


