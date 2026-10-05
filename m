Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C42CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWhcgcYJdXOFXOtpi5RzTefbcfjpX2JryO8wWi6ZZ7U=; b=Fvq/W3ZxGzjmdYpt2SNUsGEeYv
	+QQ64mEYfFl1CZ5j4a1TugTxtl67ttlaFR/7Kw6wh08M85hpJwMsAE+Tws2eGdvxQosrdoUgTxaJC
	ix8GLEheq1ezXQOZZLmIazqMQQHZZqh7QCZOQYb7QasSFgQBXdlX/F+2dUcdZCG4PxcW1mKqHdpQ3
	17HSu1i4g4HWyrroAgyD6YFtQt2raAy2jjCQecqRVGEgU9gvYNgSnJGiLoHtLTP4Tdr7X38UpC3cO
	yjnrD5bTW1hX85NiuJ5CrgOHYRSQEneuNtAzkDAQ6Vt8ez80moW+ay2AztAof/KssS9FX5F4JvApy
	gMVxDBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrSj-0000000HIQq-3dW4;
	Mon, 05 Oct 2026 22:47:13 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrSg-0000000HIQT-2veI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:47:12 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695HKmgS323193;
	Mon, 5 Oct 2026 17:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=gWhcgcYJdXOFX
	Otpi5RzTefbcfjpX2JryO8wWi6ZZ7U=; b=BuYt7rS+3MnONDfC0WUM3UHHG8keo
	wWFYJxltgzgAKH8ZCKRQHs60wlvHU+xfRva1YAyrJ/1BcejJ2mOZr56bEjihL59j
	dvkzbkiv/hxjesI5i/tyh85wmsYQM9hnUSOePA9m9baO4DA5Oi3l/ekzgeJeuJKH
	lM663oWOSB5rSTYjkNOqTZtc61sjKmPhAf+Wdpm1kN/d0+ht5W/T46MlQrKDcUw6
	i4hLU71dcQ8acl3sE/E/pJ0sPV5V0pHmEP44mk+dvivJyh4xaWgNIJhHWcchud3j
	/1mbsAAh5uDtE/E3ZsFEMi5q6Xu0br1lyR66TAcoCEqvjmwPsL6kPBkZQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h4d7du64e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 17:47:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3Llp/WqPsT+Q5cMUHwNpQa3tmN5NxmYfAwWvXK06Z3v0dCNSgkUrzH4XxsBhAVgvx+UcTv9OxZP7sHfR+2Ke5IuFDvX32oO7XJS0dw7e2Pem3YUb1ky1htQRB/I2K5x5OMJ45fFiMbAbZgo6HlIMSr+RqLE68sLMpnAErpzjkbpKfaPMNg+P0bk92Y9tKEJp8BHk0zMzG8IC5IBKOAlIi3E3BWYeHUPvJeg2hS+ArYAweB4mSJdxxy12w1N3PohDaOxEQgXDSQTXE6X4O8+Eoyo8XjYAtgb88Xs8IPFGng3iKhgfI6AibTVgNhrRfkkuUNDpOl/+1yKg2pOlHhIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWhcgcYJdXOFXOtpi5RzTefbcfjpX2JryO8wWi6ZZ7U=;
 b=PEEmJxE+J9q2vMzW+rHy04GkdK56UZSUhPdZ9KcbYDk8sIymwGrlQuBs1O1YOznCX2IKoNOduJG+fZNCXY8ZA6X5Rllt8xw3ccZ/CWIGkpVRyL5nVcyWkaf0ojj3aDl6as1smDVWI6fxBNmsl3uBRiPUH65GjjZJULzBUEquU/y2TiXLyKgWeS+1Xuh9dseXR81No6Mbz2ZGE6Qt4b9uGFkXTM6OlXTdKm8NG7J+LaAOI6QPYmxOKx5Fu5pR17OHbDLdyra/89ZEthZAj1GhnXBmF0ifvxnYbwe3OL2cybJW8TPwCyTsC5NHg2tKsk06TTzUx9TY7UJSL6049bVY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWhcgcYJdXOFXOtpi5RzTefbcfjpX2JryO8wWi6ZZ7U=;
 b=EUkJEUfzZSdvPJ7PINqH7iIa6GzWyGjQJtYcaqNHkJGPYLd5u2zk+aLOVlkQhmTeDoj8GHCwzcCTxDkXVil9nP1oqLkC+HHwZWR+cR+2j5sLcpZ+jh3dy0yOiuWeM7ALVZhVJx7WxM7NXJjdCgvxm8v/jwEA6tEuDdlfgzT3ktc=
