Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AADFCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYpIgsRGoc1h3CEuvI5Xrl49EXwii4szN8z3+fQvWh8=; b=pdF522i37C4k84UmE3A3kKENIi
	1/k1PIWVbOBnKvRzE+MnTCwtWcJWBJC+/CzOMm9SN55LwAc0y9up2odhqaIU5eaD5MKojtGocoz0/
	R0bP9jnx1T2cgHXbKTr+9ESwcoXg0KiCkTNXWiA+e5w5n6xynP1dznp5v7nJXmoqDq9gBYK6OlPmG
	aTEvlvxoDzBMThG10uK/oggCOtKQkk/qVmmKsZmRIqwe7xLBvpc536UJk7R83Fxcmpp855KitYvDN
	6iD+yz99a5c9aN+V2qjKLXXCLPAnW0HR8TeoTB41vxUPSV7FrhyvUTBCpx0M6KcjGRTrBgS8DW+hS
	YXX/1g+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQK68-00000004uor-0YIs;
	Tue, 02 Dec 2025 06:42:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQK60-00000004uoH-1tgb;
	Tue, 02 Dec 2025 06:42:50 +0000
Received: from ideasonboard.com (113x43x203x98.ap113.ftth.arteria-hikari.net [113.43.203.98])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E59B8E77;
	Tue,  2 Dec 2025 07:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764657627;
	bh=jLcjBx9AvHp2WbwJbosGQXZob7xTDXEgsrM1sIqbe6Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JBGWJfUvVCROXrhaNG0Ge1lXR/8RfqrkeQfq+4/j/eNmtZasxK6M0KIXziO7OvSPG
	 1b+yTFzMVRLmnz9p9ra4goqaKz64kpNupGtcYpBoyQ2JZqnc3tHLyIBwxMvCKdnFin
	 3VG5qFWTG21c40xQ1xCKbypJkivffaqurCfcI5ko=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251202015025.601549-2-rui.wang@ideasonboard.com>
References: <20251202015025.601549-1-rui.wang@ideasonboard.com> <20251202015025.601549-2-rui.wang@ideasonboard.com>
Subject: Re: [PATCH v1 1/1] media: rkisp1: Fix filter mode register configuration
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, Rui Wang <rui.wang@ideasonboard.com>
To: Rui Wang <rui.wang@ideasonboard.com>, dafna@fastmail.com, heiko@sntech.de, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, mchehab@kernel.org
Date: Tue, 02 Dec 2025 07:42:36 +0100
Message-ID: <176465775606.135635.13034018447792643478@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_224245_659911_B601A8A5 
X-CRM114-Status: GOOD (  14.78  )
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

Hi Rui,

Thank you for the patch.

Quoting Rui Wang (2025-12-02 02:50:25)
> The rkisp1_flt_config() function performs an initial direct write to
> RKISP1_CIF_ISP_FILT_MODE without including the RKISP1_CIF_ISP_FLT_ENA
> bit, which clears the filter enable bit in the hardware.

That sentence is a bit hard for me to understand. Maybe:

"The rkisp1_flt_config() function overwrites RKISP1_CIF_ISP_FILT_MODE
without preserving the RKISP1_CIF_ISP_FLT_ENA bit thereby unconditionally
disabling the hardware block on reconfiguration.

But as I'm no native speaker you could maybe wait for feedback from a
native speaker.

Functionality wise the change is correct.

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>

Best regards,
Stefan

>=20
> The subsequent read/modify/write sequence then reads back the register
> with the enable bit already cleared and cannot restore it, resulting in
> the filter being inadvertently disabled.
>=20
> Remove the redundant direct write. The read/modify/write sequence alone
> correctly preserves the existing enable bit state while updating the
> DNR mode and filter configuration bits.
>=20
> Signed-off-by: Rui Wang <rui.wang@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index c9f88635224c..6442436a5e42 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -411,12 +411,6 @@ static void rkisp1_flt_config(struct rkisp1_params *=
params,
>         rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_LUM_WEIGHT,
>                      arg->lum_weight);
> =20
> -       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE,
> -                    (arg->mode ? RKISP1_CIF_ISP_FLT_MODE_DNR : 0) |
> -                    RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
> -                    RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
> -                    RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1));
> -
>         /* avoid to override the old enable value */
>         filt_mode =3D rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_FILT_MOD=
E);
>         filt_mode &=3D RKISP1_CIF_ISP_FLT_ENA;
> --=20
> 2.43.0
>

