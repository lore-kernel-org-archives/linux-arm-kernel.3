Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E2DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8kumTd1IwbJuzRbSONSEtcl6748wzKRCvzWyCssRzs=; b=bcxF5OYKRw8Ayux7QR6sZMD6Kp
	QHBHSagnPl2IskuNWN9MxVkD4xv8D6M8CLecZuEykr/bYkEnrDzyBapdEGizFulvfqxAWAecSQiOT
	Ti8ibHgYeOhWVttU3Q2DzDak4dwAjU9FPqcFqlkQINwq+ILSo/CiWB8H5D1rdOvGtJM96eIfJsNGQ
	mAKtyfooBmVJswk1p9zjSODz3drUla82pbi2Hova3DO7XdOJAP8fcz19WK8X/2px0TRj+ARVHbpXY
	BxG3WvJQWXNrn/2PpSjPnGu3fdGM9r3fWICKBbzpY5P2OtWT8R1NkMJkAWAA8q3feS2ZbkyTotYsk
	vq9bWs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEyL-000000092Ef-16R4;
	Mon, 13 Jul 2026 11:37:17 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEyG-000000092Ay-1FTv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:37:16 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DBAcDg3381672;
	Mon, 13 Jul 2026 06:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+8kumTd1IwbJuzRbSONSEtcl6748wzKRCvzWyCssR
	zs=; b=ilNJu4u7RVB50I2i97Dg7vK4lotCRePuiCsBTLDMZezXZdD1BcfLIJu3/
	E8xeHc0txDGatrl6gayDR7fmlJmAwVbPJ8Z9dcY3JnRfGWvC4F94WNpGnQNFMv2F
	i0i65WPXSrtRwVETKtSCSYQ4pWDkxxuKuRa0pkjiXkrfkOcMxDPV9Fvb5JcNlas4
	4eZGcJzyc78Ur6E1ikGd9HXOTQIXVFnXCBy0NPQ550VFkCc/A+k2GcoLdqddlN0D
	DQMprbCDUSo/v9UVqwxNMCT5OwFPzSgHC6boYlWXGrmvruiZ32reOZm5HGBnd/jC
	jhEHn5QplfBuTtvjPv7zEb0UPqVtw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcxwtg3jh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:37:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmBjwvZX9RFl1gbLhgBKtMJeV+MRGP8Q264xDKYnQbVgMVkpWAz+FJXuSRdBQS1PTEMW2Omk8GlNrmEEJK/u0FNlNmc+weCiWkhYEkkiYz3j29JeXP+s5JuvGss0b47X3G+37H8jcGPjeBFtF+XIuhToEK2VXvw9eLvOTOmxo/YUpYtv+yQ9LyNnWqFcninVMZoSKL2AxMp+9losYfa8ZGp4H9f1IOAInlKlgcMhWKsaF7t6THkM7mv4SsFwKLYAmWbYFmXGcct15ZKTLHYtE4CbpkN/gfqa8pemPZkxewDishfiihurWxoDgGIVHnHGftFbslTHvin4TKj02D798Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8kumTd1IwbJuzRbSONSEtcl6748wzKRCvzWyCssRzs=;
 b=KAZ2cNx1Da3VfzrSNdrYykYMpais0USiW0ymI3iUSDJAFCf5N2MkRIm59m2Bt4FcIpUNpoXSwlNemp/HKB8ZJqZuRWEcb7ATfci7E9G99WV2SBxjS4TJMiEvkZ4wACgtIAnWemMPqlWmP3nmb9ZZ9dJDIhC1jiCyfJEYgbtklgjQPhBnkp1X0L8SbFIc1mxDlJgXiwj5P9YRIlpTlRBR0kS79JZ1Wb5bk8m6T3pZV1ktmpiMoaOB90hXbwAkX+S9Rr9lElVBWcgxx/SwrVvG/ZKMvndRsiM6ATkBGwwk5nRcm8s/SGxTzA0TYW7SVBXcdSyxh2QoJNBvqjy527MEAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8kumTd1IwbJuzRbSONSEtcl6748wzKRCvzWyCssRzs=;
 b=Uxq7h9UW/6Yg885E0bKD0NAYbdkh16QPvG1s130hQnVnpLI/6kr8d+Hr/7PIzsKcdOMAXyU9c+4ob93P+uDDywhH80TgK/0D8gN9Xih0vFV52aQ7O5wIWUoBwy8nUekCwxlTPla/L6IRwKzyVxtSGhxZsEqbYS+dDmAGgYwnN5w=
