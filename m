Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75DCCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJwvIz+HhrzUxKyrcTxXxRafTJDd5E3q7us53UbHkNM=; b=L6TGUJhd56+RF1eMiYiXFmdxa8
	KrD+f8rErA/91Qn0CYZ5/SW2ecTwFEOxwhyxQEm1/+sxvsEJMc/xg+ArMLb+5LfZtmV7zZYRlGP6Y
	l6xXgSTq3DLqSyj9hr9zmENeDrrjUtC5SErl+DNPk5591g2snP7IRXhoYS7noi2cyhB8Mum97prE9
	KR7VT966oG2IAFli+dEdBjATC3k3rXNUqhCMOFj1y51lYZBpu72ljh27FyYeHmYXMZvzEUM1+KJZP
	uplCWe0S7L9HtRTdtLu/pYcBb+XXkIJ9vkEU8uZe/5Q1gAIc9z5Q5SMuTSpcxZUW5Be+XLhjcD0DL
	vHWz3fjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoez-0000000ApGj-2olB;
	Wed, 17 Sep 2025 09:41:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoes-0000000ApDX-37Nt;
	Wed, 17 Sep 2025 09:41:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758102060;
	bh=yiTw2Nyg3T/+NeQdCbVD+R8TqqELRHWmLB+xAh+cjrM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CK3wcRbPkUm/RD5cSFPvZM85dvFTYOF3yu5E7DFatwJfUPDGPSfA9ptmYukX9piJx
	 ZBN8sTreTr5vm4js3HyQnoK5Wdyfvq+hWQNVp4gPIPDESkAzdLv7sFsMjD1dMKnkd3
	 /xr8GCfR3FiLA3+OadvuT6qMvGSsNmjhCSsyrwHyYfJyVl22Qo7GFPFIxOrTfY7Sqp
	 nKVYfMTFLW4oODubiq+pC4GgWqwa7/JFkrivm0sgSXqUru1yF93QI+2+EQuULIdBvc
	 3zhuk7kjqnMNw86+kyltd7H192mXMLr+/BVXjz2nIUfardinEdVPcPNKjqRwrI+/lj
	 xNgaeYiCaGW8g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E6A5017E0202;
	Wed, 17 Sep 2025 11:40:59 +0200 (CEST)
Message-ID: <eb2b4c98-44b1-4e9a-8e6a-1bc19b42eaf5@collabora.com>
Date: Wed, 17 Sep 2025 11:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] pmdomain: mediatek: Add power domain driver for
 MT8189 SoC
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Qiqi Wang <qiqi.wang@mediatek.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20250912120508.3180067-1-irving-ch.lin@mediatek.com>
 <20250912120508.3180067-5-irving-ch.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250912120508.3180067-5-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_024102_943899_7DA9835D 
X-CRM114-Status: GOOD (  11.55  )
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

Il 12/09/25 14:04, irving.ch.lin ha scritto:
> From: Irving-ch Lin <irving-ch.lin@mediatek.com>
> 
> Introduce a new power domain (pmd) driver for the MediaTek mt8189 SoC.
> This driver ports and refines the power domain framework, dividing
> hardware blocks (CPU, GPU, peripherals, etc.) into independent power
> domains for precise and energy-efficient power management.
> 
> Signed-off-by: Irving-ch Lin <irving-ch.lin@mediatek.com>

No. This driver is legacy and shall not be used for new platforms.

Please integrate the MT8189 CMOS in mtk-pm-domains instead.

Regards,
Angelo

> ---
>   drivers/pmdomain/mediatek/mt8189-scpsys.h |  75 ++
>   drivers/pmdomain/mediatek/mtk-scpsys.c    | 967 +++++++++++++++++++++-
>   2 files changed, 999 insertions(+), 43 deletions(-)
>   create mode 100644 drivers/pmdomain/mediatek/mt8189-scpsys.h
> 

