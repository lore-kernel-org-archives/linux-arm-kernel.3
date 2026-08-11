Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02816C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybpk2brmQuhbE1+K0KF8vmtEg0Dq6Ei7nHBIr433PSg=; b=ActfcR3QOhLPig2eq1sISai854
	0biZvNQHFXXKZBVEXkpjLLKYpjH2IEiSyp252jgx0ymqAQs+cQ9WJxIK1gsm8oFydDhGGLiFWhp9g
	z++7rhKa0X/JIWvx54KbL/HB+Hj2j5HcV40jdu3tqBCGRlUjPKretGrLorbOueSKeS+QpDv2JrJds
	YNWEq62mU0tQzqyg/BIFzWhXfeZTnZ78YGX98JNSRbJebqBdLGxqms4b75ijVtrSXlYp6sTZqUMjK
	pDdj2fsjumpe0iiWc3YvrH4L5c4HCpQcysxk+/E32pl9iPLVo5Y64Cwbf4Veq4GrehV5k3LA7WYHY
	OuvWovFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmDl-0000000E4NL-2mbo;
	Tue, 11 Aug 2026 13:08:45 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmDh-0000000E4M5-07R7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:08:44 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BCSULG1984637;
	Tue, 11 Aug 2026 08:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ybpk2brmQuhbE1+K0KF8vmtEg0Dq6Ei7nHBIr433P
	Sg=; b=O+O+lLAEXpUGdYa8J8bdLQSQ8Ad0JaQzgk6L2+vutJ64c9ZMHiJwegeS0
	KmVJWjLrsYX606UhMVxNkPyH6f2XdeMWeRhWrUamntXLS8EQFiq9oGqdOTLd7iBX
	k8fiRSr0zx0WCB+ta9uaDkPae5IR7P48+EpkkVUOPxpiNfNf+0GzgTklF2KoccRR
	Orc9QvZkc/rweDRqzpWNUsELCSBdVoC8xCbjOXC2nItSeaBziWcVE4NPKz4AJPLJ
	0rvn3eRRDJvKCfjHi6fz2lgqaTFQbKrs/uaUnVfR3TOZ91j9S/oRD17eGZGPi7Yt
	u2FBAZytSi1VBMHH7imaZ47JwrMag==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g00wu11bt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:08:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0XUvDIqMli8Y/FiJFyqTE0tNa/flC2IKfW+ilu3/mRyCbVV/CbHa7pzWv2fdp1lwzAR+ZTSwR4fc/rCnlivvKfrW2kAnR7GeJjO6ZDQCTozMqz4BrCiFA7IacfAmTylNve2xFEyV9N05y8YbMGNkQrTKBhTAYk5A/P/9EvqhHUVFtgyDcHX2Q4wOubFbxA4zn0huEBlyagGKbSZTPHN4dRUJcCKN56CbmJuez8/XT2QlUCaqwZYBKMgIkSYb0TCMSKc5jPuZUNtcTdPWHLoGIqcbw5M+nP8kKuUDOc7LuFPSKgrIyeq+Z5nR9W+BIzViqywzlWJwDXEstx8i0kT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybpk2brmQuhbE1+K0KF8vmtEg0Dq6Ei7nHBIr433PSg=;
 b=mO/+Z3cH4vNtOAxXDdJQ5K8fnNqJD0JtHffkd7TF1+k7VbiLZAUcMFbKi5EkGjV+wbS5z4e9FLd1yWN5VLNIbMmzhjFmT37SYuuPmEc/QAFyNUbvqdXTSUzcPe1fLsepXpICJXfHhjZvxcoEc1gVYnKDKNfKT3Cu4jlrpd8USlBQzR8LrwGhDIW7IlhFSHyAakmq9enOaPIKSwjZ8dbdxAnTOuOYOxWkRRNTGOSf1Nv4DmwfzuSOu/T9Drd2UOnRGeBXxS8j3J8PQyW1GXE0NINP1Uxb8QkOF4s2cEz+9MiXPGwEyWLe9wJNtu4AfGuyqwYRXs/2dkFgfQneaazKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybpk2brmQuhbE1+K0KF8vmtEg0Dq6Ei7nHBIr433PSg=;
 b=EhJleV7JKrkR9vMAsq+IEvQtO9V6Uu6s03SZ1wY+HUKWJZstJRTU4iGy8jTbZsqRqbO/oq6HRIdAI47J70JUUi9daxsx6VGDkqs8KTV+Z7uoeEtJpoQouY5OtE39JSFU37/M1x/QU+JaqSQwQqJBLvHoFdjCbxzI5B/Z6/VZmMI=
