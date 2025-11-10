Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C84CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EfMCydae/7F+iOpCRHb8cMVqJTqdNLmoC7lMDCiTlg=; b=UFxWSWz+kVRwZPp2GSWTkkedue
	BIGU/a2Tt+rzxSgvkAq/+4d6xFhQCeg57nI/tHR7Ar5y8X6rMFtwifgS/WeVA7rgpQPsdQkbExyCP
	ytpGQbK0UvG4i03coxTgTcynnJ1Dq8TYMp6nhiAqQ10V+rl0zvaLjtMJlPCqHGtS2vfb759Fa+ggA
	gFnzayMQmsDzrwSVozRnEw0IUxCwuBHIH4JKfnaTVSJDLAac4bm914f7pkn/A/jGeWXbdK3M9QLXh
	ws/ny6KwufZ/0s0q8gQf00g4J1+pY9MdRVZJLFxDIDPJQuCRpw8eTO+R2qDGhnE6KAx7uw0RF+cNf
	GAU7tIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIObL-000000058Kg-1lUz;
	Mon, 10 Nov 2025 09:54:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIObH-000000058Jc-2pS1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:54:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIOav-0007E6-9l; Mon, 10 Nov 2025 10:53:53 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIOas-00802Y-2g;
	Mon, 10 Nov 2025 10:53:50 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIOas-000000006yf-36Uu;
	Mon, 10 Nov 2025 10:53:50 +0100
Message-ID: <802768a286aa167f7fdc80857508180964ac7f8c.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Add MT8189
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hanchien Lin <hanchien.lin@mediatek.com>, "Rafael J . Wysocki"	
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui	
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 raymond.sun@mediatek.com, 	Irving-CH.lin@mediatek.com
Date: Mon, 10 Nov 2025 10:53:50 +0100
In-Reply-To: <20251110094113.3965182-3-hanchien.lin@mediatek.com>
References: <20251110094113.3965182-1-hanchien.lin@mediatek.com>
	 <20251110094113.3965182-3-hanchien.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_015415_713490_3D02447D 
X-CRM114-Status: GOOD (  15.19  )
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

On Mo, 2025-11-10 at 17:40 +0800, Hanchien Lin wrote:
> Add support for the MediaTek MT8189 SoC to the LVTS thermal driver.
>=20
> Signed-off-by: Hanchien Lin <hanchien.lin@mediatek.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 155 ++++++++++++++++++++++--
>  1 file changed, 144 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index ab55b20cda47..8c15fdaac48c 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
[...]
> @@ -1334,9 +1359,15 @@ static int lvts_probe(struct platform_device *pdev=
)
>  	if (IS_ERR(lvts_td->base))
>  		return dev_err_probe(dev, PTR_ERR(lvts_td->base), "Failed to map io re=
source\n");
> =20
> -	lvts_td->reset =3D devm_reset_control_get_by_index(dev, 0);
> -	if (IS_ERR(lvts_td->reset))
> -		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get rese=
t control\n");
> +	if (!lvts_data->reset_no_need) {
> +		lvts_td->reset =3D devm_reset_control_get_by_index(dev, 0);

This should be devm_reset_control_get_exclusive(dev, NULL) instead of
devm_reset_control_get_by_index(dev, 0).

No need to use by_index for a single reset control.

regards
Philipp

