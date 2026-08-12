Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523F8C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jMP7WxnVYfsNSaifiBV3n8kEexHLHB3UNMzNDzrih0=; b=G/MV3H2bMVRo220czjeA0rVg6b
	AisQ5Jup/jDb8J1yeKJi4bt95dieQoKRzm0b3Nt4t0k0dK1SKMvXSF3ptMOS4ypIoiTrYgjQBZOXl
	o/djN160STOOj0CmiRVlxzGCccQzNU7lrCiKFtm+YMzYWGNmuCBFuJYGt7unytXHl1LRZ7uD/3pbO
	HSRIDjTz7rVh7bXXiX6ChqVBjmV80Jv2G0fy3BmZbB9VV0c0kzDHinacMx8gnHQTTtrwqlKuIlkk8
	UmzB0KsDDivESpIMW5r5wbVMysf2hqYMDmVVQOViDrSforRg79wjr1OZgsYON1a0ucNdmdM6O/46H
	w2Nc3X1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB8y-0000000GWx1-3tev;
	Wed, 12 Aug 2026 15:45:28 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB8v-0000000GWvP-06vK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:45:26 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67CDZ20f696065;
	Wed, 12 Aug 2026 10:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=/jMP7WxnVYfsN
	SaifiBV3n8kEexHLHB3UNMzNDzrih0=; b=OTve31GkAZPeEGMD6JBq2uafYGoi6
	MKlO1AE48bPqk/YaNdBFyPweNesHz0zddJAeO8Voc07985/8484a9WaLKe741/D1
	Bhk9w7k50iQ3vEjN2Dcu7ki9YX0U6Q2wXrVg6ubyBJPPfv0D61gNW9nLn+dtBHhh
	C7guKMaEAYJpXHT2bliGci0Uqf3FWhLRAUQSitsYU8locAAPRr8JMzgZasyJ5ouJ
	ajjFJz1agxjARcVlULSjfcB2bAcy+qHNojrZFxvicfA5ve0yVzrqx7C7UT/yIHer
	yYtnTf2qPJ1g3lCoVAoVKVEK/sPgBoJQgFGhjvlWXnqpJXBjRO/zdcHAA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g0musafrt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 10:45:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmoS1tOaYxNhG1Hp6yVl65T/EWK2TQM+HqElpqOBqc/h8srgFpacaS+7xeiV3mTTRyu9wwuLXpnCacV1Hp+1B2Em8FcORGRiUgJK/QAJiXUgbEe0IknUjemoRcb4SgHMPqoF7cYWcH5k1OTOmH2tdIeBbrbPKvTAzOGGbXZ/NswnwgwgNo821o3NUDrI6YncWnRWr1N6ym/sieeRUkrL0DrV7EtKsp88XoO6qnna7w7VgA/Ks3IfAzAt4LSumqPQJ7cmcpUZoQprl5GZ6r9mM7YVgfv4g74xOk6BKtFTFmWCCJWurfcmMKzwY5jMZZwPJzi2NvYp4z4HZZnO5KLCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jMP7WxnVYfsNSaifiBV3n8kEexHLHB3UNMzNDzrih0=;
 b=itna/W/gQj/Pl2kXRqTakUqAreVj4i8LF+U5Y35Zg2zpZJoHXfFi2VpvPf4SYYjI/lxEPA0QsLkt9tWQiWRSJ6AhvokMixkVnrXpK2VKzQAyd8DyPsxp0A82KQgwdtGn0/tjFME1ioYaE4gtqbk1/EWaLRSHwElio5xUxbfysCLaaMJjh5fTmRhHp1nG5mwz8lQZ0IQwI8kazhWIvyGKYsH86VJE2+NUMIUtp72uVjoefY13Iyt2DbzIfZuoovIxdxoqHaHssyScIxSPTUgw5Ld1rHZlb1tgOhCqVpo+CAeefq4JW5YiFOaEwL1GILs8flHBZsDyU5JHAvpkOAy2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jMP7WxnVYfsNSaifiBV3n8kEexHLHB3UNMzNDzrih0=;
 b=BvEc52a1liUOreZkGVBUzL/SfLZNEWuwrzXr48zYl9V9meJTpMv5U0PbwS3Xzk+J7Xs5MYTrlmO8AzpaMZBoXRZSfIrlDMY45xm2memPqtZ2hZUuFPj5q9rIKcR1A2akpXgyhFWfRCnEYnayu4Se73MQbtFezZ52WkkGJGcOF60=
