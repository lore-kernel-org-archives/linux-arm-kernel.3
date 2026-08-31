Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51616C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOvv75lA9uVoucffOhv+zGmE0gsZQsedIaq5UtWhI4U=; b=PPdhGo1lFLOYz4DDb4JKzB5oAr
	7/iulZ8GAgVCNedpEDTpRq41qSLx0Zv6skAA2XFvDtnxxWg9TlfKV9xLF8U7rndSg+rniOmylY1/M
	mRPm7Qdeq0s5rRQ/EIX4ohoD38UDPB7i4choy/WKOxIHHLpyKdLeKOVsdWBe9p3YcNUkiOKHP8G/Q
	rR+/cFrqoCfUiwwuZiJyY95RR7Gx3R+MK/kBFbK93XIMwhELc0+vHkjz3sH/tSpMRiAUoaremE8ap
	eFmb4k4Tr6ibN6NjtVRdnl7Jj1jOH/qFKt5+H3H++A3L/cC19sy+4Kyc3W30wyCjqRqKSNfqVoHU5
	m8gQJeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16Sw-0000000AFnI-0NqX;
	Mon, 31 Aug 2026 18:10:42 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16Ss-0000000AFmi-4C5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:10:40 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFjrbo1504972;
	Mon, 31 Aug 2026 13:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=BOvv75lA9uVou
	cffOhv+zGmE0gsZQsedIaq5UtWhI4U=; b=O85oa7uuB8t+dK9xEtW3r3Fai22dm
	yCUmLPPif5ky8ges61CiKyh/TrVoRWZKWsZxLLmbE7KtL4A3rrP/20cTXvx9n0aM
	Kp9y0ZUoyfXxbXUxq0h8hnaFz2EPB70kqnEZluAtBdfS+PtPWu5w3tVaomu/2b/6
	ZadPo5CI5AXZrlsFgQjhO8Uh439sUSx4Iwi+rMTIYQcjsBlP/kfCFgRBbBJ23CSw
	aknmaUcynBh28T36qo+o5BoXUX1CpS4XZ21ZAbLy2o4edzb355/ReuHjxHuagD87
	70K+h/qCYQwDNG2zib9/z1Lz7FgyG9YmWRhpZkzoHqMTuqizOC1G9B7LQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gcet47qfg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 13:10:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+clJD/+zyR1FqT/YNhk2Pm3KdE88oh007DqydksirE9P2Gko5oZJR7wKOpRaS6IRz50YgwWgfvfNDQZeksFulD17IQfTpt4H4P1Crxr1BBjky4C4vNiwGmu173QLxXDkGs046nfxANcOR852t+mu6AfCZPbIx99FAGjWEx6DaIhIexLDtu4UciKcgSGmneZtbZHMrEtF0Lsl6KDvA2fgDyMACnelw101DRnALS96HtiCHjlMNHY0Bzyp3kzqIOAdbjSTvbjA0GElSYkWuXPoFygNycbfIZ6uAdk86qvsGadGyWDriVVNvxvGlUj06wl59R2nJ20gNY4B047bZEq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOvv75lA9uVoucffOhv+zGmE0gsZQsedIaq5UtWhI4U=;
 b=XaH7VhTCsx3aZEKnpPILFfr0kmY6HFWTmLcRLmmj6OZXEYx/CYocWSCS8wvjXsPtEWcJeQWipo0oKo/77WDHDzkBjd5JnHk097om81sHon+Y+niVobMUW/LCVfDKXp5+1WpnTstTR8rlk2f7gNFvoA2gkrUHiYUx13TLIYQEASZiJVcNr7ybaFQvOTDwL8FQPeFDaMmuZnTOJ4c+RoD4Ou84r2HL64neuUAA2Tv+zXHOsaV0H/VOYovpH7dijGdl6DKkF10TfGBe8K3TB/VVcEzej+hfCY6h3o6PECcP8CvlO658gNETYuOSoV+ScHagJ5HA92mJ//XvwCnHSYbXPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOvv75lA9uVoucffOhv+zGmE0gsZQsedIaq5UtWhI4U=;
 b=GJkH0mAmJtWwhO6DgurKqpIbgexqsayX5IWJhir6EJeXOpXiT1N54JI3PGiwRsw6HYIjrOZhpu4CAf2iCoGZyCZwoJaqQrMYVlBH1pNsXCpY8iPxZ1KlsUINBRyYNbIkf1nfS0LSyg3jQy4qRanSlMgIC9GRTFqudTM741Vopq8=
