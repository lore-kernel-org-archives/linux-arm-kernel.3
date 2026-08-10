Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530A9C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rzzTnOow1588vY0w3WrjxIZagfvz/5Kcz8Lwm9GDLpM=; b=2iXvnktiIEGGKf1sZj/hiAWJsy
	tR3egb5O+AIvl6v/+PlWtY2Zp/MThSaBA69kRYdfGCmauwYButoJqjhXUAi3DHiApYtV7Q5cuv7Od
	iVs5AqgzrMj9LU/hZzDT5/H3e5Jd7cog4aCe6ooZEXzCGF8/emgaPsKv3h7h2paxBSbgz5SajE7Z2
	2XCJxpcq0WjIw5FsZ6z8J3er1uvTtMl0LSzelBAoe70U8UMZMoXrfbphqItK/HK73cV4koBnm2k0p
	5U47Ogr9159vXi9AOHuc53MD+81IxVzK9AnJq30hRsLT/CH7+U40hJxo0VkMAsuP+kUh+Nu+1fY/V
	TcjBkeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOu1-0000000Bi8v-2GVI;
	Mon, 10 Aug 2026 12:14:49 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOtu-0000000Bi8O-3cCw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:14:44 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67ABF62m2677499;
	Mon, 10 Aug 2026 07:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=rzzTnOow1588v
	Y0w3WrjxIZagfvz/5Kcz8Lwm9GDLpM=; b=iAnKqR3Qd5gzKXOo8M6TrkqDm0NPR
	Vis0pQgqkeD/FLnOULBXTmy4gZgT6j8GH1175JkxoMNzKg2y/r/GXEkOYYDyVkoJ
	gvGKQBT5n2WKood6kfy158NgSqdHtndUtN/KX2zT0pyMg6vrnQbwUYEm1KXxtXXD
	Ezm0RXgROavvuf4Ha8OhmcNAbwcTYL+3Wo2AgqnI7tsdVkIIhyaoQwFAkjVkCUEq
	tRxRYo966T+J6SpSnnQIWhyr04/h7mwh2K87Kg+hzPdA71tKoK3s87ltWPI/D67a
	cgT3PLSxYT3R4M5PM+ZCl4bSGUF//sDcEsLcnaguNXBX+z/K4v/KRP/Gw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fydkwr9ng-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 07:14:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtU37zOiVBVkPG+lxnShftl26mlJsP/TQc5BaierUgX62t8BmjflK7YPqdV+DDOkVF7WzSUJndnCO7YraWFgRGgq8sc4Tz3JTNbXBm8o7eNLiD8hEE0cZKXY+aOv629E+oqVWvnWDNJ/0WA4MNUofCDMeDLRkwOggv8UAZA51oMEQ6W1ZQ9i+Ul79ygJgKoa7dXEOn2G6kAmrhbH1dYwx+tu0NBOsceQPoDL/yI5Qy/yDFcXrshvpTu76HTGFcmHLn64ynRalx6z3opCjNaCRcDRYBGcB4cv6Mk3h7E9IIpHSMJ2cz6Oj/TXqvzFpoTo3Jjl52lnE0G6er687+vEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzzTnOow1588vY0w3WrjxIZagfvz/5Kcz8Lwm9GDLpM=;
 b=Ulxu5+keN5VsXP4MjtO1IVvmDpUAVuOvdUBSi9VfVSAlE6IN+WO/x9PDuhRegwtRG7Z4i8+T9jb63+ou4NgS+I1iD9tqzIXmi8AWoXwaRS5xnzo+krRPXDt/tYsWjV03AWeUnpp+au0Y6PVpqG73IxxJqe/enplPmPPK+sNp0AAQj6T3nti1OEM2+U4eOIPZrHwVWCAxBKVPlW+oL8I1vJc91XP8q0owN0k1lOaat68qwA6Ra1BuPur639blu1YfKsR7BfTwGLi90N2C0Ljt+pYBWJ6TUm/XfYOJmt0dal/oppNbdV6XJiOdOncgBEd3L+1KFb4LjxYfLG9CNEh15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzzTnOow1588vY0w3WrjxIZagfvz/5Kcz8Lwm9GDLpM=;
 b=lJJoA0q9dOZX5xqI3xwHURPaXserj4CRzMfk2XgW3WiuBs9Eu/94rJcGLV1/x7EvA7FHyTDhraXk2O46VeLwWtXbgdIh+DNXrG3Z19oHr6oMzVX3STI+8O7Dp9N2ZbEE+lBNEQIzP4LI80Vt36wPG+fUxyek/S7mjCg4hByguu4=
