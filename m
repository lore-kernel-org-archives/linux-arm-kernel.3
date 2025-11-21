Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4ECCFC271
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpnWZCJ+UZQ/NmKgEpa1Tyv0B8JmGxLNJ1285TYS5jY=; b=StCVsYhbQieeUae8FV5N6bdaNC
	aw6ZM5OKGBzTcO4YkVMbBFhfgLQQPEmGhKZgHoIKEjzbMuRLsukSyj/9ptuarbMyZDHjwn9e1fb4U
	bdLskJgkO8yrCj5Vg9OQTRIz+cHJSGczbSnPwvJhf8LIgVrxfB04yg/MZ1XCIDIDI2CnuH7lGomtR
	oGVOkmSfcdIawhhxem7lpJMvHUkauWpNR0MKMDMhj0aHOThYN9rd8EswVH965Pdoi4zhqFFNEuH9i
	KpusVYik/WzsWV/dCY0s6iAyKQuEK2nLr36j+/U8Fx7pNFpUGHhSb2YvXzczEmNp+68DVK/k7S8px
	YdIcQXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQkj-00000008NpY-1kTU;
	Fri, 21 Nov 2025 13:00:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQkc-00000008Nms-3rbk;
	Fri, 21 Nov 2025 13:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763730031;
	bh=0q8lJac2Ro37pgatCsRo9rk/Wt2xs8etD7oACwU8Mys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dc2UOHltPreccS0EiGGniBIQW6xWYGJxrfyhCSrXwW74ZlRGLfE+O9Ih23ROR8OFY
	 Os+4946W9zkMljD9lCB9N47w4I+saTyhg2wUAHzAImN29OrOZwS/KgL2EttQ9iRrpG
	 kr8KeKUXlU+MU09OiNoMZDF/lRHQvydHCcrvQ73aiWaCbrsq4UrPUMwj07TI2P549L
	 r9XOYL1Hjmdbs7hgOuyA0JUj6gIOexz8AqzMybOxRqIG+g+l2CmGRxBWjFyp0oxcJL
	 TepJ8p4SZO+XOrwmE7NquSAsH7mWYe0nAvDHDeuJ8Hi60fQ0TZMM5vzVtPiGziSjdM
	 wSaWfRY9ukSzg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF3FC17E12D2;
	Fri, 21 Nov 2025 14:00:30 +0100 (CET)
Message-ID: <84571de3-27c4-4448-a3fc-b937d175de29@collabora.com>
Date: Fri, 21 Nov 2025 14:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] thermal: mediatek: lvts: Add platform ops to
 support alternative conversion logic
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 wenst@chromium.org, fshao@chromium.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
 <20251121-mt8196-lvts-v4-v4-4-357f955a3176@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251121-mt8196-lvts-v4-v4-4-357f955a3176@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_050035_139839_E3B26C46 
X-CRM114-Status: UNSURE (   7.33  )
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

Il 21/11/25 12:16, Laura Nao ha scritto:
> Introduce lvts_platform_ops struct to support SoC-specific versions of
> lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.
> 
> This is in preparation for supporting SoCs like MT8196/MT6991, which
> require a different lvts_temp_to_raw() implementation.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



