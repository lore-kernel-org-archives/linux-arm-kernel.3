Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEACE81BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvhUcXWeBocTPg5PLVy3L0DwVIR79cQ7KpM7A/iVYdk=; b=YURb9+RRYlj9X7XUwVwqnwWSoc
	6FxgvqWVlC5zCl7NJAG8cf9zc1x946imCHRPQ9yOYFP0ctZ9lJ5HYCwBGQ68MHCHnjxxUJzvfw8Gv
	nAsZZ+JTDOx2Pct4DiD0e+9ElRIo5trvHPyxzsXL2q+br1ZFDtROwzsiC4+kvmKO7R+mATrUjiQW8
	KKFiSV67WCWBCLfGYb6wgOO83FkdkN7XvDmxwS9RGUpbicWN4akHOBEvSfQxB4eDGZVFEW0jpf3er
	gj97rPfMCOzZyFJwi0FVLaVX4o8mgYHHhuYj1bd1RnXjrpeHkAi6MI1ILXQ5srR8RNqHcWionoL2N
	RggZVTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSki-0000000FZHs-3zQE;
	Mon, 09 Feb 2026 15:00:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSkg-0000000FZGK-3BaF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Feb 2026 15:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tvhUcXWeBocTPg5PLVy3L0DwVIR79cQ7KpM7A/iVYdk=; b=Z8N30g6O2eckbZ+WmPsQgb2xca
	5cfQfjOBfdt41jmqAS0tUt33q1aKCNwoS/lc4N+hY0QOwCZnzw0ST/Vn7C1JuopB5PtZYmLwGpxyO
	iDGPz57IUxfKsMcGY7WxB7BVqZY1daiwBCe2onecY122AnMzaRkvETCsziQt2sYRmFx+vW6aFVALS
	1zDMj01QH7G6tzUJT1S0n6pDEusKOGaqYNqvvg4kKd+0RdzTEK/7HwprXwaYwTYagj+h0Eu8VpJi6
	CVTgzHQODO8erCZTMo75Pn1Jhu6Kf2BLkXUZohlMpTQT1uwLXy6knCZfWjGJTrCkZSPZb634X7Us5
	TcgW1t5A==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSkc-00000006zwb-3Ztj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:00:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maqQ/S8lwBL+RuZreFkmaO2CHdb6DkRtCu8kGz4gEsQZ2X3anhK+PBn5gvU+GDxShqOx4mnIrX3tV4tz76V7hPzPwOkQuiAVDjIMSL7UfWg08BRcY/hGGhDaAJ+Fdf3mCLSh8L3Mn2GEomAXlNJV4ffE+k0rcNRFdcr653SZks4J913D7ziY0XNUsueWBPvRXqwUOpMcy5tTJaO7MU+Vxwv0e8h9AUcmUxmBK4OyJ11adwpejTNWF++Herb8SuqSAf78FtW32znRgcUfK4+C/9Ag1xIxlxot3x2rgQzRrQv7ZXwwAsnIb/iuxfRkT9/+oMsXQ72p/SndA+sYFAN6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvhUcXWeBocTPg5PLVy3L0DwVIR79cQ7KpM7A/iVYdk=;
 b=mfM+Hnu6tiqaQG0cryssgq+3KCL518VA6VtNqc4Jq8okHOwjOue0JlZqffKro6nXuR+tE4t4yce62ZIAz7bofq3dTQ5XM+E8OlvFsJQaIYmd0Emhjoc4hJYGibvIjadoyvANPAEfn3aGJabOaPzsqSqlpRGAdUp9WG4LovJWP2cpDpkwJGA7EV+TuqZeDYKuZEMJcqgBFLGE83duMDSWl/SGjx67pcb1M4k7Tdc51PaewjbnVAaA2ce/2ayCrhMXbaTmh/bWRqESqazK10btc1RhxiLFbH+Hg9Kj64Vn51v8XVJF7URsi/k0ngARw9ItD0umLll7YGkUC+0GfQO2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvhUcXWeBocTPg5PLVy3L0DwVIR79cQ7KpM7A/iVYdk=;
 b=TjWJaUCg2pEXQ54qcArmX0MgNPegXqmw5BnH9YrLKU0pTCtJiROPJJ7Ouz+H4EBHVBm26LQX0qaj6ubhl3ySTkWfVT0NwbOs4nagngwWTLeZzGGRHgTRR16cADQ6kHZoxgjWPbSaFWpziTv1ZTcdD9J79QOT56l6x5gXJZsU+cAkFSyFceQ/1JHlYcbCgtDBHy6Uid5RfJIXXRvBLibK6KrrScvZ7YD5LVS28zK4EUoUlnqUm722cNiaycyHGlzGLz7T/be06aFgvVwIiQgU4A1t6QE1a7BmZoMRSi3tEjotISQVmt5FlcBovpqqd20L4r1486x9mllI9Bf5iABzAQ==
