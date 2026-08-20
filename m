Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0E8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ReS5g2w/NXZBhBZLCmI+s4jo1wmJ6A6QCnT16+JBiaI=; b=VmqoyfEFPpVhsf
	EhqMIO8IxZ9zNLf2TiPHO/+/vL7MFfBJePGlJpxfHc3mWJx0uDYjONKeGUWyEB2Shj4k7GEjZumig
	aoyf/XQ0QXbEp6JWGsaolLS1dy27AZh/OTtKDGAplsekORtaF1NWQ7hFjgq+axZWlAjbY6BmRFUpQ
	aDLlaKPX6LZjN8vOcNX3uiLolGEDXf96b3LObiMh/mhcQIjCANc2tdDxqFLfNR94ApFcMsoNBjRN2
	/2Wq1ZshTE3zoZRwMD/52oH5KtJXX/Xrb/DWIUoAkQUOmxuoAsZtMz1HssRpTBH/r29K1l5qzQ0kh
	hsTH+vvmUt2R5mBqtyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAwn-0000000CGgD-02kQ;
	Thu, 20 Aug 2026 22:09:17 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAwj-0000000CGex-25CV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 22:09:14 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67KK6r6J1741074;
	Thu, 20 Aug 2026 17:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ReS5g2w/NXZBh
	BZLCmI+s4jo1wmJ6A6QCnT16+JBiaI=; b=qhogHT8dxvmbqx+CIySd49uIxU5jo
	XczwDPgIQnaLOAwlWf1ucVIppOYkFUDXN5NDxIwIl5VC2cVDz5sHQUiy85S6o9fR
	yVtPt1VQdrgYYSAERrjurBJ0dMWN7x3o+hdVx1n5+6yQ8hrxguc1nvYN5Ej1xLgF
	BbfQ32eyvfYS4kcpkVZ0j9674aLyEKztqm/VUFTX5xuRAwRTnoLa33OLgpYuyPjk
	AARm+Y7F5e418zJIg4vk6UIIhHEFqww4WeyZs5GXU097VXcs7Ox+6dXhXJjCE3CP
	TG7c7kyCO0B9HzhldJUQ66RlGa0Ox3wujvpK1l/ngme88tavtb1bwgYfg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010048.outbound.protection.outlook.com [40.93.198.48])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g5m2uqu2t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 17:09:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=el04E4MZ31bfH81N0ytdz0lcrf65R60uyNr5FCQsraAprhuDF8k+FzQhWDKWaw7sMtEywO+sr0uoStzjzOE8MhTmeD6C1b8ksUxi7rvplgeR04QuDY6x7hqUWrw5D9GBBXw+yy1rSwZ2KjI0NY41KXF1RAx61RgOpUlBg5rpZQcEYvz+WPEEF3npQ0co0aDgziUk7UWSNSdoOPoBkH54meX3gxrOeoO0OGGT2MqwmfX3HRvLUvlZuFM2201rEggauJdnVLOm00DxCozYeJeCX5Y/lwd9qEtekMlX9lwSYrqYpbW+wRVaqAlOAlzNv+55V7jbvDJFREo4jiJuxWyTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReS5g2w/NXZBhBZLCmI+s4jo1wmJ6A6QCnT16+JBiaI=;
 b=s8nBObUSPKTuajUcOSWG9iz3M9IVgFyVJgZoho8kRTsRqaiaB/giaMbTEfkkWhX7YORr3FTZEAYyr9CrdBygVdisGVenICLRc1gQ3scCqqpVSiYHeT0dAjp+mHwk35WjIzpP88voDeAhpE1B+SCDDCMba6cX1dWr/Ciunr2qKlAZz5P0dXFgzVpm6IIQZsiC3D6LuQ170jMGoxp0LAWB/juwDl2tS0eGqiJv/wMSNt0O57pt/2lnFsL3llqt3gK/6UiJ7S7SyfqEMrhFuy8+tkzRZy3OVuYa5Mh2etklOFsIRRYoqYH4TsuFfiK/dwuut9e57fjZOfouXSJALuahdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReS5g2w/NXZBhBZLCmI+s4jo1wmJ6A6QCnT16+JBiaI=;
 b=S/zU+xK2r/Lb0/h0F6GV/qxSBpxJ6YR9MMhWiQx539U8LpaDOFZOgkMMshyrPmPROulrSFBFnEhz36bO7mobHv9JfC9uEPpqE1rMJ0Q3X5J00ELsXBunYDTOzLlZU/LtBgvbLO3NAp4D3ExP+Zs6KbxpA7PH6K5bUi7IH7mDwLw=
