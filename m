Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A14BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//EZX9tB291dgvxJPupqEO2OxNoDgoYJ0gAp7zGGuXU=; b=ll5GSykRpqJVJqnBR4AJz6oOXY
	2Mh6eax5DgYyJknHWVLponaEirNTxyYHTZNrdwUckURDdqO/E0EHAtCpo83k914EGpaN8AMimv6Xk
	6/eYK00WVhhmTijpy4wAg1izSZfsb7hexjeuhn+WrAv+xrkKCnBEKKQKO+3eWNk0AQABS8mV4Er8L
	GYxMibQetnZyFU+bVB+6uv9U0qWEEWw/Lt/obBQTNC1c1TWgI+TeLZRhTfTub5nlb7abOGJm74d1a
	6q5af6LXscxTr9gF0rw+CGXNVaWP3v4djck1QOUHEe0RcZK3oJYijpqlEqEvqj/uqOfJfmSAvtcJ9
	0Vncf5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTUa2-0000000BgHF-17jQ;
	Thu, 02 Jan 2025 23:26:18 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTUXg-0000000BfnL-1N3v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 23:23:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B96E4101C7E2A;
	Fri,  3 Jan 2025 00:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735860230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//EZX9tB291dgvxJPupqEO2OxNoDgoYJ0gAp7zGGuXU=;
	b=MObaNnWw1Cm105VIEgb8mGHlBXm1+eDOkX4Vd1+8q4N0Oualhspq96FPVwL8VhAjCPPgGj
	oCpKxfj2m19J3epaMh0Fsv/BCYAL3HkowwdQdEPSpK+3ltJOjD95K3+9ae2m2k29jh7++X
	qX6zwOLs9Z/B+zWr6ifJbv2FtleOSMJwbLHPedsrz4xU+yO2B67x/G93Nul0dLbzBgvvfr
	kM+quR891CTAjH++1E8kYZtARZuLJAID7fxIfT4J9qYYSwLfyBT7t++sipHVAZQpxxxmtz
	IDvpTMa1L+SSXdARShnmCxo5O1QfF3lB0KAF+fzf4ZaWC8qmYMwetfya/Z2BOQ==
Message-ID: <549d96ee-a675-47fd-9af0-0dc05744591c@denx.de>
Date: Fri, 3 Jan 2025 00:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
 <20241231192925.97614-2-marex@denx.de>
 <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_152352_652016_A9C1184E 
X-CRM114-Status: GOOD (  22.22  )
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

On 1/2/25 5:55 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 31, 2024 at 08:28:49PM +0100, Marek Vasut wrote:
>> The dw-hdmi output_port is set to 1 in order to look for a connector
>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>> The output_port set to 1 makes the DW HDMI driver core look up the
>> next bridge in DT, where the next bridge is often the hdmi-connector .
>>
>> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>>
>> Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
>> the oldest commit which adds HDMI support is commit:
>>
>> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
>>
>> That already contains the HDMI connector node. Most follow up additions
>> of HDMI support to another devices has been a variation of the same commit,
>> including connector node, which is the proper way of eanbling HDMI on the
>> i.MX8MP.
>>
>> The rest should be covered by output_port_optional which should make systems
>> with DTs without HDMI connector node work, but such DTs should be updated and
>> the HDMI connector node should be added.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Liu Ying <victor.liu@nxp.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Stefan Agner <stefan@agner.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>> V2: No change
>> V3: - Update commit message
>>      - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
>>      - Enable output_port_optional
>> ---
>>   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
>> index 9a480c6abb856..db5c8a76193ac 100644
>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>> @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>   	tristate "Freescale i.MX8MP HDMI-TX bridge support"
>>   	depends on OF
>>   	depends on COMMON_CLK
>> +	select DRM_DISPLAY_CONNECTOR
> 
> I was going to write that it is not to be selected by anybody, but then
> I stumbled upon meson driver, which also selects the symbol.
> 
> I still think that it is not to be selected by your driver as there is
> no direct dependency (and there can be other bridges inbetween or the
> bridge chain can end up with some other bridge). Such decisions belong
> to defconfig or distribution's kernel config file.
Wouldn't that only lead to unnecessary surprises on user side ?

