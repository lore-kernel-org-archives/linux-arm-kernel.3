Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF2FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1E2b0XxNtqEsAhxKbHa26ec+Iv+4B3ST0nSXvkyMcE=; b=CNfgU3PtCmlodtKYmYsg0E6bAa
	gCfzoIATZpmExEj0AKGpalebPtCmhrxZBYR6tgbVKp2g3udVh2Y08CGow3lcKJ7uZO6thKr8p1xbf
	nC6vdOFeo6neg8iu3v8WJxjxUhpVB6pKrpnbvW50+4/Dn4hagaivkX+9NsLEjPLCK14HsClV6Rqfd
	4JgLeuP+Y58XHxGfP6pXUJd/m2o2vSSUckuWRZScEK8JlFdP8HoxeoMY2RUg4PKwgOlOgm35XVEJj
	rxi3P/py20DEMf86ga842rk9IxXDUvB5a5ASey3e8KrQh32XmkQvUVFf1A0MTejGhlasR+LJxV65y
	etsk4oaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRfb-00000004SVX-08Xr;
	Fri, 09 May 2025 17:37:59 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPkD-000000046P1-2Xog
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:34:39 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746804875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K1E2b0XxNtqEsAhxKbHa26ec+Iv+4B3ST0nSXvkyMcE=;
	b=txjLPg+2r2oCcSAmqMhRMoJ6ogAGxsVdesD30F5X6afQ/G6keHvb8TuZG8TPtcuMozvGZe
	mSnluLjZf32SfIaFxu2kDCMJdwF5NkV7iI1pmMdBjCKWl8GvSPe9gB7DIrMEQiY4/xw76s
	vZd3sx72Z/HPVrdL1gWryYxjPr2HZvDyhr/krmQsylu9GGhoaG2khy8Zk+sfCR+wlHEB1E
	wZmiIhnXtDKkuuqp+YLzVcGVLLjLQ4oZiWjOI8bZQKJAMfsO21Nczv6cRcQA94Bg5XCucw
	/7q1wq12+OQ3wF4FoP8vshSdux+lhiBfUi5nN/c1XxJYWGUJcEnBKwprc0dCHw==
Content-Type: multipart/signed;
 boundary=7a05250e7073856251351d2d7eed564a7ba885e16373e9e67c2c1e611f0e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 17:34:21 +0200
Message-Id: <D9RQN76VZXO8.T3I0046FNVG3@cknow.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Dragan Simic" <dsimic@manjaro.org>, "Rob Herring"
 <robh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use
 GIC ITS
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250308093008.568437-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250308093008.568437-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083437_992629_BDA592DA 
X-CRM114-Status: GOOD (  15.40  )
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

--7a05250e7073856251351d2d7eed564a7ba885e16373e9e67c2c1e611f0e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Mar 8, 2025 at 10:30 AM CET, Chukun Pan wrote:
> For a long time, rk3568's MSI-X had bugs and could only work on one node.
> e.g. [    7.250882] r8125 0002:01:00.0: no MSI/MSI-X. Back to INTx.
>
> Now the ITS of GICv3 on rk3568 has been fixed by commit b08e2f42e86b
> ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> and commit 2d81e1bb6252 ("irqchip/gic-v3: Add Rockchip 3568002 erratum
> workaround").
>
> Following commit b956c9de9175 ("arm64: dts: rockchip: rk356x: Move
> PCIe MSI to use GIC ITS instead of MBI"), change the PCIe3 controller's
> MSI on rk3568 to use ITS, so that all MSI-X can work properly.
>
> ~# dmesg | grep -E 'GIC|ITS'
> <snip>
>
> ~# lspci -v | grep MSI-X
>         Capabilities: [b0] MSI-X: Enable- Count=3D1 Masked-
>         Capabilities: [b0] MSI-X: Enable- Count=3D128 Masked-
>         Capabilities: [b0] MSI-X: Enable+ Count=3D32 Masked-
>         Capabilities: [b0] MSI-X: Enable- Count=3D128 Masked-
>         Capabilities: [b0] MSI-X: Enable+ Count=3D32 Masked-

I tested this patch on my NanoPi R5S with a 6.15-rc3 kernel + a number
of [vcc|phy]-supply patches that have been accepted for 6.16 (and a
small WIP LED patch).

With this patch I get the following kernel warnings:

pci 0001:10:00.0: Primary bus is hard wired to 0
pci 0002:20:00.0: Primary bus is hard wired to 0

If I 'unapply' this patch, I don't see those warnings.
The output of the above mentioned ``dmesg`` and ``lspci`` commands is
exactly the same in both cases.

The PCI IDs refer to:
PCI bridge: Rockchip Electronics Co., Ltd RK3568 Remote Signal Processor (r=
ev 01)

It's possible that this patch only brought a(nother) problem to light,
but was I supposed to see an improvement and if so where/how?

Cheers,
  Diederik

> Chukun Pan (1):
>   arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
>
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)


--7a05250e7073856251351d2d7eed564a7ba885e16373e9e67c2c1e611f0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB4ghAAKCRDXblvOeH7b
bl/EAQD+K7c6vUljn1EBtoIGabanVcKojXgvdX70yKiRNSvqPQEAvapmOAWC5jab
K8JwHx8knw5EZOulmU6azbvFEkAZqAk=
=bpa6
-----END PGP SIGNATURE-----

--7a05250e7073856251351d2d7eed564a7ba885e16373e9e67c2c1e611f0e--

