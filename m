Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF74C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiNRyVDbLCGqqTQr8xzB+EsptzXDnV5IHwJGtHe5is8=; b=Zj6amOxXWEZkbwWq3ZQs3Lh3aD
	B/w9hyiCzEKXi1a8ntR63t0gqsrdQ9TER+4j5xfH00HV6Jatst6BF7pXd2LbAJEF/0TEi56LMi3hg
	JibFwcDF/aC8XsTbke+FsLw80zlANFcRD8AHGNuPAjrR7tEZhBaueb+zcQ498def1VBp3XkCUnzlz
	Vh+utQ/2SSXAf6F6+9u9FwAmTWxbar6LPzIWbV3Bfop1e+4TJdQSNefX4PuRM6upOuAisX1xXx4+G
	NSC/+EsdZSsI31Cs0/XiOSCU2GSfAbRDYSxX5vv2Dr9M8ylpC9TpJtzbrbODwtILr+30sGfRwkga1
	P1vFntTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNn2-0000000Gdkl-0TE3;
	Wed, 08 Jul 2026 08:37:56 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNmy-0000000Gdi8-0gj3;
	Wed, 08 Jul 2026 08:37:53 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688AuaT1785862;
	Wed, 8 Jul 2026 03:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wiNRyVDbLCGqqTQr8xzB+EsptzXDnV5IHwJGtHe5i
	s8=; b=SOrgBs6HKfhvpsnbhx8SxrXc4tWLUTcZttrq8/zK4ePsYx0TKmUEM2Y0X
	S1VBHE4iNQrW+1roEjnaPdTdjfbt8fxO5i20HPxp4q9QZ5nNyMrf4QlEx0cv68S/
	w4xp+xchFa2I2Eeglhh5ta0l0mmKEZ+bmydYUyQ5OF+z+aU/mXGRxqiJB+bi+L4x
	qn7L3k2l8z9DF1RC9gJxiDoJq2ksuVyuM2YRK5/NSOQy7nZaBeCRJYd5QZ809pbh
	ZvgRvls/0ILjWuMQUIKGcmys78byZ/0Q/jUKh9YBHL3SmEMD0Xz4IcWDIsOxgK6/
	fApFJiSeUkk2dxjZa55sBB2vh3uhA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f94m7dp2d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:37:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWyEsihdvMF4xcyh4AHGhCtkUFTTv/GKW43ESvk09vOHAJobtHZaZNL56EL+cN4gvYHkP+USWbY1jHj0H4uXBun5sZDW0OYReXpF/xnwhAowCdfFhbGkDqK8ntuGlkvqBYrIovS+lvzYOa8R6yjWlDCK2nRBK1i7RfzhuE9JCqEF5qfEu5B6hxKGnr1rk8NW2ITlfC088zy3WwQTFqH+rUEw8u7vyirNM04rELgJYxJRdhqN+fWLbD7J1Z/MQhasU2lz3ac30Iaq59+VklmWi3olWslD8JFHLKjPVYHHrTtT2xePSzxhUEf3DCHI4uEXofpqnkAr6znntiyYAE14xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiNRyVDbLCGqqTQr8xzB+EsptzXDnV5IHwJGtHe5is8=;
 b=OdMHj5ZBxSx/UyXcn58qsgfSHwnBqnlU2xjM1P366LOLSeTMSQ+GmCzJU/stWhUmrPKSdQ/U9JuZu8twFmVFY+Lh4ZI3O0zM4mJQlq92jzxxNNc9B1cfTx/58Gn8yuZd8IkRu0wk55rVh7aaBSxUGpj4680sUpN0pbBZailvVr9MaRc8xCOT6i2j5hKVz+ynFsQ2UE+YhWWsQKasEFXtqgVFmFfmS7BFtVHW4CSaM3t31iUeM4OIHRlpdLyXwAf0JHeKjGAuhFAemSThQI8cu4hunpeY/GtAiBpjnQmhZMt8OzXcc6Kkhr7Fl4HanyhuAEFWCBZecikI80a1A/1bMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiNRyVDbLCGqqTQr8xzB+EsptzXDnV5IHwJGtHe5is8=;
 b=Q20wo7UoaZ6q0C4dnv64IMlmiM33mHurXiU9jglAvp5Y7iur0Cj1QKQ++lIHgJhM7y8I4Ne9y/I9rOD/oTn0STiVwsWx9nOmxJlMqL/XREuxlgmwLHr6riWUvFI7vtowbs8pgLWu6NBiOfqExekXACc61flQWL01n2/Ax6+DC6A=
