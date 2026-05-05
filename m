Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2C3CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXd5fFW5+hV4sE9fLs/inGdGi7ufqi9nV7XrtFhIiX8=; b=TCvPFYYvUMQpJqbIrw19+EmuN7
	ta8qr4NSi4dvW01jg51kA7hT8+ZQb261LOxNs+uPsX2Huc6TuKkrqDpLE4pTV0KaIVfW9dHWVFN6a
	XA9GgfCAl9yYgCOvNlxgMR+ryF6oxlsFRCSz9bfkkLacwbpo13TDvr7IebdL3w2FFdAFqJbT6b5xd
	jMorRTIwcIlwIRHccJOEYGN4Bqro7bluxcasXsCe6FssKOtr7AO1rSqajMnAzF+HuX91WjlzAhTkU
	lmj8hO7vYW9lJlB23cC9h/iDLlJ6OZ/K/cveaSZ5D8ZxPZI0m+pLHhNxAPyEbiOFRAlFQjFIZ4bgP
	G/NZAwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9bF-0000000FKTh-1rnS;
	Tue, 05 May 2026 06:49:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9bD-0000000FKT8-02b4;
	Tue, 05 May 2026 06:49:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1777963778; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UJq6pDGenh8py9GIApZpSEo/n9vzbml5iAbCmE861qH+OKBgvLs+cWV4+mJuyU2FUZs6PUcrAPp3AZuy/1PglPbBTu8uLR3lMSaszy04X3NPmURUYZqGNs1QWUrcpuC3Hf8yoLaviTNnmMC/Ip3eTUt6Tmn71gvCBMMeLIEsQVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777963778; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yXd5fFW5+hV4sE9fLs/inGdGi7ufqi9nV7XrtFhIiX8=; 
	b=L6OiivbxLYE6yOuUbtSbilr5d8ZnlAr6em6u9rchBQqCBi5TNbmwbYK1mHCb5Q4Y6jkdQMaoQ7vnjyRD6h1Eue3Ks6Qj5O7oI0j39u1CbjbRiKbpk07mcHcltdynYLaFYI5WrNT2hnGyy5gru6xgISRMKedo6JVhXl/lsL54IVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777963778;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yXd5fFW5+hV4sE9fLs/inGdGi7ufqi9nV7XrtFhIiX8=;
	b=CDULNg+Vp97LhZK+YeVqB6h4u2Th00Ue2RqZd5XYhBQs4P66jjg2h+g0vEC0xzv9
	mq7Z05ZLeXMsJkzRtLE43XJFAh+MuWR0Btyu3e80GgmDRZVX0GBOT7ens6lMexVtN4d
	OrsJZsTY/OC4h2lb36rmAEr3keQ+nLIvCukRHEiE=
Received: by mx.zohomail.com with SMTPS id 1777963774575650.9780236530866;
	Mon, 4 May 2026 23:49:34 -0700 (PDT)
Message-ID: <6dbefb2c80964c0394771ae11fd0f9e05486db29.camel@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981b: Add PMU
From: Sjoerd Simons <sjoerd@collabora.com>
To: Peter Collingbourne <peter@pcc.me.uk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Tue, 05 May 2026 08:49:31 +0200
In-Reply-To: <20260502074912.12193-1-peter@pcc.me.uk>
References: <20260502074912.12193-1-peter@pcc.me.uk>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_234943_105261_7971B3E4 
X-CRM114-Status: GOOD (  12.63  )
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

On Sat, 2026-05-02 at 00:49 -0700, Peter Collingbourne wrote:
> The interrupt number was taken from a downstream DTS of the similar MT798=
7
> [1] and verified on my OpenWrt One.
>=20
> Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
> Link: [1]
> https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a14b=
215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
> ---
> =C2=A0arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 4084f4dfa3e5..3c6fbb6c5333 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -38,6 +38,12 @@ oscillator-40m {
> =C2=A0		#clock-cells =3D <0>;
> =C2=A0	};
> =C2=A0
> +	pmu {
> +		compatible =3D "arm,cortex-a53-pmu";
> +		interrupt-parent =3D <&gic>;

The parent node already specifies the interrupt-parent, so this is redundan=
t.

> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +

Otherwise looks good

Regards,
--=20
Sjoerd Simons
Collabora

