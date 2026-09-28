Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D00ACA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sp0M9B/bP1jd6S7I+UWdWmITpna+tOZ70JPTfOnFT3A=; b=SvFi5nn7gtoW6KqCmcyWN17vcf
	RhLPGVntkBzo/cL8eyEoJD/nJ1l3iMJUi4Stq+w3Yqq/7n7YeLUJV4NscfWJScjpVGi6w67O7x1b2
	D1VBYcBMExSIOZgZb99v4M6JB9rQlgLQMlzvIVNF5kTLFjnmBN+P9B88jApHX34lWGHRo53KpKM50
	jlzDoTAVXaMAum1Bx9wCiXoYd/6ntuoi89TqpD2IKFvGDTPxMYswSHawP7GcmP92w1uKJHTdxFOFH
	tGyazi8U9OOvVoHtsrNf1y3Rd1nJUj5FmW5vVkxXQrZxw+MK2UK0OGCH+KVXAoWrUzHig9Zo8Dblo
	+5hCJDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE3v-00000000zxF-3VHH;
	Mon, 28 Sep 2026 16:18:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE3t-00000000zwg-42ou;
	Mon, 28 Sep 2026 16:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sp0M9B/bP1jd6S7I+UWdWmITpna+tOZ70JPTfOnFT3A=; b=UrtkAtKCw8fBRDoppoXVbDcds/
	nXOQfF+1Lg3+H+SPmiXBi8202Bq1K+ZX6GomlFWISMkMVE90dHsDOdlIyfGk/DSyf5lmCb0HNC+Lt
	/67KEG/KBeZrtH8KqGHMSSOkea0DfsBD7KCQ/nhbGbHjEkLS+VvN+Ybe/LLtIoMS6IKujuUM9E0CP
	kLbKOJZetZfKhumX588LqFsqvv7VuTmS3n+qCfcGCol/xJR/pRVtGgGuZLzezGCcCf5NLIq0APRIY
	4Nx/K2Q1JDHH08gZbbcvP0f75zw/DFCgzwhf0zVvGKvZqAzJ7vZtX669w/yuqawKmEHAWMpiTvKsR
	kUAfWVBg==;
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBE3r-00000001fVd-0V47;
	Mon, 28 Sep 2026 16:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790612299; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ADkYs/ZWlxn//vwV9N9LBs+0kmUH4807uixXEgVjLufqWLK0goIs4MhqM/QwvaR/1zJ+y+NVw20Gi7fusIl9DN5DNSBjy5uyk51J295fT2vqU7ouv7sdaTi5GuxqP0fKQi4c2mQa3XOtizXELCB8RyHSCCc8c2ZeI0uG6DsLOCM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790612299; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sp0M9B/bP1jd6S7I+UWdWmITpna+tOZ70JPTfOnFT3A=; 
	b=i7ExCdSQ/xKn6Y2q5rfnW0XOLh9Q8kZIeS1vGEe9B7fccHcSYzO7g0yZqrVglHuHLvG9Kt716zzJCRQrFpZaTAuEt0Ee5OXtT+74CVz8vEGyLCUzjlxxJgG/CWyJ5VBSLmr0/FdiwZq3g9QEGAfJhaTF+NVMT/bsOYuLxjAS+3w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790612299;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Sp0M9B/bP1jd6S7I+UWdWmITpna+tOZ70JPTfOnFT3A=;
	b=brrS4kNH6nPwqm1uLLtBETvHEQNU3mCmn+eSwLkH/vg1wV/uxYNX/oL2EMMg+rCS
	6GfMOiBOdAeBw63xRra25WKs5PxcuM9RyDufxHFPfeOmGOHruYjzOYnUjlzNwIHFpE3
	7iRYIu5FkuOrZCYz4D2QPrYkij7geW8bicb3c+E4=
Received: by smtp.zohomail.com with SMTPS id 1790612297707333.3498687074484;
	Mon, 28 Sep 2026 09:18:17 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 2C4A41828DF; Mon, 28 Sep 2026 18:18:13 +0200 (CEST)
