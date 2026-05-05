Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB785FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhhj5oMpDd+GRyuE9zBKK0K4jVPt43LmA7ONCjdLxV8=; b=JPI73sIF5ds2TavrlCdqywLvbB
	Ooi0bOOm46XtNfflIMpSgGDP+Lb5DLhL/cIlA9NHnZc07CGBegulr0j9Hf2IDt3yXzedJqctR5E76
	TBP6OOZtvw1Gp+3ib7oxMqC9JHWl6vX/8iGFX1x17Xzo1KvPUhMq9MEDS97i3B4btsx6qUnQ9EVe2
	bBOz4rKnU8GeAAGobcgm/s+H8WTlLwQXdKEegFgTTlfKjxNSSa/9tu5pY2f2Khi4usa2JER4FAlhs
	ldGm18rpubsr9uN/YUX4RUH+Yiz3JFAMKmBy5FGXX6TajEjGtAalEYiuoexTrliDCmdUChOtV1Y1X
	SLxZZRVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGO6-0000000GQmu-06ou;
	Tue, 05 May 2026 14:04:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGO4-0000000GQmG-3Zjt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 14:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hhhj5oMpDd+GRyuE9zBKK0K4jVPt43LmA7ONCjdLxV8=; b=VE/DQwJSZBW0FfUy3VB+rke/zA
	P07BmjYdOCj4ZGALPFJnA2u0EguHVw8mr4D1cjx+uXbqp27jNRMFJODMazEnwox60Z2NmBmPpfLW0
	R79FF7t7MMYNQRThkSTHsHZsvoKZyc1BTjwvZ5PgCFSmVkDl1rzgM2vs08+YMtDGkX1G1f9NboyKR
	JBfiac8YbTn5GmfNwxpBX7mDtYOZUEwBah2HJWuFCejz/QnvOboXCbHvxaP3nwpQemVtcgLyCjE8S
	wnQIGz2rgWjvSAbTN6xc8xUyb0jqu5QC7vy8CRxOgr5XQMawkcunYXCTVG/ihajP6Nb2JT0wZwnBZ
	tfzFP5CQ==;
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGO1-0000000DiS8-0JtW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDKoqI+8DqOhUIfXzpI/mUvkMTx2wotRUcKWHBhECHkgb4t5XnOgLmB33qnHkQ90jg09uajwyqVWX+2U0PwqA+51GL2zW8slT6bw00sOh9xqCo51ID23pfzdw/o65RLeHFmTeY1D904kyHVFpv2J/rfvWs8B0e5mWgGFsTYp6dQmP4/IaO9nkvELMJ5cAImomZaWr1mFS9nUlcM23XLHBSJxkvxeeJAzGrGhovwFiqkq2m9NgrluRt2Ql3Zza8oQINNyA3/7c0YbKHFv9u9z1bRsYu1s4eRmZ5vFIOMDCd6+ikpg7W4Vn2lskNSD7vtb/z3lGuifksj3xuACoS7DVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hhhj5oMpDd+GRyuE9zBKK0K4jVPt43LmA7ONCjdLxV8=;
 b=F/s4B/UYYNvQYNEhfa9n4qYdTrUF7jbwl0C+ttqszbiKv7ZCoL2ca7W8EM/jMtrrrPPkNL15CojW/rp3j9nh2sATMSEDKXuThUkVR8MAmDr+jjWIC94nbMh/NmvIojExSHSiOGwHRARf6bmPMW6J5k7PdbW1xYt7dHP3o3y+7asWSNQxhuTMIRp1VmAhCzl+6e/HXDDLVtLGfs3uDSfHWXzhIqaa2gV2f7e3JA7JdgA7J3RzChKRiIKkmy/39vOF+9CW98us1PXABp9WID7D6wGSoL4E5iY4AmwN6/GlsFc0wmtsz27LglIo/Fti0fQC1VXWLnwm5F9lO7sEOpxUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hhhj5oMpDd+GRyuE9zBKK0K4jVPt43LmA7ONCjdLxV8=;
 b=kCcj+ZWXVOl/1Afq7wXgTvn0JSBYnX6WSpzHg5fpkAA+HzRvAubA3EqfsN/lTcYBe2WWwuq5KgiDOtWXclWMunrZw6wA0A8pfMot5lFLl9+8wSmiwtBPeTuEKRmJu+ZCwok0pYPTXcRoDrAKQt9slB6r8FkBI62453Gt8I7WWYU=
