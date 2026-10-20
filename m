Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE935606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PpUlhF5x;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=g3OXYf8C;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=bpAbSntn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T1ClgVl/HWi8VJCZKi025obesp5Y2xrkqjAQ0Ieie4=; b=PpUlhF5xA8D48DDZHks3fTD5pI
	Y19TmNgaIR0/Jtc36d5q6xqHoN2vrlmpORavobvj4w7pPDtN9YZS4aMGicKZJmH5dbMzvc2R3NCoo
	LHTf8/XudfmqGC8rzOqEltsDRTmVHk+2smRpnDg0YCWmELxGEAjCHYWTdM8oQT+SrODqXL8ez4+AF
	exBCvZ5C4uibbu+YGoH+HnyXG4w34cPzsCcgcgw+ukBbCzledHTCRni+ONlHh/HzLtS+7N3k1bDtl
	M3MHDM2a9h1c/CpFyvSXbhTzJcW9sd1hUH2Xbe8ou7zzF33Q/esm1w/WQiORCAVv/bs4TLavbb2nT
	ayHubHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8LU-00000009aY1-2jx2;
	Tue, 20 Oct 2026 11:49:32 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8LS-00000009aXQ-2ffa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:49:31 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBFWI12359962;
	Tue, 20 Oct 2026 06:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8T1ClgVl/HWi8VJCZKi025obesp5Y2xrkqjAQ0Iei
	e4=; b=g3OXYf8C0bgfl+wknP19kYW9sAstq7HdoQ9a4MmdrYF8848t+V7FMOonL
	vPeLZxKmBjNLpI+Tw9hvjhdlBIGhjPEcdoRtak4GROwSzG1bXLMLcZYXA1mOLK5i
	roJSZuv8RloOM+bgS0/4IQTTgJmEnU0UYM5GZFz3u/HCnePBClHULITd7tOFn/zR
	kpJee6KYbbdh+wJLciKUdI2UIDwCxYkYl7ztfqXmvmJWYcKNf1AuMa4Tvcz34nCN
	tnshwDIsWTI7Rh3IrD81AMcxt0RksClxa4okrRHGb1bxe+15if/rANIip2LmzdN2
	7YKWzGb4IrWVzhW1/i0RbDLVqhliQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4he7940440-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 06:49:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR3aIW/YjQPYwedlT2n/kiIPHj8JVw4eBceXfxcqWNbZ5ldGY0XmfRAStoxNWrm8L0+231PbafDihNWobTUzaIz5Dhy14yb1KiyNyEQ+dMqpDiZcm0p4qU+sMK4kpvbpgdGUrKWC7EsBVNRf3RtbmrEe8aCMC7dIb2rAjuTckA3d9mRbaitHmKRWKE68mGbXWO9whIJ/sWv4zmE46BGmOx5DP5+brWBHQhTAom5rgStMlrnDINWRHvWmgrxhng46HlWrfktii8yNk4LpCzkzPubJlmD5Str8dGcuNgt48a5e9bqDxz4o4i4PUSyX3u6siw/EG1bmr17K3KlAiszxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T1ClgVl/HWi8VJCZKi025obesp5Y2xrkqjAQ0Ieie4=;
 b=f5ob2qewlYHcfN2Xn16tL/RnTuq02hPRAUJq+3IanKKFWxDw740oZKUFDmh3CmpMrkv38xLYrCc5aWx6ABOk3B0jv9QOn2k6SIABf97rg2u9MloHF6zfOcJw7fG8SGQYfrQgNGsd1tVT+mDLmoLlxvGouNDwnTdtlRVTGgvS/Xtz4OXeeDzVZlWcntula9dhrR2BmsO3aIjZaXDWJOtEDjsIptlkO8v1qAhGR/20NAWPz0s4lZStr8ZULvJoYaMVEXm2oRllo63TkN9RFO+XOLHsDD95wOUwhrcOcK29qxY+YAgmhFUWIFxu6nhQ46sJiwEdJgk/3fttfuft1B2cqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T1ClgVl/HWi8VJCZKi025obesp5Y2xrkqjAQ0Ieie4=;
 b=bpAbSntnSsY/FNK3Xc8lLtSN1JBLDcYs3VU3HH3aSqeyhuM5aeiPbRS8MhnLV3EzQinBNh2x8I5qXdkwfTE+3tRp4+fJ1MVSxN/0ZACsgJklFFjbU8a8jbIG8/sbkn05YdTSZ5g+flGpcsAg0d6pswM7a5az8BnwPwd3GYAHumI=