Received: from PH0PR07CA0078.namprd07.prod.outlook.com (2603:10b6:510:f::23)
 by LV3PR10MB7796.namprd10.prod.outlook.com (2603:10b6:408:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 18:10:29 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:f:cafe::ab) by PH0PR07CA0078.outlook.office365.com
 (2603:10b6:510:f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 18:10:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 18:10:27 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 13:09:53 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 13:09:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 13:09:53 -0500
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.79.129])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VI9rJV257288;
	Mon, 31 Aug 2026 13:09:53 -0500
From: <a-christidis@ti.com>
Date: Mon, 31 Aug 2026 13:09:53 -0500
Subject: [PATCH v2] arm64: dts: ti: add am62p/j722s GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
X-B4-Tracking: v=1; b=H4sIAHHDlWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDC2ND3cRcM6MC3fSCUt28/JRU3TQDE8MUA+MkU0NTSyWgpoKi1LTMCrC
 B0bG1tQBBwAo4YAAAAA==
X-Change-ID: 20260831-am62p-gpu-node-f041d03b5159
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Michael Walle <mwalle@kernel.org>,
        "Antonios
 Christidis" <a-christidis@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788199793; l=1430;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=Aoxg3KoxMuAhQuSByR4V/V1j/4zCpFnY/Wqabc4b8GU=;
 b=+KeUFMV60KT0GDByZt1bDRKxigyZ6oTUY78xXHw+tk8jxszW9ODUnwkEX3oVaXh3SvrsnhqBb
 uh/fwXByPrgDVrJw/+/X4SIMwTOuGBIS8qvr0TBLbQiONpmRw5vh1Zw
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|LV3PR10MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5242ac-de49-4e82-d5b6-08df078b2307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: Q2PvEfg+qj4tQfAGk9/beFaCqCB2tEUt2uwUvRxebOoFGeI2WpqUU5WHlLoirac2bp3Y538UOKsjen1ZccSrZ06GQSCnHShH8gy9W29PDkTTOh+U33Fe2u3EKKlMNRGnkXq8SNwnKcztx19YrGF0UfyzE6zPS66PIfCY/JAVA1LJVdKlLRIWQsPmJPoUndH3qlMcZpoEpS2ZbhOqgmTI/dsAGnAT2pnHlqPhXrFc7fE7znm5Kf3rNrOZjmxnrMsGA9uSmV5/09PvJ2++ZaGZbx0260zE5w3l24JmpONJNUmT6k1MMDGBIF3Se4CxFKnohxNgW0aH5k80RUmmXTC3i+J8JAsFOWFSKC/2D6Ub5cSqRsr1Rz8n1mYGH8j4hhV5eiiNa2LJ4JRwJQwNv0pK332ziH56gANjQgj/QGrkNJfxzYCn1jzPRO+yBY7tGt4rxfhVA4BH+/thzCVsg3G6L1AofgkgnE9PceroUfL6HZcJrfDNAVNjuHpesXqupoFwXR3N+bSJ8CNSp0ElZa/ipBsA7+7paZBN5jVHlX/M3tsKJ7RWqcxaaLTnrjKCtvFmNhGWYev06bys+PxzxUdaDWSx/mPbObVjtdgQ1mJ8JLrd+3CHh3cV46igy/F2JLhEtOm6In1L5jRGEIENstXzr7SkSoHhB+JJgSgKhOvt37QXtbsvB7PMHDoSuVtJP2OVdGTMFT/B9Ry3ECwnwOeTXg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GmGPi2oWQfKu/0zsNj/EQXBGCusd/+zqx0uSRcLku0GUIFCrS0hOwyLZIp/yZSPAYYVxLPwtpDa+FFKRLqbDPJ3NPsu5LdmL7Z9/vpAy+8pgGnSZkbwe92nEL5e4NtLvaBTxcznhXQji5TVtbZNyzRd1bo0OTwJcndmVLVphGdjvk2PF7uSOGcBlU9ZNxwp6SNfKOKTGqumvMLZ07X0BDWGlcZWcz0S8z3+Vj64O1d9zADQABUEH9AGnn69f75qPvOLDN9jsHyV9Tk4m4Vy8NN7Qjs1fcD8RIwBVmkuVBhih0TNOsEZvU5oyQYT/UCBcJTS406waPzvNRQT/+4K4GBQvWBZonn5xMXXgQPM0VJOew2uxgbFDjM37t70haQXYI5P7FsXSslj3jftoFAp+HkMkC0dA078F8yO8th1X6WXyLOX2QOAFFuppmdM6Ck+6
X-Exchange-RoutingPolicyChecked: 2VZj1Szh+xu5t8Iv7BlOFMjXjOeFbhY88cHOapdfAuvhCs6rAY3Ypx6jJW2Su1+shOIH/z7U1UbzPo3tns0u7Oaq1FtBkO7LM67J0hktTDBVwPy/jFQNCQn37WJ60UVvldtMHMzzr52H+UwfWPmRXMlGqXW4UKXA6bMMP3dKjI4/NWjwbfj2oGRphUsWqqVdjvZMXsrU6xL6Ev4asqqapVUU2u+uPajEIGLp2dMinqXUn1pWQhvU+Ksa49TMiH/vqZqcwGoWoNY7oE881LW7ngMc0bjvRWLEZHO78lkU576ZsUm4xHLoqw/1qsqvvZxgKNz7c2GfUrv9cG0c/c1G1w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:10:27.8520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5242ac-de49-4e82-d5b6-08df078b2307
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7796
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1NyBTYWx0ZWRfX2MCmi5eTUNBn
 WTwF2aSacvuRnp6URxEopnMPpgWcU/LIjWz0SpqncVXQOKNsAipohdMlT5u3A+vy3La8EdCu0E1
 /sow1y4O24QYJ4PByW8CrOqoiRNmVpAzKnqxZCsQkeInE0PC2HFKKdt52y/jT1mLjuCEUiHsbDp
 Z/DjtcnBxa/Besp+e1ylL8VIfp09jf0kpZCyAlkIvvzzIUPP+AsWYuqVA5P+/pqWRWlSgsuBtgV
 1fwk+dFmvbUK2s/oLfu0MGptgw7qQzCmS+f+WXWzFhlma3r+egBBog9I+yrSYdPoafX2mAusOxn
 gzzERnW1M+2QpP3bj4MM3TJOHvWySBiBrpC/Y+oJTLLl5em+S3NfGGs5WBhqr0tAMLD5kyzIJGg
 vzOw0Ktt+V/ufXocMVkpeN6or916ri6hHXDzE3ZYgNtq+xlhF67hYQ2HUqPyGq2j8zvSQGwvYuH
 gkPUlLtBoBiOtQIuz2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1NyBTYWx0ZWRfX9vNu5UIoX564
 acbWS5SPPHlyH5mvJtA2TvYFUY0lKonsjL7veznepiH4IprkVNSgDof/WiKfay2Hqu1nsjOvd9J
 D+txmB0SYTt47wLeun6RHcT9uaOzIHs=
