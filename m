Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7B31099B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2zvCCyO1J/353W2tY931IznPohfbjIZNifLt8dkI8Q=; b=CEMS1Ij8BvX8cx6LwX+KO8zTLx
	H9gaMEg+VHVap5RLPaJTEc9LgmLHMwv9lPVGHba7MMuEGs3ZrBkVnQal0pPpBij44AtoDzzl3unT4
	3iLVp3vMk8Y73ZGIn738CASoBx3DR9E1CUqBsqCy44IPaKFq9HLyIPikEk4Oovm5R3GCj4ltWrZyK
	O/wcyZlrzm81Yy//veHXFYU62j1TgPJdEFW+sea40aY39cFNppvtAVZxwkcZlx4MrbbkZOifL/f74
	uOeaOTf0s8iSnCmYMKLRy35QoKNJlbNEJZgICVZpVLBY/LlX9gYadeuiaM2QPmSHlzWik+TcRuxW3
	jpZc/Vjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hKq-0000000DchH-2AVM;
	Fri, 20 Mar 2026 21:24:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hKo-0000000DcfT-255I
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 21:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K2zvCCyO1J/353W2tY931IznPohfbjIZNifLt8dkI8Q=; b=l1+LJDgVLiRDgYjUkz3RVAYhpc
	MbvJlmmc9EUugCmiyK6B/7S7eEd/sbWbHafBELKjqqmt5uqEJDOvijINK0kzPurGOyGhsOPZqGxB3
	acge/hCgu3sjDoVHRZgixCCU//4vJ0deXj8n5uOtkCxwqEvibqyZiP5qUBQ4nHcDSYP/DvPxrg12e
	UAb3fOUm8WQkm5sp2h8biATfG5Ttr7/bvt6JCz+8paen0MWx2TQqIceSPVGMJms0f1C0pBAeMEF0Q
	KHSrdVoNZJmarlwjk6FZquBkvQlli9lsk6//s6BXcVlVdvm1jSyiVPesTaws1T8rKJp1Cz0vBT2sZ
	E1gBhoqg==;
Received: from mail-norwayeastazon11023086.outbound.protection.outlook.com ([40.107.159.86] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hKS-0000000GVPS-0UGf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLSETjzC1getq6Sw2ciNxVsc96lLMlqFOvb6QWuJZ9lTz3vVwufvudNd+ZdS4Co6qQVPOi/qpUNBbxNaQEEHRlok6Jz5HWj6E9eF6AoGHxmPP/ncWGm2K4bX0v03MU6HeVPYgTpzXqlsxFt+5h5JMX0FgkWzvdKWisXN19h+ehE3eS6cvoEUf4ow9xDNcrxyhNWThsm9aGUhux/7a6lZkZNCVVwWetIcNDsH+LY6B9l+yUqV0I7TI++1NEweCI/gTgzsdwut5ThRQy73AaNcWnUq1FzCqF0jzfNfqJ34NkioFHtWGqcInO4fOXiazYYxxNWTJ5G1XvtDk3og4o49MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2zvCCyO1J/353W2tY931IznPohfbjIZNifLt8dkI8Q=;
 b=jAYJW8nsHwJtXsPiV5KRDGE5mhrSPW76CJkmi9p1HvFn8QX6r6BGSwFIKVRVFjLE7FOBo+2Q73Wgpoh2BW/vw6JP7KWLvC5P/3yuqveAbVWw3wlCDSw+2EqajKiqt9V1lTlfk5g4awgVdlAbhZXe9ebM/gx/ECOjXQCz3BQd0GjbsqUhTpu8l3rOjVRfnXD4W3WJhxOgu2stUGxe6AxTHTC7KKFJw72U9AQqCirsGvypjDifwjqu+4w61WFYsx/IHaQqmfxkpBWIy7FOvJ3RPS0W0pbwsoz0E2VWR9/NQys9dtoaOnXMQhQ2kTf99c5+qAN/EKowPlqXnWw+BJrgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2zvCCyO1J/353W2tY931IznPohfbjIZNifLt8dkI8Q=;
 b=vieEdZySRmlKjFr4/qZCLP/Sf8e/pzbwtVmyNFJZ1wRCwVJaIvxBIySOuT41dlaqVRvm8LUM/GysvpMIyUlppKp5v3i/z571lNWcC0f0z7gTFtnnIw+0Exshl1Qtj6wipqH5i9PRErMHkVIGEJFJYZPo0Njfn4ZWqChsRHdyqf3tOER5gUSNq6xGR6nXW56mLtq+1MiyEWVJaQRPhMi4if/FLowLXcMsrlgdkXdB07cZBhHYB/IKhPw0t80/PH1tkNMEUgMeCKgSJLWbPZI60uPjrQTdysXykJyOiDQtNkAdam5InzqAu6RbABno+HP01fphEdK3T59ieNRQeQ3cwg==
Received: from AM5PR1001CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::17)
 by GV2P195MB1891.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:7f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 21:24:15 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:206:2:cafe::e2) by AM5PR1001CA0004.outlook.office365.com
 (2603:10a6:206:2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 21:24:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 21:24:14 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 20 Mar
 2026 22:24:08 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v4 1/5] arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
