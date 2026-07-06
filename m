Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E44C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNAsnotxftUfGXVK2u7PJAcBWXU14/kbDwsx6iUzL1I=; b=q7G9jqpWQhK04TUTsRB5ffcq2p
	YAnWvGyVeoJCzY75/6zk5Iv3G3KjpKeGbCHknqwpy32HiEsf0bg+I7vqTa0T5ZP8RAHhfbWQemSnb
	bDXZyQSblP6jdpJF2d91drvtnGHdoW7zILl8/GEMhvujp7NK+4o8UA5w9sEZOkzhNjhtcb8ZM5/8i
	hjCaQO/eCulQoEdJ7HSgfUvzYCT9Ar2wRoNHlAFRHVgqKhEKqFHR2yYZM/cs5nKilu1N/RJne1woN
	3ayMvdE0ddXzpi65BCzNZ6F7yvBPKsvQlXWqV8O3MMtH9zPv6AjKy1LGkTai1nuiR/25tBMd/vZrn
	/ple36Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfNq-0000000ByCV-3zQc;
	Mon, 06 Jul 2026 09:12:58 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfNo-0000000ByBh-1yE6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qNAsnotxftUfGXVK2u7PJAcBWXU14/kbDwsx6iUzL1I=; b=N297H0splvpO8ehUTpt3fczHUv
	7z6UPrNsUOuFFrXrCQzG8f9R471RUJvzAMsAsjdGpQGzPThOXO8HCr2mVZ4Uaitrgzrw+TXTofSpe
	vW9JSjeH92q+m+A8ADBy7DDpPw4v/dFQNrJ5LZdrup53d8dWfHEEwScHpG9j8zraCsEJSnbRRaXKS
	Qwbu5CQctu5efwTtBm2VzzrURJRVwxn14YG2VMXbvs01GJHri+pHNJC0fuSPXW+Iu1SFH+lwrnr8w
	bhnTdXKMwWKiVRNmyOh6pUHr2OF2HlgvaceIWs3pT2DdNVrQkOAVgkgVGVyIY3NbBtuK8H+PFJvRT
	MDYl5FBA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wgfNe-000G0z-2R;
	Mon, 06 Jul 2026 11:12:46 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wgfNd-00068Q-2b;
	Mon, 06 Jul 2026 11:12:46 +0200
Message-ID: <aeb6db3f0ee00ea9d360dc081e07b9f529da8095.camel@ew.tq-group.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add
 icssg1 ti,pa-stats
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Date: Mon, 06 Jul 2026 11:12:45 +0200
In-Reply-To: <5b0f5d24de0ccb0884b33d358eb034a88fe4f8f9.1782723206.git.nora.schiffer@ew.tq-group.com>
References: <eea90f48c139901397d65487a87b64bf1744587b.1782723206.git.nora.schiffer@ew.tq-group.com>
	 <5b0f5d24de0ccb0884b33d358eb034a88fe4f8f9.1782723206.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28052/Mon Jul  6 08:24:35 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021256_617488_B3B37665 
X-CRM114-Status: GOOD (  12.27  )
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

On Mon, 2026-06-29 at 10:55 +0200, Nora Schiffer wrote:
> From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
>=20
> Add missing ti,pa-stats syscon phandle, which the icssg-prueth driver
> warns about very noisily since commit 550ee90ac61c
> ("net: ti: icssg-prueth: Add support for PA Stats").

We realized that while the code change is desirable, the "very noisily" par=
t of
the description is not accurate with current mainline kernels - only a sing=
le
"icssg-prueth icssg1-eth: couldn't get ti,pa-stats syscon regmap" message i=
s
printed. We'll send a v2 with an updated commit message.

Best,
Nora


>=20
> Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
> [Nora Schiffer: edited commit description]
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arc=
h/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> index 46be6824dd163..b9e52d8bc8524 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> @@ -110,6 +110,7 @@ icssg1_eth: icssg1-eth {
>  		ti,mii-g-rt =3D <&icssg1_mii_g_rt>;
>  		ti,mii-rt =3D <&icssg1_mii_rt>;
>  		ti,iep =3D <&icssg1_iep0>,  <&icssg1_iep1>;
> +		ti,pa-stats =3D <&icssg1_pa_stats>;
> =20
>  		ethernet-ports {
>  			#address-cells =3D <1>;

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

