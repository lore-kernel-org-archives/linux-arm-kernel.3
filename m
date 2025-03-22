Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB07DC36007
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJwyQZqQD7T0LNy/jNqtjEdi05XKrLYNz0P7sIGRcMk=; b=F1uAwMdHEbe3shs8RKojNsZcnl
	gbgMV6QnR6u9q/aeLg9OlBbaadE35Rg8zswg33z5EQvqH+dUPuMJFiBj29OiA32E1DNYI1j9IW31o
	znRKSH9EJWEdDxHks6mCwDoXV4+aTKbFczsAus3MD6taHjIpabXtIL5owH+RG+zqAsRhYL2Q+tKt4
	WTwESVit3QCz+UWRQhUj3nN8VqEgLBMwU0elNQPR0fb6EvLUN3VwzRu8cyyikfiap/GWBaD0KA03F
	RcOsxgbpAQ0UhRmOoyOK9/LDFho/K3NB1rcaDXEtmrKnmkp4Ip6AlabafODIZIs5i+4M0c5jJOApw
	hKYzvNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw3t8-00000000CAC-0zqX;
	Sat, 22 Mar 2025 18:48:06 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw3rQ-00000000C1y-3e4X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 18:46:22 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id EDFABA0B56;
	Sat, 22 Mar 2025 19:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=AJwyQZqQD7T0LNy/jNqt
	jEdi05XKrLYNz0P7sIGRcMk=; b=a+T+Fgr09LxUJ1fxDW1n68PwmVU3ys2hBi0y
	1nDhgl0ZOIi9Oip+CEGUgxV2tO1tAAFGpnLCptDS5wm/iABRf/4ig6Occ3VfRElN
	gCW8X2hrGqLE6KKEJL1Y9ZyLpZvu7sZ6MsJGwGEfKoDKqrJyWMSL1uNoTko3mAuD
	hpgDKE7XHVqLytxg0mjyW2/Hpqm5JgINDbeJuijIP9F+DaM3ZP0dAbHskkeMZpNy
	wntY5yJ8aOvKzBitlZMi7yfJgYm481G//ohbbJsAx90VxTaB2YWKntUTzyDiFXMc
	75Xx2LhpCV8w3/57eqqgVUDa0GvWc3/ucLwZYmk8zYECyd8odunmAgYTB/WnquON
	X0XXdS8YHXvnU/h5CdM45gvlV649/G4Jfkyt8OYgoxEqHN1JhZWtiVZc0I4/WA7Q
	EUZYLEuD6SOAkeEgllcVGSLLWJdv0LqYP8MCKVZGcZI7o/XV6bZySK0Jqa/RXdhj
	K3z/x1sdwTxYldAGaie64gmfIt+5TgVLBeTB05aGAV6ruEpufGL20hIVal+baf2w
	EgeqWn2O1MLX2om02x6AORQcd/KJu+hB0jYi138yWSEBYw0IjNkw4+WyV9AfG31L
	Pcdsryu+qP2Gs10+5GvXntguEo9+M4HKCdsB0fe5L6rU0fddknQrQqKe+9EtjrEv
	O05C9GQ=
Message-ID: <f0a82f7a-806e-4dde-a870-f5d76df61984@prolan.hu>
Date: Sat, 22 Mar 2025 19:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dma-engine: sun4i: Use devm functions in probe()
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Vinod Koul <vkoul@kernel.org>, Samuel Holland
	<samuel@sholland.org>, Markus Elfring <Markus.Elfring@web.de>
References: <20250311180254.149484-1-csokas.bence@prolan.hu>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250311180254.149484-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.2]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526D7266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_114621_370318_20395057 
X-CRM114-Status: UNSURE (   8.13  )
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

Hi all,

On 2025. 03. 11. 19:02, Bence Csókás wrote:
> Clean up error handling by using devm functions
> and dev_err_probe(). This should make it easier
> to add new code, as we can eliminate the "goto
> ladder" in probe().
> 
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

So, will this be merged for the MW of 6.15? I just looked at the history 
of this patch, and there haven't been any major changes since v1, which 
was sent on 8 Dec last year. Despite this, it didn't make it into 6.14, 
probably because it was forgot amid the MW rush, so now I'm anxious as 
to whether it will happen again.

Bence


