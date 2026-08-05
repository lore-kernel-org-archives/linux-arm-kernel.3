Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A50BC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkU+QMxOn/0mMOGBcoKTpiIwveg+I7Y4js6vyEK/7Os=; b=Be80k77D4eQq0VVV/FNBXIpVU3
	i7Ef5qUWCf7IQew7YErHWAW/fIPcu5dR7vIGl/F5D5ojwTYNyBRXGspFEv9YIWiS59O0qfpfsnNoQ
	CcobTYTu9vl3/uJxV8gGcyK+IhjiVy+XTrvMggQNJDxQXnMUxh967IxTameu22eJWIx4UMU2DAy1y
	k6Y/5s8JUmf0//5poG4Sz+4nzUGu3gD1x8789T0gqH76a40CtVJFQt+9K33JY231G8icn17g2OQSX
	li/LIZk/JhPQ36ddIWpbA6dUYotHAbw29aiCD5Fp32eu4rDEq1dwK2kcp3ssNgeiRvh9nyKokZ8xO
	gm0HYI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcVT-000000044X0-10ql;
	Wed, 05 Aug 2026 14:22:07 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcVP-000000044Ve-1a2i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:22:05 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Bxr9p1468796;
	Wed, 5 Aug 2026 09:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dkU+QMxOn/0mMOGBcoKTpiIwveg+I7Y4js6vyEK/7
	Os=; b=Ybcbx8a/aeEB3ZQioXy/m/P/w1RaK0EOUf77NeLgwnSTK+j5r3wbrRei3
	NVo8mrFmmsK4430KQDRxf+F2om2OiG0tVgox8Tik0hckPL+mKQReRa0f1j2oq4lq
	EaBqQq10vjL5Dym7ngINaUtiFP7tpKGq/4WsCNYlbppySbE0x19LKK4Pa8+fucCO
	i4+Uh3ZG1xumeG/vIvUZHAjicoZietJIc9WMxzHwMR/vAOiBcZsDgJH6rvEShxyW
	CvTIj/w3FgGwcSgUOTWLsxmXuyPhwzasEa0yCZOVDjapi8gH4JNuaXud/0DQrEnv
	K7p5/SHiodMD29cwnwosRirqYjWkQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fv43f175j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 09:21:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwufRzEctLMGhRPjHNtJxSgfV7juqcuSCGyKwG14V51r7caGVGc+Lm2IQHoOnSp+ak/aH/uwqKsWbxgtAR3l4Np2jVtCG34CPchxsiBsG8ZhNhG6eBXVxsaJO5b87neNmErDwdHPycBIXB9ZVqRads4mUKQMqw87tIMYkW24L/yCLavOLL6FDpKTMpnrqyZMwNBOTbuKgNmiiWWlqv9WD6U7XP9AKzmU909n6i/kf4ESkHGXUOkPXkUC49PbTD0tnAOTZ0J/gIryTiZXOpP5FirtD8Mg4T7lCkRKNXsW9RcuiHeRSsJUTELOW4EQz6DP23tzTInh3CHZAewy5UDucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkU+QMxOn/0mMOGBcoKTpiIwveg+I7Y4js6vyEK/7Os=;
 b=i5ZgF6Pu4ikLyFi0PYpiVrQ0JDvq5qXDxpoqLPj02Csyrf/E2Ec2v6coAONn7veN37zhcpTuaqM3u3rZ7hQSPh5vZrT8ENqlsGPu97zIfs8WwtZd33TTc6X0FpojNHt57dx6G2l5AACmPW2nvmfgybPPhVVQ4lPO9115d39VmHpU51/hqMy7SV1fItmsN2se1WA/DboE0rp/lZIQY8BOC++mqtLW+m9DDDJQmxo/Br7J6Edcw6ldjPIkXzUdx0ezXg4muk0h6yAl4iOQ7TQHgeR39UIjhLB9m+krvIUSRfpvzletrZYykKRKJw5KUl+KGMQXQo1IHaVPJ6IYp20/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkU+QMxOn/0mMOGBcoKTpiIwveg+I7Y4js6vyEK/7Os=;
 b=sD5BVdcp3YX/WgHjNLcIK/ZEGn9vUS41Bvjjw5cpIQ1eo2lCFWpknXID6RahOI9HjORoxppmG8DtfGxhLMpZ37vOqAFpAKmzwH+dJvluu9vsCkbnONSOlt0JD5vgNnybuZi9+eacrwmXK9tb48mkace9cK2pa1Ufi/1CtIRs5Ns=
