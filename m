Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D08E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 04:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1xXxExth;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IpvrMtRm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9+DRNTb+Iccr7cg3IFlbMKMsq0jQF/LIYCAo0v5lp2M=; b=1xXxExthZBD2aII4W7imm4m7mE
	2RJQ4zGyaTSjTHRxA7n2K+7obeuY95vHI/wIl5YC8N8Ln6L3ZABv7yUFbo/PHdoOJYaTq2Nvf6jHk
	iCCGeEwRamqbRJHgEH37n88+jye1FS2s8hqUEGMdEH4jxPJGcZ0vYUHOSpV7Ek6Nr5yY5NwrpJiWJ
	V/kibNBikawrvGF83/4uParLMHMCFKmAvMfigmpQSzCbkHEHOFttJzrVP05G+5AfdKaJkGMgUpEE/
	wLTHACmuGEv1+lMJ4jIKZcYOdVebJf1u+oIFYM82xKYfQRUPKAF3mWZNCo9iwEaNIDz2yf1v4qR5k
	ZqqixFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIEB-00000008M26-3hDK;
	Thu, 29 Oct 2026 04:59:04 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIE7-00000008Lzr-1H8I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 04:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQeYs+NpXDlI0V7Q/wh2KHShlw+JsNceIQlc7Nfmx5zwPCGOs/RpKFr3/PRfyrtEWWFFg0ZpE0EOKqdYNyjgR9OKy1WdPTsLuQJFC4vr+hzFkeE8IGwQRLLZsDa/P2DwsrLQlijRc9lu0RqOQr4aTVJ69o1APu0WH6FZFNe+bcJlQ5TcZPqSST4pnxwuwb0i2q18eJPCSwhcrd2QhLXmjlqgd/2PgiAXZx1xGfozG0TdAA1FhA6c/Zok47/Zw2pvs78dSfUcE7jj58Sb8kBuTGFnveIyzZeZ5CZOB5cfNaZgZEzK4KaBGzDAzJ/kmtCv9bLjnJTsooKBpBG4LXeF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+DRNTb+Iccr7cg3IFlbMKMsq0jQF/LIYCAo0v5lp2M=;
 b=QWpo+PyfcryS42nLC0Dd8HieUO7wtbASu2zs5sak5V/dqHeasdu28MQirct5cdAkDxzcCn8IM2o21oRBA59yy/CNMJhTaVQurjWO7rcKzpkCgsvWbbuwiaJQx3RkkWaVviQr1ICNUKZQ1KbZbgKV//BTW2LC0ZZHETqhO5Ia4Bbf2YXxA5ycUMU3WkpTTvJC/RAg569IXMNMGrwAYrCnElesckZV20RhYow25o/FGuqDee2T/uZZhOwApEzF6Mv5Nk6ol2X5UHvjEexcLG0fgel3cyix+RfWTlBUhpL/NlnCcUJQJ1VOZzl6XnPOFmm3Ay/mANIbgWK3wuKnxs6mOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+DRNTb+Iccr7cg3IFlbMKMsq0jQF/LIYCAo0v5lp2M=;
 b=IpvrMtRmqHmVFaGTQE4vXZDBWEwcbpOP5lXCzC/9dtX8pEmjXDWMWR75g0qu/WtwNHGpmZjlWMACrb5ITwjl+2Ggv7CYx5BK13RFgnhZVWvBv2ONCU5dWl6AvrP8ysZMn6T1I2bY6MfocRI9sVQQ3pfNugnlbBqACdGwAjTDg4dbKxxyf4DYoJwoP6I9ka6PxrOZfXCIIZAFRyG9SDghLQvPKl/er4ncmu72j7BaxLKKZVs/yoGTCyNR1+WZcSndiIQVw9kjGvIakCO5ZdrN5RR+JO/rDoNBaEGTObNOz21f5Mr+gsCOJ5Vw4q0Y+K48uGu68n+q0Y+6MbE50M1uSw==
Received: from BL1PR13CA0202.namprd13.prod.outlook.com (2603:10b6:208:2be::27)
 by SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 04:58:52 +0000
