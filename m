Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E16D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JlD73cpbpy8JHG582haH9p3EGrSo5IWCUn6YtgDP6po=; b=j23iGj75LCaLhJ
	8/srQn1+Nh03sJtcUW0gUKYa6v/1AJpkWCCFsR0SRMMkDYRcHPK/ZG5MPAl3PWWBdoYrdE+lnGOfc
	9HwFbFIskbW/4oA/+qN/TxQ7kWzdEPjDw4FE/IYyfXcC7bdMQGIcex2/Tlcx4+QGjW/dLv5q8z74+
	b0K7IYx3u+UXYWdb5e1fCaN6NWXNh6Z2wbo9mHZpp5qqyyYW24bdkXX6yYzBOdYJ5Ua3qOjj+/Yah
	jWPBPnAVL49A0r8EJ9JZ93GifpykHQnhmRmScBAKV8E9lL4lSRwlVnscK626sEM691bx4BrjIbckM
	b7/oXdYy8gGx4nsngHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4Ag-00000003HsB-388E;
	Mon, 15 Dec 2025 08:43:10 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4Ad-00000003Hqv-1vAt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:43:09 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BC7972012FE;
	Mon, 15 Dec 2025 09:43:02 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 871F320132D;
	Mon, 15 Dec 2025 09:43:02 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id F1F03180008F;
	Mon, 15 Dec 2025 16:42:59 +0800 (+08)
From: Yanan Yang <yanan.yang@nxp.com>
Subject: [PATCH v2 0/2] Add NXP FRDM-IMX91S board support
Date: Mon, 15 Dec 2025 17:42:50 +0900
Message-Id: <20251215-imx91s-frdm-v2-0-87996bdaa59c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArKP2kC/23MQQrDIBCF4auEWdeiExKwq96jZJGO2sxCDVrEE
 rx7bdZd/g/ed0C2iW2G23BAsoUzx9ADLwPQtoaXFWx6A0qcFMpJsK9aZeGS8QJpHPWTCN3soD/
 2ZB3XU3ssvTfO75g+J17Ub/3vFCWkWJ2ZyUhFqPU91P1K0cPSWvsC7ckxzaQAAAA=
X-Change-ID: 20251205-imx91s-frdm-2c339bcc2f6f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765788179; l=2014;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=mketRncj2KQeC3VuMO0HkOYDltG23NCEJAwVhKVzzxM=;
 b=PRFkL38hvgE4JL0QTklhiBKwVTFNGaqNKewql5rj75G0o7LurE5ZCTI+MudoXi928f9KbRLFt
 UQIm6LFqrqXACwNXJxJuLjCcBByciv3KEBdyqCbBSE7TAE1yaBMZwg7
X-Developer-Key: i=yanan.yang@nxp.com; a=ed25519;
 pk=d4hHTp5SW/PyyxexLEo/3c2RAaQDwym0zuYlifH95PI=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_004307_889070_CAAF33F2 
X-CRM114-Status: UNSURE (   9.87  )
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
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 677 +++++++++++++++++++++
 3 files changed, 679 insertions(+)
---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20251205-imx91s-frdm-2c339bcc2f6f

Best regards,
-- 
Yanan Yang <yanan.yang@nxp.com>