Received: from BN0PR04CA0069.namprd04.prod.outlook.com (2603:10b6:408:ea::14)
 by PH5PR10MB997709.namprd10.prod.outlook.com (2603:10b6:510:39c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 14:21:56 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::29) by BN0PR04CA0069.outlook.office365.com
 (2603:10b6:408:ea::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.18 via Frontend Transport; Wed, 5
 Aug 2026 14:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Wed, 5 Aug 2026 14:21:53 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 09:21:16 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 09:21:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 09:21:16 -0500
Received: from [10.249.34.24] ([10.249.34.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675ELG2n1545257;
	Wed, 5 Aug 2026 09:21:16 -0500
Message-ID: <f5f59b10-a75b-4b86-875d-cc1884f5bd91@ti.com>
Date: Wed, 5 Aug 2026 09:21:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am62a: Set MMC clock pins as
 OUTPUT
To: Moteen Shah <m-shah@ti.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260805004821.416613-1-jm@ti.com>
 <20260805004821.416613-4-jm@ti.com>
 <995f20c8-77da-4054-8068-dd580507aa6e@ti.com>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <995f20c8-77da-4054-8068-dd580507aa6e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|PH5PR10MB997709:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0ea5db-ab6f-46ab-3f15-08def2fce60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|4143699003|56012099006|3023799007|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: r4WKO8HTUq0Yz4ogv224xmhVxSJp6f9LleIbDoGP0DAsO6RkdjkW2ZDkURuiW23aqewcVsraebNF9+IyDjQrsJ25aGQ5KNyk3OYw6t2u2UaYKStBw7+dwb8ZeIvlPtqh6uquhxLLzEa59DenLf0XE4wmcQxjSNrnPVfSkBCjs7255dRkbkIvl5/n4CBsZKUJmf/ekqplKxlW6PLc/y5RRZJuekPVnJAl7d47uUSTv1AzAOdntzQE2qTDk4kOLIhG/l9Q9RhPl7shr6lDhV9chiJj1bjfaen9P2At4JGQBmTbztV0p/S06BZYL807CWHVtR1nKaXf5LQspAH3m5X56nb5wGy1t+JGXlkr5HSDBWPnP6avE2HEG1gPzCF3qY0UWFUnmeqkk2h+UpWcsWeoEhsI4E6Du8HzW50mRCr1AuSaIaPRELfxwNfR7senw6+1RYtvdw9/hz9hq4sxRJUccKxoAtQPITCEIOCAn3O9aBBvVDGGPKtTGorVL5X84PvVfIW3aHGc7wB9LEseFVh0fkCrMCN+9TZXEduRBnOjDEqPMNSPPBL6R7857xtIPGEwkijSURnElOBh+Q3I5EnnWmiJv39loqnLfKjgsOCRzVG0T/YsD4RTZnhq8oiOX/o7d5bPnJeoDkD0WMmmRVG9AOMX9jWP5hqt7oqrKElr7Ix9iHNEOQMx9qG8mYOD4S7/Z+2Pgj8mAj4enPgAoXEcpA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vGTuJo1Okm/5joBT31H1jSirgL2ijR/1hOsZM3by4MsX3S8yeSDcT+U9mStsIy+7PgXF9aIpjA5a+4DnuY/uET+vEB19JTO1cBFI4t44RFJolcIIQqiWH/DHlXxQi+KTJXjyTpJ77LuwPXdHGGt9AX6huI17iGpFuRb0JuGM5DZc3SJTEV2vsOzMYuCWucosm0Hsd6woz+DObYCauOhASLuoxVHYHpliawpaxH/PnKCBOvTKqFlhmGX1K4cO26JP55o4xkx2W+LZ3DgGZFSsezMsWRBOFruRI34+PV1801Qy81FxZfJcF+HrqN/um3H12QIPE93NhWUdgp8otpL61hZI+nKJLPkYpBA8Mht5MUPiG/UEOuG+9o0PQBVLaamxnTPS3G0i3P04EbksulKVTBfEJjaLqyTqmijL7WwJMEiIIJmoNsWxq3GeFlwE83x/
X-Exchange-RoutingPolicyChecked: Z7ZahRv0PMVmwEh6hVZZEDyxQ5jUgdpaVetJy9wmCFyYMDLQN9xSVlYODow8oubfLxDUF7SfMIx1qTTpjDnKQK4M+SPrbjfRL1r24HP0ThP4cUlpLZR77Aom84R14SCesL8HIJ6pMdDIEbajaKs9AQCP7lnwE36eXYVeNW2bJfji0ExuC9bgk6C/YP0tZNNIITjbwmeWBQ8mqUIMhQehLZOhB9ERfdyEi8L0hOqbly7z8ZpXhJBHaG1KerJ75219WNwNejBj3KnaT1GSCpixdEbFqrJtyZYMwK9mAT68RvG/PzRbxmQyIStQgVzl2sJUCNMxV2e9ciDXWYkNURBeYQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 14:21:53.7340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0ea5db-ab6f-46ab-3f15-08def2fce60e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997709
X-Proofpoint-ORIG-GUID: 1d-BbgO3Nyl1Zcy6Vo4qG9cxD_OkUtdm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExNiBTYWx0ZWRfX5cB/ol9028So
 fqsEWgg8Ropmm9qlSdgWBpp1N5Ws42o7+Ymj70Z+BgDTugQ2KlAF74VXrUhj5XcpihkD5qT/2BX
 PWUSRdROul0UUDte0bfBcN1LhsA2S5M=
X-Authority-Analysis: v=2.4 cv=Ircutr/g c=1 sm=1 tr=0 ts=6a734707 cx=c_pps
 a=6I6wiI215fH6V9pCQ0JikQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=lzgAyehbnp6MyYyJ8VcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExNiBTYWx0ZWRfX+KO+U5lHAIf1
 iZDbz/6dxK57iz8ZuWawI3opYEWdlYyDQi/cemEiAEEviS0WrubNvOOWIrtMgttT7Yahl+Xa0II
 shVWYlW/THFAdxHFfRghNN8MmwncHHbh1gmY2CsMVMph95voLU9KnwPVLaQrxlAHuWn/dljygW4
 4h6zi7vPspKMbNGnvg/klBO9noKUbdBnvMamXOkCmOESPt17YVzzgudZEKiCrGghTQ3iB7D4VTk
 pnElqDG+Daf7PjB0ucJ+CMNeM5179leonz9Ro39DGOBEd2N7zuVtDc5xpGxXcT16LQpGnOkK0YE
 k5c6NNU190E15suM5qFqrUW8phgzjGkWDfH7pqxHQ4p5cdhUptIyhAg/LZXd9MGFdJZtQpVS5L2
 MS4Ta1JHsKPtm/VYHCd8V1/le7gMOjtr5E1VdBl7IgIZ9hGFZBxEnUJ3yl9XCf7HZfLiIvIxtqZ
 k61KoOvoQyF9IKyHJmA==
X-Proofpoint-GUID: 1d-BbgO3Nyl1Zcy6Vo4qG9cxD_OkUtdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_072203_684860_49A25EC7 
X-CRM114-Status: GOOD (  17.37  )
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

Hi all,

On 8/5/2026 5:56 AM, Moteen Shah wrote:
> Hey Judith,
> 
> On 05/08/26 06:18, Judith Mendez wrote:
>> MMC clock pins must be configured as OUTPUT-only per TRM [0] with
>> receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
>> PIN_INPUT to PIN_OUTPUT to match documentation.
> 
> I think this patch and the next one should carry a fixes tag.

Yea actually I did not send this series 100% correct, so I was
going to send an comment to ignore this version. I will add your
review tag for the next version though. Thanks!

> 
> With that for the whole series,
> Reviewed-by: Moteen Shah <m-shah@ti.com>
> 
> Regards,
> Moteen
>> [0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/ 
>> O Signals
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/ 
>> boot/dts/ti/k3-am62a7-sk.dts
>> index b04636cab71c7..e63c5200a2370 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -328,7 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) 
>> GPMC0_CSn3.I2C2_SDA */
>>       main_mmc0_pins_default: main-mmc0-default-pins {
>>           pinctrl-single,pins = <
>>               AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
>> -            AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
>> +            AM62AX_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
>>               AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
>>               AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) 
>> MMC0_DAT1 */
>>               AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) 
>> MMC0_DAT2 */
>> @@ -344,7 +344,7 @@ AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) 
>> MMC0_DAT7 */
>>       main_mmc1_pins_default: main-mmc1-default-pins {
>>           pinctrl-single,pins = <
>>               AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
>> -            AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
>> +            AM62AX_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
>>               AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
>>               AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
>>               AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */


