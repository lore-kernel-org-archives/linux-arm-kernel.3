Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC1DC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBWkYI4ogXvjsiN1ShBtP5G9soU1DdeUWj3KDKVHM74=; b=xxCyH71LNSBcknM6OdmPRfezvD
	7okE4oJhlCCkwl9o8syaHLp/eBKFa5OYVK8drBIzC1T1h2kmD6tgvGsolSUNnxv2t5QRGfeOMuspj
	zQ0hx+TV3pxN7/wXbgS3hpcSQS8rsxaQFFqmtsYPlvx45mZsf444xQNel00lZmkcxzjjmiz3Ng4FQ
	eHfUVH4DgCA3x3XM2Geh18iGGgx90+w3uVnYMnWFIfFf1mZgC8wEo5hko+i9uopcs4deneSk86FRo
	bGLbxtDlM2H1GWhhf4+OHbwE4eRhbRp+qRqVuEBWcOVoPUpQzsrKzs8KE2fwcAOJ3Keoc/ktB6M30
	d3d8axGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4h7x-0000000Esbt-1MQX;
	Thu, 10 Sep 2026 15:55:53 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4h7u-0000000Esah-2RYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:55:52 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF6W8N3676062;
	Thu, 10 Sep 2026 10:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DBWkYI4ogXvjsiN1ShBtP5G9soU1DdeUWj3KDKVHM
	74=; b=A5A0igLj3thSnydkHIjs4MD9IqHh59U9VtlsB5FBl+J0VPKh4oDe5uorT
	ldQKIa06MUmDiAd0lR0O+RKQ3J4/tDnCirDLV6qv7OppIu57uN0JoAE2QKgBI3DA
	sOLTwt+zBDOAU+RNhMAYJeEF+bjTs1a4qJEGeBRvtwo50o16b8pASx6IM+OCopoM
	M0K1BzrNslSPJ6/Ibzerk7IizUU79j/1aTIgdStASzA18Q7XdF2PT3oD3fcKptiW
	5kfK+zLlVRSEwHkWryJMWQV6E/7UywuCRztrVgOuw6kjE9qXF76yqo3cpNcBw/TT
	3vuQ48TvyHsmz6ho9ET4wGyDyS4FA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxg6vht-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 10:55:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRJQULEIhXHOnmfD4gPmFTkQhXydkDbcw4+ehnWwABfm/QaKgL3r3dqvf7Fft+amOAryQlTPBDWZR30Dp/AW5lBaqIEQ4FOSJlqXIuFO1uD/LfnxzZHZnVlSrsi/MfOhsHTQa4Xi6hm84idXjuLjIgMki6j+fqC9G+pTj5HgpU9o5InxGbhqM1bsmQk2bUJTqAe7NcH+0d5NcTTxy7w3tQzZHa44zV6m4g905djFWegnO9E+9frFjQPie9B7E84WH1haiabPP7MXMtx7GexSlhpFTtkeE7t7ClGMNUR07KTc5APeoSEZFLeW14u8mOSjb45MijYrdlXjJIFpLYpBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBWkYI4ogXvjsiN1ShBtP5G9soU1DdeUWj3KDKVHM74=;
 b=XAF5tGe1R065hTNSwHZooTAPVncFaNhNKU/u0rVJzHyrYGy/VMz+4mqBf1MR3cSDXUOiC+P1CyvbiqQIxg/Ius3nIVjJjzVx4tPam4GgKfPEKKkNdrNbhCwFiLKqW+D5fJB8LqdzcaYJpt3M0W0KYDWLMGFH/tMcXl4m5syXGKjl96IX/9ClPojlGKcrr1/eCTmpAC+iRqLXeM9U5+kYyGkHPzS2xNQTViwTWcLMpYkRw6XswcbWjxTJtCwVI2A+XJg6P7YrS4BN+MbHciRqv1+Wmn4CU3e1RqHRloKYZ40RvGdjyzEaLCJ2mg0yjfdJocv3Enjb6v29J95PytmV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBWkYI4ogXvjsiN1ShBtP5G9soU1DdeUWj3KDKVHM74=;
 b=qcSB3SI+wZZiNqiKwEdNoJr5oJOt3mOmtgkCZ8FksLA8fAF2696Ey4WRi+tSuoM2SZmNcajgOn7Pp/r0v0JdGzJs29hlACLQQOTZ0rJL0oyY56hiCiYX+3HWUNvkTFpyLn0rHeDu8ADNBsjST/YjWk1AdNR1MbY5Qvl6JIClkOk=