Received: from DS7P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::25) by
 MW4PR10MB6486.namprd10.prod.outlook.com (2603:10b6:303:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:45:20 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::6a) by DS7P222CA0022.outlook.office365.com
 (2603:10b6:8:2e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Wed,
 12 Aug 2026 15:45:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 15:45:18 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 10:44:43 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 12 Aug
 2026 10:44:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 12 Aug 2026 10:44:42 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CFighF2343963;
	Wed, 12 Aug 2026 10:44:42 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 0/3] Support AM62P silicon revision detection via uniphier-efuse
Date: Wed, 12 Aug 2026 10:44:39 -0500
Message-ID: <20260812154442.3379851-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|MW4PR10MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3cab4e-c6ab-4d8a-09f2-08def888b5c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: z3cZ7I7bUWtKfqXGohk8JIsHwsjSGzbP13nAa7hJ8nWzvuubwl+SkQw0+ViUPhPlzfrmpzdoZIlVMPNAF36WZwch+vgUybkW+Is6GKaASsh+5+/OmjB7fkvRJsILVij0aTlFHPXykCYmyKy0/l96TPv76/nRQXPJJS3Vff6CdUxRdtOQ3MB7jRm8bNKDvHAPBkZmgLIlTmWEl2bJe3HM8YAHMxRwbfvrXP1yGP6eRAaLRoE07GqED1O18CI3w4BQDZLr3VYf1WeNiOAdsZ/wPBgK5a7om4usS0Sf1hz/9TbyJWSYZC2ur+Ox4pad3riGbhLfGK7qdWTbu4Bv589AJExQN+MMqXjbE+NbXzqN/JJJd76L/V7FF5H33SuCezEtkdGK1re+IxqLLUPefaG3RviWVBZhVV7eKY5oJNM9d9V3j64DrFzNl3CYVJpuY35UbYWeL/xm8+LcUDWwlJi5SFBGOsHzCE1RTR6jPtKfQWmYOwdiLw27gL5PNyyd0VVWaDXOEVPPbSMsHazZ8emV4i84MkqnMpsubOcmnSLEsr1MRrtW4SlfzTJjM6EHhBclr/fR01sXSODEx1mDrTGdfExaaoyi4QNVEJbe5enhUML38WWwCQWaCZQoEPyPsjIP8k8mJwnojGGyxsQE5u3/WeHiUbL6a/YtRSsoeiYuYuSjEJCLcBMNmcC6LuQ57GNFOd3CAL+ueYha62ABcVrupA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0wgPZYWWQVQH/0rosS7WJO8DdJM+IETmOClNoCVKWc4TjpLYwWhCaDxewYAUs5oM1KtGtvT4W4yIGYOGobHYRMyBpWqmkKEixLk4//X/FWLD3tM2GUSq/1KKoeG4xYR89c2ZVr3kASqGNr+dJhyM2n4Dt6E6mRoNr4+0sC1PG9E3hBg1+4F5pphdfOKU4KPV3EF7VLm0Ca4tcp0PrdD+DMMBnQryx7u1Df3D2SIqBdUVJqueJsXkBBAyR0Wpe+N/1aErAFS0cL4w17yasYAN/W6aIyibjguqml9DO0uheCEQ8Ny1ZxveIWhXvlrBT1IRGn8wv9G/D3COwXImIeCB1mtNEONByFZYTCPViKQNgWKkPs8nd+wCAjcLpW6pGzQrumuIqe4qeNM+K9i4eK9zHmPC5pn2eA4wGYY8dJ9aYeL4ks/Qg4R5RnAwc6LnxPzV
X-Exchange-RoutingPolicyChecked: f82yxnAj/4IuVQjyoDdM/4gxd1McAM2Y7yQby/zw032jQcvjDQl008vNYm+PUyWuHoPxvcWDm3G6GzY2hIzFVFIh04aGKDNi1CbLmw1zqJFoQemKxYMf6NbxHPkwAc4EnMOXxTtKr/RpPoknGifyclqXV9xVUdjfn+GVvnHUe8GPThHg88X8BcfBqsewl2cqu8/8nx0nnhrsl/pOY3Wgbua8McavLiKTW6mSuQdDO0IjtaehV/f+ey3Ylf7AcQE4tCJ4hPicUTPVA5nbBf0xYysC2ZILzTVzr7MEjX0wmNGpqTpRMSUJ4+5JeB9yvhLZ0EHosIYorTX9LDdpgtk8AA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:45:18.1072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3cab4e-c6ab-4d8a-09f2-08def888b5c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6486
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a7c9513 cx=c_pps
 a=jAY+Yiv4fe/m5iF0AiXt4Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=5lGjH7dW5flOdyZUQF0A:9
