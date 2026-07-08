Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3995CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y5ou617uKMf2wwZiVoM7LXSCxfbqaoQ/Nifj2TuE3RQ=; b=aAFhlZv+6oUMqY
	Srsq0hkzVeOFl5HU+CjBHYH9o+b16TIKF0nM84lx7+lhVavwsGczmwgV8Dd7Uj63b37HPrG+BQjVh
	1oswJtQdTTPEENbJWJNFbwT2+qZZlcmXSFFJTyOR6S0htxSid2MJGvvpOsnBlSM25LSXwcE6wpuk1
	HrAtkPWU/0+WTXVBVgADMau2fxubxnbmIhVcNE2mm4JlfADrYFp4ilcy+Nzoyi+XVYV5INrprq0jC
	Poq/LmQ52QXxk5Ju+YiokxrAilHLUAqoI8SRoW7RkvW/MJd88c67SlX7lXHGD9oQQ9FZRuumM7LVN
	Bmb58GswTNeSXtadtr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNms-0000000Gdfr-42ad;
	Wed, 08 Jul 2026 08:37:46 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNmq-0000000Gdeh-1zdz;
	Wed, 08 Jul 2026 08:37:46 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688BEAB1796847;
	Wed, 8 Jul 2026 03:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=y5ou617uKMf2w
	wZiVoM7LXSCxfbqaoQ/Nifj2TuE3RQ=; b=ZsT4PR1k1KPmNoHg5bEKqnk06BO/t
	O0JPzOOe61kRQlysmwChdVA8ICmb2eaHv49gQs1lDUMbVjPuEoA8uQVArEmlbLB+
	OeqkXqQFiWr/NvSuBy1cgA7HjgJrE2Fm5DiqU9aIQL81nzJaD9OzTpb8tjm1Cqyc
	S7BTQvCwHlMRPwECdvq6LbSuXEH2fZpAtzwAgqr5QvxtkJ++6Y0waNVki2vfJeZl
	EPL2UvIOVHvLgd5tcdX7Qd5BhXA36hKMwGVo4bjmPaBlc3P3txY4q5TDEdCTURwf
	iEny4l7JOckhXAsUcxF0w6A97prKSySX8y5NurbOtBp5bg6mEOXthSl9w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f90cb7bc0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:37:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq+ifAYe3sDIoXotzYbgRBRnXWDIRXZ3+9eRN1qO8Ei9T5MF9Qfs9w/FbVtQuazvynUizfMpHMak8la2fAfALTbIoPAUivZGpHA+8BvHWf7Lc8/ZF/BJBrhNsdBmuB8bq5Bm5BI6ALYLHLk3FgaAeYZbwv5SFuJM7TX9P9mhQ0VD1Nz7xEnUByXQx6BZtPJWlyY1a6bMXOlES1fCEQwBFh1Y/vHZAZQJAOG3hjrTWSuMOqkmtnPMuZSY3XbiG8k8oqXapbBNcJIS7PeGEOf2LgY9YI6nU6R4sJy2BiJ+aI+cFJd6V4nOYjiYDIir3rklhqBAjQDMcbwVAjGAP1Q8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5ou617uKMf2wwZiVoM7LXSCxfbqaoQ/Nifj2TuE3RQ=;
 b=E6Az1FJihp/cayYd96VsCzXTrRNkA8Rzd1BU8VE8ESMNnBeZ7fbHoqFLwXkKOfQ2CPQisyPMquKVPkU9ozs83+YkAHyC+9c4qdr7uPs8fTBN4MoknYnegnK7ZgouUdqCtiq3fEoeEiccodauy2EPDtZDAporSe/Lr+QwD2okr53/Jkolm9zB9ORr40GgNm8/iU4V1AAmEp06NGJVRX0eo7aLyMVPKD0JXUSmjii1up35BHefarleKCjkHHkRG8LDv81Txi7eVr4nPMAniKNtsmb3HLquRglCh1zRmsJZ2BZTqHADUq+SfGFeveE6F3SqZOo1DRil86O2Sfu6u2kN2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5ou617uKMf2wwZiVoM7LXSCxfbqaoQ/Nifj2TuE3RQ=;
 b=h6U01PYRjhJhkzG83YTdl8p4rlJaFOCiP/1tzpY7MQafmXo3SIn35AZYZEJlzxFrrHCX6ef2Ha3adl/1TuB+shNaTnaqkf+V/18N/vIefzyD4STeTQ+Brw0DmD22vyYPtvmDpv3jeeGYXkHH4sE5r+l0M8SaOH8JIBc7pTfCQ8o=
