Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0055C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=; b=zVc5zTeqVaATXw24selkajD2f9
	Jh7xwqF9vpym5ga+vs5yCPmbnUebr4S0kRlF2dhIkdLSdililIUHxClIkxGfjfEywE3qaxVBtStNe
	vbOE5e6/LgysgcwtAcc+VjS/NpH1xzelbVIaH5havr6wnRoNIp7qm2qLnm5hU1WlleXXc28Fwcb9k
	riGXFikkrvmwce6AhcUpsKASesHM5dEi/bpzi/GYwuMgSNiZ+KINHU5s8mNBwGf7teyF/Yd1ns5xa
	DDxcE03nZUxjU/Xg49/8l3ijDjF8TO2mf3WyYJ3NANZ9JfaN5qvEO6hxiPOt4NpSTHHC5N5tmvonW
	eAy7fZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMgb-00000009y1s-0cm7;
	Thu, 17 Jul 2025 11:22:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLIA-00000009mlN-2Cba
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Jul 2025 09:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=; b=af19590p934GS6sZ82TkFKWxc2
	Bw4e0nGpSnky35WksmokEhAFCT0sdWEhQXTchHPTP/lRinxz2d8Tw3gpcB0CoJvU5YI+vBlHsGTY6
	6H9hQrA+VbFvFPs32wwxWc5PSe6L0TGH/e6YiliyZISO1ByavxI2vUmHR2YTWyOXIvnb3VjybsCgO
	aMh1tQ8I7UOl/oCyfqOdVOZ2FFfuzoqKNOCvW3HSVwmUruC0nr11S3ayGpt+JkHglUMqZt2GrrFMZ
	c3Tv3Sz+9p9DJPq5aRsVMD8PSfT2YCpx0UCYDkVsEFiy715ZiqMXbz6iLM/mi9Pveu4ePw1nqwa8x
	g/aKBbnA==;
