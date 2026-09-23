Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685E7C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUpHgwiRAkVlQ4/vbKXMbL75Vk0boaMCeijFB4Y3JQs=; b=r3YkiRp0xpDtc9ueJlHL6KrIEL
	7eCh5SUdQPPe51ofQ4MNgW/bUwQlLy/DNlo+YBSisHzEmKDOpavuIPcOO59LomyNnKYEB+LuU2Zpc
	oXY1rw4RG/8QJVNfZEhrfVLolhrZv3ONr7m6H6deUDhsa9/54GHfMD+Ln1pM0qtXP42ftNNuwKVyo
	l7Fqymy4AWwPLHB8XW1NqnYSuJXqrodG9bwZ833deZlfvuU8x0G4jfojz6vgzpuH6VRrktMbjdP8h
	aR4wBdchgplD6SU9ZOlVbUdTcjZIbCFmiWDKhw5udo5F3SrUJ9CYGc/zyutv69FQli9VRl3qEO00N
	2bOa/GoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kxz-000000081vZ-10Xc;
	Wed, 23 Sep 2026 11:16:47 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kxq-000000081rg-0obb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:16:39 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8NB381611723;
	Wed, 23 Sep 2026 06:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eUpHgwiRAkVlQ4/vbKXMbL75Vk0boaMCeijFB4Y3J
	Qs=; b=JEKlgUrnBn0mNcOXtpJheHvLkimU39g/jb31EXQP67xt54xvzH+04n1tZ
	3mGzw7kK1cjCSg8nEr3bbChjdGzD26cD29NvWnXdHCkb+28KAH+6oyf7GJmAn0BE
	b+WyliK7c8deunbbJ36KFlXZ67I1HiMUJeM2uGdfVfLaOCLQB2Gu6Wl2LStq8N0i
	BlffRVSK1HmyP3jTN4ewDF+pkBnB3Wqwilqp3BMkWW63eujIOjULK8qYR3XXsimd
	pda8QEU59tA+h2S+I1Dht2qH5OK8pRKybt9P0ZayYhYHitekTgM5YBZTiSlbYo9E
	nzJhBE8XuJF+RKgFvxkQV87x1kNGg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77rvsn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:16:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeQ63KFrnxVbPl0l1VyZrZfNLWIYsuYkN0PEveqXiNT5zR5jvoDFMEQbxQAlWrFWro18HWmeywNd9FOm2JLreaEY2zogkWqg4YdTT9/Us4KNTvgfiKJHZNfyHMwL2Ytr5Wh1wbM6CArgQOollXI0angt9Rytx9BUq9jZOPmueXntuVgECodgzrUHSRuauX3WGwbpUq+GndTvDlfP32is/qcC/zROniuxU3Aa1JONlOxZowl7qQERCrVppsfvPpaKmLhZO6FI1JW70aGE6s3eT9n74WMJfoVX944MyZ2L1CYJdU7/5LvjaeOIsgJp2UMVp7hB2CZnBF8Jlb7LCBZ8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUpHgwiRAkVlQ4/vbKXMbL75Vk0boaMCeijFB4Y3JQs=;
 b=PSI3iSDWU5iRL3gmF5/glsqR1hfVb5EKaFbXB1YFpLsYVBgVKillwmtv4GucuqH1F5ntGVRQNEDnS6fwIy6fJb8iIfaKZM+q2VVzNkA/nghtxXLJpM+wM9LD5TD+fYi0NmuGUJ1OKqGW8409SFjqb12Z22popwBlVIMJLljm+3rhpRSqHzZzUTemW3iHqLCzaLevc8H0a7jzaHk/44O6q66nDCPw6jR0KqdlPCm66BpiiAfvCQECmtNx3eGWl/V2vggIsXFhWu2hfht78lSKyKl5mbh9uY8QkPBg5zgZ5ZVSAQDrgolAbH76Cf+tGrn6Ck4zvVRxJXOiNwPjP1YeYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUpHgwiRAkVlQ4/vbKXMbL75Vk0boaMCeijFB4Y3JQs=;
 b=XUgJFsrMhFopKUo94bAAjciclQfVmPFv6oYDpf2AmNSUokLFI8eFFxAVwL5rdSZxnSisboKP87cjcwxdzB1eolHCJxpkS2re6vdVPxYe0rbq9VrjD9r0uizrRUQGzdwGp74uwRaB7NxTjASiO3wYs1AUf5VSq91+n5u39pyHeCM=
Received: from BN0PR02CA0001.namprd02.prod.outlook.com (2603:10b6:408:e4::6)
 by DS0PR10MB997956.namprd10.prod.outlook.com (2603:10b6:8:397::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 11:16:32 +0000
Received: from LV8PEPF00000065.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::a5) by BN0PR02CA0001.outlook.office365.com
 (2603:10b6:408:e4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 11:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF00000065.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 11:16:29 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 06:16:15 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 06:16:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 06:16:15 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NBG5mF2804750;
	Wed, 23 Sep 2026 06:16:10 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH RESEND v7 1/2] dt-bindings: ti: Update audio-refclk binding and j721e system controller
