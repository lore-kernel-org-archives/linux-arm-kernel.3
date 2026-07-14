Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A370CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKPto6w/j05Lk5PSl7ezTpQlo5j78PN6WCqg0g3ECR8=; b=xccdjs54/7oSY3eURY5pS+NBdm
	Nq0nx/4oDD50UoA7IktZ/iL9FA+Po/++W7wPqqSzs62PHwGeZ2cSmE1tVWgrjbnThzPTH3StY3u6Z
	lypOWvLmjcei3ieYIxVOuC7EUlmjjvOUhnkbJtda/esMQVBIFitlQsmokIvwf85RY8z4UvPxsLZ5n
	l1u6Z9BeQWVCxdhrOZBMMiblB4LjHxduifv1G9cO90l+NMZe/VANExfqnPS649WHMQ7WRbkN+nA22
	vWWvTqwHtTynaO8vn0NpuwAiwd/YRPozXXhraTfDzK8emZ4PEfsaQfKPFoATIVwYmKKOjuXT2wV5z
	IHSXMsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgw-0000000C1JC-1Uym;
	Tue, 14 Jul 2026 12:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgq-0000000C1De-358d
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 12:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jKPto6w/j05Lk5PSl7ezTpQlo5j78PN6WCqg0g3ECR8=; b=GlJ5s2jmSJ8ZR/csMEFRt/atJO
	fnmElgIrl26pwxqCkZLYH8WLjsO3veQ6sjAjKSwcP2ZaI7M30FXwAfqUzrkuRfwEP9gF1Axt8Ntpa
	iRF11nO/DytzTfaoyn4bg+aT8T0Vs3usaDDAghuucGp1tJbVPahopuVqmvogu1T8APET09CxzYl5x
	ZvlA2TUFkPnGKuQTItFS8bDvTFYXylhSSMQ3ZL69E6CXTwoCvOry+x8JvAlBq104bpX6nykzKpQ3n
	praTMOexA3TWq8YEFTK6f6az/B4Lw31/IBdNoQYNNdWQopc8Nbr7FT2NMXHzSwOd3YdXQCeNXjozq
	QCw0db7g==;
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjcgn-0000000CVAn-3UZf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:47 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBhRMj2127158;
	Tue, 14 Jul 2026 07:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jKPto6w/j05Lk5PSl7ezTpQlo5j78PN6WCqg0g3EC
	R8=; b=cWnRhKC4yoOhMjc2ICR5sFKGqEGeH5vacb7nl1GkMbYuG2Lke2jW39aGR
	CSO4No6ot6QbT6Z4bO0IIfY73AhXsdmTtyKDTbRce0LWFzbKBJ3qrVF0KX+QV+7J
	b7TkrIh0V+R6ibUpKzJPc1kns1ElxYKXz1bXpRPRHJBZL8sUbdrNViE3duOOIfRG
	3Ek2iFypddVqS1kotiudr5p3JmrJquZJqt8fScDL57gqUSPZpvXnyIG0NHxaDNU4
	E+2S3MjOo9hamR4e+c9Uxts7GS70csgmF8yQrIjg1XV40pjWndlvVZmErP+JlLba
	JwEtvqwzsQUiR4Y0vtRMIcqfX0W0g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdmg30btv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5drf9iukX3WcHRuzogxEqFfr003i3ewtimJAeDeJRXwzXSF4XOCz8U0/hVUIKddYmln44CvIrSOeCNgsRs0xkltyKtN2DRskub1+Jxoyt7H4MeprG9ZvqM3LEQCZRvni0FPg1BzCWeRwKtWdqIFKBOy07zzjKdnAwLMKRVF1YBZw58nVJ6mgJgWFOkYLBeeql/KciYmleSI7OokUH70OP7jFqkvSDFHF9DCOIs8hJguj3MrovtXFVz75BylCSzubKZ3TSjJSMG7Q8nRmQ53E3sKdZdguBlny67pxOzcSUWo4AtUjVtZ7ysPwW5woVxxKjvqJIPw6I89maeNZe9/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKPto6w/j05Lk5PSl7ezTpQlo5j78PN6WCqg0g3ECR8=;
 b=JKLS/yiVqamqa/ytx9Vs/RMdJSE58DhTw9fotxsOElnczyO6ZaCNDpFfb1YPlO4MEvjT5ktAJoyVCGCtuBVBwukl/yRmJb+skTMl2RwcQe+ZONkmr9S55X25Vyww86mPoLJRVAgNT+gQ2qgWleIgL1cAWpJ0KDDWHTK2Am2F0P2ZwKwrFq0ukMBXM3Z0TK+QSQyqytrDpfkbACxS7RW0IsWLLQNkbRp8BTfk+tIWU8eIlKm+WxP+VqtiP8QcqJNbt9Jjr0MBDC8Su41AoSs81/UfIAr+90FfWr8QS2xw4ApMmRdXh8E0fSyw3IeiBRuWE/Wj5AejDX0Q373O+JHxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKPto6w/j05Lk5PSl7ezTpQlo5j78PN6WCqg0g3ECR8=;
 b=K16gc0MogLGJjy2H+3rM3A97hluOflwvDr07ft6brxxFAAwdTOKUZKgsRtBF68dclf5ZEudl22fy2dQls0R+0FrkrFx0imMpqiFtfJiVks6gCxyJ1dpIGEgPgS8BNoVV3XDrOXpWU/rlx1rYhbvXvn+mo8F5s8jFrN21rzwQE6I=
