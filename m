Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C62CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0DIzPujR51KawnyneEkE969n8XYpCXzqrlH2W/TaIQ=; b=WYOEvFmhd/fqY/AcWAm7WyTsi9
	qvT9Acd42CoBMJt3U6V/HqcFvH1W3LzNlzHAjcAQSxaBOwGe3ghBKz5A+le3NpfcJHd4YOs36MYiA
	UjnvHANlRR1LKuYxZtYxp02b4Qv2c1XJpQ0dJhIxgEU/3Ns88OIlKfoGDvOhfZ3llehnW1RqDLplw
	SuYPgNusWAvQATQOPhJkwONumK+eL7bTyHlCu+t+idN/55RxHCkrcvP8WbzveLL/MNFEDtN9PRv3L
	7SVDC+gsXjTlo8gGFLm4YAPjYQIHc2lie+nDP9UOHCfF9dGYy3SHjso4GUa9sSU52Wj+iXXfUI5WA
	aE3HMvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8RK-00000000sZD-2erD;
	Thu, 18 Jun 2026 08:49:34 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8RH-00000000sYr-1YvN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:49:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A3BF72002AA;
	Thu, 18 Jun 2026 10:49:28 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa8RE-003PSu-1n;
	Thu, 18 Jun 2026 10:49:28 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa8RE-000000003qH-1ylc;
	Thu, 18 Jun 2026 10:49:28 +0200
Message-ID: <56c99d63c2c1b8116b9fb779b413e3240816b89a.camel@pengutronix.de>
Subject: Re: [PATCH v4 resend 2/5] reset: cix: add audss support to sky1
 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 18 Jun 2026 10:49:28 +0200
In-Reply-To: <20260617064100.1504617-3-joakim.zhang@cixtech.com>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
	 <20260617064100.1504617-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_014931_565007_E80A92AE 
X-CRM114-Status: GOOD (  15.23  )
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

On Mi, 2026-06-17 at 14:40 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Extend the Sky1 reset controller driver for the AUDSS CRU syscon. The
> AUDSS block provides sixteen active-low software reset bits in one
> register for audio subsystem peripherals, reusing the existing
> regmap-based reset ops used by the FCH and S5 system control variants.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  drivers/reset/reset-sky1.c | 86 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 83 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
> index 78e80a533c39..af32ee005ebc 100644
> --- a/drivers/reset/reset-sky1.c
> +++ b/drivers/reset/reset-sky1.c
[...]
> @@ -343,21 +379,65 @@ static int sky1_reset_probe(struct platform_device =
*pdev)
>  	sky1src->rcdev.of_node   =3D dev->of_node;
>  	sky1src->rcdev.dev       =3D dev;
> =20
> -	return devm_reset_controller_register(dev, &sky1src->rcdev);
> +	ret =3D devm_reset_controller_register(dev, &sky1src->rcdev);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, sky1src);
> +
> +	if (of_device_is_compatible(dev->of_node, "cix,sky1-audss-system-contro=
l")) {

The compatible was already evaluated by of_device_get_match_data(), you
could check (variant =3D=3D &variant_sky1_audss) here.


regards
Philipp