Date: Mon, 28 Sep 2026 18:18:13 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 1/6] phy: rockchip: usbdp: Add phy reset notification
 support
Message-ID: <arqLbsCgz9vkr3JG@venus>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-1-9ad90a456953@collabora.com>
 <zbqy5gqtmprapsqpodoohyxs6gml6swkie6fy7fxszfvtfgz6c@eae55gdmknaw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y7ik32cx75s6xqrz"
Content-Disposition: inline
In-Reply-To: <zbqy5gqtmprapsqpodoohyxs6gml6swkie6fy7fxszfvtfgz6c@eae55gdmknaw>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.602.86
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_171839_405308_F0923435 
X-CRM114-Status: GOOD (  25.97  )
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


--y7ik32cx75s6xqrz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v15 1/6] phy: rockchip: usbdp: Add phy reset notification
 support
MIME-Version: 1.0

Hello Mani,

On Sat, Sep 26, 2026 at 09:54:56AM +0200, Manivannan Sadhasivam wrote:
> On Tue, Sep 15, 2026 at 05:32:48PM +0200, Sebastian Reichel wrote:
> > To resolve issues with running into permanent "cmn ana lcpll lock
> > timeout" errors after a few device replugs, add support for reset
> > notifications, which will be handled by the DWC3 driver to gracefully
> > handle the PHY being disabled. This avoids corrupting the controller's
> > internal state and the PIPE interface between the USB3 controller and
> > the PHY, thus fixing the issue.
> >=20
> > Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/ro=
ckchip/phy-rockchip-usbdp.c
> > index e748acdd2d31..0f39982c70b1 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> > @@ -1004,24 +1004,39 @@ static int rk_udphy_power_on(struct rk_udphy *u=
dphy, u8 mode)
> >  	}
> > =20
> >  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
> > +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
> > +
> > +		rk_udphy_u3_port_disable(udphy, true);
>=20
> This change is not described in the commit message.

Good catch. I'm not sure when that sneaked in. I will split it into
its own follow-up patch.

FWIW these two things are a little bit interleaved:

resetting the PHY results in disabled clocks, results in SError when
dwc3 driver tries to access its registers during the PHY reset. This
is worked around by the u3 port disabling, which reroutes the clock.
But doing that increases the chance a lot, that the PHY does not
start up properly again, which requires the reset notifier bits.

Greetings,

-- Sebastian

--y7ik32cx75s6xqrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmq6kz0ACgkQ2O7X88g7
+prxFA//RkRn91TuHhTtQSrpWA0YPTIPzbvMilpCIChKhbH++hVwoksGFGltul3o
KFh58VDd/huD1gXsKAsMPtDhQLxSgJBy0/MD7HZPhTn6duX3syly5IBaBdt0uAXN
4ys/GBgdfPhO3I6J/6B4oX7dlqgBbMPOMr/rIf6iKhoCGlB+/H/xz69JlZDfxHOj
IveJlSGGE7l1K3Q23rjF/tAVJRl6AocqyBSNibyTpDNb2d6nDYl+b3duqrsBcKId
i+iibr9lLC8F3yMHGItO/qw7N7eDk9MHNAxUayRItJwf2jLLV6xfcb8JIq804Mup
7gQbazgOa4glMZ6yFHWw/fAgfDPWSLW28FAiei15uQXuFFnuLAVgXaXrVl+1yzcb
ui7IFIttv4mo/eFTteA337RgaH5cgvercRqarEOENfZVAMXGReVlfLi2HhT/pFMW
7zdRRq1ylysrhLb00dp8zCaXUS+0WxV6y9WesEt3ICVDCRg22SU6AEL34kerdPt2
95vSn314kdaFNUNV4kPvg3qQsaGlUE162AKVYHSdfHxXFwa3yyfCIk7iBRilIfrJ
f6fUBq5glitp2VhpHZW7qoD2vzgXKRlJimggMKsr59U2XawJMe6mb2FH8kOrhkD8
aXCRTzcXghDRMEIfkyZweT5740nurh8oYAD3OlXx234q9nEgUQg=
=uXNM
-----END PGP SIGNATURE-----

--y7ik32cx75s6xqrz--

