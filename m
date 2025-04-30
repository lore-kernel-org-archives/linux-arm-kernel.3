Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6582BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBKlTwemwh+e4I/kvxdaCupa8Ugf96kR83t9gD8fiug=; b=F4R12mkPbBv56FnhGD1aaNXDTZ
	FZZN7tgB3wJCYnGws7dXI2YBECVT1h3VhgKHS6EjJnAUadDn3nGCoC9oYxq22Hfnoxn0kepAllSWI
	TRTDVIHZHul2/JVuIizcs3+eC5/ZLz/j/TjwgT+vfTjAUKxwTG/c4cMN2QKiIcTzdYXlFJUjTC2na
	bvezYFRPq0bL1/NIlCZ1X6Ee4RUbIdpZtBd1hBleAJcjAcDywW303G/R//2sTyU/TpTdf6yfxz/M+
	6X0mxUhYP3LXpME+Cahic2Z+ohKr1gS9aIyVo5mr5SzXI5tpNJoBdp0gxRWtPZAz4i1KgYjbjwOxD
	L3Sg4FXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8ke-0000000DAss-491W;
	Wed, 30 Apr 2025 14:49:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8ii-0000000DAZU-1TOH;
	Wed, 30 Apr 2025 14:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746024450;
	bh=8Kby3BF9Goa+u8k9qxOdZq2WO9DIL0NJjF87tLz5zeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OF0GYw09mwXW+/AF6xC9bMUzN2ywdOOiQkfxRpk7R8/ttoZhe3IGNKpbP0I4dPMGt
	 ndet0ENHqF4TXoS+vskRGolwyrnEE+FwiwJx1MG2HCdM0wEDZ74Fr8EYp5ejNvviYk
	 Xj+sG6RljlA51qNyywAS8EUJPbhESbF3mpiXL9136kVvjTY3hwgIqyTIVrq18Zscpm
	 xtscdC88iGoNgOSGWgZhOETvcXNajHCCkawE6LQeo/+yj8ATAKNdz7yb6GxlLGT/ZT
	 SMbcr0h651ImCTq9VS1kxyyA0MT3NsdUzgao/YHqRYHPHsMy5Lf0pkdH+Koh/N7Rg9
	 8TSyXPhob+cfQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F7E617E0630;
	Wed, 30 Apr 2025 16:47:29 +0200 (CEST)
Message-ID: <5a99252b-d251-4385-bf53-105262b821a4@collabora.com>
Date: Wed, 30 Apr 2025 16:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_074732_556671_55902C2A 
X-CRM114-Status: UNSURE (   6.75  )
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

Il 28/04/25 16:29, Alexandre Mergnat ha scritto:
> The MT6357 PMIC contains the same RTC as MT6358 which allows to add
> support for it trivially by just complementing the list of compatibles.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


