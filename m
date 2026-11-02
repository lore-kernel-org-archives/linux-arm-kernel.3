Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FEA606AEB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XbnFSNIr;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nTYCnFAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5zI2yEfeZMNOZsc5dyb3KywX5xcmO+p52dDnrqlTbqw=; b=XbnFSNIr0X/s9F
	Ku0lkUSjidvH8b1NgLNoCMF31eq/aEu/eDB4uu+42wU5XOb0H+8NyhTN76+7fqMJw6ynHygX+NTNo
	oSbU3xqVYRVGDSUJsPQa5SEMMnyFYLVyLLVnfFufZmUDaI7+9M1WZuN4uG8458bb1di3SqXW0N+3R
	tgoCiy+sRJRcw/lZYqMC4itlKR1oGv3ZHaCUNGwp2juCeLWaD14Qjcs4HvZpsZEDWJFPZtBwzP8nJ
	T5EbGHi/L38a9D509qW5SRL/YPSEUD2fR8ljOyLXjqtIhGTYc8SL2XFhkS8TvRRA6vZE+VdADgNbx
	BCJiH1/JuAnfyW9Rr2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvb1-0000000HPw5-3x0e;
	Mon, 02 Nov 2026 17:13:23 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvaz-0000000HPvK-1Ubh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:13:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxS+mIsjabiz3ODb+t5ukjPI40EQ9IJXN68hK8S3lQ1/Xj5CtdWN05Nw8D11cCRkK1k622QqzYdghD5Zgzsh556aol1n31cdYdzcBTgyKqvQSrHkdYjwjRevpCGj+5b6nMR8xdOGW47hwdXIqwtREyO5YgHf9udRxUvtVx6r7bn/dgmXCl6QAu5yZSdGBg8PhYr7J+HOjZFcsIZH6tIscJbnBBag6RVFAqSM//oyqeq+Mde9wF/DKK/Hh9utCCA0Z66XMfhCpaEabF+Fmm1B3HaVu7OZATri7XdFzEpc82bSXuESaXeyauahCCKy7FjdNwwBSrDG/ZLvhQMpQSBZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zI2yEfeZMNOZsc5dyb3KywX5xcmO+p52dDnrqlTbqw=;
 b=togZTHxQgjFjDZaqlYwF6yhYwz1wB0lPnOMQAGYn3iVw07o65EtZkPj75jQF+cI8aTAjCp97a2P521GQmK6Fu0OB16cr13StksdW6KlhWFlqFbQITU8C+dnVmRgvs035JBf+WNFGXXIi5H47sHfB/G4Z420LQl1eYnjMTo3ev+cNCOYPo9CR1SvbuuKAkyLoBUj8rnpnpW8UNEbEpPwI6DBjY+owPoh9MB5ARjpQ1y/osZm4+tY7BBkZ4PEekGSks6LuPtNWIpyU5m/alX1OeZA3VRf72rWlDGKIIzBQwSQTfhYp0+A1wD2FSRnZcv/P3vwohznxHaRAW8WKl4yS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zI2yEfeZMNOZsc5dyb3KywX5xcmO+p52dDnrqlTbqw=;
 b=nTYCnFAExI8VzY6sgCofxihBo8Ys8ZF+9AEBLd2LBdssr7uDt1kSiBa2AU3zs+IRDx88qOaClXLbmj/xDFMMNYJ8X8GnpvUVA2ct9SKlDW4gL21FNJDJlOkRw2q0t1kW5l/ZlCrP7GEfh2ANdjLBsE24VfuAiiY3sYEECsWqLqGaEXlPmC9+LJX6qDO1Qa+UryoGFu8b2+9cWm+x8kMoJi4nISIQtaBGN1aHlb+J7owbRvaq4FrgrQnEa7eCwqDl720sMAEaqVM69jhLLyXiR8UJfyl6Fwe2zjxxtDWIalgOn7Nx9T44vqK2WX5YxmTXmbZve/0F9WKnOwtuW7jQoQ==
