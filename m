Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F10C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+KoyAcwDg4zPgTKrhCAsmrdOzBXc/b87BbgOWrjCJM=; b=P4bghBUSMGESpOi7u3tKdDR8l+
	x9kYdo2Du+BaNK7kmtn+ITGcpS5xIY9j/V2zFgURRRWgKg1+qhB+Gahi5201IIHpdY5nLnzog8icx
	S2Qt3qpBKA3apMpig+AxBeLBAW6kyNZW73JdnCI5sLSwwoopmw4joz5Tvja37CKSzDShHab/DGFEM
	EMa/9euVwisE9rhyA8QAxrgyz5Qj1INAhU4fe66dtCaLXftQkWfiCtu1dc2wnyWRaiz6JUiUcWOld
	vGuaaXchjDEvqvjXc8uqAQY4vK3sAHEgHEJuyioVcZKx4JC88JPNYBV5L/XUnY5CJ2XKDjoLuISMc
	qFms29gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpASA-00000008v8C-3hv9;
	Wed, 29 Jul 2026 20:00:34 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpARo-00000008v2I-3Fz8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:20 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TJ5xus3536769;
	Wed, 29 Jul 2026 15:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=d+KoyAcwDg4zPgTKrhCAsmrdOzBXc/b87BbgOWrjC
	JM=; b=cev6Ygp+NSME2r/Dw8uW97iVXZ19MLn8jS9sfrFQDahoJ64tYC/Xkrs3p
	yu2Pqeb/AIjEx+Qu7yOhOg3z6b8PiXQvItMO9IK6mVS8+qtwWqeSC46vmpbCfPiw
	w9PP3Zxk4D7x2aAdVaOgSWvVqf6oDAyqj7ykvu2nCcCDetjwgTUzlnvia+wyd/+a
	9f+ngoGBoYX7GAPr00KhOslMwED9LkwcQmdx9gPx4HOKf+GlABVmMMbUakh+sOO6
	0XZDg7ElAa1JzylQP1EFKyOzxaaNDh0L7SiZIaRb5IAsdSdB30VY5UWsAuibZApq
	ucVQtJllOoSyKwngvMQE2qZGFdyBg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqqcmrape-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWm2bdNpkqxmS/fq60AbAVd4exkZsR7UxOxlepbJJMfVHYOK2ntl/Z1Zgnau4liHsWwuAXbEuj04UqyfeJABE701x5NDrSUbi2aXCk8s2ZCA0qb0RXDoHt8gp5HtNwA4SY5QPJbSrn3Qi97nAsATGYgtWW5sHurGWzlNX3R9dt7eEEaXioDPN8Jl64yTDQBGDnrDNXmvKhDxNn9BStZuZ+1UXTJC9rLWFG2RS3OTI2rYY3kspFFovcGNY5/zU72vN3lUY+x98U+f+jylly68ecGvKPiK/cxOKdZyJFUJ48VSL7vFKmi2Rhtz6LMuShOod5FqSrqQvszQa7BqSQI8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+KoyAcwDg4zPgTKrhCAsmrdOzBXc/b87BbgOWrjCJM=;
 b=jUi1ZDrm3fCLEWdKQ6nWuvgq4wUS9UVqeukJsdXCJfqmTyIH0VQDXkI0Yq5wSgUJ7Y0PPw/sFWii47w5MQ6x6QvzuZvGvJ0f6DyfmZUQyej/0m57RS3KxvyciNobPh8MIYAqz/bH9GUN89egVC2l+ZOjtk+feAdoZbk/oXCWY+WxGguH+HYpKMC0EDvKwdGbVd09bVY88hKQi4EnhWjztTVYDTdPw0ySugEY2jQhWkvt4pqR3+s2aaEH0PQTDZGuiARNPp5Q6WTrQHEr5sIKF2OJZL0orT6wEmWI7LPXmMWYfsuNjpXDJisOYqMzlWvbLKVzxzZ4y9Xr+XAztPh/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+KoyAcwDg4zPgTKrhCAsmrdOzBXc/b87BbgOWrjCJM=;
 b=tJfrqoUeunCzXV5aw7zhXfpPZHWEV5Yx/l+QDFfEBZmCWiXSF0QhskrFAKFb3i7M1E/MDHOd8+aWjqopqYUB8xThwMfml1541H3wuFnO1E0EBmFJX/10Y5UdljRVyt2qk8ZCfDtxycXhrWAp4+luxS7HLMdyxb9NscJmZD4Pb8s=
Received: from PH8PR20CA0012.namprd20.prod.outlook.com (2603:10b6:510:23c::10)
 by CH3PR10MB6833.namprd10.prod.outlook.com (2603:10b6:610:150::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 20:00:04 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::1) by PH8PR20CA0012.outlook.office365.com
 (2603:10b6:510:23c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 20:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 20:00:03 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:58 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwfs1923570;
	Wed, 29 Jul 2026 14:59:58 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH 1/8] arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
