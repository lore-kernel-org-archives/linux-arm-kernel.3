Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AD3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiVJU8vpI1AzUUyUc/XPlRSfdp4+hku0cXCtyGPLMbc=; b=FLQ3TWl1SGoI5M96th9Cnwv6Vh
	J3Q9T4BGGe4ufo017nKD5Ck2AfQFWqkd0WIfvzjLWHI9ME9gF0xnGzZ4hAmYkmZ5xsKDq42KSAALm
	e9HEk9BNgvsOhSP1lDKtNtjhLOHvvMMUg6vRu3KnKiXANsAFiv0EkT33zAivlLeq3pBtzlYdhixH6
	XuDy8M89cnn7rH8vmf5+Seja/cPhKAv8NmtbkkwH8xa/FP59J5LCq+FZ0sRBdKI9pXUC5Liof+5SG
	st59qYtmNoEZsYD4DiXiWr+8uniJr4iIHdWnBRSLV3y4fWyfC+g27RRxU9VzuTOhFv0b//vxoFoVR
	CjpPCU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHrX-00000007sU2-4Au5;
	Wed, 12 Mar 2025 08:54:51 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHpt-00000007sIq-2628
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 08:53:11 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 15D44A0899;
	Wed, 12 Mar 2025 09:53:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=JiVJU8vpI1AzUUyUc/XP
	lRSfdp4+hku0cXCtyGPLMbc=; b=cA6WoRrI5U/yz2OLyFMpnhEGEovu6aQOMXxI
	lC941G06oI+Ls70GNgzE+ffCn8elNqqxlZR3+iUQS4tpVKCvhMfQ1ENdyVEOifEt
	bMn5myL3EPV8r84zIqOmf9sSz7GjzTOMIF11UOP7kGdktJNpljs/bAdAqU8VIvi+
	roFFmXrxTu9HgVqEm2GMNxOVbNwzcULdVaVwq6jbaxxZuKUJkufQhABm5R91cTxA
	wv/fz7qla5xz0uVEpKrRgjmCXDCT6CLQIUwOYsrxuT8H8IHDxzAFcibcYbuCkqY3
	BmXZcS+hXgMMDxM2cLzobcIkPbbttuaO5/vCeX8JW4O6iNGWa3WHOTKBr5KpxHvU
	1IeFLBNlKJ7Nm7/B0XVaahEV+WaeLDzlLPQV+0BRgye1wiZ5LgZCR5P6jXX7Cqrj
	GFAHOhW0QijeuVcGZd/bW0nGxL3rV6/LAQzqM2rCrTxeGSbfX+SNVYAbLoEL+Fam
	PMDhhqFl8/JAfmKnungDQEW4CL0RH6JPUCwokGcMUBc4bWpQ3goGfNAyoD+fmlTc
	VnkQ4stbUT5i65GtQZyAr6GEmZSYAPaALHAWlSeK0vKy0qemFv/kLS575KZM1/s7
	vt/x0nkNsnkQdOn4SC9+WRpvg2vq77GKIvKk+pSbPBUhsPlaC/Dy/MUgopvD3Anu
	wzbdQ2U=
Message-ID: <81f87d39-d3f8-4b6a-91cb-b0177d34171b@prolan.hu>
Date: Wed, 12 Mar 2025 09:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dma-engine: sun4i: Use devm functions in probe()
To: Markus Elfring <Markus.Elfring@web.de>, <dmaengine@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
CC: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250311180254.149484-1-csokas.bence@prolan.hu>
 <885ceb3e-d6c6-4e7b-a3b6-585d2d110ccf@web.de>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <885ceb3e-d6c6-4e7b-a3b6-585d2d110ccf@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852627362
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_015309_996731_976966F7 
X-CRM114-Status: UNSURE (   9.40  )
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

Dear Markus,

On 2025. 03. 11. 20:33, Markus Elfring wrote:
 >> Clean up error handling by using devm functions
 >> and dev_err_probe(). This should make it easier
 > …
 >
 > You may occasionally put more than 47 characters into text lines
 > of such a change description.

It was an old patch I hadn't yet reformatted to 75 cols. I used 50-60 
cols before, because my mail client's preview panel is very narrow, so 
anything more than ~65 characters will wrap. If there will be a v5, I'll 
reformat it to 75 cols as well, as per the style guidelines.

> How good does such a change combination fit to the patch requirement
> according to separation of concerns?
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14-rc6#n81

It is a general refactor patch, it shouldn't change any functionality. I 
could split it to one part introducing `devm_clk_get_enabled()` and the 
other `dmaenginem_async_device_register()`, but I don't feel that to be 
necessary, nor does it bring any advantages I believe.

> Regards,
> Markus

Bence


