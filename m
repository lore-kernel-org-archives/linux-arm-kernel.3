Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0A3606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 01:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rcaf3wHO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JKYAHhfjxGckxL7UHYPDY/vtyGWsJ3QT6h7YspsKdeQ=; b=Rcaf3wHOfBNdzfBfUZnLiKok7l
	c9tUDm27EWzpgQmoxhXtTN6bPFEhrXgcpbci6PJ+mDyrsa/xj6nhsxJM/DMYkjAcId91miJkUC+Da
	yx//Bv0qxk0rPOeD6Cr7VeJcRPMIP0FR17u9J52dVG3fa2IIBI6pvrn+XaZEPhEmSrEc88+KzV0Ew
	y2txi8+W5rjAGHvylT7BHQ48NrWQjBCbXYdTugwfUTpsm/sRPzlEGRHmlu4hEO18ydiJx4ZyeETgc
	RhBcNxv2Qet4jhWxAmBvQdVHDjRqyHQvPLm20n3GNFFDhymeY/oUWhQoBX2Cf3qWFkhBeHwJ39GYr
	4YlmTiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3oC-00000000pQv-0Avs;
	Tue, 03 Nov 2026 01:59:32 +0000
Received: from mail-japaneastazon11023072.outbound.protection.outlook.com ([52.101.127.72] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3o7-00000000pQO-1gAP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 01:59:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt53Qy/ig1+S6Ben0frJfL8Uw2p8YA+RI5zroiPCbWw4efl3SYrSdRORgzockQM18/7Xn//B2IDyMUIrIilTCKAoBBCq5NJjuHroKgamD5TGCD0tp0tmExJmzmhZZfJILcGyFPzzlU8SY1tVqddKwyQHbsW20+FR2xQV+BKPNIZilyHXM8A3EWuaea3eMNY9tUJsMFbSjIfrvmRCHEMDaK5VQa5Np9cxbp1ec5ER3eFEmW2yf+vneJBb4x4TSLcPwmiHrQytbrkWo6OJpUhFCv9zYQ3Uws/7eb/w4xaM3C12boHKIr/XWsrYZ6YZX9eKrHGtCQZ2yYxHnNibpjLlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKYAHhfjxGckxL7UHYPDY/vtyGWsJ3QT6h7YspsKdeQ=;
 b=ppX1GB0nSbhv/zAlT1BhOC+7WJe/1xhxIrKiww2Y136sTvx8woW6HCTvoARJ54nweAhFQb+Au4Dudpf08jza8KBv01oFdJ/gphlHz+1U4VN2HXQnGaJnEBHAyskbAl2NkkMWBSGPieQiKuZZsBIyZx9+qxgAjKzW/7WOBSg0V5DF0tNWXviZ5nXCF6N0KNmKE/2eIQiAwDYoWFE3RBUJiGKXzLjL26//2KGGsODmht5A98BlpfQcIaYqgQS+YYLFSyWCpOkyu5vlx6uYlMYW0QGU0rJIOtvz1WIjD+jZdZilam7k5HmJQ0KI6GVUVk3hKUNGxqqc8E79LDIYGoYRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0006.apcprd02.prod.outlook.com (2603:1096:4:1f7::11)
 by KL1PR06MB6134.apcprd06.prod.outlook.com (2603:1096:820:d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 01:59:21 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::4f) by SI1PR02CA0006.outlook.office365.com
 (2603:1096:4:1f7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Tue, 3
 Nov 2026 01:59:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 01:59:21 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A8F7F4102B67;
	Tue,  3 Nov 2026 09:59:20 +0800 (CST)
Date: Tue, 3 Nov 2026 09:59:19 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Jianfeng Liu <Jianfeng.Liu@cixtech.com>
Cc: <cix-kernel-upstream@cixtech.com>,
	"Fugang.duan" <fugang.duan@cixtech.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Zhang <hans.zhang@cixtech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Peter Chen <peter.chen@cixtech.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: cix: sky1: fix RCSU strap/status reg of
 pcie_x2_rc node
Message-ID: <auk_957djGhKflZE@gary-System-Product-Name>
References: <20260922033448.1094694-1-Jianfeng.Liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922033448.1094694-1-Jianfeng.Liu@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|KL1PR06MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a763b3-991d-485a-49f2-08df394e1400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|10067099003|18002099003|261102123227099003|22082099003|56012099006|261022105027099003|261026121527099003|261022075727099003|261026140227099003|261009223027099003|261028144727099003|260925022911599003|260925021911599003|260925021311599003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: QRLFgousKVarndVfRwnjEFEw8WbTJ/Teky15vm2hZqANM3KQBFA+pyiOmibY++ecHvoG91HgZa5le/vDdXhu/i+VnumRyO/Cs7pHatvaHHJde4DMx2C5RhbNiQw+JmsmUhxaFrLs/EFCIRpO1B/q0DMK9aPArz24e+8kffm5M3614lBHQbzJBc//2hDuaKx56yZCkWpLcHrvXAPuUb5dwKk+BVOqOlXxeTjEs6z2WrAUFWCg74ShjCJjecbjGSTV5MlCGi77wtMDoWmjr6/U8ngqRthF3QdfbtMmUluE3bbbKGIi2xKAWRG4PBQkAt+34/eEdBjYduOCoLASWgfjPA8R8QzczEGhiGLppG3uNHqr+2XlQav0FeaMP1NKtO+lLNpZ3CgdG8WC3IMMVQ6CE+s1ft83oDt3CHfNGwJMMZyUr9wb0MO34PsSZ/cCXcoPW0cRzHx35XXmU/ukHi5/HEMOeCf/KmCnLA4RvuMJWmgYambd2o4w7SgY1K7UAG2CvvfgcvUcelEDiZRmP2/xeKCE+/9HVDOskLj2VOblPGMdZrZsYJPeLnL56TY9eeqiPKOCUYIuSosxszEQ22Ko7iNd6kUyEyxa0MjyWERe+k1eJrrandMZ8JLf22weO1fefBWwVnUnx65j6F+KTitCSPc5r8UmiYiO7BCwNsCB16rOfEV4l7ZqSzTaCHLzCy5otTjd5ASOIWrtbiohXmmybw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(261009223027099003)(261028144727099003)(260925022911599003)(260925021911599003)(260925021311599003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Uo2MNRxpWO32R06M9Ubh84emt7UD2KrFjKHYvS0yYSYBpaWQr1UtLVrnOGOB9dA9vMNhLynOROqgwuxx0T+LSNYNVtdf5N36Ceju/tBw403ibnlHHhPA274kXJErVCGsrmqA5cKF7+TN5sO34v57KzCYUu1ZL/utMPEbIQy/IDTYH9Z4XXzAJPDRh6b+h1fcgu6DC0XSy7UPbAwaZimS2jv5aIegSIeSTKLBRC/rupS8e2hXAsi+haNWLepNSrpAx4AW1BaPYKoKSz033gPRWXu/y3dnjV5g5EM2vSGDfGJgKtKlRCNjZ4/KURr/2g402DL8yp8CI0hwsYwsQaHyoij7fFKO45IUSVCiNXQa+W+EySfqH6R1zk2RWpPVc1VV+foAj95S7KTWjATOkRawmwEE91GAcyisugtwFgcNkBQKKoMalP9IWyPZyvTna8d2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 01:59:21.3702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a763b3-991d-485a-49f2-08df394e1400
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_175928_279071_9B4FB698 
X-CRM114-Status: GOOD (  17.18  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied, thanks!

On 2026-09-22 11:34, Jianfeng Liu wrote:

> [Some people who received this message don't often get email from jianfeng.liu@cixtech.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The "rcsu_strap" and "rcsu_status" reg entries of the pcie_x2_rc node
> contain a spurious "0", yielding 9-digit addresses 0x0a0600340 and
> 0x0a0600440 instead of 0x0a060340 and 0x0a060440.
> 
> The other Sky1 PCIe controllers use a 0x20 stride within the 0x0a060000
> RCSU block:
> 
>         pcie_x8_rc:   0x0a060300 / 0x0a060400
>         pcie_x2_rc:   0x0a060340 / 0x0a060440  (fixed)
>         pcie_x1_0_rc: 0x0a060360 / 0x0a060460
>         pcie_x1_1_rc: 0x0a060380 / 0x0a060480
> 
> With the typo the driver reads the strap/status registers 0x1000 bytes
> off, landing in the neighbouring controller's RCSU bank. Fix the
> addresses so the correct registers are accessed.
> 
> Fixes: 0b014cd8f15e ("arm64: dts: cix: Add PCIe Root Complex on sky1")
> Signed-off-by: Jianfeng Liu <Jianfeng.Liu@cixtech.com>
> Reviewed-by: Fugang.duan <fugang.duan@cixtech.com>
> ---
> 
>  arch/arm64/boot/dts/cix/sky1.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 0a820f45feb9..d64cd935970e 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -661,8 +661,8 @@ pcie_x2_rc: pcie@a0c0000 {
>                         compatible = "cix,sky1-pcie-host";
>                         reg = <0x00 0x0a0c0000 0x00 0x10000>,
>                               <0x00 0x26000000 0x00 0x3000000>,
> -                             <0x00 0x0a0600340 0x00 0x20>,
> -                             <0x00 0x0a0600440 0x00 0x20>,
> +                             <0x00 0x0a060340 0x00 0x20>,
> +                             <0x00 0x0a060440 0x00 0x20>,
>                               <0x00 0x40000000 0x00 0x00100000>;
>                         reg-names = "reg", "cfg", "rcsu_strap", "rcsu_status", "msg";
>                         ranges = <0x01000000 0x0 0x40100000 0x0 0x40100000 0x0 0x00100000>,
> ---
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
> branch: fix-mainline-pcie-x2
> 
> --
> 2.55.0
> 

