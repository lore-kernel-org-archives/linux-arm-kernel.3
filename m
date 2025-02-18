Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F50C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRTNT+VF0BGjlKwvapjWppDo17j+1iwhkQPE23/uMVo=; b=RjT8dFxGS+APruCfviCi2+58DO
	yZHtwtAa9BaaapqSyYJtNq0HNcX3HVUhGPumvsgEIJn2TYUcn3Ubsp+08Rl81cfpuGM2lUAzKHkNu
	f29ndSErEGGfPbswsvkHufUZGNJltMIyZy9CA5hmunv0Jf4uup1vt2YhXQIqtlr6xxL95vnVO2+yJ
	MudrrIcNFFX2HpfOketNi0qrV0KPA0iYNaP2HLBmHbJX3A/B4XKgw4/kOG1idBVAHYmDE6BEo+6Ht
	fc1r0f/NQ5B4sFvry0EQaw6lZLspl/RJzgZsdnIj844YXgHlOcBFkN93qd0jW7XStlibiQP6Lrl12
	rvVh1h6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMUX-000000086OO-3NOU;
	Tue, 18 Feb 2025 12:14:21 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM2u-000000080tC-34KM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:45:50 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739879143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iRTNT+VF0BGjlKwvapjWppDo17j+1iwhkQPE23/uMVo=;
	b=ZX3Yoy1hXUuD/+bt2TDsEfH9YNFyiuE1hX3gIbcpAC9o8USRJ5Li6rm7ZNk+R4Dw4VMfNU
	DlJIFuiVnBIa4sM2wBQ3W8Sh8uesjMI6rq244GrrMuk/nJNQqPNgie1HPW0D0iUHs12vQU
	lq2FCMy6RLxs0eyyGg90bKfbW7E0c6RPyyiEcjRbTvuhHs3GNK1GOX+z3p31ueTyqvMcAd
	ERpiUk7Cmbii1XDuH/YkYQfPOaZ0vILGoTEEtoAxLZ2+gg+x4zjhV28MnyIJWihL1HbvRe
	R5194W54/SZCartzQcvVv6CRKHnhrrBo//MnCxCqcUXt9Td1E/LRcwRaH2XRGw==
Content-Type: multipart/signed;
 boundary=f698ee32381bf21d68a66030e7e7436323d6482d1504fe3e32b177e1a04d;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 18 Feb 2025 12:45:34 +0100
Message-Id: <D7VJOFXU540M.2PAC1RFXAH19B@cknow.org>
To: "Valentin Kleibel" <valentin@vrvis.at>, "Vinod Koul" <vkoul@kernel.org>,
 "Chukun Pan" <amadeus@jmu.edu.cn>
Cc: "Heiko Stuebner" <heiko@sntech.de>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Kishon Vijay Abraham I" <kishon@kernel.org>,
 "Jianfeng Liu" <liujianfeng1994@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>
Subject: Re: [PATCH v2 0/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <173831716590.670164.5196739962949646746.b4-ty@kernel.org>
 <f64ee4ee-7e56-4423-813e-b87e023e893d@vrvis.at>
In-Reply-To: <f64ee4ee-7e56-4423-813e-b87e023e893d@vrvis.at>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_034549_390723_55B4A2BD 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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

--f698ee32381bf21d68a66030e7e7436323d6482d1504fe3e32b177e1a04d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 11, 2025 at 2:03 PM CET, Valentin Kleibel wrote:
>>> Chukun Pan (1):
>>>    phy: rockchip: naneng-combphy: compatible reset with old DT
>>=20
>> Applied, thanks!
>>=20
>> [1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
>>        commit: bff68d44135ce6714107e2f72069a79476c8073d
>
> Thanks for your work!
> We found your patch after NVMes stopped working on a rock 3A with newer=
=20
> kernels and successfully applied it to kernel 6.1.128 (currently in debia=
n).

FTR: I've reported it in Debian here: https://bugs.debian.org/1098250

I confirmed it (also) broke on kernel 6.12.8-1.

Cheers,
  Diederik

--f698ee32381bf21d68a66030e7e7436323d6482d1504fe3e32b177e1a04d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ7Ry4AAKCRDXblvOeH7b
bhFLAQC1JglGt4aR9lUVkEV0fmRuMzSi31E8LahoJr3zdw31DAD+P5bkgVowQQlh
kiTJtgRPL9URTebUfZf6ug/4nSIEOgo=
=FLpA
-----END PGP SIGNATURE-----

--f698ee32381bf21d68a66030e7e7436323d6482d1504fe3e32b177e1a04d--

