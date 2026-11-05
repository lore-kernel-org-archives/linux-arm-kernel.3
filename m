Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA0606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZYzsJgTu;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=Dh0g/oHf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=; b=ZYzsJgTuXj5/za
	DAAjDDUUHGoLaxDdb+LuTKKLJfOkyEw1ZCcMU8/edy0691PYixqINaJd0pPlTlE6LiKA/5b8Ewv12
	cpaot0S4esgJuq+jdkE5948SSuNsHhzGsuoZwl08N3ZW5WMOlI2SpiiHiXZ6+MGd/tQdr+2+cSUhm
	rRHRjT5vd1KYr0iF5gR4YGHkfT4eVSM9ac9yyzqE+NYBEiVedRg0n2+HNwRawcK/tkR8LMhyoL7Ji
	uZq55iOvvpUnm4MyTokxt/xd0FHuBEcA5MYAYjTENexWYuBcztHWjN/2SBaQvl0+CGOTGcjUOIpuJ
	Scsydom48vZbIzFQMjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnQd-00000007bxx-2f2e;
	Thu, 05 Nov 2026 02:42:15 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnQX-00000007bqS-16x2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 02:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePV4fVhjhtoyU+GtMgu/MG9STBGAaFrz8GwNS7oqSwfyO2WEbvIvDZc1bcW1GkHCejOJ0r9zX28ycDUJ/1BrwZLdKSyqUjclZH2abFCRdKIcBOzI10Rak0UvZ1aJ7ruVFw8YOpGLY6RNQHB9nu0N0aT9iPh+lmHwXp7pSBh9U8JN9aKyCc7z8cPwFODw8fR3P6DN4OFAgEI4+xObQHJtMGwQkxFtmPc84/Gpf0H+KA16Yvq/aH7JyAGbolbVS9LDZMaGBIoBk0PO7ZuEvpFZGmXXZy80/rqDuy7i1a0dSh3b0lUq+uEolafwad/uhnOse9vxtEUkri9kGcOZZ4PJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
 b=X0/5W0xkGcHftRQSZAiNvECJV0POsz/24zxzcaBAScz50rl36+9g0uarUZ6Q+2f7G6UsN4c2Y2esDVhtIf6fC1dXeeufkhvrvj1jqoo6ipiw6S+ivSWQZHM1r1IvrQHSLtBXMsvyIO2cKUXQAOVd6KoS3SY1JebN14+Hb3llQbgscUOCCjymDqtBUPkd8cUOIPpSSjlzdTo4N5DZaDPhgr11lm4xOkLtAMwMCSZ9JnK0iev4tUdwMub/RiEt4KVTwJ2oFzHCxJ9luZ7vhl3iDzMcamcVuyO15dmQpl3FDkI8PBUdKOpzU57gdJ4ADojaodJ1t6rQ+ILSDHhdOz/fKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
 b=Dh0g/oHfRc9NK0ZW2ZDrjm+ce0d1ZzWezqCn9NJ8Qoudb78bCQFCFrmMXpUwCTt54jUuXGjSFv3ornpebku6pUEkfKI7w/HnwnWcvsHl9TPHjEbUE2OtZTtTL5aTiAZBAXmnX5FINPh2kifJSBMB0VRUtHpYSbCz0hCT2oR0Uh27yHCWArLicM7HhY/rbvT+zNkFKeC0AXiGFJbSWxrLvggX3CPeUa5zxZaqWT1Y/Ut82EDNXm+BdboWwV5uuROx1xSucVdVdA8BQxvieSJlwfiruH2Au1VItvVbDVGuqYjao2Kv0lImNr1Ibqq2rqnDTmrHgN+v1u3dEjpASY47+g==
