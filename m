Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923C0606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kvkq1lg7;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=QnUg3B2W;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Zv/lKAGt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qhzCFrM/bwlLl0+uB/wPLMDKFvPzyByL5v081LkcOGo=; b=Kvkq1lg7xe7++UxqJ/2P+itA4l
	i/gS3KGtibXECNnTX+Y538y+dNOkoSSxBTQ5FRuGaQ2pRUxJH1o9H9IzuZNh/sjbno2aV+p8Ym7it
	lXfRoNoH/rV56deAERaSBrxQJ+VnVDaplmlq8pWQh2MZ6ZTeMX1tXLujuEzfFp/KWhijXIy91ZvcW
	w13SX2Yzt/LVKSBOUmiurdd0PsS5MaJRGHh7WtlmVYKgw6nNGG+3YGhW+Ie5GuuDdGFQe5C6pyXa4
	C0Mc0XGKGaoSkZ3D57hoO3KUPUKiiDnxPvescbZ6TO/1ctZNfl/OOvphh5uHNXaF5pZjyBRoxqdh9
	Cp0khWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUcJ-0000000A43K-01pn;
	Thu, 29 Oct 2026 18:12:47 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUcC-0000000A3yF-1GCT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:12:41 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDiUH2604289;
	Thu, 29 Oct 2026 13:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qhzCFrM/bwlLl0+uB/wPLMDKFvPzyByL5v081LkcO
	Go=; b=QnUg3B2WiXY/sPMXX4LUYXCm4XI1wcNcaDEadI0AxKV/S/Hl/qqXP3czt
	NwUvqNPTHaHDKrkLkROeN8F3aPwTAZFlYiUxA2JYIOCD4Dmd+kGz2rco7T8IFBXX
	/8IJBas/hEScWbUWLxG5jvijG73Cx5f5DgkYMfQZKzuEaYk8ahggSY7llwxNCyyD
	NL1LkgtCF3yW7fCXyEjwC4Te/3KcTsQCKEfPEkrrFSCogTbjWnpzRRRjFjKYgE6+
	6If6k+mLNWt/VV7JVKcCqrJTn0DBhti+37oQ9yluQ0vF5s9XCVugRQKy9Xv1ws+B
	jvi5EjFNgnvLdoqWwCx+PdH0/vXrA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm55ak3j1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5GqTr1L+q7qWZNf64reuyYK7P83fDuh2Ngs/c2wE4rWUap8KpiLolvtqO9sffw5eaBtMls0hnKKknDoyEK+YXRAMibPvYx0nYlzY97awbUwZrxXE/o8mDG7ZEYkiCf5hWwsj+D6PiB+W6x/bAMg1uIT2iPlRFEi9natz/rW0hvSgoFkdcMGFH4Gyep+ewWUCI811QO+JooS0AP5KNBk+ynVi3JuPYOknVbHS1iLEcbYJ9cdeoOXAIXSKRMaFuIckMLwrpkJJwKBPwXi355ad6yaPEv84caQaEuv7jvN/tb8oNb+9sz86cabUvWKsPBDrCaj1cEpljGO3RUXXrRgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhzCFrM/bwlLl0+uB/wPLMDKFvPzyByL5v081LkcOGo=;
 b=W1kMkxpPBWu4FbFpGmREbbCMFUg5KvDOkFhSCaKvsgxQy9I4njVfTCCX1iz1/bIryz0zuWR/NZKYItf8nYUUTfaldZ4eJbR+POco9DR8TiY/bnGKtv9GCqblSpmv4zgsP/q+7Uoqtd/KCCuJVyDMn7M2iIi8Z76hauaJ2cFt+MgU2jGPEqlDq9CMZSZpzjgo8EjoZLK24r1/nwrnBVyEaR5qI1sBYM5LkuwSfYehPLSm7xTSyhpSKKDeHR4s/MFw+2HF/01M/Dgh3ZxNaoJpiMgUjw+MuKo2barSCrUvTqeaOuP5eJPEYmEmMiHTEtBPIfDyDN5YPBluwsnjnCic0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhzCFrM/bwlLl0+uB/wPLMDKFvPzyByL5v081LkcOGo=;
 b=Zv/lKAGtaTQZ9xvAK8yOeuqHJO9Hr+nTT+8dAnE6EqLRzDAqdz8l8+TnVDdYNhtz93k05Kl3/ao8t05mfZeIFtF8Zfccj7LyF6Cz+K9zDFOmXF2rDwrpekZ/3QzCNP/aR6tsBjmVourhR4pzNKS0+oQC9qosGVoK3NxZni4FCLs=
