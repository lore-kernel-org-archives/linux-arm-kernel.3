Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF508C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8MhKhjD61T8t/FM++5+rwJ0z3tliZ9JPRm+P+QxM8s=; b=Zu9CTvm74+/zYMMe7xtUT+J0zq
	yFeC1wrQmpe5go7MYHwsH1RSXOl57HsTu/tdHOxsAIzDjW03Lmp9VP9vu0r0AM04SocdRB7t7Fsa9
	vUHpxdlGUiXsxXUly3psADDLrQ0LVo0Z77GZDTHSlorFh+kuZ2wecLWrnZLxAamCwkPyX1pEjPR9J
	x56nP5OuaMrYr3qR3ALpnB7NslYf1H9vhvc/K7z+fRASyQ4fhEXSQ3KcE5J32X9jj/A97qq3OIn3U
	6ID9lSdMl1s/suGkuEFxYBdPHQ6Xw3/OepNlZTs3L6itCT27mrjjoDtCxnVDqKI4Fgsu2uMFolIe6
	xQTKKQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgIg-00000002OvV-41GV;
	Thu, 28 Aug 2025 17:20:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraMk-00000001G5Z-0ZPR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 11:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W8MhKhjD61T8t/FM++5+rwJ0z3tliZ9JPRm+P+QxM8s=; b=fAG7Tn6sF0vmCZcVJpc4BEX6No
	SiWtu40xpD4QhhtAFoEFDwpaYt3X+thoIFq3b1jYYx0hSIDXEbfZnLSybdjd+PID4jqUV0gnKHi4o
	lQToOThfpc4Q5IUhzakBfcC+rSgoHlcMQv7GpgQCAMUWSRulDAk+NysXjl9LJ9QibR6o5NbcaG/SJ
	tcH0OZrvRZzDsmWrsLlCrpx5OrSYZ/hhLAdEg9fh6TUZRLtI28P/w3GU63JVKcyIAI68TjYHbAu4c
	OV7AtZGSX96mCHEuqQhelfUBPIRE9aqENgjBmvI4ixRKO2b+HH8njz2bT/oV1J8ispP+fTNNB92EW
	ILu3WtKw==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraMf-00000002iUq-41C2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 11:00:24 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HP1VV24IPOlBKdE3a+NINtnblugBgzcmSyMMIcFSPrU+WRHsMG/JCtfKysXvcBRzuPn8wa02TrAdl8wUYSekD4676rkZB+1IdvkjnI4LyejvvLngZQCJCRaQHGs+V3BUjtRANtK5y1o8wtwMvv1MHAo8wGWx+apgMRANtb37H2G5S8BxODiQEaJ9LZaw01jReu1Hs9AqREEaA5TQBTZoyx4ZB5ES1+hFQk0Pax2YDYuzGqgRhHBky+CU3/ACL5aelSCLVRTfv6D/KN3sCxuyo5W7hw3/qiOa2X5+Abathj7HntmCWmaBuf9HNarKnGETstD7nPKMQ262vdushN7f1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8MhKhjD61T8t/FM++5+rwJ0z3tliZ9JPRm+P+QxM8s=;
 b=nlxp8byIKTT+6kwZUauhA2ZWPIguuEu4pda2p8mJZX1wcUZ9QDig0qPZol+USd2qHEwcajZNIpYrF10TjJf7n2VRpgVeA4w4yu7iX9pHR82U/fIE2qCEYRxLY4wpNh57Gj8d3eWDL57ucz/J6Z03w+ZknqAZNLFosJ0w+DIhCPeAaUuxKMiHMSgvnNSuYJ5rjH98VWX0d9ybwqvSD/EPaXfRmO2E5tDkANjWnGcRSK2lVLMV+aGYio6HLnRu6qQNx2Ky7hjtN4ngeerzwbgE2q2krJElMNfEjBcFj55szm9Hll188tFkxttCb2yPg5FA1CfzSXHCAxLPkyS37QOzaQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8MhKhjD61T8t/FM++5+rwJ0z3tliZ9JPRm+P+QxM8s=;
 b=K7kayEdMEjJo1ImtNzuGwO23WmFnae8yaGf0zLG+nie2MfFsJnioBRprJ0KuF1av1u7Nr462B6L0cE2BtMrLFXiKAIUldOgH8d7DdPjGXRDZBfHEsDxRZv5JUKl921XNQybxHVZ/trViPFGRlGte2ivZpwhhqQy9/0xaMBqUz3Y=