Received: from BN9PR03CA0536.namprd03.prod.outlook.com (2603:10b6:408:131::31)
 by DM3PPFE9EDA11A0.namprd10.prod.outlook.com (2603:10b6:f:fc00::c52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:36:58 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::77) by BN9PR03CA0536.outlook.office365.com
 (2603:10b6:408:131::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.20 via Frontend Transport; Mon,
 13 Jul 2026 11:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:36:56 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:56 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:36:55 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQP1471098;
	Mon, 13 Jul 2026 06:36:48 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v2 17/18] arm64: dts: ti: k3-v3link: Add overlay for IMX219+UB953 serializer
Date: Mon, 13 Jul 2026 17:04:22 +0530
Message-ID: <20260713113423.2310443-18-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DM3PPFE9EDA11A0:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbea97e-ea42-4ac8-6d7c-08dee0d30b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|7416014|376014|56012099006|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 3IDKFll/3vhLh/oimQeKSwkjbEGEPPsBt+hlCWmId2zDEwabZixmgzUIEQDZ2TKeNmsZQpmglTxZCgEA6V7dM5NiOzSGNau2CZFQpztAhBRN4QxptK62yzPkudxtWrRfos2ss33wzsV8MI8rOmFyP6f1lUvafIiHDRDe6vFhO99j5RSz4hFa4C+Z2ucunafwYpvBhaEi47zT6xcODBlsBu/rgYa3vcBashRQ8m3KXpCpQa5i8IGBsGL9jcUSKXBzrTUZByvtr1gijf9bpFYlN5KxM7KvWRh/dV6NdB8dqmNcq8ZFgRrUu5LoBqyPLAGG4kJ5NMc4V4Ud6ts3aYnX702PBg5Ysl7j9+d97KpCvbGQd9lHApf2jWgr9Tw83P1pmFtvrASXWV2nwNEFv+D3QGMPJ/FdfKI0+R5ZoRpeQlk0G3C39GvS/u1OBPOAT44racWDlNKmMkWpRpIPuVZkUr1obidbeDR+8xy3yFQ9Ih6PJ7NzXwToqlAlwE5KO9YnOuFrFXTgjHLGEzGYauDQTEIEPARLIFEsiKXr4KsOCBDubsx4mIPBXVdU8CJINfMbw0tzUoboiZL1Ezct+m0oR/La+lfoqEm8wMouSDMYMlcyHVnBVQ+bzAnvtzPHflDXyK520fNTnIIpG/g9UWCv1Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(7416014)(376014)(56012099006)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xnY236MDRbMW1yk7G/UL0cHyHJFYOCLoq1tEYeFBlnKUv/hdzM9nn1gAkseZXbxCOXhMZa1CppVRfZqdf5emVpGekTeV2UwgCPap22EMlFtzYbH4b/haXO3Hnpv0DwRY19akX3RK701GvTD2Fm/yZhCd2pBnXOu+d5Xa2TLeKuetWfaDBj0gvHzenVq7VIRDDyyteHOfD5LzPHq32Z1hAq9e4xxllVyMMDdre3BkbBuNKl6nwGiEG4+ZGO046k2y6wTNJ6GnyCWteoUNzFZqMnCIaT5TZopiFagZ+95/6aKIkhoXpvMWEY0z8D6JPS6WPggcktIyU8x9cTPWuel9Ux3dYyle1rd4uyEaStRh/MEyUqnDAXX1npZKOTqUz/xTZi2MPK2+YfslZ0MsgfpkIbnpgaTOqOWxf5emnKmhjp0gR33cPmPmdpZksf9Ms8bR
X-Exchange-RoutingPolicyChecked: HpnH+wKjWhfLvyuaYuJOzzjpA8EvJOANkGHRK9248tpXiAVZybxk7eZe9pAr/trWtX81bSLGh9ZukjOht/HdfC/CqIZ2e0isl25xJH8bgeYbgzFzaEl5RETYbGad6Pa+cWF0WQFTnOEzOX/2vBiPBT2EHKccHumcSyC8gUmbfMYOzVPv7lTH5jFTPF5N9a8oDO5GhOazDmXB6ijnG76duqX+nwZTIAKxLnft+9fTjyJ6Zw/cW1wxHXwc/IkYUDuz2LEOa6VKW8iG9Amla5aPSCrAFg8YsPp+siMTXhg46eo5R+Oyh2Lj2UVQC8L91OSaxU5brZYzR3+SVPqQOOOn5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:36:56.4244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbea97e-ea42-4ac8-6d7c-08dee0d30b4c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9EDA11A0
X-Proofpoint-ORIG-GUID: wR-ciTm4ZvzSYeXF2l9KD7FRpgv0eqN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX09FauQHcEyyE
 63Nw44Q+KfV5WK5GQArLlcs0QYbn90kqDyOgcgLWdVa69FjsBr5u87WBRUk1U7hmg3odbgbRyeD
 QlENHL33uprx/YZYZgJSpJedV6Bmi6jo1I6o/uOVFBKafl4LHAFxSoGAGAyEtOj68zNHabVMHlP
 FqNyRwQG81oU2SCjh7r9kDLEO65gXGVxFGJQIIopGf9NSCW2VX/mQdDxyzeR/WUEkSNiGzzPOwQ
 Jj8hAxBEoTWqmKWVVQmwlUenSzEsPPGkfP9T7OxxAc26+k+Z+eLXX/hnnalS92pM3FM+uhR+Eib
 v3rDQT3iWNc+Oaw+nW7vuhcKiq0UoGMJku9cnD73Jzq+rdyDmSL14/B+TImT1iXFjR8ufhYsDzH
 eXHQDKxBWUcz8Icw0R/pMlOcweGQ0Ym/1/XQZNu0xST0b6ibRfGSFL/alABr3rkTF8QlFL/tI8D
 k3n52YiPwHEIzETbJQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfXyr9YGpOUmIa8
 H4+4XSNrH9gx7rT7piztlEfa9cSJMBaSoe/76m4Sv4Z4mfCfsUXLFR6xOpSC0NA4kAIr5Vdb3ii
 59vC2PsOovC8O31lxuO2hCzuaM+7570=
