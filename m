Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64209C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6BqIq05ryq1Sh+X3G28bfOtaOkP6fQ0GDNzbB9bowU=; b=C92WK7DtItygXEn757VsNx7Lxx
	M3FAQwY/9Mon1bK7c1IGpS5aFIC+6vptHlaFFJ893UgBG8adB3JELiF1E6WmM4arBzv051xLwV2YP
	W3jIHpB5Tdz1yHyAPZG12Lv6ArZ779dMa6uVkhHeP7jzNiYEINw/Mj07XlDS07gZ/vNYL0rjroABa
	LIpMZXDoA42u+NShJ052w8gASUxuEWLkSVeHcWFV9OdxwhAI62KGHt/mOjJZmKqs5u1kOeEpHLGaZ
	HOYg633ijMcue5NNCGtdnpAr+cJu/dn2TGsgSK0QVJ5e4pOZ7uxXT4U9fZegmGlF2g8T9gUHI9mrn
	rM76nzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PYD-00000001RWP-0Tir;
	Fri, 04 Sep 2026 08:45:33 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PY7-00000001RSW-3Q4S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:45:31 +0000
DKIM-Signature: a=rsa-sha256; b=EkxvcqXJUotED2akpKr+G9sc1HM5mP3STjAjPDxMepMj9gsfZ3uWb9gAfKbj7V2aoVFUqs1hbtw0aAQR1dxnccEQy3i6ho6oUXXN2pagiakk39oHQOiQlvB9goL003JPOG+ebQ991/2StDyB6bwR0Hxh79djxAOI2IxpLBp//bEcsb4dz48RX5KimB5bvjWD9djF7hUB3sdYOJ1Coha7C9RbYws6lO+p6/hmtBuXnRiuNGXQulsiWXfO/b5skJdO0isBeQgjufN8A8bQFAP+u2PBjiqijlWoroeNvOCatvCGQ3Kva8yNkQNMsxy6bvDT6ASHzXOzwQMOVFstkiVw+A==; s=purelymail3; d=sverdlin.org; v=1; bh=RsHVk47pfRw/X0BzJydKqenz2Cyy9riFK5FXM/cyiZo=; h=Received:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=HEyT7cF+hrmZBr/5K5M8Gtv0ijrESPhg2e+bjwirdYTly1pBPEXs6yIRqYm/R4n1XKb4RQydtHueQyRhdBdQbr3vLaRuxGHGSRWxTkM6nX82DlSftnKHvvPoWpIHEWPAIPglWdOPWeSih5knaTC7cAUYgxUM6IQcxJIlO03o9TPaaik6+72+MXIKhn5/T8Abdk2ZlajwUwLvHl3cSWnDSR869eThVwXTlzqVD9ukEfJvGs4peYvwLUSehKt5qsqZ48DEsnHPQOHidOxrIsle149AdsnoKlSzMjIc3VoIlz68kv0m7L/3Pmz3kJGCp+vEBILCBUlQusdypQbkr/RAxg==; s=purelymail3; d=purelymail.com; v=1; bh=RsHVk47pfRw/X0BzJydKqenz2Cyy9riFK5FXM/cyiZo=; h=Feedback-ID:Received:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1559663149;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 04 Sep 2026 08:45:15 +0000 (UTC)
Message-ID: <ff52bd408755600284f1225f70c546e786035685.camel@sverdlin.org>
Subject: Re: [PATCH net-next 28/33] net: ethernet: ti: cpsw_new: Remove
 comma after sentinel-entry in match-table
From: Alexander Sverdlin <alex@sverdlin.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Date: Fri, 04 Sep 2026 10:45:15 +0200
In-Reply-To: <20260904043724.2955444-29-s-vadapalli@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
	 <20260904043724.2955444-29-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014527_944528_1A02FAB6 
X-CRM114-Status: GOOD (  12.74  )
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

On Fri, 2026-09-04 at 10:06 +0530, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>=20
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0drivers/net/ethernet/ti/cpsw_new.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti=
/cpsw_new.c
> index b6e25a4658d1..07832cad5e3c 100644
> --- a/drivers/net/ethernet/ti/cpsw_new.c
> +++ b/drivers/net/ethernet/ti/cpsw_new.c
> @@ -1875,7 +1875,7 @@ static const struct of_device_id cpsw_of_mtable[] =
=3D {
> =C2=A0	{ .compatible =3D "ti,am335x-cpsw-switch"},
> =C2=A0	{ .compatible =3D "ti,am4372-cpsw-switch"},
> =C2=A0	{ .compatible =3D "ti,dra7-cpsw-switch"},
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, cpsw_of_mtable);

