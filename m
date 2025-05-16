Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F85DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQpoNRZoT4Laj13U4Bh1ZV0ArWEfGdTmj1r3KozSV5s=; b=H1oLxm2sNH8cKY0QPQbzzWxREy
	F9ZWJpnYwh3COPqHsveAzgm8PlMPpXo6LNzzZZFer43lo2tmbw8NrOQEQahQPlswfTMAfyrrJYead
	rk1V/9mJpR0KA3xLZIiXTLGTlb3BpGYL0/akLhf3i6f/2v9Y9FjMVat0WEkMXk8bTeh1kwxub8SjR
	6Le3/BRLd7akgy1kFSgUM1p5aBQdh6h1341BH7y3HEvsH5N6qWn99AaVXnYodsGVHOVLeTpO4z32N
	Yb9q+LX1eftxgIdB8wvL7vtiigzhRK1e5nEHUT7+GZDeCC2w07qTqbjMaIF4iPKU0rXsql2s57VAo
	vNnPmUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwrg-00000003paT-1aLx;
	Fri, 16 May 2025 15:20:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvrD-00000003djU-2tnr;
	Fri, 16 May 2025 14:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404974;
	bh=gQpoNRZoT4Laj13U4Bh1ZV0ArWEfGdTmj1r3KozSV5s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=F0BCeZxc4Hvnn4U+tm1M/aTPl9AHHvTScCJEu/gnm2urOCaLEOUE2y0/igK4q7LSM
	 MW+wZL/O5Ubu3aZY0H4YZdQNJY6YlB8G+KhTYcESqkFEytEts7epDBmT6v/DOFjeWF
	 Vsrnkji1TDN++N4z3v3+3paftPLWSO/i8obJDqEvnOqRb5fBAGpoGmY2qM/JHDrvCR
	 BOmJkUhlRKGIu98iRLxQIPBnlmsP3VVLDSGnd/8yUCMYax9elMoa7BmwltFIlkC1fg
	 oNoWJ9W3E3NJ28mmwcyZ37SaQMPe7cEKCuDy70kE09R2zmH0VTbT5dli95nVv9El9H
	 wFN+8mzxihe9Q==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600c8f85CF092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91A1617E07E4;
	Fri, 16 May 2025 16:16:13 +0200 (CEST)
Message-ID: <2646b1358d1d141cbb5988a3bb2bbf4177f4ce4f.camel@collabora.com>
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8188: gce: add missing
 'clock-names'
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, Garmin Chang
 <garmin.chang@mediatek.com>, Friday Yang	 <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 16 May 2025 16:16:12 +0200
In-Reply-To: <89234201-9315-41f5-ab13-68272f62c53d@collabora.com>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
	 <20250515-dtb-check-mt8188-v1-3-cda383cbeb4f@collabora.com>
	 <89234201-9315-41f5-ab13-68272f62c53d@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_071615_874461_C675DEB2 
X-CRM114-Status: UNSURE (   8.56  )
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

On Thu, 2025-05-15 at 16:52 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/25 15:31, Julien Massot ha scritto:
> > The 'clock-names' property is required by the dt binding.
> >=20
>=20
> I just remembered something....
>=20
>=20
> ...care to respin this patch instead?
> https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delr=
egno@collabora.com/
>=20

Ok, we will resend this patch instead, I dropped the patch 3/3 in the v2.

Regards,
Julien

