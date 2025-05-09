Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F3CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ckl3vux5StOjvP2+47jrXU3fLRpLeSvxiApo1TU/VDQ=; b=VrZJXp956oW+zFUtWx+OKEm6HL
	e3XGlRVk66kKt4lkAf9vrjamv9UPEVoFlTxAdnJmU8iftyjeyKAkjHv5sqZhRjs30spqNKLZOnGF0
	qoVmD4bgHTdETGepF7BWyfb2OEu69y7/7r9BXOXn1hyhghRDNJ603m4CcEUOtUHNR43YDDoyHjuqn
	X+YyvULpXDsjcmtCyD8K2Vya/2uUp13H+y3M9nttfTS9sEkfNnhOrsdtmiFQ1Jq08eXiVRVWvMY3t
	S95P55ZNwR/+UY8jgt47xe/+A3Hq4VsmRPmCu+Vos/Foz7iYptbL8mvaVjGlpNfOggsEirstvyeVw
	7q1pMzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHu-00000004mng-3qhC;
	Fri, 09 May 2025 20:25:43 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQwy-00000004M3i-30yh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:51:54 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746809509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ckl3vux5StOjvP2+47jrXU3fLRpLeSvxiApo1TU/VDQ=;
	b=P/NX0RgHit5EEJXk2v6IpDcc0CmX9jjuKGJ8J8O5RFsGJ+rX/Zfmu63/p9HRzmJ0SEju20
	pN/gP6SdukESlLnnl2aOcQMGBMKpLbRL94g/juVXzwRKDpD05cfRZQ8VUzJA29MnSUgMZo
	ZY4jHyKEEzcKFwwvHSoce0HjegXD/XQoC3oHYQxUqnMJtD5Job1emTRTCTV1VNsFpYqyB4
	jx8bXA/Cqycgs8BL93wm4v4emqKSe08tJV905bRCSeEdKjQlyHIPr69944V7VG5RAvu1H0
	GyRVpehpmWhks+9m0/OocqJs2C+FWFdssWbUkQJHyPXeEUX0eMh99gpsf78PVA==
Content-Type: multipart/signed;
 boundary=3e23f8a3f7dd23a047277bc59f050a2e77210dee6735ec02b945a8d601bd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 18:51:21 +0200
Message-Id: <D9RSA5K547DD.1LYPIZZM4XALS@cknow.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Dragan Simic" <dsimic@manjaro.org>, "Rob Herring"
 <robh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use
 GIC ITS
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Diederik de Haas" <didi.debian@cknow.org>, "Chukun Pan"
 <amadeus@jmu.edu.cn>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250308093008.568437-1-amadeus@jmu.edu.cn>
 <D9RQN76VZXO8.T3I0046FNVG3@cknow.org>
In-Reply-To: <D9RQN76VZXO8.T3I0046FNVG3@cknow.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_095153_121048_FD59CF41 
X-CRM114-Status: GOOD (  16.41  )
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

--3e23f8a3f7dd23a047277bc59f050a2e77210dee6735ec02b945a8d601bd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi again,

On Fri May 9, 2025 at 5:34 PM CEST, Diederik de Haas wrote:
> On Sat Mar 8, 2025 at 10:30 AM CET, Chukun Pan wrote:
>> For a long time, rk3568's MSI-X had bugs and could only work on one node=
.
>> e.g. [    7.250882] r8125 0002:01:00.0: no MSI/MSI-X. Back to INTx.
>>
>> Following commit b956c9de9175 ("arm64: dts: rockchip: rk356x: Move
>> PCIe MSI to use GIC ITS instead of MBI"), change the PCIe3 controller's
>> MSI on rk3568 to use ITS, so that all MSI-X can work properly.
>>
> I tested this patch on my NanoPi R5S with a 6.15-rc3 kernel + a number
> of [vcc|phy]-supply patches that have been accepted for 6.16 (and a
> small WIP LED patch).
>
> With this patch I get the following kernel warnings:
>
> pci 0001:10:00.0: Primary bus is hard wired to 0
> pci 0002:20:00.0: Primary bus is hard wired to 0
>
> If I 'unapply' this patch, I don't see those warnings.

I was pretty sure I had seen those messages before, but couldn't find
them before. But now I have: on my rk3588-rock-5b.

> It's possible that this patch only brought a(nother) problem to light,

So it looks indeed to be this.

Cheers,
  Diederik

>> Chukun Pan (1):
>>   arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
>>
>>  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)


--3e23f8a3f7dd23a047277bc59f050a2e77210dee6735ec02b945a8d601bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB4yngAKCRDXblvOeH7b
btTxAP9xcOOm/DKb1fMqBqNcR6qUMiNnWv1MKSyU06BFXAH6LQEAocEqmFyRa4iT
xDj91oyTLTpAr8k0/xJZDB//WWhFPgs=
=V4q7
-----END PGP SIGNATURE-----

--3e23f8a3f7dd23a047277bc59f050a2e77210dee6735ec02b945a8d601bd--

