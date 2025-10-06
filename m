Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A8DCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 20:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIKAcr7AiKo1tJTrh+bk2m2hYbyR4gITRIGMmYNi20Y=; b=l96u9pW9iLMkqdQklQ33kMJ2QF
	Bp3FpnyjDZ/RWBmGNnxjy58vP+QoAUA6mgPVla5jbqCoY8j6P2og55O42dowkZGEW7OzK8mbQkGbp
	MZKXIX2tEoNGA2b75E8/7UV8fT6+4ygmqH8xPtTOoElcOBdGSBITslESN9CKDVi0J+RCA+62IRo55
	lGeeS94Lqb5J1U2vHVy2XQDBD/5hcTeruU9yYfS357GUBWWReN0L/AZEN9L6eip0043GSLU094rp9
	yfaOeqzOtoSnlkK2TiXGHux9SLdeBFchFIHN7HYq//ogQSvdazlubDHegBvt0DYvKQGobGjEvvy5U
	rqVuXWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5s8B-00000000m7B-1Ttn;
	Mon, 06 Oct 2025 20:48:27 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5s89-00000000m5J-3MAS;
	Mon, 06 Oct 2025 20:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=VIKAcr7AiKo1tJTrh+bk2m2hYbyR4gITRIGMmYNi20Y=;
	t=1759783705; x=1760993305; b=pG6G3THD/sdNheUiviI/XbH5xPQ8JzQshOX9RPgXkoiDmMH
	vWyQyFPoEN/r1Rt9XMLmYwqa9Jiu6wCLfKGBKiOHdUUmKuxJLodF2J5z42cGGkjOFhOXUsPSE8SOM
	r5z4lq0l8fNzY1y+1SoXFXv4SsRrnaFslcgk0TEPuOMPxzEH+PtvHt1/5N/73EYMAgf0weV2wGRt1
	/akHIk9cU9yC4KyFplsHVnq4QDsXh59lbqrkMBfStBbGQ40ud9VV46/cHdfmrZyPtmmSIDSfIypiJ
	38P19aq+yOtt6W0AJs9HY7ZxJtWFzQsNHaoah6JKsXFYFXxnCpsCxzRCyZxgLRTw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v5s80-0000000FBWk-3fK8;
	Mon, 06 Oct 2025 22:48:17 +0200
Message-ID: <1697b64e2b64682dbf83186f17f42c50ecf88fa8.camel@sipsolutions.net>
Subject: Re: [PATCH mt76 v2 1/3] dt-bindings: net: wireless: mt76: Document
 power-limits country property
From: Johannes Berg <johannes@sipsolutions.net>
To: Rob Herring <robh@kernel.org>, "Sven Eckelmann (Plasma Cloud)"
	 <se@simonwunderlich.de>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang	 <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Date: Mon, 06 Oct 2025 22:48:15 +0200
In-Reply-To: <20251006204529.GA549972-robh@kernel.org>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
	 <20250926-backoff-table-support-v2-1-16d3726646c4@simonwunderlich.de>
	 <20251006204529.GA549972-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_134825_869858_09C2E637 
X-CRM114-Status: UNSURE (   9.48  )
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

On Mon, 2025-10-06 at 15:45 -0500, Rob Herring wrote:
>=20
> > +          country:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description:
> > +              ISO 3166-1 alpha-2 country code for power limits
>=20
> This would be constrained to something like this?:
>=20
> pattern: '^[A-Z]{2}$'

There's a "00" special case for "world roaming", so maybe that would
have to be '^([A-Z]{2}|00)$'? Not sure you'd ever want to specify that
though. We also use '99' internally for even more special cases, but I'm
pretty sure that shouldn't be specified externally.

johannes

