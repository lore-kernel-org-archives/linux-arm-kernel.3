Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDACACDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb/0L+XWevZKmJgu62aG/pLlK7I7Cy/I4R4hq95xPRg=; b=t0lB79YZNsK+0EVTtYyW2osi4h
	XJ/XkMrj0qRNpA/OiAsH9GNUC2UxNzLkJE4KX+cYfnp7vQ0dBbO7icc7wixWCjAbX8aPtPiqaBmxD
	MLngotajp7wtIWllY81PxRg//hOpAA4vk7hBOdX2Due7/BhWNUWC0w2dhO/uSk5bdGPqcxnltj91F
	aXENccFzCHhwEbG3xNRSpfnrHYioDouy2KSjUYeYwBwkGCTaRrYTRZO5j6x/lAsEICFg57LJ3KkQQ
	uAZ337D15ah4rpIwcYYEs+uiXSOJ3y1SHPTJ1HeIJFHfqpWEMF0MfAnfwTMJH710Y2TAkeOztLyle
	cFylQFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw9b-00000005saD-1zRe;
	Tue, 23 Jun 2026 08:06:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw9Y-00000005sZ4-2KHd;
	Tue, 23 Jun 2026 08:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782201997;
	bh=CFLoo+JElQcgGHIJ+5atyHGSTdHrRYHY0TXbGVskXGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ATvV7J3PTiZSoi1eS2Z0yf2PLjDqV+7SoTJH2wfImUJxkhPq9Mt6uh5KaKTYMpil8
	 EX2II1oU//x4nZgLUJot2ljtla8+/IJDMG0jypRnQDgN7cqk6g6e4nRMw+ulk2V67/
	 i42quZxP9GleHrukZo+loXRmxHOmE2MtnkhWWY2dJ5X9bGIMoLm033l10nxS/qwkoG
	 1vJfRl4HvceYfi5bGNEUGqmw1AJSbSNVo4et+8w/Mh13hA3jDcpGPIZMfv8H2NWO7g
	 4Ids1AOXreutLps+CXnaDBAv1ScEPR+K9oRBuNkxRzoRt3Abvf9yNOpfGdnSavP48x
	 KBlwfOwPgANsw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B91AE17E023C;
	Tue, 23 Jun 2026 10:06:36 +0200 (CEST)
Message-ID: <74f3eec2-278a-417e-b2af-42cb4c38fa94@collabora.com>
Date: Tue, 23 Jun 2026 10:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pmdomain: mediatek: Enable module support for
 mtk-scpsys
To: Justin Yeh <justin.yeh@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260603051200.1163226-1-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260603051200.1163226-1-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_010640_792283_AA72544B 
X-CRM114-Status: GOOD (  21.10  )
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

On 6/3/26 07:11, Justin Yeh wrote:
> This series enables the MTK_SCPSYS driver to be built as a loadable
> module for GKI (Generic Kernel Image) compliance.
> 
> This series depends on the following patches currently under review:
>    - soc: mediatek: Allow MTK_INFRACFG to be built as module
>    - soc: mediatek: mtk-infracfg: Export symbols for DDK modules
> 
> The MTK_SCPSYS driver depends on MTK_INFRACFG being available as a
> module, which is enabled by these prerequisite patches.
> 
> Patch 1 converts the Kconfig option from bool to tristate, allowing
> the driver to be built as either built-in or as a module.
> 
> Patch 2 adds MODULE_DESCRIPTION() and converts to module_platform_driver()
> to complete the modularization and silence modpost warnings.
> 
> Together these changes allow the MediaTek SCPSYS power domain driver
> to support modern Android GKI/vendor_dlkm module loading requirements
> while maintaining backward compatibility with the traditional built-in
> configuration.
> 

The mtk-scpsys driver should disappear, really.
This is something that was rewritten entirely and is called mtk-pm-domains now.

This driver still contains support for some very old SoCs that were not migrated
to the new mtk-pm-domains driver, but seriously, the strategy here should be to
migrate those and let the mtk-scpsys driver be there just as a legacy one to not
break the ABI for older devicetrees.

Converting this as a module is probably a bad idea, because this one didn't get
any real update for years now, and I'm not sure what is going to break by doing
so - neither I have any way of testing it.

I can say Reviewed-by if you can test booting MT2701, MT2712, MT7622, MT7623A
(all of them, really) on a build that has this driver as module and check that
all functionality is ok... but I guess you may also have difficulties in doing
that (do you even have access to old devices with those SoCs?).

Cheers,
Angelo

> Justin Yeh (2):
>    pmdomain: mediatek: Convert MTK_SCPSYS to tristate
>    pmdomain: mediatek: Add MODULE_DESCRIPTION to mtk-scpsys
> 
>   drivers/pmdomain/mediatek/Kconfig      | 2 +-
>   drivers/pmdomain/mediatek/mtk-scpsys.c | 5 ++++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 