Received: from CYXPR03CA0084.namprd03.prod.outlook.com (2603:10b6:930:d3::8)
 by IA3PR10MB8468.namprd10.prod.outlook.com (2603:10b6:208:583::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:56:34 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:d3:cafe::60) by CYXPR03CA0084.outlook.office365.com
 (2603:10b6:930:d3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:56:32 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:15 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:14 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECu8fV546300;
	Tue, 14 Jul 2026 07:56:12 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 10/22] arm64: dts: ti: k3-j721e: Add DDR and controller node
Date: Tue, 14 Jul 2026 18:26:01 +0530
Message-ID: <20260714125607.3304375-2-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125607.3304375-1-v-mannuru@ti.com>
References: <20260714125607.3304375-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|IA3PR10MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ebf8ee-f1e7-40ba-d5cf-08dee1a75478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: BV6t9sprd2KnUKoquFI9V8277/3kj8asODfIzQ5T4Jh6uf/t/CNkoSnZ+Nx1P5FjowYeVrCxnLrpmG7C/vClQEEVW7A09DmwT8TwRty+dikZjj9IYZfBAXXZ2xe2xQKUkFaNFFRHuQh2vZp/nU26GurGWzSGKH5iUCsn76pboPM3aOCiqou1VXMna2oXlFCPiziIf2LoNSYol0SVtxF5bJViJKJ7oma8nUlYQGOxuTZHKa/tT2OGbobTPHQ8SgnqlnIF09gxn9vb6QiyxB3Cncm3v4gzWy5rqabqhsD2dl00mdK9DqUGgJKb68nFXEidwz5cQAhAsFU/qrUtKEcx2MPWfpq49Cj74MQH4KOqfL4XWDwAkEION+2L0M9UP+/bRXZiQcYf8svgNYBSSshf+a2UHGFr7xfI0U1+aP/dL4CG1jv86mUiFGrvNR9XbMi4xC+3/QXlzm8o7cgIwZkPbd3hwNRrNEyLwaOKd0iGUMTThvg/C5zBE+eEaMjut6Jz/kre6LD9xlDPH8kJeXU/0CFWG61T9goXvYiNrhkyGXe9r/eGaAod7VU+KvZ0LzGJcMUibZ4COD6Z/O1mzOeEC1gDkgWZPVZSxRTcANzsDWfBS9Bz0nIvBGGuN3mS9IoYmLf5diK1bnuQ00TLDJTYaiQEokRswatX3nZ0lRgOi//fC6Hbrc90hvARn2+X6fMheqPWPg+vW8aX3nHIkHBscg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Kq0D8EG5urcEyifiY3EljaUwAfwgvOnRNyIc8bDtRejxiKYpfCtLFHsAyjJhPRjdUCWjdrQZelIK4miwnyvmNXJNimn2sCulmGIPRTplxDbGhn7EMcQ1xaYHx8kpcEj+5hui4WqZJEMo2lqOdXUh+7ywihKJL56MmvQtFbBH1cQ//NUDLWTBByUrqaBS8lMg3sfmOL0kq2Wzfs2b4L82sdT+eK5hoOrtfOZ/JV+F26NZvkJPMRK5ZV+5Q7L7k2YTPnbSSDbl0P/U4xAZu1MXzfyENlTfFXzC0BIYkNb6L9fSc5ShcDXPF2eM6BBnOUQ2WDjpAovgDOkE2GtjscuI3f4GjsFLI+hX5Lf95wd5e/6VOzmVBnKUWn+GKPSoguC8Nj64Y0RT57Kl0EvM2k4PMamUGGiMSFZGEU20aX12ojoXvqrkyaWlbvV8j4rsGrDV
X-Exchange-RoutingPolicyChecked: FMmfuO1KRmrmGArguc7pO3b2o+vgMgxxBEAIlQC18J+u1Zd63U+tlEpC7VUBCbzWrJie9WM3P/SuEg4XMPomy89OkO6P79It8YRJ//FSvcrA8LlrEJZS8epkgxwZi4aN+j6uOU0rdWj01PoE+TrVqeCU88z1jvRm6j2uPElgYWmdpyMSzydFlelq0uxEoVrH3oka+4QpGrWZmK2vIu73R27UqBjJ/Oqc/9Ve+jrp22RMbWb9ZmoH1WWiqrzq4ao22AgC6zntPsQcWsHaW+dEZT6SMNV7HK5DnzGPj6Cjoo3LtqgFtrzHkIyil6aartYbp64Nz/prWXxA8xI0FxK+mg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:32.5389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ebf8ee-f1e7-40ba-d5cf-08dee1a75478
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8468
X-Proofpoint-GUID: FDWOFrCCNJytMHI0Pj7MkA0lbTS03XGB
X-Proofpoint-ORIG-GUID: FDWOFrCCNJytMHI0Pj7MkA0lbTS03XGB
X-Authority-Analysis: v=2.4 cv=EMg2FVZC c=1 sm=1 tr=0 ts=6a56320a cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=rrn-1AkOBrcl2fV5P3sA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX89jRqlS59AMQ
 dTqexrZvX6KEtUIxQp8r1WwwXP6wPvh4E0sg4dgSEXi9jGJfIH7qkW0KM8OonX+04gVj95h3FI3
 +ARisaWDeEBgY03XuicI4jS2VaZ0e/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXyQlOrSs/25ou
 xWxyJzqbkRYztullB8JcVhXxqjrPa2sIDhxm/H4gNoPDOxbR5EQYJLv4qFwzLTinLEzG/pzJRh3
 Ml/PK/MFbgCrzjtdovmaXpPE5efdc8aHCZmDPsTVQ5EeOq4jkSeBMqB6brshdFOHmM8AbHqUFad
 S0HdgLDQ7REWVD3PqMuhmJNDuRU3Z9QMZ6PaAM9dgaY5pxO0lK1iO+Zde3IaOMhCNpGVNzN25Iw
 f/FWdCItHbv84iN3lsC64d/MiWlvZhQVZQ5baQNW+snzDFgKZqZk/NtonOt2/qhj9hkIrVBLGUS
 s0C/EU7o+Vs9lNalP0ZXY8dCsGcSPq3aPICFr/7EAuWXaZj/8DxBHeZ3vrAZ//1Jl5GmJmEbNiF
 ygpcUVvrz69MtAOublDooK5PHo0eGSjQbEzEkkcwKse7vssc/LFFRXxkuAbZUQGaB5zBn+hPxG7
 3pxqXG33LtL+8blT8Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135646_135547_9265605F 
