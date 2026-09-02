Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615DCC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vhLwZ3zjMxy0iuyfjVLGIEKKQYe2svtlAw0FgFAvUw=; b=oKT25/JRNqa+dX7QiBGJ07cNvG
	tWVx2flTOpTV5A8K/zZL/kWuBjMmCx4Rk/j7HBc/9ppi3bk6S7ZbCY+vvhiluqcS/xQIPfo30Es/J
	8Cm/jzFYAKWJ9Fsmk4uPQWDFx26MgP20hDgohgVxiydgVra7xO88y7r/nbEFXUQ5bLP21ZyEmFivo
	Dx23tlWRAmS9q5slO6COQRenVWIuy3iK/H2PbaZyxUwOjZ+j1cYGPx/38/fpt7dOPSdGCxWsXxL71
	50MAY5Rgdp1ULDK+BNjYeHfIIkb7yKhYlNKyM6+PdIuWsRdK7mKjQZRYMp4MlkGf1dr/YxdEFxXMO
	2loUAmoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPR-0000000Fr81-29GF;
	Wed, 02 Sep 2026 20:18:14 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPF-0000000FqwE-1cUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:18:07 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682KHA0q1851403;
	Wed, 2 Sep 2026 15:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2vhLwZ3zjMxy0iuyfjVLGIEKKQYe2svtlAw0FgFAv
	Uw=; b=oMwR5A80bAQBxHQPDLqIw9DvgFVrTeYVE+BeyLaXa9rcbSAoIcgjnVhD7
	imAE8y41F62G86u7lsPqvT1dEwRM/XfG/Dso4qYACdMqsS5/GcUysD1k7vi0dmKw
	HUKzBxD0Bxv1lbbwof3G3ptKRQOKhtVOP8977Y6MLxJKta2S4G6jbpnM0Lt3Mido
	ubO2GHu+n1E+SiOWDcQ1hDDCXa/2zM/Yu8ygnbzMF1s9a6CLQSre5ZlczmnHB0YN
	MnOLoHm6NkQiLPxNBr+WK/AjtJ3eVpJUmcnnqa+ztSqd4125DM93ZmikOLHUgCeN
	jd9qodG9bQHKeIFrnO38QUD9LejGw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgex39-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 15:17:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faGnWpPEnLF1Vjg/njUllHz+eQ841Vj5alaBq9Vzooeqt06ghWwt/eWCrKOQaMTkQdlM1ZR+1WI94gIGCEpDRY3gENg2A1BDywFZtGYc3iiZoYC9cpsqPYxQmE84KB83p8V+wKc7jyPRm9Mu9W3AXzcrMqiGOy2o9pTxzFwyo4uSGs4j6lDBOdE6qEdIgWuVl13qPg8U7BqFYnYqcXmhnFfgLPD4vWn+wSOaf68bu3zBzZSvj+wU6xLjqAWeA/KFsgDGeCL3fLssaV42wX11CtxXilQIh49Rkc9YnYIrMwTDDJl8hBGbg5YGi2rc8XKzvsFIOth/CKZiqF7k18rDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vhLwZ3zjMxy0iuyfjVLGIEKKQYe2svtlAw0FgFAvUw=;
 b=stixvXJOyNU0NdiaMIAUIsNPXslgME93DAxGnnu7M/Y1t0imLA0mqYTE5KkxBhY3AGExB/Wsp1rv5SwQ07ulGShOaV0wl2X5nSGSw/UoZ4YvwuxlNRgJazVvfih9ovk/4xl1kM7reuaztfyzBq+uN0f8SQDTGs7i7LoVJr69bDhrdsnyVYC1uR30u04nwcglM8ekIcqRMJDPUXL220rDbtuORZhOg43SE2PP/Uam1KMQrXkR5pZ7fTJYNhcOJhdR80x4Vn9kz3LUHJF/mWDkub+/yO+cz4aVn8pHBt28b1GV6S3O7R24gUCwdrDx5Gp4oldM71Qfng8sCpiJEY5SnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vhLwZ3zjMxy0iuyfjVLGIEKKQYe2svtlAw0FgFAvUw=;
 b=ohxjDQ3afryMPCPf7gCm3xJu0l2KzWov9TrXMtnvz4by8vDezeD4AwOY2jAxPBjqaDrRCiHc6tgtfMIF+/TI1lnoD8gxQFUC6QlgcYL1Z89KNSOwOhk3hTKPjhzLsKqtDVzlUSMuFIQzh5gCxe3oyosetKitAMAry5ckIcpZm4Q=