Received: from SJ0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:a03:2c0::18)
 by PH3PPF1D715CB68.namprd10.prod.outlook.com (2603:10b6:518:1::78d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:08:34 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::f) by SJ0PR13CA0013.outlook.office365.com
 (2603:10b6:a03:2c0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 13:08:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 13:08:32 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 08:08:31 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 08:08:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 08:08:31 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BD8NkK1231536;
	Tue, 11 Aug 2026 08:08:28 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v4 1/2] arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
Date: Tue, 11 Aug 2026 18:38:21 +0530
Message-ID: <20260811130822.2324438-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811130822.2324438-1-s-jain1@ti.com>
References: <20260811130822.2324438-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|PH3PPF1D715CB68:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d95bd6-3cb3-4e75-7a98-08def7a9a551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|22082099003|18002099003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 8CODXrBl2ztEqL6pO2EE+iq+SysIlMQ0oizX4voAn0jsk6jgIXhPcoJdtJSNl9lmM5Qp0XSvKs5H+//BpzVVZFC6JYk0+MlS4u5+0WkK94hBLoieQh/zuDuQmHY0iGrDqQ+BJbA0zRd0/zantAKXuypYLd5iYCnLBPgt3AnL3KQdUAhoqp5jMaRg0MEKjH4kx5ZJwEBHKYbAm4XOoAew1mBuHdwLMe324QgJw3IogPlW42gaUzQU4dxqzJbpOCHDlOrPHC13uNXUyx70nqHyY4xOELgcHzd5lwDRuw5rsBFBHrjd0CoCuWIRrX6tRVn8xwCRd2bwPiNdTQ5o3pU7cX2MbOrDDQXnV2l8xkicqM4uKPQkERJmmht2gn/Jmp8djz0spH96WKzjDAAImdATT8ytp3cwWqpN40uaH1+odB6GLMREWIqQmQyHiwQhezkqRe0hPOVP835AQdnnWEgISuQoRpzAhrAMQjBcft5/6OWPjDY3m4nmvBUdDee/DoG7z75tGY4N23A96Zpi9s4eg08E3F7n6VTHkSUhj6sMwElJ4Jx7PezExFI64Z1Bw8RMHb95xFZ/NJmZ1mUotCNg6FxrteSC2ALgHp9MeP5bhJSwsurD4Dpib4yX2gf1zu1E33oHuzDWZOTKyAeOz3YHgjCMUy+wL+A+LE752oVAH9u9bQu9ZY+04Vkk78FPb04IOMKx92Mir5H6pyUBp99zzA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(22082099003)(18002099003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7yFeV12YKDD6JqUHiNE3ChlEuW+lzrEuyw08Qn8HStEbcZv/GyLd+HqboILBBUDRDD42jZj8vI5y4x/d1uQs6QbuI0TjZ/lL9Dk0PisK7LPskN7qOdwvI+DDfUUpJIYEXGEWKTfvgKXmg83iBXUh9dRi1MrCGrQukHQTjeyUWtAhS5KgfOGNW/aOH1PaWQm7FMtX3D3P2FB09sXWbcaf5qMKrgfKe9B4wVjgs1a93CbUNaUU6dnKuYoz/rGOEd1RQc268DQvkfdcbXgGGe8FJU7UWA7k/9euBuO3+W59qZXMAkCajByb12fIo9OJ16qUk6RiqhlfXCsLCRGqGPV2JRqRzjFn0wUWea4er32OGNceF5VwV6ZYBjNN6UaE1VJwcUsTTPQH+YKug9grOG4pSS2oFndQIrFi0ewU1nk3qRp3/d15Qeep6mBjYUSb0sDh
X-Exchange-RoutingPolicyChecked: TbNNrnIKDfUXKJgwcv9MdJwY+Mffx0sdPUarrEn5adNSOHTGeC4owNxRVJC0hN/bni5bKA8qqxTDZFSyjFAMFnDZonx+dwPPPuM63yJ4Nl/YYM4J9hP/K3c559P6gNF2sTrASAMwMg4e4squ0zAUlUz7PUls0Nbpzw03NNYVeWI2M83Xz7XnXZHCWxgTzmkZQJyqG4WlTH9zgfgk2RzhLkCpBLoCh4zq+/jNTN9gg7wypYvMgH37MdBQudSM+I9E7mBMamUHp7/ZXi6u9o5c6PvTFGcxLsLx1On333d3qnczCcRu3DBMcb/BCGWmnnZwrxOWpCAXGENh0cs+AHkbRg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:08:32.6903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d95bd6-3cb3-4e75-7a98-08def7a9a551
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1D715CB68
X-Authority-Analysis: v=2.4 cv=M+V97Sws c=1 sm=1 tr=0 ts=6a7b1ed5 cx=c_pps
 a=a15oepxCFtbapkdjUscCyA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=FLfJYUKuRQtBdiMmcTAA:9
