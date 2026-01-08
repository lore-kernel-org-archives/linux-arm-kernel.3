Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89758D1D47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfvjySJuk1KGX6x0RdZ+F2Xeb/kK9ho37zBWOdUHfu4=; b=kawgKA0UVgIolbbyCxSQ+4KAiY
	CLd2Ompy8XDt9RvlFuBp+KafIgFF32RayW9aauRG72sjp3pM+jhKyx/T+RQqvyHmzslHpot7GwutH
	0iZIhRWP2qaaqiSWpvzhE1/tSJkqMu++NwThysIHCZiSDKQSyjxJ/pRqXVZuWOmi3l1//WBOGXs78
	tITr0FdLDpSACUCSCUDCChIxs73q/jIVpJG0YglRnXzZRdXYU7yScoWvx7KaoRcUdjnJzMPIpT1q2
	CjgHE/GHyXZHhwxs5xhdsQPd3WWfWurdemafbouIsukyEPPR52FrYhi9uwntJf9wZ9yB64SfFMC+b
	Pk4H0ZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsTc-000000002va-0OqB;
	Thu, 08 Jan 2026 16:03:08 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsTZ-000000002tw-025m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:03:07 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608FvNKA2215644;
	Thu, 8 Jan 2026 17:02:57 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bh6yarhh1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 17:02:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNt7L9Cx0r68WmsXQikNjyS/BM0i9jlRa7JcYA6XAPJIEIATPf/PIY9v/ulceBR9bRFat65u8wYS0t+ALhrQs1pxGRR1bxYAC/qP2vzvPET7B/kkuJARXi4MknauEKr9eVR0hDOzYwYYkk2GTb6lDmeceh8Lyxr+Ou/VubyogmBwP/Mjn2VkmAB9QS4ALzsf2uwetXU21aPC84r8BAVI1VpkLnrCstj4+4CZ4P43vCdMhbz6H7mW7+aI0VEbAOfNJDzcTOTiY7pdqGes/nUSYKtyrrsVG72lpXSPGB7f1CIOGRofRAST5mxkXceIh2JKBRv+akkYRWqKR1wssgNv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfvjySJuk1KGX6x0RdZ+F2Xeb/kK9ho37zBWOdUHfu4=;
 b=YSAyy2zTuw2op0VbHzaNgqnoQr3XRJANlL7XNHJtvhmTb8caoGvgeqCZnaDxSpg0VP17x16H5CHQONYHx6eezclNwAGc0p+lgTQG6zoUovBfS/rjX7WK72rA5JgoQDqf9MQgG4pnZX5Ojncn9e9nyqDiiwdoyghlTC7rmQX7d0S+88OzqR/SXGTPPhyxFsMNPuwpNr6X+oBEj/sfsjR4oFalpP+a3qO5DnV/WrUID2/TX2eqPynmVCdc2lo3FneRZoJ8nKsF8byKGelTG+y0h1NC14xyOwnvI55yIDuAE+IoUNkHFTXt34o5KfqwtlYuefpwTQk+UaRe9pMUzpJdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfvjySJuk1KGX6x0RdZ+F2Xeb/kK9ho37zBWOdUHfu4=;
 b=K0m8x9WLheYapF2JkyTbmYspxkUNyfHI+bckZudiKhkDS7OooMD0Yb3cxkMFn+yFrU/cH1UOmnOZiBjAb3EAvObIlQskRGbByePrdNIFS1wV0qRIJzMMy4fA5ZSHr4ltskB5Kg3y6E+vJoGfpUoFw1F9FCeroCMushuliIk0wnXjvCPt6y4xlF1YTjb5K+/L4ukfXm6qMJYaPgym0qaZWt2vxRD0svHUhoXnYqC6rduQq0f96dzZHLObeeGN6nlKEJJ+FGtX6NkN5zfKvrEfFHnjV9hZK/Ja3eckxa+agM5wk0GnoCUo9OQ99JIcuVEuyxWmYLWxcc5RZFmSDDtNYA==
