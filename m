Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B8DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 00:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/RK+iCwMDOjsz6qGHyrgosuNTC74b/O0wp4fma2qaQ=; b=26dHHKXXW54O8NsvxYrL/o48nz
	c9F4ER10zFQqbA0R2LhJ8ux+P3r0mxbVejaY8zalyvW2ddP+VDikVQO0afiz6u6sawFzhz/vd04xu
	t/0TCSUjF+ddc0BF6bbj14+duAeZUh6NMmrNZ8VYDfD02T/MthSJVnQwUFpcALRbp8unc1kzJNmEL
	qjYlK6YdQqy+FLcVtNzUAqCj8S4MhuWPV2ab0tM+UhiU9qGn/XM/cDDlB21LLtYXsjb4IapQtwgzk
	A49q/8qF3YFBRxa5JRZnfBm9kklQ1aCF+acMReNT2EMR2sgkZyvioqFMtE/viGCLZYbxhNx+GuyWK
	yI0n+n7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQkZ-00000003S3I-2ebf;
	Fri, 20 Dec 2024 00:20:15 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQiP-00000003RRC-1sMG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 00:18:03 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1734653876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S/RK+iCwMDOjsz6qGHyrgosuNTC74b/O0wp4fma2qaQ=;
	b=RL++tx/GUnwLN9G3bQCBvzqbyINV1kneBL1xXtIsv/Kn9nBODpK6zMbUJIcvfASm1ZlFc5
	VtM3aR/JJkN+2RW1IuI1KnbudmdXs1kQjcyecZDgGytPV6s9wQqfKwITLly7LHBEqZulKj
	rD5AX57YauDEvqdc/SRum3I1y1KgTt0gTDDEqitA+iUXkalBDAGN7m5Fcc9ZLAScwTy39Z
	msnxadguluUjlinKAd4BwJ3oylD4gCTvIjnoyLQO6p2pVdKbW3ijZB1I0BG2AYZgWFTMSL
	P4nN9CSajxcslzBNFzmXXQWRUJUZerOLj4Lv1/25v0OJcTABH9Ccs825K0KveA==
Content-Type: multipart/signed;
 boundary=011e6b374dd8cc6329fed8e851dfa8c3e80f3228d231932c98a778791d9f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 20 Dec 2024 01:17:42 +0100
Message-Id: <D6G3H3AXXVAJ.3F1WMBTWLX2KV@cknow.org>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <algea.cao@rock-chips.com>,
 <rfoss@kernel.org>, <heiko@sntech.de>, <devicetree@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <sebastian.reichel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <hjc@rock-chips.com>, <kever.yang@rock-chips.com>,
 <linux-rockchip@lists.infradead.org>, <vkoul@kernel.org>,
 <andy.yan@rock-chips.com>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <l.stach@pengutronix.de>
Subject: Re: [PATCH v3 07/15] drm/bridge: analogix_dp: Add support for phy
 configuration.
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Damon Ding"
 <damon.ding@rock-chips.com>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-8-damon.ding@rock-chips.com>
 <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
In-Reply-To: <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_161801_848199_D7F30418 
X-CRM114-Status: GOOD (  11.80  )
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

--011e6b374dd8cc6329fed8e851dfa8c3e80f3228d231932c98a778791d9f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Dec 20, 2024 at 1:13 AM CET, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 04:05:56PM +0800, Damon Ding wrote:
> >  void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *co=
unt)
> > @@ -546,10 +575,37 @@ void analogix_dp_get_lane_count(struct analogix_d=
p_device *dp, u32 *count)
> >  void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
> >  {
> >  	u8 lane;
> > +	int ret;
> > =20
> >  	for (lane =3D 0; lane < dp->link_train.lane_count; lane++)
> >  		writel(dp->link_train.training_lane[lane],
> >  		       dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
> > +
> > +	if (dp->phy) {
> > +		union phy_configure_opts phy_cfg =3D {0};
> > +
> > +		for (lane =3D 0; lane < dp->link_train.lane_count; lane++) {
> > +			u8 training_lane =3D dp->link_train.training_lane[lane];
> > +			u8 vs, pe;
> > +
> > +			vs =3D (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
> > +			     DP_TRAIN_VOLTAGE_SWING_SHIFT;
> > +			pe =3D (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
> > +			     DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > +			phy_cfg.dp.voltage[lane] =3D vs;
> > +			phy_cfg.dp.pre[lane] =3D pe;
> > +		}
> > +
> > +		phy_cfg.dp.lanes =3D dp->link_train.lane_count;
> > +		phy_cfg.dp.link_rate =3D
> > +			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
>
> This two should not be necessary, please drop them.

This too or These two (statements)?

> > +		phy_cfg.dp.set_voltages =3D true;
> > +		ret =3D phy_configure(dp->phy, &phy_cfg);
> > +		if (ret && ret !=3D -EOPNOTSUPP) {
> > +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret)=
;
> > +			return;
> > +		}
> > +	}
> >  }
> > =20
> >  u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, =
u8 lane)
> > --=20
> > 2.34.1
> >=20


--011e6b374dd8cc6329fed8e851dfa8c3e80f3228d231932c98a778791d9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ2S3qwAKCRDXblvOeH7b
brvoAP9rdY+F/m1jGw+mxL5qmV8ze/WQGLInbKNxmBNiT7RnnAEAmpHkct6n5nur
t6M6q47PJP6EzzpfIfsmJOaAH0THJwM=
=RI0b
-----END PGP SIGNATURE-----

--011e6b374dd8cc6329fed8e851dfa8c3e80f3228d231932c98a778791d9f--

