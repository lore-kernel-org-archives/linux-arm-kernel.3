Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E699FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aAmCRebqazUQNBKgBXCiYfFsMA4sAwZ/UUaHHc6oSE=; b=YaiClKkWxNLszyg9bqxrdM0h4a
	CimByaa9gw0XoVv9q0xfSRlcDJgArseuXYWNbu7l/pY8509IQExmrjOd6SB4rqEwreoTHXjqSL0VO
	6NhyT0etHz2VL1bW4bs1IvnX33R/ahseN48ouItCz7y8pf7C2smoCtsEE6xcnv3iRJix28JxO4Cg0
	UoHlXOGWyOq86aU5kF51D/vy51MJU4WNzT6JZYL7+vmZEp6/w6iLUJNUFVGPa5FNmMyq9XilSxPee
	SUb4flvoop+rFTUi/LQiaZQtblSwAuv6AtLOiEf9SfSbTU5D/Gz8vG2uxKJOnl5xuwG0d3Hn2RbzS
	2tI4mibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiM1-00000001Wlm-3Dgo;
	Tue, 28 Apr 2026 13:19:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiLx-00000001WiR-47LW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:19:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E1DC2C5EF0B;
	Tue, 28 Apr 2026 13:20:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35812601D0;
	Tue, 28 Apr 2026 13:19:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F75A10728B8B;
	Tue, 28 Apr 2026 15:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777382387; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/aAmCRebqazUQNBKgBXCiYfFsMA4sAwZ/UUaHHc6oSE=;
	b=sWOth0lnhQkt1SKJlEOb35K37SRf1IZJdLJs1KtiRkwzxIW3XgVAjw0s+sltiQox7EIO/q
	RHhfsWsgSTSSEhF93sPb0/Dy3zu9Dmw7mAsyViz9qMwLm+Qq12w9/OaVoMn8gQL6XhCiUh
	wrg3ym3JZEBGoe4ISfu02867GIQoCSEy33t7hxBysza/OCCiq1nQZOzCHguDaXJnIFrMIT
	6+n/b2bYml2USn5ypFL1JD5gOVqcs/K5HXR9RZj9aD362Ai7NHp7VTR2x946YYQ77/2bRJ
	HY/SPjD4ROWVUHhOKQMazhZ1NiAQkUCEi1gDLWKzrWF1hdpY+ETyTFBs3Srhpg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 15:19:35 +0200
