Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A2E67A9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHzjooMLjEqCTLZkR7Emb0dRbrH9mQHksD/dLPxL7GM=; b=rvbdoZqRxoNI6ulp4tJ4gon7XW
	pDtGL5R8JKPyHrdcTzsvwvLD0D42x8REuvVRghFxo179ipkSns2Rob8Zw/0ftn/rFF1s1SXbChCqW
	2N3Q+DL3gqs5CemIdJXeY+ckhorRdhWDaiLuGN6rzghdstZGAUQesXIqCEoOQ6Jvkl6Odj5v0HYeQ
	op5DUMoIBO8FQIsK0qqYQ4JAMeMkD1NAAzpPO0v9Cfz7pPJn2+rXGwG+g97yzxZkXGv3+SKTqICA1
	plcnTKJpUrXP6b2i2jMAOGo1j9VsrNTtJbgr6lZUVt4ASzFsoh36zLkKK/K25rzafKR4lMGtwZSpV
	dswQ/paQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLV5-0000000EpAD-1ylE;
	Tue, 03 Mar 2026 08:53:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLV2-0000000Ep9H-3WXv;
	Tue, 03 Mar 2026 08:53:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C6914E424F4;
	Tue,  3 Mar 2026 08:53:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF6105FF29;
	Tue,  3 Mar 2026 08:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B877610368535;
	Tue,  3 Mar 2026 09:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772527980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dHzjooMLjEqCTLZkR7Emb0dRbrH9mQHksD/dLPxL7GM=;
	b=WRRhIhW7vgeQlUBtRYy3lSHT0g7ssIR9CeRQtfoaN7OdZZdWE5SukFGsLLbCIdZ9Rvk5P5
	x3YGBf1y7LiWXgLFbXOctHmnCPnz6MEz3JcxtoJgT292PBQcgsZgMb67LDJ4ygTtonXGHl
	NptOg5QWRQocFJ+rT7Ew6sQ0KYNhopPIv/Sav8VfDWGHMf3N+Fwfq3dDYHpRN0lgFNsuS4
	Ag/RcE50VgDX70ljiGOuXWmZFxz47/OxtST229tGXoP+k/sbo+ZIeYJPL0S9DBPiU1pXDO
	7lRXVgu2hOg0vCWsWnhBaS9gdwTuafASl358/MHiepvPTdxf4JFQsgDLCDOXbQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 09:52:49 +0100
Message-Id: <DGT0Q3TGTG26.KD9DBZYH63DY@bootlin.com>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dmitry Baryshkov"
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
 Robinson" <pbrobinson@gmail.com>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
To: "Chaoyi Chen" <chaoyi.chen@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v14 7/9] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
X-Mailer: aerc 0.20.1
References: <20260119073100.143-1-kernel@airkyi.com>
 <20260119073100.143-8-kernel@airkyi.com>
 <DGSHIQOB2YTB.1559SD1YLGT7P@bootlin.com>
 <601a8b51-7411-429d-91a1-0633cabce9ee@rock-chips.com>
In-Reply-To: <601a8b51-7411-429d-91a1-0633cabce9ee@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_005305_018602_5144B9D0 
X-CRM114-Status: GOOD (  13.27  )
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

On Tue Mar 3, 2026 at 1:44 AM CET, Chaoyi Chen wrote:
>>> +static int cdn_dp_parse_next_bridge_dt(struct cdn_dp_device *dp)
>>> +{
>>> +	struct device_node *np =3D dp->dev->of_node;
>>> +	struct device_node *port __free(device_node) =3D of_graph_get_port_by=
_id(np, 1);
>>> +	struct drm_bridge *bridge;
>>> +	int count =3D 0;
>>> +	int ret =3D 0;
>>> +	int i;
>>> +
>>> +	/* If device use extcon, do not use hpd bridge */
>>> +	for (i =3D 0; i < dp->ports; i++) {
>>> +		if (dp->port[i]->extcon) {
>>> +			dp->bridge_count =3D 1;
>>> +			return 0;
>>> +		}
>>> +	}
>>> +
>>> +	/* One endpoint may correspond to one next bridge. */
>>> +	for_each_of_graph_port_endpoint(port, dp_ep) {
>>> +		struct device_node *next_bridge_node __free(device_node) =3D
>>> +			of_graph_get_remote_port_parent(dp_ep);
>>> +
>>> +		bridge =3D of_drm_find_bridge(next_bridge_node);
>>> +		if (!bridge) {
>>> +			ret =3D -EPROBE_DEFER;
>>> +			goto out;
>>> +		}
>>> +
>>> +		drm_bridge_get(bridge);
>>> +		dp->next_bridge_valid =3D true;
>>> +		dp->next_bridge_list[count] =3D bridge;
>>
>> Correct, but the drm_bridge_get() slightly far away from the assignement=
 is
>> a bit misleading. I hadn't seen it initially so I suspected a missing ge=
t.
>>
>> I suggest to do it in a single statement, for clarity:
>>
>> 		dp->next_bridge_list[count] =3D bridgedrm_bridge_get(bridge);
>>
>
> I think the bridgedrm_bridge_get here seems to be a typo?

Oops, of course! :)

As you probably guessed, I was meaning:

		dp->next_bridge_list[count] =3D drm_bridge_get(bridge);


> Anyway, thank you very much for your efforts on the bridge lifetime.
> I will fix this in the next version :)

Thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

