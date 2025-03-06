Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FD2C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfUhAo+atCGxKbgDynhG8+exAGkzvMvPHlUVaCXqecY=; b=g4sp52VlQzB3jAZhQ7G3WDf+vF
	nR0T9jvHypj3SqcVoo8KAXo/amxDe6Ry8mHtfiqBKp8jMMrQX0zdMi5ZJBtsM4k97uv0B65wYGxNS
	GK1tAkR60zWPMxphpa14fhM7/dk/Xmc4ifB92AHIkR6I76nLGzadcY2HLbsndy3WferyVBhmwt6NZ
	kKS37LGdQlbt1UM1O2uJdr9aDh4DGOorlgvOQRMSP5fGOzojpeKNkcLjq8jYJN2562EMqVxy7fQTK
	zT5fY/IW4JMRK4qJLEErgVJ8HuApBKqeYohK+MX7fpilYyuZaRsk9d0YsCzU9FCAeYVaWiJsxcXrn
	y8eQYQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBUP-0000000B5NF-41o4;
	Thu, 06 Mar 2025 13:42:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBNj-0000000B4Tk-3j5Q;
	Thu, 06 Mar 2025 13:35:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 147E5A44C5D;
	Thu,  6 Mar 2025 13:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9BAC4CEE5;
	Thu,  6 Mar 2025 13:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741268122;
	bh=TEsU6Ht+78gm09L1SBIsP4bdIB/vCUld4RHRuN+JlCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+TL6TFUsUtdn/wseDX/hYan08UFevaGvb3dKbl/pMQO1gxynYz1WPVc+GwbDdGSg
	 G6VVxvTMlQ151wtr2rH2dXaRev4a14umu7sY4Zpa2E8jjqn2gzTw/l+8SCDIEpXjkQ
	 SSvUXWrM+81mTvqh60ZrJFDki3uEYB6At22GMnkZYwODW1iKnJgtlGNQ18rpCVuwuZ
	 rA923hDM/3tLy0TqI8K+ZM49CkkiPZGP4b/ICuIOQNEH0aHIwSOuINFcFghhD2ubZW
	 qGqH8P7KYxHxv4Pt5qntnkp7sYPguNuZ0Rl6JwC+DQwcBKr6i/dsnUfA0pel585GA0
	 i0LNrLA0fM4/A==
Date: Thu, 6 Mar 2025 14:35:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 03/12] phy: rockchip: samsung-hdptx: Fix clock ratio
 setup
Message-ID: <20250306-masked-voracious-octopus-be05b8@houat>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
 <20250304-phy-sam-hdptx-bpc-v4-3-8657847c13f7@collabora.com>
 <20250304-small-mindful-mongrel-bd6f8b@houat>
 <155f609f-994f-4140-8453-7e38a5e6deef@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5o2wzlaqjbtp76c4"
Content-Disposition: inline
In-Reply-To: <155f609f-994f-4140-8453-7e38a5e6deef@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_053524_058292_19DC25CB 
X-CRM114-Status: GOOD (  25.87  )
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


--5o2wzlaqjbtp76c4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 03/12] phy: rockchip: samsung-hdptx: Fix clock ratio
 setup
MIME-Version: 1.0

On Tue, Mar 04, 2025 at 02:04:18PM +0200, Cristian Ciocaltea wrote:
> Hi Maxime,
>=20
> On 3/4/25 10:13 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Mar 04, 2025 at 03:44:02AM +0200, Cristian Ciocaltea wrote:
> >> The switch from 1/10 to 1/40 clock ratio must happen when exceeding the
> >> 340 MHz rate limit of HDMI 1.4, i.e. when entering the HDMI 2.0 domain,
> >> and not before.
> >>
> >> While at it, introduce a define for this rate limit constant.
> >>
> >> Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY dr=
iver")
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drive=
rs/phy/rockchip/phy-rockchip-samsung-hdptx.c
> >> index f88369864c50e4563834ccbb26f1f9f440e99271..cf2c3a46604cb9d8c26fe5=
ec8346904e0b62848f 100644
> >> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> >> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> >> @@ -320,6 +320,7 @@
> >>  #define LN3_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> >>  #define LN3_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
> >> =20
> >> +#define HDMI14_MAX_RATE			340000000
> >>  #define HDMI20_MAX_RATE			600000000
> >> =20
> >>  enum dp_link_rate {
> >> @@ -1072,7 +1073,7 @@ static int rk_hdptx_ropll_tmds_mode_config(struc=
t rk_hdptx_phy *hdptx,
> >> =20
> >>  	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
> >> =20
> >> -	if (rate >=3D 3400000) {
> >> +	if (rate > HDMI14_MAX_RATE / 100) {
> >=20
> > The rate seems to come from rk_hdptx_phy_power_on and eventually from
> > tmds_char_rate in the PHY config options, so its rate is in Hertz.
>=20
> The rate coming from rk_hdptx_phy_power_on() is in hHz, since it passed
> via dw_hdmi_qp_rockchip_encoder_enable() as
>=20
>   phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
>=20
> > HDMI14_MAX_RATE and HDMI20_MAX_RATE are both defined in Hertz as well.
> > It seems super odd to mee that you then convert HDMI14_MAX_RATE to hHz?
>=20
> This stems from the ropll_tmds_cfg table containing the configuration
> params for the supported rates which requires the search keys to be
> provided in hHz rather than Hz.
>=20
> I agree this is nothing but confusing, that's why I fixed this up in
> "phy: rockchip: samsung-hdptx: Avoid Hz-hHz unit conversion overhead"

Yeah, sorry, I noticed it after sending the review. Still, I'd advise to
put that patch first, it's a bit weird to add more patch we're going to
rework later on.

Maxime

--5o2wzlaqjbtp76c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8mklwAKCRAnX84Zoj2+
dqsKAX4nqDcG5Vb45Qfy+reElIgfRIEkKdypEs03k8+dDGrmbgN4qMjCkJ/EBkjn
HbmMAisBfRB4vWfpfcqsMV2LqZBvfAivr19nVh8LflLAH8Q/WFHnP5NlHsqmOcuv
WXoDH3DoGQ==
=ZIQ8
-----END PGP SIGNATURE-----

--5o2wzlaqjbtp76c4--