Received: from mail-dm6nam11on2061d.outbound.protection.outlook.com ([2a01:111:f403:2415::61d] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLI7-0000000AEqU-1ZdK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 09:52:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGXEgSdRtrwIbQdx42pqMzWIA5TzNpDC/VcvADlq6AzJWkUGeXa4uyBRv1FWhwhKF3LUne5k0CM7kfFgjgXBdfQPXuraoy3LKd07f2WhfGOpMBHRQWISib4fq1VpRS2CaQ4BP37E4JA/9MgFP0rRBXZI9vGOXQ4oujZoaB24ADNv+fSKcPLLniOIFKpjnGOUnF1Cpvkht5bW6UwrV0EHUCK6Jv3j6CWJvq0UHvR2tdtl59aINTObFT5FbigByWPMpcFpK/kh0UjL372xbvzfTf3JdiLHlaVmjPlrdi3uJ0L9kIb3/0cPkEAr97dyzonWRf2/ZEWA/7Kgy1JRajNnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=;
 b=ZuU5g/Qlwv9sdMYZVfUh6eO/zyvKFH82HNV3Z+89qOzfwyCcCvUWohu2bvRjmRsY0fwpXOh+tigQZkyGWYlkrU0weqZ0y5mr9uZ6jgoSESttO2asEGioDyABFe6XjMAGralY1lB4tGXlNVkg3aKV18USLC/4k/2KV5H/z+jtSOtJ7qQiM2VrS9q5BCuVoLP5yHum08Tv1Ih0Dci3aHRG7gHq6UPrpJDvfy+Te/V6BiNFh2W1fU9nFU9ndhj26qIUq/4juE25ug7hq0tvB4pumNukgpXh1JrT8vN3Dt739LceAVEeuQWWcyH2EXfV1yQy3M/n1xvTZTDmymMUmTWyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5+xgvktZP1gnfMj7MRWLXEkFOIow0kXg8Y+3Vgk7xc=;
 b=FfodNsZ6AyYgOdJlwdnf/SKkGZpMLgW6MKBOnJH/Kq5CjeFldmqkb3ktdPrkKWUM1AEgqNjSf4M0Y8zB2pByC133zVxle89LjdjB1aI8JKtJ57xDH8VwlTOAhew1t/SP8YYfiYBugCOXcr+Ab4w0ArM/rmyOyShz82Ti90RuvrXdNLea7gk0FvGqvlvk5ROrNqXu+lu5UMTJPcdCIQpgaTCSmi5VU67QK2/IFrCEItoSK8fpPkwXJUAmeglGMTCQ8iZXbM12PvBJRPTndMMn6JLGvLQ6HYGSOCKXRtGwneZrdXRoisskr+/M6UZv9yVKvaqJ6wn2M+5io49b0UYb7w==
Received: from BN9PR03CA0167.namprd03.prod.outlook.com (2603:10b6:408:f4::22)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 09:52:31 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::b) by BN9PR03CA0167.outlook.office365.com
 (2603:10b6:408:f4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 09:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 09:52:30 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 02:52:14 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 17 Jul
 2025 02:52:14 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 02:52:13 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Thu, 17 Jul 2025 09:52:10 +0000
Subject: [PATCH v3 1/4] ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250717-update-gb200nvl-dts-for-new-hardware-v3-1-f28145c55c98@nvidia.com>
References: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
In-Reply-To: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, <openbmc@lists.ozlabs.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Deepak
 Kodihalli" <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, Leo Huang
	<leohu@nvidia.com>, Willie Thai <wthai@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745932; l=4653;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=4YKBGVin4fIcApqjT83lHdFPoOly2P5FAdZ6KRKPWyE=;
 b=HIIne3xyTnqaie1dOQR/btr+pLZsIzrN9jFMkM6NYqRtdCrXFplva8mt3ha08MX3RjZXGbXLE
 Hmt3T7ls4AwCVOnmA8NksIziHVAGB/SdVugISjbWVPTMvZbMhbLda7C
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 997bd9d7-9080-455f-2e75-08ddc517a582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wi9ZY0JORms5TUh2TnA5dlZGOFh6QWNjbTJkbndIVzFBSXRwaEZwYW9XUmsy?=
 =?utf-8?B?ZGU4UFFmb2hkc2h3dWIzTVovaXoweWZmdlNUMnRiSnl2RnNrOUI3R1pyQ3dw?=
 =?utf-8?B?OG9tMFRvakszNjJxK1pXZ1NYTXA3ODJUeXBPNXFZaFIyNE8rem1rQmhLa3Bk?=
 =?utf-8?B?ZTg4ODF6U3pRS1E5UE5WeGVHZzZzaUJVWDZlS3p6NTRBTlliQTlmNmlGRWls?=
 =?utf-8?B?dFdvMDNEeklubWlDc1IrZE5CTDlyUFMyU0hKZ1M1Q3pPZU5xR3E1cXlBc0dy?=
 =?utf-8?B?OGRKYjVFbGQvWTZ6c1ZyUEpLS2xnMzJkU3R3dUZQby8wcTd2TEdvM2NMTVE1?=
 =?utf-8?B?WHp4VkJ5TXdMVUJ1MGhUc3BWYTluN05RNEJjQURvck1EYVY0VmdlenNaU1BT?=
 =?utf-8?B?bkNaVCs4VVFVNS9PcUFMQm1xTjJ6Q1ZkZGFDMjVEZlIwY1lPVEFYTHVjSE95?=
 =?utf-8?B?OVh5TU5kWjNJb0J6bWhHUmd3aVk1a3NraFlmL3pCcERYVkxTdXVpcW5tLzBJ?=
 =?utf-8?B?WGN0Yy8vYldkTHdFZitsdEx1MjhUOTIwaTluNlFhM0ZGQ0FhZ1UyMmRnTk5I?=
 =?utf-8?B?QTdkSVJ4S0tSbW9nSi9xejA0dkdYeHBwZ2d0d3dwa3pFc1FuK3hZNmhwc2NP?=
 =?utf-8?B?M0ZLT1V0ckQzaUZwdzFhQ3piY2RJUnQ3d0d4SFpSY1lZTyt3Z3dRYm5mUHdj?=
 =?utf-8?B?WUVrTGVpdStPMW5uR3hJZnJUdlRvMk5zOC80RGQ2QzQ2NVpGSzNYaHJGZi9r?=
 =?utf-8?B?bXMrTHo1Vklmdm42WXRpMm1vS0ZyRlRzZ0x3aHdoMUkxREJmRU03OXhVRDlX?=
 =?utf-8?B?d0Z1WDBNK283M0t5NWxFQWpiSWNXb3lXSWhxdUtuWmR4ekF2eUVwTWdjalZG?=
 =?utf-8?B?QW1IaSt5Nk02b0hsVFpKNThid2VOTms1ZDcvOXdvMUgwMEVLN0p2QkVOMnI3?=
 =?utf-8?B?VllMSGVJSXhqNlVjWjBGYXRJcnRMNFI1c2RoS3dTSmwySm9CRElZY1dhZkMv?=
 =?utf-8?B?TTJqL0l5SEhUVFZTYW8vaDd2MUNPa2o3OHdYNUdjWnJSd0ZiMTlQaVhlazBm?=
 =?utf-8?B?eGZKZTJ3MG5nZ09LdkJmeXRJMTZBUUFiT0pXbzdmRjcrMHRIeGY5UVg2K2VX?=
 =?utf-8?B?cDc1R2hhemxYQzI5U0tRMXp1amxuUHBzN2dZOGZBRkRETGFSaHVvaFdVbzUy?=
 =?utf-8?B?dlduS1FkNXNXSmhoWTBkN25CTjk4UG9UemE5bE1kd24zTXlsMjNOZHFFMDN3?=
 =?utf-8?B?U0Q2TC9ISUNRN2FEL2JOeE5FME9pbC9udnZsNS9GMWdlMFdWREpEdDhKT3Zr?=
 =?utf-8?B?S0kzOWRtemdLTW12UXFaNnRhbFVvaE9UaXNyMVcwSGVDVE43OXlaQllWN3BD?=
 =?utf-8?B?cE4zVHFjZ1BMVDhFajRrVkhkTng4SkJmOEhOL1NMQUc0OS9yb2xsOWdVK2hR?=
 =?utf-8?B?NmVJa2ViOUM5a0VWWEZCMFFzVzNPNm9obTZmZ0N0UzlEdTlsNlFmTnp3cmlv?=
 =?utf-8?B?eGo1aTk0MkdnVGUyRmdtYnRsZnBCU0Q0TjZUVnUwOElKWXRvdWIyVUsxVTFL?=
 =?utf-8?B?M3Jzd05IQWxDRFdmakZxYktkV2tJWWNSQTNNakNpb3N1Z0E2V0dpSTZQTUd6?=
 =?utf-8?B?SVNXZk5ZQ3NKZjk5NjV3QVpuR1lSYXZjYVc0SnEvR21JSjNLd0pWOW1tUHM2?=
 =?utf-8?B?OXo4cEo3VlU1OXZLVFBTSHdiYUgweDRtaFRvYzNtZkRBYkV1ck9SbHBjZGh6?=
 =?utf-8?B?clFKbjA5cTRaMmJRTHRQb00vWXZ2RUJXVlQyWGZTZUV4Ryswd3B2bm9CUEtJ?=
 =?utf-8?B?dVZJaTBRd09Uc3dRaDNiSkQvYnVSRk5uUTNJS2k1eHFtMHlYQnM0YlNXRjY4?=
 =?utf-8?B?Q0xEWjhzQ1NvdWpnTThKOUtza1U0MGVZUXpTNXFvQ21TbE5DcGdtU2twaUhh?=
 =?utf-8?B?NFlyTTh1dm5ReUtlVFk5TkwxUmNXMVpsRnhBNS9uZG9KWXd0cThmYVlHNVlt?=
 =?utf-8?B?UmEzbWt6S0ErbldnUXhPeis2WTZja0cwR0k5Ly9meGMzNVNHNk5KOTAxUjI1?=
 =?utf-8?Q?CCOTQW?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:52:30.6240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 997bd9d7-9080-455f-2e75-08ddc517a582
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_105239_658724_9C8650E9 
X-CRM114-Status: UNSURE (   9.82  )
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

Add Vcc supply to avoid probing the devices before they have power.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes v1 -> v2:
   - Fix unevaluated vcc-supply properties [Rob Herring]
---
---
 .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index 41e3e9dd85f571254a08d40e68c0d8f8f049256b..bd9395a194137ea70d184665ad6cb659541ef175 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -126,6 +126,17 @@ button-uid {
 			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	standby_power_regulator: standby-power-regulator {
+		status = "okay";
+		compatible = "regulator-fixed";
+		regulator-name = "standby_power";
+		gpio = <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 // Enable Primary flash on FMC for bring up activity
@@ -431,6 +442,7 @@ exp4: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"RTC_MUX_SEL-O",
 			"PCI_MUX_SEL-O",
@@ -464,6 +476,7 @@ i2c-mux@71 {
 		#size-cells = <0>;
 		reg = <0x71>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux16: i2c@0 {
 			#address-cells = <1>;
@@ -528,6 +541,7 @@ i2c-mux@72 {
 		#size-cells = <0>;
 		reg = <0x72>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux20: i2c@0 {
 			#address-cells = <1>;
@@ -545,6 +559,7 @@ gpio@21 {
 				reg = <0x21>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				vcc-supply = <&standby_power_regulator>;
 				gpio-line-names =
 					"RST_CX_0_L-O",
 					"RST_CX_1_L-O",
@@ -584,6 +599,7 @@ i2c-mux@73 {
 		#size-cells = <0>;
 		reg = <0x73>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux24: i2c@0 {
 			#address-cells = <1>;
@@ -602,6 +618,7 @@ i2c-mux@70 {
 				#size-cells = <0>;
 				reg = <0x70>;
 				i2c-mux-idle-disconnect;
+				vdd-supply = <&standby_power_regulator>;
 
 				i2c25mux0: i2c@0 {
 					#address-cells = <1>;
@@ -648,6 +665,7 @@ i2c-mux@75 {
 		#size-cells = <0>;
 		reg = <0x75>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux28: i2c@0 {
 			#address-cells = <1>;
@@ -712,6 +730,7 @@ i2c-mux@76 {
 		#size-cells = <0>;
 		reg = <0x76>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux32: i2c@0 {
 			#address-cells = <1>;
@@ -729,6 +748,7 @@ gpio@21 {
 				reg = <0x21>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				vcc-supply = <&standby_power_regulator>;
 				gpio-line-names =
 					"SEC_RST_CX_0_L-O",
 					"SEC_RST_CX_1_L-O",
@@ -768,6 +788,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		imux36: i2c@0 {
 			#address-cells = <1>;
@@ -862,6 +883,7 @@ exp0: gpio@20 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"FPGA_THERM_OVERT_L-I",
 			"FPGA_READY_BMC-I",
@@ -891,6 +913,7 @@ exp1: gpio@21 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"SEC_FPGA_THERM_OVERT_L-I",
 			"SEC_FPGA_READY_BMC-I",
@@ -949,6 +972,7 @@ exp3: gpio@74 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&standby_power_regulator>;
 		gpio-line-names =
 			"IOB_PRSNT_L",
 			"IOB_DP_HPD",
@@ -1014,6 +1038,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		e1si2c0: i2c@0 {
 			#address-cells = <1>;
@@ -1054,6 +1079,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
+		vdd-supply = <&standby_power_regulator>;
 
 		e1si2c4: i2c@0 {
 			#address-cells = <1>;

-- 
2.25.1


