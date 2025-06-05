Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02685C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 19:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJqiZsO00UW1qzZCC8pTl4Bce7VgLFymF1yeTS4Wo1I=; b=BSQD3Y4UxDkFaRCHb0S13mxOpM
	ONF8dWzaVY3rkAC6NPql+nkHyj7UlGcZrSpj2zsM6Jm9zAJYSlI9aovH8aWEGDZTh+M+FTffji/h4
	0pqH7tgAicaJte+hsa7RmUAgRAVIynwku0t1cNpgqqzLmULCUq7uTlNztn3jBoKEd84aTz7HGyngW
	3cvq9vv9OCqrpVTsXvFlFVHiraWOi9caam1II1DmfeRstDu4qBEDlBO6Q4G/S4hc2Fv63xEjA7lxm
	1qfCW/W1I8ESTxJ9b5dMWJvJID0MAiM2oaefzFncAMFiMgKUZWzzi2G/CJffTd2tpfbcoeStpu5EI
	t3RLo/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGdN-0000000GXfL-0BpT;
	Thu, 05 Jun 2025 19:52:17 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGbD-0000000GXHe-0Zz5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 19:50:04 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749152990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJqiZsO00UW1qzZCC8pTl4Bce7VgLFymF1yeTS4Wo1I=;
	b=FXcqnj/ZkLVgqnSXA/9FCtL8/d/zbvT/uL/nRPY4ksTM7NoH+k7HOrLyiUHdrSN448BJEs
	tzm80CoUd+7YJYNYcP8LDfYzXJxnSMktTXGW8Kwp7IkGVirCjElBjFaIWD3fy73G8ASCEz
	bi0vCwHbcMFzgtcrYfkulfJnzWs97Ya8EuOeG6Ynh3tmJNSyiwTaxVCoyWVnZc6Ltkq/Ln
	feYAgiGpA0nhzBqo0uSjz9JfldpzkKqhRG/grezN5hoBijkcaPwIcYAMd6yHiDXQRnXaF0
	n8r1ngQ5EzjutOWkyYl5Y7qlhheNe2HsVJPVZo1oMz/kOAwit7pbWLMIJbCNsw==
Content-Type: multipart/signed;
 boundary=3cdd52bd73029a86b1db18a8ebe587a89be50fded87b2fd99a67d4267211;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Jun 2025 21:49:40 +0200
Message-Id: <DAEUZDXQ1QT8.1YMVDZVR29GJM@cknow.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <kernel@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] PM / devfreq: rockchip-dfi: add support for LPDDR5
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>, "Heiko Stuebner"
 <heiko@sntech.de>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com> <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com> <DADLSAEF1YPO.V0CQK084KFFO@cknow.org> <4244538.aeNJFYEL58@workhorse>
In-Reply-To: <4244538.aeNJFYEL58@workhorse>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_125003_316662_D072B8C8 
X-CRM114-Status: GOOD (  27.78  )
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

--3cdd52bd73029a86b1db18a8ebe587a89be50fded87b2fd99a67d4267211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Jun 5, 2025 at 5:14 PM CEST, Nicolas Frattaroli wrote:
> On Wednesday, 4 June 2025 10:24:33 Central European Summer Time Diederik =
de Haas wrote:
>> On Fri May 30, 2025 at 3:38 PM CEST, Nicolas Frattaroli wrote:
>> > [...]
>> > +	case ROCKCHIP_DDRTYPE_LPDDR5:
>> > +		ddrmon_ver =3D readl_relaxed(dfi->regs);
>> > +		if (ddrmon_ver < 0x40) {
>> > +			*ctrl =3D DDRMON_CTRL_LPDDR5 | dfi->lp5_bank_mode;
>> > +			*mask |=3D DDRMON_CTRL_LP5_BANK_MODE_MASK;
>> > +			break;
>> > +		}
>> > +
>> > +		/*
>> > +		 * As it is unknown whether the unpleasant special case
>> > +		 * behaviour used by the vendor kernel is needed for any
>> > +		 * shipping hardware, ask users to report if they have
>> > +		 * some of that hardware.
>> > +		 */
>> > +		dev_err(&dfi->edev->dev,
>> > +			"unsupported DDRMON version 0x%04X, please let linux-rockchip know=
!\n",
>> > +			ddrmon_ver);
>> > +		return -EOPNOTSUPP;
>>=20
>> I'm guessing you mean the linux-rockchip mailing list here? If so, I
>> think it's better to make that explicit as 'Joe User' who may run into
>> this issue may not be aware of that mailing list. The 'linux' and
>> 'rockchip' name combo is used in quite a few places.
>
> I agree it's ambiguous, the message as it is right now is the way it is
> because we're not allowed to linebreak user-facing messages for grep-
> ability and I also don't want to exceed 100 lines of width (though this
> is the one case where we're allowed to).
>
> I suppose I should just replace it with the e-mail address of the list.
> That should be clear enough and this error message also won't end up in
> random boot logs strewn across the internet if it really is just some
> engineering sample hardware or similar that's affected.

I understand the issue. Maybe this discussion itself will help make it
appear high enough in the search results to fix the ambiguity ;-)
I'll leave it up to you if or how to change anything (or not).

Cheers,
  Diederik

>> > +	default:
>> > +		dev_err(&dfi->edev->dev, "unsupported memory type 0x%X\n",
>> > +			dfi->ddr_type);
>> > +		return -EOPNOTSUPP;
>> > +	}
>> > +
>> > +	return 0;
>> > +}
>> > +
>> >  static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>> >  {
>> >  	void __iomem *dfi_regs =3D dfi->regs;
>> >  	int i, ret =3D 0;
>> > +	u32 ctrl;
>> > +	u32 ctrl_mask;
>> > =20
>> >  	mutex_lock(&dfi->mutex);
>> > =20
>> > @@ -136,8 +186,11 @@ static int rockchip_dfi_enable(struct rockchip_df=
i *dfi)
>> > <snip>
>>=20


--3cdd52bd73029a86b1db18a8ebe587a89be50fded87b2fd99a67d4267211
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEH01wAKCRDXblvOeH7b
bjekAQDt2eVvkNGS0Du340umiQKSvaFxizTMOEIkxgx5fjC8KwD+I8OVx9ygu1iV
eOdkqV5mvuHIC90hcPFQOQTfuRHH9QU=
=SP89
-----END PGP SIGNATURE-----

--3cdd52bd73029a86b1db18a8ebe587a89be50fded87b2fd99a67d4267211--

