Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C8606D820
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zqnImQhg;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=m4ENjgl4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5f8N0PUzkGcDNqBisCbZLhXXNEtEVg+eG35qfd2meMk=; b=zqnImQhgkLW7Wk
	9rG1ZtZtE+U/Ny1xArTjEtgIAuRQZ9CXtS9ODspKMvOnvxNreY2IXROflwqDhaDAAXCRm/gw6Hfga
	XrSWcqD9k3zsWfbLquKdvL3OkG2Idc4ifItfpFZsrpUWlOotFE1VbxznTC8eSLFjhPyMeuObOr+k1
	to0jU3uvGgPYj7mV9h2dpyX/YVLX8w+Gc+0G/nBMFiO8jdOXcUy+p1enDikrqp6sP9Tin+UuxQrN/
	Gkf4Dkt2Xfm4CU2pb+DHyqKKFQ+j3PyVTuQY1WbML6mUdKO9U+UxiQaqtLMFQDGNzHnIScMoU5MgG
	2BhVi/Uny4K6rJuq4V+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsep-000000087B3-1bLD;
	Thu, 05 Nov 2026 08:17:15 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsek-0000000878n-2BYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:17:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkv8SxCUratXUf9w/SBrL+/coAwAvS7BiTC5wwSmGkLZLWSJgqvlLXJc6yI8MxVzmef0G1WyL27K8kYUc59HjfMAum/3/QZ+cSf1WY9dTQrDfs81uzWrvCFR4NbWHJv+zK7sqoTZXpCq1l2FBYwG/qKw2XOjYSiaLWqHiPXeW/B4Ycq9+s2auQUTpyt2oYJnjkiE02HGSLTVFBPwTsPTSVsAQDV8Dr1zzHcHSfRsq5+mXAANZVkLAvjOzaSFkNto26ZUoJjTbhs/OAYD4AjZJ3Ee2O99Oh0OpClVVetHex+cF6TWy20cyLTMbBE6dwXurLNipa6ovUAHcpO1OxFCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f8N0PUzkGcDNqBisCbZLhXXNEtEVg+eG35qfd2meMk=;
 b=AlwSJDcMaloplD7t3CQYsun9MbJjRPdF8pw7g9th3hBfeR4XPq31JSWHS1Ck6/PodAS2hIwZBsVIwOk+sNpNuebqT/EvNevi+pR+W7+fmbPIbYkb+lAmcwlHblEMmeWjpKwVRlYLzBJFdyO1p0VLw1cyNHYQmMUiuuBJtp3O6ZvK4JMEL3wt90JL9T4c9VQUL5WOekSOVFjT2BiCxIPiZogLiG6iYE7ZnB8XElLr7kzS8J1GdfXIrJX2Khli2zh91dPxdE/4dmMoiaS+HfGckg1gREqhBE3kFjSRJbERK0ITw+qFFTHc8v2L2ex+TnPLOv/FOsf25d2Q/Irh2DokkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f8N0PUzkGcDNqBisCbZLhXXNEtEVg+eG35qfd2meMk=;
 b=m4ENjgl4kBzO1G98aqEmlKdcARtaYKUAiANDhKtGMgVYWFWO8oh+MtaB4l1qL9IOig6tWDPdY81qVnilq+KhmRn7qWddM/1x6HB+dVtFimF2acoErlAGOfeM23LYSHNfQ4+/bGdrR5E4TyVqg9CyqcHrvEMi3SWIySLiY3FmWtPfMBGr3fVVh9MjIR33o3GufgdywqdIQ4ss6AVhzj9b+tRh40f/tt6PHT417x2ROBCLcX5NNT4wMyyHH8OYtmqrZ7Q2wlTMJup22FmpEqPeNAtBWVvYlkxTam14pnG2J3wE5d3VKR1zSx2pRlKKdA56ntwskI8FviKJkmcIDpCnBQ==
Received: from DUZP191CA0051.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::28)
 by AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:172::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 08:17:00 +0000
