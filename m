Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888E5CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 21:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qsCHmQm23GPn/cG59MJ4JfonH9UflykkMpsA/9h5+U=; b=Gf3Jl3YbFdKB8cWW6XK4siMRkL
	7uGOfBGqbAq96Uj9qd2gdqUBeYByoZ4ELRTmzYGpM7PopMOUNanLfy2Yq6Nu1NBFwg+3Or+4oZcI2
	wLR8yRa+LNWh8uNFIE5j1GYAW1K4bmWV+vYFVZUyuxnV5YyOjRc5yON9pyJnJweb9J4abmtt/LAgS
	VMHI7ElODAwtpgpeQaE+zRJFMA1nKoT3053IiKnDwh5OMvBeHt9Z8BByG01G3hPtufp2og5QOEQVz
	/HQ3uZyrz+pJi4QpUltYWqvVBbsPs6z6dIHN4UU1dj1IJRU3t9biir9aUfUNwE+zdjCmpjzLTN63A
	6eldS2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mzA-0000000HUEd-1S4S;
	Tue, 14 Oct 2025 21:55:12 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mz7-0000000HUDV-3bDJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 21:55:11 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmSgX0LS2z9scN;
	Tue, 14 Oct 2025 23:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760478904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qsCHmQm23GPn/cG59MJ4JfonH9UflykkMpsA/9h5+U=;
	b=grqoShQbarkUu+JNCjKd1ngaaduN1W8QkyWxCFT21XmmD0en2MOwzWmQOlZJgMa/tOnsE2
	CQRTMCBcMnrOWlKjn6Syi00F/DGLRTvYex0Jl8ajknpA13RMSY215A1L8dti8YHy0l8f1M
	HaHPHcpbhfU+XhQFIoVKKgnjl/NNoEKk0Yyg9SEfKz6NnLZkR8oVEnrtiDpC85h+A1qEdM
	5ybQyhqL03hRsAwR/xfCHo0SpgXgwebhe7RcYwKxHzrcgPPu5HFWhaD6OhYRxU1B4an47p
	fIGjqUQ2bBAwRetsNh+/bv0jkfI/AMbDmCLzyD27tytEt31e4jW1iRUg9cZZIQ==
Message-ID: <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
Date: Tue, 14 Oct 2025 23:55:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 5nog4wp8xydqygcq8su1oi7hrnzmbrpa
X-MBO-RS-ID: fa85b4e7819b77388bb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_145510_063011_B2147EB3 
X-CRM114-Status: GOOD (  19.18  )
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

On 10/14/25 10:51 AM, Liu Ying wrote:
> Hi Marek,

Hi,

> On 10/11/2025, Marek Vasut wrote:
>> This large series adds support for the i.MX95 display pipeline, including
>> DPU, DSI and LVDS support. Most of the components extend existin drivers,
>> DPU is added into DC driver, DSI into iMX93 DSI driver, LVDS into iMX8MP
>> LDB. Pixel link and pixel interleaver drivers are reworked to work as two
>> independent channels, since there seems to be no dependency between their
>> two channels. The i.MX95 DTSI changes are also included.
>>
>> Since the DPU chapter is missing from the i.MX95 RM, this is based on the
>> NXP downstream kernel fork code and there might be issues.
>>
>> Majority of this series are DPU patches on top of the DC driver, I tried
>> to keep them separate and easy to review. Later part adds LVDS and DSI
>> support, this can be split into separate series.
> 
> Like you said that this patch series is large, please split it.
> Also, make sure proper maintainers are in TO or CC lists for each patch(b4
> tool should do that automatically for you), e.g., patch 37 should be sent
> to Thomas Gleixner <tglx@linutronix.de> according to MAINTAINERS.

I had to trim down the CC list for this series, it was enormous.

I wanted to put this whole thing on the list first, before I start 
splitting it up.

For starters, I think I can send these separately:

- drm/imx: dc: Use bulk clock
- drm/imx: dc: Rework dc_subdev_get_id() to drop ARRAY_SIZE() use
- drm/imx: dc: Rename i.MX8QXP specific Link IDs
- drm/imx: Add more RGB swizzling options
- dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX95 support

Then in second round, probably all these clean ups:

- drm/imx: dc: *: Pass struct dc_*_subdev_match_data via OF match data

And then rest afterward.

What do you think ?

-- 
Best regards,
Marek Vasut