Received: from CH5PR03CA0018.namprd03.prod.outlook.com (2603:10b6:610:1f1::18)
 by MN2PR10MB4224.namprd10.prod.outlook.com (2603:10b6:208:1d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 14:04:20 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:1f1:cafe::f7) by CH5PR03CA0018.outlook.office365.com
 (2603:10b6:610:1f1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 14:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Tue, 5 May 2026 14:04:19 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:04:13 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:04:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 09:04:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645E4Dfl3111242;
	Tue, 5 May 2026 09:04:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
CC: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees
 Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux@ew.tq-group.com>
Subject: Re: [PATCH v6 0/2] TQ-Systems TQMa62xx SoM and MBa62xx board
Date: Tue, 5 May 2026 09:04:12 -0500
Message-ID: <177798982187.338501.17984364296514390891.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
References: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|MN2PR10MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b223a2-1d89-496b-3e4c-08deaaaf33e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5igFGVQT8SNAVUMD8iPgIQNqRFEsdZ6ns28SooPu5h3PMzMQ8iwKVwPZxIDVjixGmgpXxw97c7zh29AuBL/rywUbX2nrLYHV00pmc8YYpRRy2t+i1uQLGIqguCaZS5NJsAOox1kzPERqc5uM90Qg+4UwposzdBWgeIaCSn7Fm44IuU+bJGfqZinF9+KzElSShIZ2qqF1yAOUPTxheSURClwHAzRZt2deNFAJGPY30NDFbqed/ooeGb2nvBatxc9nYJPraR+8BFMGEMJGx5MJeae1Ed2CLx+T+H5EAEXXWk/0SFXdWVZ++6hwF0pnFNbC5G18ZJ12M+CfkX5HHj+EzENKxE96m5v+ZDjGNliRs2O1MUAcCVmUIxSbhEkioCny+MHqWz3nrQKY4htvWGDr+CdyJ5DUaOzC0OuLr1wmip87+dGYepHgUKDWGsZ45LpgspeLETHw2l6+LjUSaAGl11HDgzeADWsrM504AMum60Gu8UGqO2oAqaRZFDpJo7f7S8iM2d3EMF8Ekhltlc7a5jH7nYSPudzru0XGnUA5MXGsEL9jdIHXZt/RIGdN7y2TxnTOKZa4woqW0aE1BRJIPomt41ityeqVFmzOJCvXbvGQ7cGEBYwlhDL4npEX/ToqEf/dBvIIRP2T4LVRAvMVnEjSMn7YSAVSBGmbTX8cdD0T5O7hwoYYfNDmew/156GsUOwUalJHnKNxtm+C5zLcRdEins9VrpTazeLB67z/1OY=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kELdhoUz/Ixf8HIl/c9j/ZUnRPEHZEKGvBmbp71cqkS+xvI86oDjLXdwwuzlfDO5ixpovXxQ708TKXD5qv6kVkgEb/LK98/N5GBrPdyJjPU+bKKHCVu+Veeyu992+HsF6FBWxChcUFAWerwTfOXRPsYiICB0Rp/RU/142qLrKADzuO1kq8eslZqyzdyT/j3KunbEtjdMa68x55JxLyvicjhJSNGuFDR4sgDGHUOWLB/8V8KgL4Q/ATdNmiDQrvbtGwlYx5AyBbp+Bzr8zj8PfGeuyQ/ikNp5GSXR2oGD5gcVQxF/HBHzTks3MnLqXOFPaKj+lJrVB7NbuWnkCXinSlWf03JEn73lXcuaten4sQ6nEZ17/dV4sjnM6kNp+Neh/Ae8xiCIuP6GKmPr1W2/uY2SxsPF7xWk6QkzskhNfpHru48pUhSxMe7+GVUEHVSg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:04:19.8839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b223a2-1d89-496b-3e4c-08deaaaf33e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_150433_341409_D1C2F86F 
X-CRM114-Status: GOOD (  14.96  )
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

Hi Nora Schiffer,

On Mon, 02 Mar 2026 11:14:57 +0100, Nora Schiffer wrote:
> This adds Device Trees for our AM62x-based SoM TQMa62xx and its
> reference carrier board MBa62xx.
> 
> Not yet included are overlays to enable LVDS display output and MIPI-CSI
> camera input.
> 
> Changed in v6:
> - Update author information following name change
> - Rebase onto latest ti-k3-dts-next
> - Disable incomplete panel node
> - Add various comments to explain why nodes are disabled
> - Extend comment explaining disabled 1400MHz OPP
> - Use consistent comment style for pinmux
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1]. I did
some minor fixup for pinctrl-0 formatting, let me know if things are
NOT fine. Thank you!

[1/2] dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM family and carrier board
      commit: d8961140aecdd68a57ac1ca11327964a709d5ae5
[2/2] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board Device Trees
      commit: 5b36d8c72c91d0f213c712472caf03192e373c0a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


