Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D44C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q3+t/w48FeID14IonVY4jHyS2FaOBh7CvLudo/jgrwM=; b=242UiDHaR8TF0YAXzcfioRDIAZ
	U+inxZoSeXg0mR0C+rpIM5bumZMlE+YJcdyf5Ej4bk6VfS9X7THmp0sJXrXb0n5oR7Ok72Y6DZn7W
	zmnoTSIn/tyWMgVVMPij7MkFe+rssH2+OBUPLLpgNQW3sIKt9vGnOkqYz4H87rAJcEtkImRt6oIjL
	dmc0BJJS/91dQuZt37Ajoi90uN763bdw+n5snUqgkFAkyOPbmoLUBxSNzpwuDZUpbTFsMiXEfNuch
	rcqmDPLE/FsdaiEgLdAVrs6TQiT37FbwG2Y+O1DQ2d0t3gbFWJGSsfuKD4I6lpK1nMYUAzarC90d2
	UEWhdusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kxr-000000081sc-3UTq;
	Wed, 23 Sep 2026 11:16:39 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kxn-000000081r0-3Iiv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:16:38 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JJxQ300258;
	Wed, 23 Sep 2026 06:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=q3+t/w48FeID1
	4IonVY4jHyS2FaOBh7CvLudo/jgrwM=; b=Nn8azFexNnm0CjfnUlsLLJI+D1Z3d
	kUanvD1QJoX2fqQITgmIRVOC0PE5ZBaDyOHQ5ssgiZp0mk1TmT+GDZvBuNVFUiQS
	P97N01f0irwc3uUAOoI2JlpK1fDLYJ4nlg9U7Izy7xZ33SHMYZhL01LPGV+snSXj
	8CG2WjroLJeOU8LNu9BBJKmWetjEliF024T45x3pUoJ/29HdMi/+nQjEA+clap4C
	yz/7Wpf5MmNBnNrJqVaudqn6a3aS9f7Mkjhxjw3ghVuA4V6OIzBJ08u2/SnOpHUW
	hXt0RUNzNsMwngUPKmGtqPcczY3KM2LJS2XQkrF7pX4pJzwJHNjXrMePQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011003.outbound.protection.outlook.com [40.93.194.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tjuaw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:16:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWO6f7kyrRsbMe3rfVmiMm4fsoL4BEg94qvVQa9eytFfE82S//oLXwBZ7iJKlmTo0P8X1St2YrmDnRqeku5yPsFDpGlcJieaP2xKro4J3w8Z1UHFa3Q0cB1r0a3hqZ9zrtc/nEbbS8zl60w88/mN4KnfHb+xPZb2523NqkSHJ/aInbw+MqNMNY1vAnXK9OPHYi10lLOFXdLr2SbDslRlpR0b5iQSSqmutCIBprmj6A01TDozwj0m17qbtXHsg5GA04mDv6siX0kAVv33vPDUSpsEosbDUVCD04MXvmCOQe53EcXjwLZRPQO0XdXPSGOnLnpf5+bTRzms9ZSw1P/+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3+t/w48FeID14IonVY4jHyS2FaOBh7CvLudo/jgrwM=;
 b=HPKAgWvk1Hsc9duTfAk4sN/yGnFay3rk9rG2348xz8RS4FX6/VWXjgkAQ+lK2SkhgTUmg4QzQY76Rj2rhFMGBfhBSC1QALgonFbamqtaQwyMG1JH/axci6pNLXASbyldhfSrh5BKcBLJY4uJtQS8Uvsfa68PAgMYn6YQ5XYCTOYx1xfANnGgarKzAg6+4tDAzi9EsRePYEOREkfFR0tiIclGqQB1SVWDAA6a6+46lhzpK8f8e/itsG99piq5MuGAUSr2yxLzcBvJ2vY4N1tz9WERBHJi4/QpixCAVYwZvab5mfJj6fgMLWqJSmJZS3Z4ZGGdHcHNZQxy5OQ+prv9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3+t/w48FeID14IonVY4jHyS2FaOBh7CvLudo/jgrwM=;
 b=Jq0EGSa6HIRLg/XdCMcaW+WrY/T+Y5BSx+oo1IZt2twiKc9iZe01qhcAX2Ph+N0TodzIp6sf7tOg8+sUeN28NQHS4zFwUOZmkRU4tOMjJOf2adF5mEjaz2iPEd1POOsZPFleYHZlez1DBa9YVntnhanbm7TdgJXCX99rn/vA/9Q=
Received: from BN0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:e4::14)
 by LV8PR10MB7944.namprd10.prod.outlook.com (2603:10b6:408:208::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 11:16:28 +0000
Received: from LV8PEPF00000065.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::36) by BN0PR02CA0009.outlook.office365.com
 (2603:10b6:408:e4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 11:16:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF00000065.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 11:16:27 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 06:16:10 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 06:16:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 06:16:10 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NBG5mE2804750;
	Wed, 23 Sep 2026 06:16:05 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH RESEND v7 0/2] Enable audio support for J721S2 EVM
