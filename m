Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C0DD46952
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXpQrsNloZxebq0NagS0nA4YBUsacSc+NnLoFEWj3Fk=; b=HS6rn3Gd7HYl1N72mE8bGGDt2r
	R+5bf+hTqqF0Yxd50QR7wL96nUiOBqlSoD751sPz+3TSGKj99EvElsANiK04D/OCq/3USZMtqP5f2
	B9gtYpFP8FSn++al6TFGqkMVgikKNIgzyYQvdBqfj+hvE5A6jznVcORSPhraJKfscSRKTh/dEKOnd
	qC67NirjKxP2APfTEldqSgpEjwi6N7YGfKKTe084kpwmsKD3jslOnagQyShpkjbuD3az8f3rlKnWX
	O7KqCxnn6qOVTqfWSaVyFRs6oHz9Fhv8Vv/Vu1+RlXP5PVEQQyofS7igW+vTigw8r3qlFLXaeaMGb
	X5npeglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye4-00000007a1e-376k;
	Thu, 22 Jan 2026 17:39:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye3-00000007a0h-2YwI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 17:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JXpQrsNloZxebq0NagS0nA4YBUsacSc+NnLoFEWj3Fk=; b=gyOh2z4csYeUE7Hbqervmznt3m
	I18/MFUlwWO8w2T5OA3SBBf8EBaS2Py/Y2frgX9b7znvGCBZd7hstBcs1fCQOgU1B0XwXcZT7aNlH
	yY0HdPVK1FUoM+zyByJhMcrdEThd9ioAICGKpClatWsOc0BGDfDbV/MiHIwKPk9B0VwK5klxgsdMB
	g6KyxKRHJSDXjb/hCo4CQiPA+eo1N35HIPu6bP3gjJu9lxu9p/NVsHVqrWHpnRny0wPw5mDhdH986
	RZPKdm1u5WB0eaDQhLftQiOMeaY0L8kDYXAHvakjR1sEWiUHhbCAssHuiO7Ay58yUxPjYaxtc31YJ
	fIonLZUQ==;
