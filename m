Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3DBD4660C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eikradmCaZ9as0Q3XUD8DEaV9yfIz+7j7Pz5Sf6CNY=; b=rbsCPyUNg1VVsrvTfJbGkfNuzp
	H32LV6WpThJWjl2FkT0N77GFfkdh0L4ALTJ4Lr4MxBEunVB8CDwvgrNP46gh+ECZjZ+v6o1heFCOq
	d8Pz9G11mleO7pzi1ENIIYQpzk5vXKldLV9O0ggLhpxnwkHLTi4bmPjZGJ/tJiyaxzOUXcefQFBhu
	aJl/k0K+udkzfdI9R68MOOtvBsS7maAEA55pN7krihKspwmFoEVG19CclkQgOEyzT02pohPV1h3eC
	f8RSxZYQ4BYKPLvUgyv5FbOk3w8f0abqn/BhC5R1ndnu3k3+6QDEPizP+uUa83zpUtkbAdU0if2jP
	ye2bKuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggyU-0000000Dwyi-1C9G;
	Fri, 16 Jan 2026 10:22:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggyS-0000000Dwxw-3eHg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Jan 2026 10:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+eikradmCaZ9as0Q3XUD8DEaV9yfIz+7j7Pz5Sf6CNY=; b=RqplkNcC0XizIsnfhZQmeoMgUa
	8J5KMmsqO6+g2C2yFTr2a3XhxyU2t99VHb/byrgn+D3cneRxdzImz3oYQzhlJZk7I5yUSEFP75i8p
	+hmeLAmocs95PgfoHIA2MFfRtcbt5OqgVyz8gmaY3O4AO7ElFbFOY66l/b+VbrJaLLkNfQAo2o69C
	Kc4BmEy5i2WwB0AaTB7vRmW50NabGom1R24BlF0GDpQKVdTvP7ba+Svj+m4SayCKsN74teGNgIU/h
	9Bj9CbMKysndSI2Apr0Fc9uZekgS6uhiJVmSe/zLHOw+L6a/Xnc7cle+auE9qMxqz/D5SsPhAla8G
	7RhEiQ/Q==;
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggyP-00000008UKK-3SbL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:22:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTab1ZXip19n7cCngobJ78Oe/8NiXgpPzR43Ec2knuKCUp9vRwSD2AjVnHId9bAjVAtmNj8Qmo63pW8fwrQHSEX7frGPAVXnqDwHTXNcbB6UGS54kJP5Kkd6G45slFgxeiOi2keqegv82ZSYpAFph8C7ourAnww9gE7OnQJK1WfknAZnZz+/Eo3KxnmwdBeL+VIm0uBc9h925VQQqaCvLXK31IhmbuY/q9ZNhPd14zo5vVQNquutNQzLVE175GY8bSIjvrycn/aOJlaKRpM72BccqMue9cwb+xEeEfW/Eh+Y7oCQwWDhwYZg6Tjais3oMHHfOu3lnaEcKrErTXYI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eikradmCaZ9as0Q3XUD8DEaV9yfIz+7j7Pz5Sf6CNY=;
 b=lge+4t+FtQamc9ijia01WZd4UVzANoJs/yfyudJxkJizAcWwg2I7Eqj8A/RClHeKcZtiJowY8kJiCoYk4xd+dHsVJOp6R9T39io+whaW00Tny9DHMtmyUPLAuoxFbO0osb0ZQWFqMS8SXeUJ7nobIZhBPVuoyal/FQF7o4EGTsBIo7p78QlvCP2NBsJoemwL3yVEDt6+5eMyWFhALhH41B5+oEYoQ1762AYDKIvPl1Cm2IQDIFgFomALsvQXauqSNBfo6JzGqO+neCJUQQkMkeqKc+zYg96T0OB8IPD3Vd6relDzO1okfJ/VfOfzDEuJhAJEsbuztEEqbzW7LF72/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eikradmCaZ9as0Q3XUD8DEaV9yfIz+7j7Pz5Sf6CNY=;
 b=M8XeW92xp/j/Dt26AIeAdNDwZroY0gPx2YtMRHxRuDVOJq/g80BrYsNFRwRVbajvtIgRf4GTkyd2oM/tqw9BVPEQPRqhvbJ0JBXlLm5vLXTygpwBmAAPwp7/DRZC6YS452TXROdmEFkG4w12RDziIvYfq6GwPU5eU5OL09tqfKg=