Received: from PH8PR21CA0014.namprd21.prod.outlook.com (2603:10b6:510:2ce::28)
 by DM3PPF3494AF07F.namprd10.prod.outlook.com (2603:10b6:f:fc00::c1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.9; Thu, 29 Oct
 2026 18:12:32 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:510:2ce:cafe::36) by PH8PR21CA0014.outlook.office365.com
 (2603:10b6:510:2ce::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.3 via Frontend Transport; Thu, 29
 Oct 2026 18:12:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:31 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:04 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:03 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM43408718;
	Thu, 29 Oct 2026 13:12:01 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 04/22] firmware: ti_sci: Remove out of place RM debug messages
Date: Thu, 29 Oct 2026 23:41:29 +0530
Message-ID: <20261029181147.266771-5-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DM3PPF3494AF07F:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d136dd-cfb6-4ba8-a7a7-08df35e832f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|261026140227099003|56012099006|261009223027099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|18002099003|10067099003|22082099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: KUB+GMZgURWVjqAmorqjkzbNWYsTUHLvJwuHA9KsDD7wvp0ZW1cLEJY2ccvsr2IFKyOjKO08vuQ4cXe0EEu5uRcILAaNmyVnn0eqJFcXOU7ir8AU8lu86gC/lMkf9vhtk4ghwrQBMhgwEJF61PunPftjnkK5LFs7FRftzbHYLjw868fzvIPaR/e7oir1o766jhGTCqoJdmkXT8lYcZabpxmsnxSl61ff0/arlJccSYvPq88uTweO+b/1bgY5N21eFeLM8sgD3KQVYIo2Kdcg29IYwE6a9YMvtcpO2MrdLVvgN4AEWiv6MjVzJUt10BBVbBfMNXeeTJzI4ZiT6n00/twnhRVSrd8U3oWV9gjBTKupgE2Le8thiIE5OCTHCxMMe1rq54RBk8ds0xXzUjBZr97+fFoanmHl6UCIk1kCtPDjmH1LCcexm9h9Yi/o13jl6bu8e60E9mNbBrHN3o7pL+RPqmlAlQAQ+LNTcf46J52Ph2sr/XxU5z9+jcwh3ygg4BANOBzng5ui7pzJwGWbV+60WFnk5wh4XGo6k0DPIb2dTP1xX2Xm/UANgujcjmZP5KQnp1rZknRyyGK0bCh09XR0VGgBfBrWm72Ft1WM+Jz0dyeZ7DfxV6027bnwuGSXZa8xIff4qFZ2aUZqRe2EO42u0sOgqZXNCPqx5C6Rgek=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(261026140227099003)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(18002099003)(10067099003)(22082099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kUvWp3RM1UGOTOl5c5g6YyZX0Z8ElJLHPj6lCxYfdIlYYK/0f71h2roq1QoN5EN/PWVqfiWBwnp9NYJu9S+w22nwP8OoZ7V0E1so29FewJs014ITP2+hNj+qSZ92PJ6RtdQNr+9+MPQTys9MTC94MFH4w3UcpfzIiuavwlqtJeCTl/bosvPzBrHYPBk5bLr2bykC+wmTxQ5k6EeQM7w268o4A6u2KzWHoPRGRCnAp7N02dwJ/xL/kg2BjmMvFR/s8/Qd/YIGteg/FoO/vl4bHQOOZU5CxceXu2IeujqiB/F4/01lggsp3H77SGB/ccqyToCSiE7wBM+8vTeM9SL24p2RjcrkTKkhVTF3vAmeyjX0qQhFisYdskH9XPS28CVgAoif+Us8vxx49/4CQOIPPSjfMUVlI0yv6vXzCIHQ5eDa9v20/IfisHG4yK7VgGuV
X-Exchange-RoutingPolicyChecked: Lm0ceGK+KOGCz9CvNnMTtfVlxQJqVAjkxdAHhV5eXKeP80aEfV95/EFT98Bis2L8NlA59CgDY6LTT4Oa8+SDY2tXxIIWDfAylhmPkUQRIkejhFEkdAwt+n/e2ZcPmtDJnwewdRw7DZ+oXc8Yr5KHEeGjfGE3edS6oAGSwcmbqXN9LWnxQvUqQMsrI6qSM8TvlNuaTOR3/69F+jvl0G7z3kD8bAHQ9Dd9B5JaqQLx2xeDM7B+FaLaj4sdlLV4d/RTmzKNte1jAVf6VCdaGeULf/+aYFk/oyg8jjjAW49CPFvyAyHTEz2HpiwfBm+s34xAXOWv3oWDLCmSlB36BUecjA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:31.2952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d136dd-cfb6-4ba8-a7a7-08df35e832f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3494AF07F
X-Proofpoint-ORIG-GUID: zOGBPkTGU9js-mfd02rlOfD1TQy6O6qy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX4HcBZE5wS5aJ
 bDbj1gBBKEiIYPVOo8SYO2GjhKzG2hA9ga+tOlQMCyWbqhzZI9BRIUWEKltihLdjXIDXtrISJF+
 LuDi0FCDQtGUfbaHqvUvhL7C474ZPMNBvbeR4X2OsaUpmk9CIqtb4SCUsSRFs9sW6uOxBb55XYF
 tJvUkocSPsbLUUsu/ug5aUk96SrWUD/G+3bmjGmFRgawchTA4BElF03MjOp9/+RtzYShZJNLSp+
 3P2oqWo8WTq8/gs7f1fEq8gJYnHw0/rY8gOt638i9pllNVCRXShyc2h2waYIpw+aW3V9M9o5AwF
 rVPE3EdUmwiPvUcYXHOVCs4jsDgfIpBHKQGU8fuUNle2ceh5MnXFU2Omcy43oiUxSVXg4jc3Ver
 dJB0Oz84eL7hrHmzQMwSob113F8W7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX+ar2OkvbePGq
 PGN4sdBqX3/eu7+/BGbrDEIq0ANkWtz58t5suCTLNARZY/uwDqF/1thuo2tBlYDUkEJtiQDhZhF
 xYFfYWyNPz4susgV8RvupTQC0aaWI2w=
X-Proofpoint-GUID: zOGBPkTGU9js-mfd02rlOfD1TQy6O6qy
X-Authority-Analysis: v=2.4 cv=eM2GH3p1 c=1 sm=1 tr=0 ts=6ae38c95 cx=c_pps
 a=eaWElexNrpfURq8UtOOyIA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=h3hOHIXeJSkHiXZvtOwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_111240_463695_E1B3A2D3 
X-CRM114-Status: GOOD (  11.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Davis <afd@ti.com>

These debug messages only print out the index param that was passed in
from the calling drivers. This does not add any additional info that
wouldn't work better in the calling drivers themselves (k3-ringacc.c and
k3-udma.c). These also make later cleanup around device fetching more
difficult, remove these debug prints.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-5-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-5-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6ec16fe57f132..a91db923c8939 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2405,14 +2405,12 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2439,7 +2437,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "RM_RA:config ring %u ret:%d\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2555,14 +2553,12 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2598,7 +2594,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "TX_CH_CFG: chn %u ret:%u\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2620,14 +2616,12 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2660,7 +2654,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "RX_CH_CFG: chn %u ret:%d\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2725,7 +2719,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(info->dev, "RX_FL_CFG: %u ret:%d\n", params->flow_index, ret);
+
 	return ret;
 }
 
-- 
2.34.1


