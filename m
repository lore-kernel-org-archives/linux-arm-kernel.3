Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963ECC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tx6cDw7EKbhkJw6fG1D90ClaQuotZ1sAaoIkU3c1stM=; b=dXB8VYFAcfz72UXig6fCi9dRJs
	Xh2jlPHeusT1AylJBJmiM0O1SjG2uAQa1tk082maDHafeQYI1F9iMz3oeuT64cPGkiAkhf6oFCvpW
	Zkl+ezosM/M5lbLbLdzeyABjdWxkAoyB/14cIQIq357vVnPPXFmiCsRpeAGTJh7c41HieS86bV1kb
	z0UQXopXsE5uuFXtskm6ywwGCIhIDwD9p/mpYjQWDg2TTFBYsN8atZPKzMi6Ehcy+sIuisevQMvv8
	l7ZBnqN/bzchjXGNDY6HsX5niSzUVHD1puN6asClcVxplXmbbt9a8x1t3I9uxwzl4Jg9iVRMt2hMi
	y9ZqvNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLw4-000000004PS-1pIH;
	Sun, 06 Jul 2025 09:45:24 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLsg-0000000045U-0kMQ;
	Sun, 06 Jul 2025 09:41:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=Tx6cDw7EKbhkJw6fG1D90ClaQuotZ1sAaoIkU3c1stM=;
	b=WM1oT5pxVG9Iy9k5huD7gAh1ZzQlWUQf6t5rW9vfWRI3KVBlDO4eHl8jOQaokGwLNAz7ECOOaXQ6nT7snNJEwX7rtI0Yu/1HoS2ngzmKLM1TBLLFRCFvrhB5+JVaJ2FvcT7Y6I4C5Q+1107J2YwAaluYa2HuD0Qw7j1fQPir9gU=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 11:41:43 +0200
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
Date: Sun, 06 Jul 2025 11:41:42 +0200
Message-ID: <2998364.e9J7NaK4W3@lukas-hpz440workstation>
In-Reply-To: <6f257dd2-b88c-4dc2-a2ee-f92de4e0412b@kernel.org>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <4994705.GXAFRqVoOG@lukas-hpz440workstation>
 <6f257dd2-b88c-4dc2-a2ee-f92de4e0412b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3359771.aeNJFYEL58";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_024154_543459_CAD1C6C8 
X-CRM114-Status: GOOD (  19.18  )
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

--nextPart3359771.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
Date: Sun, 06 Jul 2025 11:41:42 +0200
Message-ID: <2998364.e9J7NaK4W3@lukas-hpz440workstation>
In-Reply-To: <6f257dd2-b88c-4dc2-a2ee-f92de4e0412b@kernel.org>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 11:36:34 CEST Krzysztof Kozlowski wrote:
> On 06/07/2025 11:07, Lukas Schmid wrote:
> > On Sonntag, 6. Juli 2025 09:49:58 CEST Krzysztof Kozlowski wrote:
> >> On 05/07/2025 23:38, Lukas Schmid wrote:
> >>> The NetCube Systems Nagami Keypad Carrier is a custom board intended to
> >>> fit a standard Ritto Intercom enclosure and provides a Keypad,
> >>> NFC-Reader
> >>> and Status-LED all controllable over Ethernet with PoE support.
> >>> 
> >>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> >>> ---
> >>> 
> >>>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>> 
> >>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>> b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> >>> 7919b5bf5..a2f16d064 100644
> >>> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>> 
> >>> @@ -610,6 +610,12 @@ properties:
> >>>            - const: netcube,nagami
> >>>            - const: allwinner,sun8i-t113s
> >>> 
> >>> +      - description: NetCube Systems Nagami Keypad Carrier Board
> >>> +        items:
> >>> +          - const: netcube,nagami-keypad-carrier
> >> 
> >> That's just enum with previous entry. Don't make it over-complicated.
> >> 
> >> Best regards,
> >> Krzysztof
> > 
> > Just making sure here. The actual bindings are fine, but I should merge
> > them into one patch, correct?
> 
> No, you got two comments what should be changed in the binding.
> 
> Best regards,
> Krzysztof

So if I understand correctly you want me to remove the "allwinner,sun8i-t113s" 
from the carrier boards and keep it for the SoM?

Best regards,
Lukas
--nextPart3359771.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqRNYACgkQJnN+drMV
Rtgc2ggAg2Nrmm5+cnCBI7/+eAqaPrOuJ58OsFqoNuxGRtkqTCEJMrnk9aphn+QO
R+KYZmxhxFv8GTKAgfPdAG54XMVUTXV2upUYad0Qk2D2IbiPG/HU6Cd3EkxEtMum
NICpcxvZid1uNT0WzzYsD3Agn3DsYNrvVFTPUhx413QWykIxtDw0yOAzIw+HPWCN
8/1HSh+3TVj/Pk9HSuaBDzQ1faa9JHTsGoCQDsXGsybl2gis+J3CjR3MaNnCLKd4
bwOnxGLUmwKl4JBD2t/sK+rUXi52phr3wcUQeHmCxhXegO3ck9kdCMRCSPAzHuqL
zI6pL/QFThBIepZbBw12Vdv0YjmKJg==
=qoZP
-----END PGP SIGNATURE-----

--nextPart3359771.aeNJFYEL58--





