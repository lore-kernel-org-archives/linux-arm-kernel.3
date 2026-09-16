Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5042C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWOWx+Q0/JOAj97c6Zqvh1QuFv7TPQbU11Pk7GqjSRw=; b=BRJfey1xCvZ1f57lpQI3YuT9xL
	MZhAlkGzTFxhQscjesEEDlwI5AsmgAp1CSeOfn5dWwmNsey7REamI74LjmjHrE+Cy+BHgHWVDoKu5
	a+0Y3JSWh8c2c/g3CxpQxwjSN3M01Fou8iqKVpcwLsJxTD7e1fU7BBkYGcqOgLiax4EnkPAvD6YbN
	pK8cF7KScEKXeB7T+OQWUjQwDfXRBtOEn5ktxH9j/OF+1ETb4I9ElOT9IwfEjKOIUowg0ohUAost3
	L3M9/Ru0OybMBX00MQ9WXuL0YLsz/GMqaOQh/7mdq8LMqnbUZIa8BErrH8KLLgHRZfrkAWtX8oR/+
	4+iDgw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jT5-00000008WE2-3VjV;
	Wed, 16 Sep 2026 06:50:07 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jT1-00000008WCN-3NBO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 06:50:06 +0000
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id 35ED940B5A;
	Wed, 16 Sep 2026 16:49:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1789541393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CWOWx+Q0/JOAj97c6Zqvh1QuFv7TPQbU11Pk7GqjSRw=;
	b=qXoC5yfJfn/HVnkjTuu9LJLGxxuM0F2Ezu2qaZCpqS9zsSsadSL2eS3Gpuc9T7qCuQXOWF
	WSOGrFEKPb9tZVaevI6HZ+gA9ZbleYHguUSmho47dCBD6wUN4TvHyNP6tLgDVKQeoI1Gol
	MjpkMxsQdTcbgEliDlptuvkDdfQp4QHX9DX8WjS0BJ1qp290IEZaxYChi4AGGhv3yi3HJd
	6PDIGMjVIASZWEot4OXQUhZfBU+C6R+jFsmlYex8FUwUqZ97G2sKBSs5IfrNi7n77swy97
	jWDeJeNIRK9HG0UGT6JjAoiKyObs/UluVoUOjU9IUImywGorRAQ0yqXSkhrK4A==
X-GPT-Reason: legitimate; the email is a technical discussion regarding
	Linux kernel patches (net-next) which aligns perfectly with a
	personal/professional mailbox (alastair@d-silva.org); the sender
	identity matches the recipient's domain, and the content involves
	specific technical details (H616/H618 EMAC1, dwmac_probe) rather
	than marketing or phishing; all provided URLs (kernel.org, linux-sunxi.org)
	are highly reputable and relevant to the Linux kernel development
	community.
Message-ID: <2ac659ffa08eeddc6654827f5a8fbd7fe374a128.camel@d-silva.org>
Subject: Re: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and
 AC300 EPHY support
From: Alastair D'Silva <alastair@d-silva.org>
To: James Hilliard <james.hilliard1@gmail.com>, wens@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>,  Russell King <linux@armlinux.org.uk>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Maxime Chevallier	
 <maxime.chevallier@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>
Date: Wed, 16 Sep 2026 16:49:53 +1000
In-Reply-To: <CADvTj4qRMviM=KXinCKi657pVC_kj7Kt1yizW_EGDu4m7VKQFg@mail.gmail.com>
References: <20260916044119.475666-1-alastair@d-silva.org>
	 <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
	 <CADvTj4qRMviM=KXinCKi657pVC_kj7Kt1yizW_EGDu4m7VKQFg@mail.gmail.com>