Received: from MAD0EPF000008A9.eurprd04.prod.outlook.com
 (2603:10a6:10:4fa:cafe::76) by DUZP191CA0051.outlook.office365.com
 (2603:10a6:10:4fa::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 08:16:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008A9.mail.protection.outlook.com (10.167.241.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 08:16:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 09:17:43 +0100
Received: from [10.48.86.101] (10.48.86.101) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 09:16:56 +0100
Message-ID: <7ffc8269-f02f-46de-ad79-3805b2471d79@foss.st.com>
Date: Thu, 5 Nov 2026 09:16:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] mmc: mmci: stm32: release the delay block before
 enabling it
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Ulf Hansson
	<ulfh@kernel.org>, <linux-mmc@vger.kernel.org>
CC: Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
 <20261104152657.14909-3-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Christophe KERELLO <christophe.kerello@foss.st.com>
In-Reply-To: <20261104152657.14909-3-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008A9:EE_|AM7PR10MB3923:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f14656-e07d-423c-6902-08df3b15297d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|10067099003|18002099003|22082099003|4143699003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: ve8Dal7g4trcgnhrO3Y6dFEyJm68u0Tdo6IOH+RUv87749ncdLuwOe3/Vt3UROLPZbcYQN4mXG/G685ISyT2I9tt2dOrgPAEGGorTOJM+JF753mSxHZSeii0s6zGnZc+1Lf+ZfRVu4TDLJvJZRWQcPh95BuDv/0wvSf2dOSdLPs9p6NB7CfZX88AWtVe/vX4Au5zzufKItYM8da+5MkENwREkRLGYgZ//cqjpO5TyDcHc9paxGXdzpJzrPXsZZVpQ4p/e8oIrj4n+qnlsVWOuiTBso4XUiuYH9JqzIePek98iYNQHbzvAncD/5mDKo8ZTjVx4aHQ1c694CcDhgHzeJwXg9KYrdrEiGpSQnoT7JFK9Ng6Q2U2zignE5CewwEnnw/5xnLPK4ztjujzrewjGq2gNU4YpbjzQ8UICLr8Bu4ip5nQJyoyXJVBPCXtMBq3zrMXaZn2m0NBsWDSK2cqg1a5ghtn1BHu0PXOC1E/hEOj0JYGqJkbRkWbpzrWeRkinGDx78cSu1G8K2fQL4NOEuCuP/ssTHjE8ItTaQXOGwMQ2sdDjyZFgMmFXzdQLA8QQRv5Ujh65BpsuCglCiA5d2NpBd9e6rerguUU7vVBwawRn87xaoITHfAqLkXK/tm7BR5NhWu8OsDSwTI4zQWceT2SZ/SxiCan2nMeUtnAUUB2YVdfLHNBjoU4tgYnETFiPDHJTR8QnoOX2FsN3gqnKQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JKg2az7vq+ZR8t8fl4jqRJ5kKcQGB3F6DFf+50jBRmi4Q6P6cORYTSjbHmBCtZMg5gKCYn9dx+D5pdsN25R9/BVZ8IQxzeqa1O+tPXRrCmCG9fajzaO8+eFilAU4psAAClRJh+3++qYme3pJ/FACQ00ij7rYrHpMliiAVdXY+/YbBdv9Flma8BcKPxO/AEOApgFLKy2hXrY6qJQGvY+1ksJZvNhPjjzLR/W+dtUdy8xrvfMP7B2VCSMr7cF48LlbvyYuSRh1v4OzIcL4Nhp8CqFSUlZn4XDZTUcH/92kHq1UvTljILcEZ0ddzz6xDzLJ07Oxbv2l83GCO5Trc4gZNZzlJXkaEzGNJmsStIvlcJbr9//SCjikaMYPmLTvNieDYNDpRBjFNQAf8YbX9oEHf1kcSnMYkesOnHs4ii5i6cZl8CWZ9wcfD3dNuwmKzN4W
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:16:58.5142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f14656-e07d-423c-6902-08df3b15297d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008A9.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001710_625698_5545442D 
X-CRM114-Status: GOOD (  11.95  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Mateusz,

On 11/4/26 16:27, Mateusz Nowicki wrote:
> From: Christophe Kerello<christophe.kerello@foss.st.com>
>
> The delay block must be locked on the last frequency set. To avoid it
> staying locked on a frequency used before, disable it first and wait for
> the lock to drop before enabling it again.
>
> Fixes: b5c3eb385797 ("mmc: mmci: stm32: add delay block support for STM32MP25")
> Cc:stable@vger.kernel.org
> Signed-off-by: Christophe Kerello<christophe.kerello@foss.st.com>
> [Mateusz: reworded the commit message, added Fixes and Cc stable]
> Signed-off-by: Mateusz Nowicki<mateusz.nowicki@posteo.net>
> ---
>
> Notes:
>      On the STM32MP257F-DK eMMC in HS200 at 150 MHz, switching from DDR52 to
>      HS200 made the tuning pick a wrong phase in 9 of 18 tries without this
>      change, the phase was right in all 12 tries with it.
>
>   drivers/mmc/host/mmci_stm32_sdmmc.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>

Regards,
Christophe Kerello.


