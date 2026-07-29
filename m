Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7348C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLiHPhYqRa1uUlYiEeGUBsGGkqOSUsXXtCz7Hzq/x7I=; b=ebyowJiYGldiaILCIvOcyfr/0r
	VgYjalJv4H5pUknWPUvBLIGzSQZ22h3N/G9+JpKw79w4n7wh03thFHnE8kNcwdixPNNLFtgqC2bNg
	7nov0WQtEGkO9z6+hl7pA8mvEJgoLmOkUaM+YJkGxJ4bu/choDOBk64gUEMZ84X7Q0U+QnS09fQKh
	KQgPdrkhv6kZAL+Tluc6AFONA9VkmZGlvBu446LQ0H1QWGXO4HSML9shhetf1ERdkvvh79QfG0wfb
	AssJ6oVTsdpegQB6JWypR1iefOaychmylaBPEeGWe01LzL5VDkKdneI6xchC0nNJsRRJAsijR66Xs
	TCpvjbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpASA-00000008v7S-0XYz;
	Wed, 29 Jul 2026 20:00:34 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpARq-00000008v2b-0Huu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:19 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66TJkuto3350761;
	Wed, 29 Jul 2026 15:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CLiHPhYqRa1uUlYiEeGUBsGGkqOSUsXXtCz7Hzq/x
	7I=; b=o6bM3uQmRoKwCAqCEkRgSeghZNXWMqFq4kyRx1j3vb46cTr9aeITkGUyT
	dVODDuovFoxqNB4U3Wh9yc2iMOe7DkyT7M/hyXOMvm9qwiK1X9OR862xzmKujt+k
	i/c+OmheD1vhrjWG7khBoGzZ6AQPAEDRsCQEv6inPtmbbnFFhyVZirgsjBEGfbE9
	FLm6HNwGnbNRnNOQRqgeZ35TjmA1gY3yq5fdheJD4/hD+mEz8fFqhfgsAEjW4ysd
	zs/qM7Dx/pMvBeBGQx+lcE1yq3jGKMeXiuBf4IPzqlLlBEnUJz7Cul+p1rHQDjmU
	Gs+PNQU8pidtwlVPcbds6za9Kwg3Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fqqytr2sk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/mGclRB8PNCX/nARDQwiCS4B/8dtIdRve3SLlZJ2yzP3Q/VFBaHRZpYU0Y2MktID90p4Dh7PQp9Xuo/EP6PuXCOkInOlvrTsl47RdvISCl3UfIqz6t6nC8UZ/7Fm8ujqsYAo1KYwFNqYJY+mA1dfs0keXMErVsfQHVS4SdbpuAIinF4TJYInIT1FpHcde8ZvOf4KMdnvgSijrX8rpEufGo7mSnXS6EL05xtkujqn+T8i9QzjoRqunlOZAwBIlEV3ZiDLVvCBgQGFNhaw0rx4Xi4Q+1lBck+V15F/xg0Yd03YxVkr+ySADFjNodb1/VGEQ8X3GMx1CVeUuYldgaxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLiHPhYqRa1uUlYiEeGUBsGGkqOSUsXXtCz7Hzq/x7I=;
 b=YxKf/kTZtPSK8CuRVOwYwqiMSRoJaV25T2krLNUVQ8Ss9m780t3wEh0/8mQSg9Ze1afUKX8tqBsmY3HgIk6R0LHfIuWxWQ049bIoXnVijCX2a+aQEmQScySKDzZg+GQZ3bOLYIaHygCeOc/tuvU1BW/zka2kDOmaUNxvG7P69sLjK/1BTtQLdDJ2IKfoXmI7j7C0p1Uo0CszSd3gf83V1mf532ejMz7rzwK+YH/Cyvzg6H8slHXFKV5yH/SDiWDZWOrnmFr+5ucWDo2O3bloCPGFE/cWLXwFj+ogXXq8UpH0No4ZpJUeoq1td1jGP479/eMutVBwE4DxApAx8JnLJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLiHPhYqRa1uUlYiEeGUBsGGkqOSUsXXtCz7Hzq/x7I=;
 b=m6TpyWy3fHEtW5pu1Z7TO2/xM4DFw/h7pzuVeEHvgJiiSRTN//r6NI57apaDgeAeNer++AOR6EOHSomDxpoW7JfPms+oQpYuWOdqbZS3b4imRQju3fQhNEDUChbfC5TlI/zTcF+rcZcGDWpBpohvTvTPh2r/LeZsSKjRMajEoPY=
