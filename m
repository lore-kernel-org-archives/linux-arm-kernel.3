Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228B2CF58D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idyisNLwX/81MGmvTcXblC/vtIFhEqtsf+2ziThKUl0=; b=U30hHvlPcIb/fwhHj5zFcrz83U
	09/L6DVl58o1gGkM7V9OnrhNA2JZlOuh6LrqsKB2C4pwlF7CiNwiLQfOWsfU42ctoig2uHXYl2xF9
	x9aKTUes1rGWbw+O7IAhkD0KKS/Oe43I9EzsK24DEvhsBh2suP4Ck8ucuZ1+Cpa23yaMWkOZe/1Qj
	ltihSwPr8hnwpqvGkVWEz418oMmwgRrXYW7oca8L4A1WJI616Mx1pqM0H29Ek09h01Es+mUlCG7vF
	qmxSAaL922CF7PxG/gyKqGwZsJ/36+0hwCHP+G7jzZj9O2Q+pUsghfEr94vtfaYWFZZl3MlpdRPGb
	7VyaC8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoBl-00000005Bl8-1xdl;
	Wed, 19 Nov 2025 19:50:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoBi-00000005Bik-1Gmc;
	Wed, 19 Nov 2025 19:50:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3127A4E417A9;
	Wed, 19 Nov 2025 19:49:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D932060699;
	Wed, 19 Nov 2025 19:49:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9639A102F2165;
	Wed, 19 Nov 2025 20:49:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763581794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=idyisNLwX/81MGmvTcXblC/vtIFhEqtsf+2ziThKUl0=;
	b=JXf09Dz37KSxb84fPt0xCNsN6GavF6zxGYaDnAtetqDs1Km7Qg7tyl3ucVCrlP7/wI3vAH
	Brt1JLyQr6Z57RRLIel57nTLTRpZp/sci2HRmjHC9IN8P66AnuvhSLwoAleU1e/B5bLIs9
	iaCY9MyqzKGWVk2uTAulwuStyUlVPQz3dHD/IHrZ0mSJPM4G72sjQoDupWx8MFVv4jORI6
	skNrYrosDF7JY6jIe6vF8gCgT7WtJ7AMpQezOWiZJq6UpmsLH1LyIMmlFoUNpI6slEiwTZ
	GOY43hLWnRXakTMPShCKL/gGL2evdNlbs5ZmEWzSbKZqvB85NowHOsfPoUyZLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 20:49:42 +0100
Message-Id: <DECXKE9A67HG.35AR5UZKKQ8A1@bootlin.com>
To: "Chaoyi Chen" <chaoyi.chen@rock-chips.com>, "Chaoyi Chen"
 <kernel@airkyi.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Peter Chen" <hzpeterchen@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Sandy Huang" <hjc@rock-chips.com>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Yubing Zhang" <yubing.zhang@rock-chips.com>,
 "Frank Wang" <frank.wang@rock-chips.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Amit Sunil Dhamne"
 <amitsd@google.com>, "Dragan Simic" <dsimic@manjaro.org>, "Johan Jonker"
 <jbx6244@gmail.com>, "Diederik de Haas" <didi.debian@cknow.org>, "Peter
 Robinson" <pbrobinson@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 08/10] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-9-kernel@airkyi.com>
 <DE5YP3AVGOG3.OHP68Z0F6KBU@bootlin.com>
 <b1a339e7-a011-4b4b-8988-2e3768753c85@rock-chips.com>
 <2ebace6f-d3c4-4516-b6cb-4951de06b6c8@rock-chips.com>
In-Reply-To: <2ebace6f-d3c4-4516-b6cb-4951de06b6c8@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_114958_481327_BB493417 
X-CRM114-Status: GOOD (  17.67  )
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

Hello Chaoyi,

On Mon Nov 17, 2025 at 2:33 AM CET, Chaoyi Chen wrote:
...
>>>> +=C2=A0=C2=A0=C2=A0 /* One endpoint may correspond to one next bridge.=
 */
>>>> +=C2=A0=C2=A0=C2=A0 for_each_of_graph_port_endpoint(port, dp_ep) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_node *next_b=
ridge_node __free(device_node) =3D
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of=
_graph_get_remote_port_parent(dp_ep);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge =3D of_drm_find_bri=
dge(next_bridge_node);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!bridge) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -EPROBE_DEFER;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp->next_bridge_valid =3D =
true;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp->next_bridge_list[count=
].bridge =3D bridge;
>>> You are storing a reference to a drm_bridge, so have to increment the
>>> refcount:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp->next_bridge_list[count].=
bridge =3D drm_bridge_get(bridge);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^
>>>
>>> FYI there is a plan to replace of_drm_find_bridge() with a function tha=
t
>>> increases the bridge refcount before returning the bridge, but it's not
>>> there yet. When that will happen, the explicit drm_bridge_get() won't b=
e
>>> needed anymore and this code can be updated accordingly.
>
> Out of curiosity, I checked the callers of of_drm_find_bridge(), and it
> seems that the vast majority of them do not pay attention to the increase
> or decrease of reference counts.

They do not call drm_bridge_put() to decrease the refcount, and that's
"correct" because of_drm_find_bridge() does not increase it. This was
totally correct in the past because DRM bridge refcounting did not exist.

Refcounting has been added to support hot-pluggable bridges. If you want
more info, this presentation I gave at ELCE 2025 is a good summary, with
links to relevant patches:

 * Video (start at 19:30): https://www.youtube.com/watch?v=3DmsmBQBSyZZ4
 * Slides (start at slide 27):
   https://bootlin.com/pub/conferences/2025/elce/ceresoli-hotplug-status.pd=
f

> Does this mean that even if we add reference counting in
> of_drm_find_bridge(), we still need to modify the corresponding functions
> of their callers and decrease the reference count at the appropriate
> time?

Exactly. I have explored that approach but it turned out being not
reasonably doable due to the large number of (direct + indirect) callers of
of_drm_find_bridge() as well as the trickiness of those involvingthe
panel_bridge. So Maxime proposed a different approach [0]: deprecate
of_drm_find_bridge() and replace it with a function that increments the
refcount, then let the various callers move to the new function over time.

Earlier today I sent a series doing that, and converting lots of users
[1]. If/when that approach will be accepted, you can update your driver to
use the new drm_of_fund_bridge() and take care of putting the reference
when appropriate. But you don't need to do anything until then.

[0] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad=
@houat/
[1] https://lore.kernel.org/lkml/20251119-drm-bridge-alloc-getput-drm_of_fi=
nd_bridge-v1-0-0db98a7fe474@bootlin.com/

> Thank you.

You're welcome. I hope it was a clear explanation.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