Received: from BN7PEPF0000009D.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::71) by BL1PR13CA0202.outlook.office365.com
 (2603:10b6:208:2be::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 29
 Oct 2026 04:58:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN7PEPF0000009D.mail.protection.outlook.com (10.167.248.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 04:58:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 21:58:34 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 21:58:31 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC support
Date: Thu, 29 Oct 2026 13:58:06 +0900
Message-ID: <cover.1793243187.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009D:EE_|SA3PR12MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c1ae17-5950-40ce-196a-08df3579533b
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|23010399003|18002099003|13003099007|56012099006|11063799006|261009223027099003|261021121427099003|260925021911599003|10067099003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: aXzzfh71ooPWCyXn8KO/0mjMrTRNuLvu9ItAiauyNG1TS2gkJH2OEp4EWc52k3HHnL1g5bOWWr7HhuJvXFUz3PAdQ3cGzLyYQSBDHIO3lNWI5C4Qy6qTy+lXJSxUPjmdHPSf906QUb0yEoRkx3AM8eedwTETKLBRvBk48kfQJjnus8bD8gGStySkdAHgClbxKuu/jMKF3U4qcWqjX5OOQ4CXuAusqn0j4d0UfGmoxZGbPfrEfoVEiI86ibkJXjzKJant+IN7xVNwlbmH3Tm6YUrxJXKREAaEXoINMOUHDhmO6ZWcVPtxFaZ8lMDiY5JklK8TFMvDhgiL0/FLZ9O/xL5Hh5euVx2eHkJXHLQd3iGbBPry+ZIdAwIe6jFuXlY9X1NMXWTF7YhfuTU2L0IsBLsF4i77/L7OdtmyvL5i4HjgydZJ28Fe2TXj5sOqG8F+GNaEKAHrdHik+uR8Uykgmd5inydJt3roQhYpLTHFvkVR1ktyV/1r7P2wijoBxx++aSl5dlA4CzkSz5cKGO6/oZIPEZoLX+rvNcxtqTSmIQ1v4W3Slm9CviEM8PN6s+JItEKKyvr158ZzP7fqtYJf7RmSIYf8X44RTpIvQRYsU/U7iucFVps22Q6y1haqPVnI9obB2fs3K0Df1pCcAw3rO2djdaGFlu27HGAVLqmyT5PHW4H+yRGrAQupEkfD8EplyJ2NnFx3TRAoXStYPxaZkw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(23010399003)(18002099003)(13003099007)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(260925021911599003)(10067099003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ksumgdySMnsHEMPobE2N9dOuASVKtlY814anmJefI0x/uJYBPlMfeDk81ihvMC8yiy5U1uH0TPd3ceg3GuhXKUqCor9wW7Qcrqe5TkQ4Zy6rXWJcuSNateXOsv0bIjnTCUTmd64Ppt5TxRJ/ZBdb6vfXJzGT+TVg4c8jhQmnTLXaJCnBMHQv/khHPY6H7g3ZBjh/Knhz770LQ3H2y3w5M30PAHvVryWi/Ji8ZgZ47rugkGMkHYUtzrmHHCbldDRXOh3Uo3gtxect9nxp/kReK5Y9F7Kkhh54D2V0gvOpmRwLan5cZJ2csUlyB1SrJzk33wXgmX5y2nRe+e5O1ENqb4yp1hOG2nWhI0xkB9iRDQ0p/VgPyk7mnXy2e9z01xbzmp2BsCDzSVOVOD+oq6bMq35LbKzKIAUJ4Bs13/BokSvmsuk5j/7vH6tEAlP2gD0l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 04:58:51.1759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c1ae17-5950-40ce-196a-08df3579533b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF0000009D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_215859_359659_DBBF5008 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the NVIDIA MGX Vera C2 BMC,
which is based on the ASPEED AST2600.

The board declares its boot-flash properties explicitly, allowing the
same DTS to work with aspeed-g6.dtsi both before and after the pending
flash-node cleanup [1].

The board DTS passes scripts/dtc/dt-check-style --mode=strict.

[1] https://lore.kernel.org/all/cover.1793179064.git.jackyhuang@nvidia.com/

Jacky Huang (2):
  dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
  ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts    | 1321 +++++++++++++++++
 3 files changed, 1323 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts


base-commit: ba3f2c447203166c640e40dc8e9b4b91fc613aa5
-- 
2.43.0


