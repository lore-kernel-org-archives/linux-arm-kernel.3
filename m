Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D11C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYQJgp+YqSaqLX+Gu3RwL9L3fPGOWiBg+qdbYxy4gD4=; b=XFEfpIGhVyOzMJYpTsq0HlTgNl
	HoR6nJx3oraIMsiJ0ebp4b27716C9Towld3jziNGQA5e2fkfJNjDOPR9qD/6GpWFv14UB18m4G8Kz
	4owColLxPhaavQDxrLb/G6CZtamTqx50hUD7aCBm8jd4DlLJrOZxQC/cqIg4iC4PgOcny4UT/TLBm
	8jDAYBcTlVy5pYmNCxHn2ZzEb1xlhgd7OAW/urBRaMg3nCy87mrvDWcqT7pUCxATK4hB+Jzt0N3Qa
	aOpS6CV0ZSyN6655PAvTz1PKatBqWhomj5VxTr0SDbJz6KJNLK8MsP/IpuLV3Q/oJmEytX7FYGiWp
	vC4TBV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpE-0000000DfoV-2Q4c;
	Tue, 06 May 2025 23:35:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLJV-0000000ChaI-0pck;
	Tue, 06 May 2025 16:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wYQJgp+YqSaqLX+Gu3RwL9L3fPGOWiBg+qdbYxy4gD4=; b=MkWdMOIuXbNbPdrDqke9a8CvVo
	fwO/8nDlAA/RjKLAZALusRdWlAl9ik7oOTCmbecFwcgrv0oWv83AS8M45iBVGiJr24zpGmhW5fS5o
	CXc38odJNP/lT3uwlSPjgyobgDNHgLax6TUVtQpoAiNwThoVow/8RZSArpbx8QAb5GQ87u+3IEL/n
	coWcj3MWcqc6Jpm6JQoA7BZNNut/P2yxcTZJo68Z/i6SZqAw+HgSLbf8u7JA+t/Wq0aoYNdMTmXgI
	asGjoGOc8QZrq27HuZJBV6i/d6S/a2h24qfaHpOC6SpVZc21uxk8/kTvwqPnadiWVRZE1JChfNiZh
	9qnhjVXg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uCLJM-00039w-FT; Tue, 06 May 2025 18:38:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>, John Clark <inindev@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 krzysztof.kozlowski@linaro.org, conor+dt@kernel.org, jonas@kwiboo.se,
 frattaroli.nicolas@gmail.com, andrew@lunn.ch
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 and
 Core3576 bindings
Date: Tue, 06 May 2025 18:38:27 +0200
Message-ID: <5007332.31r3eYUQgx@diego>
In-Reply-To: <c8114ff8-f207-4ea8-aaf1-298dcea9f030@gmail.com>
References: <20250506114115.613616-1-inindev@gmail.com>
 <20250506-almighty-uncork-f7a0bc42d763@spud>
 <c8114ff8-f207-4ea8-aaf1-298dcea9f030@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_093837_255364_F415C68C 
X-CRM114-Status: GOOD (  21.77  )
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

Hi John,

Am Dienstag, 6. Mai 2025, 17:54:10 Mitteleurop=C3=A4ische Sommerzeit schrie=
b John Clark:
> On 5/6/25 11:44 AM, Conor Dooley wrote:
> > On Tue, May 06, 2025 at 07:41:14AM -0400, John Clark wrote:
> >> Add device tree binding for the Luckfox Omni3576 Carrier Board with
> >> Core3576 Module, based on the Rockchip RK3576 SoC.
> >>
> >> Signed-off-by: John Clark <inindev@gmail.com>
> >> ---
> >>   Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Doc=
umentation/devicetree/bindings/arm/rockchip.yaml
> >> index 455fbb290b77..826dede32145 100644
> >> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> >> @@ -715,6 +715,16 @@ properties:
> >>             - const: lckfb,tspi-rk3566
> >>             - const: rockchip,rk3566
> >>  =20
> >> +      - description: Luckfox Core3576 Module
> >> +        items:
> >> +          - const: luckfox,core3576
> >> +          - const: rockchip,rk3576
> >> +
> >> +      - description: Luckfox Omni3576 Carrier Board
> >> +        items:
> >> +          - const: luckfox,omni3576
> >> +          - const: rockchip,rk3576
> >=20
> > Not sure this is correct, does the module not have to be attached to
> > this particular carrier to be used?
>=20
> The compute module and the carrier board together like the E25.=20
> Presumably the compute module would be used in other applications
> but the carrier board is not useful without it.
>=20
> Is the E25 done correctly here?  I can copy this format:

=46or the baseboard + module you should always have one of those

> >> +      - description: Luckfox Core3576 Module
> >> +        items:
> >> +          - const: luckfox,core3576
> >> +          - const: rockchip,rk3576
> >> +

      - description: Luckfox Core3576 based boards
        items:
          - enum:
              - luckfox,omni3576
          - const: luckfox,core3576
          - const: rockchip,rk3576

I've looked at the product page [0] now and the Core3576 module itself
can't work independently without a baseboard present, so the above should
be enough, and also allows for possible future other baseboards to be
integrated.


Heiko


[0] https://www.luckfox.com/EN-Core3576



