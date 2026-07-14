Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QyeEI5OGWzc5JSTdXFh5wVFtJ5UF/sE2+36u3mI4LIw=; b=o9r5wy0RmXaKLNuoi0S5SYcX8r
	XqIQ2xStpvFNfYMwwukBghQ1unuy4GM34Yu+l0Bm6b3BWaUD9x9ODRsbIcrBtc7Lf8sFkDefbsLxP
	PewZ0aHefHTJ38zy4DAKmtcoY6iu1lOjk0dQ/yUadNQPLO9ox/yzHkblV3LuLYpZ784D9wfYTzRgl
	osxjTjFqqcAS6HRMEBQClyTMxnGGah4zzBm8gz7ZYl1GWE314Q0XUln94e5ofEn3dt3VyGjmsIkgZ
	1k0HpNdq5RObBUr6pxsn1ar4NyGKR13bHsR6jvO8pTjs+ivTxP25KwfrqAolcJu+hunlcO+k58l3v
	yzj1C9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYPd-0000000BI5g-2e5l;
	Tue, 14 Jul 2026 08:22:45 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYPY-0000000BI36-116P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:22:41 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66E6UVAW1524529;
	Tue, 14 Jul 2026 03:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=QyeEI5OGWzc5J
	STdXFh5wVFtJ5UF/sE2+36u3mI4LIw=; b=L+NL3YJWHcibf2LmZ6oNnAX8FOmY0
	MImrqMVlXm7oCTbTon/h1X+rvhlLPaYQm7esyQTy3LtXmRQMeIX9j9vnCAayeVqP
	t63t3ng581+iGFFuA369/cLgWwqMReXCJdNhBItBSjPkDNLqGSJnD8ZItqkVNXTq
	6iA/X6nDvY+vMw/tHx4yMvZs2o2UJZMNnVFtUvEzMIgzT3sDVze3QwNVyicay6YH
	t8y4wzzHgmONhKkyKoIevdP5epZMk30ALY0ediTn4sg83Cz9ssR1oOBeipU6CfJB
	zpio5BQfUWq3BCn9zitVQAFJM94CsXfD8pQK4IPai3ywzaSczbw0hk4dA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fdcw59ccr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 03:22:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcxgTeOyx4gjA0WeVZB9xLORg5s9rjrfF4eBsP+qnmQ93tufbx0K3mVFk7nFcvrX2m5lXU7MvoKbOhvEk85krWGt1h+BWjQFEuoTgkNrYeBqIASJRzeR3wIMbiqUaVgKICny4UOa2qcQHOL5ar0a85Zli/bQTpq0sj/80iKmdwOv0kATKSQ1ylGW6heS68qKZZuxseHeV+d3oKQc6Y8J1WSs5Wv+iLjG4I83aKsV1/o+8Cs0eSuPWFyN7GBmY0qNTAaww60/A1xmocomruK4Gn/rrPzsj0ne+UUUH3trhuQDsN/ikjN8xFdzAmuo5ktG7PMr9pInW10EmtMSGpdqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyeEI5OGWzc5JSTdXFh5wVFtJ5UF/sE2+36u3mI4LIw=;
 b=v5sM9OjRY3xZlj25eaLOvBs7CDpXPNjpnoRf7WwuaGoGMZU5xF7eJn7vUsGpBqWmJgzHVGaVPPOYISe6Y2t70/aXIOaHQdOX0K03XLluqrSOq1Ukkg7OOTjMbfCIRxk653IRiBL6rbgBbnC4BD6O+0Ks8+bf4FNjCQvLP/8HM/7JKKXmFJY/Y9tIg3Jdac1NTQfC3Rk7wOwaEwt7Tr7UrkQk2KMZvTaAgP/9beEAhAB+hM3bAGCyq9M+iG6tR2rSYmkli8sH2tTJbLTHTiaAVBkVbPHWnaKfgTMmjSqEDMk8Eyj+lTZbQ22rBMZyEcAnBzDmD0DRyCP00QXCgUpPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyeEI5OGWzc5JSTdXFh5wVFtJ5UF/sE2+36u3mI4LIw=;
 b=BYuefAnBguJe9JJGOz3s0UR9eW2WUF8AjoAlBIK1Ph6C8YoPiWNK7oStavv/luHiEXW1wKSWMrbidnHwssjojTGvTzcQAf02sVSSRK3HkHIFC/ac0/ecorveV4XGWnY5nfgJzQm36tGZNn0OD4txRy3Jni9Ea+iXuKQrsI2y0H0=