X-Proofpoint-ORIG-GUID: KL-HcqDfU3X3JKwPznBu-Oo67hgz_TgX
X-Proofpoint-GUID: KL-HcqDfU3X3JKwPznBu-Oo67hgz_TgX
X-Authority-Analysis: v=2.4 cv=LrSiDHdc c=1 sm=1 tr=0 ts=6a95c39a cx=c_pps
 a=St4LTB+eVnQVBP+Ivca1Dg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=ZSSFAes6YlPA-GO2LGAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_111039_300762_45651CB8 
X-CRM114-Status: GOOD (  11.30  )
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

From: Michael Walle <mwalle@kernel.org>

Add BXS-4 GPU node for J722s/AM62P.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
  - Reword commit message and title for clarity
  - Resend patch, missed merge window previously
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d..e36205eccfc9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1111,6 +1111,17 @@ dphy0: phy@30110000 {
 		status = "disabled";
 	};
 
+	gpu: gpu@fd80000 {
+		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x00 0x0fd80000 0x00 0x80000>;
+		clocks = <&k3_clks 237 3>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+	};
+
 	vpu: video-codec@30210000 {
 		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
 		reg = <0x00 0x30210000 0x00 0x10000>;

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-am62p-gpu-node-f041d03b5159

Best regards,
-- 
Antonios Christidis <a-christidis@ti.com>