Received: from BN0PR04CA0159.namprd04.prod.outlook.com (2603:10b6:408:eb::14)
 by CH3PR10MB6904.namprd10.prod.outlook.com (2603:10b6:610:145::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 20:17:47 +0000
Received: from BN3PEPF00022BCE.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::53) by BN0PR04CA0159.outlook.office365.com
 (2603:10b6:408:eb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 20:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BCE.mail.protection.outlook.com (10.167.248.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 20:17:45 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 15:17:26 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 15:17:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 15:17:26 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682KHQf01239699;
	Wed, 2 Sep 2026 15:17:26 -0500
Message-ID: <40282ecc-694e-4743-857f-78f8edcb9608@ti.com>
Date: Wed, 2 Sep 2026 15:17:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Support AM62P silicon revision detection via
 uniphier-efuse
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Srinivas Kandagatla
	<srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Masami Hiramatsu
	<mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20260812154442.3379851-1-jm@ti.com>
 <5b147a60-4d4d-4048-ab52-b5d956b68881@socionext.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <5b147a60-4d4d-4048-ab52-b5d956b68881@socionext.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCE:EE_|CH3PR10MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 7744e87f-9664-4414-d718-08df092f4057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: ndCHIDM+ln1xNXtD+apaxhL/gMHcK14D4ePUg/Zk8Vz2oc5TYWespPL5SM/coRq4rgH44Gtg6K5rylKjX+plNpOb5rS4M+oj+seo3lSicymDdXedb+AzKmj4k8M5FPAPyebKDOEns7Zbfqo79Gu1FIyV3SLmdqqZJlbjYMp7jIGpeKzbx1YbxhE8tswU0gmDLYapLnfEZ+xbK1+6FUSCAWv2nqPHr0QZxR8vyctpUlYXlj9dTSOe4hSef7G9S8IHd4q6T4NHMVjNX1kg1HQxsRrpzYgYOTsSM3jlr2AoQ5LlfTmUwlPibL0HNUSMj/ySoqLfAbIZIeqezwQ0pIgUKlSuQ9gQNrKgJG+qiTM5H97Yy9rXEorLB53YZ7sHbqfpknF2Vt3MbQNlI5UOsnOx89+OnJID6HQF76MUGrVimHOD5C16GaC7iaAwYJXiziw9tK3PWCh8PykXqlIbxmE9IizmMAazHgGGkwj+jg0GyBWMFZzNrRixG9qbNMNdFvTU7OWx8bt9VXDe7uFfrNDKyJIwvO1vJ7LkE1Jo+zGB1YOORUNI1oP0mzzpnre0BhDbfFE3JLFP2YqIiClbx+r0iRPLzrM0roWtNl3gKL39/MipFvjtMf8IY6wpADSgTT178pWSoAOLIgeq5alImnx3CuGv691PfBT3zUaxQDwRgduuQD9vhSGyZH3wA43eOgK4qo/HlVAn73EOHXmoS0yAKA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nyKTRs3bVQCrzQjWfF1muoSrR6LP+J5IuOSrs5M2+GlfszodRYw+5i2hukz/SkTReJUs5dIZ+XCN1Qb8WYmfC0pD2nbnq18h68SeETZiJmYeOYMUFRKc4gsomhz7rI+1rh72rJTLMkLQ7jzcGS2ULqGDX12Y1lAEL+Hqub21YFiXU4g7MXVL0DxRgU9NrRraxhlk9Cf3v7Y9Wff2MZf5UAu8k6iWpeVijuao3iGnoGA654BUIlTF4FHe5FjueEssB/c0uD/WYIDoi//uN/paRgNgxy9NbTDsVv1vGwu9I37nxD0E0ktc0KToNtIlQBCl/0OLRnaeSCJcri6qp0wcYlkiOJaiokrunFxXDGMfPHIEX3ULEEGObRoSbernAm0rmycIJZeM2dBmG5dMySAByRrjQRJtX+nPW73ddo9vMTpLbDGjRERmzt2NCkcfn0o9
X-Exchange-RoutingPolicyChecked: wOUGvdvdE2jRC1kRSWZEnXZnd7tw3n7Dy8djeohDZoTwsB52VGN6L80fUENcnfV8Y8UGeUrwkQDey7rlNWXTazG5X7yVKLdMfOPzru9WZW7R2SVmL5L5At5xttHEGkNC9bm7ogOn+yOMtec1heZqp30m1hLtQ1cUdSC1GmrqMAl/H41FKYTno48mMzSYR7CQ02q8boXcmod+p9fAw4Ms+4nZ6L0SQDUsukGkiMQgndatc4BnW7iflYZ3j1Z10xjLJCtBXWhxEwaPCGJ4Wfa2zmiUOw0GN2B++1cFwMG6kfYFVmqAHWkKzB+FRC/WUVyEyN6xe+EjDb9O4itZ9glkUg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 20:17:45.6300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7744e87f-9664-4414-d718-08df092f4057
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BCE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6904
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXx8FbmhCSOSli
 7xjJuOFzTBa9R4DdDhJfTtYOz4ksfURU+4BrasA5mPCXb0xDDOBlj1QQ4MR5KxueEkSOaIuBCJR
 pIttVMFfbnV71rJ2Lkx7LSd5YX22yrw=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a98846f cx=c_pps
 a=liM/1wbVBp7o1MBwTafONw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=EtPysQy30rmbLWofywQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: sUOL7gI_qeIEVDDVL74tVKYaThJiv7v-
X-Proofpoint-GUID: sUOL7gI_qeIEVDDVL74tVKYaThJiv7v-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX821uSwvysfoh
 N6xjGjnxpiNAnmr4uDkB1la+3BZHeIzYmzrk/QUh3Af9HozayBRl1edvCKCLrCRLRUTW2JwLg5k
 vsQGdFwph1eWnYdXKiNRgZo7vtVP6gKkZIdCgBNJwbUw8MZVUQJx8BhhcJLJmp2qs3SIAIlipZ6
 VyTUpYDlmmR5r4kptvCkMxbz81/OdqqEt9TPn4BiWy3At2NX8p9WIrrb5Q9ODB1vrtCPOvWT20p
 hGTOsB+ZVoG/mns/rLeW4+c8xNG5HCFLBvcPfH8y8l9xSzX2o1TAgU4/hpU4JRkN4tqfQqIEalc
 Ya4dDQ39DwrpWlEGdj4zoHZOdpzmDfYqzSWAZLFUbwzoIx9b26o1engoOluLeDAw752gMBAh29k
 58bDlK+W9md05LNFis+wVZyi0z21PLzPqkh2cgZbNpSdr8R/kzHm4m9hpsfstpmtZ3zG5nASxRs
 X/S0dJUa3tzTG84g8Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131802_027424_8DA3AA06 
X-CRM114-Status: GOOD (  20.06  )
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

Hi Kunihiko,

On 8/31/26 23:08, Kunihiko Hayashi wrote:
> Hi Judith,
> 
> Sorry for late.

No worries!

> 
> On 2026/08/13 0:44, Judith Mendez wrote:
>> This series adds support for reading AM62P silicon revision from the
>> efuse GP_SW register. The solution reuses the  existing uniphier-efuse
>> driver by adding ti,am62p-efuse as a compatible string. The three patches
>> update the devicetree binding to document the new compatible, configure
>> the driver as mandatory builtin for K3 architectures, and extend the
>> driver
>> to support AM62P devices. The uniphier-efuse driver is simple enough 
>> to be
>> reused for efuse register reads on the AM62P SoC.
> 
> Reusing the uniphier-efuse driver seems reasonable to me.
> 
> The driver is already fairly generic, and contains no arch-specific 
> elements
> that would justify introducing a dedicated driver at this point.
> 
>> Feedback is welcome on whether reusing the uniphier-efuse driver is the
>> preferred solution or if a dedicated AM62P efuse driver would be more
>> appropriate.
>>
>> Patches have been tested on AM62p SK hardware using SR1.0, SR1.1 and 
>> SR1.2
>> silicon.
> 
> Provided the functionality has been validated on the target hardware,
> I would prefer to reuse the driver rather than write another similar 
> driver.

Awesome, we send out the official v2 then. thanks!!!

~ Judith

