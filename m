Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB53606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uixlelMT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Gl8z4GzzRnJVNB+iu5QzAHm7NL38k1NY0HbxTBUijyQ=; b=uixlelMTR3xyunhhKnoVjJaOeo
	Mjzv5NAe2i/aFE8FDff41qlKtJk8hm+ArUTfwg/txF0Oisneq4Iawp+LzlkRxXEUdi0M8ZgrKP/fP
	B1rfC+mxe50hqRPltQsBGp4fWQ1Ujo4hT/zLNaNDORob9ZvCIe3R7i4I+dOBhjEww8N6PLG7DmRTV
	MGpsI3gQWOgtzotc+vNb04HoCKiGrTUs/AWHSZf0oHXohwOps7qTPykn1Sk3SLgDfVS9yPHV4gUcx
	MTJx2c7wrC9TsqbeCZ5wp3qw9nOoGqXdKsSda3IJEG9tgWdmOIHODHhoveyNNxbt5APlF8I4QOzb/
	tFO1LwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnID-0000000FrCg-1yt0;
	Mon, 02 Nov 2026 08:21:25 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnIA-0000000FrAB-02Ec;
	Mon, 02 Nov 2026 08:21:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AozlZFA4zgusamXuw2QjNcjHCa5f4/ACL79TGniNEfHwXQfsVIK3pl5RK/023JXj/UosysUYIltwgqXdX9iZg1fwXRjj2QJvy99S7+ND0yRdPS48qcdkXnS91REiBYCDOZm7sOBw7Y5u8RjN76ATkFmerMV3Aw3aGf1DYX2n9btqduWbong/pNnzpYMD/dKN1x6Coo1BdkclIne7eMW/A1D9YZzCiifjN0XIhwe5mEDpkLcX3FRGAkr2w6Whz+gV5fVU3tuS9tTDKzw6EdEWZMkOtjwBLx1Ih6YVmPlpt6LJ4iVGqToyXesk7duMpvPqqmOcO8x5o8xsDWSOB/FAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl8z4GzzRnJVNB+iu5QzAHm7NL38k1NY0HbxTBUijyQ=;
 b=nndjWX0I3QnBEdyvy1zKzKjavSUfsK28gEv2i5zf3gq5eDChYUHvMfH+OD2aQ3yWLdqoTtRGJqOQVIXeqm/LkY69JoIjrLudXxz/r63bUYCyqIdYnntg2wLTBSglDqn2A1iWsv3GFnabzeQ1IGEL757pMOOlz4MzdmyZiGWua+x3pQOgES/PjofJDEbdEs8d8vA33+xMOeN+6rtBQrdGHr/bn51KBF7wu9IsmzbhN1/GlupDxgRx03pR0UUVzrpmj/dPIuqliW9pzKJbAcsEdlvadHP9+h4WI5PwZAozi61JkiARTZjdEslXnb2ko98TltXw4TY1im2CH6Jb8hnwxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR03CA0030.apcprd03.prod.outlook.com (2603:1096:990:74::11)
 by SE1PPFF9F12DF7E.apcprd06.prod.outlook.com (2603:1096:108:1::432) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:21:15 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:990:74:cafe::76) by JH0PR03CA0030.outlook.office365.com
 (2603:1096:990:74::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 08:21:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:21:13 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7B73A4102B47;
	Mon,  2 Nov 2026 16:21:12 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 0/3] phy: cix: add Sky1 USB/DP combo PHY
