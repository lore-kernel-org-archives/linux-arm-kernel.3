Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E4DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgiD5CQIABczmGxGcvxsglarTC1HYyLjUDbQe52WReY=; b=RBA98zX0DSC130pZuyY5GtJ6Yj
	XJdDoaiN8mJtQPY8Q60WX5ix57hf5BNLeo/QfUgSG0YWSvFXtedNIYkwgFTLt75KplyXG19eUX6Qn
	FNlfAz0DFmbORyvxjKTQIVXc8oBn994Zul6tnhIPAI4evDDj4qzcvEpDWgdYRPq664Ez950HMRJks
	liKZitW2Cc1Ukrp+1Dfnd/fad0ajkslP8EIIpLnvcjYTPKgw5GBsyosxIu/hkr2B3ATKP6Py6cRaR
	2c52bXqGe3/eMSBI849oHlF3JUgm54Pj7barPMcH7JQBC4omKryEir7hg80Soh/MxR9XnjMl1MkJI
	K9PT4jKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYkb-0000000HBug-3PE9;
	Tue, 30 Jun 2026 13:43:45 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYkZ-0000000HBto-1lBD;
	Tue, 30 Jun 2026 13:43:44 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UBBT3C657226;
	Tue, 30 Jun 2026 08:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UgiD5CQIABczmGxGcvxsglarTC1HYyLjUDbQe52WR
	eY=; b=U9pKTODvdrkXzYbwFuEjgQNiJlCfkNVKR+h9mNIb2CXgrGOKfefd4W9kf
	9u0bfA/+aDiQ/i2uwEUG+DejHBNG2YTNo5bNJziLYOIOGEJWd/UqBf+bxEMG0xEe
	peAkUEuaHAOEe0PZF8PjRnZ+U3D4ALoCpMCfKNP0eBgkTK+ehxOIxi4N+9IWflK1
	XsA/0zGDd9UbTNZW3BNCiTSCXEpYI/n9OuVduZ9zquNzue9u+9nY8HgSL2vPZjBw
	zdagV1uYn0qJ3Fg7t21rRhsQO03Gn8/t075IPC2duI7PF4XytZdPQ+WiD7M8ifWJ
	jFwpc0UKL/BZwc4cZ+Z+pDepb1GHQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f4cq6ru9s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 08:43:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLANOP0OPmoa4CAyO80zafCK8XyjzJE3pCRcKSm+3FA1tzRM+qNl4TolXEhmQA5VEKcyOJC7IX1GoXWWNCSd2mvGGoo0+cvgZpNcLnCL5Tp3XuiLAR+toFEWAMK0iX7GvGYqLiCN5oeO4IqxtE+SzokqzQLSiYYHUNdtfmjbXHYFR9vwC0lkyeBef9WQSZDMRideZiUbaH2rmimjNA09w110hFXMFnth/y6i0odBlliVotZKim3iG4eI4XAW8sQJqP+Ewk6DlHgxp55ZcgbKmN6/EapfpDJrkHoCVyFaHkjTM0Pu2sLPbtuGKL8oQMseLw38CKPTHkHFPSKlRdMCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgiD5CQIABczmGxGcvxsglarTC1HYyLjUDbQe52WReY=;
 b=FEPdg57U+RoLYDFIzy0jNJsqat0sDCXb89j2ihOaVyAoCENjonWD7CrJRP/q+YfL7CFn2zO1tGwKeJpfpZIFqhgZ1kizSyYCNzd6+DES7WFV8OQlmlp1a7v9M6jhAKDWrYQ8qCC2SHYYTFPTlAPHX1KO9RLXG468FuY0EBRgwkJeE0CL6nzwpA+isPsRaMXpEQW75yWNhcl7APBI2h+EJmzHVxk736aNgRsLPN1FS+YkFVGruRVt4RjeaGjeLwZYCPnzhirFzVRuKubFYEWvxLbi1ffTOAqN0IQKc/nw2W0FoLcHZ3JWsx5cFyHxtlhx6C/wQsACE/QgvYj3lhtyBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgiD5CQIABczmGxGcvxsglarTC1HYyLjUDbQe52WReY=;
 b=qF2DcdwC5JAfQByyUaUf+5lWq4ErSVnW9M5oZkEc4f5Cx72Bwhn8psxOVUJHHgvPb/pHze1QN+kY/JrSYPUZzNmyatfBnWJgbAzg1aFAU70t6MvOxVsgvCf0jwIZanJVxsMxKTDI/VH2nqlMUPM3/fA2UC8QVttQaXECMxgo3cY=
