Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA24606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mgSoFeRJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Eo0NP0PD;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=SsxZ7Fbn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXCjInahUZzrvNbEdQD0UbF7xlxKuOskZ4KoinzfWZ0=; b=mgSoFeRJ5c5gYD2Zm+qB+wKMQO
	M9+sTw7fi49kLrhokBQwz+4zx13KS5+RGzqJoeg0bbbk3SqP+sgUJQXVeEvGfkpREGR58uq2Di2x9
	rPHHSaynMvlGxvDLkwwsHr00DLnxhWjVEkpmAdxMFyzAG5IXciHSFPki3FuUBDyWcArrQz2JEVv+t
	R+S6rHmKDpSZc9x5oizBe8vFyON6JLw+04kx+zv4heIYT4W/BLBX+SJ0PfrFiIoxNEomKpTVvvL1/
	Xlv5x8ORLx6RcClBQGwqu/sXZ2QovHPe3FrGOWVO+kgNHE9w1J4c4arUH6FtqfO/YEtY63cNJpCIF
	EdN25WBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSs0-0000000BW66-2DPR;
	Wed, 21 Oct 2026 09:44:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSry-0000000BW5U-3dDD;
	Wed, 21 Oct 2026 09:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mXCjInahUZzrvNbEdQD0UbF7xlxKuOskZ4KoinzfWZ0=; b=Eo0NP0PDb7hYIw1klGTAZxesiQ
	4dhT064JyzcbDzVCCj0CjwD/qlNTb9kIFnO+/BRC2M+fluY9se3u5m0Z18/k8EFKMtt2oZP7aP4tu
	Ids0EZz35+oqZ7QreojBz0xXc5wiVcqiCyAvdX0LSep2/7wZ0Nv8IK9LAZ2Uz6WOA/l3W4SO53We+
	wSdAFVYmcaXdmp+emyaEf2N9UCpzgsbRFP/MbXn2RzeYdIshAg8OiW1WnvZO3IkSLeTv2wGOuD5ky
	lxog5svTnfjMA0+LrxETgOfh8/n2ndJtOYoLN6F0rhn/8wOCm45hSHtUJjexsJyKajsJRhL8W/lQ4
	gxbeWYxg==;
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSrt-00000005fIv-49gc;
	Wed, 21 Oct 2026 09:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1792575827; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RwqfJR0UKnXDM2nQGKfDxWc5W1Q8rzZpPDwwBbSN7y6k6cO14y0rK6TD4auVxwuN4Ye6IWvwYH3kqwP19SXzSDCc2qI5hBPGI6T1YHyE1MhTZvu6i0L+Uy2JI25qVRCRaGeu9Ic0LeCixfehl5fVC1E2ku3pK64aazZNJv+5vBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792575827; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mXCjInahUZzrvNbEdQD0UbF7xlxKuOskZ4KoinzfWZ0=; 
	b=Um008nR1oKe2GzJD3p7sHCnmYBrW4AZyl6i3v0k154SC6dYDX6zRounEamfKjE9E2FqeNdOfgctBEKgbwt3vwuJNGBeeWa7GtgXFWi3J86YchXVDjv6p8gYzf8s3DRZhvSWyFPFbK9NK1V+7mnbc9nF6xwm63QMrFuTfIbzCSPc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792575827;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=mXCjInahUZzrvNbEdQD0UbF7xlxKuOskZ4KoinzfWZ0=;
	b=SsxZ7FbnSZ0pL7jhMYiiKetb/evo3A+4EYArjjfyertsyWoNFPko6EvE8G4iNXli
	1T/VMwxzUwcHXUK4BhHB9ZUWPQNkQDHjXBAZCV15/Fp+giKx2rJENP3M5HrxP1NgQvO
	qpV2w8HEo/yWdtMKrlFVOt97nfo8MzR35ElOD5+o=
Received: by smtp.zohomail.com with SMTPS id 1792575825353726.5864194200229;
	Wed, 21 Oct 2026 02:43:45 -0700 (PDT)
