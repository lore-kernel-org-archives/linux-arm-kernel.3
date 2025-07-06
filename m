Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D61C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IFUgnPQyuVFa8Jj8ChajhgVnk7mfJFWlHVz17ozesI=; b=jwks7zjIqXC6Ws2gzp00Ey4u3X
	oICYUpY5yYrc+kZVcaAcjR/KfSWM2u2ZUXp6KaXn0n4ag2+shQo8Wn6a0DvD2GVxf4ciGBj5DKwH1
	UPUqogIxL7UmkrMQ9ibYc21/THsm/R/KUrs6T51URQsUzbKp+oKdp1v+VEOAbjGTk17qLmt4PhjTh
	dkpXO0JXx/Y1br1iG509nXiIuMXepMi3XkjUn8r5lcNsRL2dtFK42e6/ihe0/6CJwvIe0YmmYN8to
	7baZRu2jRaZNTkZdnvnDuqH2qxWN+jzkw2fTshPjI6S5xYydIQMhJBug/z8e/j53bUT0MWFSeh7b6
	Rk2SHU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYNJP-00000000Amv-0cGf;
	Sun, 06 Jul 2025 11:13:35 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYM8e-000000005fp-34kO;
	Sun, 06 Jul 2025 09:58:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=7IFUgnPQyuVFa8Jj8ChajhgVnk7mfJFWlHVz17ozesI=;
	b=ZCYWZFzg4P9WrTsU5d6CCna4Qga4Q/aWUCSIGZfBh+srCwNdj3w3iLVSFj478A/b5BDM7qoD+wsnt06xKUKPe1UqykDHEIDUpUno2Z7hXPAO5oX2zjP1t9FJuObAGEIEFZ52iLRYxY7WTkag5WRFMS+RXWRNl3Cztg/zmMffkuI=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 11:58:17 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 3/7] dt-bindings: arm: sunxi: Add NetCube Systems Nagami Keypad
 Carrier Board
Date: Sun, 06 Jul 2025 11:58:16 +0200
Message-ID: <8549188.T7Z3S40VBb@lukas-hpz440workstation>
In-Reply-To: <4648f0bf-2957-45bf-a6c1-01787e5d3e88@kernel.org>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <2998364.e9J7NaK4W3@lukas-hpz440workstation>
 <4648f0bf-2957-45bf-a6c1-01787e5d3e88@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10685525.nUPlyArG6x";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_025825_071943_0ABA8BD1 
X-CRM114-Status: GOOD (  22.41  )
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

--nextPart10685525.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
Date: Sun, 06 Jul 2025 11:58:16 +0200
Message-ID: <8549188.T7Z3S40VBb@lukas-hpz440workstation>
In-Reply-To: <4648f0bf-2957-45bf-a6c1-01787e5d3e88@kernel.org>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 11:46:46 CEST Krzysztof Kozlowski wrote:
> On 06/07/2025 11:41, Lukas Schmid wrote:
> > On Sonntag, 6. Juli 2025 11:36:34 CEST Krzysztof Kozlowski wrote:
> >> On 06/07/2025 11:07, Lukas Schmid wrote:
> >>> On Sonntag, 6. Juli 2025 09:49:58 CEST Krzysztof Kozlowski wrote:
> >>>> On 05/07/2025 23:38, Lukas Schmid wrote:
> >>>>> The NetCube Systems Nagami Keypad Carrier is a custom board intended
> >>>>> to
> >>>>> fit a standard Ritto Intercom enclosure and provides a Keypad,
> >>>>> NFC-Reader
> >>>>> and Status-LED all controllable over Ethernet with PoE support.
> >>>>> 
> >>>>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> >>>>> ---
> >>>>> 
> >>>>>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
> >>>>>  1 file changed, 6 insertions(+)
> >>>>> 
> >>>>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>>>> b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> >>>>> 7919b5bf5..a2f16d064 100644
> >>>>> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>>>> 
> >>>>> @@ -610,6 +610,12 @@ properties:
> >>>>>            - const: netcube,nagami
> >>>>>            - const: allwinner,sun8i-t113s
> >>>>> 
> >>>>> +      - description: NetCube Systems Nagami Keypad Carrier Board
> >>>>> +        items:
> >>>>> +          - const: netcube,nagami-keypad-carrier
> >>>> 
> >>>> That's just enum with previous entry. Don't make it over-complicated.
> >>>> 
> >>>> Best regards,
> >>>> Krzysztof
> >>> 
> >>> Just making sure here. The actual bindings are fine, but I should merge
> >>> them into one patch, correct?
> >> 
> >> No, you got two comments what should be changed in the binding.
> >> 
> >> Best regards,
> >> Krzysztof
> > 
> > So if I understand correctly you want me to remove the
> > "allwinner,sun8i-t113s" from the carrier boards and keep it for the SoM?
> 
> No, I spoke nothing about that compatible. My comment is EXACTLY under
> the line being incorrect. That entry should have been made enum with
> previous board compatible. Look at other vendors, because this file
> repeats that pattern for some reason, eh...
> 
> Best regards,
> Krzysztof

Ah sorry. I think i understand now. You want the carrier boards in a single 
entry with the different compatibles as the enum like:

      - description: NetCube Systems Nagami SoM
        items:
          - const: netcube,nagami
          - const: allwinner,sun8i-t113s

      - description: NetCube Systems Nagami SoM based boards
        items:
          - enum:
              - netcube,nagami-basic-carrier
              - netcube,nagami-keypad-carrier
          - const: netcube,nagami
          - const: allwinner,sun8i-t113s

Best regards,
Lukas


--nextPart10685525.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqSLgACgkQJnN+drMV
RtiERQgAhtJfnRb+0MWY3I9NrlK10nZqNnvJr1RrRAl3ac/hg00rMlrCjI1GWna3
WnNjQY8ztNvMI83gXaTLDv1raTVU+6sIMcwiZcSGn8wdWSO/Cx4Rl3ziY/z3mAtc
axXLv907yLGC62k4U/wpBJ3+wTEe49M4JaBTs868YCa1Q/vjpqZsnIun+1nWlTFR
hH06vVJhgoV32fDePHQsGyAdn6sQoxt8bLqryu3u2aZaJLDDH/K/bcxpbSCYlSyj
c84tM50/VIdh8/MyMXUUbas/odCS/+7Tvm6fNdlJG/BdIeWL454EJNaVlUdj+Cvp
/4qEOroTN+xTqZNKizC7wI6uMqBkjA==
=g2nF
-----END PGP SIGNATURE-----

--nextPart10685525.nUPlyArG6x--





