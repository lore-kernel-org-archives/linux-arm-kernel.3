Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F03CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 01:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1b0T+zNG7FX7853CAhm9h6srd+70AMfgMEadt45RMs=; b=fAv1mZNlgrFsjPwMn3r3Hwm+bA
	ndsNZ1UGEZ/TPCl0IObL2oV04JBWxHXghp1i7cgvY2ku9QTfL2/j/Ljb/smmcITVwXo+SUcgsiTZr
	pD8i/K3CJTsG3Kym7rNOgpDwXnwibq3YH1fw8AQk8Vm3W9iwjWDoTrn+eeIH2XH7B1NPBffYUNUgV
	8AtxyPgM3djhDHpLzoWxIpwPXQi4rWADjfgzXnkN8EN2RfcRj/B5nStPJz7Lm1IjZOPZbHhIzKM4V
	6rWKRqpgm5Ty92cffnpI1bzQDv6G1Nha/CcyQTPkfb0I3804N5ncTRMYZoTPTSz0FFKewmc3x16tr
	/U871yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDY8s-0000000F2jb-3L1L;
	Tue, 28 Oct 2025 01:04:54 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDY8q-0000000F2ie-0r7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 01:04:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8sHOM1O/C6YAOOjHaZ6dz1c3nOH9aHA0bdDbNTunm0ndVhPGczIezQpJXv2vnP/tWUB+iANAyvMwRxFvxpj+w+CSI0aqJEsIlXPxqtMbKpmRXYc/hgdNT+mejnZFheryb+rBGzcxDtKGyn+EgjCaOIJDqf5cS1ZF6ZKCxn4g/pyGkA4jlogyNJx2NFYYC1QJkvDLuyh7ODXLhJ8do9c5z72y7yXPE48EUcLxpE8dS9WhqvaLMXJhMMhgAm8teYGWvapTzlqAw1Nzczhanc7RhnympwLLLGFu1jPNvgQM2pDbrdGj4SylmKpCq0YzTL6/NwtgP9kFvOAM/Sf0kPoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1b0T+zNG7FX7853CAhm9h6srd+70AMfgMEadt45RMs=;
 b=v9pTlq8PZqTmw9Geo8rupP1uqMYeMBSC+KWHmJv/lMjWBJ4dnyBCsrd3TfywOSUjaoOPaUnyyezINIMXBtXz4naSGf9OEpPSMNs+XqY3rZiBgzXt/LHHiBS7eeTx9v6UNABYI5EVeftN5kK9haGiwBSZCTlu51CNyPWlE2ojbUrrTz0JbjuJ6pUSQG/lYZcpHTpSiTnY9MKE3CPor0lpOF2RQgskpM//dm2ja58knCA0h+5SZgoS3AuQIJnJ7icgEur3yhvvW1xPbcuob8tmZYn6n4FsEqBGEDdJb2EaJuuI/JmlN9KlGFYDUq9S2PUqFlqa1qQa7RoK+2wNyR3GoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0089.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c2::15)
 by TY1PPFC6318BE81.apcprd06.prod.outlook.com (2603:1096:408::924) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 01:04:41 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:101:2c2:cafe::a4) by SE2P216CA0089.outlook.office365.com
 (2603:1096:101:2c2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.20 via Frontend Transport; Tue,
 28 Oct 2025 01:04:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 01:04:40 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6779541C0143;
	Tue, 28 Oct 2025 09:04:39 +0800 (CST)
Date: Tue, 28 Oct 2025 09:04:38 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v5 0/3] Add pinctrl support for Sky1
Message-ID: <aQAWpkIXhsMW6ggo@nchen-desktop>
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
 <CACRpkdZAaEim0yJLkXNctJA0jBFj7LGyTGVvy7_mMf5G+vUWOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZAaEim0yJLkXNctJA0jBFj7LGyTGVvy7_mMf5G+vUWOQ@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TY1PPFC6318BE81:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb0977d-a22f-430c-0df0-08de15bdf912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE0xTDBWNTAxcVAyL3RNM1UxOWZsb21ibEtHS255TTJHWENmTVJ0Q29LTXNU?=
 =?utf-8?B?VEo0dDFxY2YzYlNzOTF2WDhIVk5HL3JJYmd6dVovazVxUSt1WnRSNW9FWDVV?=
 =?utf-8?B?TmhVT3hxZ3BBamV0S3hVYS9FV2NnZW82N2VPTWZRaytPRkpYdlFyaExhbWJC?=
 =?utf-8?B?bXVCQzV5OUNLS2NCN1JuMHlxS1BBWklHcjQ0MU81ZGR6UzFtcjNVTVBZZVlt?=
 =?utf-8?B?SWQ4R0hhVHZvbXFxQzduR3pjendCVEovK1duc1NIV0htWmdzOWJSRFlnRTJG?=
 =?utf-8?B?Y2RhZkw4ZWprVHM2N1dhRmN6bG53NUVmYTIrcmFzQW1LQWorOGRzMC91b2hk?=
 =?utf-8?B?TG5hdGZ5N1NoMWRJVHlCNWw4ZXJPVXZDRFA4QnU4QUcwalRmdXBLVXIxVHVT?=
 =?utf-8?B?cWtXZ0xNZUpYS3BWak9wZnBaNkdvWEo4MFhJRUxnZ2ZsNXE1ajFCMTNHZnl3?=
 =?utf-8?B?TU9xVUR3ZnlLekgwZXJGeStTQ2o3UDdiNEtoRm96OW5USk00Si9DOUM0NDFN?=
 =?utf-8?B?YmxYV1NUcVZ3WDRnbkFwWE9iU3BhekV4YzdqSk1MSmVaSGNjcmd2Wis3bEs5?=
 =?utf-8?B?Y2FVYVdQT2tjQ3BKRGJkREdXTCtKaTd5SVg5T1BvdGhoZUExQUFaUzBRenpY?=
 =?utf-8?B?MlBBWVp6UWduVlYrWUIwRUVFMGRZZkRTTGpGOVZBYnNXZTFHa0ZrYjBYSG56?=
 =?utf-8?B?OWZCTHBMbWdSWDMzd0xPYzlkTGpKUk9XUkg0T1RNT1dKcWlYdVFxZTd2TDhp?=
 =?utf-8?B?QXdFTFhZUlAzZEY0TFpaa1U2Unp4dHJXLzUxMFI3Zlg0cUFnbHpBYi95L3NI?=
 =?utf-8?B?VUZpT2FsMDdyZjFVeHc4YlFkWUFLR2Z3bHBYN1hXQVBpNkR2SGRqVWs2ejY3?=
 =?utf-8?B?WFVKWU4zNjhNSS9zY3BwTE5yUTRiZTNkMExuUTY4OVRHNEovSS9IanVIaTVp?=
 =?utf-8?B?U0hYVjFCRHcvemt4YVYzMTVLT3Q1ZytFVzIvQlVjeEhuM2x4YVJhKzNMaEk4?=
 =?utf-8?B?NzBwa1NSOWJWMHRVQlRkVENzTWZtT3V5TTQyblpCbGxFMjcxYUhpREVxOVAy?=
 =?utf-8?B?bXpTSUk2RTcrbkdwaUo0aG84VEplL015dVNZZzd5OHpsSlpuNWlTc3M2V0Vi?=
 =?utf-8?B?VVNEMGNtTVUraU5GRnVHRjZEMDFYZWl0R3FDcFh5ejNhU3YyWW9vUU9ickFy?=
 =?utf-8?B?aVNhU0NFazd6VmptMFF4dW5VY1lJektiMDVxZkVBNFlqV3laMDFJNmF4VCtl?=
 =?utf-8?B?NU9YWGV1S1ZoQmhtZ0hOakRTeW41N1c3WmlPRmV3NmpUY0RSdGVHdVZVSXdH?=
 =?utf-8?B?RFBiYXI1UEtmclVPTjFFczVRS2x1YzJ1a0dLT3BPWU4wRVdxSE16YStUWXdo?=
 =?utf-8?B?ZUc2ZG9BUUFxb1Z0S0VETTRmWmtneE5SM2M0UGdvc0Z0cDNiUVhLY3VUSCs5?=
 =?utf-8?B?WnpUSDBSK3N2SzlUVHJHeWJOM080MzRpZmVjQ3QzNmJlUlc2WlcxNmcvUWlZ?=
 =?utf-8?B?aktEcG5tWjlCWlk3S0sxSHBvMXBBZHJTMU9mbGwzY1IzamQ4SFV2RE5Sbits?=
 =?utf-8?B?SHNGTDl1YnlRQXZkTGl0Z0NvQVZZWjdkRGJ5NWJsd2d3LzROamVBR3FuZmNI?=
 =?utf-8?B?Z1l6NytCZGJ6ZmNBaXk5V3piY0VhNVA3ODZmNmp3eVlxZ0NjTGNmZkE3VnNO?=
 =?utf-8?B?V1l4N2huVXRCay9VSzBjS3pyU2ZMblpXQnZmV29EZHhkVEFpMWdQakZ6eTlG?=
 =?utf-8?B?dDJsb3NjTUl1bEhzZWx5TGVyU0o3SUkwb1NoVHRrcUU3K21RZVhuSXVRV0ZC?=
 =?utf-8?B?NTFodGt2d0l4UFZzSU9kQ2ZMQWlSUFdqemowV1kxRXRQaFJnQmFOTHl6WjA1?=
 =?utf-8?B?a0RHS3l1eks2eTRrcHRXMmJsMzBzWHNhamFqWkpOYkJNaFZENlRlTHp2WGU3?=
 =?utf-8?B?M2tSWmthTExyOU1KeHdXcFU1NDhTdHVEaDRoeHRtTk5JSExseTI0ZElhZSs5?=
 =?utf-8?B?dWNKSkFCWFU1dHA4R25FN1VPN2EwMjhQU0p4bmpEUkpBNkRsQTdDWUtyT0xo?=
 =?utf-8?B?Y09PaGw1cmJFTHRpL1phT3lMMERVbFIrV3FGb2xLWVJ6Ti9rbytyK2U3K1o4?=
 =?utf-8?Q?TaPs=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 01:04:40.2859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb0977d-a22f-430c-0df0-08de15bdf912
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFC6318BE81
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_180452_248081_7C5596DA 
X-CRM114-Status: GOOD (  13.14  )
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

On 25-10-27 22:56:56, Linus Walleij wrote:
> EXTERNAL EMAIL
> 
> Hi Gary,
> 
> On Tue, Oct 21, 2025 at 9:04 AM Gary Yang <gary.yang@cixtech.com> wrote:
> 
> > Gary Yang (3):
> >   dt-bindings: pinctrl: Add cix,sky1-pinctrl
> >   pinctrl: cix: Add pin-controller support for sky1
> 
> Patches 1 & 2 applied to the pin control tree for v6.19!
> 
> >   arm64: dts: cix: Add pinctrl nodes for sky1
> 
> This third patch should be applied to the SoC tree, Peter Chen or
> Fugang Duan takes care of that I think? Not sure.

Thanks, Linus.
Yes, since you have applied driver and dt-binding patches, I will
apply Dts patch to CIX SoC Tree.

-- 

Best regards,
Peter