Date: Wed, 23 Sep 2026 16:46:02 +0530
Message-ID: <20260923111604.4040417-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000065:EE_|LV8PR10MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 428252a8-f39f-4855-5032-08df19641c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|7416014|376014|1800799024|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: JKw9xdlYSyQzxk65rJajIbhrwRI9cxqAhTk7BRT9Lr41yAGLqp0ADO5ov5SVyFzMRfR/efVUr+pld5ggFZN5Q23ON6P66RI93xK9GXkKjxhCH/rhmbZ5GhYG7b5Q0qezOBFVd52O9Mw2UyBimGRy3pNScyUiuT/RaLxquIwz5Cr19MYj/paaTu+WSvaHhOBh8GhbmPnYonDld5I+rsXcRUMFGFmMkbbhLk0yu5xQe9bjaYXjh0R6up4nsqtQj1pBogcnejy/uXE0/qlh3I28SSH7LF60ME22gk+UM+aorKNrgcDkyLRRp/SWt6KZTdB+ilPB1DV06kb1/dQPjA4FxpWzH3jcRxsOyduwOTPkluUBnJbkF7Tgvk5GgQMzw06UrGwXDyI93CBxgj5z5FBquiatie7UqoJL1Y2dPuIvxY+kO3UiloKHdZQ9/4YoQomexzlZwN5pPW5ALf4mBZjTXr6IHRD1XwvgtdnY5wq+nqVw6so7czOvSNEGdTtJyT7IHgWvGd7PDr9qMAxUdj72qiopsYRbYbElVB7vXtN+F9BzrGRK0SmpRSj+R8BafeD+UB8im3SE7sYV3nCszNk4nXvGmaQTULVZ/zaz7GlnogcJZJAJBvRGPyLVlVnqL9mZoWfPusbt1svjdXQLPD6Gwvf1ak7DUZwxdqRuzAFhJE0AuXbpGt+k2QRgmUREHhQuYjnn3ECeCe4SVH8QkkywBA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(376014)(1800799024)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zmUH699IdAm6GdXWJ09EL7srbK/jjCfboU48FqN13pVbqfqoAnMuTbQV2Gu8cO4B0Epi6dJGwUzWW/oCpUk5FVAt82N4LGdQ9zphM24n2eNDm6gqDsVnSBGmiygnyFQsyd/iFi4euhG1JpowikFbQX7TnzfZrGqx1lpXTEvUgLzsxJQwWeQ1Nnu+mDCucaykKGZI9cJ93AQRfYR/m8U/TPOeiNevWc20cbK44s70oJpRTD/POzRXkLUtCn+Vwrx+TrNTdJebVc0RnwPMMmOP/3BprfAnSQ+aZnjSnw3gPvFRGHzqVeZ6mRbpdMcaT2snID/4Bklx3FbNUn4IK/dMla1J+XQAu78Gkkqtz7HGjANsa6dDkaRf+TMSUtXrJErqoWa1fLo0ZTXUkJ64Ua3/Gtf3I2kx5x2CCFGuYdDshaJzunV/VVcRLbBddTJ0NHUX
X-Exchange-RoutingPolicyChecked: YRGu5CeajU7TJc0MvmglWQIc0QiGZNxULASZ28eBy095FWtpkVDhs3mfPfNgw7cDrOOJSOz+u9pWVx/eRPEnoCM659+tP5ezkrpMKyRbTi1OT4X++ST1RxhabwP1I8LYH0zkDMtqqAnwWvK/LPreyXqznlcTNNr2TzuJ9Htz7XUQeVsJvACzuWj1KLgTjPp+kNdYkIsDhSMJLpb77WATKiuLANwpwy90A+5vv1k9jVjb3V2i6y+Rz5ChBDLGXybjSMToJSQRKUnTHqOYETdsbqaDCIOAtjqTNSOH4C1W+CcMVtVD6c3CXrONku7d0YZlt+bRXIaCqVDsuYSiZMl1fA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:16:27.5323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 428252a8-f39f-4855-5032-08df19641c8f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000065.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7944
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXw12xwEEB1/DT
 mhFNLAuvC7E041eHQ+K8gwDhgMnH6AiZ1y4tmlSuBljRzY0N3DqZ6ii4a9lXjI3wRAlzqFTWgNc
 6WhY+RNx8W7G3KicV9seVC7BWyKpfLI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX7xkKZHieF8r1
 AYE0gWOe4cRtYLhwTs0I0Elhx04peDtEVFZGI68V2TzERZYlCvmM1ATiVJhaY7/HJqxeZQtK3PG
 zxXUPOrik715phWpMZQjepCM1CRaT18HRhGpHznM9LybkBKqm22C4yUSNrwCn9lIFhQmyWqtXPw
 WpMbdRVDwHLxLtPPiThYboth2d/TC0jQgLGU827n84BSbjzY6ac8EsZ99hQJkIfGvnJFoDBtceM
 vCBUHpGDdKrcHM3aItgV9ba7o9i/0PWx6cGUmM3mytIXf/9wE33xhHnYYO+MqDGzyI2z94+35HD
 VnydApOkFs7toGLG/dewhjVMaguw7hsr8LBR+oPc/02h0FtesCmNiduzyJOfDXOWZ2/H402q5eh
 UE92xnZcj5E6sJFWghCbtZloxmD3IZXpBic2G3H0IDShU6VPpw2987h0zXaNQ2f+BzT/A4/BTZq
 J3XF2l/EgRtEGujFCHQ==
X-Proofpoint-ORIG-GUID: nOEWFCSI7rUZf3COyZ0aSnEOnNqnUlqU
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab3b50f cx=c_pps
 a=z66bnWj0fqQOmAclyDzAfg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8 a=GATK1p0oMj2w1ad6480A:9
X-Proofpoint-GUID: nOEWFCSI7rUZf3COyZ0aSnEOnNqnUlqU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_041636_067693_6DDDBFFB 
X-CRM114-Status: GOOD (  13.18  )
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

Changelog:
Resending the patch after rebasing on current linux-next

Logs: https://gist.github.com/Jamm02/a783fb6f7cb15e56e51b21dc9a87053b

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