Received: from BN9PR03CA0385.namprd03.prod.outlook.com (2603:10b6:408:f7::30)
 by BY5PR10MB4274.namprd10.prod.outlook.com (2603:10b6:a03:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 20:00:01 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::1c) by BN9PR03CA0385.outlook.office365.com
 (2603:10b6:408:f7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 20:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 19:59:59 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:59 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwg01923570;
	Wed, 29 Jul 2026 14:59:59 -0500
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
Subject: [PATCH 7/8] arm64: dts: ti: k3-am64-sk: Disable MMC1 internal pulls
Date: Wed, 29 Jul 2026 14:59:57 -0500
Message-ID: <20260729195958.671147-8-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|BY5PR10MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 944bf72d-820f-4aae-abaf-08deedabf8a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|10067099003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: fv6hZGEKIXr7HZJx9S6B81/Re8OCxHP421OL0+emFhKuQA9jR1+UYbU2Ere31vM5rP6iW1PnW7WTW5G1+6BNEr92MBVNFwvXhTcdxxbGpwZR7panjRWUOVmXjxeUhKr2RkCJMXWyQwYmRYZWe5XavQFdUDJRD9orHpMcGEw/N0ViKMhJustnwZchw1BYvr8LYcdhynGTz8oqCLoIE4ytJCd2Yy3DPcOMSmxwvfhegCyEvmWk8839oGU6HMLeoBAEX6yKfiiJV4uCNQlJYjnWxQXcEbjwyF8wRRgv0tEIdprIwopOe9uwZ+kV1OPz1A1vHfO1WEnib9o8AsdwjJxigcNUDDMzygkeB3fhXlwEtMF2UkRTiHXMTasLVBfI3qOyG8IAa1/Jw1p/5l+j6w5I7OIiJGQU1aSlvDtDUYgOSVmsvU5LrXlDr7sbIi6sdL73NAwZ8oGSGb0zB6IF23NJYQabl+zlWwLj0HCsHVqa52srKzbgJVOC6ey2xgpMPmcpaBF5jCF3zomWz+CZksZW7QNw+C1bxhjJJmOgCsYL64BZkLbLdnEQwQvwzEY7g4r7C0QK1qLYevTtz5Thebz0p02VHi7BXIYJ3m/zQVEjhwBmNwcUVwW4whFr6qYnpJm4OZlswYocWhvBa8MC6xlpKcSgEaQ0n6IUPN3uPRhZgeabQbypQeae6hIBeN6l471we2iL8G+iZQs6+/YUh6narA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lLqxQPfCcRN2LC1Tnnykh77yedCJTKxDBGh/wxAUlDSi6k+/fKeD/d9k0iWi3KVxvQJpDTYqpbeqsQpy075IbssfRTuiIdMRb5Te7ZH5POn7Fet5T0nnlcv08gLchyTo5K3Fx33Dux70crbt1ArbVVqnrulzk6O3haELHGCehnw92HRjuy1ISeJpwj6+4iKPNf1vy1bkxljYPEhBg/t0N0mSbJYSkWyNW4lBJ2YXik51oDiVKYuCEih5h6xC67XIJj/RrifQyfOHehAWtiHkEZrfV47P2dlrGuXDn8QIK0xrBqU9r9bJjgA0MxovMuXhhcxj9A1aDPkgwlsz5VYNAXEp9ktxhPiRtPAQcavoOrS07SVaAyE4qnhna5Ip2Ki1V98Win2/tJXI31yRCxmB40gn7I3ETaILSpu7xBqHWAOXhnJKUj9oGWupolA1WG79
X-Exchange-RoutingPolicyChecked: SeKmwMniq9nqnC60tb5BgMNMf7ilwvAeq3jQS0KUpL4+pV3sYAKz/JfkZ3qTha5/o7BeXsmJPuNm+VpYosLQ19K2fMlNyzjdyt9iaTIy5RcKuRnfFrS6h6BWHdjkLQNMnJ+/i42+VYAJrtJhveF7EdC42XfM7FNQlzmllnWxSbnDUTxLjlKgC7M1V1fTm5Lv9s7FfnhgrNTlUKwijq0dyy9wYDDO0VPzKODb084AhfLy3Ml948WZUZoG/0tPDgi1v3VM2aFiyvGo6tBTyd7lwCskfLAZ3OX4T1h1MO1X+m4IDtCT4ziVaqbutbziurQDdDtQ1Ge9nYXnxQzdbOoTfA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 19:59:59.8924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 944bf72d-820f-4aae-abaf-08deedabf8a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4274
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfXzC7U6wCxv34o
 UBEJJrfC191T0qzLwJXF98P6IkY3tRIbjOmux7neXGoEUxU3CSd8p74XiXx9IyM1JgKbkyje4h0
 POdFYR+j4NZZjCxKYFLuIV4WvFXADmbfAJNXuOIAvbo+QjajQ7Dukl3K6Qgug1nw2RIJaw3ujhl
 xKKLbAVWISoELeaVdGeRA2/mjAaAgk0DBr098skUs0FQ7aGQ4okP7o5gJyxtspruAgQF/55b0xw
 MVuUGMBY/MmRSw640CgZd3Sn06lerjdscyya9zVld7JG4WWdMnLoAeF0VINqh2qmIYHqDIbKSxU
 dCa0wXhnk/4nCEfuRvDtSFVsI1Tv97nD90rA1fddwK/rxjDt/Tdub7WVEikKE16X+yBNrfiByvK
 QhVQ/OnOBPNjlEfOiqI/yas9XF604kITpg5lQE7/OPMWJSIi4v3+bAxeRbwZDbr8YqUtxdgdalt
 UQ3yzQHEpwJgovHmlpw==
X-Proofpoint-GUID: l6_mWM6x_3VCXALeQ2rvxxATrXfsz9k-
X-Authority-Analysis: v=2.4 cv=AOkSgtoa c=1 sm=1 tr=0 ts=6a6a5bc6 cx=c_pps
 a=/2P0sUepIMZl1V3lWabuzw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=E1LGV3IVXhfQTarzVOgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX0AvYGu+gUktg
 xyZyqMkPk7DKTYsTXZpDnXkTcDncUAdpq5WfL5mo5VWJk0cz2WGIjwjyOmAVhpT5xzu1rdTggEa
 lrAQ8XI//EYeZq6rmNziWVsHuGh0Ifc=
X-Proofpoint-ORIG-GUID: l6_mWM6x_3VCXALeQ2rvxxATrXfsz9k-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130015_419270_E81D6876 
X-CRM114-Status: GOOD (  10.39  )
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

AM64 SK has external pullups on all MMC pins [0] and thus internal pullups
are not required, drop them since:

Enabled, internal pullups on data pins further reduces the total pull
resistance, violating the minimum RDAT and RCMD recommended spec values
of 10K ohm.

Drop CD pullup since board has 1.1K external pullup resistor and internal
pullup increases power consumption.

[0] https://www.ti.com/lit/zip/SPRR460

Fixes: 744545ffec14f ("arm64: dts: ti: k3-am642-sk: Fix mmc1 pinmux")
Cc: stable@vger.kernel.org
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-sk.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 7f2483968f4ee..fde4f80524301 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -198,13 +198,13 @@ &main_pmx0 {
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
-			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
-			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
-			AM64X_IOPAD(0x028c, PIN_INPUT_PULLDOWN, 0) /* (L20) MMC1_CLK */
-			AM64X_IOPAD(0x0288, PIN_INPUT_PULLUP, 0) /* (K21) MMC1_DAT0 */
-			AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
-			AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
-			AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
+			AM64X_IOPAD(0x0298, PIN_INPUT, 0) /* (D19) MMC1_SDCD */
+			AM64X_IOPAD(0x0294, PIN_INPUT, 0) /* (J19) MMC1_CMD */
+			AM64X_IOPAD(0x028c, PIN_INPUT, 0) /* (L20) MMC1_CLK */
+			AM64X_IOPAD(0x0288, PIN_INPUT, 0) /* (K21) MMC1_DAT0 */
+			AM64X_IOPAD(0x0284, PIN_INPUT, 0) /* (L21) MMC1_DAT1 */
+			AM64X_IOPAD(0x0280, PIN_INPUT, 0) /* (K19) MMC1_DAT2 */
+			AM64X_IOPAD(0x027c, PIN_INPUT, 0) /* (K18) MMC1_DAT3 */
 		>;
 	};
 
-- 
2.54.0


