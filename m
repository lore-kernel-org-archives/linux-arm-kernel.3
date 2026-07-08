Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D044C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlL3HfP3P959XC0PHqKSHnQqpK0sR6vvwBRnigu0LwA=; b=QDZXnqZTG/O6uudze/UsjixUAR
	OFk1no7eyqebCQI22TXEzWEgKn5CgZv8JdSviaMSOgcVe9a1iDwBYxTS8LkJKeQfRnIKpZSWl9sLG
	HH4VKHb60KQpMSkViVllCNtFI4TN3Dm4ADn2h8EjiiQWB0hFtTUBE+GhOqPBhnEW/sfYHueljH8+P
	0NL/2GKCxfkdChTxiV/tdGssXSNArWKWOYlLGrhn7YbZuiYYLOHxkxUlueRiZ2Yr4/p9HcNoUXKCb
	+/gbo9iNbigGJu5tKvq2E97DDD2p/afGgzvARbpCmh4f7R0O5F89gAABb9ITpi5h78TMY88Nh+Shd
	80vvfcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNn0-0000000Gdjf-2OVB;
	Wed, 08 Jul 2026 08:37:54 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNmx-0000000Gdhl-0DQq;
	Wed, 08 Jul 2026 08:37:52 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6688AcW11800074;
	Wed, 8 Jul 2026 03:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TlL3HfP3P959XC0PHqKSHnQqpK0sR6vvwBRnigu0L
	wA=; b=lrUJ65Wjfzd9PyXlbsZMOvOK4bClMfzMdPjiqccmBQZUN1U3Jv+E5cx8m
	Ve3GdLtiJWRasRUaRJXn5CqYTNxWmXRp21svp3xBNi+qChiyLP5CkcELdjgFTk+0
	3M62gZlFENK4Fir3HuHcFVisOZCsX30N+GngoKjw3Bc2+PjZt+hh6W2ca5MQ+JOX
	m1RND/0+wtZRNeDrbLsZtFdVILIGgzirbOwK0VQ43q+vhOWvaELSMrGfFSOGyKe6
	WTPKO9SXBgHZj+xUQ2iDsdqZKLC/G5BYSDL6IlaPuf8acLCAv27f4hNEdeTQUTm8
	gqBtjz8q+YvOqSQdfpc/TViAYwOFw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f9dpxhtqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:37:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fr598EQotg/lxaNEcfEsUboXiQ3wB4K6VGOuRDKlkcQ1DYVTJLH42D/Wl4kQHcxGgK3884eO5z/ubJMdGXEbWusiu7lADeJ06vH4F6qpXx2GW3/1eAaI6hfJsjVfO3+b8hkxlyi2mFhznwA/VHkBr9+p8h2zS+1+EWQClfw7xJq2xyjQ82DwJvseRhgPmVW7s6UqWgkqQf2UB84XOb1t8Nu9LF5f5XWltd5xMa0rgh8EPz4yqZHMOxuP+VzxQPgOXIkYTU6GLeQMfomeQ/HQrQZssm8ksUvIi1wJmRUxdU8gYecVf113UlYxC9QS17sEOYE1af6rS5IV0PkALQszZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlL3HfP3P959XC0PHqKSHnQqpK0sR6vvwBRnigu0LwA=;
 b=uSRS2/JouNuP82qKS5oVqc++bxXEDT8luVkr3rfakB7w2kBbUu4OEtIZ85NzONzoOX3exAqAmYF1ekul0EDaShPiraTgKj/igpeioRKeBqcRQa+urPTi2I86qEiQ6SV0P9mgo+mtQBCtbStsQqL3Pg6+2ABAQuGNwEPG+g9O4fhk0r+GBoc0sXgX82pED8q1/Vr0ikwzg6OHkM8PRCEAd20kTuUeRHeBR3mt7XFyu6/a5CmCe+TYEWpWCp+vXHCDJfxIQCmOLLBx7io1HxmWEmYfr2Uhigcz0r8n70gMXVn8n6yss/j4xmtJ2QMgoLBx9Or0uE+3KTnW3QnG38feSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlL3HfP3P959XC0PHqKSHnQqpK0sR6vvwBRnigu0LwA=;
 b=UW/CDPp3ZBH9EggH9XMc90ughejeuv+Gt4KHRvrOIEOJjaikDAsZbGq15wNleVHid3d3NswhCeNQ+3P3V+b1/IfY8bmNzsdqJZkxP3HMaBOwGFVojIs4h0xXjyHQoSOSv4LsEaoYFyXGVL8rQVgOonDX5vc63aj8jeIpGpdHLeg=
