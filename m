Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD681C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w2OsffPaljUnfIc1R39qtDTAEk/xnYvtAcFLQWkHKg4=; b=sjvSZdcrGE12n0EL8ihGGFrqYJ
	mp3yER+eHCdP56UqQ/v9GthTqFNYoGYm7a0adV6y2lgQhEJGgR5NXVVkVwoB9eLKEUcY6Dix4NFHB
	KPa+pftbRz0EF4hv441o6d8LK6TNQvNESPvaTJFacs2ZgV/zzEaWjj8bAqORl4VdAkZ5EWuH2v65O
	kV6umA99JBc/BHcohUufqw/pmvN5YM8/7q5lrdMumAQpjpboeA81s1cXtbnqxN6szpjL2/DwVxd1H
	h1b8yb5oC6gA0ln9MeOXPN0OOPCcbsse2Ni/hBdR7gJ6lzplMtSuLGqE5sCIrenW8kBKr1dncDNgB
	mTi0TXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea63-0000000HLJs-0P5u;
	Tue, 30 Jun 2026 15:09:59 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea5z-0000000HLJN-1zUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:09:57 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UEdQdV804568;
	Tue, 30 Jun 2026 10:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=w2OsffPaljUnf
	Ic1R39qtDTAEk/xnYvtAcFLQWkHKg4=; b=nF1noUCoy2yK9gh+qiXkbqgorGS1L
	4HOVlJcsibla897ew1xZYd6p9zr+EDr4nhgMuJF9MdqzOaX8Mse65D9v65K2Fzqa
	Y8hDftGxzo142D1BCwbtvGZ+9uy5zE0C/uEzIcg8OoQu3p0z9ikqryqC8mC57QAE
	3CZZE9N62+eP3BxfEij1QrSbXCe7v4XbwzPcjztmHWB5k/Pkn8yhEzr89dJqhrwB
	nrj4fXyMkJy3h+IsqHK/2+bHY9xXIz1RTzhbQIRaHo4oEC7a9FsfQJCszBIEzjVt
	7SA5aMapubgfBleRsIuf8nVvYD/0kBb+H6U2AZavkMLsdG3gTVKqn7fYA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013043.outbound.protection.outlook.com [40.107.201.43])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqj9bq6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 10:09:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwYNDbpfkI1XiGhUVkaY//o/Vj6OtKkLi1gG1qK+MjmuMwzqO+gAtnKvzQyoLSDgAlTjiffIfZxi+V366a5ggrtsclNipAfimQofNt8Lxv/NlYF3G2kILOWIFAiBD7Na/y29zBafMH1MxDgjI+GlMDE2frgkZYRJhUrPdCdU/btlIEmbtTdtO9/CcQo9XoEQ3DlF0VeXxar1GrXJijDlhd76Jc9aWiP07OQe/curMKB2t4hUVPeS0gOQJVCO3zFry0YEsx9Ud5sZ1I1XWIDi1yYiYDxOSMA5mzsSTPO1Ep9NI1wOkFuYfOeQIssY5rxMcmFPj5tjDxh86wH2100/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2OsffPaljUnfIc1R39qtDTAEk/xnYvtAcFLQWkHKg4=;
 b=rqhon5GksvLaNRi7Cf5WgSaUaPIxh50MMkjTdt0XKmGH2rydo84BV+9NbaG2jnY+/pg9R9/+n96z4CsT2pYb0CcHUOy31aoP72/3za++9Kyi98KWAKjFR/T1NYZymGaVOmRBXSsaxtMLB4p6SiNYDtDIaEIjzE2ss2XAWXfu0UhvTdHOaEiCKqd68TI8xXkUmYN23jno6j5ztM+Gdb4uXUGAflFLpseueacABTXfGDurUFCJStZZCq/bX5kOy9KdE8djwkTmCYxEqjtQ5/Vxl5p70XWv08CAbC+6tWV/iKkHPlaNUv6lm/eS2/yJp+E7IgWynXRc3zbyfbRZ6Ljnqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2OsffPaljUnfIc1R39qtDTAEk/xnYvtAcFLQWkHKg4=;
 b=uzFazhnOgVBJBshg3+JxmqUE8Y4EjeUAJ+kfuymh3QAUwgPdnUl2TYrAcc4fbMHZyf5LAs/nSzxp39hyiwfuvQ4IByyRj86CGk+XtNHpW5uJqipPMpMKrx5J2d4U7G/XKxKLTRAEZP/XYEyMDw0YOZAhhqWG9JUzUXMybrozhRg=
