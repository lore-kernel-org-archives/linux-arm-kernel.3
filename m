Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466D2ECD6EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyZgXzA0kDxcIZgG0RZT1vT5lA/Z6Rlo+3p5c7j9YCQ=; b=s3XOct/FDYjzizPFA6sHmHBywB
	efh4J0CrbldczMrNVoGnzbv5zL1SaCzHUiMNgWUcs98JkKr57KRlZ55ZfPNJ+UCwfWgETRdekVvS6
	96ingf/Dp67M7lqfZno0fkQcQ3Z7heyUek7ogJ8KXhPPlmOBxJqaaDbL8vu1Tiq+shssgGmPeDAUq
	XHJcPMJa4xB0iofOw3q2IyyzMJ49+OnvKtaWL42kJj+LmBOgSWdGEtz4SSWzB2NwIyj4UoqP9TVE2
	K6VIFWS538zawxKVGfHMTqwdGDpjCFPFnWXWvJKY/aXQuCm9DzjaFH4LPmf7o77gD4vYkphSgBdbD
	8zSW8iSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHkc-000000015CY-3HF1;
	Wed, 11 Feb 2026 21:27:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHkZ-000000015CB-146y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 21:27:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D4F5BC23D88;
	Wed, 11 Feb 2026 21:27:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB067606B1;
	Wed, 11 Feb 2026 21:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46946119486DB;
	Wed, 11 Feb 2026 22:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770845258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UyZgXzA0kDxcIZgG0RZT1vT5lA/Z6Rlo+3p5c7j9YCQ=;
	b=E1hZwM9235K8e4bvSxUn9sAUXYygdB6uBtS1xNhR7AoIs2ftqH2kK7Fp86uqXs28oV0kVw
	OZ47/BovcjUc4ZZzmksMuDAoGhdj4w5CSajLGF1hBZ7goQeMMopDY1H++pMTKV8+5AhMeX
	lcWV/Z3ah9d2Hzw1bl6+n7IKxgJOUXyaP/XB/5uX3pyABW1jiY2CFkZDsLfAFyfmeQkdTZ
	XgLe/8eoqO5SNo9iTMoJBiDMgsgYWklv2MrCog5hy47zdhYWerDuwigGJzSpib4vxswzJ2
	9aZVZmD3Pkon8l1oY13+WtnOlSNZhl39b2NiwBE4yu0cph4OfEwphLh3x0yNsw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 22:27:29 +0100
Message-Id: <DGCG90VYLUEA.3IPJ682VDMHP6@bootlin.com>
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
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
References: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com> <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com> <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com> <DG6WFD0WCCMQ.2AT7S8YHVLH7@bootlin.com> <910325b6-2a0a-40ae-82c2-656fcbb0d060@nxp.com>
In-Reply-To: <910325b6-2a0a-40ae-82c2-656fcbb0d060@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_132755_940566_53BE3753 
X-CRM114-Status: GOOD (  22.52  )
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

