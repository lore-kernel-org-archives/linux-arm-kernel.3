Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=luIsiXho;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=FZXqGLxM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f8CoTOtOlQYDTyGydfe1YUazN7CClYimjdeTHn4mwn4=; b=luIsiXhocjzqwt
	q92hM0ag5axTVzxKtR4qA1qEYAYY3+hTN8N41aqzpFwKS3gopIKtNp26MwszPWTjRz7fXxcLaUxDj
	hivLymjzYn8TUCzWJEfKzdWCl3eA/bX+3lcDHUWUNg54ikTIlDRnay3DCmk4IcVaWo/Xco7zAQ5b0
	vj5b982Q2//z6529n2nbkxq060T2SkRo/upLSWSuf4JMYlNSQB8CvXFH5LsZdvGGVVDZJkVKcFsuT
	e33D0vs8TQYCjfC/vOCToJb1c4qA7oeLJh30k/smq3Cx4G7YAaK5hcb6sSyXZxzrYfSW7k40Ak+9P
	5DrCbn4dJW+Sg5IZ8d4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsev-000000087Dy-0BLN;
	Thu, 05 Nov 2026 08:17:21 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOser-000000087B4-0Bq4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:17:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK5HdrmittnWppLQcHenpQLw+Uxae9XBKwlfc2UYxhT8xibowpWb3Ji12wjVbFa+ckLsnVHPNbl1QzEdiWgy3qCPLQUbVyX2F+De+Je6F6hLihddKNX4G/XuU++8O/XuJ96W8nwJKWLGFjcsEbaJu3Rp1GRzQedXmYt9YDH5DACy97eT9xc47bsCzE5zG87xbOmP6cga1IguRixhKvVM+wjxPZ1zQWP5gtQJekLW8buhkxW6Onzxy1aDhQKi3XiUte3/xbyXOKBcnmjXBTHLq6dFEHUo0A0iWuTPrlQM5Xrw+LhEaTpQuqxFQUF+tBReKa9zLc3O8c1zWkWzlO47vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8CoTOtOlQYDTyGydfe1YUazN7CClYimjdeTHn4mwn4=;
 b=pQiwwA06vk5XdvtOFc4fi0IL7XAPPmA9MJ4InrBaQ+ygtWtvIKsNpvC2Pi5ukVPl594zQzsbspYDBwcw4a/qqLvweKdmv7xW3Jj64Z7OgHoHfaTqtQeGq/nGNpPhPadTR3G4ajhG2JD+Hc/vf3i+MwfStzh5BKQHVA/hzkS57jpVBOSo5l+To/n7cmwDG1M1MHpFq4D4ets27kPAOj4QcODfkPo6fyV+8Pk1EVICBFGZ2Z20uphylOg9xnj3a3h3VKxlvOqA6Q3Z+mjbybE/kS9ODPREVmhU0CJwRq01J8IU3X3d9h5p6QNFiN3qVDhJrYqIWEhkFWbWcX6RRvBKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8CoTOtOlQYDTyGydfe1YUazN7CClYimjdeTHn4mwn4=;
 b=FZXqGLxMVPby1Bm1Pd18YEteZgtSyP/TuP6NJxrgYzqA+wYi/TTNVbPra62EbKseYmsazCgvOahRdhsk3uh54e/EIqDOn2S/9ljNFOcCH/tsO0LavW2JAFPJbTd73ufDcIh8sQUmYbBjk0oF++drkm8oLKJtmic9/Ew0OWxYcxjC/zVKglif6gffRQHOXW1KPxR/ywFaf5TRdQVK6cHAEVbLhffHPAV2swovpWOzetBvXbn75JYhaOsBedFAtL1ngBjEC+HxZ4kAWi91hOI2DYwqezXnxRR//EsCzuEHMmVlgqg3+OY3BBRMa+v6e5dIyfrYyEcM8ywAqjELp6lRdw==
Received: from PAZP264CA0033.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:122::20)
 by AS8PR10MB7825.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 08:17:12 +0000