Received: from DS7P220CA0105.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::17) by
 SJ2PR10MB6963.namprd10.prod.outlook.com (2603:10b6:a03:4cb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.19; Tue, 14 Jul 2026 08:22:13 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:8:25d:cafe::37) by DS7P220CA0105.outlook.office365.com
 (2603:10b6:8:25d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 08:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 08:22:13 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 03:22:12 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 03:22:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 03:22:12 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66E8M7Ih068443;
	Tue, 14 Jul 2026 03:22:07 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH RESEND v6 0/2] Enable audio support for J721S2 EVM
Date: Tue, 14 Jul 2026 13:52:04 +0530
Message-ID: <20260714082206.501922-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|SJ2PR10MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 952da91b-0cb5-49d4-2224-08dee18101de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|82310400026|1800799024|36860700016|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 3P/ZzK9wM5clcReSpafAcAN5/I9biVGlcvvN/qkyEz+ElZNfLDqflyGgqj11yAIhHWHcUfAwZ/9lkQq4nS+yJCiskPzfqYwny/0LqStx+7rf8sTzH4gQxaOVJAJ7K+1o9ikjeyyq+t+KxjPYMVKuJWQa4c+2lgKJqP6XgZrpbKaCiPIxIoEdRMDem9uRiDZseqWgwTmsf5xW68MT1UAWf59DB914IgB4vWt5F8rGuo8wX8NjmrtcLKp2U4rVSVRI81naK/dZS0G8QdBadytHKrFKoBz0t7weDZlViNBIxuueWX27UlcmqDz/7lxvlsHGhCeYc53kgacU8y4ZtT9f1LRj+Zp2KoYr5Qhm0/l9wIK0h51BPJjfKRkugbDuaR7uz87ipXEY+Ib62kOA34DhEbosPWOAMPY2bKD0pcBmjOjO5ZbcKWfPEFSWUORj0OUR4JiK3hgQfwCztk+H3nrfRDN2ThqdDznkyfbx561nJsnjHxv4ZEai9XcMkZmFlYBcldft04AoHjuIKRRBCQvrvHJo5a3jvJxpLtIXIHVwQgZIMTlH2EIXwSR0aoT/LytcKef6ZrTKrp7XH8OIZKcATbjJiPVv9C/MMojarOnT4/dnJ/UpbNgAmy3Ja14iEqEnjI2rRCjx+M298kwJSaUgX/Nsw5ponrZmegCs4WrFF9KqlLK7nacWnZebvkOukbuzeiCjuCCanbUjRXXkeAy3KQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TlTqlqhxVdyjuIIoOrYLKPk3z3Bom3cOGBwsBbItu0RofiGtCaypUzyG6HrnjPSgG3BelvsJ7os+++AutgI+cVn5mftjjWR8uOwxwhhQJnTylvKgkpMranhas3l8pnBTykzg8G+pzV50VcXm27MAeDMVxQEvK2zQgMiRzxJ1ioYbsAPyFAI5Na9CCBhOnAn9Tb4O2AUkksybD2211q/+BUsbbuEV5igGFSAb0IL0pm+7kjHy2tkv4aaPy7/0Vz6XpcipElmeYwky2CcgOw+q3jXPgLu/puFImU4ojFbv7YCRQA+xCPK0QLxHb9gTu7t7RAhxkzuEkFGCg/iXEmfn6LPunZa0SO7tswcT+Vs5wy6Qi39+RWObv2HZcYGinIBx8hdZj6NqfNcskNQqlJdaZhIMfSn6ylIaCVoi1kHsI54dSa0EnC9bovvYLbO1YhXH
X-Exchange-RoutingPolicyChecked: Hv0nUnwifk6vA9HMVl5J25YxCM127jCmtZ5axnumktCqvnI8VlSFp7LHN31MqB4qwEsLmWUrpSaPk7Evk+sIBK+rANFo5y8uh/sQqWos0pPupOu/jhR5VoyXjJ8YtVsS7ftGayel2+0DJeYeLFwc5re7yWoIxLxFy3iqb3HDCu6Mg4d4wiQpIDTYnrqlclAZ6WDLgnsybGjd/vsA9fbM4XpPczga0PCkuYGBS+M6bwVKC75I1/8fju9DEvdr3yrcNmeCjzO4SP0f9O+ZcIe7ld3L3IMwvVuGmhcofDVcW8gz3db4/bO9iEZ5K8tuuTmhb3uSCyH6SvjyrKVcLM+cFA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:22:13.0882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 952da91b-0cb5-49d4-2224-08dee18101de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6963
X-Proofpoint-GUID: BCMlfVDEvB8NViZ_2q6r_6-K11ihnW3n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4NiBTYWx0ZWRfX2tltNIf//9Ym
 6B/TO3pM0MY+xO114ya8bC/yCuaXK8l8M+W+p96CW60scgdYnRlkOmp7QLplS/uMXl4oW/xwFiU
 8ERgXLgC6SY1XxGtD0Mrk8YswP2ySwI=
