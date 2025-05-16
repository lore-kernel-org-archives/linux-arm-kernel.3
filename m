Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2E7C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoNEu7nlqt0Uzf5QdINb8sbgrCfpe8hWPCqdZRSYtDM=; b=YuS20YdaCX/jQjRxcRdDfdjxmR
	P9yHkwMFx810LYFeOtt4WKlGhDO0IZYkBCKy3VnxYhKW32CARVGbgWzQkbzzRW/E6Gdd0jEnstShn
	X26WpaRpdO/KGVC1Olc2YGt+UsLREcQdCqMDko1R1zzNYxkxcNHLJkb4USmu1VQHotVXc92vD1OCJ
	mhe4FhHOhwKQLbtvcQrR/WzBXY0cCzCvvyTlhG+hZ48oVLMuLamonV0MAas1RYIE0saRoBitpnkhM
	r1JssifUQhsbbGlMyLUa6Il35eon/jqRGXRvXjHmnyiVFPvMkFdlVn9dKhKu77kNj7MvA+nfYRctH
	oDfaA/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwV4-00000003kOF-3pRr;
	Fri, 16 May 2025 14:57:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvpw-00000003dYe-3lne;
	Fri, 16 May 2025 14:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404895;
	bh=xoNEu7nlqt0Uzf5QdINb8sbgrCfpe8hWPCqdZRSYtDM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LfOh5ag5Xzifqx/OH6UpSuEIMv+WLdumB0zh3Y8sZcRVu9KUkf2UsHDl56iTm3jrZ
	 xplKT+L8HgbIOmX9NE3nzuuMtsrBpsNJ/SphLX3CvFk6B21YkB0dVDossIQwNGt7oP
	 NEjYSV4NnnzO58Wv7TsBORQTJRZc9EQhMFDvjbtjJ1Jpn8u+JCy/rHAcdck88u4UP4
	 Qi5QzkLa8QiX9GhugT3h+n6jyGGR06EMumjbOmVIZJKOk49M9HD+aK0vCPyL4JR0Rk
	 QxLYu8hEPz/Wgo2cntM/mC2nPIGa8i0YeM2ZBhwxrhaIiXzecmNzlAenL7vF19cHn3
	 bKXnMLbPOo6Yg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8F85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C921317E07E4;
	Fri, 16 May 2025 16:14:54 +0200 (CEST)
Message-ID: <dcc085b131ec0b8769630bee6ee89ca0b6eacc73.camel@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
From: Julien Massot <julien.massot@collabora.com>
To: Conor Dooley <conor@kernel.org>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Garmin Chang	
 <garmin.chang@mediatek.com>, Friday Yang <friday.yang@mediatek.com>, Conor
 Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Fri, 16 May 2025 16:14:54 +0200
In-Reply-To: <20250515-deploy-wiring-5829acc3d82e@spud>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
	 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
	 <20250515-playpen-dislodge-80245fb8b7a9@spud>
	 <cbd170a3-cbfe-4b4f-a059-efe33fed0e5d@collabora.com>
	 <20250515-deploy-wiring-5829acc3d82e@spud>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_071457_084783_E8D359F0 
X-CRM114-Status: GOOD (  21.85  )
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


Hi Conor, Angelo,
On Thu, 2025-05-15 at 17:17 +0100, Conor Dooley wrote:
> On Thu, May 15, 2025 at 05:11:13PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 15/05/25 17:03, Conor Dooley ha scritto:
> > > On Thu, May 15, 2025 at 03:31:43PM +0200, Julien Massot wrote:
> > > > The '#reset-cells' property is required for some of the MT8188
> > > > clock controllers, but not listed as a valid property.
> > >=20
> > > "required for some" but not marked required on those platforms.
> > > Why not?
> > >=20
> >=20
> > Yeah now that I read that for the third time, the wording is a bit inco=
rrect.
> >=20
> > It's not "required", some clock controllers do have reset controllers, =
but it
> > is facultative to actually use the latter.
>=20
> I don't think I've ever seen this word before.
>=20
> > I'm not sure if the ones that do have reset controllers inside should h=
ave the
> > #reset-cells property as required...
> >=20
> > Conor, what do you think?
>=20
> If "required for some" in the OP was meant as "permitted for some",
> change the wording to that and it is fine.
Changed 'required' by 'permitted' in v2.

Thanks,
Julien

