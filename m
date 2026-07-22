Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BC3C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOXPm8o22G3vUPAbeNPnzSXYixZ2p8TGz/NewzgbISM=; b=scZWrJl4QjcVBXV80J9A0atxUl
	C6j09t55XB62Gqf+Bq65svO6bEQk2cQwmFN46PUSbbjzM8zsbhhYIR/Zkqt0P0T5URkHt3/a8i9vC
	9rNEw/wu+8Li9b9dw/VXXmV28pRqywSE3wrCIx2zhmnG+EmmAQ/3QxUF4XxJBoX4JaZ605t7XaI9s
	Ljek+aDNZNGVa1vIpEmraWoAMS68dvYXudiO0k3EyDBjYktIga8kQ374hnPMZlQeTBooigKdu5ECf
	v8/9afvrU0zLK+m4OSHhf0eMZYS0p2F1qLA5VyYrSe0+IP51LUWfOwMwKutYx2nI7fPfb4eHRqTW5
	4tUkq++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQji-0000000Azmo-1rqc;
	Wed, 22 Jul 2026 06:47:22 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQje-0000000Azlc-39Q4;
	Wed, 22 Jul 2026 06:47:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EB0EE200A6A;
	Wed, 22 Jul 2026 08:47:15 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmQjb-000h6i-2q;
	Wed, 22 Jul 2026 08:47:15 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmQjb-000000003DA-3DQo;
	Wed, 22 Jul 2026 08:47:15 +0200
Message-ID: <cd13a97b78f3d940d23b52f94b39f99c52212d0a.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] thermal/drivers/mediatek/lvts_thermal: Make
 reset optional for MT8196
From: Philipp Zabel <p.zabel@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	rafael@kernel.org
Cc: daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	laura.nao@collabora.com, fshao@chromium.org,
 wenst@chromium.org, 	jiapeng.chong@linux.alibaba.com,
 frank-w@public-files.de, bchihi@baylibre.com, 	linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Date: Wed, 22 Jul 2026 08:47:15 +0200
In-Reply-To: <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
	 <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_234718_941528_063A8628 
X-CRM114-Status: GOOD (  20.03  )
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

On Di, 2026-07-21 at 12:52 +0200, AngeloGioacchino Del Regno wrote:
> Depending on the SoC+Firmware combination, the LVTS hardware may be
> may be actively used by one or even multiple concurrent MCUs!
> In this case, resetting it may produce either a severe slowdown of
> the entire system, or even a thermal protection AP reset, as some
> MCU(s) may be reading a very high or very low temperature while the
> LVTS is being reset.
>=20
> On those, don't fail if no reset is found as that may be omitted on
> purpose, but still check if there's one, because some board(s) may
> be running on a different bootchain with reduced firmwares or using
> firmwares with reduced functionality.
>=20
> So, use devm_reset_control_get_optional_exclusive() instead, as the
> LVTS controller always had only one reset and retrieving that by
> index, specifically, always made little sense anyway.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 92711896ce24..8b779fc5e970 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1473,7 +1473,20 @@ static int lvts_probe(struct platform_device *pdev=
)
>  	if (IS_ERR(lvts_td->base))
>  		return dev_err_probe(dev, PTR_ERR(lvts_td->base), "Failed to map io re=
source\n");
> =20
> -	lvts_td->reset =3D devm_reset_control_get_by_index(dev, 0);
> +	/*
> +	 * Depending on the SoC+Firmware combination, the LVTS hardware may be
> +	 * may be actively used by one or even multiple concurrent MCUs!
> +	 * In this case, resetting it may produce either a severe slowdown of
> +	 * the entire system, or even a thermal protection AP reset, as some
> +	 * MCU(s) may be reading a very high or very low temperature while the
> +	 * LVTS is being reset.
> +	 *
> +	 * On those, don't fail if no reset is found as that may be omitted on
> +	 * purpose, but still check if there's one, because some board(s) may
> +	 * be running on a different bootchain with reduced firmwares or using
> +	 * firmwares with reduced functionality.
> +	 */
> +	lvts_td->reset =3D devm_reset_control_get_optional_exclusive(dev, NULL)=
;

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

