Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74BFCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOR0hONBCgnAOtPlpEiq+Hxh37W5wGpYCr6vX3T4P00=; b=c9JaHl0INi9r8NiqFLkPlODT0c
	cEper4xRZKV7oerRroWx9D0V0KXBgI0rcWyxVRZvmUaFzDeig938XbwrS5DrEm7oeDqVRg7Hufygc
	siL/M6CjSNY6AgSOu7KCWCDDQ4FoHWdPHX0oA3tgp899z87kQDvN67JZu2z6Ii/f8dQKkN43dtgZ+
	XbyP5dPqnGv4k6Uugb7WhX6AjVB/XK6Kb/4xCREMFVRH1Uqm22Q8lPq26FbZ9rfLtoJIa3RGwVGZD
	aL0cTYRz1GsPNIbJiLu46Nt5YD6AcYd808skvy1uBZH50Bfpfii0qn/I9fEVCUYHMEckV05JwA5XW
	uWa4ws6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQre-0000000BEy4-28Pk;
	Tue, 19 Aug 2025 18:15:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoN5h-0000000Aico-3SeR;
	Tue, 19 Aug 2025 14:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VOR0hONBCgnAOtPlpEiq+Hxh37W5wGpYCr6vX3T4P00=; b=XVIqOrWxqTmSb28RvJYOVuGYmg
	67/e+ta6Ry26Qu1pDepLc0M0XbcGJJbN04Iz+ck5hYvFsyztw8GtEmkuSq5UvFdAL4SY0ezWIRFCB
	yQEWGRKzHuUYSiFYNjMK0ntHgNAuoZl4qE2fdNU04GgaHBNdcdPwuMgNZ8B615SDFhNRY6738P9ip
	KjO80Q63+tqhS3azRamJg69vB+03we7mXlRmAYczSXF+6oo00e4/FtEd5HTGyfEaTopJV0/hwvT5c
	bQ4I8zYacojs5B1rnBfUifGfSk3Ty7fc6xRFvpk8js/5SN7eIgLzZINHuHIe/4Nufu2VbXIil5yTm
	dPw5uWkw==;
Received: from i53875a31.versanet.de ([83.135.90.49] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uoN5Z-0002JI-VN; Tue, 19 Aug 2025 16:13:26 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Robin Murphy <robin.murphy@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] thermal: rockchip: shut up GRF warning
Date: Tue, 19 Aug 2025 16:13:25 +0200
Message-ID: <11865312.F0gNSz5aLb@diego>
In-Reply-To: <ciuhfx4u6xs2g43hn7nzjfmhaakfip6ndcpftuvg3kgzf52zkt@3vyvcjflmtqm>
References: <20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org>
 <2c7301cd-9c86-47fd-8b79-05f3e1a89e47@arm.com>
 <ciuhfx4u6xs2g43hn7nzjfmhaakfip6ndcpftuvg3kgzf52zkt@3vyvcjflmtqm>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_071333_865050_D64C44EE 
X-CRM114-Status: GOOD (  22.98  )
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

Am Dienstag, 19. August 2025, 15:56:42 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sebastian Reichel:
> Hello Robin,
>=20
> On Tue, Aug 19, 2025 at 01:42:42PM +0100, Robin Murphy wrote:
> > > +	if (thermal->chip->grf_mode !=3D GRF_NONE) {
> > > +		thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf=
");
> > > +		if (IS_ERR(thermal->grf)) {
> > > +			ret =3D PTR_ERR(thermal->grf);
> > > +			if (thermal->chip->grf_mode =3D=3D GRF_OPTIONAL)
> > > +				dev_warn(dev, "Missing rockchip,grf property\n");
> > > +			else
> > > +				return dev_err_probe(dev, ret, "Missing rockchip,grf property\n"=
);
> > > +		}
> > > +	}
> >=20
> > Nit: Does the lookup itself need to be made conditional? I think I'd
> > also agree that the "optional" mode seems suspect, so potentially it
> > could be a whole lot simpler, e.g.:
> >=20
> > 	thermal->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> > 	if (IS_ERR(thermal->grf) && thermal->chip->grf_required)
> > 		return dev_err_probe(dev, PTR_ERR(thermal->grf),
> > 				     "Missing rockchip,grf property\n");
>=20
> I came up with the enum, because I think most platforms having
> "optional" GRF support actually require it, so I want to keep the
> warning. At the same time I don't want to mark them as GRF required
> at this point, since that is potentially a DT ABI break. It really
> needs to be checked per platform in the TRM and/or by testing on
> real HW. With this patch we can easily handle this platform by
> platform by moving them from GRF_OPTIONAL to GRF_MANDATORY without
> affecting the unchecked platforms. Also switching a platform from
> optional to required needs to be reflected in the DT binding. So
> this involves a lot of work. I think it makes sense to carry the
> slightly complex check in the driver's probe routine for now.

I did go digging now ... there are 3 variants marked as "optional":

  rk3366_tsadc_data ->  rockchip,rk3366-tsadc
	never added any DTS

  rk3399_tsadc_data ->  rockchip,rk3399-tsadc
	commit 95c27ba7bd92 ("arm64: dts: rockchip: add thermal nodes for rk3399 S=
oCs")
	added the tsdadc node together with its rockchip,grf reference

   rk3568_tsadc_data   rockchip,rk3568-tsadc
	commit 1330875dc2a3 ("arm64: dts: rockchip: add rk3568 tsadc nodes")
	added the tsdadc node together with its rockchip,grf reference

So none of the platforms had ever a phase where we had the tsadc without
its grf-reference. So making the GRF mandatory for those, will not create
breakage. We could even tighten the binding to make that explicit.


Heiko



