Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9268C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 11:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsvWd9uexREyuf/y85YWNaj94o+741YPqagdcdWz2DY=; b=OnLMSA04tAFoXZVFAqgc34ndIL
	PaGm4WwjZxPMwehs1GRP2e4gU9vZ503GSP5kXchE4wuOEBxCr5oBWRCr4HrnspX+gTFvv4Yq3gS1v
	UXYY4N94BY5uiFtN7pCTH8gfgL3y1ccGnBBaQh0PqM9TMNwJeQvrmnoCIPSwna8608fg7KVwlUB7w
	3Jrr2qK0yAct6QTlh0Imu89ECNqKwOkTePOgox8xv+Q1hSfabpUjzWGoqTgH1HRhmdeOyUF3v1+Qt
	BN3rTEQ2nAGvcWwzUXIY1GlhQqUTfRhJU7ZJE96oLVqPYJnUgYXPQWxfVJqrMA7ArtgubsXhtwaCr
	P/Pug/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugM7k-0000000EMJS-0a7G;
	Mon, 28 Jul 2025 11:34:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugM5I-0000000EM9e-102D
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 11:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NsvWd9uexREyuf/y85YWNaj94o+741YPqagdcdWz2DY=; b=F9C0V/7Wz0/07jmE6T4JxuEzMp
	g7iUfobUnu/E1awKQ+Nlht2WXSgk+x9SPuNKBSsfA4vE9Y8Le6+8nFXe2lUrul6YmDWXipItKQ6D3
	Eyj8yd3hE4yM23/OwvvEdydWXbA/Sl0QsK0gBd1B5I6E/SRYe+SkfiDn36kBF3h4mSmkpOhSjUzub
	npvXaUGxr+CGbQuWxLFuI+7dXlA4XhJir/pUlfwGleijo+rp7InQ6HdP0t+J38mwb5vvtslYCB16q
	VLiCH6tMWLHOBxA+EygbnJsJKFsVAgKUAok+Zr3iiIJMPj19DBkDo4CT/SuIp36A53VwTT5fPhdxb
	cWQSepcA==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugM5E-0000000CSyI-2TZO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 11:31:58 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mR1SA4o7z5TOT//SIfPdrLEwr5hVezS022ZkjlCBarxdQMN/t4J5fknR2YxFpmW9NWuRp80+cFrRNWzhIiTh25z8pxMVnaTVET9LPgO3gpxWVVPvXY15jH/zRwrkVlBXhAyYZNY54FywZ9xFVppKYpa5lfnUsKoxW9ydWfOUpEKe1e8WN8uATimWvpbSrgug76lgDolRheOoUu+wi0YL2XZLrYuQsAPA+ParRIZlTlSB0kOTXRKWlqcwvloL92lSe14Zfu1hl4fO3moBzSqxB7Zz9qagYMgB2ywn97e5XglfgZcSr2wroDGq2HhyAWprNKeTM0lAEqC26I0uu3JQzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsvWd9uexREyuf/y85YWNaj94o+741YPqagdcdWz2DY=;
 b=EsDT3M5l5bNQYrhYxzV9f44I4depupm78HISXpToWG+Jh1pJ8JQgswq7/rFfMmhY172PIPueWPvDr7J/SOEdwm2vLw0CgWI5FsRks8wqvNrrfXx/lKDdMC8SC8B4Jt4y+ih6X0GcP8B8jYmrUmG3UuTnJH0bk8xQTJKwQtdjNerIEXQzunEuVYaQwb8BPW04LBWCi2DkDGS9uGp046xVVXPlKXpnQi7ByQSOoXt9jTYfmKejRVOWlmCvqYUlpYPrp8aAmayorr9hsTTlfhKr6Uisq8TWK6KG+CwgPjLTNz7I5rbkIAsyHBrmBA3UaEatBMRL++VsTVNSMzTw5hoH6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsvWd9uexREyuf/y85YWNaj94o+741YPqagdcdWz2DY=;
 b=nikZ2693Bz0df9sIwpx+na6GtKJvJWoXO3hHXytjeJUMC0IPgsyK35nFqzwVTiRhJh9H1Ky0deJVWXwFGsjR/QVctaeNM/XGV9794I6LL/HsFPeSdwvyO7wuQvrLak1JqEKFLc/k5ewoP9QsyaytUTcgKs9bGx/Gf935U71RoUo=