Received: from CH0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:610:75::34)
 by DS0PR10MB7294.namprd10.prod.outlook.com (2603:10b6:8:f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 22:46:57 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::1a) by CH0PR04CA0119.outlook.office365.com
 (2603:10b6:610:75::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 22:46:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 22:46:56 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 17:46:24 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 17:46:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 17:46:23 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695MkNTL1054010;
	Mon, 5 Oct 2026 17:46:23 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v3] arm64: dts: ti: Add k3-am62p-wakeup.dtsi for AM62PX efuse GP_SW1
Date: Mon, 5 Oct 2026 17:46:23 -0500
Message-ID: <20261005224623.1836410-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS0PR10MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: d3161b9f-50aa-454e-7cf0-08df23328f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|13003099007|18002099003|10067099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: u1IEhhY4+0rzU+HFKDFl/P9MZ0DXrgy/zOTEgOaTDLVI3A5GyBFmjo5SPQrU1089LAwkF+9sC+HLbUoqAUMRXd6sEsiFq2Wn4ktglLU1Sxgi7g4CdftXFPIoSu1JFZE9q2A3LeCWMeBhlROWnqLD06m4Fn6PyciKgbGKZE10WiRMaK333jXjuWqpnedESRWGjZrxGdUs2CiiSUM6pNMHyrSqzoSZLYdRJ3eLPR5NY8PGe6J7K6ZaUtG4s+TY1opkRiC1SAMAJi23ZtMiKPRgGjGLhsnzX1dV8l7Vonm3d69ywqIvQovcGyavufVzKSDGHSqPrphYXN9Bv9CMZw+NNVGw/VgIFnJKeSM8S/813hCyh2Vn2gvVMXeUQUSWrIAbBzWTl6STgLUJ9RYUb1sUXG6fIommO3Ru0kjlgHO15Oijb5cL096mcnVKg5P8JzDRQjm6ZQKcyzEa2opUv/yA0XvZLW07pMBeignWoKXRJWTQtOniEB0JZCWnpsPrFadMdEuBiyu1lFPy5AuY+4QJkP/c1a59nGDkvM3c0bQdVb+0LpUMEdSnlVY9b8sUn2kUxw2CTaAzCNAk+m/EF3F7vv1lKKEPdvJWGmYPNJF6lE7dsY059mZdYG/aH0PSA9FeR5PQWFmF6jHlLewgWLRNtw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(13003099007)(18002099003)(10067099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dJtidCcByGLxYJ2iuDV8n5lfEGVk3Izy6XrRGBJJig9Q0SK+OvekfdMTlarSbb+3QrAKuayzGZB14rPlH8wCSj0cdSTb4lGpGnsPWtFC8SG8kVMIBgI3klYiJJ40fp3YupSBscPU6fqrT5or3MdWpSAksRLB4Fi2z4Btx9VYOABhlIMp2bIdr46dSMbcG0zb1npgR+dcqNg+LKkAtZaCC1mNZVhwEpSGOeUhjj0TAEkEmSBdK4DtUcX+EACCSLmKuJJeUXbUMhqG7f2QX55M1m0LLNYQpCuij9n2OsPGXP3ueLi5HLOp71H17MEa7HxT5tz4pbo791H5mA7E2St+jBMp7wjWC2AFZeCBfC/Xc/aGSNGCw0KCn5W6nJ2adpOnwhWY1KyvJvCHYw6x2UHvQiJ4GTBx7g2WvvhiM6crihKgbq3VKka4CZZYRN+hoaU9
X-Exchange-RoutingPolicyChecked: J4PsEwVfPEpgNqSNj6YISxPKvysIdY1+euGBGJsHWsN+6y8WRHTl0yMygTgNdxb9MZrDdhGQcHFEL3U0olsNU0TJUeNr3XyR51MfoGrE8pA6kqmzv6d/GLrUUtOTb/S0Pj2gOtcxxjNdWaPuReKY9aPLfYtHQz7YtWVU54t1HaSZ3vdvTC0HQ8+OioxiyyDCCHBkjt1S37THL3zVnvIKaoeFM1jeMJIJqapsywE7yzqQnYN0ovKqx0HZPi70O1x84ZD919sEtg4A8qmFxIZgw9RvY3nVLhVBO/5wAdKaTU4r2PdLxprENSAAdVWBnNnYgmHF9HrcXPuE13AWXI/L7g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 22:46:56.4742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3161b9f-50aa-454e-7cf0-08df23328f14
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7294
X-Authority-Analysis: v=2.4 cv=AMeVrcbb c=1 sm=1 tr=0 ts=6ac428ec cx=c_pps
 a=alg3xCnYRXnG81SgvFS1VQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=KGfP4kqFyaGSDz3jI5oA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4OSBTYWx0ZWRfX3YTCyadPRbiu
 nNDTbYTA0bdGigMAZEEOTSd7DAmHVQOcOpjr6hZvbb5kAdx/9ccTYMbno4tAMj1/f1TdPxQgqy2
 IYenRsWUZSNAE4C7JawLPMOhUzEalyc=
X-Proofpoint-ORIG-GUID: wG9U-5PhSgXhIvp_4emot1KHFJcX3IQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4OSBTYWx0ZWRfX0SmG/nZOIkz0
 Ye1crveBb/4Q9jFj8yVUIVVnwYAB/Si+KzcPlcwkMV6drp41RDJOThNMVv8x00IphjWX5AMRbXJ
 mmS6Fq0yjRzaoODCMCFPxYonourlmh7lCoxnKr7A6Beb4J2A24438nJgzoOn+8XVpyvejt+x3ko
 6SH1/EV5G2R4EKw3K3SfvCY5Jj94UoD/rGQuSuZ387AUWkxomhohllfUtu5XIcOa4g3zDLYb6sb
 JbDCA3agEnIffARBYXBdtDAsg74yQsDqtZrGKO/y2ykQbzFNIWWb8XPGHAuDYA5a/Zb5/NsL9gU
 SoG532iXKc/jO5xJIlUF4WmhGWm49+bFOSNiT6AGLmJuNk4VuiqQF8tGzAnt+RTVPF3OGpRoVCK
 DtDrQe6FHX3bs+SkesE4+nxGdFXsESD9m+32ikGWQPDEomgaXiBVkAk/MWG2jmn/xYh6DTVLHqU
 8wfqR6/plGScw1H11og==
X-Proofpoint-GUID: wG9U-5PhSgXhIvp_4emot1KHFJcX3IQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_154710_773251_A9C563EC 
X-CRM114-Status: GOOD (  15.12  )
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

Create k3-am62p-wakeup.dtsi which includes AM62P-specific WAKEUP
domain nodes.

In k3-am62p-wakeup.dtsi, add efuse node for GP_SW registers at offset
0x230. GP_SW1 at offset 0x4 will be used to determine AM62P silicon
revision.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
This patch adds GP_SW1 efuse node for AM62PX only now that bindings [0]
are in place.

Changes since v2:
- Add Moteen's review tag
- Fix commit description as per Moteens review [1]

[0] https://lore.kernel.org/all/178942274041.683176.599438200260103620.b4-ty@kernel.org/
[1] https://lore.kernel.org/linux-devicetree/b82dec19-02a9-4b93-a2bb-3cbb6f33ae63@ti.com/

Link to v2:
https://lore.kernel.org/all/20260922165714.425576-1-jm@ti.com/
---
 arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi | 25 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi        |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
new file mode 100644
index 0000000000000..c56fb3890c983
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree file for the AM62P WAKEUP domain peripherals
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+&wkup_conf {
+	gpsw_efuse: efuse@230 {
+		compatible = "ti,am62p-efuse", "socionext,uniphier-efuse";
+		reg = <0x230 0x10>;
+		#address-cells = <1>;
+		bootph-all;
+		#size-cells = <1>;
+
+		gpsw1: gpsw1@4 {
+			reg = <0x4 0x4>;
+		};
+	};
+};
+
+&chipid {
+	nvmem-cells = <&gpsw1>;
+	nvmem-cell-names = "gpsw1";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 9d6266d6ddb82..058f264ee0646 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -154,3 +154,4 @@ cbass_wakeup: bus@b00000 {
 
 /* Include AM62P specific peripherals */
 #include "k3-am62p-main.dtsi"
+#include "k3-am62p-wakeup.dtsi"
-- 
2.34.1