X-Proofpoint-GUID: wR-ciTm4ZvzSYeXF2l9KD7FRpgv0eqN9
X-Authority-Analysis: v=2.4 cv=UZBhjqSN c=1 sm=1 tr=0 ts=6a54cde0 cx=c_pps
 a=kL55mFjriFqHcOBXBnqb6g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8 a=TcITTbBOC-96FCGa69UA:9
 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_043712_467263_9E2D4F21 
X-CRM114-Status: GOOD (  12.39  )
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

From: Jianzhong Xu <xuj@ti.com>

Arducam V3Link camera solution is shipped with an UB953 serializer
and an IMX219 sensor[1]. Add an overlay for interfacing the UB953
serilaizer and IMX219 sensor with the RX0 port on the UB960 deserializer.

This overlay can be used to interface an IMX219 sensor on any platform
that supports the V3Link fusion board.

[1]: https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solution-on-TI-Platform/Introduction/

Signed-off-by: Jianzhong Xu <xuj@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Don't replacing generic V3Link fusion board DTB targets instead append new build
  targets for v3link + IMX219 (sashiko)
- Add status = "okay" property in port 0 of deserializer ports (sashiko)
- Add port-specific suffixes to avoid naming collisions (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |  19 +++
 .../boot/dts/ti/k3-v3link-imx219-0-0.dtso     | 128 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index c47c96ab5735..819e8a8c5c84 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -213,6 +213,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
 
+# IMX219 FPDLink Sensors
+dtb-$(CONFIG_ARCH_K3) += k3-v3link-imx219-0-0.dtbo
+
 # Build time test only, enabled by CONFIG_OF_ALL_DTBS
 k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-ov5640.dtbo
@@ -320,6 +323,9 @@ k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am68-sk-v3link-fusion-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-v3link-fusion.dtbo
+k3-am68-sk-v3link-fusion-imx219-dtbs := k3-am68-sk-base-board.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-fpdlink-fusion-dtbs := k3-am69-sk.dtb \
@@ -328,6 +334,9 @@ k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
 k3-am69-sk-v3link-fusion-dtbs := k3-am69-sk.dtb \
 	k3-am68-sk-v3link-fusion.dtbo
+k3-am69-sk-v3link-fusion-imx219-dtbs := k3-am69-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
@@ -346,6 +355,9 @@ k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-j721e-sk-v3link-fusion-dtbs := k3-j721e-sk.dtb \
 	k3-am68-sk-v3link-fusion.dtbo
+k3-j721e-sk-v3link-fusion-imx219-dtbs := k3-j721e-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -364,6 +376,9 @@ k3-j722s-evm-fpdlink-iv-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-iv-fusion.dtbo
 k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-v3link-fusion.dtbo
+k3-j722s-evm-v3link-fusion-imx219-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j742s2-evm-ub954-dtbs := k3-j742s2-evm.dtb \
@@ -437,10 +452,12 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am68-sk-fpdlink-fusion.dtb \
 	k3-am68-sk-v3link-fusion.dtb \
+	k3-am68-sk-v3link-fusion-imx219.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-am69-sk-v3link-fusion.dtb \
+	k3-am69-sk-v3link-fusion-imx219.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
@@ -450,6 +467,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
 	k3-j721e-sk-v3link-fusion.dtb \
+	k3-j721e-sk-v3link-fusion-imx219.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-ub954.dtb \
@@ -459,6 +477,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
 	k3-j722s-evm-fpdlink-iv-fusion.dtb \
 	k3-j722s-evm-v3link-fusion.dtb \
+	k3-j722s-evm-v3link-fusion-imx219.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-ub954.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso b/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
new file mode 100644
index 000000000000..c813cec6678f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMX219 Camera Module for V3-Link d-ch Adapter Board
+ * https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solution-on-TI-Platform/Introduction/
+ *
+ * Copyright (c) 2024 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_imx219_fixed_00: imx219-xclk-00 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_2p8v_00: regulator-2p8v_00 {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	reg_1p8v_00: regulator-1p8v_00 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_1p2v_00: regulator-1p2v_00 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+};
+
+&deserializer_0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* FPDLink RX 0 */
+	port@0 {
+		reg = <0>;
+		status = "okay";
+
+		ub960_fpd3_1_in: endpoint {
+			remote-endpoint = <&ub953_1_out>;
+		};
+	};
+};
+
+&deserializer_0_links {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	link@0 {
+		reg = <0>;
+		i2c-alias = <0x44>;
+
+		ti,rx-mode = <3>;
+
+		serializer: serializer {
+			compatible = "ti,ds90ub953-q1";
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			#clock-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ub953_1_in: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2>;
+						remote-endpoint = <&sensor_1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ub953_1_out: endpoint {
+						remote-endpoint = <&ub960_fpd3_1_in>;
+					};
+				};
+			};
+
+			i2c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sensor@10 {
+					compatible = "sony,imx219";
+					reg = <0x10>;
+
+					clocks = <&clk_imx219_fixed_00>;
+
+					VANA-supply = <&reg_2p8v_00>;
+					VDIG-supply = <&reg_1p8v_00>;
+					VDDL-supply = <&reg_1p2v_00>;
+
+					reset-gpios = <&serializer 1 GPIO_ACTIVE_HIGH>;
+
+					port {
+						sensor_1_out: endpoint {
+							remote-endpoint = <&ub953_1_in>;
+							link-frequencies = /bits/ 64 <456000000>;
+							clock-lanes = <0>;
+							data-lanes = <1 2>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.34.1