Received: from CH0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:610:b0::6)
 by DM4PR10MB7507.namprd10.prod.outlook.com (2603:10b6:8:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 08:37:42 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::20) by CH0PR03CA0001.outlook.office365.com
 (2603:10b6:610:b0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 08:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 08:37:42 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 03:37:40 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 03:37:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 03:37:40 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6688bQHq2346360;
	Wed, 8 Jul 2026 03:37:36 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>, <g-praveen@ti.com>
Subject: [PATCH v5 net-next 2/2] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node
Date: Wed, 8 Jul 2026 14:07:25 +0530
Message-ID: <20260708083725.66777-3-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708083725.66777-1-g-praveen@ti.com>
References: <20260708083725.66777-1-g-praveen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|DM4PR10MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee4b63a-9e3a-4b20-c7da-08dedccc2d47
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|23010399003|376014|82310400026|1800799024|921020|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8MW+fMAbVzH99BmJJSwqMtFwhTdVVGcKkp2yCRbqGSmw6VnsK4CX1SZsVHFA+rQzGCnJmKtjuPsjD9Pou7gqvuAwc7VTOE+KmeYzHb9AG+5xGTeZjAj8t9TeyRSua0ldeg5NRYyZU0jnzqxNSjQS28TX4TQJ2qAD+WrZF6ojjsFRc4X6GkX4hyFPZRwzzOHXi8Yf3ZNiHJXzuC7skuCo5y5BcxJUSTYWFHfyVcfJJi59jZ9+bH8ntRsS8GqIKwhXATlfBPS8fs5U8wGp4Pmha7FWL8K6BkKRcH8jcYpTw5x8/jd+BIHWsNuxTqSY3RiZksbl3yEWzPK6JdVk+2xuV53+WBL6CWjRReVYW4WMXDtcFe804MoiE/DfLaA+LZsSdi95aHAvxhh/dnSJJdnmbIpSTmHFZIAE3tAO1xYwVjPzgJW45BP056VXStpX6XOWjph75rUAQaiAIKfS0Ap2Ofl6W60WkAudWJtY1hhKmCjDhMVi/q6rrxnddeqMxwIKzVwB97AH8i30dIitGIK6pnqCz15pcsW/h1PbECPlPwHH8sGY+t34Wu0DHBkQ9IKtVXZCqsGxxsvQDQvRi2O+/ndhxg90vBtrzBPzqq+AaBtZX+afBMRWGkZV6rqj7HfKYfGnCu+8f4M9Y916t2XlGhBZ+chtV84al/MYmL2m+YahVbFALeqrI1ISSV2qT9PC8gywU4z/ZhjWw851kUr059X7gRCiMryWmnGvw2402jIljV5oZsvyoc/RBaZ/rZRt
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(376014)(82310400026)(1800799024)(921020)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uxM+tloVvqRoDsqUYySXwfRvCBALmCpSp823w80+7RuKOr33Euymsyd3t3gjBqu+5j1hphMXb/4N/muZeCluzmV3/RTBLAp8NI8uQxL4k9UhsjfdSL6CsDMrgrqm/6R/4Fhd8jQx2xPW1PB2UiqaNFRvPmnSpsCPRqjsSxZTk22cGODVdWtbwapSMqXdHHhr3wrCXbOipD0EpBmIt0eB3rrt4Hff2NcfSVJLJFvhuePmvWXOQ1vU1V+NC2hZjAaKTu2ye6PmXiYEu7Xj0fH63gZ6O6f3BXqHEdp07PVjW8OF2CRi8mQqqCMtT5R6CdS8M3z9K7KKXHZtl/Qq5wWTZrGPyPoFebNWO5dpHGrj/Ecwcr1wFcWs00z9LlII+pC9pmyafnd050T22Ji12n16oJlWZSAFP0MCjU0cIFXeXl2LSjfM6YA4N9Q6kX55OwMO
X-Exchange-RoutingPolicyChecked: LrpTCbhwcEMj6ozPHGu6SOSg/Chav2kV21iNriYC2PoIg2OUGlqa6Cd/HAMI0teqaoDlDFz3d2AHOFVqhOuVYIBn2sAoUTbA3sfc4xVvTm1JPGwgCaQ42WrIHcCIGkRLQxoY9KKdZWmZvwJ+XhT/Ib/kjeuCqffUPMS5QOzW6I2w69ya5H9mIVmTgmWFjHwU2c0DHGw0Nf1sISWuVo1QoB/LGQkDDNt8FSRTbEqrwAoWnZFxLLlX571LO/vdS1tWnvTvlyn5NhbJKMJIU7aO2ug5p/evGBlx/cJgG34xp/ZmjZgIcPYk2NmxKS/JNNUjalAjRv6/A7vNv1AcACFQ/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:37:42.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee4b63a-9e3a-4b20-c7da-08dedccc2d47
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7507
X-Authority-Analysis: v=2.4 cv=f594wuyM c=1 sm=1 tr=0 ts=6a4e0c5b cx=c_pps
 a=+JqGDqswvm8kVNJxtWojiw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=LJxii-BNQLeJb2iqeE8A:9
X-Proofpoint-GUID: VbJ3PANRnuZEBDiNraDC_Rl1BZDE2eXp
X-Proofpoint-ORIG-GUID: VbJ3PANRnuZEBDiNraDC_Rl1BZDE2eXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX4akLTbNgmbBD
 7RcauPddMvg7s2eSbu2usPdSxETdJhsi3p6yeZXyHZ8/r462IsVI7BG5ied9HnV4EYKHJl574pD
 ONHXU3Nsnx8xuz+BBFjHLf8N0HBCeCwDn9xW+XLKE8MBkNFdFUAwENs+CMxqySowpPk5KSByhk8
 GlxKrirkaUEp0yJ/NqpgXOi/dEec56RL2U93ySg6rzw99y3LcDvs8VywWY6EEPYbP/DxooZYdad
 33q1edmRz37hBcdmO9l7Km6zkKo1EGXtWctnaeYZFMGFgwyVJ9CMhStUsYYDnJnby2Ei08XHLJt
 4BL1vetSWvkmui6IozTlhCwL43TtaK13SQaJZxeEJUdf5pP7IIfEitkknXESsM+e5H39yRUBtdY
 2Pmm8gryGc7vQ0TRb4NRVYzv+bXgGyy7dlMwf25jMvkNaC3hujd+jYVp4DaH9q4lKcnl8IpYiHO
 U69tMpAyX5Yvo7JUlvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX7+zEPi322X5I
 ccB/cPY9hjt0geaKYz939gYhgfemuozZ3AKcAeboHylRxyyy08EEQcm9kMVDSIi/zT7TefnFBb2
 FRJEYk0sgI7hES4KWukB+myPkb+/SS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_013752_336833_B5E29888 
X-CRM114-Status: GOOD (  11.03  )
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

Add PLL1 refclk to "clocks" and "clock-names" parameter of SERDES0,
SERDES1,SERDES2 and SERDES4 node as "assigned clocks" parameter has PLL1
and serdes multilink configuration fails without PLL1.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 9 ++++++---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi               | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index c2636e624f18..e5224bd7f538 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -1149,8 +1149,9 @@ serdes0: serdes@5060000 {
 			resets = <&serdes_wiz0 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk",	"pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz0 TI_WIZ_REFCLK_DIG>;
@@ -1186,8 +1187,9 @@ serdes1: serdes@5070000 {
 			resets = <&serdes_wiz1 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz1 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz1 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk",	"pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz1 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz1 TI_WIZ_REFCLK_DIG>;
@@ -1229,8 +1231,9 @@ serdes4: serdes@5050000 {
 			resets = <&serdes_wiz4 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz4 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk",	"pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz4 TI_WIZ_REFCLK_DIG>;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 78fcd0c40abc..53109e2fe527 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -122,8 +122,9 @@ serdes2: serdes@5020000 {
 			resets = <&serdes_wiz2 0>;
 			reset-names = "torrent_reset";
 			clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
+				 <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
 				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
-			clock-names = "refclk", "phy_en_refclk";
+			clock-names = "refclk",	"pll1_refclk", "phy_en_refclk";
 			assigned-clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
 					  <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
 					  <&serdes_wiz2 TI_WIZ_REFCLK_DIG>;
-- 
2.34.1


