Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EDFCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RAcB1KnTu10/U/5AH7wLJv4yw422htNmPqwtIjsMk4=; b=2lgKPana8wdo0/VK+sRni2EGE6
	5Vo7QXIwUqXRbJW8Lsr4fcYYIGwBSTbtXC0Bcm/IXH/XwXzuLEwWPBWE1tCVB8EQGwddV5rfMQ/JD
	HrF7SR7O166+yR1WENsen3EZ/P5+z45oVn1ZhNFqpFlCPyLdThTmWatotf4XHlzXmk+OrKgnqNGlr
	qgAckEoU9oemnT5pcXu1MJrFb9uu05jpVgnelBXq4siXy4FlSypad5vr5QDbtnu9VpFUIJ/L+LMdm
	unGiQZk5mLcf3de3XIbJukqGpqlPzmbHktN6TpFgcf2H4L3PWwZVm5n+4l7zmP9AlHfrSpilaTKgZ
	f/P1GdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94D0-00000002GeF-0xfZ;
	Wed, 15 Oct 2025 16:18:38 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94Cx-00000002Gdc-1y7L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:18:37 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmx8k3hfSz9spd;
	Wed, 15 Oct 2025 18:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760545110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RAcB1KnTu10/U/5AH7wLJv4yw422htNmPqwtIjsMk4=;
	b=V1Gj3UXlTfbAXXf5H8fENfL7wuosE2RSQoMBoCz53MsTllEkLuoeDDji6805ZHRW/Gw2o0
	Xu+HELzQrpUOJ4rxjwCf0hYN+hyML3uTegapcoIlXOoLI25GNkOeBr85BaF976a60WtRex
	aOjTyjwPhdras7ObxUNPbMgCA/y5MfJPz+G5148y3bXilFNgAZFtArFRjUA3aq0/Sw8eGq
	xoNLrI70eJJzv70Rxl8IVKoG2unPNxQZZWlxubfp++LOdQPT/f/Wz+9U6Zq7qJwowPxn9k
	DG2C8guxzonxJujbwt0iuMaFLr19G69W9/ZMo/0Q+roji0ksHOC2+vvHviKJww==
Message-ID: <e0507800-7e86-4fbb-95cb-e64d8cca1e49@mailbox.org>
Date: Wed, 15 Oct 2025 18:18:25 +0200
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
 <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
 <92d928cc-d9df-4c9c-8571-da39001b91a7@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <92d928cc-d9df-4c9c-8571-da39001b91a7@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 03ff7b3109451a21313
X-MBO-RS-META: kx1epfwft5um1jo7qw14sxkpbgi5h5ht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_091836_072770_FE996797 
X-CRM114-Status: GOOD (  16.82  )
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

On 10/15/25 12:00 PM, Liu Ying wrote:

Hi,

>> I wanted to put this whole thing on the list first, before I start splitting it up.
>>
>> For starters, I think I can send these separately:
> 
> Before discussing how to split, a bigger question is that is it fine to
> support both i.MX8qxp DC and i.MX95 DC in the same imx8_dc_drm module?
> Separate modules look more reasonable to me, considering the fact that
> there are quite a lot difference between the two DCs.

(maybe I do not quite understand your suggestion with "separate module", 
I assume this means entirely duplicate driver, is that correct? I 
operate with that assumption in the text below.)

This series indicates that the functional units in the DC are basically 
identical, with the majority of changes being register base addresses of 
the whole DC and an odd bit or register offset here and there. Most of 
the code can be reused, as can be seen in the first half of the series.

The addition of iMX95 into the iMX8QXP DC also does not seem to be 
making the driver in any way more complicated.

What would be the benefit of having duplicate driver for IP that is 
basically identical, for i.MX95 ?

[...]

>> - drm/imx: dc: Rename i.MX8QXP specific Link IDs
> 
> TBH, I'm not a big fan of adding LINK_ID_x_MXy to enum dc_link_id, since
> the members may have the same value and it's kind of a mess considering
> future SoCs.

I am open to a better suggestion which does not involve duplicate driver.

>> - drm/imx: Add more RGB swizzling options
> 
> This one seems ok.

I can send that one separately. Can you test that on MX8QXP ? I don't 
have a board with that SoC, sorry.

[...]

> I kind of opt to separate modules.  Maybe, to save some code, an additional
> module can be introduced to wrap common part as helpers, plus some callback
> magics, like fg->dc_fg_cfg_videomode().
Let me ask for clarification here -- by separate modules, do you mean 
two totally separate drivers ?