Received: from BN0PR04CA0093.namprd04.prod.outlook.com (2603:10b6:408:ec::8)
 by MN0PR10MB6006.namprd10.prod.outlook.com (2603:10b6:208:3ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:14:27 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::35) by BN0PR04CA0093.outlook.office365.com
 (2603:10b6:408:ec::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 12:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 12:14:26 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 07:14:05 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 07:14:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 07:14:04 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67ACE0Nm3132127;
	Mon, 10 Aug 2026 07:14:01 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <krzysztof.kozlowski@oss.qualcomm.com>, <andersson@kernel.org>,
        <geert@linux-m68k.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <arnd@arndb.de>, <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <a-garg7@ti.com>
Subject: [PATCH v4] arm64: defconfig: Enable J721E and Keystone PCIe drivers for TI SoCs
Date: Mon, 10 Aug 2026 17:43:59 +0530
Message-ID: <20260810121359.134936-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|MN0PR10MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: ed10d47c-7eb8-4a09-905a-08def6d8ec40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|13003099007|921020|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: vhuBw5TNn9a+EvdXS17Ngv18dZfLaQxXQdjYAb//TxrhVwXI7zp9fG7hSbGSammCZG9ey12AVd47YHhRAowd9QZpklmDexLVoBfRSddFpCS0QGOYwY+csdw3S/nwfz61b2pYigoCinjxAipBeCK43qbQRO2eVoHk7kHpWgAbaGEs7wNe68y/BQYc+m7T5x9k9gNN+rMLSpqYqZmP4PDodjuS+pVuLrZ0oPDDTLggzy1MDPU3s4hY/jIP+1UC/aUX+0lWgCnhdxuMCb92Sa+FjzwKmvbzxo9lliNWsOggzEf7hHt0ibm3MeT1eokBkLU5VToXoQ3K6uTEh2gGdpLCagZM8V/Mrgqdq1DKrNdJtD7H74ew0cXSNLO10Cnq5mQRYCErkL+X8kwa+FECD4bop/K8IJbUydBZGWX20JP7azsYRLObpqcyAlOnwrUFvh6K7QQ6bhY0klxLWE+L2Zej67cduA+hhCBSOcWLtXXLst424xE/c716keErH8hp1GJn3yhelOT6+rDnhNgp8Xrahh12FK4zFtsI2Gr7G5j0WZAJWE2OyuKOYmB1eLhfxD/6HrlsWmlR6F7sbCaA6cHRWn3Vgv66wb3ABTy4+I/j/oxwj1fW49ywAssqA/w2c65BjfgPi/64IEYnUq01+ZOjJCF3xcB4kVbQ0hdBqY/Jn/2oARcxvlycV6ZjNw7RZleLJhxyQQvyDZo/Joo5/Q+OVt6ShbjDJZXA6ybSEi4ykUugba8zx1e8EK3O5f6RN+V5
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(13003099007)(921020)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PhJ4pNNxxrkRRSw1/r8kXR12gQ2PQsAoQRC/2R1+RPm6+Q1VcRtD4HaO2tS8eY1YZumrGTG/D+0TPxxVTcmey9VK/Gbnxw4fUhPQgcK0dOx1f4UDhTER89sYgoqecSTOoqmW0h1aPR1LSD9HYvJctkjldDo0LoOmpPli7M3na6zO4qloBk3s4Nb9J7g65gt50MY2fJXnKmKKoejuVDF2k/zMO4e5X8Q8C5NPj1H/Wy5dXJ+YBAdAyN6zWh/rzuxxSv2uoAd4AkGdAQewE621XOcdzZ76U6EQJTL45qCx/PKWlIhAfEK7zpRV6AHCiwI/kSh1uEl7ecQUwEoW+u7+F5BYSWiD9JhmoLFgOJjgRBjAt5ckaBMpQfiYH+ZzY1zBDbe5gw1/NTC6n607+Z2e/FgN+oRaA7kQOBpQyS9C3HXMGnk9lI+KvAEfSTfihCdf
X-Exchange-RoutingPolicyChecked: hcD1V5+AVf7VC68P7bSNF7SFIdlF2NC8EyeCq1yQUbZhWL71YnuRCxWqSaCnp4cJYLoeXV5+be/E4uAIahJWgRTcoAAZa/D+QVKgd8CvWfdabyhwYZ6cySHf35zaUTHXgAr3qswcjfckKFENNsvKlkyivPRKYLkqOyPmqvZBaJfmkokHZ08FWDSd/5lZHQHUP4Jo3ugFhzXEkxeNM+FxXY+tNk9Mopk2/UXeniAfgxZKEQtqKHuA4rNB5m2gfL6Qzr4OUrWkfwNknEXXiZZGDWa0or09PkJ7drae8pMs782/YLJByPKDEeuxFNhgIqQXQs0tKYMwEWGVpBVBtSBLUw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:14:26.9040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed10d47c-7eb8-4a09-905a-08def6d8ec40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6006
X-Proofpoint-GUID: -IlsKwa7rTWh-eY6GJuWe0G31xJyqN4i
X-Proofpoint-ORIG-GUID: -IlsKwa7rTWh-eY6GJuWe0G31xJyqN4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwNSBTYWx0ZWRfXzMgQ5aig7hvj
 XBRdC5AOhJ78wlLlHEWZTmh0DufhBr0afxhG5jpilP2aa7rABotUBB7b1iaqvAsT0ulDbXl8Bx/
 SLOy8Val78v6VV1sCK3LC8Md+ZbvPtHxx7bECLDAtu2GN8Yy4DqH7u+qRkrjLI+0vEF7N/P/8zz
 g+BmrrvXI204ZJviwwJbygIPSa//udmoFrJCr+W0KZGE7hGU6sNBgbJzESDCPeBEOayWvD+xj2v
 qDY8wBYCQOex97C5mhB8zpmSwaH3yyFExWIRhn6dZybYWz1JSyJwAIa6D97NLycoomTAb4Qt4Kh
 15tCWUbIkh/hf2/8SzxYSGQ17C3mj8NAqEYMKl6DF9XYMtAJSVLO9jIoPyjjRE7ksD1ETPahtYt
 xIjIBHaYShJOl88H9ZWrih8Vy2LlsMzXiXpTnCqVBnAQJT36ezVHvLpZeEi7fyCBjbIZihJPRld
 WhnkwIYqEk5Wpd29ZNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwNSBTYWx0ZWRfX1TZ+NS9ZVoUN
 H/zI75+RgP0IYNkKubIDihj+ChC9FJCc05FINNUbJIZ7B05+bsaYuc82B7u3UnEXLRQAgAaIAb9
 U8dJEH8xhpDxogQa0w3Rlkt6N4xo5/w=
X-Authority-Analysis: v=2.4 cv=F8FnsKhN c=1 sm=1 tr=0 ts=6a79c0a6 cx=c_pps
 a=2LRq3VT+JIpsXvqoN2bfxg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8 a=oFLf-t_w0HqYTUmQs-gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051443_044717_974680AB 
X-CRM114-Status: GOOD (  10.94  )
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

Enable the J721E PCIe endpoint driver used by TI's J721E, J7200, J721S2,
J722S, J742S2, J784S4, AM64, AM68, and AM69 SoCs.

Enable the Keystone PCIe driver for host and endpoint mode used by TI's
AM65 SoC.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Changes from v3 to v4:
- Rebased on 7.2-rc7.

Changes from v2 to v3:
- Rebased on 7.1-rc1.

Changes from v1 to v2:
- Squashed the individial patches [1] and [2].

v3: https://lore.kernel.org/all/20260427044404.222396-1-a-garg7@ti.com/
v2: https://lore.kernel.org/all/20260317063902.262392-1-a-garg7@ti.com/
[1] - https://lore.kernel.org/all/20260223104609.876613-1-a-garg7@ti.com/
[2] - https://lore.kernel.org/all/20260223104650.876632-1-a-garg7@ti.com/


 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..ee3e97b2cb91 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -222,6 +222,8 @@ CONFIG_PCIE_BRCMSTB=m
 CONFIG_PCI_HOST_THUNDER_PEM=y
 CONFIG_PCI_HOST_THUNDER_ECAM=y
 CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCI_KEYSTONE_HOST=m
+CONFIG_PCI_KEYSTONE_EP=m
 CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
@@ -235,6 +237,7 @@ CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
 CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_J721E_HOST=m
+CONFIG_PCI_J721E_EP=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
-- 
2.34.1


