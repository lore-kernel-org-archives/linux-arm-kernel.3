Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09F1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L++p9P6H0H85fsOAuxOaGzI1uI8Kb5FvZzV7efNg+tI=; b=Ac5DhzH3AU5YnCl1TBanbLOh5Q
	Fqv8x0NTMCqhS4Kiu46eTpWz0nn2Ltg+KDQX6AUgRg3Li1/BZGBt6871zstn0bm2pMD/ovBQ5MZ8V
	MKiYJO6B+2IOtR/TvyKrZV9cEczXep1iuWjrkqH/t48La6na/TJdm/EgNpmah7G9kvQ+mPJQLUxUQ
	ZfjcJHrDsajt96t7XTfEuhSmndq2/73kvfp8Rxw830rrjT+LIqaiz9RTzZjTLbIU4+mAn83Hg42cN
	WKKZqXCfvFk5l2JfAREjUWGTtgGjmfKWvORgf02IMWNLbMwfEKcQoyBxwG8yQSFaI66WivvTc9jOn
	q1hFdgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidgW-0000000CAXk-0WIb;
	Thu, 13 Feb 2025 18:11:36 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticWh-0000000BujZ-2grZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:57:25 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739465830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L++p9P6H0H85fsOAuxOaGzI1uI8Kb5FvZzV7efNg+tI=;
	b=hYjjCvITlZ28O1xd1vUpc7elFGlXQfnzJ3vIfmsICpCXKbgVckh14+zBLyzqoRp6qU2IDQ
	rs52xiZ7OAy0RUUkY0iC6A/0CH+iaAqbs64PhqrGO3h42tlLfT+qE+IvbeyStxvRMtTSck
	eThKUtFvzlvcHetCibLaj4tjRrt5WrY/RMlGOwrITp675lE/OTjjtg/iRVNgbWRrG9liVz
	dvglClMLYFOBk2WNpEwYyioYOrxzHQVjkrS7oHIFLGXypi47JM/GPlixZirEgnzOjw2Vl9
	V54+vFWLrxau3cjs8ib2LBe+OqzZxvJCCjPmAPEv9fD+Fe0Qao00n7+dv3gmxA==
Content-Type: multipart/signed;
 boundary=ede7125ba3a934ac4b1724170fabaab396479d002c71632be934a2e0a78e;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 13 Feb 2025 17:56:55 +0100
Message-Id: <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
Cc: <heiko@sntech.de>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <algea.cao@rock-chips.com>, <rfoss@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <sebastian.reichel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <hjc@rock-chips.com>, <kever.yang@rock-chips.com>,
 <dmitry.baryshkov@linaro.org>, <vkoul@kernel.org>,
 <andy.yan@rock-chips.com>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <l.stach@pengutronix.de>
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>, "Damon Ding"
 <damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
In-Reply-To: <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_085723_811597_F1E9FBE8 
X-CRM114-Status: GOOD (  23.53  )
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

--ede7125ba3a934ac4b1724170fabaab396479d002c71632be934a2e0a78e
Content-Type: multipart/mixed;
 boundary=9dfe29099e37a1b2b487595ef7d4673e8f8e1d59e40fa10a10ca64d80ff5

--9dfe29099e37a1b2b487595ef7d4673e8f8e1d59e40fa10a10ca64d80ff5
Content-Type: multipart/alternative;
 boundary=721bdcc7e7d042a75e209bad099eca2b978b656aea2b608710a95dac840b

--721bdcc7e7d042a75e209bad099eca2b978b656aea2b608710a95dac840b
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Thu Feb 13, 2025 at 3:54 PM CET, Piotr Oniszczuk wrote:
>
>
>> Wiadomo=C5=9B=C4=87 napisana przez Damon Ding <damon.ding@rock-chips.com=
> w dniu 23 sty 2025, o godz. 11:07:
>>=20
>> Picked from:
>> https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D92359=
3
>>=20
>> These patchs have been tested with a 1536x2048p60 eDP panel on
>> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
>> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
>> on RK3399 sapphire excavator board.
>> ...
>> 9 files changed, 401 insertions(+), 89 deletions(-)
>>=20
>> --=20
>> 2.34.1
>>=20
>
> Damon,
>
> I=E2=80=99m playing with hdmi0 port enablement on radxa rock5 itx board w=
ith 6.14 mainline.
>
> rock5 itx has 2 hdmi ports: hdmi0 is wired to rk3588 typeC1/eDP1 eDP with=
 ra620 eDP->HDMI converter and hdmi1 from hdmi/edp tx1
