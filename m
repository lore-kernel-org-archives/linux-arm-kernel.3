Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A05CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MHuug0xi/GQSb+vcXk7nopIH9/LEfCyzLNz83KjkYlY=; b=wRKF3UeIGBtOD2
	OnBfnyhjJpSZ1fGoCD6Hb05KclGbsSJtAFbgm9574nKLKmZ2iR3nXhI6Y52LxgKSqgbBcl+AiqdM5
	vn8A0VwBWzpvlH8yGT1sOOTFyFgM+5XKdPAAVrxoPXQdO8CcNc3SGY4YEV0Xqm+QwzJ3rep6+8Qv1
	UfyqPPdF+pgZndvVvEzPIcIWBP0vTBxPxW6pXz3CXCK8dJoNEwAW+sKk0tVSxz+0+DpGV8chjkhen
	ftQVq79VWkv2/xq8VJjs9KXeRWdtV7zW84bzg3a259c7UBo5eOz16w1FbdaeBgaAbNW60Iu7SYEqz
	9w7ObfWE9O39wpZSL2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevt3-00000002HiY-07OM;
	Wed, 01 Jul 2026 14:26:01 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevt0-00000002Hhy-1rCK;
	Wed, 01 Jul 2026 14:25:59 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 661BWRAj3240502;
	Wed, 1 Jul 2026 09:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=MHuug0xi/GQSb
	+vcXk7nopIH9/LEfCyzLNz83KjkYlY=; b=f7crp/VHvU1vgyOhPOyntVM7LJw6n
	qgt0mZhu1fnjUFMlto/A7ofwkk+vqOel4xfHGT2Cwza6xfYD01sd3BDZpDMXwSmn
	WNBgE1bZ0Kcp5k9GJN0q8ksMYf5fYol0HpxPIte176DixEqSmCz0OcGN65P1/9X5
	Mca4lbkZszI6BpLOD5/L82Qe50bQHbndkgOhkQI3l8it/5poFyHMj2/YQzwyiHge
	4IVY/+itCUQFLqhMGlFsY2+m6ukMQMNjzXQwrggrxPcWgNfOAwulJ/RZs3h3b81q
	OzfdJQ0OlXtH7FjmlgmLsUNbwRhw2MHLlRJ3OPpqPiavUMwVudp0Lu5Og==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012031.outbound.protection.outlook.com [52.101.43.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240s4jn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 09:25:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfvKhot8dy+6mrbxpf6nCtTdJDe484do6XtyUF/GZAYFN3pNdBVUgSQgWoOodFB+pY6KAOG5jsN6MwBx2lsX5bBUUOuisnqs1Lsbbe0aYA9IjDbQI2o8xLmyTK83rGwkKILHPh8MREtcEWlPRtFGuqI2Iz6m36fXEmK9Z5jsv5IokiOSozAVxzzP/bM7Bj21y8GkSaY/mxpg+VHd0bwpiaX0mR9EUm9lRkZo5WQhnHIK1xiZ6IJ9vNW0AvJV6lS6KLOEIuQc+h0aR93GzEye/ZuKdflx9sKTMuLuYmynv/EHtmbiU07XQPaJ+BKxQ4aQGI0C+XhuipZRj1I/4AwECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHuug0xi/GQSb+vcXk7nopIH9/LEfCyzLNz83KjkYlY=;
 b=WfZCkdtSbwLqtwICqWdhc523T6LLEQhQcmVY2IGhLAJDu3/RV8UjDzwfSWOgx+V6X+KYGPMilaGWELLvzwjT/YxLidelq7ob8TT6imDQY3RjjjVkXD75MIEGBdnZce8xwFiVhWz0dklK+2kRizZHCOHyiA9r6oUnmZhGUQ3lzFRD1Yx/VKfWntqCgRjRO6m8gWAn8znc3Rm7FXjceB5ELbTd0SpBENKa6wrsjzVIQ9JdeRsDH9zsmeSBJCJ2Yp50REXdaVAziROn9V2WltJCdjzVRDkjgZH697Or9pGomK4EASLJXPCaogHg2XE/LfbWMND5IN31BkeaQzmggLtV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHuug0xi/GQSb+vcXk7nopIH9/LEfCyzLNz83KjkYlY=;
 b=wFSKsN7kyCg1rR4zMQW43ua/rMWgQ0uyVv4Rn37Qk0i+8JVBjYRjvqneHt/bzn50LHXAIZa+j9QW0nwRree1ie+ZiBlxrJCTfu1Wqw8aW5qrTrdwDR+Cd3KFTdQNS/SJAWhPsgvZ6d/et63kgqm1FUD9pbJ5DjAYFU39CwdgR3w=
Received: from PH7P220CA0123.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::26)
 by CH3PR10MB6836.namprd10.prod.outlook.com (2603:10b6:610:14f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 14:25:50 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::62) by PH7P220CA0123.outlook.office365.com
 (2603:10b6:510:327::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 14:25:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 14:25:48 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 09:25:02 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 09:25:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 09:25:02 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 661EOvlW1000238;
	Wed, 1 Jul 2026 09:24:58 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>, <g-praveen@ti.com>
Subject: [PATCH v4 net-next 0/2] Add multilink SERDES configuration support
Date: Wed, 1 Jul 2026 19:54:55 +0530
Message-ID: <20260701142457.81874-1-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CH3PR10MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: b85216c3-7fe9-46ae-b815-08ded77ca585
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|23010399003|56012099006|18002099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info: UcQ/mLZcEfNutuSwqxgbkWwQ+1PKjAFUWPmp/StuOMjzTLy63eY5bge+dZvilFCgx0xttQBxocmwptEcctRBLSG7biVmAhAxv8inuRjOXroBBgdlQFVAbcO0i4Ox65Lf4WoLy44Zk/pRx5Ye6WZYkuWODVXt1KqrwVmagStgGMhZPK/4tb3aYgX6o9BLEWsZ8+Zo+jDZspqCHcxHHIYHKsuYjdeGLH01nKZRRBkd8WyJeptGfW9bbZzxg9oDOp0UjwtANnTZgv5hPHIiaVja4xTzu8Q3sy9O5S3cywA5EUp6kDnb2xibxGamD6TCKE8BJBRlg393LmAITa3fsyr0C+95lJP7YcONzqX8RqgRl+6QXbeWCXVUJv7Q64o4vM/7i6YXWw0hp11/+x/53e3HOZN+AS7BWPysFw4J8rZjLUJtoct2FEyqWBdnjnbwJoJnYVHVaKENVLekMzOqmQbuy7qModu21hXGsSXKQRJzzoO+kb6eOVbmOBN5bSBn22p4ifFwyhxKVpR4fnHq6tGo5Bt6Sll1iN0n8ak6C7PO0AZ5gzttnNPZF6ry5VTkjmlyD6QYrsk2dLyxCi6A1+G6FcYfSQFsl7z/qgylSTk62rNJiJ3LliCQP4lBUhM/WXTfrh+wtf74LFPazVq6+iBmyEUiv9X0ZUOKeXxXaMCxR0YvaRWyt/1cmMhYNlDzSnd/KZ3D40Qno5k1Q4QkiX34PakRjTvRfsIKp+b5TtALdIHhWapGq9RJGl6mtWfkJLIp
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(23010399003)(56012099006)(18002099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nwZl5c30MNVIIPpWTBCQw8N3JCikNp0wbJs+VoeezKtqZEeNv9ZjzJyw0fa9CotmXpY6G9Oxw6olbIhKyDmzn2rXKOZIyXQJQ7I6Bkh96X7XQ8BvcTEC7ydIgyr3R5+EB8/Ptzpu222yitEFtwebcNTL0XpsPazlM6DuQ+Fpos6hiafCvEF31oIOudXm1XaKEJ6LnuTWKuzZCgn42XuPbv/yyJ1oVuAL4yx6BP4S40u4A8tq6nvhPfVQIwe/l351Dl+gtZ6ahHapbn6OEyOxvDbSPBJdn1Cm+2o0ATLjwQV9Bxsv8bCc7ZB8oHu7ZtvYuyH0jI/2oHSwGYuwWqo2hglab8lM6lBVxlpmItmvH39nZUKRUfaZOijxd0YGlWViAHZwTn2RUKrWyn1ZvP0zoA9WjA8Rxbnn2qEi+NqnltFibw+r8cDWylHCEzrgZSKb
X-Exchange-RoutingPolicyChecked: LixMEiVMpYLc0E18GWKR3Ta6hdzW8t8O0st6nwqOnMrYXQ+ipoG50tCP3yXhRXnQWj7Z39Ax93FkxN6ceBUfqfmJpmR3nNXhYd3av7z+vMzQZ9z850jmq3d79ifdEj2A4Qx+4+xsFavKCTkGc0gW1NXtyr9IrrwGTYe00diCjUtnWkUqGB5xohagJoeV7q0FSUO0rzqeWjK3tFDLYNJRykWE6HjRw86gpDeFkRk7Ki/kFoa7nB5ZD4YicYeS44kK+YlAZhkVxAGSXn0oQCGrDBkxMdMoR3HF9XQiDmR07NHoqJtLvzf5kpNgMIvNVeZnPAlGjbAhAJaBz4FUMObwhw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:25:48.5295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b85216c3-7fe9-46ae-b815-08ded77ca585
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6836
X-Proofpoint-GUID: OogE0xB-BAvRk7VH-37w1kogtts9hwa7
X-Proofpoint-ORIG-GUID: OogE0xB-BAvRk7VH-37w1kogtts9hwa7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MiBTYWx0ZWRfXzI1BKwcY4iQZ
 evt/oiBcN9ItJJWTlDl370AtKRbHUIsVx509k9v6VtCBf0TIfRG+dT56P35SCPXqvYUTf+c5wk4
 Z8IcmjWXoxdOAT2KNohN03zovyRJKDw=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a452372 cx=c_pps
 a=qV0RoXYxPRq0QxHYvE7eUA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=2iqQn7EZO64zITYN9VwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MiBTYWx0ZWRfX43lTP/Dda+EB
 rv3tNC9n7W0R/uTxL81jj28xDSh7qJDhaS6YnmWpMkhz/Abf/yCtpknQJ0dBH2vON5rtlNfEC/D
 8NhFEkK6/z04p6RrlqXfvXPyeK3Q1TvfM1Ug2u+KHs0/xE0g6zAFBTPoPCL5j6KnRnORrTiIYa8
 i+k5obNutFCFMa1gz5uHEco9HMdV9S3FTeOTT8w76QSPzgo8KWNNs1fDhP3N0tIVRZ1mk4uZm1S
 PAjY7Y3hS2uOHkGjD1ImOUO3kfsOKv3UGRw9ZFV7j3BK+4NPB9phOni1aVreUjoix0H68DrK/4D
 k6cgMQjJQAVU1mL59rd+uGINb9Dwd7zCif4oRjKGmg48vU8Y3of9EoTwsjMRXEo9mV4wh8lWRIw
 4gfcaRRYGUdFc3TiKUzcLZl+8MZEwDrLgZjDloI6U6PCOvJZAtRi5B2B1Da+rfMW7xIMqo+AcXJ
 thjbBLtodHkle8GrIRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_072558_639928_5F158680 
X-CRM114-Status: UNSURE (   9.54  )
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

Add multilink SERDES configuration support for SERDES0,SERDES1
SERDES2 and SERDES4 node on TI J784S4 EVM.

This patch series add multilink SERDES configurations support 
for SERDES0,SERDES1 SERDES2 and SERDES4 node on TI J784S4 EVM 
by adding the PLL1 refclk.

Gokul Praveen (2):
  dt-bindings: phy: cadence-torrent: Update property values to support 3
    clocks
  arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node

 .../bindings/phy/phy-cadence-torrent.yaml        | 16 ++++++++++++----
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi     |  9 ++++++---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi       |  3 ++-
 3 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.34.1