X-CRM114-Status: GOOD (  10.57  )
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

From: Neha Malcom Francis <n-francis@ti.com>

Add DDR Controller and LPDDR4 node for J721E device. This defines the
memory controller with its register regions, interrupts, power domains
and clock requirements.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index d5fd30a01032f..67f1bb700f9a9 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -2928,4 +2928,36 @@ main_esm: esm@700000 {
 		bootph-pre-ram;
 		ti,esm-pins = <344>, <345>;
 	};
+
+	memorycontroller: memorycontroller@2980000 {
+		compatible = "ti,j721e-ddrss";
+		reg = <0x0 0x02990000 0x0 0x4000>,
+		      <0x0 0x0114000 0x0 0x100>;
+		reg-names = "cfg", "ctrl_mmr_lp4";
+		power-domains = <&k3_pds 47 TI_SCI_PD_SHARED>,
+				<&k3_pds 90 TI_SCI_PD_SHARED>;
+		interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x0000 0x00 0x02990000 0x00 0x4000>;
+		ti,ddr-freq1   = <0>;
+		ti,ddr-freq2   = <0>;
+		ti,ddr-fhs-cnt = <0>;
+		clocks = <&k3_clks 47 2>, <&k3_clks 30 9>;
+		bootph-pre-ram;
+
+		ddr: ddr@0 {
+			compatible = "cdns,k3-ddr";
+			reg = <0x00 0x0000 0x00 0x72c>,
+			      <0x00 0x2000 0x00 0x4b0>,
+			      <0x00 0x4000 0x00 0x163c>;
+			reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+			bootph-pre-ram;
+		};
+
+		ddr_pmu0: ddr-pmu@100 {
+			compatible = "ti,k3-ddr-pmu";
+			reg = <0x00 0x100 0x00 0x14>;
+		};
+	};
 };
-- 
2.34.1