> (see page3 & page29 at https://dl.radxa.com/rock5/5itx/v1110/radxa_rock_5=
itx_v1110_schematic.pdf)
>
> I=E2=80=99m on 6.14-rc2 with applied:=20
> [1] Cristicc hdmi code (https://gitlab.collabora.com/cristicc/linux-next/=
-/commits/rk3588-hdmi-bridge)
> [2] eDP support for RK3588 (https://patchwork.kernel.org/project/linux-ro=
ckchip/list/?series=3D927765)
> [3] Add eDP mode support for Rockchip Samsung HDPTX PHY (https://patchwor=
k.kernel.org/project/linux-rockchip/cover/20250205105157.580060-1-damon.din=
g@rock-chips.com/)
>
> Is edp1 supported by yours [2] series?
>
> If yes - may you pls hint me about required dts additions in https://git.=
kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/d=
ts/rockchip/rk3588-rock-5-itx.dts?h=3Dv6.14-rc2 ?

I don't know if it's relevant, but while HDMI0 got enabled for quite a
few devices in 6.13, it did NOT get enabled for Rock 5 ITX.
I made a local patch (which does the same thing as was done for Rock 5B)
but I have no idea if it actually works (I don't have the board).

Maybe you need that for eDP to work?

Cheers,
  Diederik

--721bdcc7e7d042a75e209bad099eca2b978b656aea2b608710a95dac840b--

--9dfe29099e37a1b2b487595ef7d4673e8f8e1d59e40fa10a10ca64d80ff5
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=0001-arm64-dts-rockchip-Enable-HDMI0-on-ROCK-5-ITX.patch
Content-Type: text/x-patch; charset=utf-8;
 name=0001-arm64-dts-rockchip-Enable-HDMI0-on-ROCK-5-ITX.patch

RnJvbSA1MTU2Y2ZiNTNhYzIwODg3Y2YzY2ViODU5OGIzZjM1ZWU3NDE2MWU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEaWVkZXJpayBkZSBIYWFzIDxkaWRpLmRlYmlhbkBja25vdy5v
cmc+CkRhdGU6IFNhdCwgMiBOb3YgMjAyNCAwMDoxMDoyMCArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IGFybTY0OiBkdHM6IHJvY2tjaGlwOiBFbmFibGUgSERNSTAgb24gUk9DSyA1IElUWAoKQWRkIHRo
ZSBuZWNlc3NhcnkgRFQgY2hhbmdlcyB0byBlbmFibGUgSERNSTAgb24gUmFkeGEgUk9DSyA1IElU
WC4KClRoaXMgaXMgdGhlIHNhbWUgcGF0Y2ggYXMgZm9yIHRoZSBST0NLIDVCLCBidXQgdGhlbiBh
ZGp1c3RlZCBmb3IgdGhlClJPQ0sgNSBJVFgncyBjb250ZXh0LCBidXQgdGhlIG5ldyBzdGF0ZW1l
bnRzIGFyZSBleGFjdGx5IHRoZSBzYW1lLgoKU2lnbmVkLW9mZi1ieTogRGllZGVyaWsgZGUgSGFh
cyA8ZGlkaS5kZWJpYW5AY2tub3cub3JnPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNDEwMTktcmszNTg4LWhkbWkwLWR0LXYyLTAtNDY2Y2Q4MGU4ZmY5QGNvbGxhYm9yYS5j
b20vCi0tLQogLi4uL2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1yb2NrLTUtaXR4LmR0cyAgIHwg
NDcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1yb2NrLTUt
aXR4LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4LXJvY2stNS1pdHgu
ZHRzCmluZGV4IDZkNjhmNzAyODRlNC4uYTFiODlhYmE5NzdkIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1yb2NrLTUtaXR4LmR0cworKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1yb2NrLTUtaXR4LmR0cwpAQCAtMTEsNiArMTEs
NyBAQAogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2xlZHMvY29tbW9uLmg+CiAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvcGluY3RybC9yb2NrY2hpcC5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3B3bS9w
d20uaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9zb2Mvcm9ja2NoaXAsdm9wMi5oPgogI2luY2x1
ZGUgImR0LWJpbmRpbmdzL3VzYi9wZC5oIgogI2luY2x1ZGUgInJrMzU4OC5kdHNpIgogCkBAIC03
Miw2ICs3MywxNyBAQCBoZGQtbGVkMiB7CiAJCX07CiAJfTsKIAorCWhkbWkwLWNvbiB7CisJCWNv
bXBhdGlibGUgPSAiaGRtaS1jb25uZWN0b3IiOworCQl0eXBlID0gImEiOworCisJCXBvcnQgewor
CQkJaGRtaTBfY29uX2luOiBlbmRwb2ludCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1p
MF9vdXRfY29uPjsKKwkJCX07CisJCX07CisJfTsKKwogCS8qIFVubmFtZWQgZ2F0ZWQgb3NjaWxs
YXRvcjogMTAwTUh6LDMuM1YsMzIyNSAqLwogCXBjaWUzMF9wb3J0MF9yZWZjbGs6IHBjaWUzMF9w
b3J0MV9yZWZjbGs6IHBjaWUtb3NjaWxsYXRvciB7CiAJCWNvbXBhdGlibGUgPSAiZ2F0ZWQtZml4
ZWQtY2xvY2siOwpAQCAtMjYxLDYgKzI3MywyNiBAQCAmZ3B1IHsKIAlzdGF0dXMgPSAib2theSI7
CiB9OwogCismaGRtaTAgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZoZG1pMF9pbiB7CisJ
aGRtaTBfaW5fdnAwOiBlbmRwb2ludCB7CisJCXJlbW90ZS1lbmRwb2ludCA9IDwmdnAwX291dF9o
ZG1pMD47CisJfTsKK307CisKKyZoZG1pMF9vdXQgeworCWhkbWkwX291dF9jb246IGVuZHBvaW50
IHsKKwkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pMF9jb25faW4+OworCX07Cit9OworCismaGRw
dHhwaHlfaGRtaTAgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKICZpMmMwIHsKIAlwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOwogCXBpbmN0cmwtMCA9IDwmaTJjMG0yX3hmZXI+OwpAQCAtMTIw
OSwzICsxMjQxLDE4IEBAICZ1c2JkcF9waHkxIHsKIAlyb2NrY2hpcCxkcC1sYW5lLW11eCA9IDwy
IDM+OwogCXN0YXR1cyA9ICJva2F5IjsKIH07CisKKyZ2b3BfbW11IHsKKwlzdGF0dXMgPSAib2th
eSI7Cit9OworCismdm9wIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismdnAwIHsKKwl2cDBf
b3V0X2hkbWkwOiBlbmRwb2ludEBST0NLQ0hJUF9WT1AyX0VQX0hETUkwIHsKKwkJcmVnID0gPFJP
Q0tDSElQX1ZPUDJfRVBfSERNSTA+OworCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWkwX2luX3Zw
MD47CisJfTsKK307Ci0tIAoyLjQ3LjIKCg==
--9dfe29099e37a1b2b487595ef7d4673e8f8e1d59e40fa10a10ca64d80ff5--

--ede7125ba3a934ac4b1724170fabaab396479d002c71632be934a2e0a78e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ64kXwAKCRDXblvOeH7b
bo6YAQD3ybKDWbpRpMMdrHd5h15H7Ri0SJHdZTxVs3Z281VrlwD/fV2G8wNX74/r
fM0km2y4v3qMDEQzjYUmaigHppNGKw4=
=sv1C
-----END PGP SIGNATURE-----

--ede7125ba3a934ac4b1724170fabaab396479d002c71632be934a2e0a78e--