Date: Wed, 29 Jul 2026 14:59:51 -0500
Message-ID: <20260729195958.671147-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|CH3PR10MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6af04c-73f7-44e2-475d-08deedabfad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|13003099007|6133799003|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: tS4h5kJeSApvCeUF9Kp88TsD3MNOAz7UJ1F4PXATcEYxh1EuUby21hjjC3Tu0gb0s5EEr5rvqnYJC5ULaMy4vFWnGOY85yckq1BJtP+ANJ619QqfwcNvQ0Ytv7exb/RjYkDmeI2eRM9fo/m3FQMYh6EepvWT2gWnMXU6liF/KAVLgZ1p00vr0fStFY9zbJZzcqmbUPg/JXJ6gHFXy8NCiQ2MJul0F08fFfCc5fhgnqhjemzsGGuVhB1ycRx0i/GMEiUk96egjsNEoGSd3MSDop7QQVo94hrmeDkhwEDB5ZVX3KBcHauU9FfCmmtWXYtTkVvpQefIniQMzdtS1HyNMOUK5P5nnvozG11DqVqQ18aaoX1BSOIjQDMYw+9HtOqROkISHeiE9gMAggU5bQOAcRF+o1pBUHpD4dVVtExrEgj983NjBc1VW94fylS4f0fIlG/XyCeu6BDyMdRRGReCvHsr9r0WcEbs1bv5pxzf2mv2tEUVt2K9daEvUR+eWTYtd2qAIJd35ST9jRHKxmgnY5pP5Jb6uKToSnE98Uig8XfO3PPwBs7Lu0OEPx3orr52lt9nSfnHPywn597C6rSuGka7TFUrMhF3IdasaGcggEoEgQtdild9+46VU3i45Rt6FmN3ahrKkiNET00AM2+/kB/zGfKurt/Eha0EP179lQvqgNm/thR543DSklqg0DqmQwA9AxUm0LZ7ALkd9Ri4ig==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(13003099007)(6133799003)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YRGPD48Q7aRNHJIv4qYU/BGu1968v/DeGgOwbeCkQpHzRrDUln3kPke70cQI3zPgjSH43zkH9bHqPMg14q8nEOV1T5RDiRMv89LgxNKfnlHgsp7zCC385gzaJuR9m+NCjSbDHZbadd8c4HY0sZPfFnX8k43lQWQ2rVnV8UvsrubQ5UPl3sMAL8sqNjoUCXghRMP7kGxopRU5QImCHK1gfONv1mgG9Ebrd2MwRUSPcFi6X9qyTddc8XLlMPhQ9pNSWdZjiU5kBYCLOTwvg9euMnHg7pSLZoQo9vxrn1IPoendgMUFmZ1nsplyKxodELvst1AL/yvxBxIEOWKzsft3NF5fqE+hjXn+pjKRo7GdD0PFOCEovAiF1eLZpviApF98/eyS1CC5yZtXTfVakfwhgsKulp+4s6UAEdxf9Q9Jp9U4+lupi7ArBoXLEVM+WBwT
X-Exchange-RoutingPolicyChecked: aTLj2ZFykWFwD1tY8DY1OJ8izCDidckxRMD8sTipY+HuWvH5tvsq+fbp/n5X7CXpFG3IX+sQQXrAnfQTA7VEOqXVjAYS+6jTfyJOu76LVVYV701py1lfbP7ebZOW18SXD9tD952Uc1ow46UM9qdFsTredey/q9Vzj49Tiv5Myp+cbh2v3RjQdSM/H77PbB1mP+g3yJKC66QOMy92M5FfRSCWF1AImMF1SuL9HqhUmMfd28NX4Br3hvHf9w2rvAlftl8fh+mRfSgRj+prfsTEexbrYkXA9dnKLd2wbrCfnWxbUZXngBlRQMg0ntMaMJn+mAeoqR5LWi+mQGNvaOeNIA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:00:03.5479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6af04c-73f7-44e2-475d-08deedabfad0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6833
X-Proofpoint-ORIG-GUID: pCg0aanWq-sJxGeDhPc4d4lIvnMyaDk7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfXxUcpcnIDsyHE
 EVDw0LbddebDhahTCYTxSR2P+YcuVtRZSlUIUVuaPLvuSpWAXKhEIsT2qTgUuRxgzj0ZD+3JR0a
 kJh+MFdc5HFerQiUTs2ZeVX7l1O+JoY=
X-Authority-Analysis: v=2.4 cv=UtZT8ewB c=1 sm=1 tr=0 ts=6a6a5bc8 cx=c_pps
 a=wUQTFLLo3/oASVCpA6ZfNQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=N8RrIdEaZFVbIXh2HqYA:9
X-Proofpoint-GUID: pCg0aanWq-sJxGeDhPc4d4lIvnMyaDk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX0IbBlc0cfuTd
 BYrInWiGHg4c0OdEmDEvZM4ZGihya1790bVb5aHwDANqeGsaZ/wv4t/gOVofsbOBTuuAcwZbe05
 7ZkvmDxqb91TMaK0uYPzgIYDVK1XTHEAgTapTXllKCuAZ9+uxiO+2zgJ0O1EbPHLtL1psYZWZcw
 qPULA6l9HRe+9ck/lv51reDPXe9ptgWJiOnKi7bZ/6cTFCKAZmplZaygZ8dn+WC/08ovEzvceZu
 oaGLVF/tFNv+guyAjL9N0TuOJbNKgULgs7mBVv98vyejC0fnhvHphlQcl8KEgyQkGkfvTef10u8
 /xpwZXBOXBQsV4urgl4i1Gb400PivwNtijuMOO9jbL6iFkW1DQnY2GS5jukVDSobiALSontutMa
 eCEiXHBJ6MANdp4F66iCGi/sGvK4lc3pSpcJLdkTdMo7MDnm0vuzWC9+ToLNZ4zLDFig3WMti78
 spYnNR6v/h7us3kagVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130018_232334_5C8E4A0B 
X-CRM114-Status: GOOD (  11.75  )
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

MMC0_CLKLB and MMC0_CLK have incorrectly swapped register addresses
as per datasheet [0]. Set the correct MMC0_CLK address and drop the
unneeded MMC0_CLKLB pin configuration.

[0] https://www.ti.com/lit/gpn/am62a7 Rev. E: Table 5-1. Pin Attributes

Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 821a9705bb7d4..826fff38cfb77 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -324,8 +324,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
-			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
-- 
2.54.0


