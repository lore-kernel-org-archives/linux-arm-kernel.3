Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E86CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83DMdZZrXbubodraG1MuTdXJuELcJZpN3b9+RE6+HLM=; b=yrEw4wpjq4FrHD4HmOXpROaVX7
	+OEe97hGKnCk/+DzEYnJPZ9zWfF5N032ubyPauHoZDekeQ6EBElgfttPQFU1tJtqo7BW+yeJZJDYq
	PwVoCRfboG97EMT8xx8PsamHQQUS/wsvhGMuoIwzUxvkUBnDJrSJDPFTEOcJCq8lSkdzM7vVneVCb
	oEJ0WABfDYqOowrj+j40vegvEeqywg9ysJcKyF2452qtxndNK1PplWxYpj1h1aQY+i/aDopLVA/AK
	Ao0d6mWccLYxeVwwC9fFYgsOJ2Xy54uaabsV9Ed4SYCPFYouKxPQJgi2maS20/azcnHf3rHsuBvDC
	YfRru5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNC4-00000006qMM-12oW;
	Fri, 08 May 2026 15:32:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNBz-00000006qI6-0EQv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=83DMdZZrXbubodraG1MuTdXJuELcJZpN3b9+RE6+HLM=; b=Hw1wj/cPCO/Em5FFgMRcyfmS/n
	qnTEy1ulOZeNo4zs2srBIRTUQXL1oGQquvk/ajNFRw2ubjNWBAo2k0RUB0NIT9LgyLf/DSvs/siqL
	Ofatmy140MSJDpoBfXOyaWFLZe4iGamPa8ZgzibfIADSeBwcpQpHyxLo5oOmIji86miCGMF9xfd7s
	tl/B/+HUQxCFJoFP3oKSsplRo6NM/oEtxtNmNkrKvBbJZbieTRmRrWO3VCxHH83qcn9MIuXPpKgAF
	+H0Pp7+NdrFh9RZoYw90EPnaABvXD0giv/siIa3OjYoSu0S5ky6i+IcgLtQAQXQwwgScFiPvvMnQD
	wgpMXnUQ==;
