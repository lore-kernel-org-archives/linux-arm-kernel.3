Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EBCEC1EBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24qQLZ352PBO129n2m6cbX/zIAwoDL3cfnb6804fFiI=; b=pCcSbBrnj20q7Cs3BsqC3UKJhz
	tEoi/ykJ0m5rZdZ7NfS+09dqMEa7XEw2FWcAttz1ei3NXgm0snDZNoXqz5JLdht0Kcj3MCX/7pcSt
	R1BASQgRVeZ/xnurgypayPvIPoXbgRLwGUgNEx0sWgMdrbm/HPhREMVyRgrI3p+1kjkNwquyLDhKM
	ZpyhmnV/iYqaWMIQlK5zrTMNWul9mVnrIspy+bkjoGIpnVX7HCsheseEZN5sDs4V28169Hjpa47nW
	qFmY33YzPApD3RWMnL4whA1erANWqE8qPqKBkG+HUx9pkbIyEkrDjL3kJLrziUesTdKC3vhlyWHZQ
	/up+mblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzat-00000009xjo-46RD;
	Thu, 05 Feb 2026 13:40:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzaq-00000009xiB-2MZt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Feb 2026 13:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=24qQLZ352PBO129n2m6cbX/zIAwoDL3cfnb6804fFiI=; b=XHcdgTwt+25aFxDq5I4sDbCUM+
	ooe70sQXr98gG2kzZcLmVgCJysAl2euy9T6fRl01nSXKp6L0Hy8ON8I5WeraB3DVxBN0gF8ENmxbC
	W7j54LClO052pXr3NmkhaYzAmjBxCDSE3/lRGQb0tbqI4I+X8DQRwg4h0ufFaaVnvmEVvb3xRA2kV
	M4Y7Dok5hn/i21tUvSlkuyK6PObN7MqlZ5J/M4kAeJvVnc+O/VlATwYjrUT0G+u/BNiOY2LSEi82a
	4dA2kICoaDb2F4Fa9phV1EBT+jpKqxqkZA/HlFpTwuI3R/9/UgQbXe4t7/2Y8c0/GitmoiQ0fIx7c
	O0QZG1tg==;
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzan-00000002Egr-11ao
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:40:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T76qlxRRSXZjQ6GmohTWVRRDrP1BmB2+luLpPBXRuUoIx5+MO4wteaBFbRsJY3mXH0zdBg5/z9ct4lmesFybMFRlGtcaFNbVhZb8jxkeFpdr+5onoBLCZtao5f747HByVxTgcp7vst8MjfZPxolyXDlXDLli1DLbX5L/qp4bSHXiL4nTO4QOgipaJjv0JH8f313UrM9UBbYweTfca7gfoBbk+rE3TJpYAa4gUwR6ix+G6pbem8FKhuSkCNiLY4W+kJ9R2MioO65Hp9wd/JO3Mkykx2ggIqzZpoLD68HHqqkNEl8bKSD8Bl146BeZTzEuFt2/CmSdZOzmWGhS3PYOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24qQLZ352PBO129n2m6cbX/zIAwoDL3cfnb6804fFiI=;
 b=YoxZLtS0yErXln9qKbuwMTSDmJhzgYkOoI40GLAydQ/0rQJX6KJplSgYzKLaqPZ5ceXCDGCEdtwolQNXmF+nVQpXzWGrYTJynI1EgQKRjqmA2ia3OGUGZvMvzMBrwNcNvKod1SH2kqFExPNZkcvBNEtDJv56O2+jSRFmNd5FbAWRkOjbdHljX7djVu1YsWqxDbpu7L3GglsdzpdLwsk9DlXVJElgTCyHTUFX+KVBgxrEostvudOkFzADMPYHWCWN9WT15V8J1wga52ptktuGRTD9ZHTFspYRcWVYO3zb43LFB12MmfUbEqWc9NTRJ37sBMrAoIJVkhlWGGjyS2VBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24qQLZ352PBO129n2m6cbX/zIAwoDL3cfnb6804fFiI=;
 b=f0ZlyuHdaR3vMDIQfQXUv7+50a/Yi2Rn85viBWbiWNGJYdRpGzO9NuLHWHZXbA+pOjCJ1tIEKCxYNslAorpcdIz7NBrAW9WBDQIg7PBc5F2jgd7a0V9BsO6rvduceIiSgoNv477i6HYgVs1FfAJZVSJr8WTwgoQJ1jjpFAmHR0BhunWWFGET71yvzQoqKGBzBsUXON8OzdKmqw0d46ImASoe9Y1Kz97wsCSeDhNep5dbpN+q31mpTMIwhxMOt3KySJWT+ylU/tOGkljhVB2QXhsXn0Le0+Ofcq38qLEbOa7XkyeTg8Wsquhagkqd4gZCr2N83Ir+cZrgtWlqBHfh1Q==
