Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCE7CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXQSwAv8e6eEfacG/HeYdxYzZSrhuUbOicdQbourYnc=; b=RvvzEISHK4mGIdW9ecw2Px14m8
	klJPpz+Csxr6tmx9MgBYV8dUAL1jJwy6l33J0WtdZ7CuvEMFSlZXF2i4UxkEbHHDAbrcL98Nz1HL7
	08StIOPn+K1rQG7/Cy1GvK62ho8gMTDVcpDWEmkDChSNhyMTIRD/w9a1HidWtSXBh/fWW7WhtHcvg
	5ly8zlj02pUFDEA1pzeJrXH3OzQxEZLEmovx7I/G0XQLSWQK/mRbC/Px/tdxXWv8visHNbdKDKt8i
	XcXuVFDewPIUEyGAvK4/VQhOdWqvZNXyKT/s5/LclE3uDI213CwDN3tV43eGlAMitp6j+oDevSqZe
	sKfy2e7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojtU-0000000E5sq-33lJ;
	Wed, 20 Aug 2025 14:34:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoixr-0000000Dp2G-3I8V;
	Wed, 20 Aug 2025 13:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696894;
	bh=CXQSwAv8e6eEfacG/HeYdxYzZSrhuUbOicdQbourYnc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BMyk2AYeLys2RolPoykxrhvNbeytaoF2/aKwgif7GzLleZCp2kTE5vHm5rsTNPH/9
	 wRxe1QgO5JRhTIelbfqDkmKX6vs1zhr7/ROYfDwXjLpBt/AG2VrjNl8hiDh1h/htNm
	 IytmPOMbYs3FKvK6FJ0fNXcWrwW+xQ4BATx/7a9O+D/rvH0RClxrICXYvHY23U6Xr/
	 LmqE3lHwB99RvuFO5LQLTAjXGVMlIYunVwGj0pRrkl8O33F18PYSKyyIjexX+O7gO4
	 t4KYJujfi0dUClNfSgIfIBkC/Lx/oTo76KmPAtaXRQYyIOtbLDJw6tn4iPnMYJmJdh
	 KQ+kdM7IIBeFA==
Received: from localhost-live.home (2a01cb0892F2D600C8F85Cf092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D76817E02B0;
	Wed, 20 Aug 2025 15:34:53 +0200 (CEST)
Message-ID: <5ae569e8a1b3d00408d8ad4e934a4585a7479f7e.camel@collabora.com>
Subject: Re: [PATCH 6/9] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
From: Julien Massot <julien.massot@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai	 <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev
	 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, Sean
 Wang	 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 20 Aug 2025 15:34:52 +0200
In-Reply-To: <20250801172927.GA3114452-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
	 <20250801172927.GA3114452-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_063456_003426_0120B02D 
X-CRM114-Status: GOOD (  11.19  )
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

On Fri, 2025-08-01 at 12:29 -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 01:18:08PM +0200, Julien Massot wrote:
> > Convert the existing text-based DT binding for MT8183 sound cards using
> > MT6358 and various other codecs to a YAML schema.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../sound/mt8183-mt6358-ts3a227-max98357.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 25 ---------
> > =C2=A0.../devicetree/bindings/sound/mt8183-mt6358.yaml=C2=A0=C2=A0 | 59=
 ++++++++++++++++++++++
>=20
> mediatek,mt8183_mt6358_ts3a227.yaml

Ok, Thanks for the review.
Julien