Received: from mail-westus2azon11012056.outbound.protection.outlook.com ([52.101.48.56] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye0-00000000wZE-21tY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4jTjmqbd/gp2yhbhS4ohkmv7wKjO84kVVRW6Cve/qo9P2bxTQ5luRWmnq6HIn50tcJJj0m1gd/BIzZKMY0h3F44VgAOZi6EdkxLAKMT90MnqUwaG4Uk+hHRmf8m/8bssdixJmFMR3Vn08jYcnkBIbQr1w8HO+JMuOKM2RwH5dRXFyhWEmsqJzkwTvKNA8YdBYiXQEeOrNWRjjEOkoZOBUPTeQ50PfPZtWxbHwt0ODK8owyZ4Vdfkb5nnjo71dZcvNqJFM6BXm7H7NIr+naWGEdPJfvxny7MhzU9mJcPCKpL2bZk5DuLqPanSh458xsb2qpxzFm2YD7k70JwToBsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXpQrsNloZxebq0NagS0nA4YBUsacSc+NnLoFEWj3Fk=;
 b=vwjowVXtv4kven+CGeZ21zbt0IZcku6xQl+cgppC8gw+n4BVBTjD0Q/5zlQkzz9Lh80w/qWi1p4f/g7DRAnLBD2bxtxtfCgJ31ZStyVdAanuyl/48rEEvB5qEzZdSHCMEBuglsK3mLDt7EAdmdU/PLY8b4P6dj0yi2kCXRv0/f2KXyjJ6dLvGctHNk8fZHrYTBUxPw4W2FlTOX1Y8V8p7KrZa6/UOMBJk5JbNydUE8pbu5xvGsKU/CdGySxOSjPnUit1aXfXAXk4bD13EYT6tJvzMAfPlzJhFC+1opKGTlDrKjXEqeAhIhpAWaaZAJ8os99dt3xGum8Ov2zv3TpvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXpQrsNloZxebq0NagS0nA4YBUsacSc+NnLoFEWj3Fk=;
 b=a9Fwyj12uAHoNO0HKbwepnr7py29rRRkU6x6cyGb11jh6u5SwGNo7rP+yGLgXLETNMrT1QcBVf46ceM7K3VdJpPjXPztuzXB327VKSwvVwSf/NRsnBTbVbLUGE+bSduS6dAgerTCXFMhwqLCKDppX4OOr8dYTSX1w4J1QBETLMM=
Received: from MN2PR20CA0059.namprd20.prod.outlook.com (2603:10b6:208:235::28)
 by PH8PR10MB6622.namprd10.prod.outlook.com (2603:10b6:510:222::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:38:47 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::e4) by MN2PR20CA0059.outlook.office365.com
 (2603:10b6:208:235::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:38:46 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:38:45 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:38:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 11:38:44 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MHciJE934604;
	Thu, 22 Jan 2026 11:38:44 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 22 Jan 2026 11:38:31 -0600
Subject: [PATCH v4 1/4] arm64: dts: ti: k3-am62x-sk-common: Enable Main
 UART wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-b4-uart-daisy-chain-dts-v4-1-cfdabdf5e6c1@ti.com>
References: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
In-Reply-To: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<d-gole@ti.com>, <msp@baylibre.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <khilman@baylibre.com>,
	<a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769103524; l=1888;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=ExQ/8b/2G3828fPuyDBNbPC2koxlWGsuuzfZq36r/tY=;
 b=E3kxdd3a1KSq+H5wj2OT6lYDBhl0Q79HPUuktBOS+vLX2Bzl8HWJnAKEXoc9NO4cOxinCzuaO
 qwB/HzE9LyDC1WZDKmcGvZCA7qd6paTFf9lc7DeuiHu3ZDXSeLDic1s
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH8PR10MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: df1920f2-445e-402a-c177-08de59dd1829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXdhK1RsV2h6RHkrcFdWdXU1R1AyMnpGTVZIS0ppaWsrb0RKcm81QkFVcE1I?=
 =?utf-8?B?VnBzKytvdHk5RWtCb2RmNlBMcU5yTWtadDJ0SlIycE9ISnlXYW5ubjl3cWJi?=
 =?utf-8?B?VkZjbU94S3poV2hBSXBLbHZ4VHJGcEJZYTFDZjNzVXZwcjVRUDFKaXpjaXhM?=
 =?utf-8?B?bTZwa2VkYUljUE53UUlFRi8vZWZvNytqTWlBMHdhVUdxOGo5Y0xoVzg3MTJ6?=
 =?utf-8?B?Mmc3TkpLOU5tc3FaNGZRVDhDOThLd1dJQkc5T2lHY2tNemNJaFc4QklOeGdw?=
 =?utf-8?B?cEY0dmt4T090L0NVTTdob3dEMzNFNUF1N1JrRERIYnBkWWVvV2taTkpONDZo?=
 =?utf-8?B?a2dnblBLTlQwZFYrSzJFUEZ4V0tFdGtmWVY4MExHSy9RKzgyVTdZNVV3cGtP?=
 =?utf-8?B?bnJDMGljQkNMc1FITmFLTkt3NjhYbGZubUpDNk55SFlRMU8xL0s5TDZEZkpK?=
 =?utf-8?B?dVZyT3YrN1pxdFJLK080aS80YURpT3ZEYThVaXhSR1VwdTBVK05oMTJvdzlo?=
 =?utf-8?B?c2hpendMcENCT1NLejNQNUFkd2pTdngzK0Jna283TzI4bWJ2ejRmNHp1TXM4?=
 =?utf-8?B?eHNGMS9wQjg3b1VXa1o3L3hjVldXcjlSclZJcmJjbEFGQXlyM3h2RG1tMWZX?=
 =?utf-8?B?ZUo3em5ZbFBzWU5vRzM2RUlEV2V1TktpOUl5N28wOUNZNGhCeldPdGxWbStq?=
 =?utf-8?B?VXdxUytUT0d6bUhoNkk1cnkvQlF4SXRPOFIzaGxlbEhHZEJsc2lZUHI2UkRK?=
 =?utf-8?B?R0t1TWhXTno4SzRRcFpVYUpqdjg2MXZZWE9LcTdodk12SHB1aUdqcitiWXFR?=
 =?utf-8?B?K0VZRU8rc0ZLNVBIZW5OMGxETXp1RkdnYlpRQlRkTUJCMTB0bzRqd0tNUDY0?=
 =?utf-8?B?anZWOEoxRzBjZ3dSY21OZ0t0eVhjVGJzM0R1RXVlZXZoc0ozUjY1eEtFSXBt?=
 =?utf-8?B?aW5rWkJmQTNxYm9SK1lMdDBUZmxXQ2w4cDVCNFQvM09BVWtHUnEyMDljVG53?=
 =?utf-8?B?aHBGbkJiam4vdjdtRU9FYWVSQ3IrcEt0ZlJnckZsdEtvaFBySjU4dHRFMzVT?=
 =?utf-8?B?ZDQ2SVlPZzBheXJGc3UvUythdU9nRlBlNWgvYjFadS9xcWxRVUw4L0JIS1lw?=
 =?utf-8?B?ZTNyVHV2c1Q5V1RIaVZLVytUZFBOUFhWaXVNUTNLNXJsUjFIYXNFeUl1Sy9Q?=
 =?utf-8?B?Wlo2aTFZZjVUSnNOaXA1cjJxZkoxZkp4aDVFUUkzNDVFY3g1Qi9mN0w3RFhy?=
 =?utf-8?B?OVNXTzBaSFFVRldFa3A4QXZGNnlCNGdrbEpYSURldkJvUHFlcGs0Si9RWWpp?=
 =?utf-8?B?RG1DMVJKdjc0TzMrc2s2RmFPNWs4Rm5VWE9kelF3THEzc0FUUUg0NFZpNlQr?=
 =?utf-8?B?TVd2TWpPd2ltVWFLM2UwcjN3TGI4Z3JoQTRoU3dEVG41T1Z5YlB5NlBXcFZk?=
 =?utf-8?B?eWxzc2V6MnZPTm8xMlMyWmZmODZMVFhDTkd2WE93M1ZvRVB1Q213L016emlE?=
 =?utf-8?B?dGRIM0o5SmZiZEp3RExEYWhoWUNKbGhxNXZqVCtBbDZ4VGxyeWZIczJvT040?=
 =?utf-8?B?dlJ6Q2UvSlRpcHk4d0RYZGJxVTd0Q3FVMEVPTUFhVTZjN0Q4Z3g4WXR2UFlR?=
 =?utf-8?B?RGtQNEIzNlIzNXpiOGlKajJWN3FFczk1TFZxOHVDbDAwVFdrM3NBZjhxMFNB?=
 =?utf-8?B?djk4ekljZHZEY0pXbHZ1MUtDZWFxZlFUQ2k5UTZuUnlFNEtKckF1M1lwT2Rl?=
 =?utf-8?B?SGd5bElJNzJUallkL0k3cm9nbllmSVdVOUl6YzlmdU04QjVoNGp3MXlQYytN?=
 =?utf-8?B?TmowQzRMLzlFc0pKb2N3SEhBdktwU2toeGVZN0pFajFzeFBpNFF2WkMvdURL?=
 =?utf-8?B?V2N5YWlKam1McGRvL0ZzRmtFK0QrdjJkZHFRazU3L0xxR3pjU0lHakNiTk5M?=
 =?utf-8?B?T2VqYzQzNUc5czBCV1F2eDFkWnVzYktXa1JmcmY4NUcxNWlzZ1ROVnZuSGg0?=
 =?utf-8?B?REUwaFc1Q0lsczBhOUQvZmUrMTA0dHdIV2czOTV3c2tHR3FZVFplc1dsMGxC?=
 =?utf-8?B?ZE9saC84SklMY2FiQUwrb3d1OHROZHN3NjllaWJTZU1XYlVtWEJEbXBaaFdN?=
 =?utf-8?B?ZkcwNHhPZHkyWkloNjRKcDhOdWdRcGRTOHYzSFpsUnc0TmhuZ0xnbWltdnBJ?=
 =?utf-8?B?TzNIc3ZTRUx2U2hlSzY3VHp1ZEFMZ0VJNThUZ1pLbWFqaVhJZ0NscnVRSHQ5?=
 =?utf-8?B?QWZ0MkMrcnJqRVJFZEhqREdjbnJRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:38:46.0113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df1920f2-445e-402a-c177-08de59dd1829
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_173856_662292_5E8170D7 
X-CRM114-Status: GOOD (  12.56  )
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

The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
is enabled. Add the necessary pins needed to wakeup the system. Add the
system idle states that the Main UART can wakeup the system from.

The UART driver uses the "default" pinctrl state when the system is
active. In the suspend hook, if the UART is wakeup enabled, the "wakeup"
pinctrl state is selected by the UART driver in order to allow wakeup.
Upon resume, the default pinctrl state is selected again.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 50ed859ae06c47af38b11753d909a91485d438e5..ab9e58c2d225eb44c054d984aad8f0bed92bf7e9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -151,6 +151,13 @@ AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UART0_TXD */
 		>;
 	};
 
+	main_uart0_pins_wakeup: main-uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0) /* (D14/A13) UART0_RXD */
+			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UART0_TXD */
+		>;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		bootph-pre-ram;
 		pinctrl-single,pins = <
@@ -322,8 +329,12 @@ &wkup_uart0 {
 &main_uart0 {
 	bootph-all;
 	status = "okay";
-	pinctrl-names = "default";
+	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	pinctrl-1 = <&main_uart0_pins_wakeup>;
+	wakeup-source = <&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 };
 
 &main_uart1 {

-- 
2.34.1


