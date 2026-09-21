Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3C4C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vPuQfjmj4b1SdXec5fj4KRwy2YNHUn8NSu++CJNRQ6g=; b=uWMvJJNfvAJKWx7jx5alXhit5L
	pkBffcJSEFYAQm1Ss/LLla2QeLfhG9Iasn0YH4Dtxvj+Y61IjUZsAq1zQcavpAevT8kXA98embGLU
	bStp/p+8vDdc0OwDpaW4D1zSFbyiGy6RGzwGKB3mmlJQlrFtCsUnbMG6lTogFBHfB+ox4OsAYha+l
	E30oQoBWFJt41jhg3kfYt21LD8Feabx67dE3j14lVjAkJ1erYEbKwbUvkF1Xsa92Yd57yUrGILAeU
	5OgHDVad6QP3NwILIgjU1p/Awlqm8Wn4aQWCM9fboOzzQ15fp5iWgy3OtSET1tatR1wcWlI4UsiP9
	8OiJUQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8j5N-00000003AOL-12MB;
	Mon, 21 Sep 2026 18:49:53 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8j5K-00000003AN1-0ZFq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:49:51 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LIUFIp126155;
	Mon, 21 Sep 2026 13:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=vPuQfjmj4b1Sd
	Xec5fj4KRwy2YNHUn8NSu++CJNRQ6g=; b=gSV8wjomrEosFfOq63ryqLUSKDHWV
	J8sd2YKmDYlyxX17hF4e3hFTgstCFMk/xTk4qWvB9m7+anP1PXNzpH79SSVC3+rO
	EUvgcsCiiSrlnN2cW4gkV/8roYEChwMti3EgZPt7gyRpMqvRkgjlmFAfd7jwIGTC
	7C/PKOhRo67Po69m16cMlTXkz1559GhsMyr1zRGB+zZC1YEs7iwbngbwcei3IwDp
	O2x5thUM+f7p+RwSQLew0mdpoLeZu07Pu19D75WlWjUBVUL7ya1pRyF+dT8Dl+KS
	S7lgxKo27q/C4LobW8eEh++j/QfMDkm4vBwQMzDoGW1I6boTmCSwa5BdQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gtx9fcj0x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 13:49:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsDd8wRQIiMarQzP+2wae2aPESgZK7NzbakrEEPcjqXzFNYWDY/+ccmxVWoVOFZR0oVI1OP5D82uX+LZd9icTKs+Zj1HjI+gtjqw6LfY6QH73ZAeQQJ2UmzTVHRjG5CGR36FyfdXiXcN+FIHw20Tol+atomlvipOp3kJnJ4X5MAD28mLT+pOBbT+cfqC8+cQMrmDHR3ukSush+AitSGpVB29DGCqsR+pDM3sQB2RNOw/Lc+VsWQ/zvZj/CbfaQsqsmQRgIMGte8fwJpJVWy00SSZ2Xca4A6j/8mK3nQwMmVDSotnRwQzZT6r6oR6Kdxce5cJ2KZ/GhI8svo9fK02OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPuQfjmj4b1SdXec5fj4KRwy2YNHUn8NSu++CJNRQ6g=;
 b=buvRRxclwnmIIeKLTu0mSC/18m0A6W7c2iGb3FbQ9L4fFJOGwAFsIBoprPCXZ7zA/Ky5WpVz4QTGY6n0VdTI+Hz0hjyCHYSgZIXj4IQQ7mw8MRfXwz3Cbl3GR1QBji3PW1e7/lBCDMYL63ZDN2XY/2dH1WQzIvCDTa5qNoyIRRQoLz/qzm9GJsJ0pFVKc2iqFo7CNlg/6EO3lhBVX9fOAy+HE1Vy5PBQyUhCLUWlsML1ys56iVcIse1HrDcYB+oXG0bOCkjXnEmArFkfcxLaJEJBCARIJS5UQviuyMoy50uCqjwGYuzN+pLkptQUn6VHo8hUXrHGdw2p0DE/oZ7wHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPuQfjmj4b1SdXec5fj4KRwy2YNHUn8NSu++CJNRQ6g=;
 b=tnZc/ot4vP8+Cjp5KSva//tTpeg2GXfWEwI9rH2A3nrj8dwJEUBMZ24LhwtSa9QRfM77gRb7wAkLB9SuAY57G9NQliPYviw2GGgDGompmxGqNHeTG3jl9JGLQCeOOlk/j9jMMiq2lTe0ARkl1msckCGOEbcx7EosPk1KBkHxVq4=