Received: from AS4P192CA0022.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::20)
 by FRZPR08MB10951.eurprd08.prod.outlook.com (2603:10a6:d10:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 11:00:17 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::7f) by AS4P192CA0022.outlook.office365.com
 (2603:10a6:20b:5e1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 11:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Thu, 28 Aug 2025 11:00:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcV0r1FBKR8GLUl+5G4eGMr/sNQFoZihDRcXX0C7C4imywVIfT21FJoOGxpNYbQAY5+snEPM0qb9Yyq5KjfiCsZZCXzUZT8Wdj4CC+mCxqXAk3SNgT75olWn0PFrABJPn02RmLWwNxtlQ9j69XKLwdJT8Wg4JJbPKvzVAzShp/q1NCafM1HS6gq0hKpA65Dooc32acZMrfQne032ihWHj00EylncGUxKWlL8ji2EgiV36HusKVzPztMLsf8NiS26KEeQyk6ZaOnc2YGH6ImN54SYFmGNJoqF3HIgSWzTOdH+iT3sErxN4FEWrOrXL3UUtiIl+ec+7BBdMcFcNPscEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8MhKhjD61T8t/FM++5+rwJ0z3tliZ9JPRm+P+QxM8s=;
 b=Yh07kKtRnXS0Z8m9WlEUaKUavWLt/lAfdCJQK6TIhL6yJTnYErihg2FOdUyEUrsutceXVR7nZT/2RdBHAfMYv3giQ89AWoMvTNQ2J39gb6hqI3SLTxlciQhpRrCVVdgVzgXtarPQT/P5g8yNj05NOKRVLiSt1ejATezF2Zfu+sJCISuEXgFT6W0OdT0IQzdMfXljXCoL1sT8ocl9HxTdxBjQEoQ3s/RS0LoS1fij+hJ0p7l5Erhp9o4mTy2EHsVNIXfJD5s7MQxpp5WmrguBo839IeVK6L+LD8MzTyBh8DLydQebndDHU1lADyRUYbtTJd79kMktVt9HUGZVKrwFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8MhKhjD61T8t/FM++5+rwJ0z3tliZ9JPRm+P+QxM8s=;
 b=K7kayEdMEjJo1ImtNzuGwO23WmFnae8yaGf0zLG+nie2MfFsJnioBRprJ0KuF1av1u7Nr462B6L0cE2BtMrLFXiKAIUldOgH8d7DdPjGXRDZBfHEsDxRZv5JUKl921XNQybxHVZ/trViPFGRlGte2ivZpwhhqQy9/0xaMBqUz3Y=
Received: from DU2PR08MB10202.eurprd08.prod.outlook.com (2603:10a6:10:46e::5)
 by DBBPR08MB10481.eurprd08.prod.outlook.com (2603:10a6:10:539::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 10:59:42 +0000
Received: from DU2PR08MB10202.eurprd08.prod.outlook.com
 ([fe80::871d:8cc1:8a32:2d31]) by DU2PR08MB10202.eurprd08.prod.outlook.com
 ([fe80::871d:8cc1:8a32:2d31%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 10:59:42 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "will@kernel.org"
	<will@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: [PATCH 1/5] KVM: arm64: Allow ICC_SRE_EL2 accesses on a GICv5 host
Thread-Topic: [PATCH 1/5] KVM: arm64: Allow ICC_SRE_EL2 accesses on a GICv5
 host
Thread-Index: AQHcGArbk35K7F6gd0GbJ52c1G5nNg==
Date: Thu, 28 Aug 2025 10:59:42 +0000
Message-ID: <20250828105925.3865158-2-sascha.bischoff@arm.com>
References: <20250828105925.3865158-1-sascha.bischoff@arm.com>
In-Reply-To: <20250828105925.3865158-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU2PR08MB10202:EE_|DBBPR08MB10481:EE_|AM3PEPF00009BA1:EE_|FRZPR08MB10951:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f4fd3e-4571-4524-2db4-08dde6221146
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?HBytgtWclByIWhBkf0FMGy2x3/Gl04+nYdf3PVkCsSM8NRjyy5lTarPm8y?=
 =?iso-8859-1?Q?2tq9MP+1N31OkRYeCyXcRZvywSotlTvTIkOrb/beUmTmOt2jNY9udA5D1t?=
 =?iso-8859-1?Q?DyBWu/p8HnuQL8OqMf0D8hf2HvkSh1GxEgqhaz4fyjRMiXyRn5FN6xWMm/?=
 =?iso-8859-1?Q?tMd/nwUsbdpOvFeuVjX8I3L1o8DUs4WDhONaUpBsnLh/hL0ePC39S1gSkd?=
 =?iso-8859-1?Q?H52qczGYoNNj38ArfjDTemow5xS6hIPYmzFeZ+XU6zlqR9pwRx9PNCJn4G?=
 =?iso-8859-1?Q?P4FRCKXEBGEnt5k94gPhShhz8RqdYVIhcRPMMjpq8HJmDcOj75HmaCrkey?=
 =?iso-8859-1?Q?AkZVmWrkag3ldhBNhg0Wzw3V3fPX+ktEwrD856sj7emwaeGqhZMeNAiniA?=
 =?iso-8859-1?Q?9HYMFgJtH9iRX22jHi2t75MrOGUXl1wsWkTf+OlmQ0icbo6ZZR+yPgEl/0?=
 =?iso-8859-1?Q?dIRxeG9As1VO2HCa2XWq+f8J9scmKQtER4l3uf9BeePMMmI1wxiNAqLZyj?=
 =?iso-8859-1?Q?zMtU03+pN6U3e87x6Vdf7G8306BbQ5BymIAyFslVHr3Rk+3lsu/IJnffca?=
 =?iso-8859-1?Q?IdX7ajUnmuYRivWOngJ+mxuFsoBig3+pptac4Sl34q6gYKB2DXsrAcj2/Y?=
 =?iso-8859-1?Q?p14ih6AhOtF3fWEfnYC14haLvcFBK/IfQVK38+Mmmu2QfzYMhTmAVG+fta?=
 =?iso-8859-1?Q?cyF5axbXowp08RwxKg/b6WzPKMPyXcCzOt/hAM0DppRwMl1ocAAQbr2CQa?=
 =?iso-8859-1?Q?34JrIha0QWtx0Gm6P9P2TZieE38slMVAyehoIPfoQ80JP8YCroFjR5gLWR?=
 =?iso-8859-1?Q?fh6/QIdeKTsfHGbGVe1uakJB4GlqA+0Jm/EhAkiGsHYq4sda63H0yB9mHB?=
 =?iso-8859-1?Q?qXIofGmxRvYQH7p0xtQDzPdh9YxaEmvj4Run/A+xHEciH7XxYFZR/hF0CC?=
 =?iso-8859-1?Q?TsCePcuepjE4hgBDTDh0B3N2WlrVCawNEQbzJDmqCfoX4HSjhrxSrHtABs?=
 =?iso-8859-1?Q?eUiHZDMiMum/cqLzFqnoxl7lHXPydITEVrBrumjvN+4pUgV1wgV1/0xdTP?=
 =?iso-8859-1?Q?WcizJqp4hejcGn+FiFrzdMl1J9jo+yC+kbFqPy1TFoGTZH4QrVzRTGWiUN?=
 =?iso-8859-1?Q?YfcUd1/uwmF+msmhRT/sYB6QnDO6zKTVNjO93jKMLuxQsCME6nqcsaSb+8?=
 =?iso-8859-1?Q?Ri42UZz5oUFGraPvzYhYGn+VWkmsD56lK5PVmUFI/jpctgmTzzK1rbDQ+9?=
 =?iso-8859-1?Q?QH1txdhgvwbsGRSV+CLOJqtKsM4tYKiVO4k6+SDzGcJIPXE1TnDgvuk5bS?=
 =?iso-8859-1?Q?4J1EjnEO028OSXMbryh209rMceM8YqEd4Jqqx3Q3TGFWveGdReezdpy61Z?=
 =?iso-8859-1?Q?IxWoEcctWVQ71/O/Of6jpKr2t0X12NTFUBH5JU+UryvlyfmnRM/YekiyfU?=
 =?iso-8859-1?Q?PVVoI4YkOYQGBlHO4jYTjAQNf9JPRAqJcmuyz/ipHVj+IqV5sGFyShznf1?=
 =?iso-8859-1?Q?GDjyZlHQ4mcfRrN8CfPxIcrRRQ5Tc6vaPauP3ROIZtiA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10202.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10481
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ca57376c-13c1-4a7c-4fa1-08dde621fdba
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|14060799003|376014|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YENhZKg0ykd/kquZqN5vtQw+QHKelMitr/PnKnlzMjJPn/MHwEHrgVtleg?=
 =?iso-8859-1?Q?nHsuF1USihsm5p39D/dCg0SPuj1maxKY35T5Gn4/30mlobiSSRWSdlhhmB?=
 =?iso-8859-1?Q?SVjLbauL65WjarHiaSmMugnlccxvbMBPcceELU0qWiE4Vp7wqNgYSsFd5r?=
 =?iso-8859-1?Q?DtNJXe0zrCY5Y93kfYHKewFZvK83EKNud0vJfo9aTyadskQbQLnzZQDVQs?=
 =?iso-8859-1?Q?Q5bpOJheZjDBEi4fXPULXaKrIIEhwkyiMwviq6QYGESiPravvs+jmOP/td?=
 =?iso-8859-1?Q?hdpRIG6+4aCHpzVSjj/wjiQyJQ6FT7VBCsCL3LE2o1uIiLwugIEusYFbyN?=
 =?iso-8859-1?Q?0MGkJBRub7QxJjHQiMpuBcBQr3CW6uNRzyHXIB/QKFPyfDWYivlszdNVlv?=
 =?iso-8859-1?Q?ZytO8m0AK88r7jgX8UVB0cxuFBIdLORr2JCGX33c2jwdDQD2+Z6t3iS7UG?=
 =?iso-8859-1?Q?EF6x6aI1QqUZlu4iHHP7mWIGo3PiHfut8i9x6vbY0RvsFDZ2A54FGdoQD9?=
 =?iso-8859-1?Q?WNa+0ioMPS9eRpqJm1y6ZOBj6yWmmdOzkugcTBAjFVtRBHebtX5RcJGzst?=
 =?iso-8859-1?Q?cXr6LrRRQqgK94JWW25PdxFJ+P2nxihD5dFUcfk9+StSCGIzQEofPoN8hG?=
 =?iso-8859-1?Q?YoIWdlcdi65s42uW10bVNCfS1EOT8SIp5ouNZOAF8EpfwYL9/PGumGU0QU?=
 =?iso-8859-1?Q?0+Rqc8ff+MeGnFKsY0WqRIECGwuphSETPlLqPWHFE6C/+mMq8+HhlWOnVh?=
 =?iso-8859-1?Q?M+/2iOeVutdBL4JjL1ds7ZXxe+B7AY59crV/Y3eX0+yIfNVV7WxJzTQHhD?=
 =?iso-8859-1?Q?dM25hYviyk4OHx9vzPn/9SRWIax2j0zdU1BPKOvbVaqzo3x+8uF70LNPdi?=
 =?iso-8859-1?Q?iySu+WAYXftXxJ//uC8OakY4yGNhnsK6q2RuJGAHTqMiCi0P9ExbjxAcZV?=
 =?iso-8859-1?Q?m9/eeXqwH80FZ5Cil1wUYGx25RScTH5X8o2h8g4SOgl8y4LLO2Aq7uQ+Rw?=
 =?iso-8859-1?Q?TwUp5aGUTV5lIPuVtdQkLVetPs6/LZoJxol4GIuisboBnpjVeUkXwXwkq9?=
 =?iso-8859-1?Q?QpfXPO+4onRLaRyNyjKDZTdWq0AbiRug3EYa1MWv/LhOZ/BZ3dUhV9st9Y?=
 =?iso-8859-1?Q?nyA27Ev9obcJJ7+aBXArt9hWoGkgANernlVRfonkI/w4A9/u6SpVnlnRuv?=
 =?iso-8859-1?Q?7c6Ka8lAADqgLALyFCYyv6FC6jEo1gQLZipUhfui4vo/wo6pT+lgv0IvRP?=
 =?iso-8859-1?Q?0rWT2P3g0gxFILpuULmOLz/9qnZYfmOcQDyQ2VJy/7VVrOm5LsR1zu++Qj?=
 =?iso-8859-1?Q?8tUSNCljKpQkKTdXUBJN42JToG4VxfxBTXLz6aIkoJQbqsUVArD07kygpT?=
 =?iso-8859-1?Q?LI1QmbDKIePJUUz4/4J+Xv8tNJoN59PhDhhX3N6gpMl5kRi/RnaxuUI2YT?=
 =?iso-8859-1?Q?vhEWXBHXbrSse51iv+T+gxK3CF1vnDTVbr9HjDg4DOiMo6VgdVLhf76s9d?=
 =?iso-8859-1?Q?hEEt7XM2ibRamWaBeURHkN6lXLiIj3zhySzu6uIObuD26pkOo6+P8HcQns?=
 =?iso-8859-1?Q?RcXTKkO/OG7ttYY9FKLeb4POPRtV?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(14060799003)(376014)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 11:00:14.8701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f4fd3e-4571-4524-2db4-08dde6221146
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_120022_220002_B066B364 
X-CRM114-Status: GOOD (  14.92  )
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

The bet0 release of the GICv5 specification didn't include the
ICC_SRE_EL2 register as part of FEAT_GCIE_LEGACY. This was an
oversight, and support for this register has been added as of the bet1
release of the specification.

Remove the guarding in the vGICv3 code that skipped the ICC_SRE_EL2
accesses for a GICv5 host. As a result of this change, it now becomes
possible to use nested virtualisation on a GICv5 host when running
legacy GICv3-based VMs.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-s=
r.c
index d81275790e69..7dbfd35a63a8 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -296,19 +296,12 @@ void __vgic_v3_activate_traps(struct vgic_v3_cpu_if *=
cpu_if)
 	}
=20
 	/*
-	 * GICv5 BET0 FEAT_GCIE_LEGACY doesn't include ICC_SRE_EL2. This is due
-	 * to be relaxed in a future spec release, at which point this in
-	 * condition can be dropped.
+	 * Prevent the guest from touching the ICC_SRE_EL1 system
+	 * register. Note that this may not have any effect, as
+	 * ICC_SRE_EL2.Enable being RAO/WI is a valid implementation.
 	 */
-	if (!cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF)) {
-		/*
-		 * Prevent the guest from touching the ICC_SRE_EL1 system
-		 * register. Note that this may not have any effect, as
-		 * ICC_SRE_EL2.Enable being RAO/WI is a valid implementation.
-		 */
-		write_gicreg(read_gicreg(ICC_SRE_EL2) & ~ICC_SRE_EL2_ENABLE,
-			     ICC_SRE_EL2);
-	}
+	write_gicreg(read_gicreg(ICC_SRE_EL2) & ~ICC_SRE_EL2_ENABLE,
+		     ICC_SRE_EL2);
=20
 	/*
 	 * If we need to trap system registers, we must write
@@ -329,14 +322,8 @@ void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if =
*cpu_if)
 		cpu_if->vgic_vmcr =3D read_gicreg(ICH_VMCR_EL2);
 	}
=20
-	/*
-	 * Can be dropped in the future when GICv5 spec is relaxed. See comment
-	 * above.
-	 */
-	if (!cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF)) {
-		val =3D read_gicreg(ICC_SRE_EL2);
-		write_gicreg(val | ICC_SRE_EL2_ENABLE, ICC_SRE_EL2);
-	}
+	val =3D read_gicreg(ICC_SRE_EL2);
+	write_gicreg(val | ICC_SRE_EL2_ENABLE, ICC_SRE_EL2);
=20
 	if (!cpu_if->vgic_sre) {
 		/* Make sure ENABLE is set at EL2 before setting SRE at EL1 */
--=20
2.34.1