Message-Id: <DI4TGV2WURTY.39OXE7WWKRLA1@bootlin.com>
Subject: Re: [PATCH v2 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
To: "Biju Das" <biju.das.jz@bp.renesas.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Tian Tao" <tiantao6@hisilicon.com>,
 "Xinwei Kong" <kong.kongxinwei@hisilicon.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "John Stultz" <jstultz@google.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "tomi.valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com> <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com> <TY3PR01MB113466B70BFD2899AB0CF47AD86372@TY3PR01MB11346.jpnprd01.prod.outlook.com> <TY3PR01MB1134674FDD088299A4382D3D286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134674FDD088299A4382D3D286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_061954_309630_C226A540 
X-CRM114-Status: GOOD (  27.23  )
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

On Tue Apr 28, 2026 at 1:58 PM CEST, Biju Das wrote:
> Hi all,
>
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of B=
iju Das
>> Sent: 28 April 2026 12:50
>> Subject: RE: [PATCH v2 08/11] drm/bridge: adv7511: switch to of_drm_get_=
bridge_by_endpoint()
>>
>>
>> Hi,
>>
>> Thanks for the patch.
>>
>> > -----Original Message-----
>> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> > Luca Ceresoli
>> > Sent: 28 April 2026 10:16
>> > Subject: [PATCH v2 08/11] drm/bridge: adv7511: switch to
>> > of_drm_get_bridge_by_endpoint()
>> >
>> > This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in
>> > the @panel parameter, thus using a reduced feature set of that functio=
n.
>> > Replace this call with the simpler of_drm_get_bridge_by_endpoint().
>> >
>> > Since of_drm_get_bridge_by_endpoint() increases the refcount of the
>> > returned bridge, ensure it is put on removal. To achieve this, instead
>> > of adding an explicit drm_bridge_put(), migrate to the bridge::next_br=
idge pointer which is
>> automatically put when the bridge is eventually freed.
>> >
>> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> > ---
>> >  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
>> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 11 +++++------
>> >  2 files changed, 5 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> > b/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> > index 8be7266fd4f4..12c95198d9a4 100644
>> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> > @@ -354,7 +354,6 @@ struct adv7511 {
>> >  	enum drm_connector_status status;
>> >  	bool powered;
>> >
>> > -	struct drm_bridge *next_bridge;
>> >  	struct drm_display_mode curr_mode;
>> >
>> >  	unsigned int f_tmds;
>> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> > index 6bd76c1fb007..498e38579a0f 100644
>> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> > @@ -851,8 +851,8 @@ static int adv7511_bridge_attach(struct drm_bridge=
 *bridge,
>> >  	struct adv7511 *adv =3D bridge_to_adv7511(bridge);
>> >  	int ret =3D 0;
>> >
>> > -	if (adv->next_bridge) {
>> > -		ret =3D drm_bridge_attach(encoder, adv->next_bridge, bridge,
>> > +	if (adv->bridge.next_bridge) {
>> > +		ret =3D drm_bridge_attach(encoder, adv->bridge.next_bridge, bridge,
>> >  					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> >  		if (ret)
>> >  			return ret;
>> > @@ -1251,10 +1251,9 @@ static int adv7511_probe(struct i2c_client
>> > *i2c)
>> >
>> >  	memset(&link_config, 0, sizeof(link_config));
>> >
>> > -	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
>> > -					  &adv7511->next_bridge);
>> > -	if (ret && ret !=3D -ENODEV)
>> > -		return ret;
>> > +	adv7511->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dev->o=
f_node, 1, -1);
>> > +	if (IS_ERR(adv7511->bridge.next_bridge) && PTR_ERR(adv7511->bridge.n=
ext_bridge) !=3D -ENODEV)
>> > +		return PTR_ERR(adv7511->bridge.next_bridge);
>>
>> Does it crash, if the error is  -EPROBE_DEFER?
>
> I see a crash with patch [1], which is fixed by avoiding the direct assig=
nment.

Ah, dammit! Good catch, thanks for the quick testing and follow-up!

Indeed this driver assumes next_bridge is either NULL or a valid pointer,
but due to the 'if(IS_ERR() && some_other_condition)' now it can also be
-ENODEV (not -EPROBE_DEFER, but that's irrelevant).

This affects the msm and zynqmp_dp patches equally.

I'm sending a v3 soon with these fixed. I'm just not sure which approach to
use to fix (same for all the 3 patches). Alternatives are:

 1. -ENODEV is accepted, set next_bridge to NULL when it happens:

      -       if (IS_ERR(adv7511->bridge.next_bridge) && PTR_ERR(adv7511->b=
ridge.next_bridge) !=3D -ENODEV)
      -               return PTR_ERR(adv7511->bridge.next_bridge);
      +       if (IS_ERR(adv7511->bridge.next_bridge)) {
      +               if (PTR_ERR(adv7511->bridge.next_bridge) =3D=3D -ENOD=
EV)
      +                       adv7511->bridge.next_bridge =3D NULL;
      +               else
      +                       return PTR_ERR(adv7511->bridge.next_bridge);
      +       }

 2. let nexxt_bridge hold -ENODEV but ignore it when it is used (only in
    the attach op, for all 3 drivers):

      -       if (adv->bridge.next_bridge) {
      +       if (!IS_ERR_OR_NULL(adv->bridge.next_bridge)) {

While the latter approach involves less code, it might let errors sneak in
in case new usages of next_bridge are added with just a NULL check.

Opinions about the two?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

