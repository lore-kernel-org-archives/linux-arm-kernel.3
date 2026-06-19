Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B25CCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 06:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=; b=PnzyErGresSfo0+bFXIepab357
	Izi9t0c7IknAbh/yJDcT+6nopke0RFC6PQ5BtQtATS7JAFICqLWvbMVCA/Sk5t71bi+84yJZ/qHVV
	o0TKwIDSI/z0nOBdcag7MqYOM3TGs7q8v5cb+YDWdgGJhYmD7KBrDuqkLRY2olMft+SiKsDU5egUZ
	93+q2RKYrxFz97OIIY+GY6ccriF343lLi435sRkYsoQJgNEsUBeNP4TTRdoXkGR+G4cuX7+k00kEK
	tzCh1Ov2cmTrSUYNDsb3aN2nTEqAerXUVNr7wLR40NZzmjYf47rsc6eWwQVlmtvIr+rViTwiATY3u
	c7qkxUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSi9-000000022vB-2uoT;
	Fri, 19 Jun 2026 06:28:17 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSi7-000000022uh-40tx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 06:28:17 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65J2uQe5974461;
	Fri, 19 Jun 2026 01:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMt
	Ho=; b=mHNcEx8vYGBf7bNx34Is9HG/ytNnFu9VkMc9RBXaPiqS1Btb5xwj0n02V
	hoWzZnWg2i7rOlxJYpBErxkketCvsC6w4G1LH8HCrC1v1wVhxbkwoEOMJ3AtHZVy
	7ph/jO1y8tynOsJAuICEgaoAckCkIBNhB8u4a6p3aW/7yD4h+9bcTqfsCRhLuJZK
	i63KCvHnYNSsG4rSU5+jZ0e+cEpT+rOAGgfHkVEyoPBMr0VwcvPSaMAKo7zEMZni
	k+UOTacTpSLLozY2OJMUn0sgb3F47SXlcH8RhYqq1LiGwF5FpxvrY3Dd9A85ROwX
	cnnkq3UZfvCDXKesYdpCSBKIVad2g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	by m0384305.ppops.net (PPS) with ESMTPS id 4evfmme8g4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 01:28:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMSGR9KFs6qPIYVGwCV7y6lC/kFV/kcYaO/g1Dxj8VowdOreUujeAJdz3TgsIJLlt2XLvWXYT2bdOQENsmHnjbKj7u2u7+o8IMOcrXGmWHeZ+kgTtPNYc/Y1ZIjrreLWoWC96m40N05rVJ2e8RmV0OhhzxJiso3ppQfrqKLRi5phbp54jK5b1mVNQj6x/gR/ZYB7CQXUGN1yp74GfLjZ2sYRNYVpC2jMMb/OVeCMgJaVc9WxiixkTgc2VpvvGnHgcH8VrOEKjRFZdP604LzTcR0r4sqioATiiqSFXkmllPEYzTDwgbW2wo3BX8mPH+dk3da8VQXIJUORj/pzPdXTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=;
 b=xmBHGJGmaieEMNuiuL+joyin0btYaOIGvGceOYNUHXzQVZLFGVinDsb4xsT3pRYLfvKwBTdvxDDaIEc8P5imAY0b7a2Vugad1b7DwGCAKJsuzCKOOJbxINKKP4/a2zgKmXMBHZ8o6yoGpnnlPVB7ZZsr6MB98syP1XwdEFE5jmlbAsPzBJC0l9DcKiK1MhugjW7xYPCSDRSp11DVaz/5/mO7lwNtcuuTgh2r+iA+qku9IWVZqrIn0HHObqNvd1+e1tyzGyeX2BqGm7v3vT7wH1oUy7uCZaPSZiEMjk6cCVXNFxtZleWBvSbnoJs4jnf2ANsG4fT2T273OKg4kGh6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=;
 b=BsCZPS51gfg/IKK89wolq50uBeEkj7pMBkmjXmjyv/dTdVRjngavhVicyPiXinLC0XE7yq1ui6pG0gcZaoSKElr/Kmvy0Oxm0Hc50imd1kkwOAOjCncpkGpxIZ4c0BwFhI9E5vsqKz5aTpJZGA7d9MuIAZznJfhK4XDhftaE7KI=
