Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC843CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5HbidgFirZGJdkbKgbbEmMRgzaOKiio1VexjalyUDw=; b=paUDcdOPMnlNX6JtJ/jlBEfEMH
	Ps9H1MmHT/WK/vwbIMlxr0mZJUCWbNyeExnHSk3xkVkhBe1/7CT6OPGBUgVoH1aAgpSQTAwWg8y8R
	7awaSK8eVD14BdtiLnp7klGfgzQpUMM5hZTTC3BqOw/zwC64ViXxnAPiQoBvyQNk3YNYM1G/aqkCM
	qI93A+Pp99hIWxy0EKqDytdXtanZnyNhwb6WMXpoXeABbDkm0LfY6QkhggPBebNQzWsHi7/J1sFNj
	jP/rW4IizBhAtjBFVocFaPm9isPC4q9bLDk+w2PRWWfx2kNzHSWvm8ROOmI3MDceQtT5XL6eWWDFc
	8jvoISBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFzQ-00000005uqf-3Ex0;
	Fri, 08 May 2026 07:51:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFzM-00000005upd-2S5o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A620F6024D;
	Fri,  8 May 2026 07:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D43C2BCB0;
	Fri,  8 May 2026 07:51:07 +0000 (UTC)
Message-ID: <f5158347-3c9f-4c29-bb2f-4beaaca3cd20@tuxon.dev>
Date: Fri, 8 May 2026 10:51:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: change maintainers for macb Ethernet driver
To: nicolas.ferre@microchip.com, theo.lebrun@bootlin.com,
 conor.dooley@microchip.com, netdev@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260507120444.9733-1-nicolas.ferre@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260507120444.9733-1-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 5/7/26 15:04, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> I would like to hand over the macb maintenance to Théo, as I'm unable to
> keep up with the recent flow of patches for this driver. After speaking
> with Claudiu, he indicated that he is in the same position as me.
> To help with this work, Conor has agreed to act as a reviewer.
> 
> I was given responsibility for this driver years ago, and I'm glad to
> see it continue with talented developers.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b105a443dd..ad60104f30a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4181,8 +4181,8 @@ F:	include/uapi/linux/sonet.h
>   F:	net/atm/
>   
>   ATMEL MACB ETHERNET DRIVER
> -M:	Nicolas Ferre <nicolas.ferre@microchip.com>
> -M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +M:	Théo Lebrun <theo.lebrun@bootlin.com>
> +R:	Conor Dooley <conor.dooley@microchip.com>
>   S:	Maintained
>   F:	drivers/net/ethernet/cadence/
>   