Received: from BN0PR04CA0103.namprd04.prod.outlook.com (2603:10b6:408:ec::18)
 by CH3PR10MB7494.namprd10.prod.outlook.com (2603:10b6:610:163::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 22:09:07 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::62) by BN0PR04CA0103.outlook.office365.com
 (2603:10b6:408:ec::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 22:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 22:09:05 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 17:08:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 17:08:52 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KM8pf0933246;
	Thu, 20 Aug 2026 17:08:51 -0500
From: Kendall Willis <k-willis@ti.com>
Subject: [PATCH 0/4] arm64: dts: ti: add out-band-wakeup property to m_can
 devices
Date: Thu, 20 Aug 2026 17:08:50 -0500
Message-ID: <20260820-smth-v1-0-e1738a38d58e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJ6h2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NL3eLckgxds7QkQwvLtGRDE4s0JaDSgqLUtMwKsDHRsbW1AAHzw5x
 WAAAA
X-Change-ID: 20260819-smth-6fb189fc148f
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787263731; l=1254;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=Iejc//95KiRrfezWuNJ1+SvQfZ6lvE0zk8Oq4xlr+GI=;
 b=t/W510cFTnPM6GOrfs94MTx1ppVmf/yIHn+yugfPVan7X4P9f891D97kf4JVuwYjc7kouVP4P
 WVXkB7fR+V8DQkk/rszbhgZy7NJLt8fREQt+2oV1gRO2/UafTiaL+uQ
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|CH3PR10MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: af1f2e74-aa58-4d5a-820d-08deff07a6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: m6Dnb0DgIBCDyQB9OccVKb/XJvazo6XAOxtrU1R8avASb9qhQdNDlwht5mXU/0bpAtyFAS0bqbaccyiZInHxl96i7DS4VBbvrYW53NrNnnhGfhMdKK4XuxyjwbEa9DAbCZ9fk8jTMq+dZ0VwYN+v4MrFpNIU9nB29alGKgPUknz/Qt9CJsTCLpY6+68Qa+Fepvk2Ov+iEPE+tldXqdjPQwwJjrn/swX7yIi8vhstQm6mixc5Y1cb0hIkGBhTqS3+CL9G5yF4SQJ8aebtph/WHQp6vsNGVjyhZbA0uAdGM14z5C265gfX7N2I8IWNeNLuqL1pmP5d0KC7ptyiIKhHEIVkmVGHWY4EGYfxuE3A7c3fFtmccYcENMdL98Z3iB9spKc8iAGCp8havWz00zPI8N5v3HOWkTP7b3jUkOlpxNI0LFewR7iFH0B3R6N5DglzFCrb5WFv0ZKRyEUYLarlX1iMLesdotE7tqE1+kz9OilVFLoazjJ0Jfjkq2Xp3HIPJN4NA/s/V+mQXBPShKtIOtSd6rR/Q3QwvX8HBL9Xq9dK+4NEH697ap8AJRdUW4mKI3v7Yx6gV+9YIsFfSmE0r9zKKgGs19Rgnu937pA61Eg+rTk3LzFS+ASE7T/w5cUQpBURS4P6tdkGQ4t2i64Y78ls4wcOsqsr061JU8ctwBLr+DNLwrtkpTEH5xVGLysw
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XTDEMeafoDWXbCbfZT5u278pLDUlTPuANaFV8QAtLT5IOFx3VMbwYS0Ti/ZvKu2CsTLheX933EzHParl6x3e3It/PMTGQSELAEd8okBeOJ7SER19BmmQeMDScFbUjjk7Fg2ytlbtHIZbyewrEErHYMwK3smyAnVQDrDRFY17eUtXp3+2R47AOrK8gEQthSCgAA5l1cR2ZjVYKuriEjD71dumnyUpCOYXyfyVCaOMUn40k4QBEaZ0+AoGXj3qcr/mkkUCfnjmyTg2TD4fuJml+YpBjjhnreDEIsZfEWLgw/yHPt7liQMUlOV9MXLfA1EKnEGMGD1U4H1pnbY/0QCK+elBL+pAZYLqHEae5jbV9FWOIfbeQR9ORwxEj9coNeTuxO7qB8O0rEw4VUwhlhQfpNohmbo91+YdBKR0RifTdD2cIyG6W/Ry6q8xI6A66mb5
X-Exchange-RoutingPolicyChecked: jjYiTmd71fJMgUi0Nuka1mQ6wIsA0v7aLadszv8ck10mM1u+bsutjsKTqrIEQel/UsxlOQ0JJ6O6fzxTgrprP3iqxiTFiOmGiWr2sA8MC1SR8++5uKNvCNKZi1Kn62Wvq8YxX8kHvzYLPEHS5CDY2k8ce1QkDb0f8fmfpNV4859c60GZFoshoktTzJdnbfWBxLtZgSKiqzXWwE4DG5hBo2qk6Nu0D61Hdxz+pcOMo4T+IuDlMXzu8g/alTCW+s4yDmwxiZGQ4A58UBWUeoPEQFhcW9I30l7RjTPeKuFPSix5441ALTG76FKHC0jk7Yg5M/i80GouOsHn0pzc6hOQDQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:09:05.8004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af1f2e74-aa58-4d5a-820d-08deff07a6a9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7494
X-Authority-Analysis: v=2.4 cv=E5H9Y6dl c=1 sm=1 tr=0 ts=6a877b07 cx=c_pps
 a=2TFapuF8m4VBt/+2R/0yYQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=yNj97e_fJMqxu7GGuYUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: QsXBAK-VsHDeNpS9zBS8cBqZcc94j44Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NSBTYWx0ZWRfX1n0FoFMMNHJn
 epYuLUY4VEZUuJWxUra4sJc06ECW776C3xOF5bBqYIpYdGmomQ0EGVO0okdRrVHrXH089VUoiq9
 3Z/yNMiZo0Nh2S4Il/DuiX28zmCbxsreLZtTt8+DfRu5bUcj+ybUuFWoverv5+qLvlihz0HhJYL
 JVqQKNcrCEi8DeJoswZdIe4CjdxQRUMPHaFXqL+ew2wMKHNZZyUXCefz2+1cQKTspcSLvt2MS/2
 RdV7UYJPN6gmZOj01j0MbQv+vwH6g9jiafaU9Yqaks8jaLqMTHYgbAL8TKz8duINAR1Jmxsll4T
 xY/WDUi2Sog4K1m7tqzDIzVRiavMb6dujpWR5y9Gj+K8E33v1LWbo/rI1uHUnWq2r3qyS7Le1lH
 +VHVm7cSh6LLXVq2bUKWR6AwcOl+oXSVG3ZkuZipEwexqmNkxBAR8bgmqci5I7XE1F9OHWTjqSf
 GAkZp0rHagdkfnpokWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NSBTYWx0ZWRfX0T0jzvmeqG7p
 brW4MbDi8mHOe9guF1g+UKoMmRe4AMpGv9oPrO2Z1TPWq4tagjaKjYSqMvHSs8JPqkQIkZtH8at
 KSRQJF9dnhfTeDlRh9hyKSD1SvCOgVo=
X-Proofpoint-ORIG-GUID: QsXBAK-VsHDeNpS9zBS8cBqZcc94j44Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_150913_558951_8E898681 
X-CRM114-Status: UNSURE (   9.46  )
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

This series adds out-of-band wakeup support for the m_can devices in the
device tree of AM62X-LP, AM62A, AM62D, and AM62P SoCs by integrating
the out-band-wakeup property.

Dependency
----------
This series depends on the "can: m_can: support out-of-band wakeup
capability" series which implements the out-of-band wakeup support in
the m_can driver and dt bindings.

Testing
-------
Tested suspend/resume with CAN wakeup on AM62P SK EVM.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Kendall Willis (4):
      arm64: dts: ti: k3-am62-lp-sk: add out-band-wakeup property to m_can devices
      arm64: dts: ti: k3-am62a7-sk: add out-band-wakeup property to m_can devices
      arm64: dts: ti: k3-am62p5-sk: add out-band-wakeup property to m_can devices
      arm64: dts: ti: k3-am62d2-evm: add out-band-wakeup property to m_can devices

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 2 ++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 2 ++
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 2 ++
 4 files changed, 8 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260819-smth-6fb189fc148f

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


