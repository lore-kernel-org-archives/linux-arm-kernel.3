Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BE6CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqgWuW6X9lGDW6VOKkSankyyv4WuzzMZq36BkAGJqM0=; b=Zxv40ZEMAnfB0iHdHEdWQns1Cy
	V+2WpUxWapibEslR6XWa66uuu/CRTswpZL870lgo9AZf+emaNNmtzju2NRTPh08hv2jZCQ7J/OWJS
	Gmf0F4qK/pBxlXNrYfgAfn1OCTSpVfWf5bG0RufXOccKSBhOoTNKGe8Vl4DDzrmoUq4wLKfC/qdmF
	P6Zwkv8TP9iLISDwC13k6EH2ibnbWsHPaxCZBnidUln1+pD6jsjU8RYw+a2bHYYWvKT/sHXro8dMj
	QEcbYUanr0KQM/68lluI2ygjEDdtzjIDQ83eT4woU8suszyle1+agW7TuTmEdLUlUElG10M3PrH73
	qylXOHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62jr-00000001USn-2Cbl;
	Tue, 07 Oct 2025 08:08:03 +0000
Received: from mail.simonwunderlich.de ([23.88.38.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62jo-00000001USL-271o;
	Tue, 07 Oct 2025 08:08:01 +0000
Received: from ripper.localnet (p200300C597021AE00000000000000c00.dip0.t-ipconnect.de [IPv6:2003:c5:9702:1ae0::c00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with ESMTPSA id DFAA9FA12C;
	Tue,  7 Oct 2025 10:07:55 +0200 (CEST)
From: Sven Eckelmann <se@simonwunderlich.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Johannes Berg <johannes@sipsolutions.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 Shayne Chen <shayne.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH mt76 v2 2/3] dt-bindings: net: wireless: mt76: introduce backoff
 limit properties
Date: Tue, 07 Oct 2025 10:07:52 +0200
Message-ID: <2249324.Mh6RI2rZIc@ripper>
In-Reply-To: <175978385977.561952.12777844195936444721.robh@kernel.org>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20250926-backoff-table-support-v2-2-16d3726646c4@simonwunderlich.de>
 <175978385977.561952.12777844195936444721.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3717359.R56niFO833";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_010800_706528_B0D0955D 
X-CRM114-Status: GOOD (  14.30  )
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

--nextPart3717359.R56niFO833
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <se@simonwunderlich.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Oct 2025 10:07:52 +0200
Message-ID: <2249324.Mh6RI2rZIc@ripper>
MIME-Version: 1.0

On Monday, 6 October 2025 22:53:36 CEST Rob Herring (Arm) wrote:
> 
> On Fri, 26 Sep 2025 12:04:53 +0200, Sven Eckelmann (Plasma Cloud) wrote:
> > Introduce path backoff limit properties in mt76 binding in order to specify
> > beamforming and non-beamforming backoff limits for 802.11n/ac/ax.
> > 
> > Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
> > ---
> >  .../bindings/net/wireless/mediatek,mt76.yaml       | 60 ++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> > 
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Though I know nothing about this. Is there any reason why this is 
> all specific to mt76 rather than being common? Perhaps these settings 
> are all just part of the opaque "calibration data" in the QCom case?

Yes, everyone handles it differently and has different requirement for the 
actual provided data. Qcom has the calibration data, pre-calibration data, 
calibration files and pre-calibration files (which also needs variants for 
different devices or regions). But the actual interpretation of this "opaque" 
blob is secret and handled directly by their firmware. Don't let me get 
started with the (sometimes) embedded regdb in their calibration data.

Regards,
	Sven
--nextPart3717359.R56niFO833
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaOTKWAAKCRBND3cr0xT1
y1P6AQCJRqHBtM3JW0S3r67quInXoomehh1RARYb5qW8xjcSWgEAkGt4kjlOUGCC
mOCuYzAeIPd9MfFHxHxtcsvjodrRXQI=
=FPF3
-----END PGP SIGNATURE-----

--nextPart3717359.R56niFO833--