Received: from DM5PR07CA0076.namprd07.prod.outlook.com (2603:10b6:4:ad::41) by
 DS0PR10MB7405.namprd10.prod.outlook.com (2603:10b6:8:15e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Fri, 16 Jan 2026 10:22:24 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::b6) by DM5PR07CA0076.outlook.office365.com
 (2603:10b6:4:ad::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 10:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:22:21 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:22:16 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:22:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:22:15 -0600
Received: from [127.0.1.1] (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GALnXY3128184;
	Fri, 16 Jan 2026 04:22:09 -0600
From: Dhruva Gole <d-gole@ti.com>
Date: Fri, 16 Jan 2026 15:51:31 +0530
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-am62l: support cpufreq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260116-am62l-cpufreq-v2-3-eac7e2e78d29@ti.com>
References: <20260116-am62l-cpufreq-v2-0-eac7e2e78d29@ti.com>
In-Reply-To: <20260116-am62l-cpufreq-v2-0-eac7e2e78d29@ti.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Kendall Willis <k-willis@ti.com>, Sebin Francis <sebin.francis@ti.com>,
	Bryan Brattlof <bb@ti.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768558909; l=3167;
 i=d-gole@ti.com; h=from:subject:message-id;
 bh=z2M0We1QuRJn2unXQpzgE2daNzDDB1ZrTBJBdjpT/So=;
 b=1S6RMVS2PT3q2+IhnXT0LK567l8OiDH2U4oL/WnW8+TUm6/Z91D4d6+kpCdaqvnlgC+EqFj+J
 8kx0p0nb7adChm2XwfzolsINrsVZ3qQHtXxWXYqqb6XvjKvLATMZL9Q
X-Developer-Key: i=d-gole@ti.com; a=ed25519;
 pk=k8NnY4RbxVqeqGsYfTHeVn4hPOHkjg7Mii0Ixs4rghM=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DS0PR10MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: d9edfd8c-5375-4fe0-a7b9-08de54e92286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|7416014|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkpEY0tVSlNpNlpKcGZJYTM2bEVMZE9DamVpR3ZNSTZUTWczOVJ4NXhwb3Fh?=
 =?utf-8?B?djdOeXlVcGhxczZoT0JKR25XVHMxem1iQUwrblFEWEVTNVVaaUkrY1lDRzRz?=
 =?utf-8?B?WXZlRHN6SWh6Nk5FUVE5S3B0MlhMVVgvK1g1MzN1SjViZSs5aUxxNWsvK0dT?=
 =?utf-8?B?dlJBYSs5S1B0S3JCNGE5d0Fhci9iYXpFcjl4VGtKNUtoakd3YkRDa0FQSVFm?=
 =?utf-8?B?S2FDNktUTGN3OG4vRW83d29CYWpQU2krSG5XdElyYnc4NmNMQmg0SUZvSmlQ?=
 =?utf-8?B?c3VDNGduTG1YYmpKRW1wS01QK2hoWmYyM1YvWUhSTlRUVW5Bc2NaZko5M05W?=
 =?utf-8?B?Tm9HM2ptaDRodzhTai9TQm1FcWM1VTg3QjVETlVOcnRObWJFQ0VUc3JnQ2dt?=
 =?utf-8?B?S1AvRmJISnlKUDRoUjhRT2htQmhJaUJPZlFSNHZWWUJKZlltSm05bGJoZnBk?=
 =?utf-8?B?NStOb0RlM3JuN0hJenFLT21VOUF4VHZBdGdDclRDcW1SZUxyUmVtVzdrTml6?=
 =?utf-8?B?Wkw2U003RXQ3cHNlQW0yMXFyUWU3UGxQeEVmUnBlVzFvQWg0QmV4WkUyYW5s?=
 =?utf-8?B?S2YzcE9jTmorcWV0SWJBblBCUmZ1VFFObVBvbnlJMXNneUlKMkJ2TmNYMkNr?=
 =?utf-8?B?NHdXWHU1cDk5V1lOS1hCOGFlZnJTMmUvUFFHdkRIUXM3UHM0MThyM2Vqd2lJ?=
 =?utf-8?B?dlkzeW9xNytpL2IwTU91NWFqVzhJM1g2TTVkYVd4NUphU2VlYm1BME5jRXpx?=
 =?utf-8?B?NFJWMk9tRnVZMW5jYnJVd2tGMDcvUmdZaFUwbFJmSDVhNWdhNmxQc0JBUmho?=
 =?utf-8?B?K0JZeGd1MlBERERXU1k5b1paZjB6TlBrbEpLTHFlRVF1L0Z0RlBTMzRBS0JT?=
 =?utf-8?B?L0ttUTh6S0FRVlFLTFk4UHpEM3ZkR2E4S1p4dDRIYUJSYk9MT3RGbTR6bnFE?=
 =?utf-8?B?RXhheTlBZ3BjMDAyYnM0dVk2NTVnRklsTlFKWVVVcHNWOXNUYmE3Y0prOE1H?=
 =?utf-8?B?SHVUL0cxbjI1SSs4RDBWTG82eFVENzlEWGVtemtVNW92TmFlS0xoS3Y1M3ZH?=
 =?utf-8?B?STIxNjJpUEhYcDNqaGJTZE1QYXlyZWJkZkRRSU9ra1A3dUUwcHVCbWpvalFS?=
 =?utf-8?B?OVNIekpYd1IyZk8yTElxWkh0RXZaMUlYNDQ3KzJaemp3aUN1ZFQ1RjN6bVNP?=
 =?utf-8?B?bDV3QjNuNEVScWxaU29NSlZITUZ2UGVvYi84cTErUURTYkQ1b3NLeWxyVGFp?=
 =?utf-8?B?eEZMOUhkK0lWa0RNdFNSckdVSXU1cWorTWZxZkVlbmI2Rld2N3dlOVlEajNm?=
 =?utf-8?B?cnZRbzIvZnRaTkdZNitEUjVQYXNxSFpRNFJTQmh2NmZYTTByWDhzazJaRHQ1?=
 =?utf-8?B?d3lvbXZ5SEUvSWQ4ZU8vdE4wSFhvb0JjOVdyenNHMDBvbjltbTJ0SmxDd2Yz?=
 =?utf-8?B?eTRMc1ZGWG1XbnFtRllyTE1JOUVLdzZSMkk2bkplZGZlYUt0SXVabUE1OGlC?=
 =?utf-8?B?UE1XYmlDbzN2NkJUejI0NEZndFBjSVR5aXF0d3JVSncvc2lhNlFTWGFoZjJV?=
 =?utf-8?B?aFRTRm5EeEVsNlhoZGJPdHVCYTRVemRPaEVXQUkxbWMxNXNkc2dLVkdpYU15?=
 =?utf-8?B?VmEwQlB3UEhwMENaSk5VelRkSC9tbmZmYzk0aWJrdHlHa2hvSEpWMEtxTXIy?=
 =?utf-8?B?azg2OEQ4RzBMbUYyZ3hnRGdIMEJlcWpaaHJjYTQ0QjJFMGhLaXRWTXlDSEhW?=
 =?utf-8?B?NVduNXQxT2N3bDFZOTFBZUN5TWQ0Q3NOeFVvaG91ZnVrNUlORmJPVm9mdVBL?=
 =?utf-8?B?endtaFlXamNqenN4Nlo1TXB2QzBUYVlIRDJrUXpVOUR6SHlsVTBGTFowdWlG?=
 =?utf-8?B?VmRtZFFacTVEU3g5SzRhaWUxbVhRNXM0NWpicjBFdFd4dVo5UVI1MWJRL3Yr?=
 =?utf-8?B?ZTgxRW9RbExNMW1XdktqTzRUY05JZFgveVozalhkZVppY2hISitIZmRYSWFj?=
 =?utf-8?B?aXc1emV1dnZ2blNXYm1ndE1jS05nbnRpNDV2RmlndSt3bEJDVjVBaVlyVFVq?=
 =?utf-8?B?Y3AyMkx1ZlppdTEyMGljSkVTVzlTM3RzK3NzQVVValVBazhRNkl3VGVvQStL?=
 =?utf-8?B?YjZGVFhrUUY3cnRyYVNUUzV1dVFNelFnckRldUhjYVcyY2p5cVFGTWpPRGtY?=
 =?utf-8?B?S3hLdzhsaHdwK3RZWXRKWHhSNXFCVkJHQmlNQVBxbzRlT3R5bm5oQXJreFpy?=
 =?utf-8?B?ZTB0Y3BLVUQrQlVMOERrMjJsZW1nPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(7416014)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:22:21.5754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9edfd8c-5375-4fe0-a7b9-08de54e92286
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_102233_897590_3E5AB650 
X-CRM114-Status: GOOD (  10.86  )
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

Enable CPUFreq support for AM62L SoC by adding the relevant OPP efuse table
syscon to k3-am62l-wakeup.dtsi for speed grade detection.

Add the operating-points-v2 table with CPU frequency steps from 200MHz to
1.25GHz to k3-am62l3.dtsi

Configure CPU clocks to reference the SCMI clock controller for frequency
scaling

This enables proper CPU frequency scaling capabilities for the AM62L SoC
using the ARM SCMI protocol to interact with the power management firmware.

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi |  5 +++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi       | 47 +++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..a42ccd0d2fcc4d204cae81508f839c44ce83f558 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
@@ -127,6 +127,11 @@ chipid: chipid@14 {
 			bootph-all;
 		};
 
+		opp_efuse_table: syscon@18 {
+			compatible = "ti,am62-opp-efuse-table", "syscon";
+			reg = <0x18 0x4>;
+		};
+
 		cpsw_mac_syscon: ethernet-mac-syscon@2000 {
 			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
 			reg = <0x2000 0x8>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
index da220b85151227c63f59b2b8ec48ae2ebb37e7bf..f7146421918f7037c6a192cc4765e8814a508afc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
@@ -39,6 +39,8 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
+			clocks = <&scmi_clk 356>;
 		};
 
 		cpu1: cpu@1 {
@@ -53,6 +55,8 @@ cpu1: cpu@1 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
+			clocks = <&scmi_clk 356>;
 		};
 	};
 
@@ -64,4 +68,47 @@ l2_0: l2-cache0 {
 		cache-line-size = <64>;
 		cache-sets = <256>;
 	};
+
+	a53_opp_table: opp-table {
+		compatible = "operating-points-v2-ti-cpu";
+		opp-shared;
+		syscon = <&opp_efuse_table>;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-supported-hw = <0x01 0x0007>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x01 0x0007>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x01 0x0007>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x01 0x0007>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-supported-hw = <0x01 0x0006>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1250000000 {
+			opp-hz = /bits/ 64 <1250000000>;
+			opp-supported-hw = <0x01 0x0003>;
+			clock-latency-ns = <6000000>;
+			opp-suspend;
+		};
+	};
 };

-- 
2.34.1