Received: from MI3PEPF0000849B.eurprd03.prod.outlook.com
 (2603:10a6:102:122:cafe::46) by PAZP264CA0033.outlook.office365.com
 (2603:10a6:102:122::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 08:17:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000849B.mail.protection.outlook.com (10.167.240.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 08:17:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 09:17:40 +0100
Received: from [10.48.86.101] (10.48.86.101) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 09:17:10 +0100
Message-ID: <4f90060d-6eae-4cf9-9533-6adc51f52423@foss.st.com>
Date: Thu, 5 Nov 2026 09:17:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] mmc: mmci: stm32: use the delay block above 100
 MHz on stm32mp25 SoC
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
 <20261104152657.14909-4-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Christophe KERELLO <christophe.kerello@foss.st.com>
In-Reply-To: <20261104152657.14909-4-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000849B:EE_|AS8PR10MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 35857e6d-0ee6-4092-4f63-08df3b15313a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261022105027099003|4143699003|261021123027099003|261009223027099003|261021121427099003|261028144727099003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: lwuH4VzcE73Zjkyg7PBI8lX9ii5kWTLdkntOrimXkAHI73EwZLwvoVu3i9w1t2D8RZ1ZXJ/YL+8ZMUCxW7nrgE5swSFj/17yts+vakO9pxURp7g5M0bmXFVbxMYqoDvCqbiKen+gCAcQjQFALTif0eN16+HndX0kQlWjmLe8e71GrgHbH5GdRXzU6Sb+JwNM7NQIzCMgGtVCb9MjyM6Wiv+9zwuKKCnQVTPtbypgGFjNeJ7paQwdmMPMTQoIBcZDzOAPD8Q+UQLFhoal3qOj7MP7586xDw3YotR5FxdcWFhRCv+J+VytqFtcbK3ut2AIBJ8IWu/2H2bDswEQr1wTA4hAP9v5CtUV8gM9pm7jV9wPA3xZBdhArRkopv4g6buufpk+9UJvm3QXtVsPpz5jndTR2j7h6n7BkbC29KZ4eHfh1CeQQ7kjq6TeUyxchtWkix2oP2jMCAE4qOrUKksVLDZoVCG71pD8/fZRc5hUyv1aIPycv1sD9UuO1BwRXrp//T8qW4d2knY3zLWip8ysId4qZO98zPpDskU84h6oMHL/2KK389/iE1ZB8DUTM7e8fNVYUAuAQboXnc6rlrAJKXyagPWZlxw+WBAA5bMw9RBuHt3KISdNhvTQk07HqcpXP63MOREDbZ0OlTS24uE+tD37F1nTIMWZaKAbxfx7ILqkcIO8dueaoWaLSoJfPyp+N8eVuXl0GN6/wD0VpAxrHQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261022105027099003)(4143699003)(261021123027099003)(261009223027099003)(261021121427099003)(261028144727099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SfdYbs5KOZzQdc8s+6JOrFTWL3mxHryPExyMvvLaqguN6ogQJu9fsOYDCXxvCyDAvm+6EvxTgXH1+9ORAkdRwfoXIwIDYhbtSg0Fu7phZ4OthzkK+ulbCTzpvv9LJh+tGaAmfcokO0f7gCAcy7n2OiCuWcBxH11tJm3Ozv3PlisVysyWSGvQ5JaFIY29ooFlMej/t3hX4ONkQTAT1/wLkVO/47zZh/cLUBv7SB9zs1/R2Ck0oeMQwWR4Z12cfpQYw5lhloEH+Y2Pm+JN3q0SoKWM+vBr0W9jJQmEY552ScylDFT9xWzCZuPuwqY5UOv7kE+TpFk91nh6zHOWrqAER9cO5p446QbS7z5a0qs+ckqdSzepqmLl2rkxVQ9ZxEVNRQpwQuPcSWBOIbyv9EU7n9+OKa5gsOYMYqJNnyRE5FzmsaCmrI2KZzwLYtLptRoO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:17:11.5710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35857e6d-0ee6-4092-4f63-08df3b15313a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000849B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001717_122969_92037D82 
X-CRM114-Status: GOOD (  12.84  )
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
> On stm32mp25 SoC, the delay block has to be used only for an external
> data frequency above 100 MHz. Skip the tuning up to that frequency, keep
> 50 MHz for stm32mp15 as before.
>
> Fixes: b5c3eb385797 ("mmc: mmci: stm32: add delay block support for STM32MP25")
> Cc:stable@vger.kernel.org
> Signed-off-by: Christophe Kerello<christophe.kerello@foss.st.com>
> [Mateusz: reworded the commit message, check dlyb before reading
> min_freq, added Fixes and Cc stable]

Thanks for the fix.

> Signed-off-by: Mateusz Nowicki<mateusz.nowicki@posteo.net>
> ---
>
> Notes:
>      On the STM32MP257F-DK (SDMMC2 kernel clock 200 MHz, eMMC in HS200 at
>      100 MHz) the writes failed with I/O errors in all 9 test runs without
>      this change, with sdmmc2 pins_a or pins_b and with or without NEGEDGE.
>      With it all 6 runs were correct, on both pin groups.
>
>   drivers/mmc/host/mmci_stm32_sdmmc.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>

Regards,
Christophe Kerello.

