Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E558E91296
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAHuDZGdOHCkluE1sGpfz5BKQPev5pDJI3SbYCQhk/g=; b=wMC5+lH9kf3mAek8mvPgsC7+V0
	fbaXHPHIOk3Sd/ikSiOCeBY0d1Umxe/icViTlOzngDK9ST/LbIRkzADq6AsQrkZ0KZNVjWxf8JqCa
	kNb68NaRm0POi7gTxfvs79gDPWAt/qF/asWsUA+Mtz92ixZ1lDUvG81dyjXhon9wKb+jRgTkLmnh2
	3IjY8AY/puNPkQV8iZ1SvieLGkVSRzH5DkuLC0tBDns80Wk7mYNwQcl0bvQnwJ/bY9zvw8oyB5kYW
	UW6lFea4KfWKPGuVAhM6O6N3MeuKvcYVlXvh731SBjcmwAbv+qXaNDgwbRuPdseXSVjDPI1OPLyJi
	OrWomqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnv62-00000009dGs-38Sq;
	Thu, 05 Feb 2026 08:52:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnv60-00000009dFE-0arx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 08:52:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B5AA91A2C14;
	Thu,  5 Feb 2026 08:52:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 873C2606FD;
	Thu,  5 Feb 2026 08:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F4E1119A865B;
	Thu,  5 Feb 2026 09:52:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770281530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cAHuDZGdOHCkluE1sGpfz5BKQPev5pDJI3SbYCQhk/g=;
	b=V/OuwqIzGrMg16RK410fZ8NV8UB+SC8qXojKVuRT8brgx53s3SX7ZwCfi7PAcW/2JHIutf
	iP2WJOXeobyqbR08j0nlsZ9gn0awlNelWyoC+0GSqoCMfY7GjBIv1mEDo8X9s0PTQ+67Q4
	OJhfTxhZC72c5jAS/KG6hP83m5HTp8jaBeCaS4a3c7vo+i9vy8HgUCggTYW4Dy2IvOWXAg
	IbW4iE3RaOjukwR79O2XzAZDOMpgqnd/D95pr7vMSU6nen8QtJiw/DoGU3/ig/SC+hLo9a
	nFuBMTP8tV0eD2ryZHQ8gs+LIH6udPj2qI4ymiFWJNgdUUFFIKphgf/IG4uc1g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 09:52:04 +0100
Message-Id: <DG6WFD0WCCMQ.2AT7S8YHVLH7@bootlin.com>
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
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com> <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com> <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com>
In-Reply-To: <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_005216_316647_DA5D7906 
X-CRM114-Status: GOOD (  24.35  )
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

On Wed Feb 4, 2026 at 7:27 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Tue, Feb 03, 2026 at 11:35:25AM +0100, Luca Ceresoli wrote:
>> This driver obtains a bridge pointer from of_drm_find_bridge() in the pr=
obe
>> function and stores it until driver removal. of_drm_find_bridge() is
>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>> refcounted and use bridge->next_bridge to put the reference on
>> deallocation.
>>
>> To keep the code as simple and reliable as possible, get a reference for
>> each pointer that stores a drm_bridge address when it is stored and rele=
ase
>> it when the pointer is overwritten or goes out of scope. Also remove the
>> intermediate selected_bridge variable to reduce the refcounted variables=
 in
>> the function. The involved pointers are:
>>
>>  * next_bridge loop-local variable:
>>    - get reference by of_drm_find_and_get_bridge()
>>    - put reference at the end of the loop iteration (__free)
>>
>>  * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
>>    - get reference when assigned (by copy from next_bridge)
>>    - put reference before reassignment if reassignment happens
>>    - put reference when the struct imx8qxp_pixel_link embedding the
>>      struct drm_bridge is destroyed (struct drm_bridge::next_bridge)
>>
>> Additionally, split the somewhat complex if() for readability.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> ---
>>
>> Changes in v5:
>> - rewrite commit message after Liu's review to clarify the per-pointer
>>   get/put idea
>> - split the if()s involved in selcting the bridge
>> - remove intermediate selected_bridge pointer
>> - removed Maxime's R-by, patch changed
>> ---
>>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++-------
>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/g=
pu/drm/bridge/imx/imx8qxp-pixel-link.c
>> index 91e4f4d55469..e29e099b893a 100644
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
>> @@ -260,7 +259,6 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  {
>>  	struct device_node *np =3D pl->dev->of_node;
>>  	struct device_node *port;
>> -	struct drm_bridge *selected_bridge =3D NULL;
>>  	u32 port_id;
>>  	bool found_port =3D false;
>>  	int reg;
>> @@ -297,7 +295,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
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
>> @@ -305,12 +304,16 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>  		 * Select the next bridge with companion PXL2DPI if
>>  		 * present, otherwise default to the first bridge
>>  		 */
>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi"))
>> -			selected_bridge =3D next_bridge;
>> +		if (!pl->bridge.next_bridge)
>> +			pl->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>> +
>> +		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>> +			drm_bridge_put(pl->bridge.next_bridge);
>> +			pl->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>> +		}
>
> Can you drop the intermediate next_bridge variable to simplify the code?
>
> -8<-
> if (!pl->bridge.next_bridge) {
>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>         if (!pl->bridge.next_bridge)
>                 return -EPROBE_DEFER;
> }
>
> if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>         drm_bridge_put(pl->bridge.next_bridge);
>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>         if (!pl->bridge.next_bridge)
>                 return -EPROBE_DEFER;
> }
> -8<-

Potentially calling of_drm_find_and_get_bridge() twice on the same node,
with a put in the middle, looks poorly readable to me, even though it still
looks correct code.

However I think we can do even better with an 'else if':

  if (!pl->bridge.next_bridge) {
         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
         if (!pl->bridge.next_bridge)
                 return -EPROBE_DEFER;
  } else if (of_property_present(remote, "fsl,companion-pxl2dpi")) {   <=3D=
=3D=3D
         drm_bridge_put(pl->bridge.next_bridge);
         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
         if (!pl->bridge.next_bridge)
                 return -EPROBE_DEFER;
  }

Looks OK?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