Received: from DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) by AS2PR10MB6998.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:59a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 13:39:46 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::2) by DUZPR01CA0035.outlook.office365.com
 (2603:10a6:10:468::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Thu,
 5 Feb 2026 13:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 13:39:46 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 14:41:33 +0100
Received: from localhost (10.252.13.241) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 14:39:45 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 5 Feb 2026 14:39:42 +0100
Subject: [PATCH 3/3] arm64: dts: st: enable display support on
 stm32mp257f-dk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260205-master-v1-3-fe6399aa3aab@foss.st.com>
References: <20260205-master-v1-0-fe6399aa3aab@foss.st.com>
In-Reply-To: <20260205-master-v1-0-fe6399aa3aab@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?=
	<rgallaispou@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.13.241]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|AS2PR10MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bbdd30-5cfb-4d95-e0c2-08de64bc06ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGlSVDVRbUo0ck12WEZEMVVLU0RQS011WCswYkttYUNsS1ovOUFVeHFaMXlX?=
 =?utf-8?B?WmtqT0I0dXdBUzdmSlZhbXhlbllPcDJjSnI3dHNGbkN0TEh2d2pWQTZNZ2Mz?=
 =?utf-8?B?elZRYU00SHpQbWJhV0pEZ2NrQlVoa082MDBERFhxY2VTYVNCRThSdVdUOEdT?=
 =?utf-8?B?WWpFdGNkbW1KODI3Unpid2s5WThjK2V4NVRsREJxU1pJaTUzdmdCeWF4TkR1?=
 =?utf-8?B?SFBRbExOZ0F1SUNoU3A4V01VNTllTGhDQlZBRjBjem45dVJFU28zTkpRSkFi?=
 =?utf-8?B?UVphUGVNU0t0LzN1aFlNKzBpaU1icyt5MUdUdGJXOGovOTNSS0JPWVMyOG9B?=
 =?utf-8?B?Y2VaM0xaRmVMc0U4ZVkzU2FUMldoVjlDSWVSMjJuRjRmeDg2VllkVHgvZ3hK?=
 =?utf-8?B?QlM1M01VMEZ5SXpSQjh1enVCbXIrUCs0Yng4WGxLY3Q0b0hiT2xibldTeDh2?=
 =?utf-8?B?N05ySEE4NXlVUHd4UjM0V2hHZFBzRThRcityVjFZcGpMWlZQV3E4b3gvdEhZ?=
 =?utf-8?B?TS9WZ1p4RUlDQ29lcnVSZjhpUmlXNUdNTFkybjJZT1FPVXFEU09GZ1d2S3Vm?=
 =?utf-8?B?ZEllbUx3c1dycmltcHZGbStDOGNDajEyaW82QTQrMTJBVEZjVTlLQ21Wd3lI?=
 =?utf-8?B?a05kM2toZjgzQmkvNkMzMi80cHVPWlVQeFJ2eGJ0b0pnT2ZzT2J0T2lXcVN1?=
 =?utf-8?B?WFJic1doOUNiRklmRGUxQ2VwWGsvTXhadWxUUzBxWXc4aUh1Zk45OEhFK1N4?=
 =?utf-8?B?Yy9OOFgzTk1tSjlJRFJ4Nk5SNFpIQTZ3dGdpZURGajQySWM1S0Vmb0FVWFVU?=
 =?utf-8?B?eTVGazVRaDI0V055YUhjcGxzSnhqS08yVGRCb0V2ZFhHTTFZWkMwQzBhM3p6?=
 =?utf-8?B?WEJ0dmtCeHpFem5mTDlYYi90RkppZE1nVVVTQ1UyRnZoWmVxV1VJcm5OWE5T?=
 =?utf-8?B?eHhZNmJNWE1zck9MRUI3UktjOFBnLytGVE5Sbi85Ny9RK2YzdVZzVXpBajFV?=
 =?utf-8?B?djBGZ3ZCUG9ic29pOUpSb25yNi9UbTUyOHZmMUowa0l5QS9US1cxVGN0elRp?=
 =?utf-8?B?djZ6TEJ0V01VbWdTTlkxS3V4Ty9vMFBodnFaYVFNV09EQ3lPdEFpY1JJeTRy?=
 =?utf-8?B?ajlMQU9UTGJZS0pZOTJRdEQ0Z0JNWWlIc3JnQXNENjdHbWZzbXZmWUpGak9x?=
 =?utf-8?B?ZkVIMUcvVXlFRXI2SkNaQmwrYXVKT2pvaWw0eThpdk54eFJoTkZjV1diTmE1?=
 =?utf-8?B?Tmgya3hmT1dCUmZ6bEpXYXFYSkpjcHhGTllTYXdxVURkV1Z4ZG1yZGo4d1Qy?=
 =?utf-8?B?SFV1ZGorLzNGQWg1MnB0RElUZGxwdjZzdWlxL2tLamFTdnA4Ly9PUk0vaWlT?=
 =?utf-8?B?am5QMzRyRStGbngvODJPUzFpOUtFTVE5d3l0MXpwTERPN3dicnNLSTMvcDBF?=
 =?utf-8?B?RE9mNkQ0QVpWcm5ZdmZDanRrdjQ4NUtqMFZjNkJXQ2xWcm9jZzdsV1JTaWt1?=
 =?utf-8?B?Vi9NY2FjMWJCRVJJckhSKytQQXJOMFB0cEhPbXNEd0hXbklOamNsWlg3dzhy?=
 =?utf-8?B?NDJLZFdwMDZuaEI0NVdSUjB2Wkp2ZjZzT0J4TUFlYjJLNnZUTlhIbVJ6dVUx?=
 =?utf-8?B?Lzdqb0g1bTdHNWYxZ05QU25wV01DUFlOek5MVVk5b2FuVUMrVTFlM0dpMjdr?=
 =?utf-8?B?bXVseGt6SjFLakc2ZG5jU3puaFphRXdLZDZUM3krQ3BnVjZYVHdiY2RVVGk5?=
 =?utf-8?B?NnlIRWtsbkFrTXdTTXNHRTNqWnc5WTlhT1lpSDI3QmhVTmZrdnJTTmZIRGRY?=
 =?utf-8?B?K3hzYmo0WUVibFNqbHBKSnVrODliTlc3dmhyekdoMmlYc05aU045YSs3QkEy?=
 =?utf-8?B?dmtqc2ZTcVZZVVcyU3dETEJudW9MNE9NRXQ2b2FpcjFOMUJlSjlzZXplL24x?=
 =?utf-8?B?a2JObWRCejVFMFRNaWtlY0lsb2ZHbWYzZS8yMUI4eEJjTzB4R2wzK3FFK3Zl?=
 =?utf-8?B?MitPUGhBU1VqTHhCTkxsMitsUDJUb1ZwRHord1lvTS9DUFFyTnNNR3JyTHlt?=
 =?utf-8?B?Z0NkSGlrRWh0N0hqTnoxK0FkWXJSU0JKSjlnWnpWTlJrc2lPOXBEN1R5b1pV?=
 =?utf-8?B?VHBLdGMyL2x2cjhvbE1XYk54SWhUc3lqendYMW9JdjN1Vk4rMnBYcERXRUtq?=
 =?utf-8?B?Q1grR3BRaS9wVkl5b3VzeURvMVNvRktVTTltVEJIZkFPUUxWSEZ5cDE5MG10?=
 =?utf-8?B?UUVtMjZxN3REd3NiOEVBNFIzYk53PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7l+9uo6YXrLleNu/DVC507TQIsYq09fdvMbfd7IvoW76qYevxs7+YALKXSZwOP+afXLgkkKcfPKk+9lWI/7ZSMLcXs9E1t373sf8rsqmI/6Ua9V30N12ULXU7WNI0Ocj/O4SqjwTwHFJvIwDGfbFxrKLujKj7I88Kw1T1tWUBvlqh1WG0MlkiSwW8CgI8Q3tNniQoscjhbj+ue1aOVMsIdEa/J2GZuHqWN3xvTG/MRNeHvEuJyXhdIixG/l/3Eai3vA4aCGTGIjbRaP92QtIhZwS0KM82fpIhZE0HANmtGmqwWE5GWYEF8lJLayXiSHIySmLT/9gZEiRldAApiWn5KkC1ZVG9Y7tQOWDuIMqwK1Um6hrFBj6mau5qjZC6N0ofYpOADLBktED+cOi6hfZGl2lOqyBiYIH0eELqhha1Lt6UUgfML0iM62DJi2iMIsS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:39:46.0743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bbdd30-5cfb-4d95-e0c2-08de64bc06ac
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_134021_424755_9AFEE320 
X-CRM114-Status: UNSURE (   8.33  )
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

