Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D48C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uR07AKA03taQYzX+ZjGzS07Lzyba1XHHLaGn40KNnHo=; b=OWbB4mtdpwSD6DIEXhA0z7xo5y
	L8tOasXoeRkMHsTtZAGYR67LymUeNe+Y+uL5vPdlllmtgLWyXzVopXJW5/V8cHmLpcfA9dt65PbP0
	OexEGOyqnZqOBMFjOF5imuAb4gysyefArc90PrVQBwyW/Q3Lwz17lUTkurXDEi+x9CJFLnt/+RPmR
	FJVRpslWGa5ytT6sZDdNZ//j2j8tjedk+KbBeBKkWhuIAJtfLy5a5NoIOB1YZRoVpInq2DTc6YvBS
	Ssb7YqzVy7V2J983scBmPchnObAkJtSg+RP44aGKPqB0nVTiszGsJwzLLPloP8tT5vmoxCEAbk4zR
	uTv8pOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZx0-00000004JPj-3Xp4;
	Tue, 15 Jul 2025 07:19:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZuX-00000004IpP-09Rp;
	Tue, 15 Jul 2025 07:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uR07AKA03taQYzX+ZjGzS07Lzyba1XHHLaGn40KNnHo=; b=qZOEzaiWmPfGWbRrPXsJ9vJzT4
	wljB0WDCO0YXn6h+/tmgdcbGXlRe1hMX9zA27p8Gym3SkdnxJKn2QupLQFxCktjGoqZvMcdKU42f+
	BsFB+pDz0IGQRuyxRvqeh6jlXf3x1RqylAGiJLUZnTpJPuYNu9HX/Iscl+O5OMKgr9mujgIBBUWW+
	a4x8f9oPy8vriFLcdu8Nx0YRY55GgS4khKiaE3E8nc7QcsnseALYo5VYeUs0itRPcAEv4Cy0UQxeJ
	/zVtCyUvAkqaMe1BrmAfVRNMpbBZWYlUC0U5ZbxpwoVUz+KXdRQSD3dB9Oj7g1mgeMdPJcyIUS72t
	lSogO6qA==;
Received: from i53875a5c.versanet.de ([83.135.90.92] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubZuN-0006t0-D6; Tue, 15 Jul 2025 09:16:59 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: merge sections for ROCKCHIP VIDEO DECODER DRIVER
Date: Tue, 15 Jul 2025 09:16:55 +0200
Message-ID: <3261271.ElGaqSPkdT@diego>
In-Reply-To: <20250715063134.100733-1-lukas.bulwahn@redhat.com>
References: <20250715063134.100733-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_001709_136319_55BB3855 
X-CRM114-Status: GOOD (  18.06  )
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

Am Dienstag, 15. Juli 2025, 08:31:34 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Lukas Bulwahn:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit d968e50b5c26 ("media: rkvdec: Unstage the driver") moves the driver
> from staging/media/ to media/platform/rockchip/ and adds a new section
> ROCKCHIP RKVDEC VIDEO DECODER DRIVER in MAINTAINERS. It seems that it was
> overlooked that the section ROCKCHIP VIDEO DECODER DRIVER in MAINTAINERS
> already existed, referring to the same files before the driver was moved
> as the new section refers to after the driver was moved.
>=20
> So, merge the information from the two sections for ROCKCHIP (RKVDEC) VID=
EO
> DECODER DRIVER into one. This essentially results in adding the maintainer
> of the previously existing section in the new section and then removing
> that previously existing section.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  MAINTAINERS | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5efcdb5537f5..d044e4f71ae5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21673,6 +21673,7 @@ F:	drivers/media/platform/rockchip/rga/
> =20
>  ROCKCHIP RKVDEC VIDEO DECODER DRIVER
>  M:	Detlev Casanova <detlev.casanova@collabora.com>
> +M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>  L:	linux-media@vger.kernel.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
> @@ -21693,14 +21694,6 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
>  F:	sound/soc/rockchip/rockchip_sai.*
> =20
> -ROCKCHIP VIDEO DECODER DRIVER
> -M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> -L:	linux-media@vger.kernel.org
> -L:	linux-rockchip@lists.infradead.org
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> -F:	drivers/staging/media/rkvdec/
> -
>  ROCKER DRIVER
>  M:	Jiri Pirko <jiri@resnulli.us>
>  L:	netdev@vger.kernel.org
>=20