Received: from DUZPR01CA0274.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::13) by PAVPR10MB7034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:301::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:02:52 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::7c) by DUZPR01CA0274.outlook.office365.com
 (2603:10a6:10:4b9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 16:03:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:02:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:04:08 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:02:51 +0100
Message-ID: <9f8a984f-e246-4fc9-8004-81c0c5b3dcb7@foss.st.com>
Date: Thu, 8 Jan 2026 17:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Add boot-led property for STM32 boards
To: Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|PAVPR10MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ea669b-0cb9-4c14-17cf-08de4ecf610c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHdBUzZDWi9BTkxLTk42YWUxdXVjaFVJWDRKL0ptYzNTRGs5YWY1VWVPelNy?=
 =?utf-8?B?elJldkx0cEVUUlRnZ3owd3lBZ2RscGZ5dDZvb3JKcTdLRldiOVQwUDFwa1Qw?=
 =?utf-8?B?b29zSGVaZmhFR2lkWFdYb1VFNnRYbHdNVk1VcldhR0FMdmIzZXVJeGRTRzY2?=
 =?utf-8?B?RFJudisvblVpUWdVZTdCelk3dy9rNGVFbjNkUXQvcXhJb2RQUVFHdDlmOEl3?=
 =?utf-8?B?WXJxS0l2a0dkbHVtSFVRYWJBN0xFWWc0Rk5ZeXp5WDk1VE4vck12RGdkRThi?=
 =?utf-8?B?OEcxVU1KSExSMTM3S2hidVFLZ0JuWDkyNzVPOWU1YmlhTjZLTWlnZDRybG00?=
 =?utf-8?B?dXo5RENabUVNcnhGQTNJc3gwZkFVb0pycTdGZGhrSFI4NTJESmtmSUZDR2FF?=
 =?utf-8?B?MHB4RkxWT29tZ0ZvbVB3enRiS3NSeThVRnNiY05mYStOMnpkM3gvT0RPTEpy?=
 =?utf-8?B?ZnlNbzlMVmVvQStZL3dnMytadk5YMnNsUFJvV0JabjRmcVo2YzZpZ2NObWJU?=
 =?utf-8?B?NkZrM0paWmZ5SDNMaWdLSTdXRnZMYWJFaHFHWGV1c2M3aTA4NE5XNE9ndzdu?=
 =?utf-8?B?eW9ldHczbi94VEs4NmYwYS9MdGNYOXlEM3VoSE5TdmUyb2NTSlUyRGxQMVV4?=
 =?utf-8?B?Q1MrUCs5Uy9YeDhYc0RSSDl0YlRJVnlDSktmRHIrN24ySk9Dc0NxU3ppSUI4?=
 =?utf-8?B?SnYxdU1LNWh0ck16a3Z4Zm5JbmpsdjVmUG5nUEhHYzJIcHVDdXErenFIcGZN?=
 =?utf-8?B?eHdoN3loa0tsYWpRZklZb3p5bUNIUkVZeURDVmtFdTg4N0lCWlFjdWcrZW5r?=
 =?utf-8?B?ajR5K1pkQ1RyUnA3eXZSSEhhU0w4Y0V5ZzlSS01ZQXFJRnl0MmJlNFpFRWJD?=
 =?utf-8?B?eDM3d2o1bjIvWEh6Z1c1S0FZaWVBN0xsVm45UGNKUnViMURwVS9WVnpVRU50?=
 =?utf-8?B?NXhJVTMyYUtKVTBwbmU4S2poQmY1MlN6N25kQ1lNKzhPd3NIY0JqMWh3a2k2?=
 =?utf-8?B?QjRzOUtYNkdOWlExaW1zMThSWm9VVXcwcHVVR3J0RkovQTc0ZVdwb0M3OE1R?=
 =?utf-8?B?dVNRRXVNVHdHajVTSVNROGFOU3A1SE8yWUE0aS8wcEM4cWY0dDBkczlmRTRS?=
 =?utf-8?B?OURscTkyYWNrLzNxamtleEQyUklNaEtsL0VRTXpzMmpkRUVuSW9vNit2eWxm?=
 =?utf-8?B?Zkcxd1BPTWgyRXkzN24zZU4rTDkzRElqTXBWUDZ2Q0lyaHlnc2VpQUpwTDJJ?=
 =?utf-8?B?QkZiMk8weUVNOXBqM2pZckZnVDRXWUs4WExtUmRSOE4waFJWS3F3NU5IZFlq?=
 =?utf-8?B?NEw3WG41TGVhdmtuZlo0UkNzeTQ0OEZPLys4WnIxbDlEQ2lObzBXSVRKMlNV?=
 =?utf-8?B?YVhIci9PMWNiRFRiSzZJQStYVWUwYklpNUhnUHJrL3ZKQ3BVaVY1N0FxenI4?=
 =?utf-8?B?bFJtTmtPekJwRFdmUnYzSHZUam9LcWRPdFZmWElUcXdnZ05GbG0zWVIzcWx0?=
 =?utf-8?B?MEd0eXczQW5PN2p3bUtrTFZJb0pXQnZxVWxVYjRZQXhlZFphWWJ2SEJwbVJz?=
 =?utf-8?B?cHFOenlTd0ZhNWErQnN4SVdURmw1SFlPeUsxdVlqZkxRSE9ydFJFUHJjb3ox?=
 =?utf-8?B?RGtmcnNpcjVxRGdsU3IyWWN4NEJ6SWs4RW40Qno2RXNzaDNxZkhaVFhKY0dX?=
 =?utf-8?B?aE5wTU5yaXZwLyt6ZksxLy82dmVPYWVVV3RLdWtKcytlL3dCTUw4M084ekZp?=
 =?utf-8?B?SDFmT1E3cDFKZXhGZFJCYW1tcUY0bzlabFpPV3N0R0xvSmtabHhqR1lldXB3?=
 =?utf-8?B?R1NlOHdNM1ZCQUtSRnBTeVY4b2NzcFRnZVJUYzJwMk9EOXlTYlVxQkNoTkRV?=
 =?utf-8?B?QWhLL0lvamI4Tyt2b1BHWS85dkhSbnFIdlppR2dqbHRTMWkrVDBVdEVhVXUw?=
 =?utf-8?B?UTJacE4zOEx5S3o4UkFpR3A2dmdjMEc1QnJlYkdHdFpVWWFmamxRaTFKNFN1?=
 =?utf-8?B?RWRNR3FsMXNiTTJXOFJWbnV5RkwvQnk2cHlRWlcyZVMxWGM4UFZFYTdSTEgy?=
 =?utf-8?B?UzVlL0FWbVM0aHFHbjExeHlMbFFZYWdDVE9yR09mcnN6aEVmejRZVEFFRWZ3?=
 =?utf-8?Q?0/VQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:02:52.5358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ea669b-0cb9-4c14-17cf-08de4ecf610c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7034
X-Proofpoint-GUID: EmTG_TLzngcqEd6-fFmKmxdIAqkO3pX8
X-Proofpoint-ORIG-GUID: EmTG_TLzngcqEd6-fFmKmxdIAqkO3pX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExNyBTYWx0ZWRfX2fxAcE8sq+x/
 GoWuyyWriw6VBK9BJUM+bPFMu7VfIYswirBQJ+hwufHflTAIONUh5Oqfjr06s56py/WL87r05Lm
 P0Ictf3gQUqEW0quhJ8zUyh6TAmeKgnwhNY99i7SnwpQzkf135ZL9MleYC1HOGCfykv3RYhnM4y
 DcPLWU3GLdqJ1shL3R0WdmexViJE47ubRraPAfvg/DtuXY+K1ZKwZuI55yJKGaewy/z3mf9ol8r
 BVZFBjETK9CjCKLQXzd8LwqKtOIQS5GyJ8xv2sB7vuuaFXU6wrUR++zED6TTtilsWbPArtGU0km
 8qyGh1JvrAczriADH3urG4qcsVauRod9RUJcv2F1Ush6upRG+tF8C2rFKo0y6n1PRvoUo76VLhW
 scZCMua+0uQcn3aqNFuAO6Or3sKoNb5UQkWv8+yMwaq+Qo2iOv0r2ZF2NxAr+m3uljkAteeDDvW
 ZboGLNY4ZiBB/eQfFgw==
X-Authority-Analysis: v=2.4 cv=MY1hep/f c=1 sm=1 tr=0 ts=695fd531 cx=c_pps
 a=kB0SkaDTNnQoKYYLKJpD0Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=M7YQj41SyBgo2ukcwREA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_080305_341288_B53D513A 
X-CRM114-Status: GOOD (  10.64  )
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

Hi Patrice

On 11/12/25 16:48, Patrice Chotard wrote:
> Add options/u-boot/boot-led property to specify to U-Boot
> the LED which indicates a successful boot for STMicroelectronics
> boards.
> 
> The heartbeat LED is used as boot-led.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Patrice Chotard (15):
>        ARM: dts: stm32: Add boot-led for stm32429i-eval
>        ARM: dts: stm32: Add boot-led for stm32f429-disco
>        ARM: dts: stm32: Add boot-led for stm32469-disco
>        ARM: dts: stm32: Add boot-led for stm32746g-eval
>        ARM: dts: stm32: Add boot-led for stm32f746-disco
>        ARM: dts: stm32: Add boot-led for stm32f769-disco
>        ARM: dts: stm32: Add boot-led for stm32h743i-disco
>        ARM: dts: stm32: Add boot-led for stm32h743i-eval
>        ARM: dts: stm32: Add boot-led for stm32h747i-disco
>        ARM: dts: stm32: Add boot-led for stm32mp135f-dk
>        ARM: dts: stm32: Add boot-led for stm32mp157c-ed1
>        ARM: dts: stm32: Add boot-led for stm32mp15xx-dkx
>        arm64: dts: st: Add boot-led for stm32mp235f-dk
>        arm64: dts: st: Add boot-led for stm32mp257f-dk
>        arm64: dts: st: Add boot-led for stm32mp257f-ev1
> 
>   arch/arm/boot/dts/st/stm32429i-eval.dts    | 8 +++++++-
>   arch/arm/boot/dts/st/stm32746g-eval.dts    | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32f429-disco.dts   | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32f469-disco.dts   | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32f746-disco.dts   | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32f769-disco.dts   | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32h743i-disco.dts  | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32h743i-eval.dts   | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32h747i-disco.dts  | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts    | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts   | 9 ++++++++-
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi  | 9 ++++++++-
>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 9 ++++++++-
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 9 ++++++++-
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 9 ++++++++-
>   15 files changed, 119 insertions(+), 15 deletions(-)
> ---
> base-commit: 329ef1e3a91600940cae9adbae08f2a157aa51c4
> change-id: 20251112-upstream_add_boot-led_for_stm32_boards-3815f2e9fd9a
> prerequisite-change-id: 20251112-upstream_update_led_nodes-30e8ca390161:v1
> prerequisite-patch-id: 67ab2e4482e0edf07c7144922669aaeef75bb800
> prerequisite-patch-id: 83333194d9de46872e5fdef3a7c28246c594ad89
> prerequisite-patch-id: b5c7c9257a8e9badd14efc3d325ca319c5c2bb17
> prerequisite-patch-id: 11ddd0a8da81152cf1614fb7f7c46e7f090725c6
> prerequisite-patch-id: f3efa9052e5d0df9ebc55b91aecabbd7cd2c7bb7
> prerequisite-patch-id: ec053fcbced6d1d0ba61b7d40d4f14d2a14fb680
> prerequisite-patch-id: b2fe9787745761fe56529f033f0a713f140e4280
> prerequisite-patch-id: 8760acf7bf81c0969307de081efec34032a4f57b
> prerequisite-patch-id: 2c27c9bcbaa4961e6a907e269b46aca7cf40ca38
> prerequisite-patch-id: f79aa19a1e76b0604d410e5dc56436ef7884d60b
> prerequisite-patch-id: 1bed61c35e48271b4e56c43695edef2e0c819d55
> prerequisite-patch-id: 7f73889eeb54d1d54f5c441485e211aa45b94035
> prerequisite-patch-id: 78a98bdbfb3a13beae5fe234f799239be7b4b3fa
> prerequisite-patch-id: d066a879ebb950227d941f6abac320e00e964b50
> prerequisite-patch-id: 3540a2861aa07db77641671ef32823779fdf69c1
> prerequisite-patch-id: f361e230ad24fd006396fa717ee517d72ad6ca40
> 
> Best regards,


Series applied. As for your previous STM32 leds series I'll probably 
squash patches for my PR.

Thanks
Alex

