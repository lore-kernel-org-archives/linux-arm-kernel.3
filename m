Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40351C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 22:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhS0MRs51450ucjry/4WIsoP8EL3uODMTsHEAaHFdZ4=; b=yZEYEiK1QOw9iRSYDc+P8RRqlV
	7qWmhr2dEa+2+07A1AW7iUG+CDxTsRL6ARxFxEpOjHiPEv0qqk841XC9b7N0jmW3Srb6K6etDDIMs
	LdtLnDNgRi+zaHL1jwwxEhRm0m6gQC7WhK2dzGGGJsXcmYtQR32ly9ApZhw0nsGRB1turypsH6d6T
	lyBAK9mLdhbgO1MPh5kLyHli36uIDe9fc5Z7B3o+PQbLQKVfn+F+CQmi7ikO6TK28egYjDHnexBgD
	4xuzFtqnyPIhZrMG610sZsoJO2zKHrqt5oL+7cviefvHAsFKdFo0yN5KeZa5PpDY1yi80Wk2vALzn
	wfHaNN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYHi-0000000CxBl-2gXF;
	Mon, 10 Aug 2026 22:15:54 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYHd-0000000CxBJ-2kbQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 22:15:52 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67ALc22d244299;
	Mon, 10 Aug 2026 17:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EhS0MRs51450ucjry/4WIsoP8EL3uODMTsHEAaHFd
	Z4=; b=gnQMiYZnDg4GimRTfvCxFX02U4SnRJJqmG99BStiKO8QPermqqG3r31Xz
	Wd/P/O0M1QvdvXdQ9eRYSuYN4QJO6fCtfcxF0t96QHOzDShAx0Gv3Mmz5BZXvjNA
	ZUPk+r04tkEDvz4KGZKwKcLr2VgegpjljcmJiMS3r0w4zsDOJBthy9HP6KbLvOzB
	i2X2vwwPcnAq8nN/smSvh/vIJ4PBRN+SMukQ1iwxVwaqyJVEqDDCrPisiTvBBULy
	aWnnHhJCRpVCys3Oilg4A4MGJwGhfGkXNGskoKPT1EPrHhGYDirzBhMeeXt1hd8w
	h1phD7so2MpgIQigkz4E8tfVxDOBA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt7cf4b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 17:15:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH33Lzshr/rkp7NeGfoazE0NBYFeCS3CwCQZ0u+PuOdHfQV6vizPk6uVSpN65k7bvVWtJpC0Tcfttd14ze7+tGJ+cp5WYY+jymcQPaI1BqyV3M9vpdGnLaXooRv2KTqrXV91pvYCKzAGFuRX36lxGODW9WqOSSdEJBC4izum1GCrcpkPsiyRId1FHRnzX3+HnQtz7cIFa4/5yx2/RizBPG77Gy424uO3VG7qyUfLNrTQZHTEpyDBpQC2MU6xByNxlRaat1I7yytWGS/CCwGPeK0S/cMrittCWe2ZcP/IXjahCsr/CZ9A7/QXbu4u/UFGvdd3LHrnHQUJq4zi+kKucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhS0MRs51450ucjry/4WIsoP8EL3uODMTsHEAaHFdZ4=;
 b=pPyIhaYjIyqPnVAJwbE/5eHZ/rR3OFqxYNPsq2hxkInviAYw1Y1hzyb7txVS4BY1Z/tuTJm5tYAT/mWahcRuj2bd+T1YcA3PzoF4VW1FegR4lTTBdNlVBUQGdOIoIz38WwmKZ1Sd7hHPcag8ZmXEyweV04fYOmmINTmJXy3ZWO2t1TsAQ5frxQiTjUBkup7YbIscV0L95yVHaZfMdtQAyeZ5S66/mRE6SZD4ww76Ymhu2bfROS3uHArpFvm6vAlh41+Rzonft4gIHTBYImB42JeBT0rlGcAt+6vBx4n/pdPc0ysKGm9M4oAaTvL90jeeoBWj8HGPr5iYD+NLW9Ohtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhS0MRs51450ucjry/4WIsoP8EL3uODMTsHEAaHFdZ4=;
 b=fxfykTADKDFlKgSAjaYta8uca5T4yNKIyZSSdpHMnyjWUs71tO5/9L6d6uwaL35IUxsqBQQebHXbd+lK8rQxFzEFwrsWn30qyZAop0Y7B0B5y/MeuU/3jrLOXSH6E2ARzG5GEHdLsrwvjr6bvqBcG2Th4gDgljLoPViC3zvt5qw=
