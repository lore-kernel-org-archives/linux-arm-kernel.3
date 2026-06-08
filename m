Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C54CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbSbELZ/qhJGz8m9PkFP4eZM/CFetLN6lwudktuynGY=; b=oifDfTkbkfmKTAAS8E9hDEl7pX
	Dycm920b87Qu+SdK4p3MNty7K2Tsu9onCKUA7zFrx4o1yBMx7rIT0KaGaZqhYjSTFLxDGCWGaDCsf
	nZ47QwD0hK5p+QzJlZNdsEfa7JMKHaKffZKl3jdjbmzvQI4Q5ausYs1WMv/+37pMI6VW/UGvNjtO+
	Sb9Jp9P3e48gKwKCuHa19PasaIJ4vPhJ7KrMkW18Tc0kYeeOvQsilVwyUnaZD2V/7YOkGxgt0oyl7
	QQtFhq+LiIcVt6KpbhS9jwvVhjM9Urz0b5j/zRWGoMZH499pgHKAGpHzqMftPfBuO7BQm4Zkmro3f
	0cfwRLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcrD-000000044Qu-0neu;
	Mon, 08 Jun 2026 16:29:47 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcrA-000000044Q5-2r1c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:29:45 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gYyDd4cMlz9v04;
	Mon,  8 Jun 2026 18:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780936177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbSbELZ/qhJGz8m9PkFP4eZM/CFetLN6lwudktuynGY=;
	b=AQE2xXfNVLdb0zenRfKtc1yr7vSNa3ByjQ0rIG1J/Ql0m4lBUCNWwtIrp3znIEbEDtsn8h
	IMGOPgaK0+eCY7j1maEAItCcpQPyKJ7EnszJxY220kDYTU1J8pgWVcgvGRJmW0qTbOaB7D
	qeMglUL8Fp+gPnHx9kzN5tpB+fajuXZY5KKPH9qumH7BnQAdWg/B3XKTwzgUFL6SO75SDb
	I5g9Edd+BUNNLOAWjCxWxqIjDWMrqVw4VbJUSHIwz3efT8YHbNLMTMiFiMwwvEDuL+L9K0
	a3UnfU9QVReNX3lcogtEW1Jj6oSeI1xs5OgCPqZoaRRXyNJHAUHpGEwOl8uTtg==
Message-ID: <9ece4e08-a77f-4410-ba16-a77b9bd0aace@mailbox.org>
Date: Mon, 8 Jun 2026 18:29:32 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>, Piyush Patle <piyushpatle228@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Abel Vesa <abelvesa@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20260605121112.27866-1-piyushpatle228@gmail.com> <aiZzxhljfyYQ68Gl@raspi>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aiZzxhljfyYQ68Gl@raspi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: yf38h31tgdjwq7mde8h8omnc7sio8pks
X-MBO-RS-ID: 587bbf07cc5c34a1000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_092944_892776_75B4865B 
X-CRM114-Status: GOOD (  25.50  )
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

On 6/8/26 9:48 AM, Liu Ying wrote:

Hello everyone,

>> I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI on
>> LVDS ch1). It mostly works, but I ran into a few issues around DI routing,
>> LVDS format handling, and DC enable sequencing which needed rework before
>> HDMI would come up reliably on the board.
>>
>> I don't see a v2 of the series and things seem to have been quiet since
>> November. Are you planning to post an updated version?
> 
> My plan was to enable prefetch engine support[1] for i.MX8QXP display
> controller and add device tree for a whole i.MX8QXP LVDS display pipeline,
> before adding i.MX95 display controller support.
> 
> Unfortunately, it seems that Marek is not a big fan of [1]

I am fine with [1] as long as it can be isolated and does not affect 
every SoC that might reuse this driver, which I think it can be done.

> and I'm busy
> with downstream development so the plan doesn't move forward well.  I still
> think [1] makes sense(maybe I need to rebase it on latest drm-misc-next),
> so I'd like to see review comments on [1] and hopefully people think that
> the overall idea of [1] is ok.

My only concern is, to keep it isolated to MX8Q, so this driver can be 
reused by MX95.

>> I've accumulated a fair amount of rework while getting this running on the
>> FRDM. If you're not planning a v2, I can clean things up and send one based
>> on the current series.
> 
> I still think that i.MX95 display controller driver should be in a separate
> driver, rather than sharing the same driver with i.MX8QXP display controller
> like this patch series does, because the two display controllers are quite
> different as I mentioned in comments on this patch series and in discussion
> in [1].  Also, the common part between the two display controllers should
> be extracted to a common helper library as I mentioned there too.
Are they really? It seems this series adds support for the MX95 DC 
without that many changes, so are the DCs really that different ? It 
seems the MX95 DC is simply a reuse/evolution of the MX8Q DC blocks, so 
duplicating the code seems like the wrong direction, it will only lead 
to disparate sets of bugs in two drivers, which isn't desired.

(I might not fully understand what you have in mind with the helper 
library though?)

