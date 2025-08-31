Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB07CA1000
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXN3u9gmX8M81RD47CrGHkF0QMMIcEt0NP7+VL2Ck7A=; b=coEFK4hMiXpIcXFdQiHKOYTrPu
	kSR1gmLdE3L6oE7/4Rpon71VdojjYUsRMc8Ed8mkS4omOCpHXCImOjylPJ5JjbREMGLyIqJ93bFvF
	P+EYbuM2VqvXxZ4IOArxC4lqY9XyttovDr1gZhM3unYXa+6+F8xFS11oIXOBjFZIcE0aUp/tLP0Ow
	rt7CoY8ZlZ+uywPHBuKSNA5Jp5McrKps1KKhvQ9xTs+6MknpS0EKG8LHy3ovct6A7hIqtmkD4VBO2
	qiDcoXdp1BqOEcXs1kWj7z0t+ZfHAaBbnvULvlzr7X+dS5NICGKaDRZSInQK5ezWPzWBaJby8auG4
	rMwBTTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjP2-0000000AImF-3ORv;
	Sun, 31 Aug 2025 14:51:32 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjMI-0000000AIcQ-2jtD;
	Sun, 31 Aug 2025 14:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1756651720;
	bh=yjP8Q67gJ8paeMTc0Y4T9nY+2o85Zvxpki0vD4SYeOk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fWf9ipaq00vZUxq/dTf2JtUZL10xEi1Y+KpE+y1VHQyODXE2Y+fzvb+ML9Xi2Bjrp
	 l1E48TJYZc+tfp7pyL8pL/x4ict/9uLUT8n73SHugBA5II3sSYR2nLuu82UoeE2REs
	 iPpDyjX++d+r7iJLrm+Y1DJsTxDIEgtox5MuHsvggotH9CKdx6qKgnTHN5TuMe6x7A
	 d7x2CPSqSoazj+jJIjbR+HmO4yoP06KONwTeg1MMBovuwqxfIPfkmOCqZcqj5RY2zu
	 vN7jGth3kexhm5aNok/9gkAohriJBghqo+Ll3IoB2iWc6Hyj3KAby5dE+2bkCR6WjE
	 82/why8OE8naQ==
Received: from WahpenayoPeak.tahoma.link (unknown [IPv6:2600:4040:50be:5a04:7b87:89ea:8410:bae3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 21D4427E468;
	Sun, 31 Aug 2025 14:48:40 +0000 (UTC)
Date: Sun, 31 Aug 2025 10:48:39 -0400
From: Erik Beck <xunil@tahomasoft.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HINLINK H68K
Message-ID: <20250831104839.7b71f2fc.xunil@tahomasoft.com>
In-Reply-To: <5285B176-5178-4F6F-8FB6-B898AC0EC939@tahomasoft.com>
References: <021c2e76-cbde-4a2e-a165-a61223cdff93@lunn.ch>
	<5285B176-5178-4F6F-8FB6-B898AC0EC939@tahomasoft.com>
Organization: Tahoma Soft
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_074842_851006_44D60F31 
X-CRM114-Status: GOOD (  14.82  )
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

On Sat, 30 Aug 2025 18:21:18 -0400
Erik Beck <xunil@tahomasoft.com> wrote:

> > On Aug 30, 2025, at 17:38, Andrew Lunn <andrew@lunn.ch> wrote:
> >=20
> > =EF=BB=BF =20
> >>  =20
> >>> +&gmac0 {
> >>> +    assigned-clocks =3D <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
> >>> +    assigned-clock-parents =3D <&cru SCLK_GMAC0_RGMII_SPEED>;
> >>> +    assigned-clock-rates =3D <0>, <125000000>;
> >>> +    clock_in_out =3D "output";
> >>> +    phy-handle =3D <&rgmii_phy0>;
> >>> +    phy-mode =3D "rgmii-id"; =20
> >>=20
> >> Please change phy-mode here to "rgmii". This change will yield an
> >> ethernet speed throughput change of a factor of 100+. =20
> >=20
> > Rockchip by default do bad things with RGMII delays.
> >=20
> >  tx_delay:
> >    description: Delay value for TXD timing.
> >    $ref: /schemas/types.yaml#/definitions/uint32
> >    minimum: 0
> >    maximum: 0x7F
> >    default: 0x30
> >=20
> >  rx_delay:
> >    description: Delay value for RXD timing.
> >    $ref: /schemas/types.yaml#/definitions/uint32
> >    minimum: 0
> >    maximum: 0x7F
> >    default: 0x10
> >=20
> > Try setting both of these to 0. And then use 'rgmii-id'.
> >=20
> >    Andrew =20
Setting both gmac0 and gmac1 to phy-mode=3Drgmii-id with tx/rx delay set to
<0x0> yields about a 7x improvement from ~6 Mbs (with phy-mode=3Drgmii-id a=
nd
tx/rx delay unset) to about 43 Mbps, which is still well below the ~950 Mbs
with phy-mode=3Drgmii and tx/rx delay unset.

Regards,

Erik

>=20
> Thank you!
> >=20
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip =20


