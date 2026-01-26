Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB819D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls3taMwzvNNXHeVbQeNP5rFTYcAY6U5onCvB1yfNoQ8=; b=SuPjHS/5ts+LjD+ts6f+tuGu9q
	o2m/lwcpIeAC/xorUy/MUXyGxcyKjhyByd542Pcs2Y+RG1x0i6nIU2UrRbgBtKN9rhXP5Imp69Y97
	cCC+xatPY6RmuwCPWPG8lM89QxcuHjP0SBKooHtEyGZHMsyh9uvMpjZXbThLHTScLUd2XWaWJJ726
	zYW9dgC5fjFpvX+9op9Sudp5oqVceTzyc3EAHtCl+GgyZ7eb2UiNkZxeNit9WxsYwXJgWYhCBhgSD
	EuAFiok5YvVclLubIMdbL47nLTpaHvQTTxU1E9+fYaPbRHiZP5LFSu9GGj+r5cXT76+DEQ2VnguuS
	kWhZjxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRB0-0000000D43R-0gZY;
	Mon, 26 Jan 2026 18:19:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRAw-0000000D41j-2em5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 18:19:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6E4CC4E422A9;
	Mon, 26 Jan 2026 18:18:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3774260717;
	Mon, 26 Jan 2026 18:18:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79086119A8652;
	Mon, 26 Jan 2026 19:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769451534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ls3taMwzvNNXHeVbQeNP5rFTYcAY6U5onCvB1yfNoQ8=;
	b=NcArdz7xzE0B9ZKlGEpC4zys8TGIgogLWz9VpMtrP6U+Em5MEEDrFaMiAA9LMfnJOpreJv
	+ZdWvIbH72LlOeGJQrsfZtHfGRyEexTvGXSZH6iMeG+1cpyK2Fi1EIwRshDDheiXKzKyd6
	wFNvp/9Bn4tLGNKIVhFjrKh4uJQ0WTU3BXvL2twizcVRwZbaeSzyo4fl5XICglLCoCeaC/
	xitZfUwjJmHl2YgbfQWLn4TR5aftP7+FMbOufQuPhkrL8oZwOx17YjlVJQgnJ5ioVgpTfz
	aYri0JDVyWhMbP97zYlt7JDxojnKMCruFM1l22lKmreDdrZRvqinZs6aNjVMCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 19:18:47 +0100
Message-Id: <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com> <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
In-Reply-To: <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_101859_200383_D3BF0160 
X-CRM114-Status: GOOD (  26.81  )
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

Hello Liu,

On Mon Jan 26, 2026 at 9:06 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Wed, Jan 07, 2026 at 10:56:29AM +0100, Luca Ceresoli wrote:
>> This driver obtains a bridge pointer from of_drm_find_bridge() in the pr=
obe
>> function and stores it until driver removal. of_drm_find_bridge() is
>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>> refcounted and use bridge->next_bridge to put the reference on
>> deallocation.
>>
>> This needs to be handled in various steps:
>>
>>  * the bridge returned of_drm_get_bridge() is stored in the local tempor=
ary
>>    variable next_bridge whose scope is the for loop, so a cleanup action=
 is
>>    enough
>>  * the value of next_bridge is copied into selected_bridge, potentially
>>    more than once, so a cleanup action at function scope plus a
>>    drm_bridge_put() in case of reassignment are enough
>>  * on successful return selected_bridge is stored in bridge->next_bridge=
,
>>    which ensures it is put when the bridge is deallocated
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks for having found the time to go into the details and provide a
careful review of this series!

>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>> @@ -23,7 +23,6 @@
>>
>>  struct imx8qxp_pixel_link {
>>  	struct drm_bridge bridge;
>> -	struct drm_bridge *next_bridge;
>>  	struct device *dev;
>>  	struct imx_sc_ipc *ipc_handle;
>>  	u8 stream_id;
>> @@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct d=
rm_bridge *bridge,
>>  	}
>>
>>  	return drm_bridge_attach(encoder,
>> -				 pl->next_bridge, bridge,
>> +				 pl->bridge.next_bridge, bridge,
>>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  }
>>
>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  {
>>  	struct device_node *np =3D pl->dev->of_node;
>>  	struct device_node *port;
>> -	struct drm_bridge *selected_bridge =3D NULL;
>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NULL;
>>  	u32 port_id;
>>  	bool found_port =3D false;
>>  	int reg;
>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  			continue;
>>  		}
>>
>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>> +			of_drm_find_and_get_bridge(remote);
>>  		if (!next_bridge)
>>  			return -EPROBE_DEFER;
>>
>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>  		 * Select the next bridge with companion PXL2DPI if
>>  		 * present, otherwise default to the first bridge
>>  		 */
>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi"))
>> -			selected_bridge =3D next_bridge;
>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi")) {
>> +			drm_bridge_put(selected_bridge);
>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>
> Considering selecting the first bridge without the companion pxl2dpi,
> there would be a superfluous refcount for the selected bridge:
>
> 1) of_drm_find_and_get_bridge: refcount =3D 1
> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D 1
> 3) drm_bridge_get: refcount =3D 2
> 4) drm_bridge_put(__free): refcount =3D 1
> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2

Here you are missing one put. There are two drm_bridge_put(__free), one for
next_bridge and one for selected_bridge. So your list should rather be:

1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL, re=
fcount =3D 1
3) selected_bridge =3D drm_bridge_get: refcount =3D 2
4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =3D 1
5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
6) drm_bridge_put(selected_bridge) [__free at function scope end]: refcount=
 =3D 1

The idea is that for each pointer (which is a reference) we get a reference
(refcount++) when the pointer is set and put the reference when that same
pointer goes out of scope or is reset to NULL. "the pointer is set" can be
either of_drm_find_and_get_bridge() or an assignment, as each of these
operations creates another reference (pointer) to the same bridge.

Does it look correct?

> I think the below snippet would be the right thing to do:
> -8<-
> {
> 	...
>
> 	struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
> 		of_drm_find_and_get_bridge(remote);
>   		if (!next_bridge)
>   			return -EPROBE_DEFER;
>
> 	/*
> 	 * Select the next bridge with companion PXL2DPI if
> 	 * present, otherwise default to the first bridge
> 	 */
> 	if (!selected_bridge)
> 		selected_bridge =3D drm_bridge_get(next_bridge);
>
> 	if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
> 		if (selected_bridge)
> 			drm_bridge_put(selected_bridge);
>
> 		selected_bridge =3D drm_bridge_get(next_bridge);
> 	}
> }

Your version of the code looks OK as well so far, but totally equivalent to
what my patch proposes.

Do you think splitting the if() into two if()s is clearer? Would you like
me to change this?

> ...
> pl->bridge.next_bridge =3D selected_bridge;

Based on the logic above the drm_bridge_get() is still needed here (both
with the single if() or the split if()s) because at function exit the
selected_bridge reference will be put.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

