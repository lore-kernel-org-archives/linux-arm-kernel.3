Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D0DC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcyZ33LazzChsEAUzIIB359Y93Og/rELjwXfNDaBkEM=; b=UyKoEWL+1hfeB81FVy8ZyyKjwL
	MiHD0FFK7c57hXMCIpxJbBuO2pUnVyTHEuTdy0zKHEx0SzIg1xfHgBjGFTupccU4g3JST8t7OGKrO
	SsgEPCX6X3tlykJBE1vGMfR9sSBqrG+PalDzg7Q3kZSC75C1IezT3IyZPHrKmBTS7hNZvEIQ4+a1X
	Cn6HKsKC/rHljdC/Bm0VQRlEXoMCm9A2xw1HzMTGoLOU+PY7Xwom12aRYkQ4Mf0cGB1Pf4GEjCyz6
	YghM8y59vpPFWg0piqgmL5E5wcnT6F3R0hSSt0q3La6d797R3dbsK9q4khytGvLDPqgPiuOETURsZ
	BqEWFfUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEiB-0000000FdAy-2K5X;
	Fri, 27 Jun 2025 19:26:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDlN-0000000FUqs-351N;
	Fri, 27 Jun 2025 18:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AcyZ33LazzChsEAUzIIB359Y93Og/rELjwXfNDaBkEM=; b=HcpRcSSz1aCLDictpkpp3PuP8n
	016GmdmvMyFTr8Fp3goWlzDWt6g+Qg1UQnq19KLPDu5XfrsfGy54AeysX+I7b5EKWhJNwc3G3aIJH
	6MxIeD5TZRDXYXkEWWwhUorD+HAPmBCXbYiEQpcYsK/60fbQ0QiNT3BCc6XsT51j7ylorjGHgyvk4
	LAjIG7D8xgOgYJRBYlD+t4WGvJJeL6GUaYKKgk3KDs7mBXsxLku1ItYfQivQjw4M44RFKl8xpAIZY
	xWjreGFjjXbkK3L6Nl9gPdT6tXt2AXij+qt7dHgCcjrz+03Ba6odHEvAXf8WmjOJYwo7Z+2oqYMv+
	LNt1qWzQ==;
Received: from i53875b81.versanet.de ([83.135.91.129] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uVDl7-0006Qj-Ee; Fri, 27 Jun 2025 20:25:09 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399 boards
Date: Fri, 27 Jun 2025 20:25:07 +0200
Message-ID: <5121698.88bMQJbFj6@diego>
In-Reply-To: <DAXGZG0DEKS2.7RLXKSDO0C9T@cknow.org>
References: <20250627152645.740981-1-didi.debian@cknow.org>
 <b1c789bf-1369-42ec-8bb3-d7a45c92abf0@cherry.de>
 <DAXGZG0DEKS2.7RLXKSDO0C9T@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_112525_799564_3A6684EC 
X-CRM114-Status: GOOD (  26.91  )
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

Am Freitag, 27. Juni 2025, 18:52:08 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Diederik de Haas:
> Hi Quentin,
>=20
> Thanks for taking a look.
>=20
> On Fri Jun 27, 2025 at 6:10 PM CEST, Quentin Schulz wrote:
> > On 6/27/25 5:16 PM, Diederik de Haas wrote:
> >> The #address-cells and #size-cells properties are not useful on the DSI
> >> controller nodes; they are only useful/required on ports and panel(s).
> >> So remove them from the controller node and add them where actually
> >> needed on the various rk3399 based boards.
> >>=20
> >> Next to that, there were several (exact) redefinitions of nodes which
> >> are already present in rk3399-base.dtsi to add a mipi_out endpoint.
> >> Simplify that by referencing the mipi_out phandle and add the endpoint
> >> to that, which allows the removeal of the ports redefinition.
> >>=20
> >> And fix 1 instance where the mipi_out referenced node was not sorted
> >> correctly.
> >>=20
> >> This fixes the following DTB validation warnings:
> >>=20
> >>    unnecessary #address-cells/#size-cells without "ranges",
> >>    "dma-ranges" or child "reg" property
> >>=20
> >
> > Too many unrelated changes in this commit, please split into multiple=20
> > commits.
> >
> > I could identify:
> >
> > - moving address-cells/size-cells from SoC.dtsi to board dts(i)s,
> > - reordering properties to better match DT coding style=20
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-s=
tyle.html#order-of-properties-in-device-node
> > - use phandle to directly access ports,
> > - reorder DT node to better match DT coding style=20
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-s=
tyle.html#order-of-nodes
>=20
> I initially had it as several commits, but that resulted in (f.e.) 1
> issue being fixed, but 1 (or more) others would pop up.
> Those were then fixed in follow-up commits, but I assumed I'd get Rob's
> bot screaming at me for introducing new warnings (first).
>=20
> And as they all relate(d) to fixing the dsi node, I then choose to
> combine them (but still separated by SoC).
> IMO there are several ways to organize the commits and each would have
> their pros and cons, so I 'settled' for this arrangement.
>=20
> So I prefer to wait for other people's opinion first before reorganizing
> the commits again (if there's a different consensus).

personally, I can live with the current setup here, because as you said
it's all DSI related, and also not a functional change ;-) .

I guess you _could_ move the clock-master + status moves into a separate
patch, as that should not trigger any warnings.


> > The change for RK3399 Puma Haikou Video Demo DTSO is fine for me.
>=20
> Thanks :)
>=20
> Cheers,
>   Diederik
>=20





