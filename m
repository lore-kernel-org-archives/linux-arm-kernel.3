Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8440E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 21:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtVgKXIRkiie7ek16GqaWrkdviMLh6QRY/N1cq81sP0=; b=NDbhP+y3shkO35Mj6Nify/otnh
	A38iIJ3RyYUnnHdQsB4Gu+8COrlyyFTONSBE2S/ulRSKP0Igetawc3VBYKG+O3BQ+/5kpE5j4lNbi
	++ZOc9nKA2yT98zIU/PK9countB3cgWGOiErLlB5ZSYcI7f7xZbsL5wO+9f7q6aABJKmbSSbpJ8ep
	wOYSt4lJsu5C9zwo0inm0/DPUEtC11wa2JqEFEgbs3irOZT95fxvpOhkSFTB80MuL7l4UITXr4GT9
	Qg448VYJGshOphg7b1OCWzs5ISQusguskqjPtNWugaUDgDF0MqSEeHKYMmTd3GWIaI3ce8eF1z7gS
	vk2Z0wpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSjcs-00000007nNU-2K26;
	Tue, 31 Dec 2024 21:18:06 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSjbf-00000007n7y-1NbM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 21:16:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EDFD104811D7;
	Tue, 31 Dec 2024 22:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735679808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtVgKXIRkiie7ek16GqaWrkdviMLh6QRY/N1cq81sP0=;
	b=FB1uSwTMLCVnCsjpsRmRcGHlw30WLImCnUiOSbbtvPovQ32k18SGWw25Lj9FoI6O5W5NjR
	jhbkk1XyAMkHhDjxciNhQTen/ATKa4s5G82ziTVMUq9Uah4pWDGjD0ejFTYCRxVdvbDIJc
	wByT+ecB7c8w61Jjy89SR/7/C7uJMoZsrQQWBLPMXlx7YEGPp87+AoaTUKfkvFXym+bPDD
	8wT73Nec1STeCOYmh4pZbKtJ6pQY11S3LK2QDIgMD2mmacvxATm8oLbdgy5X1MVyIwi1eD
	8pYFLZVm2jyPXoB+9+sORaOo22diS7nTmV8OjDkOJDbfc2aDkBxlzukHaI9oiA==
Message-ID: <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
Date: Tue, 31 Dec 2024 22:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241231203136.GD31768@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_131651_563527_2740432A 
X-CRM114-Status: GOOD (  15.44  )
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

On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
>> HDMI but do not contain the HDMI connector node. This flag allows such
>> DTs to work by creating the connector in the HDMI bridge driver. Do not
>> use this flag, do not proliferate this flag, please fix your DTs.
> 
> What's the rationale for this, what prevents fixing DT instead of using
> this flag ? Adding such a flag will most likely open the door to
> proliferation.

See the V2 series discussion, there are a few in-tree DTs which do not 
have the HDMI connector node. The rationale is there might be more and 
they might come from vendors, so this flag is necessary to work around 
those DTs.

> If you can't fix the DT on particular boards, patching it could be an
> option. We had a similar problem on Renesas boards, which we fixed with
> a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> to create LVDS encoder nodes"). This made the workaround self-contained,
> and allowed dropping it several kernel versions later (in commit
> 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> compatibility").
Frankly, I would much rather fix the few in-tree DTs and mandate the 
HDMI connector node in DT, which would keep the code simple, rather than 
maintain a backward compatibility workaround for problem which might not 
even exist.