Received: from DM6PR03CA0073.namprd03.prod.outlook.com (2603:10b6:5:333::6) by
 MW4PR10MB6534.namprd10.prod.outlook.com (2603:10b6:303:224::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Wed, 8 Jul 2026 08:37:37 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::4b) by DM6PR03CA0073.outlook.office365.com
 (2603:10b6:5:333::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 08:37:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 08:37:36 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 03:37:35 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 03:37:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 03:37:35 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6688bQHp2346360;
	Wed, 8 Jul 2026 03:37:31 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>, <g-praveen@ti.com>
Subject: [PATCH v5 net-next 1/2] dt-bindings: phy: cadence-torrent: Update property values to support multilink SERDES configuration
Date: Wed, 8 Jul 2026 14:07:24 +0530
Message-ID: <20260708083725.66777-2-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708083725.66777-1-g-praveen@ti.com>
References: <20260708083725.66777-1-g-praveen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|MW4PR10MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: faae7c34-15bc-4179-fe28-08dedccc29ac
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|23010399003|921020|18002099003|22082099003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: F40nUf4sGvuh6XnbNxxITcAMP7oLhEUIQ0OuTBsk317qkO4GUApmnUnRM+c3akvmsXTyC/2+G9fv6hrHsldAoPofnBxsA/3NeZio0gkaPpan/XLLZD/UTg8mtZ0OdHVfkTDc2UgTT9MNDnehjVTDoT7NSfJlO8vAsKJXIL+kuFYCXBW/w5of8y/LwHZEkm/Rio/OYdc/W/ZMAHMrf+hcNTRn7StsDHfL6lpQ/7I4cwrFSj0N2vBd75vwPYcpuRbvLfZhhzWaa76fkXd+u2OjehoobQAHN6KfCiUd6rlJeFjHod3F2F01xvjAJAxGIGwRLnOj/VWTauYKcba6JR5sOcSVbze2Ad1nIRozQtQOCyzijAtHZgVnPVdlIkz8VSt8dxdGhpLl/Y5DAUq9s01FqcKgxZugqtHkj72w9lB0rS8luLLXkTWkyNlVNUX4jhCagkEd6Mzcu1vj+5wNyTAGxIJuReIH7D7ocnLdMtX//2LEJ+16777QkyHTVHXy1YVqAQviEApMEmdrdAEFyJeaKgwZ9JRR+yVJL+tdw8F2cpvuu0KofA95oZnMC/fS2eDOOSY8FMn4M2tR7n6Mxzg6TLKtdonBDvWhhrVTzdQf61UB+YFLxF0187Z9qlXjGs814P2N0yDhk0ZguGlbWgFf06p87IwofQuYNlq7v1UwLf9kD145/knlh+8q3L6cQ69HvwcVsgxIqVsRr3rJ/fLysaO1sYQJJwI2F8GTzvYWk+bX+ITvJQH/TQQVa50DIHYR
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(23010399003)(921020)(18002099003)(22082099003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /0ZZXNAc3hg//DHXGmpYh9irxTPmld2KmVSIyHmhKgMpCK42cySbXC6fu0Gxcgi+MqcMkkvwLBUiPZHiX4NLZOtMMJeXZKXNjdQEpHZaKDgvPpF5n1y1snb4dPfmjNMwxQaKmjNW4xdYDhwC7ikuK0zb4+bjO5GBnIonH9CwAV/ecPLNAo1p7OOdfN4g/2Kvo/VbvnyPqllEwt6sW3XGc11YsbWGnvTDXfvWjfP0+KMW2uf+DCcKorg1fUs6S4X4sZUstrXUA/V1jtmgLxUC01b0jK8VJwpnkZBNWWhOGqKIPc31ybqCEK3JbudpVsolvp7/wUV/32j72hnGk/65pIn8o2CCT7Dtjq4SzqmhqYIHMXIqBJvfzaQXsutxOFaaatPXtx6x1wCez5YHyST53DQlko2Rb/3DU7hyk1PnKfnMQwTg2AgXKTwxtkbIQyPv
X-Exchange-RoutingPolicyChecked: sMI6dvYMol/J2rjp1JJ7Ak1n+c77Wi9yfof9XKdHW8mQSxVSF6KmrnrVQlF/4kCSOTt1JbpptJ5u5rh8vZX7XzE0uzQ0YGvroLF8c98c+WuKWyAvaldTsJx19ngzMu7uy/zgVAEcE0IrkGhdWmn71YMTKAZjXuKuS8n3cCASCK2QGK9auIG8Ta0VL0CWo8CTeRiXK6593/GVhYlddeQPNWeiGjKSQHOuiAUq2NkouF54ez4hTryf5dG7LCah6XnnERY1DCOn4tGttigORNQUYPU+qunnxuyRTr6x3LVA4MLe13TJJmOuuRlkUYNSzQKuaV3kb64aWFHG8nN2yXwCyw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:37:36.3043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faae7c34-15bc-4179-fe28-08dedccc29ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6534
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX4ETC9UnwSUJY
 T6s510BQ6VpffLG/mqoedyzqu7vrvx1vnS5Gq+raTjpJtvG3ZVVAVnBwAMvsQnRdW8vm/Mofmsz
 b1iTrclZojyJkxrHfMmjZLDPMqzah/w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfXyyaWbS0sm7ka
 WloyLobDImeOCcoiWTnACqh3nFLWdCSMT1PMYvsNzgyJD/LZbvc9p/WAJuQLzOSKkOkd6Q6udhG
 CfNp+AMmEmEzaDerdd0iGtj6JjyUjG4UhjlWzgMRl5vasJmDQm/q7phMV5zLpA/WlrI7C+38t6r
 3Xsi5DEQwUEkbAGwgrSwkZGJKWm0c7C3HW1UJwVdvhiP6oKWGcqwhJM0lMPTmsmqIgCIrYxi7HH
 AVXVwRcayfFgMfLlQQco6tiIivcL9bGQfcYB8ufr033hfHWgMYGif6sChgefeWkXtv41EMQx2vi
 mvbkz8Ir5+TjNNlzkte7NZIQv6i93bhTHNoNOr4GcXLFrQbqIGMj1hrxmaWwfSdZtBaFc4DBrhD
 ig8TcA6lfYaDDYlQfMcO3+cykQH2nU2+Egn9TaZ4J2Cf+I702mnp9AxZFIHXycuXLPFqC9b/vVx
 Vfzl1CbOKAOZHjznEnA==
X-Proofpoint-ORIG-GUID: v1bsofyEiEhAykxHLCep4y0O3fwPfjzq
X-Authority-Analysis: v=2.4 cv=CIoamxrD c=1 sm=1 tr=0 ts=6a4e0c54 cx=c_pps
 a=tYoGMRiLV1KbapjTPXDBcg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=uSPA2Th2IVTVKQU8YO4A:9
X-Proofpoint-GUID: v1bsofyEiEhAykxHLCep4y0O3fwPfjzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_013751_102207_20D39F8F 
X-CRM114-Status: GOOD (  13.76  )
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

Update the maxItems value of clocks parameter as 3 clocks
(refclk,pll1_refclk,phy_en_refclk) are supported.

Update the clock-names parameter to support mutilink SERDES configuration
as the existing enum configuration of the clock-names parameter does not
allow both pll1_refclk and phy_en_refclk to be used at the same time,
hence preventing the support for the configuration  (refclk,pll1_refclk,
phy_en_refclk), which is neeed for multilink SERDES usecases.

For multilink SERDES configurations where the links require different
clock speeds, all 3 clocks(refclk, pll1_refclk and phy_en_refclk)
are needed.

For example,considering the USXGMII+SGMII multilink SERDES configuration
usecase, having only 1 reference clock(refclk) fails because USXGMII
requires a clock speed of 156.25 Mhz and SGMII protocol requires an
clock speed of 100 Mhz.

Since one reference clock(refclk) alone cannot cater to the 2
different clock speed requirements of these protocols, the second
input reference clock(pll1_refclk) along with phy_en_refclk
is also needed.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 9af39b33646a..ac0f625cd76d 100644
--- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
@@ -34,7 +34,7 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
     description:
       PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for PLL1).
       pll1_refclk is optional and used for multi-protocol configurations requiring
@@ -48,6 +48,7 @@ properties:
     items:
       - const: refclk
       - enum: [ pll1_refclk, phy_en_refclk ]
+      - const: phy_en_refclk
 
   reg:
     minItems: 1
-- 
2.34.1


