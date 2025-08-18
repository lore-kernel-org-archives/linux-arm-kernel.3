Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F957CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxySystUolElsZ8oKWT++LDXpxEDwIiYseF8Su16NVY=; b=ULbrlIXrH12/KksO/Jzu5N7fkz
	CCo/yG1M2UzxwUJmRIEqQci1FgyPCYSKQjqizsDApsO13+d0SAkPcJlOFiyvfvz4G0uRTjMN9gjeu
	FvZ6HZ2IZ1E1HHHKR2sZ6B6L2DS6/MZTl861PaRxLD1V/RuLicjZZynmBoPoYKIhDQKoEoWzZiAfi
	k8JehVjCHVIz/4k/thP4SwXXD2ODAf+9pL+RTwcs8ef261QnUr7v/qzs/pf6MUNQQbst70dy+5/F1
	lESemXBxIq2N8dcF/Bu+EhcKwcFDt0tOzy0zZRKsDS4qHbuvFk1naZAtJIwRyR6eIKOTZNFsr/mYT
	x5A3YlEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7O3-00000008iCK-3l5M;
	Mon, 18 Aug 2025 21:27:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5pb-00000008Ycx-17Y4;
	Mon, 18 Aug 2025 19:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SxySystUolElsZ8oKWT++LDXpxEDwIiYseF8Su16NVY=; b=cUYjT4gbI1gpOVIT6pOU121qvn
	b8fbNHhgBZLchyPkNK3cCqiRG83om9upg7EDR7oikdkFM4YHZyQR0hzvs3UtJZh0LJyAtb/qLhbwC
	hvgICRpdHczCYEB0xWfy60mkhOqd+AoK5FSy6YWf6132x9cwzR56KWZRqIMDaOhCk76CMIG1eZS4R
	QiUy0PTJ9MPLQl7O5Ii7n1gG2tTTTfnzQNLfnF1EPG175XaoJw2P5Hn8Mi7jtcWllX7lTQuDFIiGA
	hrfqqImWPmywOQgarHM0q4cKzo4jH3a7a3UrPThYDDKTPosGGx/zN0ynts1Vk8VcLy7OJVD/TlSe0
	3GcLbiMw==;
Received: from i53875ad4.versanet.de ([83.135.90.212] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uo5pU-0001Ei-Lz; Mon, 18 Aug 2025 21:47:40 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] thermal: rockchip: shut up GRF warning
Date: Mon, 18 Aug 2025 21:47:39 +0200
Message-ID: <2890475.6YUMPnJmAY@diego>
In-Reply-To: <b6cqwtj73twqxstslbhuulkgsmpds2hdyfsn7yewllkbtj7jz3@2kk74kgtefvp>
References: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
 <8402789.eFmWaWnqpD@diego>
 <b6cqwtj73twqxstslbhuulkgsmpds2hdyfsn7yewllkbtj7jz3@2kk74kgtefvp>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_124747_326138_B877BB0E 
X-CRM114-Status: GOOD (  21.67  )
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

Am Montag, 18. August 2025, 21:23:54 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Sebastian Reichel:
> On Mon, Aug 18, 2025 at 08:44:15PM +0200, Heiko St=C3=BCbner wrote:
> > Am Montag, 18. August 2025, 19:26:15 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Sebastian Reichel:
> > > @@ -1621,12 +1656,16 @@ static int rockchip_configure_from_dt(struct =
device *dev,
> > >  		return -EINVAL;
> > >  	}
> > > =20
> > > -	/* The tsadc wont to handle the error in here since some SoCs didn't
> > > -	 * need this property.
> > > -	 */
> > > -	thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf"=
);
> > > -	if (IS_ERR(thermal->grf))
> > > -		dev_warn(dev, "Missing rockchip,grf property\n");
> > > +	if (thermal->chip->grf_mode !=3D GRF_NONE) {
> > > +		thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf=
");
> > > +		if (IS_ERR(thermal->grf)) {
> > > +			ret =3D PTR_ERR(thermal->grf);
> > > +			if (thermal->chip->grf_mode =3D=3D GRF_OPTIONAL)
> > > +				dev_warn(dev, "Missing rockchip,grf property\n");
> >=20
> > I guess it might make it easier for people seeing the log, if we could
> > insert an "optional" into that message for the optional tier.
>=20
> Sure, I can add an "optional". I'm not sure how "optional" they
> really are, though. Code like this looks quite fishy to me:
>=20
> if (grf)
>     regmap_write(grf, ..., RK3568_GRF_TSADC_TSEN);
>=20
> I marked these as optional, as the driver should probe without the
> GRF. But to me it looks like most platforms with optional GRF
> support should have been made mandatory in the first place.

okay ... then I take it back, and we should leave out the optional.

That way people may wonder and possibly verify their soc variant
or build setup.


Heiko