Received: from BN1PR14CA0001.namprd14.prod.outlook.com (2603:10b6:408:e3::6)
 by PH8PR10MB6528.namprd10.prod.outlook.com (2603:10b6:510:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 18:49:39 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::8) by BN1PR14CA0001.outlook.office365.com
 (2603:10b6:408:e3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 18:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 18:49:37 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:48:55 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:48:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 13:48:55 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LImtid3523558;
	Mon, 21 Sep 2026 13:48:55 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v3 0/4] Add SRAM Nodes for VPU 
Date: Mon, 21 Sep 2026 13:48:46 -0500
Message-ID: <20260921184850.3810018-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH8PR10MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbeeabb-e4e3-4f69-a952-08df18111668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: cgAeuuO82ffMOErvPg+IFUaKoJ6JK+I7LtgHmfFTWWVkrJbZKI4S7lwN1lp4hiNuW8ep6mMnAQHH6Z56OGOHKnnTEyerntK1lf1K7tMZdWelKuFLQ0kom5z2CylZz9Fo7lgfau1Gp3r+J2C+781ZMck/kXl8OphmQoPMXXRP3KdHs+HZZ4phaNq/N5RVry2OhaYwKM4QeXE0LIShtyRvRW9ZdbaUIGmN2dcE+MpSKDq1j/ys6svupOV/JhPEI3TEAvjEk3Rdx6KK4Z+a3ZVbjz3akrSotUlAWvwlCT3B5D1eUR9quwCtTeNMKDJXod8XRnywL3X+lLajN7ONl3IHBeAdPQR3vD3MDSmkeMVrZHquSylb0MkzFocCgAaRH0jRyvdJKVZCttI00j4GIEwNNZ1BsrG7Y45JpNZCbMattBlElBn1KRgJdPk8JjcNUiCNqClx8QYvwZyw+uc2He+dl6vcmdBA6Tu+MRzzusoUHkAqwn+4/e48wE5WBJ+zh/lP37sJPztWb4jPuCVUaw5fnDb8fvjV8kvJc2LFq6jL4Xq/OxuvSSA7fRzIwy/cLWKlr5aXIQghj8gaYNHVL90ddIYk0YOUW28r9R7SqYKsGZPFFSikbI2+KohlJgD3XcP48SzHnS3VgncEmnzR3AFVL3S5X/nS5rTzzXEx4uDSmVcvJyLqA1kbyolTxLqpB/spafY/kU74U3lq98I4cwPJ6Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dSnueJgEphb/OYwqqgnpNPpSlGKo7Rdf+jLnjYDp7P5XbSeJv1CGYohI+RwLOFbpf5m8wjmivku7B6uHkJD5km9GyZnw7C4eU1qHp54BWFtIJ6myjp8kQAksG3Uqjx+5TLpwne18JDHhS+O5d+tiJDMrGb9iLBfKynYhXKBmPTx6bcCrmqOgVyPZFuVao0pBjlhSFIu2UdI8zMnDuWjCYSENYZ9m+BDMKvVExK3bQQ/vWJ1z4eSqU4FCwsFpJyDrNYnUJBPIHelGFGMfEHrC51TSRJk5AWLxNZoZcvWRUwmYLAlgZNqmFO3TiivKF6m6Sw4t90/PhUpELr2LsKkxbanVRIkM+7tD524Qf57XCk5iDp2Ejf+X+H3Jd38tCPV5DelDAPoUJStYnumSH+hgfpaki3NTtQtHYULaqG79akJ1pGYGz/xSLKLCBKSv/NKc
X-Exchange-RoutingPolicyChecked: dUYeHv6VS9KVCHSAu3khkidiLr1paYnMknjxJDM+nWVmzSwp5PY22IHnDGlV8YACCjIpesWuFJSB46Rgb4yUukq9rbPTfAHlalNKoRpeVx/Kut7eawWhXjEELO9ngFwPEohCYPcwpzLaD3EK6uwqJVB69IoZuU4kegKPZJYPdnCTY2Z/WQF74D1Q7lFSUpBZo8wEO99W5Hu1gRKnXJ5oqllsaEvpm97JzMJlFtZc1XdPKuhkTy3Zz6Qd+x1xxLrnPAMyAOd5pLoEEjtDlPkpQVD4OvKxOiOEILGNk7gEm0RhURxJoek24t0d00VkXkaiDwBnDUHkZA5gLQ8AZ72KUw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:49:37.8193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbeeabb-e4e3-4f69-a952-08df18111668
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6528
X-Authority-Analysis: v=2.4 cv=Vou2kO2n c=1 sm=1 tr=0 ts=6ab17c4a cx=c_pps
 a=EbvyHBp0GqBzY/XWR/wUiw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=SesEIFMNbiow30OJpzoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfXxFEJVpS7eomc
 2QAqdOmGeSj3swLES0NZoDNfplRCJw6XtmW5hooVC3Sz8lOamHT/X0N0wxVBhZYmbu5y/dLBkkj
 UwS6WCc3DCdeDTqIHPNWCpTqedPbvO0UDqIBxGmLQ5DUdHHb8u6W4ECHYNzhOqaqvwPLEG13jsc
 v7yNntv0oSmKvEJ2yoyuNnUVt0sPCTNGYpC9gnoi+fP5H++Fn8A/8FMObtCjmZxB4zm6nToNJt+
 cG16s9gdmqbf+p555QQ+X4aKFDzt3z71vRrk88s+WgAH9dWOGD7IUbbQ00jjOggYyq4MP6Z8ih8
 bDCvWoTRWF7YX6kVN95t9g7GmBlwupM6Zto5g8Qlzv1QtiqSis8snJSy4rKN9+GNRogF+f7EtGE
 AckfzpvH5GqpCO0APZn9ZT1ejRY8I281gdk8aGkBytmmVjaw7x+5sZTeVVlrlBtd2XtgZl1bhN6
 HckIslzARngE/h/VbXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfX2ZIJWKQ4bjcg
 Kz/ZRylfxVPa8agCmkPVqscsxZFD9vf1mEoCDq9B+sWiQIt2qifBhEg27jm6SAvAkXKTA1SrjYs
 Aqbapg3ht3NS9Nb6hAK8wZ4DsOkO3hw=
X-Proofpoint-ORIG-GUID: vU_HJ3x2pAYIhchS5tFXc-zDh7O_vAMK
X-Proofpoint-GUID: vU_HJ3x2pAYIhchS5tFXc-zDh7O_vAMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_114950_306607_89682BCF 
X-CRM114-Status: GOOD (  11.95  )
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

Hello All,

This series is responsible for adding the SRAM nodes for the Wave5 VPU to
use. First patch is responsible for carving out the SRAM pool from
main_navss that the VPU on J721s2 will then reference.

The last 2 patches use the existing oc_sram pool already found in the
relevant device trees.


Changes since v2:

  - Removed j784s4 since there are two vpu instances, need to find
    another SRAM pool so both can get full benefit of B/W savings

Changes since v1:

  - properly updates the nodename in the first two patches to pass
    dtbs_check. 

Best,
Brandon

Brandon Brnich (4):
  arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
  arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
  arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
  arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node

 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi             | 9 +++++++++
 3 files changed, 11 insertions(+)

-- 
2.43.0