Received: from PH8P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::22)
 by IA6PR10MB997659.namprd10.prod.outlook.com (2603:10b6:208:5e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Thu, 10 Sep
 2026 15:55:44 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:510:2d8:cafe::11) by PH8P221CA0021.outlook.office365.com
 (2603:10b6:510:2d8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 15:55:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 15:55:43 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 10:55:10 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 10:55:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 10:55:10 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AFt9FA3587197;
	Thu, 10 Sep 2026 10:55:10 -0500
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
Subject: [PATCH v3 1/3] dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
Date: Thu, 10 Sep 2026 10:55:07 -0500
Message-ID: <20260910155509.1425682-2-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910155509.1425682-1-jm@ti.com>
References: <20260910155509.1425682-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|IA6PR10MB997659:EE_
X-MS-Office365-Filtering-Correlation-Id: 798c5506-25ef-4676-019a-08df0f53f87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: dl6KkEmz+nDubXj1bWfBp8vnTUsBmEqSgv8O6D/r7xxxBSGxUtivXZpkW2TLTiQ1G7n/PBqJ43wxc02ePAGPEHD2QF+RrbiEWx5H8beQTFi+CqkY3rd5L98dJmCkI9PsULQ8WfdxXPPpwQLqPkWKy9P+P9VT+ilmbohjX1dZltorlKElU6jVy/Hprm3RtXUDJb3+UMStkfwsCkijKj0O4DfBaLIIAX5j4J25AjbkEGODiKHo90+mckbEMM6JJLlkK+eomZnZhoAYmx5ETWodEgiFSt3whdUrHdjQBi4lzKv+TSl3sDpw+QoZfTs8Kj4wqigmSldQGUkVBRj+//+3MqAdsN1jVipO+B9Qqodtc7Ia4ZMjV+vdWHZaPgsDjPAsogOzXQo15OFRo+nSKvD5rZNmM9N7hgao9EBs8JXjbi84OWqyYjFQwno9oXVBcxcYi2BQfz5mLje6QsHtGcAHOOK1ugG2nDCr2zZzZrZhvQzKw04UTndaXuM1DpSuCk6m/Rx699ep4HNkfjlNXHmfO0jIAUVR/OGGLgVFgImxqsDPPJnP0Uhb0rmoXd3O71NtKB9JWJZOININuLxBHqFgH0tcJoD8cYiKnISnPb+CuDSOylAdPfXCYxVm6RKqqCUqC80lhmH1WziuB1WqMILFAZe1LAPa+fzfn7AZhUV8/Fl9YKtgz1I5a9vhWVcb2spRNXfYm02RWt2JqTkpLUAelg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ck9jfbMzddcMn1sZ3HmScegKWEDaXNxbzJMkVGKWa9ibm9KKzLD+fEjYKlqGKPcBhFj5B9/C5jzHhtXX/Mf5BIKCtSNayCmJDFMfgCmkzSltwcQBVHjCblfHFZcBkciwEaTAozx7ikhFRBvMF2/19SCtIaoLqc6t5epIfW1xz2eJ0SF8uiO35sDD1IaTO+ejl9salgmgOM0Q9TdRMQ5n6ru0wszspj2OfBGkLd8tQeawRUN3HXEB+AnpXcQZbhcVIQUt/GVsnrUHMPB10CblE09u5gRML3gSLsD8J74UqCwsic/u/NXBmjV0qJZVa80AxPDgIFkyNMHUlKxCmUq0JBeasjevwJzluDklzU/b6uH3skQB7Dqy1J5XnhY7u4Gkqug9R4t5Iv1Ef8RYKBe2eyF0iM6HbP8l2chz7r0ClFADHGtUfXykeAIe9+bgadii
X-Exchange-RoutingPolicyChecked: CFrSMtYnoQfDXhAnNbJFQKTTs5Tl55d2HAR6m1SaTVaAiLOkqumS4luUABLS2ODd4/YvDNFj29916Y2Y/7sdhBPe6liCB5WqrR4XGZQ88p51zGKLH04kB26FOAPhvp0ppCa97rTKC0hxyez6EJRVHGJzl4JwZ1vmOg7HOzKD8QuP0xCw4aEAXZJbar/j0vTTvVnsTyN/uj54TkLXdcFPY3xQiSrCi15SIQZyimQwolhaaHS3czXfeLwFrCDkTfHzTnFa6Rm3Wdw6jMel9qj2p3NP6Upi1BTDogriodEKMA1xZKHA9DNnCbtr4spAjTEmKitNVyAwgR8e3cTtwgQB7w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:55:43.4675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798c5506-25ef-4676-019a-08df0f53f87b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997659
X-Authority-Analysis: v=2.4 cv=MpPHeGae c=1 sm=1 tr=0 ts=6aa2d303 cx=c_pps
 a=rjhVvYU/dOM9ArBm263f9w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=c-n4J4-pAAAA:8
 a=xox1hFKCJgQw1cEBG9wA:9
X-Proofpoint-ORIG-GUID: YhnRv1W0E3LxVdWxrsk04TBc3BB1iLFO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5MiBTYWx0ZWRfX4Crux1910QbY
 ssq/uaHD8dsyHDccLftmzZPp2WnRKVMaIFX7/Fi/FdLqIttw+yB/WNaYF5tl3iJCoRHvHDCOBiy
 O9RqMd6+kQIcR3xbzaBBdqJN26IWGs4=
X-Proofpoint-GUID: YhnRv1W0E3LxVdWxrsk04TBc3BB1iLFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5MiBTYWx0ZWRfX6hXfqFDHWXSz
 ZOS7efUqzyr0q7E6+xQQ5v+Pjzh2CO5yJ5C75Zs25AZrzUNrLXxGM9PCNaMpgc4ApqrIeD1fRX8
 ESUzyAiT/8jW+gNfYv0nkGgVlSkKbe/cqbD8LDtjGG9csVWfvgEpgyepELmaUMBnIhVC9pt3Pqw
 ZuybV0d8JT10I2M/1UCLUqk6LWaB6MafEYo3qeqXBU+bmi1wva9SYDvVCrlTERtqYFNGcmb4eJ0
 PQsjCyrdd5Ezo2oeOsdUcxj/tqAvx/pC/FEoTKyGi7hExLlseQx5/MPN8iuSDV8d91R0Z0kVaHO
 Pq+QLAfRbYlO04+vfA8VIELuO6fW3z3lBZ3A5BHCgC0ClMnES2NtwRuPubBK2+lyGU+bbZWr12l
 AMhRonmJgySiyOKhywZBuqxFIiZ0tuI7vnSv4WA/kS8wQwowvGivwDMtaGDD5ktGCw/1C1QO4He
 VubpQ+C2tiTSbgydhxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_085550_741837_ED7BE16D 
X-CRM114-Status: GOOD (  11.92  )
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

Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
The uniphier-efuse driver can be used to read AM62P efuse registers as
well for GP_SW silicon revision detection.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
Changes since v2:
- Add fallback compatible for ti,am62p-efuse
- Add Kunihiko's review tag
---
 .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
index e27cbae2d63a0..d26b3d2a3eba0 100644
--- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
@@ -16,7 +16,11 @@ allOf:
 
 properties:
   compatible:
-    const: socionext,uniphier-efuse
+    oneOf:
+      - const: socionext,uniphier-efuse
+      - items:
+          - const: ti,am62p-efuse
+          - const: socionext,uniphier-efuse
 
   reg:
     maxItems: 1
-- 
2.34.1


