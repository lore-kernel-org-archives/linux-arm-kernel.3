Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F1AE9B361
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Guu5xxL90HTSu/oVrePUtkjHXxu31Oicp6v/n9zPze8=; b=z5geaBGJSqZKgJUhr6tlsUEKYx
	d1evnCjhVQIDIYpx6ZBiojRd1yf4e/BBOMj0zOoFmpgokmtvHXX6Hd7R/sdvHnYRdGOwz6NEQqToP
	Rt5O4soMXV2LC50Ao+op1L7KjYTY5Vx1/8jVEAgQbU9C784ErcRK5HGtBg8ie/oLyVGodRJ03qOYJ
	ebZ3X8VrBzUVBcuHf+IhRAeP/nCcUv/4zqZyDLnlU3znIB1R1Lt3Ovy1Q8Eo4npXa9iub9o+NJ4hb
	kd5FqMYhyjuzbLBurfUmPUmYo+VhzYIw6IPQMTTdptE2kbXN44dMeXRcl0QyIVfwYL2qOq736bndU
	PsVW/2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0nk-0000000Cjqx-1Ugp;
	Mon, 02 Mar 2026 10:47:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0nh-0000000CjpL-1gTy;
	Mon, 02 Mar 2026 10:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772448413;
	bh=7aN20OVVEoXV/61pR66Bp3BcXzzUo9s9PuSf/BuulD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cBt5YerpgvE/q12nVvdCP1iW+ATX7GgIFeRKGhpGdFLn8hU2fWKHynJruhvxx4syh
	 0yUsurxFdpVKCsmTpZ7dOINLrL6vOjXh2EJpp0fJ0INK3QyiaWy8Lk4867hVaWjoCA
	 TDQzMtUEzfYNh4VuUkfqjMlrhERGeiKNW2vZENX/JRUP1sbOle6Hfr1yxy9wt1DA8l
	 0kUky+p2SlfPaJME8pDjj5racIILa2gVaEO7YFwesz+inKD3kQlz5PHEupQ+ho1zwO
	 ycl77hqB6su8NccOSr22CvfDNG5EOP+Tjil1rKacK1c2ZyE2Y0axiHHw/AEajIliv7
	 uzCJVjLYSHuDQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 44F4017E0251;
	Mon,  2 Mar 2026 11:46:53 +0100 (CET)
Message-ID: <0eaf2427-af8f-4376-8bce-60be800c4a98@collabora.com>
Date: Mon, 2 Mar 2026 11:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: mt6397: Properly fix CID of MT6328, MT6331 and
 MT6332
To: Akari Tsuyukusa <akkun11.open@gmail.com>, lee@kernel.org
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 y.oudjana@protonmail.com
References: <20260228190820.357538-1-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260228190820.357538-1-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_024657_603459_0FD61496 
X-CRM114-Status: GOOD (  10.47  )
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

Il 28/02/26 20:08, Akari Tsuyukusa ha scritto:
> CIDs set for MT6328, MT6331 and MT6332 are not appropriate.
> Many Android downstream kernels define CID as below,
> 
> MT6328:
> 
>      #define PMIC6328_E1_CID_CODE    0x2810
>      #define PMIC6328_E2_CID_CODE    0x2820
>      #define PMIC6328_E3_CID_CODE    0x2830
> 
> MT6331/MT6332:
> 
>      #define PMIC6331_E1_CID_CODE    0x3110
>      #define PMIC6331_E2_CID_CODE    0x3120
>      #define PMIC6331_E3_CID_CODE    0x3130
> 
>      #define PMIC6332_E1_CID_CODE    0x3210
>      #define PMIC6332_E2_CID_CODE    0x3220
>      #define PMIC6332_E3_CID_CODE    0x3230
> 
> The current configuration incorrectly uses the revision code as the CID.
> Therefore, the driver cannot detect the same PMIC of different revisions.
> (E1/E2 for MT6328, E1/E3 for MT6331/MT6332)
> Based on these, the CID of MT6328, MT6331 and MT6332 should be corrected.
> 
> Additionally, the incorrect MT6331/MT6332 CID overlaps with the MT6320's
> actual CID:
> 
>      #define PMIC6320_E1_CID_CODE    0x1020
>      #define PMIC6320_E2_CID_CODE    0x2020
> 
> This causes a conflict in the switch-case statement of mt6397-irq.c,
> this prevents adding support for MT6320.
> 
> Link: https://github.com/parthibx24/android_kernel_mediatek_k35/blob/4853d1fd9e40563573fa6d6b32b75d571a95e2b7/drivers/misc/mediatek/power/mt6735/pmic.h#L10-L12
> Link: https://github.com/meizuosc/m75/blob/80ef1d26c5d73e131d064138ed09ff5a2be2bed8/mediatek/platform/mt6595/kernel/core/include/mach/pmic_mt6331_6332_sw.h#L9-L15
> Link: https://github.com/toffyjan/android_Ticwatch_S_mooneye/blob/4f2a73b26f3821afc452cdce660cdbc73daf4e4a/arch/arm/mach-mt2601/include/mach/pmic_mt6320_sw.h#L29-L30

Please remove these links, these will be invalid in a few months, so they are
irrelevant.

> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Anyway:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