X-Proofpoint-ORIG-GUID: BCMlfVDEvB8NViZ_2q6r_6-K11ihnW3n
X-Authority-Analysis: v=2.4 cv=Ir8utr/g c=1 sm=1 tr=0 ts=6a55f1b9 cx=c_pps
 a=9FhzUGQqNQs6ZJfz/MkW+g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=8__9IKA1ZvyzrIITXxQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4NiBTYWx0ZWRfX9/pTT241N1Bj
 fASSOdmoU/ND41KEz1pJW4KVIg7tgoJglVjyqxPk6ZDwIXYDgWFR9rnJl/Gx52qcJe0UnMLmFU8
 MdAv8lcDAK4WROz+rnZYLgimQ0tMS6qJnu+HkInWs1THoMWypxII5ZNTEntjlmkTzvBYGbYmlIK
 y6uNqi4E8ueNfOeFlF3cJneJhhyc+K0AQ62T5JT31eJMkcR+d5aXILBLLgZIhMa1Z71dSijK7HB
 nmJIlBeojhKTT7ALCpJykAL3MZTXNic1wGKZYdjvIuaSbSlDfBIG6nnGluzJL/iD8nidhAN8t1V
 bmXDu9aMYCa26VMI+RW4+RDmWM54xdz01bMFDmKwDTA2R6FwsV8CMbZVIpSf9u+2xoycOiIDGg7
 exOVS+YM4D5G7DTQs0c2KgwXvkpwZ0xf5G9CsqnYEqio0Ga1mCCV0H4xT+CEuXtSdGo/H/xai07
 BnIa9LYy9Z4FR9hX+ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_012240_290047_459CA2C3 
X-CRM114-Status: GOOD (  14.27  )
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

Earlier version of the patchset sent upstream[0] was rejected as
its dependency[1], which resolves the DTBS check errors introduced
by [0] also got rejected on the grounds of ABI breakage.

Another solution to fix the DTBS check errors introduced by [0] is
to modify the ti,j721e-system-controller.yaml binding to allow
audio-refclk as clock-controller child. This is done in the first
patch of this series.

Changes since v5:
Link to v5:
https://lore.kernel.org/all/20260520115603.2662930-1-m-shah@ti.com/
- Move audio_refclk1 clock node from the overlay (k3-j721s2-evm-audio.dtso)
  to the main DTSI (k3-j721s2-main.dtsi) so it is always available
  independent of the overlay being applied
- Drop the &scm_conf block from the overlay since it is now in main.dtsi

Changes since v4:
Link to v4:
https://lore.kernel.org/all/20260519142341.2531948-1-m-shah@ti.com/
- Explicitly disable main_mcan3 and main_mcan5 as they will silently
  break mcasp audio routing

Link to v3:
https://lore.kernel.org/all/20260330094459.128648-1-m-shah@ti.com/
Link to v2:
https://lore.kernel.org/all/20260205130707.2033197-1-m-shah@ti.com/
Link to v1:
https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/

Bootlogs:
https://gist.github.com/Jamm02/8ee551c2c8db3a58a9aa7976e049fa28

[0]: https://lore.kernel.org/linux-arm-kernel/20250604104656.38752-1-j-choudhary@ti.com/
[1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/

Jayesh Choudhary (1):
  arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Moteen Shah (1):
  dt-bindings: ti: Update audio-refclk binding and j721e system
    controller

 .../bindings/clock/ti,am62-audio-refclk.yaml  |   8 +-
 .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 157 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   9 +
 5 files changed, 180 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

-- 
2.34.1


