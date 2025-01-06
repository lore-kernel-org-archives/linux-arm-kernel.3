Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A95E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl7b9/uRfU9PjT0DsfX4Aw1ecJNaqnOdlVBiZttQ580=; b=mF891z/41qfOyav57WBsi/f8Gw
	vhX1tsln8hSpQW976RmIzLjYPxOxugPkJ8TZjhXsLmwm10/76dOqeDqgTCHYWvdCioSIlJJJJl0/L
	VTkgne+4cSl+ElhPdpbvzQGR6n3wmOpffnZ5ka9rHIW1Mmm5xWEftkIQc/TbKNBsDfxWOBmh2taSn
	jGw6/4m+bh4b3dIPqCESKelMcB1nzmQburWvVNftBinR87OhcdZi9HJg6G6iyUJ7LTp5n60xTYeEj
	VT665/lyLs6n1HEtiCnj4E8JxWzTH54NqRbgmCsM8POh9Eb0bq3s57Rx2jah/TufeGUKEz35yuRcK
	f6t5KPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpDx-00000001oEU-3sxD;
	Mon, 06 Jan 2025 15:41:01 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpC5-00000001nq5-25tW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:39:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9378A104839FD;
	Mon,  6 Jan 2025 16:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736177942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tl7b9/uRfU9PjT0DsfX4Aw1ecJNaqnOdlVBiZttQ580=;
	b=J5Bc69JMzDz1JGBjuEG8POURFwwohBsDV7iwgOJ1wM64dUyGP6zajsQ6sN7IaumEBx7r0F
	nEJl0cgtzI1qwksNgBWfJvNPAvXxpK194rKZVz/hdnC4WxFnFvuPFAE+z3xhFug+QpQM/Z
	Q/PLZVVd5CP42opCzvcJIfGc+9+QMnLMehgMxhuAa9PS7XHP3EOYv9/rwbFwJPPqV9fgc8
	1HZuAoufbXSdN5mmeS2727iCE0O8p+K6TaeNgWvGOM7GKRVJQY2/cEbe3cDQGVoc0TYW/I
	+Gcf7cb6MwcgzFx3dXF92m2G9EQYJl65yJ28iIxwPBV11o2+4bwRePnTdHNWmg==
Message-ID: <add68d4c-51d8-4c1a-9560-7c95213dd524@denx.de>
Date: Mon, 6 Jan 2025 16:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
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
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
 <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
 <20250106070514.GA5568@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250106070514.GA5568@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_073905_688709_B12F4502 
X-CRM114-Status: GOOD (  14.27  )
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

On 1/6/25 8:05 AM, Laurent Pinchart wrote:
> On Mon, Jan 06, 2025 at 03:48:52AM +0100, Marek Vasut wrote:
>> On 1/6/25 12:22 AM, Laurent Pinchart wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Thank you for the patch.
>>>
>>> On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
>>>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
>>>> HDMI but do not contain the HDMI connector node. This flag allows such
>>>> DTs to work by creating the connector in the HDMI bridge driver. Do not
>>>> use this flag, do not proliferate this flag, please fix your DTs and add
>>>> the connector node this way:
>>>>
>>>> ```
>>>> / {
>>>>       hdmi-connector {
>>>>           compatible = "hdmi-connector";
>>>>           label = "FIXME-Board-Specific-Connector-Label"; // Modify this
>>>>           type = "a";
>>>>
>>>>           port {
>>>>               hdmi_connector_in: endpoint {
>>>>                   remote-endpoint = <&hdmi_tx_out>;
>>>>               };
>>>>           };
>>>>       };
>>>> };
>>>>
>>>> &hdmi_tx {
>>>>       ...
>>>>
>>>>       ports {
>>>>           port@1 {
>>>>               hdmi_tx_out: endpoint {
>>>>                   remote-endpoint = <&hdmi_connector_in>;
>>>>               };
>>>>           };
>>>>       };
>>>> };
>>>> ```
>>>
>>> Are there any in-tree DT sources that use the old bindings ?
>>
>> See
>> https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/
> 
> Maybe I'm missing something obvious, but where is the patch series that
> moves the DT sources mentioned in that mail thread to the new bindings ?
Since this optional flag is added, that DT update series can be done 
separately.

