Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D695606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kcjcYeAU;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Z64VXJLu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xyJCK9M6Spjp8gnfvdLjaOCM4a7JNCEx5yYqmNy6PN8=; b=kcjcYeAUA910gu
	yVbgN3sXvchBsIuC2s3cIgq87dadwFfudsTDGjG7Qy3VIUgO8d1yz8qowBrOiUWrkHhmVK7WMrGNE
	+hV7T8AlpYSTN1EDMPJDgQ3UPvbSmsS+OwZLXBAelooc839AYdn/nC13j64xGQXDYlZgtwZ/qegmG
	rx+M0XsWQTinHNtt4Vj64wmuh4iWfyG2lx6Ly+nbqJ3n5mdpqG6/igBmMvPMLOntrF0IBszIy4sTk
	gKw95cTsiIXsJM+VTqe/8eipl1NgP7bbYR+GaOkyZkQEKXuue2zY1G++Y527hmKMDieixyIN6bXxR
	YdPBS4KRl+xih1HESeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Qj-00000007KHb-1xih;
	Wed, 28 Oct 2026 15:19:09 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Qe-00000007KGI-2P2n;
	Wed, 28 Oct 2026 15:19:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZThiIFaLbBJF0d/pjycQkTX8sFgMfGVBA5qDsNznQvKBLAJrIfYh3elGzC7/FEba3nqWx9pGHjlaUKjFliY+IYtNut1srwB3uDgiRr/wMtCX4OkvSqIpPFebmqOSP50JF9c/XVekipD9N252uCwQSQLs4kfeCciU/xSDh8Rfo7YOvjB3f2I8rd5Dv7xz6ccsYz3QM6tv1pq+SupJ+k9ZtwFYdLeWwXutexbLQgPK+fDszCWJchMA+WEjPHRCikP+KbTWkrr7DRR6zoXqmIUlueinlIwVNpku4Mdq4N3B+5NYI18t2A8KxHtHjQ/RfQ1MvW6lYPk50xA7AYHv3kFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyJCK9M6Spjp8gnfvdLjaOCM4a7JNCEx5yYqmNy6PN8=;
 b=TwnOvgxcu2vXH4L4fxkwrfVMdxvs19bSuruhpJYbBA4bFa9+pP1fbc6/YWew516iRXuwpbHzQnYbAkOSe1BscrtbG42m0BsZeUusnyIeL8y/kOLulY2bzkeAY3j2w9klMgCWZJ+OiaWYN9Xqp/O5orQLuvK1MmVcRoECrLDFNRLO9i4EXAuzt8gAraYdFDakknjMM5FQXLmuuCSBiKVI8cKuegSm0gvXxEamAI+SIgBx0EhCF5P6N4UUcCR03WRONyKHS9OIIV+irPhrbHR43HKotN2IXkVfHts9tcCkuE/XHw8XzsZX2zFMddf+YJ1KHwiJKUwCPTjd/maNpD0f5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyJCK9M6Spjp8gnfvdLjaOCM4a7JNCEx5yYqmNy6PN8=;
 b=Z64VXJLudHoIMlwz55FvlfYIh1tZIHbDwxCtuJ/P4r0W/2N/u9EHcl764kmkX+6cm9RCmqyH7npm6s6LAYUCZMyOyK9R6ZqNb5eDaGBlsAuMxMMOhWHYH8Wd6F/2/ZLiQCTH74/+mw1QeZXvdqfUskpwm0cBNq+kvi02su6sN+I5ipE7nQvjbEeUojRaWqTdi6qTqxJAfBTlObcHszWGUWqKT8nvbHaC6/jU1SjnqhMAVvXMnTTPEFgL7Ictcf0O/HtsJWbkAdzgsgfzxrSO9R5IgqAj6rGF7IDLgokR20/oG8oA6pow9M8HFvxMg5xFoPn+tRs1tYcwZItqt/0tvw==
Received: from PR3PR09CA0030.eurprd09.prod.outlook.com (2603:10a6:102:b7::35)
 by PRAPR10MB5397.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:291::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.7; Wed, 28 Oct
 2026 15:18:46 +0000