Enable the following IPs on stm32mp257f-dk in order to get display:
   * LTDC
   * LVDS
   * WSVGA LVDS panel (1024x600)
   * Panel LVDS backlight as GPIO backlight
   * ILI2511 i2c touchscreen

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 90 +++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 4e45562ceb3dabb19eca3340337b364f63508215..b60c13614cfb9207b8b541ee8bde4ae9aab937a8 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -55,6 +55,43 @@ led-blue {
 		};
 	};
 
+	panel_lvds: display {
+		compatible = "edt,etml0700z9ndha", "panel-lvds";
+		enable-gpios = <&gpioi 4 GPIO_ACTIVE_HIGH>;
+		backlight = <&panel_lvds_backlight>;
+		power-supply = <&scmi_v3v3>;
+		width-mm = <156>;
+		height-mm = <92>;
+		data-mapping = "vesa-24";
+		status = "okay";
+
+		panel-timing {
+			clock-frequency = <54000000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <150>;
+			hback-porch = <150>;
+			hsync-len = <21>;
+			vfront-porch = <24>;
+			vback-porch = <24>;
+			vsync-len = <21>;
+		};
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_out0>;
+			};
+		};
+	};
+
+	panel_lvds_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpioi 4 GPIO_ACTIVE_HIGH>;
+		default-on;
+		status = "okay";
+	};
+
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
@@ -100,6 +137,59 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_b>;
+	pinctrl-1 = <&i2c2_sleep_pins_b>;
+	i2c-scl-rising-time-ns = <108>;
+	i2c-scl-falling-time-ns = <12>;
+	clock-frequency = <400000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	ili2511: ili2511@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpioi 0 GPIO_ACTIVE_LOW>;
+		status = "okay";
+	};
+};
+
+&ltdc {
+	status = "okay";
+	port {
+		ltdc_ep0_out: endpoint {
+			remote-endpoint = <&lvds_in>;
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			lvds_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			lvds_out0: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
+	};
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0