Received: from PH8P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::28)
 by MW4PR10MB5726.namprd10.prod.outlook.com (2603:10b6:303:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 8 Jul
 2026 08:37:34 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:345:cafe::1c) by PH8P220CA0018.outlook.office365.com
 (2603:10b6:510:345::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 08:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 08:37:33 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 03:37:31 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 03:37:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 03:37:31 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6688bQHo2346360;
	Wed, 8 Jul 2026 03:37:26 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>, <g-praveen@ti.com>
Subject: [PATCH v5 net-next 0/2] Add multilink SERDES configuration support
Date: Wed, 8 Jul 2026 14:07:23 +0530
Message-ID: <20260708083725.66777-1-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|MW4PR10MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: c4570d18-3a07-42b3-00c6-08dedccc2822
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|23010399003|82310400026|376014|1800799024|921020|13003099007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: PD46s5tFB9FRHtppP+UgNwQ0vzowRc9+FFYotvwUtdw9Qa0uVwZbsTWUgzXjrXSegZVWH/ctQDQCnJ+caYGEMbu6jKnTk/Bhx4CgcQHSvskmcwDEUcJk/DYlVPfIWn4Glp51lfdTLUKKKDg9p6kpm7OdnLvvjHNaQhE5o2KrbzfWnYaJkIG9tGNBzyCJuf8b4itk2FXeNHwqLIiAkAGMSAvQsiZruaDGsl8Y8eAa1sQwZmH5lWy9wnmAo2yhEqjLZBaB6l6NharHpPfh770v4HCb3+FWYDFefZJ8dVt7qbY4gJ4sGjElOFPiYAtLF97UKj1kGONFwsd4LWwQjG6sXmaEYBFzc5KukCzUzwfm9L4NcEtdxt7vXjLO3fqBpUqB1B+8g9ezbonLD+oJTeZhT7bWOkMRq2n8B+KN/dGLrD2aGC0nQ3q82J9FL0pwrrumuaA2qNuremaJmLQpnvmev927XxfI8zO150AWpFcSJ/S7KAVVrVZlZ1j+JB4Vh0ct+fFsC8i2i3YRUxX1rTqfeKv+CkaylELHhylhX4HN65ogOy2pACdoyDTixs1U8fB7RuzDSUqQ5xR5sCZx30ZFCh0dmbpmx3PWDYBT3GLjcQnLPtXXTNn0U20OVQI5kVnmA0zDIQCpGNI1FJ0pvLpYSggD/PMuKxT4mv/mF6J/fJTeXLqr0wCz1u+g9q2ORXFh3MLbXrb6fvmagvYC5GhqGOi35z4mejIJBCewqyShsnOpl1RgRzSM5Q5sTC6rWrUe
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(82310400026)(376014)(1800799024)(921020)(13003099007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: g75vcADDpjhan2OLopEmzze24AhmQ0qAe35EGAIH2Du1WLuosXxtrZ0pi1LBfRo/HQBLDk05lWCaq63QzgZNrJqEhcs8BjA/KDHSsoiwmJctjpQNAc7hedGE1fQ6LM4fD4LeGUkZtm6NGvQ/nij5zJabg4QWMpSP7Dgkz0mKNr1Jpq721d97YhHQMb/+Ka7h4RemDJ8S2jHuh9FCSEYz0mWTMOdQ48sXDyBYy5BTRmhw2ED/j3BOy7AcvW7o0GDOJBSWkFAJe1OZm0uk/o6pktA7+itdz4lu0xL4pFv/KdkcR85afhDFyYNBNP+K34W4C4CyVWKRgZTO0WJbb1QTBsEt4GMBfWE0oERqjj/lzhkkpiF7DgvA3cVkAxzNrAAiG0yeZLzFgHuY6jrqfLyryUp/6VD8MrwnWloWXBh0PwDke7dL7vKbIXcrUJMpaFxj
X-Exchange-RoutingPolicyChecked: WLMinb59NoUhsMf5DFRRcy1StOcvwmHxM463duNm9k3t9DK3JI/9OkTYNWQ1v5AV4e6R1X3VdIpu0UV0v9gKwTXLObq3nIPu1XATngjlJUBsvgTPZxY5vFVKyrI1PSsuAx38E21F9uUvQHXKQUcabcGhy0/besh35QIIZOckfyRrSQAiEfoI/y5jt+ZXQdjfkWkE+r6C5nVBsImxLd6lNriRJ3Yxu0cqXcXn42qcz8aUUsfeIbYTO61yCdKeKksI6Q+idbbAtxg1n+Q9B+KGNYsA/0f6zO8G5kmNyM4OQLuaEhUc/wdZmtBt27UPwVXW/zmsJqoQvwy8PQscDDPa5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:37:33.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4570d18-3a07-42b3-00c6-08dedccc2822
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5726
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a4e0c53 cx=c_pps
 a=J0oTDZHsw5jmD/+vARdUUA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=NEAV23lmAAAA:8 a=osIWfYnX3pV8zQyD9-8A:9
X-Proofpoint-ORIG-GUID: wmxqZMg1pcSemigDNIarWY5zLJY4Ux8w
X-Proofpoint-GUID: wmxqZMg1pcSemigDNIarWY5zLJY4Ux8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX3J5laCjHAz/n
 THeIuKZ4tKwzfSWHfop5/8cpvb7yGetGsZ3+UY0wCsYkQYxCRFgN54GbwEHM6GQlAEkv5DaFe9V
 lNtpuS8lsgr+MW8c7onrbq2SN+RL8mqIpRstL8Qm9tIC1o9YhLAaV555HeI4BDz/rlxuEbKqulq
 RNkhgk9IyqsdcEqxb6CG4YBHDWpH1HtH2R+4pSszM6iTg4i4rE/Svl0gcGMD37Jhx3Of2XIMZDr
 e+Xc1cX5MecCxkKS1YWLBBb7OpOUjNIMBhw8Z9B7p2aPcFQqOmvm1WJUkkyqw8W8rgVkKTSdTKh
 eA0DQCcqafITYqvNHLewmxa6pzqqGwad/YLEuRdzQ8I9ISzVBt9U3abej1qaRDtQKOCnxP8A1db
 lY0nyqOqTfN6Nf2Npe5Qmvr6BYdekxSFldDJcbsJKUjywOO6UDkKE3hW3rqGnIV4tPaoYuuuPze
 nVraqszgYDVtZLuoIOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfXw+13uSOb5hhX
 K+b1mU3wwAwJqzvW8dkgPxyUGuZFT412MUHA/O/emEO0p1ADoO95PNAlJUakxLxUjy3hD5Nvenl
 b4rl6eoXlMCGiT5CuCFaG/TwlMVax1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_013744_738324_2D5E0369 
X-CRM114-Status: GOOD (  10.72  )
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

Add multilink SERDES configuration support on TI J784S4 SoC.

This patch series enables multilink SERDES configurations that require
different clock speeds for different links on TI J784S4 SoC.

For multilink SERDES configurations where the links require different
clock speeds (e.g., USXGMII+SGMII), all three clocks (refclk,
pll1_refclk, and phy_en_refclk) are needed. USXGMII requires a clock
speed of 156.25 MHz while SGMII requires 100 MHz. Since one reference
clock (refclk) alone cannot cater to these different clock speed
requirements, the second input reference clock (pll1_refclk) along with
phy_en_refclk is also needed.

Patch 1 updates the dt-bindings to support all three clocks by increasing
the maxItems to 3 and updating the clock-names parameter to allow both
pll1_refclk and phy_en_refclk to be used simultaneously.

Patch 2 adds the PLL1 refclk to the J784S4 SERDES nodes (SERDES0, SERDES1,
SERDES2, and SERDES4) as the assigned clocks parameter already references
PLL1 but the clocks parameter list was incomplete, causing multilink 
configuration failures.

Boot logs:
https://gist.github.com/GokulPraveen2001/7a09cc5ed0151d264f32cbbc31896605

Gokul Praveen (2):
  dt-bindings: phy: cadence-torrent: Update property values to support
    multilink SERDES configuration
  arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node

 .../devicetree/bindings/phy/phy-cadence-torrent.yaml     | 3 ++-
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 9 ++++++---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi               | 3 ++-
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.34.1