X-Proofpoint-ORIG-GUID: TZUpvC1PbVGNS05Z0g_3UzKfwqK7RJ-3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOSBTYWx0ZWRfX6DxfTf9f+Yyp
 P1/x0FTpSkLa97WYKDgGbZx1i4oYWt2Dc3E7LEX13SjAeQf6bxFcHIKnbSomW8aFiKmLzJa6QZq
 AfD9u9V+Fzc8hQ4CLub/bVrGkSicOJU=
X-Proofpoint-GUID: TZUpvC1PbVGNS05Z0g_3UzKfwqK7RJ-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOSBTYWx0ZWRfX32s4p++Zn3oZ
 AOo2S9p25hmknrlOnQI+IpAtQgUqO/aMjqSvqwvXgroHDJvS91qSI1cvWtGuDBqb5JBsxW8EUH2
 uPVQGgeNpWuSB8pB/86Y8dmhWGTy2+/zNWqArk2DF4CfcJ8X8MQp4rDoTobPbZaWwCB9zEsCcJg
 2sb2pPbNuUogp3ulyuyin4lGiMyw63fi+pHGP5ROmzpK9NdfXi7MD80R/NE5n+Ia/+JzX28NMwB
 KGZNk05GU0udjFiqcnJ1QFCb68xo52uAAjC1fP7RoiXh8vNx/vtnMY34SY3y0xzAzK2R/3ffURt
 7jPWCTOk9D5P+woEEdL6NYiQLXtmxttQ/P1lQ0ICHhxwUzljktQC9szd5+jCk6Jv+NtQnIzXjnL
 DPJzva/2AyJC3KRNLsMjx+/rlxEAFsPLE6jvpklJ/JMDIhXxQJNhSPntOsjj5V2rjtTH4ZMRHAu
 YCsw8bMleE97QCkdu1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_060843_375458_FA092979 
X-CRM114-Status: GOOD (  10.89  )
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

From: Devarsh Thakkar <devarsht@ti.com>

Add DSS, DSI and DPHY nodes to add base display support on AM62L[1].
AM62L shares a single video port for DPI and DSI output.

[1]: https://www.ti.com/product/AM62L

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
index 80615ca1e01a..a3199a2455c3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -544,6 +544,66 @@ elm0: ecc@25010000 {
 		status = "disabled";
 	};
 
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x301c0000 0x00 0x1000>;
+		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&scmi_pds 86>;
+		assigned-clocks = <&scmi_clk 343>;
+		assigned-clock-parents = <&scmi_clk 341>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dss: dss@30200000 {
+		compatible = "ti,am62l-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
+		power-domains = <&scmi_pds 39>;
+		clocks = <&scmi_clk 162>,
+			 <&scmi_clk 161>;
+		clock-names = "fck", "vp1";
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+
+		dss_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x30500000 0x00 0x100000>,
+		      <0x00 0x30270000 0x00 0x100>;
+		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&scmi_pds 38>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	gpmc0: memory-controller@3b000000 {
 		compatible = "ti,am64-gpmc";
 		power-domains = <&scmi_pds 37>;