Received: from AM7PEPF00000055.EURPRD83.prod.outlook.com
 (2603:10a6:102:b7:cafe::70) by PR3PR09CA0030.outlook.office365.com
 (2603:10a6:102:b7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 15:18:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM7PEPF00000055.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Wed, 28 Oct 2026 15:18:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 28 Oct
 2026 16:19:10 +0100
Received: from [10.252.15.158] (10.252.15.158) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 28 Oct
 2026 16:18:43 +0100
Message-ID: <df9709e5-9923-4657-8cd3-fb767cc1c628@foss.st.com>
Date: Wed, 28 Oct 2026 16:18:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
To: James Hilliard <james.hilliard1@gmail.com>, Sean Wang
	<sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
	<Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Jacky Huang
	<ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, "Scott
 Branden" <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Zhou Wang
	<wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, "Andy
 Shevchenko" <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
	"Binbin Zhou" <zhoubinbin@loongson.cn>, Taichi Sugaya
	<sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>, "Masami Hiramatsu" <mhiramat@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rpi-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Frank Li
	<Frank.li@oss.nxp.com>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000055:EE_|PRAPR10MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: a871d6c0-2c87-41eb-5d89-08df3506c267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|36860700016|376014|82310400026|921020|4143699003|56012099006|11063799006|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /1V2FXsM5ne7+5M4vbr3Q8GFrnYcwnmMfaExjFZ4KB35H3Bt+0MCJO9ETkX1ZWXiz83z9pUJzoKz2BsTPpnfF+iLsfoKJyIxVu5PsGanum02Yv4wF3HBcv2z0INzRBEKJjwyxGOG9PQ9b8cGk77rLSWCxwLSjyaEoX2EeAFAauIjQGxad4seZsKgAOAZt2VV8ZJkhTcywbO9ZZjmQyG12qJ+3VnwO7E+ZTZyqWURsEWVNKTEzk5vix91DlIKJqYDTHdw5J1sl9+BHeso84DC8oGFkRa5FKsOgvvKumk/WinChnXIRhM+EbSQNyv7USP6+8+IzJ143RuKIWoQQIEasENtc1zNugag1YI+IHs/RlYl9kvrCfk0gXlxjelr6YkRaLN/Hf/c7AX74+s92Cv7T+3mlPSiJT9elzIEd6Kqb9uaY+zf5d6C/uolUMMYI7BJdSoiZwD+HEl2hiWrF5tdCSXOPN0IhwoBGlwmXa5QF/0raX1+NU9WyZnxSKVXSZHmOOk9x0vpT0KeosMiPhDhU4vVCxmesaa5Xnmafyq5WZXcuniVBwhxXKNvA+IatscI9wd1cKbibqBPwRlzAUokNF0LN5KnKHmmc4UkIKnIiHeQk3B23DakxyeLKw/O1VnqtkYXWDWq6lNzK5qD020kl6lux+s4gPw4s2u/GCpO6eN+2vZ7aSrv7VYI2GzedxrKQMNXbmben74Csk0CfdqVCI/7tPxmMx3ZdHTG4yiO1r1PqioAQOu1K75ukW1UKwPI
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(36860700016)(376014)(82310400026)(921020)(4143699003)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PsHFW7ZAVZYZrf1X9VX42gZu30dSrSv2yD/56BMJQac7geQqEtDIaEWxpnI/sY2B+CfQ2E2NeYpRYcsiY0vKMz620DKPAS8f6SiulMvK4Swu+tdv/uoDMwFfb7PcplkqvtHTf6GK0zXG7zRy4A8j/ehLLmq1lKHeOVo6C9RfjlaQtcsQKPhE7ikddAH/jj3rDS3k1kzBzo7Z7buWdZISMJrwl7xpbgHk2ImwocYwWgzcO5Vytege6h2w5Rw2yQ9jdhYbqT94d46niNBtIv4MeL1N4JG2QPMURhqLh37c6S9GFy4YqV3/tBKHIwlsCR63ME8+kcAiuFdCwC/VxXaQW1osNdLGg0WFntjhWJYeSoFn7+XiTNKiIJWc9CSDDOvhypk4mkxEZRXiz9lbfkjZjiQSTFyC0MckF1d2QFIXpp4IJD0EP/AgOGGrczPEGqTq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:18:45.7033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a871d6c0-2c87-41eb-5d89-08df3506c267
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7PEPF00000055.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_081904_954389_1F6C5977 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/26 19:22, James Hilliard wrote:
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
> 
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
> 
> Suggested-by: Frank Li<Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard<james.hilliard1@gmail.com>
> ---
>   drivers/dma/stm32/stm32-dma.c                  |  9 +--------
>   drivers/dma/stm32/stm32-dma3.c                 |  9 +--------
>   drivers/dma/stm32/stm32-mdma.c                 |  9 +--------
>   drivers/dma/virt-dma.h                         | 15 +++++++++++++++

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com> # stm32, virt-dma

Regards,
Amelie