Date: Mon,  2 Nov 2026 16:21:09 +0800
Message-ID: <20261102082112.2306326-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SE1PPFF9F12DF7E:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd584ff3-0810-4d2f-dd56-08df38ba423a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|6133799003|18002099003|10067099003|56012099006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: u2jYacx2lPpoBa83KwYvflxccMkyf2vTcx16Pr2nYjLiSdcQKUiqNwXzJND7MAhBe7EQVdf74Pd7fF10JtgTb5S6UgXpO0LW0L+Jf9ozUNEiCg3haPDg1AiJnFeV9B2CtW4tHLeKWHwWZu0gMsw+mpqHwoolH1BujCt56paSStVt7jd9ui03Gle2vWIBX8upye7agyZ5CyiCkU+3Y9d8tIid4DwGVTa7Ca+fgKFfL9saIGI4Zvk8k0IvDMIOqpguzi2+PcuBkv9DkR9DWhU4b1vJkXo3MCqGWw9InFyesL1RHeUEXE3eJ3PGTuqk6cQ17tIrpcb3rzDGykfJ8/JFzqcvrUQfT6yKX1jlye4hXKt/DrWIMwjo1BH+5MSBsl/7cUeqX/5KP9Y3CJerYBNh2TvN64uFFLXMs4IA8i7UE1fjdSVckbjLyS9GfqQWx9AD/44rEqgFXSCdjBvPodNnGJtP/Eq0t6eRQljsV2PVDp6HV4Ye9E1O1HBdnSfr5yF6+OyVZQc2pTxf/6/BAt2BrNMpzKIfJVhwx9LyMBowiOxkwz34uPtpDsD+jY5aJERGbx0wn6mgjt57znYV6ZxaTGSceyqofoQI837/Yu2COtLlesKGtFs2xmM8EsJHREhCpF+do69PzHdw/+CEExMR8i5E9mguX/yVySWZ/EESe7ko7b3VwREr9eSp/VPbYRHlbOTqFo5HhlPo01KTQNV5Jg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(10067099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V3sgUcPR3lExce0c2kwZndBtI08ZoLL5ffDafKCO0g1pJ4nx4LEUu86/iZQ3xJckINLqZ5U6gVU+VOam6dfutAwSs+6Pwj+qMWKdC3M7BSwF/FAE0K+JKAsNJ55+YJ8eO4AESTBkJh/4xpsM7l6n4gMUwp7wzPhdvKV6y9YTfzMq2Qy6Nq7sMIbO4ZIGYGYno6nQDG6A/bx1SbP3Tw1aS531ebqlfWxygGF/KUYXzKcw0GQFf1VT6BWmjNbSqxtOkx+EyRlVmzbPUJz9iHhvQfr7wwIiPvPKUYh8uaUzMGPYmVosIQbmY/O1UC+w6/+lInCQx/UpiV3ery1CokXZxLTzNWdBxZkfOnGtks+BwMyFlh4Obbz2mHj1IMUB0BNEdiSTKhCHirPzImphzbFlbEPBgfWqaBzdShxWjS6j9WCKE3y9zfNSXsJSweqysfAh
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:21:13.4292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd584ff3-0810-4d2f-dd56-08df38ba423a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFF9F12DF7E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_002122_050956_9572B0F9 
X-CRM114-Status: GOOD (  10.47  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the USB/DP combo PHY found on the CIX Sky1
SoC. Each PHY instance provides one SuperSpeedPlus USB lane and one
DisplayPort lane of a USB Type-C port, with plug orientation and USB/DP
lane muxing handled through the S5 system controller.

The PHY registers a Type-C switch and mux so that the connector driver
owns orientation and mode decisions, and exposes the USB and DP lanes as
separate child PHYs so that the USB and DP controllers can bind to them
independently.

Patch 1 documents the binding, patch 2 adds the driver, and patch 3 adds
the SoC nodes and enables them on the Radxa Orion O6.

The driver has been built for arm64 with the PHY enabled both built-in
and as a module. dt_binding_check, dtbs_check and checkpatch --strict
pass.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Gary Yang (3):
  dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
  phy: cix: add Sky1 USB/DP combo PHY driver
  arm64: dts: cix: add Sky1 USB/DP combo PHY

 .../bindings/phy/cix,sky1-usbdp-phy.yaml      |  150 ++
 MAINTAINERS                                   |    2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |   28 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   96 ++
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    1 +
 drivers/phy/cix/Kconfig                       |   22 +
 drivers/phy/cix/Makefile                      |    2 +
 drivers/phy/cix/phy-cix-usbdp.c               | 1477 +++++++++++++++++
 drivers/phy/cix/phy-cix-usbdp.h               |  265 +++
 10 files changed, 2044 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

-- 
2.50.1