On Thu Feb 5, 2026 at 10:26 AM CET, Liu Ying wrote:
> On Thu, Feb 05, 2026 at 09:52:04AM +0100, Luca Ceresoli wrote:
>> Hello Liu,
>
> Hello Luca,
>
>>
>> On Wed Feb 4, 2026 at 7:27 AM CET, Liu Ying wrote:
>>> Hi Luca,
>>>
>>> On Tue, Feb 03, 2026 at 11:35:25AM +0100, Luca Ceresoli wrote:
>>>> This driver obtains a bridge pointer from of_drm_find_bridge() in the =
probe
>>>> function and stores it until driver removal. of_drm_find_bridge() is
>>>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>>>> refcounted and use bridge->next_bridge to put the reference on
>>>> deallocation.
>>>>
>>>> To keep the code as simple and reliable as possible, get a reference f=
or
>>>> each pointer that stores a drm_bridge address when it is stored and re=
lease
>>>> it when the pointer is overwritten or goes out of scope. Also remove t=
he
>>>> intermediate selected_bridge variable to reduce the refcounted variabl=
es in
>>>> the function. The involved pointers are:
>>>>
>>>>  * next_bridge loop-local variable:
>>>>    - get reference by of_drm_find_and_get_bridge()
>>>>    - put reference at the end of the loop iteration (__free)
>>>>
>>>>  * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
>>>>    - get reference when assigned (by copy from next_bridge)
>>>>    - put reference before reassignment if reassignment happens
>>>>    - put reference when the struct imx8qxp_pixel_link embedding the
>>>>      struct drm_bridge is destroyed (struct drm_bridge::next_bridge)
>>>>
>>>> Additionally, split the somewhat complex if() for readability.
>>>>
>>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v5:
>>>> - rewrite commit message after Liu's review to clarify the per-pointer
>>>>   get/put idea
>>>> - split the if()s involved in selcting the bridge
>>>> - remove intermediate selected_bridge pointer
>>>> - removed Maxime's R-by, patch changed
>>>> ---
>>>>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++------=
-
>>>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers=
/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>>>> index 91e4f4d55469..e29e099b893a 100644
>>>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>>>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>>>> @@ -23,7 +23,6 @@
>>>>
>>>>  struct imx8qxp_pixel_link {
>>>>  	struct drm_bridge bridge;
>>>> -	struct drm_bridge *next_bridge;
>>>>  	struct device *dev;
>>>>  	struct imx_sc_ipc *ipc_handle;
>>>>  	u8 stream_id;
>>>> @@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct=
 drm_bridge *bridge,
>>>>  	}
>>>>
>>>>  	return drm_bridge_attach(encoder,
>>>> -				 pl->next_bridge, bridge,
>>>> +				 pl->bridge.next_bridge, bridge,
>>>>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>  }
>>>>
>>>> @@ -260,7 +259,6 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>>>  {
>>>>  	struct device_node *np =3D pl->dev->of_node;
>>>>  	struct device_node *port;
>>>> -	struct drm_bridge *selected_bridge =3D NULL;
>>>>  	u32 port_id;
>>>>  	bool found_port =3D false;
>>>>  	int reg;
>>>> @@ -297,7 +295,8 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>>>  			continue;
>>>>  		}
>>>>
>>>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>>> +			of_drm_find_and_get_bridge(remote);
>>>>  		if (!next_bridge)
>>>>  			return -EPROBE_DEFER;
>>>>
>>>> @@ -305,12 +304,16 @@ static int imx8qxp_pixel_link_find_next_bridge(s=
truct imx8qxp_pixel_link *pl)
>>>>  		 * Select the next bridge with companion PXL2DPI if
>>>>  		 * present, otherwise default to the first bridge
>>>>  		 */
>>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-=
pxl2dpi"))
>>>> -			selected_bridge =3D next_bridge;
>>>> +		if (!pl->bridge.next_bridge)
>>>> +			pl->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>>>> +
>>>> +		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>>> +			drm_bridge_put(pl->bridge.next_bridge);
>>>> +			pl->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>>>> +		}
>>>
>>> Can you drop the intermediate next_bridge variable to simplify the code=
?
>>>
>>> -8<-
>>> if (!pl->bridge.next_bridge) {
>>>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>>>         if (!pl->bridge.next_bridge)
>>>                 return -EPROBE_DEFER;
>>> }
>>>
>>> if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>>         drm_bridge_put(pl->bridge.next_bridge);
>>>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>>>         if (!pl->bridge.next_bridge)
>>>                 return -EPROBE_DEFER;
>>> }
>>> -8<-
>>
>> Potentially calling of_drm_find_and_get_bridge() twice on the same node,
>> with a put in the middle, looks poorly readable to me, even though it st=
ill
>> looks correct code.
>>
>> However I think we can do even better with an 'else if':
>>
>>   if (!pl->bridge.next_bridge) {
>>          pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>>          if (!pl->bridge.next_bridge)
>>                  return -EPROBE_DEFER;
>>   } else if (of_property_present(remote, "fsl,companion-pxl2dpi")) {   <=
=3D=3D=3D
>>          drm_bridge_put(pl->bridge.next_bridge);
>>          pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>>          if (!pl->bridge.next_bridge)
>>                  return -EPROBE_DEFER;
>>   }
>>
>> Looks OK?
>
> Both are fine to me.  TBH, I feel my version with two 'if's is a bit easi=
er
> to read.  But, I'd say up to you.

I think this is really a minor detail and there is no obvious "best"
version, so I'll send v6 as I had it ready and build-tested already,
i.e. with the 'else if' version.

Thanks for the discussion!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

