Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE70CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Xrs85Ebn0nGM0UWSvtiEb02s9P71GwQWjUWGiLgHJM=; b=nWJZgJnID0vEWndbttDhI/KuDw
	PmIyQfJ5KeSo5x6OWrkvDPfJCPp84ilEvNo17fu0DQuTVEpzsIKgZtpPbOWGQMbM3Ul/rm4ihvH6q
	Y8PvSZHYFjqdEZfhF761B7nMPA1779wcNWhO//Etl/TvlnxPzC5pjSbCQvj293cpxHQxwnOToG2rr
	czlGHPE5cVxmPZHntMaiLWy/zP/Bmm7tuCs62eXkuC4XYMENfrdWaeI1XBlYEeR3Zbd0WOemj4DVh
	KFDjh9lysy4bdPV18oak35ehsFqIAFwSQfHcRASrpQeXiX6B19pxA0LUTg3a3QbXLVXbkQVjqlCRp
	uIfCwy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCQU-00000008FHl-2J7Y;
	Thu, 01 Oct 2026 08:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCQS-00000008FHZ-3bnQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 08:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3Xrs85Ebn0nGM0UWSvtiEb02s9P71GwQWjUWGiLgHJM=; b=ErnpBBVkWdw4Sj3HCAMmQaY5qj
	2fzvzMB2sOrnDaNgHHVR8JXk+soye5COnvs0AAeh32tO8WOmTNZY2Z375aM48WQAJWvo/WoZHJLi1
	P4JcodzLeW37SdUCdTbJp0mUh2ApyX459Eaq9JSoJLXnbEZMTD6OyCwUKHtE6p+iZnQVXGWCc96kx
	VTj/0h+tc+1iKoNwgVZ3cn9/zujjbvjj+9yEnufjpsMvi3W7+2VLaiPuS0fmPu9Nt7oH1CcXFozKw
	0zDBDcr5s4ySBwoXd5mg0JQcfOtvVIVGc1WA58+DMxgEG9eMTQbiBrv6SGJjuxZHRpVPx9FVs41qp
	luxam0Tw==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCCQO-00000004kpU-3Dgr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJ1J/qcbb9cK9d8k/566yl9HjJ8g6pzbebgceVfOLzkL/qCVvZh39OepWMCJ1Q/93dCnypZX4ANzXASCNZed3pAY9Y5ENumC/wrBw4WZYI3JWhOgv1mSydM5WZ91YgWJNR9PuZmgDdCQIlVVqdQ3tdpJKwVz+ho00U7LdkE7CP8e9wJJX5t2fk1bMKEqMdyNlOCI82Er6S5Fq3uG9PeskakY6L28v+gxnlnlTOyVRlwUQ7bVrb2cfJi8/IjJtcvzgjUaw3hjwzS7QGkAECPxSFYIR5dRixhZeJ9I7SZg95Jkp5ILmC7Ogt0GX0HwSjqZ3zc8gcidW9aF3MRrjQudYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xrs85Ebn0nGM0UWSvtiEb02s9P71GwQWjUWGiLgHJM=;
 b=kEU+5fuwnngqa7QL2EP90e8hU64Qp2++XX53f/c2syHdCbbZeaAB2ygf74a2uBaXJ6lP0boEk8Rv5xyJi23P6hFGFy8BPycZN3bBqLQGtGZ8bO8P1DrICPdCFa0deJQlGz2CAQhwmit0RBiw2rHQtaNjWmgOBbYyBqJWQOELEuM/n0Xt4cgnrVJPNv8Mvpzk/M3U3htTPe7C1tduGMgZeuPEZppBVFN5Aqrut2r6LtZbBnDuC31fWY36RYFDDKgkwP/wHAE4NsDNxvW6HKJ3vOvr8xAN7IJzXWmlQ07oz/xz09vd8rCNGs5sEY8GTKOxRtbrP96Pq6jtr0PtvafxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xrs85Ebn0nGM0UWSvtiEb02s9P71GwQWjUWGiLgHJM=;
 b=DtGa2OLmv9lqQSxGlRpL1ICCV8dhb1UjP6anhQaufGv2rzFaIrDuna/LzNO6jmQtLRVIf6IngbfzqleXW6uaPiGxbMVG+0SMX5LStjKfXWa/CtGm4oxo5UvGAqxW/XU8zdhj3SMRKegeLSKDB4C0bHOEqTIGx/pWV4T9cmVk7TY=
