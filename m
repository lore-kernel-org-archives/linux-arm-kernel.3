Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DAAFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCFH9PnZazECpFCVvXazDC+9KBNvn88CA1Q7HWvlU3U=; b=WW/LkLd+fJ0+U5CxibDjCwHRPy
	Cjz5KYDg3GGD7BPkJjW9en3xU+JOcM1PzZF+HhIh/JRe6F7CJPpVCmLOE6rPl8NAbvEp4eOYSi0Rd
	jCECSimFnuI6BrQxbdEP/sNRo26WjWArzmxLOkXMi/v8xt9gpvMa4jzRfbNbkG0Lb1wRok0dm5JWf
	OQcQAMCRhhdDp0cXa8H78JYfbZLn2PjOkjuNHAg7/zMWsas/6WfZzMNHpIkVIBhVj3a9UEot2La8F
	Zf3E9EEmwu957I9rvLHamupk8WIykJsn6mmHZyLGnWDvy27yDVVaVZCdUT7Qo3JudVw+jSmSYxvNB
	dVsazoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaw-0000000Fzxf-0KDt;
	Tue, 05 May 2026 11:05:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDau-0000000FzwN-0ecq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 11:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dCFH9PnZazECpFCVvXazDC+9KBNvn88CA1Q7HWvlU3U=; b=fhMeBkSgd8+nVNsz4Fb1qFnOaj
	WjO6OrpR74DpQ6IxwMDhRe7avH1IYz2Cgb8LQea3QbAZdzpl1r1Kapxj9zX9lSb/a2TxV7MERPBNN
	hDBp8FOtHRGv2geG0vnVnPp2QaZx/ARBceKrorJ0fwOTpnZgIPqhYboelC0eOao2BUxPgx9fyBr1g
	CqoHcTHSQa1CtmSRWjZ0WQB7jxH1M+Oc6X1jBHP/3z86yBGH+Z8jGT/lPBKRVPkwqnm3wC4G41cPu
	foLjBnW99OZHL1kfscsNtzvs1KgyziOEh2W/zrZNWXX2W+7+uVKM53vDisr05nsZrZJ5ajm/c457U
	5W2/+meQ==;