Autocrypt: addr=alastair@d-silva.org; prefer-encrypt=mutual;
 keydata=mQINBGactvoBEADBFM2HqfQUUM4j40ZQPyYzmnM8S6zrycO0ipDDPMs7nZMzyzGzOdqfS
 VB/tuYvZOOKVWzJuWJ5aT/YyHx54r3L+D5hTkEG0sXPVJky3yTS9sbHEMSLBHb8TVVuhPVPuieV4g
 Nkqg5POMTidk8xAw50WpV++tUlewXVSciehnuCQPXhXMP7FcCh4uO8LdN7E8m7ir1LafKTFfoWPah
 KVT8NGG9r+ucrFcN5F+VnHxTDaI68yRPkNdtUWmp22wIX1KwDCtKFrndYO4p5Hv2hlDKomsuIIHHn
 muQGRwuh0xpf0nVJNF8ETZHMzxQLfo3e/HvxBFOTkwY9w7CuuQFZchbhS0I3PfmGT0+jiNcdfqjDC
 fPPB5uhy+DkR6wO72vuwFYUrpU2mdliDSdKEtWBHulnXMJjpBOXetfIwhI8G2dTVg59lN5i9DvJZc
 7y1Sp+qfZQ4P9qpYZyQEKR4GNDOdnm6F2LW2cZkcyAU/Ii765zdDMTQMIzZNSxT/FcDd0K1voTNRl
 QHbQw+kmIMhzSv2JefcC9oNbE0XYzcBDNP5T3O/4itOQ90GCKQEPAbIPeBjlQif7kkyvo/H6yv4s9
 duuK7zbJD9AID/+KGLkpU3p68VDB/C2ZSb9rQz3p1CJNSfsX/CPk7sPqA7RKZ4a2B0hSJ2pJCncNZ
 KXtMlkkm/FmewARAQABtCdBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz6JAl
 EEEwEKADsWIQTQGemDFwqYyU/dBWv75AdnjVo60gUCZpy2+gIbAwULCQgHAgIiAgYVCgkICwIEFgI
 DAQIeBwIXgAAKCRD75AdnjVo60qHZEACJnLfpS71Hk8bX0CLCNJ5wgqdZD3pBHEdbv9Ux9kRlZp4a
 ZFwlg9ltwBjl2dZP3PLtD9xQdsdYKVippKd5a7ZZC2y81oDaHjeC9LnPYn8+ce3mGE/+gRyoNfToY
 N06DeUNJKSlZ9t11UIqZCgfp12u16/Yrigy8C4ihEeHXlLhNX6JkeJR5gsHXJnC7vSuMZY+Qz2R72
 ZidWg+cd2WDMGop5sbTvc+55q94A7vTMlWzaix5HdbEUA3sd2U0dMBju5QodRGGhDQMcCu64TydRD
 MtMzzOk9ThJ036ze3HASWGOppyQmaw58k+XNzbHlr9Sc1LsFUNF7zpWXac2rzlywbyRAdFIT/TC76
 hy9zOkwIo2nwA/tdIwLx1j0UZPpAMQmcDUvJqZh6sE+fv6HN0yMPr+sSYJmriMt8Z6leCEHQXOHVI
 SI5z5FvV3coMmHYRq6aXpfs/8SLiYgkV3B0HE/E18Y3j1OkeLYoqIH1VfzQZeCSL/S77NYvk60/MV
 1HFSyqLdUR3uWZI4uZzoEcMoB0GX33uCTp2Ntc00+wSntwekCUQLCMLUb7dZrbpVuobHoWWtkiD2I
 uE5kAiaVwwwzM0BUwiM6VzVoKbeECz93rdsNtwoDqM0NtzoISC46H/BKVQ9mRNXDO4ThEBpJ4H2Tn
 mPNRYYcR0u2mNy1EJII04w==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_235004_432744_98F553B4 
X-CRM114-Status: GOOD (  14.72  )
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

On Tue, 2026-09-15 at 23:12 -0600, James Hilliard wrote:
> On Tue, Sep 15, 2026 at 10:56=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org>
> wrote:
> >=20
<snip>
> > There is already a series from James covering the same thing.
> > Please check
> > the mailing list and possibly our wiki (linux-sunxi.org) to avoid
> > duplicate
> > work and subjecting the maintainers to the same discussions again.
>=20
> See:
> https://git.kernel.org/netdev/net-next/c/783f6f1fdcd5
> https://git.kernel.org/netdev/net-next/c/6cc2fbceb49b
> https://lore.kernel.org/all/20260915-submit-h616-emac1-v1-v2-2-
> 322b32e40eb9@gmail.com/
> > >=20

Thanks, I'll withdraw this series.


There is one subtle timing issue worth highlighting from our Armbian
testing on the Mellow Fly-C5 (H618):

In James's dwmac patch, setting soc_has_internal_phy =3D false causes
sun8i_dwmac_probe() to fall through to sun8i_dwmac_reset(priv). The
Synopsys EMAC DMA soft reset (EMAC_BASIC_CTL1 bit 0) requires a running
RMII clock from the PHY to clear.

While this reset succeeds when the PHY driver is built-in and probes
synchronously, if CONFIG_XPOWERS_ACX00_PHY is built as a module (=3Dm)
or if the PHY probe defers (-EPROBE_DEFER on regulator/clock/nvmem),
the PHY is unpowered and not clocking when sun8i_dwmac_probe() runs.

This causes sun8i_dwmac_reset() to time out after 100ms ("EMAC reset
timeout"), failing MAC driver probe. In our testing, deferring the MAC
reset until sun8i_dwmac_init() (which runs upon ndo_open after phylink
has attached and the PHY is active) avoided this probe failure.

Cheers,

--=20
Alastair D'Silva

