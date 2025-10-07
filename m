Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6D2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXrBq34/KLJA+q9Av0r5tSi7SY+6217eacbPJd61JPs=; b=HIiiUV8vYv4k6sA2SWhdx5/RrG
	XLM566XyH5Bcx8HKWUiiOnnlOclHK+sQqAl6EFSiDtGE/o3rvJ/++8uNZ0X68jluLBPqlt4kEAKze
	AHIjhJxn8GOfOHD2WHKDK+JGixN4NjLHcitEJoOE6EevVARHOKhTbkXPgHJatzx8orRwFPUeIf7Mo
	7m39rCmnY9mJOj7/MoN63Joi04KOeU9mx4NbDB68+gIEjNaAUMOUDQpRf+CQEqB8NJfyHsID1wg89
	mKwgGqJtlUiD52gIVJT31SKym2G0sdKuNHYm2V+cKY7rEr//aTRPOADih3wQHQ3oZ0ei3r5zC4Pzx
	R6WjN9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62ZM-00000001Tfu-09Y0;
	Tue, 07 Oct 2025 07:57:12 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62ZJ-00000001Tf9-3rCp;
	Tue, 07 Oct 2025 07:57:11 +0000
Received: from ripper.localnet (p200300c597021AE00000000000000C00.dip0.t-ipconnect.de [IPv6:2003:c5:9702:1ae0::c00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with ESMTPSA id 0692EFA12C;
	Tue,  7 Oct 2025 09:57:03 +0200 (CEST)
From: Sven Eckelmann <se@simonwunderlich.de>
To: Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: Re: [PATCH mt76 v2 1/3] dt-bindings: net: wireless: mt76: Document
 power-limits country property
Date: Tue, 07 Oct 2025 09:56:58 +0200
Message-ID: <1839711.VLH7GnMWUR@ripper>
In-Reply-To: <1697b64e2b64682dbf83186f17f42c50ecf88fa8.camel@sipsolutions.net>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20251006204529.GA549972-robh@kernel.org>
 <1697b64e2b64682dbf83186f17f42c50ecf88fa8.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8631237.NyiUUSuA9g";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_005710_159406_8F30102A 
X-CRM114-Status: GOOD (  15.12  )
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

--nextPart8631237.NyiUUSuA9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <se@simonwunderlich.de>
Date: Tue, 07 Oct 2025 09:56:58 +0200
Message-ID: <1839711.VLH7GnMWUR@ripper>
MIME-Version: 1.0

On Monday, 6 October 2025 22:48:15 CEST Johannes Berg wrote:
> On Mon, 2025-10-06 at 15:45 -0500, Rob Herring wrote:
> > 
> > > +          country:
> > > +            $ref: /schemas/types.yaml#/definitions/string
> > > +            description:
> > > +              ISO 3166-1 alpha-2 country code for power limits
> > 
> > This would be constrained to something like this?:
> > 
> > pattern: '^[A-Z]{2}$'
> 
> There's a "00" special case for "world roaming", so maybe that would
> have to be '^([A-Z]{2}|00)$'? Not sure you'd ever want to specify that
> though. We also use '99' internally for even more special cases, but I'm
> pretty sure that shouldn't be specified externally.

Good point. I would say that 00 is already handled by the "fallback" limit 
code. If it finds neither a country nor a regdomain, it just marks this entry 
as "fallback".

Regards,
	Sven
--nextPart8631237.NyiUUSuA9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaOTHygAKCRBND3cr0xT1
ywhZAP4s8bEDQwSmJy8BeB8DNxkjVbJ4TMzkk1jlnOud1CgbZQEAsezHw+N0eJXn
R256VuIFrw6VaIWcPQe0BI7De6ceaAM=
=jlgT
-----END PGP SIGNATURE-----

--nextPart8631237.NyiUUSuA9g--




