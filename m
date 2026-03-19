Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC83107527B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI1nFWFJiT0g+Klurn667jIXgS6STvOyM35+JIVWERw=; b=r25EvC3RKu4oubL3cnjDHkkc2v
	QjdmMIFzM0sfZIh+xt6AmEbpctSEZeFsKHF0PZrsLYN4WkxdVqiC0GWVQqUVlAlwvud00OZCQJ9EQ
	VG3Z4QXA1K/H4k905GqspMJj9jb/nsM55o7uVHJ2JK+vcM24WKZGfmYkRftHGxvySLtSUR3xGbaf8
	vz1zxO9uDUWEM8p8a8fc22pnwyjWKpzYbzYQlReexaB7n03AvFMc01xb6XzB4NLX1+262SO2ulGxx
	5tPA6PioLjmD1S/lbrYEL4dc1Tgh0zZiweJ0IU5Ml7J+Kco7su8z5qbdxLC2RckieG52qG3DXTUD1
	z8omhc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39AE-0000000AHAf-3XJ8;
	Thu, 19 Mar 2026 08:55:34 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39AD-0000000AHAB-0Aim;
	Thu, 19 Mar 2026 08:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dI1nFWFJiT0g+Klurn667jIXgS6STvOyM35+JIVWERw=; b=nEpkOgmhgLY8wIPVM2BFWVL4MZ
	OOXw0eQbA+R5ITSHE4BT2KMXYJ8X0zjTjyWMs9zJvNcgeyjG4XP+qkVMr5ZN6hZ29N1F2+sZARHJu
	x1wrsaZyaA1Srd+eiyCS6kGTEKCQ35Yj2C2+Kj3NbkUeoh0qviO/gi21hy4mzq5h7JsQWdWXiUpDV
	pJ/Sb6XuIJ9tUGXZTg1MgFko/3mPmOHByAdGuI68xmha+nMxK+Yz1oFci1aTa/f9A0S50sUa63vSl
	4lxjRoKivMstEZjFg4fpk5HoTolAN0u9osjSSLkC7G/i/uek5QW0E5PppGP/CAAcNmbJydRF0Us3Y
	mgtVS2uw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w39A6-000HLH-1g;
	Thu, 19 Mar 2026 09:55:26 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w39A5-000M6L-1a;
	Thu, 19 Mar 2026 09:55:25 +0100
Message-ID: <37396c094c7124169ca376cf6aea5350971aec54.camel@ew.tq-group.com>
Subject: Re: [PATCH 3/7] dt-bindings: net: ti: k3-am654-cpsw-nuss: Add
 ti,j722s-cpsw-nuss compatible
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,  Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Date: Thu, 19 Mar 2026 09:55:24 +0100
In-Reply-To: <20260318-sustained-reshuffle-eaf180729a9c@spud>
References: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
	 <1382fed198246f1563dea091478757aebc4e4948.1773751309.git.nora.schiffer@ew.tq-group.com>
	 <20260318-sustained-reshuffle-eaf180729a9c@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27945/Thu Mar 19 07:24:38 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_015533_078289_8CFDE6E7 
X-CRM114-Status: GOOD (  15.31  )
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

On Wed, 2026-03-18 at 17:35 +0000, Conor Dooley wrote:
> On Wed, Mar 18, 2026 at 03:05:25PM +0100, Nora Schiffer wrote:
> > The J722S CPSW3G is mostly identical to the AM64's, but additionally
> > supports SGMII.
> >=20
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nus=
s.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> > index a959c1d7e643a..9ab8237c7f79e 100644
> > --- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> > +++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> > @@ -59,6 +59,7 @@ properties:
> >        - ti,j7200-cpswxg-nuss
> >        - ti,j721e-cpsw-nuss
> >        - ti,j721e-cpswxg-nuss
> > +      - ti,j722s-cpsw-nuss
>=20
> For all these bindings, why is a fallback not suitable? Seems like it'd
> be possible here, since there's just a new feature. Is there some other
> programming model difference?

I think a fallback makes sense, I didn't add one because other variants der=
ived
from the AM64 don't have one either. I can include a fallback in v2 (for al=
l 3
bindings in this series).

Best,
Nora



>=20
> >        - ti,j784s4-cpswxg-nuss
> > =20
> >    reg:
> > --=20
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

