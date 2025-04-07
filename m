Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23331C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcEmP8BWR9G6jF7SFswjkfMRfPbz6AuZJB2v6MIMGzY=; b=ZpxpmdPK5fezazwlYRkikK0XyS
	3Z8SxTKzKWF9aqyBeBchK2+OgpnJv36sIAaNfOHQFPwGfx7auiDdsLsQma7YSSPGmTU6aNAa+B1yr
	/sEqBnfpKtpY8nw3pA5qf9dpsEJulg7hT3QjOfcclLIe4SIjxLTX4TBI/mq4BGkzEWHD1cAfPpCjc
	nGT9ZoeBPGMVH1YYRcw9SQ3uvh3dst9lCNA2IVM6+2jbSbuw+ZaXw7YCTguEEwSiigl3H7UM1fagZ
	z7U0eKq9VIoV34bY/LH0rwiRRR0ToIapBm3t2K4PQedQNzP3dXsEVH2/gAnrStSfUNe6D4UlhvWGj
	yEuGrHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYZ-00000001dDc-0DCr;
	Mon, 07 Apr 2025 18:50:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pd6-00000001Gov-1kYi;
	Mon, 07 Apr 2025 16:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fcEmP8BWR9G6jF7SFswjkfMRfPbz6AuZJB2v6MIMGzY=; b=RDLa366e7pfEavfl0soKISCI4K
	2DKfURBuxad42nrYy8swXY7tliKg0O4TXDzrYaTDfMmTr7EsVRZQ9ORzLtnSjTei3LApc8Nu2wvkd
	L/lRRGtpi8Kebp3Ef+pXvZuu91eMMKS66bvmr1ID6MgU/MFItUFiapZicLiUBDo08CVQGqdpp5uk3
	j4km0GiaM8HF7JzN+xrfogUFblT08spRSFWC9be+PABQKAjszKXZwYPGTuWKx+FC2Jc+UjBFlYwoI
	t95pHJFJhqoheBWvMWI1z8JtEbACBKlHj7e60Phpg0I1jfrO2VdNYUobrbrY49tzB3kJ0KGCtcB6Y
	S27u35Qg==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pd3-000000084RE-0BO9;
	Mon, 07 Apr 2025 16:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744044441; x=1775580441;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=d/9rF2v6gxz+aVjjloTd50bAqLAn569sdN/hKyUhniA=;
  b=StNe33wtqmNTXyRn0mk9qeP1sByARAW2sZdHEto/aidbogWuI0Kt1Q3q
   IOYSBUVG6bUHvDUbRhMqFMjKo7Yaocg+CzGrxarCzBhw7Tq5lXbRAhC4d
   ZvZjGMfA0PsMTRM1vzUXGWvHwbZP//Mhp1l4y173vd1OBQtafs7WCkn/d
   5VETtfELPESGZ9jV4QWuaPo34uwEDW2eDfakSlpJDq0k2mQFgK7zgj+eS
   mb4ubfmVbO6xW3Y81KG3WppRsXDzIpy8YGVPVACIiaQamE2DnU6ywvW3y
   QQQy/tkP4jZUpzzKezeljXwICHj4sv/hnmGefsEAzV22LvtX3HYbDBI9Q
   Q==;
X-CSE-ConnectionGUID: HViCMrgGQY6urprMpRR+2Q==
X-CSE-MsgGUID: fIJTYMMXRNCl9h+Sabfv1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45533295"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45533295"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:47:13 -0700
X-CSE-ConnectionGUID: dEMeJzZ7RJaZ+YDO48bYaw==
X-CSE-MsgGUID: yioqSJnkQC+IzOwpsUAeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127767783"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:47:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Apr 2025 19:46:59 +0300 (EEST)
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
    Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
    Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
    Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
    Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, 
    Douglas Anderson <dianders@chromium.org>, 
    Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
    Anusha Srivatsa <asrivats@redhat.com>, 
    Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
    =?ISO-8859-15?Q?Herv=E9_Codina?= <herve.codina@bootlin.com>, 
    Hui Pu <Hui.Pu@gehealthcare.com>, 
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
    dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
    LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
    imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
    linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
    linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
Message-ID: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com> <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1316811861-1744044419=:936"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_174721_486170_7343113B 
X-CRM114-Status: GOOD (  15.42  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1316811861-1744044419=:936
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 7 Apr 2025, Luca Ceresoli wrote:

> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/arm64/acer-aspire1-ec.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/=
arm64/acer-aspire1-ec.c
> index 958fe1bf5f85bb69ac7962f217de9f0b40cde9a1..438532a047e68799ac53a16a4=
c813fc16be997b9 100644
> --- a/drivers/platform/arm64/acer-aspire1-ec.c
> +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> @@ -452,9 +452,9 @@ static int aspire_ec_probe(struct i2c_client *client)
>  =09int ret;
>  =09u8 tmp;
> =20
> -=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> -=09if (!ec)
> -=09=09return -ENOMEM;
> +=09ec =3D devm_drm_bridge_alloc(dev, struct aspire_ec, bridge, &aspire_e=
c_bridge_funcs);
> +=09if (IS_ERR(ec))
> +=09=09return PTR_ERR(ec);
> =20
>  =09ec->client =3D client;
>  =09i2c_set_clientdata(client, ec);
> @@ -497,7 +497,6 @@ static int aspire_ec_probe(struct i2c_client *client)
>  =09fwnode =3D device_get_named_child_node(dev, "connector");
>  =09if (fwnode) {
>  =09=09INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
> -=09=09ec->bridge.funcs =3D &aspire_ec_bridge_funcs;
>  =09=09ec->bridge.of_node =3D to_of_node(fwnode);
>  =09=09ec->bridge.ops =3D DRM_BRIDGE_OP_HPD;
>  =09=09ec->bridge.type =3D DRM_MODE_CONNECTOR_USB;

Hi Luca,

It took a while to locate where the code for the new helper is. I suggest=
=20
if you need send another version of the series directly linking to the=20
commit in the cover letter so that it won't take multiple hoops to find it=
=20
if one wants to review the code and is not having all drm trees easily at=
=20
hand. Here it is for the benefit of other pdx86 people:

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b71=
5ea3d1ba537ef2da95eec


Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

I assume you want this to go through the drm tree where the helper already=
=20
is?

--=20
 i.

--8323328-1316811861-1744044419=:936--