Date: Wed, 23 Sep 2026 16:46:03 +0530
Message-ID: <20260923111604.4040417-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923111604.4040417-1-m-shah@ti.com>
References: <20260923111604.4040417-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000065:EE_|DS0PR10MB997956:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be9c936-fa41-4809-4f75-08df19641e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|82310400026|1800799024|6133799003|3023799007|10067099003|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dv+0CAVrN7BlaityX8mknRchO26r9KiD9ZlIxfxCyLfg7DtPUZriln6jXeCCWwiUISIIXcqDMggbjA8dn8yrrRwIfWlozPJvo4V0tWjx7U7wZ0txR7g1qIVTvEqA/KSf3S+TVMF9zGyW38IKG+2c5ZRNPyG+/XZTqRZZaypPNJq45dD2Jh8AxbDKajspEDkh4a2TCBGJXI6CxU3xU/ya82cdcSUpVuv8F0qLLUsrklD82S0508GwualQ2LUT9JPm36OV+IOCe6si/QbX5azKKOwHUCjedWehoc1VkYsw/8hqP/aF0+9Vfav5F/H4NIEtjXQtaj7sfRfVr9j/DP/ZSXE7noolx3xHOXQgaTSbhSRH/n5lbDnAMKwdO0LV4QThRFcjieWZnUd374L20goqSPHfmTecLSKWno0BjHg8pf2fCIoL8030cM/SnoMjgWT9qLTKHj9/Jln/hdRFT0xaH1qrTROgr1epkFmOF0q77nuQgWJ3wnkR1HonjAVxCc++OVkBFqGKGRBv+ygvjwlWL2jGMwiw33EyeMKhutAY9TgWdaXd7TC2GzK7m2K2DZc2wVgqEzpBW7gDSK5UTeJL8wiN+DFuZGMlKxF6pBuyQ6xEJ56mbaGOviy3KNKF/KojFPjQo5qwCz5xcY8eajsPHmxy1qx6EuzWprSCL6KH7YQj/cAAYOcjNGFOemQ9rbbGci17+Z0R5nP/uHuHAsL2yA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(6133799003)(3023799007)(10067099003)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DN4K/t5xG3svPQnI4MTjs3iaAUHlGfZsAkv+eNGgaGVDf8L39/1iMyCm9Hwc95TbFzd4wPHa59P/T1z1LEhmdlZOH2k27OWMG2HBuDn+baGcw3veni5SYiQz7bTJC1KqxQ81Vp5CWLyStXReiubK0W0dw2RzbNVl/llHb+wznJjDbMCJYeNoyfDomRYLwE0cL+gx7BVzs8NQRD3sp4aQU5sTzy7nioiho/mNzlN33iRdEgB0bM38cIe1Mp6IlP0f0GFHV4SmBk4vovJ39KjJTDhj4FCfiIYo+oTD1Xk+Y90GA6ZfF1Gmh0m0S8zyrp/j3zYSPuKn5GwuhFvl8ZASjfM637h3KwzYvKlXus06oSUyPzY+qQaVxGvJr9QxZOEz7x4LTr+LDV2azR6/S+TVDVRv2QypVlD1AEixWl8vOe6fpnP4T7WnuD+584A+HXFd
X-Exchange-RoutingPolicyChecked: K2T0f95RED8uOltHoDvK15aEFK1ahcnwlp+9vTqJCV3QPPNF0IH9WFxCP8bNfFFj37G9yX6xJavdZTWhgFcZ/xbTuerV28YJapMqqerkQGh9THXLoHRjFUGyJB1k/hzPtFI3qUIEfXFt5OW2/+l4/lqp+UHGgdE4plZMvZBBCWbW/6+fZ2gTn0QG38CBjrI9dDEEOLEVkA0enzIbjjy4WaD1yid1LhddtxR/CHCyGBhpCN8Q0EcBDNOLpjvhTtcTzX19phIiFh65ICf8umWpReZDlfaSdJ/nXuBJfYWxLrEToa136kK5Q+zgIYbWLUh6pbNWaa39R0RWhvbIuNy76Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:16:29.9819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be9c936-fa41-4809-4f75-08df19641e04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000065.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997956
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX0M36uaBIwAT8
 wx35XsoI7TfkP+ySM3bmSxhDAm9u0w2jcHQ9yi+o/t33bnviDA2EGWDDh116PBIetYsBTXboIjm
 gyM07i2PKQvW9qk8RcVksXLDiBv8H0AJhVb6ShocJF74CZPg7VZNP1tHbHV+zX+QWh1/j2IASAv
 m5IiYuSaLRO6x3HgB6tOmWljbRKwnx5IWbox3/Yj8nZ5gD94Kj1rPaWIZXsNz4dIhzhrzr1432f
 v28/TVNCnjurLrGhNL808BFPN9JHsZYVBT3oavQ9pTGU9nBxZX4Ei566Di524n2blLecUzOG7o0
 c2CNKp2gS/t+xYh3PGW9TU8UfENyQJBNNh23BKeSHhAUpMstzZpaGH5LjhzjeQapunuSQPalATY
 vpYG9+J5f3lix1e//GdWI/aQCw7EXR40TbHiag0MaIc5825mKi0So5TxiQRcRbpAje8A2GZYFZx
 2C+xN0RcrOLlmAeogyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX0C1vWJcHartG
 KVxQb8pgdCHKuN1ESzL+uWdqqSSKqMpEYFxkxYMYzf2x4/cAzkQk1Eifx3fUKLppWyNrcSOcF9Y
 cH34EjtzeNaWeq2GVNmwnq9ZNIfmJik=
X-Proofpoint-GUID: zOMHqMf-pu_i6TQJRxLLDgtOmhugfug0
X-Proofpoint-ORIG-GUID: zOMHqMf-pu_i6TQJRxLLDgtOmhugfug0
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab3b512 cx=c_pps
 a=xsj2MuQvL1s4LVRwU0hgyg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=o73yBMAOqiBwH8_aQz4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_041638_256955_60950F8C 
X-CRM114-Status: GOOD (  11.14  )
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

Signed-off-by: Moteen Shah <m-shah@ti.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