Received: from MW4PR03CA0352.namprd03.prod.outlook.com (2603:10b6:303:dc::27)
 by SJ1PR10MB5955.namprd10.prod.outlook.com (2603:10b6:a03:48a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Tue, 30 Jun
 2026 13:43:35 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::50) by MW4PR03CA0352.outlook.office365.com
 (2603:10b6:303:dc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 13:43:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 13:43:33 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 08:43:33 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 08:43:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 08:43:33 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UDhOMa2614781;
	Tue, 30 Jun 2026 08:43:29 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>
Subject: [PATCH v3 net-next 1/2] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node
Date: Tue, 30 Jun 2026 19:13:23 +0530
Message-ID: <20260630134324.61085-2-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630134324.61085-1-g-praveen@ti.com>
References: <20260630134324.61085-1-g-praveen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|SJ1PR10MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: a11100f0-24a0-4842-fecf-08ded6ad946a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|82310400026|376014|23010399003|1800799024|921020|18002099003|6133799003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: pDpAe2NqYQSRTE0iygSlr61Hdu4iA9p9A1gK2B8xIO+o7B0VIizk7NuH5RL07CkFG2Rrv2FyIjJa8F3HV8S36wDuTJsIzcQFxK2ZMspMJPxoX26X4L9Quj2us8ZD2FgLncgis5+8xXZ7H5+Nxel1akbuc6MG/ETO/2G4mTJxSc/Avc3xpFZtkVw1E9GyJqfuPIITqIyOZat8NCprtpo0FNI1dlweQQtnDUVbdNa28r5sdMWoizZGzNHXlqpe83jJiGpULEQ242RftSKUwkxAdBaAxvOKLrW+GqMVnZ+Z6+gLOR7i2vEjS0SQMppsS6FvBjqt8Sypct847lo4q/X5OaN5iXbvPy8AtwyTh0IvOi8wwhLxMZTy61j7nbci4lew7Kk5DkoFe9Suu0OYd8HhFHw1zVEvD6sLDJ5o3dBwnTIdZmPi84qlFHSeOm1eAfrWditX5jQHr8BfPVDAfk8S7dI97mc3WhrZBsGBrR7RG82dMCzzswh/1BRlaSnBr3ARkPIl0yiUWoRrF0q417XjMXNw6rzTtOiEg9cfXp74d3cSBrLd1nQS7+VnmTkNsJxEeGiJXg/MI1v1eNAnL+1T7/uyzF50gpppjWdCe3iKAya67Atr9xC/moGtI4mx2DXIcgtgY4rzyE1v6u1fGs5y30ufmosopwPlcKNbg0iYvO+zUDWR0jzLDwiU84Iu5EF8FPXMcLcqr/5YGS3zuSyXrP3DsFOAZT7reOuhWIbqVYDGorclEFTUgtFe+AVhQp9w
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(376014)(23010399003)(1800799024)(921020)(18002099003)(6133799003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lRG5qLu1JwigObHZqxJIQD0NSpzmDY978cF0mSocxPqmsCi85YjMsFF3bE9xh47vlrGpk8x3dhylvCosoqKqM5UdEsbz97D9amDIQGC+cdI2HNIoVnhDzv82ybfcDxsy8nJqnQmqPfEhCJ4tlwi1li7FIW1GZQrw6cqmeIarQuww3ZTInkVbkBC4XPVAV2ir18mMh7JyDAf5rYC8Mhpq6VZ0igFuzn4Ulz4Xgqm09QSXidxw65nTk02VT/tZYb6bK+nyKhhgPVK7SgR6roaHOMf8ef+x5JodaU5sjNuz3TdDsW8JABm+SoNbkDmcR7rtrIayF2vttMcLvWv9SNab5L3JOcalaZ8UUePB875kv5OqNcksHUJtKe8yvNe9N23aF2kCcQlOdT7uBXfj1wjzZEoDrttKzxRfN5nufNybfX6xZ+HnNeG10wBcOA1jwG+q
X-Exchange-RoutingPolicyChecked: ValHmsDiDyop6Ax93QmwFW0w7KvYG9l2GzNiOCFo1/bDKn8/FmLOxK7fdCuj+ALS8ijvSFmeYSxUeoODbcQWZ5E28KOSBtQ6czGXPxqww29cd5AuoLeigKhLXMTJBnoZbR34GkwXdvJwJ8V/alQ7KR1OT6Q/jOMYUJfVD7NfWBtJflo8LCsKtILWRNzhGPvO1S5QWn3lf1ZLeo5TNFf3xOT1csmv5jp9RPZxlv2JBt9zmUtgU08njC+zEVd6t6nsCC1p65MKyG2WXb9MWTYPeLt7m1cBCLPCk5YRnDTqfUs9gtdAu/mzzosF2pqllgRaBTJKrXjgZF7wdePM4kBARg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:43:33.9553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11100f0-24a0-4842-fecf-08ded6ad946a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5955
X-Proofpoint-ORIG-GUID: c8FqWkg039L982yDVcrlLlcDeUsz-6cD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyOCBTYWx0ZWRfX6T/jSbpS7hqS
 H/DCjxle/fixQUNuzu8HRHtMlXLGHLk9K0R80uZ65/L7l5R+lMj3gOPc4HkwfGRpMkq3uNA9UTQ
 E2Lk46A5sRPPYMrsWm1G+UBnfk6ERcPIA13bZA0vrUvJN+2teDWUzAwHXgRbOC8bi1qHdfHs0k1
 gQMHYOIzIMGmuRdsg5mGLUKXTLq/OT4GZTTBICeIg+bifPuAVlq88KBttLtpZRPCwQPOuPinGel
 nlp2TAO4e+vaTRWlD4A/f4KOaZILt5PpZz+MPFISzlVdgJuDYeHIdUTpZr3F7VPhuj7nKbw7nuw
 UVKtUTn4eeEwLJY6cwZ5HGpkf67oi09bdI6MFr4qzC13q11f9yTf3CcJvWeZ2KPyRIPC3tE5ub6
 /ZzHdqpawP6tJqx5lUUvzrwfrE22gO4qHXTfGrtSPJ1wAqZcnrfFpk7K9bR7qDZG7BVI1AiAmAh
 Xp+cTwtH7eIMoait4hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyOCBTYWx0ZWRfXxFFwwh36LNLs
 m7+fi+dowWAaIgLAS28gQ3T5fdvnn6MYLbh1oaK1ZVLuej7YnxDt3NSVDGv9NCdKQC8CMGmCnav
 fY/yOuwIPV0DHzKIdX5wokR3UF/3q0M=
X-Proofpoint-GUID: c8FqWkg039L982yDVcrlLlcDeUsz-6cD
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a43c80a cx=c_pps
 a=C4vld1iEI+sMWzcozXu8ug==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=ZjGXhCDin-4IRsH6R24A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_064343_607210_35E742A3 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

Add PLL1 refclk to "clocks" and "clock-names" parameter of SERDES2 node
as "assigned clocks" parameter has PLL1 and serdes multilink configuration
fails without PLL1.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 78fcd0c40abc..da8d582574d0 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -122,8 +122,9 @@ serdes2: serdes@5020000 {
 			resets = <&serdes_wiz2 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk","pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz2 TI_WIZ_REFCLK_DIG>;
-- 
2.34.1