Received: from GVYP280CA0043.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:f9::18)
 by AS8PR02MB9912.eurprd02.prod.outlook.com (2603:10a6:20b:617::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 08:45:44 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com
 (2603:10a6:150:f9:cafe::ac) by GVYP280CA0043.outlook.office365.com
 (2603:10a6:150:f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:45:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:45:44 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 1 Oct
 2026 10:45:41 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: Peter Griffin <peter.griffin@linaro.org>, =?utf-8?Q?Andr=C3=A9?= Draszik
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, Ivaylo Ivanov
	<ivo.ivanov.ivanov1@gmail.com>, <kernel@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/16] arm64: dts: exynos: Format with dtfmt
In-Reply-To: <ba1939f5-c528-42b8-971a-4b16998c37f9@kernel.org>
References: <cover.1790629313.git.waqar.hameed@axis.com>
	<ba1939f5-c528-42b8-971a-4b16998c37f9@kernel.org>
User-Agent: a.out
Date: Thu, 1 Oct 2026 10:45:41 +0200
Message-ID: <pndy0chstai.a.out@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail10w.axis.com (10.20.40.10) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|AS8PR02MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8c8d3e-f98c-4345-6dd0-08df1f9861bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|30052699003|23010399003|7416014|82310400026|376014|36860700016|22082099003|18002099003|13003099007|4143699003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Kf+sxnawRR9yPrHmDjSluSqPWjmQALnk54rVLpj/6T6XftonDXOpi+svcUj0GgEz9xTYdGlSUjIDuDX+CH4/Gooogxt1pwlVYDDBHPt6Z2SbFSxAh4cmU+oViyKb+lYEoJEzR9cdCz7DTbQLg7sPS25aEKnl4IUmOHy38/tWlvbqYsaoFpbietTgOPD41o8/OvBWlfkZH+XGViE8Q08b3p9SujENwUkq9mEHa5o3gfAKHYS8sVGV2nFgcbaT42+jb+BOElsuXQORZqv02xYVUWvodXyW5sK+VrMEVkW5a7/VTWiFhvgT9uKTpXBQXktVIy1CmAjcGrpzYkb3DhB6hL+ruGid+RWhrfQSd3GF8Gsk/2qTYkqj2W/szGV28i79ByhvTFURrTdFtWvufL2RoZWA3tJellyPjPi5SCJ1Vd7IHC5LVgaWNN0Zttn77m9y3tz3rX5vgde32V7AxWNS+O8xU+Qy2fDfLJaOFWlg0/fHQPxzH0DwynkveKC5JSK73vIFWHFWefZbqI9a9TQDLl3upkvKeyZpFFZLx40feTPLY6Td3HEHVB21fyIKdFMRDn2Uk7EZ99jjVQgRI6FJcO7zhOgtAYXO93pXteVju8mnAawv4ECy7DAwUg7Uohk/UEqE2tLisw6x211ofpwuiRLJJ1mXXMBb6Vxb+mNgLvdj9JvSlXE8rroo3zPs08/WlUIOvY5Z3R7SvMg3xoSozQ==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(23010399003)(7416014)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(13003099007)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o/JuxvyLFCEsMY/YH8z3AdiJnEw8MSsidM6ztnPdUCo8ibohu5LIxqLq6u+XigNY3ttHIPDQcdvS8DIGAPOMSfrVJUQIVCdH0v07Yn7ABH2NKXVdUZAKHG472V4USGUgN3xYlEoGgBLACD+m/ce9n38z4NrsnPTRtITM7U1Mr13PhXWG6fpv2NSmwL2joC9axBCA1wuYMtdTj/SBf3Fud+1Bu2PtjiMZfwzHB9XZjZVLd5GlyTRr7GkoJx6xyTUknqtoweABXTHYYxxbyHU/sy6+fhcgoDVn5bP7mTB2zAN56ONAmro3+EWzmi1trBxNdqU11A7/kCYYe6tTgx5hLngFJuZp1+ZZd/ANe5O8nDnQOusP42RRulHpnpEurfdBoHzHA+tUKjME4zlCcICbUdewBjMS/i7eRNgMv1t/LrYEYaeOX7PP4cnyFE6QuBCJ
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:45:44.4799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8c8d3e-f98c-4345-6dd0-08df1f9861bf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_094557_049411_7A20818E 
X-CRM114-Status: GOOD (  14.15  )
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

On Tue, Sep 29, 2026 at 07:43 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 29/09/2026 00:38, Waqar Hameed wrote:
>> I was looking through the notes for the last Devicetree microconference
>> at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
>> working on might be of interest here: dtfmt - a Devicetree Source
>> formatter [2].
>> 
>> dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
>
> We do not use dtfmt. 

Not sure what you mean here. We couldn't have used dtfmt since it didn't
exist until I published it? Are you maybe referring to "formatters" as
in general?

I'm not going to argue _why_ formatters (for Devicetree Source) are good
thing to have, Konrad Dybcio did a very good job of that during his
presentation [1].

> I think you missed entire recent work and recent
> commits, where `git log` would point you.
>
> https://lore.kernel.org/all/20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com/

I did a `git pull` on `master` and started from there. Nevertheless,
maybe it was good to "miss it" and do the "double work" here, to show
what dtfmt caught that previous work missed.

Let me know if you want me to run it on `arch/arm/boot/dts/samsung` to
show some more examples. Or even better, you could play with it yourself
:)

[1] https://www.youtube.com/live/2Gput2daq4c?si=A4F2CvstRef1qD6e&t=28246