Received: from BN9PR03CA0947.namprd03.prod.outlook.com (2603:10b6:408:108::22)
 by IA4PR10MB8421.namprd10.prod.outlook.com (2603:10b6:208:563::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 06:28:04 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::7b) by BN9PR03CA0947.outlook.office365.com
 (2603:10b6:408:108::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Fri,
 19 Jun 2026 06:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 06:28:02 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 19 Jun
 2026 01:27:58 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 19 Jun
 2026 01:27:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 19 Jun 2026 01:27:58 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65J6RnDG2097702;
	Fri, 19 Jun 2026 01:27:54 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH v6 1/2] dt-bindings: ti: Update audio-refclk binding and j721e system controller
Date: Fri, 19 Jun 2026 11:57:48 +0530
Message-ID: <20260619062749.1575066-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619062749.1575066-1-m-shah@ti.com>
References: <20260619062749.1575066-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|IA4PR10MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 8562394e-2a9b-4079-21c4-08decdcbea86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|5023799004|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Nywbu6byrmtD4QuRLfk9TsmfjUKFm64oztTQX6nPc3SQ4ZnoaTZvzHFp/A6uHVq4qynwWmx3jeltE4CVOFbtBmqLlk1rU4cutBnWdOCzGqfvXZaUdYTeMMoHwFIQl8eqmieLyAb7YwRmjtHuGMZRvJLXLSQFbS2qKlGtLM91BXJSAZnWTXVNzEK6WBtnh8j+hm0RnaFWgFak0Tyu66Odkt5DH/W0YPpgFfg1mMbenvxScD8/ytYGIgHMzQtnlIkwVIg0dFx+oqCEw+559vv8LFu8+VEDamfiJLZ1T2MPg+97D5qQfaMvKBoJW8pDZt6OcqQLF6IOCOTD2aqigtyb0z8toJm1JP/nhTdrh1deJX9muKiQMp7N0uONmCKFnINAV0XMIGClu2ACSYclD74/zvSFt4fTJEImvDqcZF3HzBbsPum4Nv74rMWU53dVFmh8FTSQGTXh7vvsWSk/SrwQRQawpCgK//ZLeA5vHC8zwro/C/X91RPUiluitZPg7yD8rXUMM+1GzTgtNDcgeyxNbHVHeGGMmhySVgW3szIjR1Edbzj07xtr2eLuFk0ZsKt0lCUQMeEXc7v/kx7XwEMk/P2kEt7e2MQBBfY8fSCcEL/tIJx0kPRZfQJZohKB6+lwqJWV+aluhZ8RV2QbVbh4cT7pLbi7zATR+yYN4U1XnceVkGdj0JZk+eXqnfKXxP34MUhHy1TZPDe0QQba2kX6dw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(5023799004)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rnzi+lK7i6fzHllVqNo0ip8s1ixY7T2dcyeDhKYkXKvLdmpLXB/p3GbuoTOEVO5zQbMirVw1DNRYA0+3AQgOeVxe7R6Ov9D6q9W8QlpYBR/eWxHbXMK8+OR1+ph8qXBuswe/EdlQjEuMlzEFzL8baG+Q7vm6LdHYN9Zl7v2eJ2m7+5I8Da/PUunH/nRMeIecMlWdL25U/UO0PUVezv7V4VijQ4BXlVqzC1PFRTP4aDx/fYfZr/miUCE7VbWbVOddRMUiU9W0uy0hSjqeWbLXE+Ih0BeVTcJHGHvqhfN0XiJ/F4OnI4mMPqsZ3rJzOz9R2lTVQgJzi8K4YOYdpCQonPN9W8mmljRGZukdmt1ay9BHsARrcXc1POuKJZvI12PDLsW7hMdmsVHLVvOLbmA8fQZe/sqebtrWHOy0634yXBEL3j1LJM2xp2EferyRyiaD
X-Exchange-RoutingPolicyChecked: tGM/3WbRxIDTE9BRedq5cjhaR6b2YxU+r9PUbqRDdtJtlZ/K5+gXxibTkqfIaV0Y/X74GEYk2BzO20+YacaZCUpHJxfe3ZV88EeVgF5OMk1tUrnsasGWGTfge98L7U18FZRUIjo+eaE2csa8LmJkHdcXWmnsaH0e8rUNaEPZd2Q4zaQ6NKRSo7mTych2lEp0wHisaww4SLj7HMAg5L0ZMQ+HgChCwixzfQEEOcTPGFOgixkSKrSDRnqwZCev8coD9ZRWFgLhUj2Q7L+BVzZ9J4XnTffLHKeyhtDbWKvuFYyWmMRLJCG8y8c+orFe1ZkTkbxQYsVz1hmxGvP2+ZqZFw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 06:28:02.8683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8562394e-2a9b-4079-21c4-08decdcbea86
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8421
X-Proofpoint-GUID: Kgv2NZnH2aYEQ9Y2ofh-nmdklqHkjgOk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1NyBTYWx0ZWRfX6cA54SIwsTMp
 DKQ8XZ731fsN+NgODWCaAQWGtqvT4nR1Q4UFw2MBTl7QEVF9/eojkZ7GDNNLRuOxqXKAJBefD5g
 8kcts/VpqrI8V8eybLjjLvoGdIYXwBzB7AJal2ekgzr3VZlwu7Ue4ffEdSd/Ex+dDHknuIEPgOM
 +Y9RIM4YHsabhUAZSBlU/Qqf0duTDluwN9BHxi0cz4pjd95OhTAA7zABUyVmanCMpFRtcNmRM1H
 n/sPw5oic8lm3/86EVVjO2LxFHSui7IsbA/43zz0EsKg8GBxHHJNOpB9KLOS2FvSfqiDjpVaqGs
 bdiTYH4RAf6j2oUiaXzrpmLfEBU/L2lFubIYVGXZz4++sYYf8dkMwaafRT8slwivRO1e+B3T0uQ
 UD43GAbnuKuQa+zHFH3s8O9qw7RFr781ErliHePmff5d+XFA2obmY/XmuafdV6gBVOEY2U6Pg+H
 crNAmWRjS9aRAG3gACg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1NyBTYWx0ZWRfX0eFX4jI26SIz
 /6waxlSGupCxgAEUG8+2qmMYXntdYzMQQuZqUGiQ64N/GBf7QqpVdLgzbJRHlE8NE8NdeOK+X7i
 O7tzlQtsdsx5JBTOyzUoidlggk/FDEQ=