Message-ID: <c53928fbb9da11b0f32a84592742e6a26e1aed32.camel@collabora.com>
Subject: Re: [PATCH net-next v3 2/9] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Richard Cochran	
 <richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao
 Huang <biao.huang@mediatek.com>, Maxime Chevallier	
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@kernel.org>,
 kernel@collabora.com, 	netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 21 Oct 2026 11:43:39 +0200
In-Reply-To: <b4950f82-0163-4482-9799-a5e3c6eb5964@lunn.ch>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
	 <20261016-dwmac-mediatek-mt8189-v3-2-25daf2bbcf35@collabora.com>
	 <b4950f82-0163-4482-9799-a5e3c6eb5964@lunn.ch>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_104422_962124_7E9C4DC9 
X-CRM114-Status: GOOD (  20.34  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

On Fri, 2026-10-16 at 17:40 +0200, Andrew Lunn wrote:
> > Finally, update "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps"
> > property
> > description to add MT8189 RX/TX delay stage divider values, as they
> > differ from existing supported SoC.
>=20
> These should be mark deprecated and the standard rx-internal-delay-ps
> and tx-internal-delay-ps used in there place for new devices.
>=20
I agree, it makes sense to use them to describe the RGMII internal
delay configurations rather than the two existing vendor properties
(mediatek,rx-delay-ps and mediatek,tx-delay-ps), and deprecate them, by
adding a deprecated flag and the comments you've suggested. It would
also need an additional patch for the driver to handle them (while
keeping backward compatibility).

But what is bothering me is these two vendor properties description
says they can be used in MII and RMII phy mode cases. The driver uses
them indeed also to fine tune the RX/TX_CLK (in MII) or the REF_CLK (in
RMII) configuration.
rx/tx-internal-delay-ps properties are limited to RGMII only ([1]).
So they can not substitute them as it and with their description it
would wrong to use them for MII/RMII.

At the moment, in the upstream devicetrees, there is no "mediatek,rx-
delay-ps" use and the "mediatek,tx-delay-ps" use are very few and only
for RGMII phy modes (either rgmii-rxid or rmgii-id), so no MII/RMII
real use cases.

So, how to proceed then to make these bindings right?
Use rx/tx-internal-delay-ps properties for RGMII and mediatek,rx/tx-
delay-ps for MII/RMII or do you see another solution ?

Best regards,
Louis-Alexis

[1]:
https://elixir.bootlin.com/linux/v7.3/source/Documentation/devicetree/bindi=
ngs/net/ethernet-controller.yaml#L251


> > @@ -86,8 +85,10 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or will round down. Range 0~31*170=
.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For MT2712 RMII/MII interface, All=
owed value need to be a
> > multiple of 550,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or will round down. Range 0~31*550=
.
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For MT8188/MT8195 RGMII/RMII/MII interf=
ace, Allowed value
> > need to be a multiple of 290,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or will round down. Range 0~31*290.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For MT8188/MT8195 RGMII/RMII/MII interf=
ace, Allowed value
> > need to be a
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multiple of 290, or will round down. Ra=
nge 0~31*290.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For MT8189 RGMII/RMII/MII interface, Al=
lowed value need to
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be a multiple of 180, or will round dow=
n. Range 0~31*180.
>=20
> Please make this:
>=20
> For MT8189 RGMII/RMII/MII interface, this property is not used, the
> standard tx-internal-delay-ps should be used instead.
>=20
> > @@ -96,8 +97,10 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or will round down. Range 0~31*170=
.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For MT2712 RMII/MII interface, All=
owed value need to be a
> > multiple of 550,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or will round down. Range 0~31*550=
.
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For MT8188/MT8195 RGMII/RMII/MII interf=
ace, Allowed value
> > need to be a multiple
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of 290, or will round down. Range 0~31*=
290.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For MT8188/MT8195 RGMII/RMII/MII interf=
ace, Allowed value
> > need to be a
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multiple of 290, or will round down. Ra=
nge 0~31*290.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For MT8189 RGMII/RMII/MII interface, Al=
lowed value need to
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be a multiple of 180, or will round dow=
n. Range 0~31*180.
>=20
> Same here.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 Andrew