Received: from CPAP307CA0002.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::6) by
 VI1PR10MB7636.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Thu, 5 Nov 2026 02:42:05 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:380:3:cafe::95) by CPAP307CA0002.outlook.office365.com
 (2603:10a6:380:3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 02:42:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:42:05 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:42:04 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:42:01 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:22 +0800
Subject: [PATCH v2 8/8] dts: imx: Enable USB OTG mode on BSH SMM-M2 and
 SMM-S2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-add-bsh-smm-m2-v2-8-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Florian Ager <florian.ager@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=jP5A1kOtmjK+1Yg+TFdVnTV0mqPxM5FRhNJ1ZQGu19s=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7mhkWBzkunOLVn92VNSrj/V/F7bFn96U+9C1ky3u
 Qp7mwzcO0pZGMS4GGTFFFlUE7zPSl4NMJ02sxpuDisTyBAGLk4BmAjbE4ZfTD8eFx7ZX/a+cXu+
 yjP1l8obNQ0fnNbTXTK/5+nkwBzXTIZ/1ga+0UxrKhdkr77cZSGl7NjO/6HzeIt5oyhj3EZtqSR
 mAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051D:EE_|VI1PR10MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: d579eecd-55e5-43bd-dd0f-08df3ae660e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|23010399003|6133799003|10067099003|18002099003|261102123227099003|22082099003|56012099006|11063799006|261021121427099003|261022075727099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: gNu0yxmRQVW2+qMxM92hq+g3V7QFqM4Vc3C2hapWZh8IBw95zP5oMdIoSgdtq9OtusNYfJXpcnJzu3Y0KgVNHBk8qZMnqm8hUyROIt8E1fdoZzb+mN7b0xwpG0/aPzGJISkvSoAohbHw3hrKggm8GExr1PcQCZ6WbXHP1v60qHqbQMRtneieqPZS5q8s6IRLEy1SmH6UVajHtrrHlclTg2hqj9LCdvo5GNHPycuFrleCIrVAekLqi+ZpXDRqGPZ3CRTTEhwI2uu1HOFPwzCGNm3CBGY+XubDySnfbF2k4OWNr8N3uTuolez88wkOC5moMHqvgw6pFiBKvOso6Pq6z1WEwk6Yg6Hw548jkTe0Rcc6HLmqez4OdCkU3R+IRL0HjVVla6H7fh0/Oxb82XNrZVr/hBPOQskSf8W/xrEx/ScXvnpNh4qHmB13RzpLoCAPCr/c4PibhshLoLOXq+x0lsfzi0qNPta6kPp7SyhoqMco3uc2rAG1ulVB7ya2isITsUeNo/UnW20y4wqm2+ifI0aV/ubeUf45vC/MeWPDD+o9CiZA429WByFsYHmDIJe8tkcCDqV+Q6XIecKNoueXg9Qlm4YuIsfCOk3NFM7/R0wFBv6zjtYg5a8+6Iy4WfK+U1fPNM+qSVXsAJWnj0ahoUZsMueiP844G28vOGX+CpmagKbblAtszONiAIj+aLxhEiZlq/wNxMuSRysW+4KOsQ==
X-Forefront-Antispam-Report: CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DyeNd+sIWpKpqBLQNC3T68ugAlBYFO1M9udxUNZfn8cPZlqT1qgxneAyDqb/FCfWXm8+xIjZprICVNgmNS1MCCciaBdSMHEM5kIruDBBUG5sLH+t8BjpocRsH1ZefDntCIn8al5FNFYeQYsYXsJ9Ix2SB07JNstHIGOf58jgR2rI2u6WYio8T+Me+OsDvAHkT4yzRt56BeL1CdBFL8xP6NKiVwX0f7Bj3+kksrmg3XiTd5tt6SI1cUa9GfIS48N2T0By0itxTnNZOeXbOcDs2Bxtx2mnW8zzJ8Aw76j7eDlznw3PpUELQqFV6eotUd4x1oR0+TmGyHNurHZCxopjPuSecWteE5Px3+Av/Jb2i9fsEqNT5Cu1bjeVTYkcQoH346IW9lbMGNuj7EpIOtecT2+g5UQli9AzkGOSS+0XLeIHzz9UvBfVTJlcbEWHhpV0
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:42:05.1729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d579eecd-55e5-43bd-dd0f-08df3ae660e6
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_184209_327786_511AAF67 
X-CRM114-Status: GOOD (  11.06  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Ager <florian.ager@bshg.com>

Configure USB OTG1 in OTG mode instead of peripheral-only mode
on the BSH SMM-M2 and SMM-S2 board variants.

Remove the SRP, HNP and ADP disable properties from the SMM-M2
configuration.

Signed-off-by: Florian Ager <florian.ager@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi    | 5 +----
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 27c7b6acc658..96f084b6ade4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -37,10 +37,7 @@ &uart4 {
 };
 
 &usbotg1 {
-	dr_mode = "peripheral";
-	srp-disable;
-	hnp-disable;
-	adp-disable;
+	dr_mode = "otg";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..7a121459f95c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -248,7 +248,7 @@ &uart4 {
 };
 
 &usbotg1 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
 	disable-over-current;
 	status = "okay";
 };

-- 
2.43.0