X-Proofpoint-ORIG-GUID: Kgv2NZnH2aYEQ9Y2ofh-nmdklqHkjgOk
X-Authority-Analysis: v=2.4 cv=Z//c2nRA c=1 sm=1 tr=0 ts=6a34e179 cx=c_pps
 a=ZweBVesMg4eTnUcQsPPJdg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=o73yBMAOqiBwH8_aQz4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_232816_006302_861CAEDA 
X-CRM114-Status: GOOD (  10.08  )
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

Add ti,j721s2-audio-refclk as a supported compatible string in the
ti,am62-audio-refclk binding. J721S2 uses the same audio reference
clock IP block first introduced on AM62. Per writing-bindings
guidelines, the J721S2-specific compatible is added as the primary
string with ti,am62-audio-refclk as the fallback.

Also extend the ti,j721e-system-controller clock-controller@ child
pattern to accept audio-refclk schemas alongside ehrpwm-tbclk via a
oneOf constraint, fixing the alphanumerical ordering of $refs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../devicetree/bindings/clock/ti,am62-audio-refclk.yaml   | 8 ++++++--
 .../bindings/soc/ti/ti,j721e-system-controller.yaml       | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
index b2e40bd39a3af..6c8fb0793070d 100644
--- a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
@@ -11,8 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: ti,am62-audio-refclk
+    oneOf:
+      - items:
+          - const: ti,am62-audio-refclk
+      - items:
+          - const: ti,j721s2-audio-refclk
+          - const: ti,am62-audio-refclk
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279f..364be49f8c7c7 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,11 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+    oneOf:
+      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
+      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
 
   "phy@[0-9a-f]+$":
     type: object
-- 
2.34.1


