Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52DA109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om8C4xRL4G5OJYvxqnzGtRDXoa6aYun3rB72EV+Md+Q=; b=oI2rvlIJ34eBE5Phtc79/1DKSY
	q8XGwb2kpJzozZIt7Z/+hVqeJ+Rz6BWre4LAG6Fy+MMTQqEW7eD4NSMbR7F44auB34QYAyFO0Bh+E
	dS+CM92I5ljtFD+2RrKimIPOYJLgdTPpHckVrsc7fjQM5Xzq/+zGdnYhuhXzuvqhoJC0cBNBzwUTL
	BoJ27I5jvsiBpcpDw9YDA+Ipmidw2XwFlhvUtcBh9+z9xX5qlRe/MOLvXaR0mzIZi5S1HYMFhQY0x
	eNBWCe8pNIwTNeXd7SGfnFx0AkSYGNKFwESkxyvnm2yiFI2MXD9utsC7tCZR1fP7wccaC4qxNu4uQ
	PoyXbsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eHz-00000004qaM-2GdL;
	Thu, 26 Mar 2026 06:33:55 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eHw-00000004qa2-3hUl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774506830;
	bh=om8C4xRL4G5OJYvxqnzGtRDXoa6aYun3rB72EV+Md+Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RVchZcSxXPFdsmnvH4AnQkN2+1gupNkeRKHB4UHoEkEzw6Fy9/wccbzesTahCb74v
	 fFVTp01572MGe129MFl9h0qdwaG8L8FM57vgieBVBIQ3OfjyDj1PM0EcXma98VM1Es
	 6sSVHur16IsQVaJahX3t+3cTBeWUleQWGaEZyM7jN/9Q/ubIr+TdApYHdwJKKNEBHp
	 rss334e0TEB5gA+Insa7bE/hIDbhw7M2kqr0cvGCPORbmRBwVa0Erx3+VEkYP0BVrf
	 96Rm1Na7Zy9HCT43XSST04jQzJcJjvr9kU45Z5dLezfk9MgjCVSlALzF/Ln2hInT7w
	 6M0alBAbbVcDQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CF6326597C;
	Thu, 26 Mar 2026 14:33:49 +0800 (AWST)
Message-ID: <0f98ee4fcc662e80160026208b18e655eeb50ad1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Add eeprom device node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 colin.huang2@amd.com
Date: Thu, 26 Mar 2026 17:03:49 +1030
In-Reply-To: <CAPBH0A9oatx7U2+3dvGVgonHEm+yq5TFM9mTcdStau2Lk1XytA@mail.gmail.com>
References: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com>
	 <fd932aa3f0cae64f40c3b207657032e7bf61066a.camel@codeconstruct.com.au>
	 <CAPBH0A9oatx7U2+3dvGVgonHEm+yq5TFM9mTcdStau2Lk1XytA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_233353_124007_5182100C 
X-CRM114-Status: UNSURE (   9.01  )
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

On Fri, 2026-03-06 at 14:06 +0800, Colin Huang wrote:
> Hi Andrew,
>=20
> Thanks for the feedback.
>=20
> In our case the only functional difference between DCSCM rev=E2=80=AFB/C =
and
> rev=E2=80=AFD is the EEPROM I=C2=B2C address change (0x50 =E2=86=92 0x51)=
.
> Other than this, the hardware is identical and all device-tree
> described components share the same wiring and behaviour.
>=20
> Maintaining two separate devicetrees for a single=E2=80=91byte address sh=
ift
> doesn=E2=80=99t scale well for us.=20

I disagree that there's a problem of scale. The kernel's dts files are
processed with the C pre-processor - you can #include one file from
another. .dtsi files work this way, and as a related example, we
maintain two devicetrees for the AST2600 EVB where -A1 had some minor
differences in the regulator configuration:

 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts?h=3Dv7.0-rc5
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dts?h=3Dv7.0-rc5

See also my response to Kevin Tung earlier:

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

Andrew