Received: from mail-westcentralusazon11013001.outbound.protection.outlook.com ([40.93.201.1] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNBw-00000006i3D-01o1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLXILyVYwngw5eXqPErG+ds1R/T6yNIxNIFGDrmhhIPvtiV/gZI8/EztjEX+LCH0b9sWtEhK5yYFbhlKQGG+jzzYgAXcSJ4OV1yJOqrIJLNTd4EJFdPtMYHytBY5MYOTWa+VmmDZ6Iw+tG2qiIPRFMHm7wZBqBU/59WsSfRK6aC0WtVqLEljtAIj6EkPwlu/RPgAK+LI13vKkf89Iz/NxvQPEx2xoX3f/n8ZJ6k02w4XWdPm+qA83fN0wi3Yjk0eW1MIlH23sB81qkRpAai2b0kTEHgO8qbLVCPWw/XyHGpCeewz1issXUf0LHemRpfnB8jm7zFl8hXXhMN2/cJ9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83DMdZZrXbubodraG1MuTdXJuELcJZpN3b9+RE6+HLM=;
 b=PHGPiKOHvow3sRUJkAnvjmKxiWM9bx/IyiI0toa2w0y+RKwEx5WWrsiOASUjEoPOykwJr1y2UZ3azvwAUPAfTyHg+maX3oerzyZcpV+I9zEPGrut6jUnnijL7x0zz1zbitI9zXjciz2+DzsFrEKRz+CnbZEBqS5iPyZFz/Jv1ciZ8DSadYWU1Z8sKyj2SOGKdWPwIWav8VpeQMz+jmyZROCEJeIwZP+4Fg3LH+CGEFuSmuEaaMeMWi2PkAOWiyiPjS5nf4wemeBHFBN9S8lsg+cQsVLyZwBKoUilW2yOYciaX2jhbMGmNYCwwcP5GW0bGmvoG3ptckCb4RDwosXvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83DMdZZrXbubodraG1MuTdXJuELcJZpN3b9+RE6+HLM=;
 b=uENuNkhfIfdRqIX6V5IDMCgmgiMwt+tPG2Ii+HiIgn7MKyywmAb6jtO+AWqSByOnQsoctUgA2Q8UK2GgV5urhE3Vvzdj+inClJqtpcd4DDU38YvgKyXDkSKn9wjQ4iGNIKnisHJouZZR7ihf1slxVCMyOqIS8AhAalC9CxUcel0=
Received: from CY5PR20CA0024.namprd20.prod.outlook.com (2603:10b6:930:3::25)
 by PH0PR10MB5871.namprd10.prod.outlook.com (2603:10b6:510:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 15:32:29 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:3:cafe::fa) by CY5PR20CA0024.outlook.office365.com
 (2603:10b6:930:3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:32:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:28 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWFWF1961990;
	Fri, 8 May 2026 10:32:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 09/11] soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
Date: Fri, 8 May 2026 10:32:09 -0500
Message-ID: <20260508153211.3688277-10-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508153211.3688277-1-nm@ti.com>
References: <20260508153211.3688277-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|PH0PR10MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 8093fd6d-37a5-49c9-b579-08dead17038c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: y7wLVcbPC3B1lnltwpKRJYMH4sqZHS2yocDR6ywHy2S6zecOXhVJTHtar+VF+79AubiYRkDQeCj6TEkSWWN+3EGvdPwXX48oOjUe+vzu6BXumcGC3wQVVdmKoyJT0MZMxb5/QWDtsxb4EIGT0E3LeFXDZvzWewxZqXPeD7Y0VtbMOcUfG4WuBzf+hP2X3bi+uhhsa1xY2CFlRVXkejeY5zsxpjqdTnVNNmJbveqlyGQ0aKrg8tkC9tIBTEvdUTvvEJatngNbSUGukJYb5aA9W5d9riHLaUNOrx+GpgiRHCuarz0q/qti77MpeF2dtk/KlbO3W4Zj5GdVrYzjmrqgRiLHMFoXdFpZhAnw9ZDvPfTQ9u14zkoA2rYggOgx1jBhvq1obDUIWiRpbAcaPIJ6+hyNmTnl47Y+bupsJyWFlzPF4DH4RBfayV97I7SqiMn4vXv5Jj7LqelKPsoHOJZPK61lFwqGEbN9KmmTgMExzaTGxnoz3x2RNDNN8K0NNIwvDpJvbcEQxl3dgDRJ9C7xnTImKDR5EfdWkcFqixHtBZRwye3sXwy8EzLdcv8YUR7XITFncYMhKiAUFNkS5Ql2hc4XigBynGwZLWP58EbtNF7fsaPZWaKfbjK9iRw3XuxXCwqZ8RO2VKDEheXSr/bKzYWUxjnSEWh2T7e8ntmY3Do4N8ysLIKKqfJDCcEvyFhzdDNJLVsp/yDM99OgpDSsQVDbJDI9ztajnStJWSSMjQE=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ud3ahpRE4WNlGxhQZn+t8roSiQQGFMHW2GUEzRt7tcC67ARjLkh0YQgvdwg+RmQGgY3rLRkj/dvzF5LsmgUAhrzLsLeVxWsYEZmzURKcWLCgfXkGTUytkcrzoViCXouqjGnC9+FpGPbeAQ1YpswiA/RMS96LH/eVGKZmRWlVVME686UccKqu9qgQv6AOOGFRKQQt1sh6oreVPp9V3N419yXXW16WL+Swc9uKyihZu+xIn9kdJ7tZug2QI5qc35N5V7Qtq3No7+N++R4fZuo61NtHAaQNjJUmgaFlfM+HKtdkAFPEPXywyLBtuE9kpavmYWUk7RF7F0MzdFIHNofRN8DJNjAph2rSVm83w7LNClOwRnhGzM+A7av1h9Q4ZoffwvGVYbuKF40nt0EKBELrlYG8CWoUq1gqauG/A/R/fkzplUk/9UpUnh1w8cs4rO+N
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:28.7539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8093fd6d-37a5-49c9-b579-08dead17038c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5871
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_163240_413555_DF1E16F4 
X-CRM114-Status: UNSURE (   9.48  )
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

smatch warns:

  knav_dma.c:390 of_channel_match_helper() warn: unsigned
  'args.args[0]' is never less than zero.

of_phandle_args.args[] is uint32_t, so the 'args.args[0] < 0' check
is always false. of_parse_phandle_with_fixed_args() already handles
errors by returning a non-zero code, which is checked immediately
above. Remove the dead check.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/knav_dma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 462d181ca564..7ba6fd58e9ce 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -387,11 +387,6 @@ static int of_channel_match_helper(struct device_node *np, const char *name,
 		return -ENODEV;
 	}
 
-	if (args.args[0] < 0) {
-		dev_err(kdev->dev, "Missing args for %s\n", name);
-		return -ENODEV;
-	}
-
 	return args.args[0];
 }
 
-- 
2.47.0