Date: Fri, 20 Mar 2026 14:23:42 -0700
Message-ID: <20260320212349.420951-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320212349.420951-1-d.haller@phytec.de>
References: <20260320212349.420951-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|GV2P195MB1891:EE_
X-MS-Office365-Filtering-Correlation-Id: 0156da3c-6c6a-4c8c-1430-08de86c70909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pa6denk9DSbscRxmcHTNm3H4lS/i15rhqQs9F3hdEQAFuPe3yLhQgLmNzwRqsjwziUNQm8/uZyw2igJ5w3Vn+444TNTE18dVQxdXDXS3galBeATo9Ypr95qQU1NyffNzPwMuqKvxLgcXYRKo1xOoYLYp78N40TPZfuFvMOWlRCFy1a7lkN42qMDkSPPtxkVu0rpg6bdXlNR/acYfMViVDL4427yZjSOjfskksdnJPQFukWn5TJzN1dSj4vlSUYgnjOInaxUY5Q8G9zPARNOMraiDeKkRMR/3QRCi1R8cTN3Lw+KhaC4Kh2EEWjBkWYPJmDYcNU3ERnf4B/y+tSvalclX+7pTCwpfIikHTh+TfpjZqsnVQS24Kou5ks0B0rJUcdvh6t06so+DfBTfyYxMa9VtFfkMx1rQZCfLHunNMPbAZ+ufoPVVz6fK2X5vlliy/DesclRGMA+HZ0RfKPC0dKwI4M+vvF3lHktV4EZ2kM54XLm2YexJ111I0RH9FBYLKjumvR4edY6J5QNOu/9g2QlBcbX7Oee3yqrIPdZoC+VuuerVmAhi91rmmwq3qEGET3Llb5HgJrnV5GisTFCSCzHoJpyrBNdsGnQgDMT+KmiRaUb3LuOz1yfFipbeZo6DUPJB/wvrMtdXgYX0LzsUDI5HZk2i5hPb+DixxdMZ9/BE+xBdlkU6DThqsjY+02JarF8R3g2KX/dizht6sdOVQn5Ce9/BcgprGn8zbvVWlH9AHB2xlR13bIXzflcCmMNn/ISocOdx02zCzfpsUFi0qQ==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jAan/Bpdok5e4UdoEhkZ5fYldFSRr/+nIDMPS4I0Jh/rlB2hkJC/4dGuAg45FQX/kAYkKZkJJk3e6XZ6sCm38xi0W5H/VGcbgDnNWaahXxoWMKnfQ0HpzgUdjL5SjfwXA/fKL6bePNK5gmxzOMNpYggRpBzS5SUxowVJrXZgky9rh4H15JgI9f9hnvsabCf9ir0YPZMVXhjqDF5Wv+N4cneQ0qUkuK+BLLMm4VQM1F8Ipe+gd+ou35Uu3X2nwCQDyWmcRboeKIdgCFNF+Y2xJ+n4uXRvHcHxs4NFYtFbNU7TkaisJXxaJTgsQ/aSFkQbNNmu1cxlfd+X1+79bq8qiwbUDPAhomMUqcrVx9baya5WLtLPIOR0Sut7V16D3YVnq47tm9nWXSszP66+X7vsprGIk2WZgxzEeGvyQQyb8lBQc/STCheFXZG+vJCpea3I
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:24:14.0965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0156da3c-6c6a-4c8c-1430-08de86c70909
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB1891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_212426_999930_6A111279 
X-CRM114-Status: UNSURE (   7.89  )
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

Assign the dss clocks in the base dts so that display overlays can be
used in any combination.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 .../arm64/boot/dts/ti/k3-am68-phyboard-izar.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
index e221ccb30e95..225fe7a7803b 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
@@ -298,6 +298,23 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&dss {
+	/*
+	 * VP0 - Displayport
+	 * VP1 - DPI0
+	 * VP2 - DSI0
+	 * VP3 - DPI1/DSI1
+	 */
+	assigned-clocks = <&k3_clks 158 2>,
+			  <&k3_clks 158 5>,
+			  <&k3_clks 158 14>,
+			  <&k3_clks 158 18>;
+	assigned-clock-parents = <&k3_clks 158 3>,
+				 <&k3_clks 158 7>,
+				 <&k3_clks 158 16>,
+				 <&k3_clks 158 22>;
+};
+
 &i2c_som_rtc {
 	trickle-resistor-ohms = <3000>;
 };
-- 
2.43.0