Received: from MW4PR04CA0325.namprd04.prod.outlook.com (2603:10b6:303:82::30)
 by PH0PR10MB6983.namprd10.prod.outlook.com (2603:10b6:510:286::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 15:09:47 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::1c) by MW4PR04CA0325.outlook.office365.com
 (2603:10b6:303:82::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 15:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 15:09:47 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 10:09:46 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 10:09:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 10:09:46 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UF9ju93334084;
	Tue, 30 Jun 2026 10:09:45 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <praneeth@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <v-singh1@ti.com>, <bb@ti.com>,
        <u-kumar1@ti.com>, <anshuld@ti.com>
Subject: [PATCH] arm64: dts: ti: Rename DM firmware reserved memory nodes
Date: Tue, 30 Jun 2026 20:39:19 +0530
Message-ID: <20260630150919.457160-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|PH0PR10MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: c14159b7-7814-459a-b0a4-08ded6b99fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: /Q6kijAyLjmbGaK/wAJQI0ocXyT3ZZKcWr5/6zSNVAJTK34lMuEnkhyjWAOwdZaDPAKqU4jF2S0ic0IkQNeQ9uwyyKx8EfgmPglsIlVGfBePGTngI6Y0EFYIcvyfqd1VGZDz+huOzKyOlArQ+B8QAqPNrSx0d+wdmZphw8+DqDdNJtNDMifeyZTT9vGGvk19JPdrs+upuEgMC3E6dQyG107yQWuHKTLga+TFpAV1+TdNWrVKLs/SP01/nQQ1CKL8AUjOPPtnGUDWzBt20c5+SLwBT4wFzJJhBmCDkPr009+3tE8KDijSx2EgAg+D1Fbbe29QIewH+7daiJetA85mRMrCuLBcUd6FGwWSLYA5dJMirORlrDurAeaqqZhEJK+HYIDisNdcoKceHb6gPAUg2VLFaJGS7qE9nkyQMmLmmwwkDTlrVtCNWEvZStBK9b20SpCpzmXhJ1Skbf/YzrLehaf8c7VsPZI0rg9S2OL9HFLmqyTJ10aIGpEnMKZyQDaS/LGmsveuqL35XC0iucvg29ynYSBKVQpUoglYyLyIVDVeay9tkVSrMo6cJsbXXhBW2JbuH8lPcXL/CSOVf+Q+HFlcjaaIBMuCf5xTaz7jWcPJh05wdK0iI1YGsQWnG1lw1ucF9AObKBRX96i3P/ORODU5t6l/lmkOXiB/iEsp63gtUvds7D2YLBYu0WzcdT5CaXrOgBB3CjKlNkPrwueGgw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pXn4ozeM+E6ymD+4zeif5pr2/XyGZMxtncd0VD6qrJ/EzkAAJuh3996lM5NAV/P7VQ40BKMPAu98gXdcvQXbvXGnWzQ1/zdjGfzGI3pTzKNcM5/ejamxs/1Td52oFHNbHnGe0oZKjOFqaj8Aq2E88BeFIKOPBUla7y/vu0KWayVOabMMCqKf5wgKZ7oGKbwwSpRkdUO6EZ4fjKFT7NkKy1qXxFnkCSyB3Vxg44U1UK3C8XknJdJqWfzN9tKFEkc/14XsDmODmMsNJBuqFi/zEBQsjgRftEDPNuIh70p7fXb9f0pAaDwvC3Z7GUiygzz6QCTofsg7p+RbNj5cesAQhKe6Zq9/PmNxy+ttXuSfBJeaDrqKlVu6qMePOdzkcetM0SoEh71ySaZ/OQ90zX6Caw+qJF5xr0XSZMXw+BoLcw4Qd8bCeiQVOrl+8mAmEg34
X-Exchange-RoutingPolicyChecked: q7IOhWcZSwdb148DkSwEFRuN9Ecz/qYl1po9A4O54WVo5KLQVkX1NLdgHNm01VjYLllBoowWSUKR+xLpYZAQZdpiw4z/AnxbM40QwvP2qExJ4uubMLEg4OUt1Oc49Pjk/6UJDY1y8JFoc4EeOZ/UnlNmOwEb7ca74zBnd3DFKGWwD8RTMOupVO8XazzScFke9Gc/9lqdgMXhWTb5X13j4OLBbq8InHncyZRtJQ1h92xnAzXqcKEeodab409DmAfnP2NOrNB1JYJzVWd2lGQtV2gSBtn0uEGLYDyzEEbzKGqBANSiVMgQKETNyiDhemlcFvw7qJ29GzRNCkxOWNI3pA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:09:47.1342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c14159b7-7814-459a-b0a4-08ded6b99fdf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6983
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MiBTYWx0ZWRfX/Qdt3EJEdNph
 jbf/nO5KT8lPh71gLTctHFvfOY9fa6arX5y5nMjG3ofs2wJNhthF+IrVS1nKdMUYBusF6ZOVKxl
 0J3d6KH7DDp/QVKeB/CNGFR7778cVXB/jcWWIYYpUH1ra5txWmMr9qxkMZawpD3Hyyc5YQQo3zN
 OETbTdhCUBfj0uEmZ/GKp7lnSjmUaOaLtwPdSmbXS4kq7IQ3Tt8tIVKZINzzAIzHmfnapygNXdq
 I6YSc2/2B6GSH3EVef9BGw9mAHvqLTM2V5/9X9QSG4PeARoP4ERQDemmXCXUUc82U+SrLPI4ccD
 NT027PIrJjdxy9kkx6RVIaywxmuemO/0fAEpIoox2jxAh5EgFQG/+L6b4A7FgcZ7FN9Zef0V/5p
 JyVDJU2FPJqOB6gw8VTmem7aUNBpribg/lIWcb17SBNePNSmJiCRoMEJ5GdlDVmW3Jg14nfFYqF
 +fb0vfSz7D6FxiKPhVg==
X-Proofpoint-GUID: BIZ9P9NesbUUzlyIXN80s5HrQ8OrdWiR
X-Proofpoint-ORIG-GUID: BIZ9P9NesbUUzlyIXN80s5HrQ8OrdWiR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MiBTYWx0ZWRfXwFJ+Ppsku2R0
 FCUE5l2p5/2UaNO9txYQBHNjTfS6qlnu+U65XExEFxgd9de2FeqgxOCBKctcSyd0w9xRhzPxubd
 AkL4pX6QK9bAur+DC5VJqvgAzEPoUjY=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a43dc40 cx=c_pps
 a=+LMkLzjU88PdHoliF3eHPQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=fv5Xb4zugy-HeHZQE2EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080955_520186_F7B592D4 
X-CRM114-Status: GOOD (  11.30  )
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

Rename DM reserved memory nodes for K3 devices.

Example:
memory@xxxxxxxx -> to dm@xxxxxxxx

This allows U-Boot to identify and resize these regions using
fdt_fixup_reserved_memory() as done for TFA and optee.

Also drop unnecessary bootph-pre-ram property from AM62D2.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi         | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts        | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi              | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi           | 2 +-
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi        | 2 +-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                 | 2 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts                | 3 +--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi             | 2 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                 | 2 +-
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi           | 2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi          | 2 +-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi      | 2 +-
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts          | 2 +-
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi         | 2 +-
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi              | 2 +-
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 2 +-
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi             | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts      | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                  | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi             | 2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 2 +-
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                 | 2 +-
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 2 +-
 24 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 3baa653257bb..40148a37e294 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -65,7 +65,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9db00000 {
+		wkup_r5fss0_core0_memory_region: dm@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
index 7a4cffc27bda..90380bd8bb77 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -72,7 +72,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9db00000 {
+		wkup_r5fss0_core0_memory_region: dm@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index e97b2b047d10..ef2afcc51578 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -212,7 +212,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9db00000 {
+		wkup_r5fss0_core0_memory_region: dm@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
index 72288678cd01..c71297a6a818 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
@@ -55,7 +55,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9db00000 {
+		wkup_r5fss0_core0_memory_region: dm@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564b..7af3c2ddeb22 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -65,7 +65,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: dm@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 821a9705bb7d..83743a79ee60 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,7 +59,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: dm@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5de..b06f0da35141 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -65,11 +65,10 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: dm@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0xf00000>;
 			no-map;
-			bootph-pre-ram;
 		};
 
 		secure_ddr: optee@9e800000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113..1688b003740f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -168,7 +168,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: dm@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0x01e00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d..a570d764ee3f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -55,7 +55,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: dm@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index fc5a3942cde0..48fa66ec08c1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -69,7 +69,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
+		wkup_r5fss0_core0_memory_region: dm@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0x01e00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index ab9e58c2d225..03787bd4b857 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -56,7 +56,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9db00000 {
+		wkup_r5fss0_core0_memory_region: dm@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index f3ee73e64d69..78b4e5d61dfc 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -53,7 +53,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa0100000 0 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..f0353cb2e508 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -56,7 +56,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@a0100000 {
+		wkup_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
index ab87767419fe..be581f03d1f8 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
@@ -55,7 +55,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 6a6dc816b658..d49ab30658aa 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -33,7 +33,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index 5119baf62a4c..78b0b3214665 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -110,7 +110,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index e56772a334c5..a7c362dff589 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -55,7 +55,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
index 5a8c2e707fde..cb41743d8f74 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
@@ -35,7 +35,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index 8040b6528c18..4a569b50f51a 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -57,7 +57,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 689ba2ff81f7..3a3eed8d9a9e 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -54,7 +54,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index c8073ee634b7..e6da4dbd91a6 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -35,7 +35,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index a19e535f4946..3efca08c3ae7 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -37,7 +37,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..faf1dfbb53e1 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -58,7 +58,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@a0100000 {
+		wkup_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index ff3a85cbc524..b2b04ef9bcaa 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -41,7 +41,7 @@ mcu_r5fss0_core0_dma_memory_region: memory@a0000000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_memory_region: memory@a0100000 {
+		mcu_r5fss0_core0_memory_region: dm@a0100000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
-- 
2.34.1