Received: from BN9PR03CA0324.namprd03.prod.outlook.com (2603:10b6:408:112::29)
 by PH7PR10MB7010.namprd10.prod.outlook.com (2603:10b6:510:274::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.11; Tue, 20 Oct
 2026 11:48:40 +0000
Received: from BN3PEPF00022BBA.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::4c) by BN9PR03CA0324.outlook.office365.com
 (2603:10b6:408:112::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 20 Oct 2026 11:48:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BBA.mail.protection.outlook.com (10.167.248.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 11:48:39 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 06:47:55 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 06:47:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 20 Oct 2026 06:47:55 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69KBlglo516673;
	Tue, 20 Oct 2026 06:47:51 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v7 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Date: Tue, 20 Oct 2026 17:17:42 +0530
Message-ID: <20261020114742.872536-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020114742.872536-1-s-jain1@ti.com>
References: <20261020114742.872536-1-s-jain1@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBA:EE_|PH7PR10MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b897041-9a3c-4cd8-75f1-08df2ea01506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261009223027099003|18002099003|10067099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: tp6lDeULntYT7fEhaAeFabUQaEYLjZT1y/SlpfDW/4tIx0yFNKqz3Uyw9UuKYPzKwWxShFkJMUlLuAoMsjkln5kbNI/jIiOSpYPIg4FA36drmwm4UOjZchDVFiHJg1TANXz0D7ky7OePDpae6zyA0rSPBxtmAZGchTzBsBjWmWjurGTE4qQ1uRMFIiCv4FpS+Ln8PICWP+gxcjOkr36i0v2wnzBKR0fgW+bAfGrCGywvYl9GuI9ynnqVWI6Tr7aFyPZGiAZEW7SbBoOeIECnEhPPWw+jOMwdbiSQbkFpGgP+6AUQVHjj2MXa6sFGTD8bkdCQGMT5vKkSHrI3I2egyo1bvYVChZ+Pz8OoVv92q3usT7a0fHG7Qcp1n26wFZ8+eABNQYrvl3johaaDQuFyOVj/UibB8+8sEXRXZbqEKGkSqpkYKKdruZjgrrIVkbtSolncL+XyjNpwp9jbVAXiN5uifoFCvFRuU7OuqqJ1MJfr2TC1GF2kqoZMoKC04Bea7nsFxgvGbd2xud+43rEpp6zhby858QYdOXzAwpt1mluk/WmMJSABk+RbzhfqK/Pq4+W1a5HvxvNCvFJKZmw2+LEEwXd0G8INhkUi2oFWbHSGS7RyX3u9iIZHG6VWd5loNOrejSdpI0TIXofZnD6AsKvFQVureEO39p2DnX9nf9mgNuAxLhDFHmqvl3svq0/pWfIBm50YkNuwXzUsmOVzzw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261009223027099003)(18002099003)(10067099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D5aCNDpbE3tqYYL8XvnR0Db+0sxqDnmlTI+ngkz0rwAvZ1THVdvcBHe9GfMuEgXgf+7kk4YGGflCbEjMaZinfT5P82ipqMl2ccbKWCYQHR3DfFkcM0K6XHxn5wwci5XT2YS2EpHLqnsm1fGHesipqrYwhk7NxEqHTysuzlFSjvJcV9EI7Huxalh/tfLGSOOsZ93A4kJL+uLEAI3kQ3yQq5xGO4g15OAXfC63URuNTspQFPGK0vX8OQbuTK+D8Jd29HoDWrzokdPHcNiMmxE5/WscuutEeRiqfkQGnWhGicKBlzm/FPv8eRsGn4VcDWqgZprm5PVk9QUkJ3ptrCez8mUKQpru0ze/VW0m7Fe/dHFfSG/Yxr+WEeam/WCAMP3p7sPdXWZSIkvlzjzLsOvtai1tp/Uamo7RlFq7cWiTKmd3qacQwiMrjjuauLrN7B5g
X-Exchange-RoutingPolicyChecked: eRJgLNwwXwwGWZgfgwqQEtlUiFxtnk2qxhyBlQOt9XR7UJDCBWMk69tGR56GD0eET1ibUmZtmFshCRRQqXxIZymKIgZGi698cbIXK4xhQjtlkzSgMhiJzUsDGvWAdptIO+FRuhMf3rsFYDG/jqIYd9nlqa5sKHs4rgl8vPkfelD7dAK06L7tU9ohb9fNZYV+14o0+Ff17k1XQof0S+BaGZsiHYi2u0XGPGfMPqxetmV4jY85kefDJDT2zvNZGWuZ0LHZiDWxigTnezHM2g2DmTdwkAI4AJo24robQjZqSIikvn/UIwKV2QduE32kxHwF9RlpUXCgIsOgjC+Ukjmc8g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:48:39.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b897041-9a3c-4cd8-75f1-08df2ea01506
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7010
X-Proofpoint-ORIG-GUID: x6DB6d45XSYPleagOldtvqcMCfzSrih4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX3E2CFXd5IDo1
 J3e84kpsGdF3iOISdQJUoChKJHeysdaSXzLkTIjreuCrFowNviekyAaDpMBEUtprzXIBn1gcyHZ
 p37X/iTXfs1n2Ot8WVEoXEpmh9qBRLJRBpk8vnYfg4x+xaMLC8TYZDFpI6UbHnBW6gpM5FkIkml
 N1o4IYol0GK8kDC5rzF+l/i7QewwKkxB7wqFWNS2Sa8RuefXyOJIvXpihdAcExo/YBZBo1CYpUS
 7q+Wgn/+aRQoIpRkWu/RrPRttLWSYAW+RfGg6gCEuJY3hOTfhzMXfSXLPsBELzp4Bmw5ZTCE49D
 4qonKgWXBayUcEWEHqa3cd+HlxCUQXkZjYLrFeKYnn0E6BnhOwuOXa1rjxMxSkhDQtFZs+qB5/K
 GGeN5QkLKCWc/8nesgZF2+nHyTlDl8E3epw3L53CbfeSFFOJrafPg3xwTDHN0zUd2i4145Iqt6i
 PjLVFf6Coj+CHHpCm8w==
X-Authority-Analysis: v=2.4 cv=DMAacCNb c=1 sm=1 tr=0 ts=6ad75545 cx=c_pps
 a=SJ9xqO7H1Prqh+YlTuKNYQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8 a=WcmwVEcwf4aBJvEe8xcA:9
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: x6DB6d45XSYPleagOldtvqcMCfzSrih4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX5kBmyYcPZdBg
 nw/JSBiOb3NdH2pM/1PFeuowlN9dXNd2pxZab6yFmaLgUJzOgZRv5qw3i7Xu3RBzymqGoBQ75dj
 nqhh9MOGuyv5F0S3nOiSNv6/UB90Vpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_044930_800666_2B127FD5 
X-CRM114-Status: GOOD (  12.05  )
X-Spam-Score: -2.4 (--)
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

From: Devarsh Thakkar <devarsht@ti.com>

Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
and hook up its DPI output port to the SII9022 bridge input, and the
bridge output to the HDMI connector.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 97 ++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 964387eb5178..3cda48c3a918 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -44,6 +44,19 @@ usr: button-usr {
 		};
 	};
 
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+				bootph-all;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -192,6 +205,37 @@ exp2: gpio@23 {
 		bootph-all;
 	};
 
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp1>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = < 0 >;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+					bootph-all;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+					bootph-all;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -221,6 +265,41 @@ usb_con_hs: endpoint {
 };
 
 &pmx0 {
+	dpi_pins_default: dpi-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
+			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
+			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
+			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
+			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
+			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
+			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
+			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
+			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
+			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
+			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
+			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
+			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
+			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
+			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
+			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
+			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
+			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
+			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
+			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
+			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
+			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
+			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
+			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
+			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
+			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
+			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
+			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */
+			AM62LX_IOPAD(0x00ec, PIN_INPUT,  5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */
+		>;
+		bootph-all;
+	};
+
 	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
@@ -321,6 +400,24 @@ AM62LX_IOPAD(0x0004, PIN_OUTPUT, 0) /* (AA23) WKUP_UART0_TXD */
 	};
 };
 
+&dss {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dpi_pins_default>;
+};
+
+&dss_ports {
+	/* VP1: DPI Output */
+	port@0 {
+		reg = <0>;
+
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+			bootph-all;
+		};
+	};
+};
+
 &sdhci0 {
 	/* eMMC */
 	pinctrl-names = "default";