Received: from DS3P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::14) by
 DS0PR10MB7151.namprd10.prod.outlook.com (2603:10b6:8:dd::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Mon, 10 Aug 2026 22:15:42 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:45e:cafe::93) by DS3P221CA0009.outlook.office365.com
 (2603:10b6:8:45e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 22:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 22:15:41 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 17:15:35 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 17:15:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 17:15:35 -0500
Received: from [128.247.81.217] (ltpf5gwk6l.dhcp.ti.com [128.247.81.217])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AMFZ853973134;
	Mon, 10 Aug 2026 17:15:35 -0500
Message-ID: <b6f486c3-9e99-4a2d-a016-f6d45d9e33e5@ti.com>
Date: Mon, 10 Aug 2026 17:15:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec
 clock from audio_refclk1 to external clock
To: Jared McArthur <j-mcarthur@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, "Tero Kristo" <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, "Nishanth Menon" <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Moteen Shah <m-shah@ti.com>
References: <20260804210558.1455777-1-j-mcarthur@ti.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260804210558.1455777-1-j-mcarthur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DS0PR10MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db33f2a-730f-4793-d73c-08def72cea2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|13003099007|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 34gUkU8sSaM8Zm3En0KgruYgPPe14D+EJ1Zcm5cDX3QGPSz7qJQUitPPy4gWG1jIUn5d8pyjHztXc6xXAJwmGPLRCAr2llf4y2LfkxopElSoqS3IN6wjG9ytKw6bR5bnfII6MFQcicjtAPQH1zOVELmJaPfwdJUOmlgme2NrwiKWUIHyRlm5Dq3p/ua2PXOJ91M01y8ibopimEgauFVyDtJA85iF46EdT47dGtcrl3Pk25s38IpztEJM5qXkzf8DqvGY/L8V5ztQgPKXGnilmdihFJsTzYQruQSwqo2emnIdVd0njgWv1gUmZBWizEdCY2/1VWJC7VEMAjo4w0TtPTsUZJCImf/JKKeskX5TG+CBfBoSXs2oR7UCRhkZW8B7c/h5sewwMYkreCvKbrs6vP1ROQ6NXqc/u2s4AWv1ZLclPJi7hjeaENilluQODHwJ5X+Y9nDMZ4IfhjnLJDJY+dfusBlKCQB/gil5AZ7X2q9OpQs/zCAmk34eQYoSe3WYMbFTX4oRotJdOEhGpnxu/sc51TtolD5X0F1vvd/fFgRq+grvgNLEFaCiydf+Lrx6DRHthjggGizc9f4koNxjtV+A9s7uWF2WY11N3oCsFE9Dwdxf4JPTNFf8zRJcSpyiqg1/BdmIvTkIgrkTSqTNNVZmLki+v0a2f/+7kvwWmSZ0Yj+T47BQxDydcfEr58iMH0+yPag7qXNT84RgRAjGcQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pviZD6vDy0pB78TwYcxzVx/OH2PrPIiNXlzuwtCbZxZmp5VS9gNNUb78xK1Qtpaq0Sq5hQBSArYE1J5T92GV8ShgUiYZQD4Cy+P1j32qublan64kpV58l+aUnL3vnVO4RP+AXZofH7uIo5wAwY8v1qHc77zISN0n3O1CFpADWsDZmY9Ew9TOVOU9oIzraU2kqLahWCNSWcwTKT5N6Gbu5YjwKo3FXiTitVDGwlIaljIJrOv9f+GTIHrCHg2L08TPKpghwttajfMkC1a2l9FHEKBxe290RikiG9tZh5dU0+FiyqrgtxC3NpoX2YtzrLCpDWi4CviXPe2G3pjbINROEcgq83IeT9N7p66T30EmTWVKMeeUzzmkEpSmifq94sW/U+xjkiUKACFikkqPPENi5TEtfsXd7dtE7NS3uc+sARPhOa8bWuEx2IEbit80lgwZ
X-Exchange-RoutingPolicyChecked: cZk5f6Dxqesgm8N/vTeDuPIxjou34Ssg1i98vtSg+1z318G7C+CHaJkY/KaqumCvGJAsQh3Yu6RdXkWl6iLKUWOei91mzK6j9/wsrd6LBTM2RSOwIRvQ7iH5OCPIXZwjH58yUMsmG7y3m4DNfRtSfkzhyIfAA7kXszYY/RvHmMk7v5IrmTHXsPPaDellbTRh/dXhHDxo2Clf2DCy/+vEW0+UHlxk13d1c/eD/GZMTkob87sBEwRCjzQcJq76mJqfvVO6O0cSfgrqMoZ0J0/xSrNcIccDLAFMakBJ+BgQaZk5pacLrB+9V0Go0uSL2B+rEcTBfShYNwsnmUM1TWrlvA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 22:15:41.1530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db33f2a-730f-4793-d73c-08def72cea2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE4OCBTYWx0ZWRfX1jGpf2X6KZ7d
 BD00nuH//nLxc6YfnD0rUvXgAgvH6Upi3csDmVMwYdg1EKFFx/mWcGar5yZrmJC5HnXV1TMzEfz
 QAGkzef+ZsS+S16f1ToC003wZGV6zqrsmEubEh/FY21fQA82VG/zIHdXL2uijT/DG7tzgFOpmtK
 O4e/kAQAU8fsaTC9LyzS16F3HEFNxtWahivuYQIKwfytfJS2woP9Sz/FUlputLCb+wEMUiisl9r
 baitEhWwFGYdb6qf0TbLOc8GYsmvYzWt3J5swOJtsJiadtgdvWsIAKkLYzOZ+w6UWm0hvmAMzpS
 q5zW81ZlcITiNSHrYPbU+ecxg80Td29t5uZMGMUA1RKXw/VyJCuBS9ZQFxrtpIobhKntRdQ9DdG
 bFkOCiFL5ND87Uh/tSlTBQkq1tUVu968aIssMskYpC1EqEPZ7JoBHO34kj/C0a9AYOry4zVNT6q
 DGPhXZQka1fLb1/G1fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE4OCBTYWx0ZWRfXwH7GwugnYIAj
 UFXV9sE7RBqwdDfkOAdsSiTb8rsOqTXCIWNwwHu/LUj5bIbLq+9d5EkJTU/PS0wgHDV6+d6aOrN
 FnXfQEHQCZITjFmaXW4bJxG6c/gpDzE=
X-Proofpoint-GUID: JPxkAbR3Tk3G1GAjuO7R7zCoKv-1vli7
X-Proofpoint-ORIG-GUID: JPxkAbR3Tk3G1GAjuO7R7zCoKv-1vli7
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a7a4d92 cx=c_pps
 a=UNZgSj2+zgRPHH//f1mBVA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=iRONcHeMQSG4BGV_9HcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_151549_851083_726E1A36 
X-CRM114-Status: GOOD (  11.25  )
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

On 8/4/2026 4:05 PM, Jared McArthur wrote:
> In revision PROC170E1 of the J722SXH01EVM [0], the audio codec's
> (TLV320AIC3106IRGZT [1]) MCLK was provided by the AUDIO_EXT_REFCLK1
> (96MHz). Revisions PROC170E2 and later switched the MCLK's source
> to an external LMK6CE012288CDLFT [2] oscillator (12.288MHz). The
> PROC170E1 revision of the board is not publicly available.
> 
> Fix the audio codec's clock by creating a new fixed clock node with
> a frequency of 12.288MHz, and switch the audio codec's clock from
> the audio_refclk1 to the new fixed clock. Remove pinmuxing and clock
> muxing for the audio_refclk1.
> 
> [0] https://www.ti.com/lit/zip/SPRR495
> [1] https://www.ti.com/lit/gpn/TLV320AIC3106
> [2] https://www.ti.com/lit/gpn/lmk6c
> 
> Signed-off-by: Jared McArthur <j-mcarthur@ti.com>
> Tested-by: Moteen Shah <m-shah@ti.com>
Hi Jared, thanks for the patch

Tested-by: Sen Wang <sen@ti.com>