X-Proofpoint-GUID: pnnw5WAoyyv_V3XyN50Iz7dCH6hLOJ30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfX5BqhaRblTyto
 IiF3wVJ3DiC/XcBTmKLs5xb5IsqD3rfcvllpkWx7u8PvPYtiT3OaZROLDKqDmqG3Dn1VBxx6mbo
 p2kbBGHmuLIaSjchKM5Q4Ss+LidQaIjvCzzNntvfn8HTM8g6H2qL8/Jjt3u5vPmlON5TiLe+Yzq
 rxF+ATgdmvX+wwGgD+JmhT6BGNxve73zuZk6NMK7l+3mQFyMzWfLSv7fTwlm7Cuy01LK1HlKqSF
 7VXHKFMnUy600VZ9hw0hZS4EWw3fIuS5rNyTb0T3D8J8366A0PYQDMnFElYtlNm8wbsRRmHqo2E
 kWioAMAJuvl7XZnOyiQeQtzBeGyxCw2aCjqRAvQ4zFZV/AGR77MN6fn2c/EwRrBuTygk2kW3nmp
 QTE4bZfhrCUKBlbg90SZrHtd19z1wd1TEtmNFel0MplXoOkZn9iF/EpTwPqRaZyfFzByOnpHcid
 xnLs1gAyTerJnCm3Psg==
X-Proofpoint-ORIG-GUID: pnnw5WAoyyv_V3XyN50Iz7dCH6hLOJ30
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfXwxlnotVp706A
 Yvm/AqvueJFe9u5qLcG8E9lXVEafBrNm5zmQF2dE5Lp35AoMMimjhbQeLWtV3RISkpsOzkvRfvp
 q3iWcT/7dHNhLaxfVXbv3Ql6mdWGTWw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_084525_085887_3CCEF9DD 
X-CRM114-Status: GOOD (  14.85  )
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

This series adds support for reading AM62P silicon revision from the
efuse GP_SW register. The solution reuses the  existing uniphier-efuse
driver by adding ti,am62p-efuse as a compatible string. The three patches
update the devicetree binding to document the new compatible, configure
the driver as mandatory builtin for K3 architectures, and extend the driver
to support AM62P devices. The uniphier-efuse driver is simple enough to be
reused for efuse register reads on the AM62P SoC.

Feedback is welcome on whether reusing the uniphier-efuse driver is the
preferred solution or if a dedicated AM62P efuse driver would be more
appropriate.

Patches have been tested on AM62p SK hardware using SR1.0, SR1.1 and SR1.2
silicon.

Judith Mendez (3):
  dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
  nvmem: uniphier-efuse: Enable for K3 SoCs
  nvmem: uniphier-efuse: Add ti,am62p-efuse compatible

 .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml   | 4 +++-
 drivers/nvmem/Kconfig                                         | 3 ++-
 drivers/nvmem/uniphier-efuse.c                                | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.54.0


