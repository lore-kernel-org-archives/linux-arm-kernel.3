Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4CBD5CCA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Tt0KmwBKy/brL1yb3XRsgRfkqeOXAgFzAXAMIUDuIo=; b=0oyNTMO8p8dM07
	IPEwNBBYoRG6oCG3YuvB0Eb2QwS9sHfYSMLFNJKOZh4tJP5jwrZffIiutPnlp1lZWiOEDYe/faGyx
	FyiDL79v4v1oUdGIWjGqTlqVZaYHtLckK2F8wcBrsYybohMLvjq6eYhVhAu1itaKoXVu/1+qYMYM5
	3GvLX4GPOL4Aur++uQgTCae6bAKgo3ERlG3fY1ph+nR/dJeGQNTDjbm3K1tzZSbkrxnL8JhSvhGZm
	p/uBvbDoeIlocwkG8XCrCXH7wG3rGPxzkA8cc9wJjcQr4cZeLIxFhsNfFlooeajc5bCWbT8LdGKXT
	3aqSjxGYzlYA77VtAQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67zJ-00000000LlU-2Ra7;
	Wed, 30 Oct 2024 12:39:49 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67xX-00000000LTU-0DwF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:38:01 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 48E56A079B;
	Wed, 30 Oct 2024 13:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=8Tt0KmwBKy/brL1yb3XR
	sgRfkqeOXAgFzAXAMIUDuIo=; b=rkhoYq2wiq4yOyIxugIPnDQW7aGSusB4MJ0a
	xclfnc9qmJznHvVOCoGxDo0tnsBUN+tzP0LSdPu7pxb3MZYONMDalqyW5xp1U8zT
	PBvbDSEMtsNKzQFxN7BwuXVo7w8fKYJOQ18DLQB1I8g0ilSBw6WdBx2e6pXkAdiB
	HhzVhFEFY6zIhcCpJfWAgEwQgsOQMKaevpBOdPtY0tRsHG6yqiA7q/QCa6cuuCzG
	P8xxL1GQprsVm9EKum/mygh3rmVOn/n4JPcsZ7ZyuQ7y/4RA59JIzWeKQmiWcoE5
	01z3zhRWo29sTOiJAY5O8o3Rx0ZMgSGLiLCrB2TJdustAYMQLk0OHzDItwIEdFs2
	lnwglRaSDgd2QR9XMLy2n1Tnid9G5JKV15DBg3OgNh3YTooChMhtGasuZIVJOIyw
	ntxUW0povSR6nAriqFgfLDGxn2fYioVdsyUiw/5eXjBlrtmqZ+E0umteQkMiwzbx
	tG0jCj7/nmTjzb6LvIq4nBrZqT9CEsqfwpvd1N/NLnkwtNXEblJzo0kf7o3LpKfX
	tWGbUtIb2jqKCMf3C7yCK72Li/sKb++2Mkf9qfp91Q6WgntSk6LWDkLIrIyCQ3mt
	Zn4N/UF2CsOvBTVliC4jHP2x1RQoJemF5Wp8y8qgzeodwaGZDgNofyTeOlYEyEEp
	VL48g0U=
Message-ID: <2b310b54-c215-40fa-b6d4-81faf75a8c9e@prolan.hu>
Date: Wed, 30 Oct 2024 13:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: atmel-quadspi: Create `atmel_qspi_ops` to support
 newer SoC families
To: Tudor Ambarus <tudor.ambarus@linaro.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241030084445.2438750-1-csokas.bence@prolan.hu>
 <7cc95e52-7509-44eb-8e30-d518283e7d87@linaro.org>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <7cc95e52-7509-44eb-8e30-d518283e7d87@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_053759_592777_81D6058C 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: Varshini Rajendran <varshini.rajendran@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 2024. 10. 30. 12:09, Tudor Ambarus wrote:
> I think it's fine to split sama7g5 addition in smaller steps. But please
> add the sama7g5 support in the same patch set, otherwise this patch
> doesn't make sense on its own.

Well, actually, we're using SAMA5D2. My goal was just to somewhat 
harmonize upstream with the vendor kernel so that we may contribute 
other patches that we have made on top of the latter, or in the future, 
take patches from upstream and apply it to our vendor kernel-based tree. 
This patch was only meant to lay the groundworks for future SAMA7G5 
support. I can of course send the "other half" of the original patch if 
needed, but I wouldn't want it to hold up this refactor.

> Also, if you think you significantly changed the code of authors, I
> think it's fine to overwrite the authorship. Otherwise, try to keep the
> authorship and specify your contributions above your S-o-b tag.

I don't know if it counts as "significantly changed", I split out parts 
of a patch that were relevant for our device, and made small adjustments 
to make it correctly apply to master. I didn't find a descriptive enough 
tag for this, so I just went with Cc:, but if so desired, I could change 
it to a S-o-b, Co-authored-by, Suggested-by etc.

Bence