Received: from AM0PR02CA0141.eurprd02.prod.outlook.com (2603:10a6:20b:28d::8)
 by AS2PR10MB7369.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 15:00:27 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::e6) by AM0PR02CA0141.outlook.office365.com
 (2603:10a6:20b:28d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 14:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:00:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:02:15 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:00:25 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:33 +0100
Subject: [PATCH 3/7] arm64: dts: st: add RISAB1/2/3/4/5/6 nodes to
 stm32mp251.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260209-stm32_risab-v1-3-ef0b2b6a7e0a@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
In-Reply-To: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|AS2PR10MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d7a166-dcff-4f79-dfdc-08de67ebf5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a01sSFBGdTg1dDR5WmhNdHhrMDFtTTJUOS9DRUhFb3R0ZDVaS1NJaitJZ0hh?=
 =?utf-8?B?U3lWVGVUQXRYM1pmT1FrNC9wSDdQYjlOV05JTlBweW83YWtObGtiVWcwaTE4?=
 =?utf-8?B?b1VGUXNDNGJyWlBwZ3hyU2ZDa0pwYllBRnNzZjkzZ3ZxZmcwWkltOGNKUlZR?=
 =?utf-8?B?UE9PeStFMWtOMGsxNFg0UTJ2OTBTeEZFVUdIc29oTmNHZThxRjU5bjBQc3RN?=
 =?utf-8?B?Y0RzMlpNWmJmdExWVldjRVVmdTBvR0YvZGllZXc1T0RIYW4yMU9PUlFSbklK?=
 =?utf-8?B?NW9ydEdMaVFubXJla1ZtY2xNdXhnZ05YU2VQSWxkRnh6ZUh0Q3dEQ3dOMEJt?=
 =?utf-8?B?RGdNSHVrcWNmZm5Zcy9SLzVNaWJMekF2cVdDcTNtUzNaRnJTdktUWkEyUDRE?=
 =?utf-8?B?dTJyKzFrNHMyWDgwOS80bDFPQU5icndpcWNrd21vQXVpeCtjMm00OUwzVkEy?=
 =?utf-8?B?bGJXZWU2T3h2Q1RYbGQrZmlZdEREU04xQ1AxaVdvOGJNK3luemJZOCt2d0Ro?=
 =?utf-8?B?QmlCdGJERko2ak8wdmJNWDFudnRpdkhUVzF3R3NOSkEybklYV0t0WU83dVpI?=
 =?utf-8?B?NkNQMm5aWWIwZmpJYVd4YzdQMXZaS3VCV0ZYR3dFbEhpcEhBME11UUgweHow?=
 =?utf-8?B?dzVyR3E4WExwdXViZS9HcUg5bmVqRUZ6Q3k0ODNJdDdOTWpJcjJUZjVEUWhr?=
 =?utf-8?B?c0hzbWxBOVZVVEs1Z2lYOUpHSXNBSlpIZVRackQwam1QWm5sQU5qYTV0MFZD?=
 =?utf-8?B?RHAxdnJEN09IRTk2Y1pqemovRVZwRWJNbDJJSGMzbjduSkF4aThjRUxaZkpk?=
 =?utf-8?B?dFhQNG1RSWNjWnNDL1pvMytvUGtsdnlaZjk5T3ZlYjc0aDc2ajJhVUoxS1U5?=
 =?utf-8?B?enRja2hGbjZWOHowcmlwRjlrdmRRbWp4Q0krUWcxRVE4cHk4Qld0c2FoZ0o2?=
 =?utf-8?B?dHE1OG9ucFo4U0N4K0lGY09jbFZTZFJVaitLVjJmZjd1T282VE1qME1IcUMr?=
 =?utf-8?B?SFR1aVpGbVhkNE9xeU1iQ2c0RS8vL01NSXFjV3VIbE9zcm4wbXZIUmJyaE91?=
 =?utf-8?B?SGxOcStLS3BtN3Q1M3U5b3Rzby9WVi9hK1ZuSXg0aVpzMTB1THhvYjZ6SnhF?=
 =?utf-8?B?QmxSRFBjTWMrQ2hOd0hQMnFrNjZiNkFTSFJMditJKzd3QUpsR0FWeGZwcmhk?=
 =?utf-8?B?YlV5M2FXdU1XazBHNGp3eHIvQllERThxeTdibW1wUkxSUTZmNDlzc0laSHh5?=
 =?utf-8?B?UjBaNUQ3aVlxcWpaK01QRjFtcGNTTHRSditjVlFxUEQ2TnVrMDR2ajFTTmdQ?=
 =?utf-8?B?aTJlM0grT3puSDZjTDUzYlVkaGNmVDV4K1BqNVNzWlhGcGU2R0Z2WHpROFh6?=
 =?utf-8?B?VzEzZkxwekxLOVljOFowcDc2cWUzZ2pVWStzVlNBU1lpQ1MwbFBxc3BlQndZ?=
 =?utf-8?B?Y3cxeG51cGtERjNCOWxiSzZNdEdlTFRINnJ6THlLOFFJUlgyQ3VxTUNheWZs?=
 =?utf-8?B?d2cwRmY0VnZVM0RraHViMTl4WHVGZS9WcEI4VXZ0MC9McUw0UkZUQW5zdmR3?=
 =?utf-8?B?M2xhajNDbnZLSEtOZjJrNHF5Q0JsS2FlbUdsWE0vSlAvczlaeDdzZE9HdndO?=
 =?utf-8?B?YW5HLzQ4RHpkNlpWRUxIbmtUSk41WUN5eWM3VTBDY1ZETmpvNE1sNHI2R3Z3?=
 =?utf-8?B?N1NER293SUZnSEMwVnllSEgyWTIyc1NPL3VZTGhNanIrS3lNWFlQVzMzeHZm?=
 =?utf-8?B?MUVKS0l5Tk9HU3pqWnhFYlZ4UGVYZEwzVThKU1lvN2E0R2tQQ3hSL0NRL1JS?=
 =?utf-8?B?T2hsbDJCK0xsUnJ4b2hORmJoM0JVbEpwQ25XeDFoR0Fidld1WmFkeUNicEt5?=
 =?utf-8?B?V1pxczcrczVtUHkzSjZLWGcxWHE1TnZRcXY1Ny8zdlRpWlI5K05UbTdid1Yv?=
 =?utf-8?B?cXZSNG1OelN5M3krY3VaMndEeE5pNlF0SFJjZlBPVUhwVWxTUmhFOUNaakMy?=
 =?utf-8?B?Zk5kUVVCZWYxcXFlZWgvSXNlanBlSmJOcDcvTXFndGtIdlg0SGFkcEtiRXJM?=
 =?utf-8?B?aUJrNHViN3hjZzY3OUhLZ0w5bjdJOVdmMEdWNmNmQTRLTnZLZS8wbEhTa3Z4?=
 =?utf-8?B?b213bnJHOXlCWHo0OVBjQWRmN0VFQnFpenRNNU5pTGNRcG5XV1RXcVJzOC9o?=
 =?utf-8?B?NUdyQ2lOMVduSTNSS2tZSkxjVnlNWUdKN05iMUlNb0E5eUlRQ2FQWktOYzlB?=
 =?utf-8?B?VXpBZlN4L1ZTT2xKM2E4SEdURHV3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UKwyjCUGiKJgrlqwCjN2VWT+klwn4ohnjv0mPZBmOjyROx9j74tJv9LCfdfLu++HS1twIRhVn478KYpAlwfXcph6FQzNnKRSAIrlr8ioI88sV2NkXI+IE2TLWyaheYBbIM9dw+k8ryhNGksv5/1mHxOEca3oRo2t+fEhng6u4bH9lRNxsGrMgoLfz/xKdAyXj1XGe9wnXFru2UNWOgSoU9a1/4eFAuJRn7G1uicGPA1laTsGvTHVdoW4spHWdxVCKdXUyL+I5MFB4NalQsuO7HLan7pkpvB8NRp5XJ7j+lsvQCT6D40mgf2cQqNNRWPyFXrZoMjAbDMWsKgpEpAI3+jC2Tn6Wh4re2TY3kD1oEkB3NCA8oXDegx7YmqfHrGcaaLm6rzj6bI7zpZJgDN9/NFD3DGevxPf50kXKRjpNI4npdaE2RD3YZ/t5vGUvqOA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:00:27.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d7a166-dcff-4f79-dfdc-08de67ebf5cd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_150035_519050_9F5862D7 
X-CRM114-Status: UNSURE (   8.19  )
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

Add RISAB1/2/3/4/5/6 nodes to the stm32mp251.dtsi device tree SoC
file.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..e9d8338b2017 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1733,6 +1733,54 @@ pcie@0,0 {
 			};
 		};
 
+		risab1: risab@420f0000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x420f0000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa000000 0x20000>;
+			status = "disabled";
+		};
+
+		risab2: risab@42100000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42100000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa020000 0x20000>;
+			status = "disabled";
+		};
+
+		risab3: risab@42110000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42110000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa040000 0x20000>;
+			status = "disabled";
+		};
+
+		risab4: risab@42120000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42120000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa060000 0x20000>;
+			status = "disabled";
+		};
+
+		risab5: risab@42130000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42130000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa080000 0x20000>;
+			status = "disabled";
+		};
+
+		risab6: risab@42140000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42140000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa0a0000 0x20000>;
+			status = "disabled";
+		};
+
 		bsec: efuse@44000000 {
 			compatible = "st,stm32mp25-bsec";
 			reg = <0x44000000 0x1000>;

-- 
2.43.0