Received: from DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) by PA2PR10MB8911.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:41e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 17:13:12 +0000
Received: from MA3PEPF00000404.eurprd04.prod.outlook.com
 (2603:10a6:10:46a:cafe::41) by DUZPR01CA0084.outlook.office365.com
 (2603:10a6:10:46a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Mon, 2
 Nov 2026 17:13:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MA3PEPF00000404.mail.protection.outlook.com (10.167.241.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 17:13:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 2 Nov
 2026 18:13:38 +0100
Received: from [10.48.86.101] (10.48.86.101) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 2 Nov
 2026 18:13:10 +0100
Message-ID: <6d138e10-343f-4fa4-8886-0480e95fe96b@foss.st.com>
Date: Mon, 2 Nov 2026 18:13:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mmc: mmci: stm32: lock the STM32MP25 delay block
 again before tuning
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Ulf Hansson
	<ulfh@kernel.org>, <linux-mmc@vger.kernel.org>
CC: Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
 <20261031120700.42576-4-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Christophe KERELLO <christophe.kerello@foss.st.com>
In-Reply-To: <20261031120700.42576-4-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000404:EE_|PA2PR10MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6f7c7d-5876-4615-bda8-08df390492e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|11063799006|4143699003|261028144727099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: KgCVyLXMxVI4q25V06Y2mYYeMGC0QNeLdIlPP22UjtuYvndn3EJHW8b/GlSt8YfGPLqQ8PyVtlWFUeWKPf+Xkm6jXoLbJS5sHkHW6ZJb1qxzPY1oWyEpcIT0jM+rjhdOQUHvvjbClxipSnaVnoVDHekWgIeBWxD+EszxZJggHpvhvVF/5OJ83Jo+Vgio+gSLnMpwi97giKPoKJSvSMkGof8/HiBCwNHtK6xwWfAlcEE7X8TOb3mVjxLfXnnxB9VlOMujnutwL2c66wfnxyRZ1QEVlQL/mGOzx25W4sAymnREOIOqzwJ6vL8NOFqvZuCAPJOQqX8YxnkB/gKMs0zV1ruO/zrI5kq8A/ZbR9WGtgbrHSu0Z5z1eOfhvB+/Mj9ixKIKkewvLjrv9ZWPNGYGZMQ2+6awKG026a8MTqNgF6ck2RORs2+3L7zOGq6uXYus5LdI/lvwxLEnIAChBoayMtkmpZ5+tyauofdawSwiPEtHKZ4JSfRs7DeGCsCNpbWQUZedJ6bWHpKxsTHB1/KeC6hC8ywiMnKK468fshr+VVbd3y0v/mLs7FKWfb07qpMszO1Xa6Vm4sdFl34ERZwCa2HdCAPPiWq7nq7A8t9S/RLQZHv82BaWrQIq2OMMBNAFS+QmLQQclp/Yqqy2zU1nxgzxpa2qK8zmKKjF0Ji3mxtHuez+/H3avNG0dsgcDlECOmR2WrrcyPa2laDTnC5xkA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(11063799006)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w9ghKxkG1jusN1e3sqCXd+7mEM7PXCZpmltOmTbOS5trBLmzjX8fyCAuy/CCTRo3kCCAEblFQY6c2G+bcUUXsPTudJmHOnqHl5d1whBiIAwuXsXJ7Bhq9jXbiW9+XohtZiYnxZKzJpVP5m/7Z7Ks95/zewX0ePybtix0FB1B+ZrEVT5nnlGcmGh9iGR/vpoypdABBJcC5kjPsJC+CYI+ayXct5FtbLdH7RsKAA3Vg0/9TSesst68BtJvKuEXQzkw7fGjc4sexX5ltiXdPOOISK5B4qr+aKhoMFqs1NcISzJz3PZ1XsqHHvEKL5udX9ucesntql/UPFslW15MkqggmUKR5aQYFTkXYrCx3BRAwcW7uoqEtfCS4kTSyRL5VbtxNshpHAfJcW22VEChC7/7qEJCVuCLua/TJHCwV3qs/VYmlyLqU6135wkItaRe89fD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:13:11.5909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6f7c7d-5876-4615-bda8-08df390492e4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MA3PEPF00000404.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_091321_442030_9DD8C7CA 
X-CRM114-Status: GOOD (  20.40  )
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

This patch is similar with the one that we have on ST downstream.
mmc: mmci: stm32: release the delay block before enabling it (Commit 
01d3cac)

If it is the case and if you are going to upstream ST downstream source 
code,
do not forget to keep ST signed-off author, please.

Regards,
Christophe Kerello.

On 10/31/26 13:07, Mateusz Nowicki wrote:
> Once locked, the DLL of the delay block follows voltage and temperature
> but not a change of the clock frequency. RM0457 requires the DLL to be
> disabled and locked again after a frequency switch.
>
> sdmmc_dlyb_mp25_enable() only sets EN, so a DLL left enabled by an
> earlier tuning keeps its old lock. On the STM32MP257F-DK eMMC, switching
> from DDR52 to HS200 then made the tuning pick a wrong phase in 9 of 18
> tries. With this change the phase was correct in all 12 tries.
>
> Clear EN and wait for LOCK to drop before enabling the DLL again.
>
> Fixes: b5c3eb385797 ("mmc: mmci: stm32: add delay block support for STM32MP25")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
> ---
>   drivers/mmc/host/mmci_stm32_sdmmc.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index d74efdff6ac2..2310dba75c35 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -541,11 +541,21 @@ static int sdmmc_dlyb_mp15_prepare(struct mmci_host *host)
>   static int sdmmc_dlyb_mp25_enable(struct sdmmc_dlyb *dlyb)
>   {
>   	u32 cr, sr;
> +	int ret;
>   
> +	/*
> +	 * The DLL tracks voltage and temperature but not a frequency switch
> +	 * (RM0457), start the lock sequence again on the current clock
> +	 */
>   	cr = readl_relaxed(dlyb->base + SYSCFG_DLYBSD_CR);
> -	cr |= DLYBSD_CR_EN;
> +	writel_relaxed(cr & ~DLYBSD_CR_EN, dlyb->base + SYSCFG_DLYBSD_CR);
> +	ret = readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
> +					 sr, !(sr & DLYBSD_SR_LOCK), 1,
> +					 DLYBSD_TIMEOUT_1S_IN_US);
> +	if (ret)
> +		return ret;
>   
> -	writel_relaxed(cr, dlyb->base + SYSCFG_DLYBSD_CR);
> +	writel_relaxed(cr | DLYBSD_CR_EN, dlyb->base + SYSCFG_DLYBSD_CR);
>   
>   	return readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
>   					   sr, sr & DLYBSD_SR_LOCK, 1,