Received: from mail-northcentralusazon11013035.outbound.protection.outlook.com ([40.107.201.35] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDao-0000000DJ3J-3Wyf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIeKA9thrtv0gwCBnnVJ7CLBZA3+dCvJ3Qoa3zKIEEzRu+2tYEYGNfAKoROhOEQo4247ILWvSfMvfr9fz0yEkrOGbDBfUFTOQWHcTs3A4O7txEwQyXdS/cTT3WXHHAsbrAXXA3qTdamEJAETTaxj+ezjQjrzxTULOmQEePZluVBcppL0o96u15CKY6JeOA30ImWXsWjrGWK2JDc/ZqKjFcyG9YgHvzie9hK6zRJnnppdbmyB8RSJzwi4VorI2n39rwB0hOhIGI8+k2NUm1pMEChBIIEipbFmzJa/ip/G8T3QiADsu0+oRhM6ooJdgY9+KlDC97ltrNPKkX2A97BFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCFH9PnZazECpFCVvXazDC+9KBNvn88CA1Q7HWvlU3U=;
 b=NeWrFuxMiQRjB9zFTPb/texXdidVYFWjin316IIlSw5ayrIZDFgYpBiRwVbnZLHqMKJEa2DNBGb6KFlBJwuV3vlfKeF9fF9B8om45A23Dtjr1R1wpusKDdbgji3/4NCk6bGnBXeVUkc7LAcTlDJutuEszFsaRTtqxM+CIsEfyT9RqX8ozxL7///6bUh/TbFA/oZpUEpJbIC9GopaKIt/85wdnzFV4yADK7rVb1j57br5C7hc6E0z+6Oms/mU1CVwcV0E3aCM/Ap2/AlUxa9KPJsIttxnNgWw8aayIA1/BPBjYcGZF/nyQ/1Kc8FnM5f2osgSDN+hZbEOpEnKzzGMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCFH9PnZazECpFCVvXazDC+9KBNvn88CA1Q7HWvlU3U=;
 b=QLq8nRDGsDparMnRqepM9SNe7mldSXVKj2d+7EnioiIM5mJFUyl01QnFCm4RZeNOvC/ZMIMUJpFwV6IzHq73eJGLFxISZErh9wPtF+u1QA7iy1eQklEzvqy52nuhLIC0At2O707JqIHibT4LkuOnERe9so3jtWEvn9Kre3AZl0w=
Received: from CH2PR16CA0008.namprd16.prod.outlook.com (2603:10b6:610:50::18)
 by BL3PR10MB6019.namprd10.prod.outlook.com (2603:10b6:208:3b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 11:05:27 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::3f) by CH2PR16CA0008.outlook.office365.com
 (2603:10b6:610:50::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:05:25 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:25 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:05:24 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49h92831834;
	Tue, 5 May 2026 06:05:18 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 10/13] arm64: dts: ti: k3-j721e-common-proc-board: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:11 +0530
Message-ID: <20260505110631.1144200-11-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|BL3PR10MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2e0b81-4837-42a8-5917-08deaa9635aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|36860700016|376014|82310400026|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: eSuUoNOTF8GGzEx4DqSFGxN7AjejcvROmrl9injjywgUSA1J2gv1wDu2BpZShN/Jl3mW+fcSyM9FIJneiptg/1Xr9UeA8wRQ9HZcSzJ9sJd4Artg03oKInnRGXxIFB78t5l8HrKUFdLuwtp5aZPDyqHCbg4oG4nee/iRhEtqHNqmYDFEBP9RAWJ2no6drEm1GA36s6/dYYVBEJOhKcZsEWAT+H9QhvEfiaX163W3bj9bMJS59npxulX61pcMRVX0VrE32yfbSoy3/hxhJy1apO8eXBM5ZgJykE3rDVfrTtnMtnuOF32DHYDjMObWNNSQ0Zr5VZOW2yhw0a7bCHjvkriiV8tDLsQGjPKXGNtHCJ1PQTe2uNR5dPDD7vYG3X/7ib6mPq1+FRk+6Mmi/etprON0hq0O/Pg0BKWCP11xYiuKeLuhZr3LDE+OI0VAifgNhxPXRpc1KJUbo6Ym4UFxJsNtt7/U06Urm/JoDNV3/KaFDeElgmPAPY90em9mD/7KhzCiOWgYCQpLUk8/2+T0f6fueOWTxjOTrjKYXBfowF6sY9+qYYidpaXc4lw2H7piPU4gqXhJKdp6h0aNg2/6+1Vl6AgN3CKdRgTpuCyqUQEvMd9Cpt3GGrbNCQkoBYUf5583uQdqP+R/X5qfYImhsbXSCh29conj+zJdT6XwPG71wsvR2cgbAL2lbCKf8bvXt4hYySXba8lvYcpwy7H+257T9KDKhAO8kNN8NhYKIYm9rTYLKS2UeG0LIkIgWKuSxbJmCI/gfqZdrRh2+nRPGw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700016)(376014)(82310400026)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: edktPvRbHd05rRZnSwtkf8eOzPNg+hnQCH65qkyJ4UnD2VUxDXFh1ZQZaSGQ2oSrW4jnJ/wBzrVLXyzur+MqL9mqxqt2EgWpNIpjyuYPP79z9vzcCWs5/PeJohBqYWjV0uKRiD3ij4n1A9toV6OUOgSzbpBpJ6BOZCDvo4Du7BKHUnzgD/1Eec4AdkdtCBGDB4hKTNCtz4p8elttcDmXpiK96hwiy3zjSqA47K4+EBLxAY2vqdB2LV7t7Kw/imVM62+FFxZRW66/yfhT7BYGwwJWQ8vSawbGSLdjVyZ7QGNEAyyc29oWYd/FzTrb7M0XGHR0XgHRYbwhK8Whe+Q/4BIIQLEGnvrutjd0kqsmPFEKfzO/bfN6pCOe6wk2wu4HiNiVTxjo1R9VIKb2iPVZ2NhwJ1+OLzIbltG9oVxAdMBNHg0Q25HGU20MlFfXMVjg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:05:25.4373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2e0b81-4837-42a8-5917-08deaa9635aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_120536_920315_2E0F6B50 
X-CRM114-Status: UNSURE (   9.91  )
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

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: 02c35dca2b48 ("arm64: dts: ti: k3-j721e: Enable Super-Speed support for USB0")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 53e7fbcef52b..b25bce995b64 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -531,6 +531,11 @@ &serdes_ln_ctrl {
 &serdes_wiz3 {
 	typec-dir-gpios = <&main_gpio1 3 GPIO_ACTIVE_HIGH>;
 	typec-dir-debounce-ms = <700>;	/* TUSB321, tCCB_DEFAULT 133 ms */
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes3 {
@@ -539,6 +544,7 @@ serdes3_usb_link: phy@0 {
 		cdns,num-lanes = <2>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
 		bootph-all;
 	};
-- 
2.51.1