Received: from AM8P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::28)
 by AS8PR08MB10001.eurprd08.prod.outlook.com (2603:10a6:20b:632::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 11:31:51 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::b0) by AM8P251CA0023.outlook.office365.com
 (2603:10a6:20b:21b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 11:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10
 via Frontend Transport; Mon, 28 Jul 2025 11:31:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9Qr4cbz/dwV0kQBBN3mnxurdUPqVGvjxx9t2RpNDsipFJIBU8iRI30cbodEPvUgktthbGHjwMbbcjqchLr+Q1lEeJWHt9U5SYWBELejOaJZ79ZjFjbXLdt0pBJH1rN1WH+yK+OBS0Vyj8Pim/nkyBgnrOl9CihcAfx9qUFkiggyUJQ+X2WXWEQaX5Wi5j0hTR8QKgdLVd6uHm6LtTi0q0SvyFvJd0+pYbH6miPUi8MZzMOCpQ/IQ9RXhee3V8bJdJZD7nwjgOI721wrBdIV+S348Sjqkat9tHVJu8Sz26hfXwj6y1jXQ/DXM4HKvhuhhqxWFffWd+WgDqKrOzWsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsvWd9uexREyuf/y85YWNaj94o+741YPqagdcdWz2DY=;
 b=PQPnqbCTC7EdAjt2BYoRz/9rQpaQAv/L510FLtN4grWIE8xrXhovjDztXDoK4WkSBDH04S5EQ2tY79K7d1W7+a9QEnJYApEu0y21MPVQRXkx8qf47u6Y50d+SrWeJjPU6f9sw8vj+8v+UGTZ8d5sVfX8ZCWId10JAvb5OYUUBqCqHP5I8TRxT1Ji1dvmA1IgiaiRj09uLgUMx+uF+o2Zv/RzBF805ZsdnfUJyZ/kddyzyL3FcefyBEn58OXZPsLcaTdGK+YJHcML/35YH88Ur3i2a/nmL3gB4efgRYLfY8jQIR6Q9F59Y1R+tPGDmUmpwkTNj1vgali2DgdDcCHgqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsvWd9uexREyuf/y85YWNaj94o+741YPqagdcdWz2DY=;
 b=nikZ2693Bz0df9sIwpx+na6GtKJvJWoXO3hHXytjeJUMC0IPgsyK35nFqzwVTiRhJh9H1Ky0deJVWXwFGsjR/QVctaeNM/XGV9794I6LL/HsFPeSdwvyO7wuQvrLak1JqEKFLc/k5ewoP9QsyaytUTcgKs9bGx/Gf935U71RoUo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU0PR08MB7922.eurprd08.prod.outlook.com (2603:10a6:10:3c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 11:31:15 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 11:31:15 +0000
Message-ID: <ebbd54a7-1d84-4a47-8a66-394bdcb53d65@arm.com>
Date: Mon, 28 Jul 2025 17:01:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Fix use-after-free due to race between memory
 hotunplug and ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, maz@kernel.org, stable@vger.kernel.org
References: <20250728103137.94726-1-dev.jain@arm.com>
 <f0e12d1e-110d-4a56-9f77-8fe2d664b0d1@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f0e12d1e-110d-4a56-9f77-8fe2d664b0d1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB7120:EE_|DU0PR08MB7922:EE_|AMS0EPF000001AC:EE_|AS8PR08MB10001:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4d841e-aa8c-4860-10d4-08ddcdca5871
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?U3QzRUN2ZEdwczdVcGpzYjRRcUdDbVFFRSt2cUxhUzBZaUNJd0VzUU95VFZP?=
 =?utf-8?B?MXVyMHpqOGlZcVVjM1JoOWNrWHlESHlMVlVTajZMMnhYZmJCMVc2OUtSTHFh?=
 =?utf-8?B?SzBNaXB0b0d6NU5MVG9RbWk2MGdDWWZGOWhjR0EyVE9VUVlJZXJpRnFYNnJ1?=
 =?utf-8?B?d1BHR3FLVU9rdDBxTElFeEV0UDg3bmNEaExsbzZuYUprREVDNkFXeW0rRE5L?=
 =?utf-8?B?ajFJOWFycXpmM2xGQ0hxZy84Rm9VbnhMaURJd0s3NVlCU2dxdzN0eG14a0pH?=
 =?utf-8?B?eG5hLzhoK0pBWUFPcUxDaEtCcXhHWjgycTF5eDV3Vzd4b3ZzRFVGNUFTS3Iv?=
 =?utf-8?B?dUxrSWpoM1JMM0p1d01mQWt4eUVzTUd3Si9yMld4VURGS1dUSE5vaUM2My9l?=
 =?utf-8?B?bndsM0NZSW1XdFBLZGdXTlkrRUE1eWgzV3Rma25MZ1E4Z1dNbGhkVk8zSG5N?=
 =?utf-8?B?QWdYRzBOQTRSNXJlT2k4L2Y4cDdTMys2NnVEWU9IVFVPTmQ0S3gzZHNEWUV6?=
 =?utf-8?B?K3NiY0loazZDRWFJTEZqUUNBUkVQenR6MTZqb0ZIQStVYVphNnN6K2hyNUxq?=
 =?utf-8?B?cnhzdERFOUt3M0ptYWU0eHF5ei9YUVBacWRmNUZqNGxiU2NrQTB2YzdMMmh3?=
 =?utf-8?B?OUIrdHpyc0R1Vk9USThDVVBvOURReksvdU5xTzJhV21GK1JKRG9wWFlXU0RI?=
 =?utf-8?B?V1MxTW1IdEpFZkZOUXVvUUtLeGkxd1dROFBFSWhuOVh0SDVpWnViaDRyVG9V?=
 =?utf-8?B?SVdBQXBoWkx6V2hEM0R0bUhSc0JTMEZVL25qUFVCcy92S2xwZVhhRzV1TGF2?=
 =?utf-8?B?VHdES2dvU1RJOUpBSDNHWkUxRi9yeEpqTXd4bVFaWUZFWFh5dktIcUsyTGVZ?=
 =?utf-8?B?Y1ZlRjQrd0lzLy9yT091bDg3MHQramJOREpFaERvUjN5NFJXMWFEYjRjNjhX?=
 =?utf-8?B?K1AyL3B3MG5RNitsTHd6U25DamhiaHV0NGlHWG9PZXg5d3ZnRTJtUElzeWdu?=
 =?utf-8?B?NWxVQnZocEFsb096Tjl6Y0R6dDBuclkxRkNpQzd1c1F3NzVnbmdEaDMyMTNC?=
 =?utf-8?B?WWE5Vm1mRzJqU1RBb24va2daMlNiRkE5SUJxbmxRRnhrVk05NGlHamdsMWNa?=
 =?utf-8?B?SFlkTi92bmhVVS9MUUFvcnVSSC9aSVA1N24wbytXOFFjcmFKQllBYzZTUHpU?=
 =?utf-8?B?N1dCR1pHNVcyZlQ0TnJkZlNlWlFhb1pVekVoVitUT0lTNzJGOHd6amxNaXVm?=
 =?utf-8?B?RVFBaEdYOGRjbjVKVElDMHlGR3MvMmVpcDhtTm56OHZoeldmdTN6YUdTaUhX?=
 =?utf-8?B?b2c1dDN4bitjSzJMNXVtNlhEQnBCaXpFOGZWNnE2MnZKY3dxVlhveEtQL3o0?=
 =?utf-8?B?ZkF6RXIweElDdEs3MUcxYitYR2FDcXNQc3FtZjBXWTlpdWEvd1pISFRncHp2?=
 =?utf-8?B?NHhNcGxuazBuRnVYZ2EzWVRaNnZiYWsyUnZacGFHSnJPWTR4bWZUbmxacFJn?=
 =?utf-8?B?VVNxa0tLb3Y5T2ZqODIrb2JmeEs0Nk1aTThvSmthWVRZcFVIbCsrLzJTUjZX?=
 =?utf-8?B?ellFbEZicytibVlvcnBVNlZCUTNXekthTi9Wc0t5MTRCWWhpTVJXM0xkMzJz?=
 =?utf-8?B?ekhRcEhtWGZ1SW1kK1NBd1ZycUZ5UFZHdTFTUlpsQW1GWHRhVHMwZlJqaElL?=
 =?utf-8?B?S0xDSm5VZ1FqWURDQ092N0FKWjloeFFVVjNtd3FpRUV2d0NCNVNqSGNlSUoy?=
 =?utf-8?B?ajZLdHEwbmwxM2QvcWFGYkVoOUZiREh5eFYxV0Rkb21BdW9YZ3NnYTRmeENL?=
 =?utf-8?B?U0hMVWhzZ1ZUUHFhV2IwMkZ2c0dkR3FPZ0dNSDFyZDVWQWNiZ1lqZXZDYXo0?=
 =?utf-8?B?K2dSbHRNbW5ZUnZQZXp0QWMzeWs4NUdEOFlXTGhTSExiUUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7922
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5ad3f990-3884-4b44-571d-08ddcdca4369
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|35042699022|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnFtTWNCVmNMTWF5ZkkzZUUyLzZvUHplTStYSjFvVElFSGxhYkRkd0FpVW9N?=
 =?utf-8?B?U3FLb1hadFRXa2RFcU54QUloQit5OWFZdTBkc0laUFdyWTVjdHZxcVZ3a0ZM?=
 =?utf-8?B?S0dGUGIxUjl1VzF0dHgxcTJEYmVWZlVlbTVyQndTREFEbUdQN2xVaGx2djdl?=
 =?utf-8?B?MVJidEtPNVU3K3FhUVNKaFRQMDdwRTQ4RHRFL1lBM3NSS3B2dmwxTUIvM09y?=
 =?utf-8?B?UHorMzhYK3FpTmNiRTFlN2UyL1lORXFobEtYQURvRGhwa3ZLSmcwKzlmNEty?=
 =?utf-8?B?TXFQcFJqUkRyTWhTY3dWdktQdllQK25IMEcwRXhxMzhtM0R3RzVGdTZCS3Mr?=
 =?utf-8?B?M20wZWc0VDVFNlBiMFZwVzdYYjhFbHVQVUdFV2I2dk16cUJaZDRBRzZXUXBJ?=
 =?utf-8?B?UFMxUnFiSGVpUE0waXR6NnJKSU8zU1VibzRFUHd4RTE5a1FTa3FsRjhHYWw3?=
 =?utf-8?B?Y0llRkhCNFNkMnowZkZCeUw2NTQwV0NWRXJ4Z3VRcStsNUxSR2IrNmNUMzE4?=
 =?utf-8?B?a3VBWEpjTFFORFRTSHQ4NEhua0NKVnRsQ3RnQUZrdFBuZmFxQ3p1SGc1TU8y?=
 =?utf-8?B?b3lVQXJ1WGQzN0Nwb1lPSmYvTy8rS1RkMWpwSllXYmlsQXhPZk43bVE3UTlq?=
 =?utf-8?B?bEpsOU1wRVdGTDg1OG5rS0h3aUN4OHBmd3hPbTcraUUyRHBHeGZnOGlVcVFE?=
 =?utf-8?B?NVo1cC9nNFRQd2c2U2JXVGIzdzFVOGNNQkxsb3BQYlRBUzV0bHVLSU10ckUv?=
 =?utf-8?B?NVhNUmNlSEQ2L1hkNGExcjdOTUdOeW1SOGdRSlNCeUtxK015aEV0eEZtOFpD?=
 =?utf-8?B?Q1F4SnpodWlGUTZ5bzRwV2w4TjRpUHkyREpURGJvb2Y0MVYzWUtIb3VJY09O?=
 =?utf-8?B?eU93d3MzTEl3MXJ2QnViNHZiYWV1cEpKQlNzWFNPcG9TdnRZbktHMkpTVHdO?=
 =?utf-8?B?SGtQWTRDL0N0elBIb1lGOHZITjNqY2dtdmxFUlNyaG5HWi9mT2wvakEwL1F3?=
 =?utf-8?B?UEk1SnpiUzNWVjVHOVhEUlljbkdhMWtIck1mMk9wT1N3eHYrcGpKT3ZJN3Fa?=
 =?utf-8?B?UXNhYWNacUQvTVBSSFgvLzJ2aWowRit3MndNRWVjR3gveXNYSzBQVFBuV0tF?=
 =?utf-8?B?T3pFZlpTMnp4S1d5MlV5c2Q2ZXpEbFhyZEpaZ2ZoenU4d2pwWXYzOCtNTThG?=
 =?utf-8?B?WGs0R3lLV25tbzVSNE53WDVLckJGempIM1hOYlMrQnhSU1dacHhqdFA3WnVF?=
 =?utf-8?B?WjQ5dmthL2ZwYWFqdk5BZ0F1YWhkaCtWdlhOb0JVdmNJcmZqMk1MejJiOE9o?=
 =?utf-8?B?UEpVUFZiemtmOGhSRzhsamJOODZjNi8xUEZlRFV0OFQyRzJPMlZZY09nTHRh?=
 =?utf-8?B?dkk1bmtWQWxBMEh6VVA4cEFLSFRzYzc1SHRPellMRU5Rdy9XMjhDVzVzdHVv?=
 =?utf-8?B?NVRTMmF3TXcybGxZN0IveFRCQjNRVUk4N25VOGRydkIvSi84MGVuU255Yzc1?=
 =?utf-8?B?bEE4VVJSa3liWGxXSS9wWTBRQ29MK2RmVFBtWjZwcVIxczVJNE90ZUlGM1k4?=
 =?utf-8?B?T3JFL1dHZFpwL3FweXQ4Sk4wTkZ4NHJ5RFE1eHYxbTdhRUw2aEJuUnBwMnFt?=
 =?utf-8?B?VDFqM3RNekp6RzhFSnlYL0h1QzA3UEJhbko4N2xmaUVJL0xGMUVTdWYyZ1Ew?=
 =?utf-8?B?WjAzYi9Ed0dxNGF0aWtySGJDcFU3OGtqbFRuWGN5eTl4c1Q0NTRCU1ptdjZ6?=
 =?utf-8?B?WnhkUkJSTWxPN0tORVdjVjlldWoxOThOcEpQekNXYVgrcUFNOGF3ajJGWG5q?=
 =?utf-8?B?SDhMZC9JM2l5NWpEcThYUmRlNk1xbnVVSEgrMjQvMHp3WEVyMTJSNEtLcWhu?=
 =?utf-8?B?S016eGtxUDJ6YzJsZHQxZkJaUG80Z0hkN1RqWmJaODNBNW5BRXpMUVJFUGty?=
 =?utf-8?B?bk1NZ3N4dEk1ZFpFaUt0SkxGTnV2OVZ4dFRGeXBPbjRENTdZUW51MUFyTzJI?=
 =?utf-8?B?dXB1emJYVXpVN1RiekJDeFhyRG42WHEzVjVJS3FTcVZzd1pKMFllOTdDbzFp?=
 =?utf-8?Q?qFdZqf?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 11:31:50.6414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4d841e-aa8c-4860-10d4-08ddcdca5871
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_123156_947862_5F08C60F 
X-CRM114-Status: GOOD (  15.95  )
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


On 28/07/25 4:43 pm, Ryan Roberts wrote:
> On 28/07/2025 11:31, Dev Jain wrote:
>> Memory hotunplug is done under the hotplug lock and ptdump walk is done
>> under the init_mm.mmap_lock. Therefore, ptdump and hotunplug can run
>> simultaneously without any synchronization. During hotunplug,
>> free_empty_tables() is ultimately called to free up the pagetables.
>> The following race can happen, where x denotes the level of the pagetable:
>>
>> CPU1					CPU2
>> free_empty_pxd_table
>> 					ptdump_walk_pgd()
>> 					Get p(x+1)d table from pxd entry
>> pxd_clear
>> free_hotplug_pgtable_page(p(x+1)dp)
>> 					Still using the p(x+1)d table
>>
>> which leads to a user-after-free.
> I'm not sure I understand this. ptdump_show() protects against this with
> get_online_mems()/put_online_mems(), doesn't it? There are 2 paths that call
> ptdump_walk_pgd(). This protects one of them. The other is ptdump_check_wx(); I
> thought you (or Anshuman?) had a patch in flight to fix that with
> [get|put]_online_mems() too?
>
> Sorry if my memory is failing me here...

Nope, I think I just had a use-after-free in my memory so I came up with this patch :)
Because of the recent work with ptdump, I was so concentrated on ptdump_walk_pgd() that I
didn't even bother looking up the call chain. And I even forgot we had these [get|put]_online_mems()
patches recently.

Sorry for the noise, it must have been incredibly confusing to see this patch :(


