Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65002EFCD93
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MG7FOIWjqj+xthGjaourrD3jCTwI9c9sb8toKScfFlg=; b=dcPnRdvajmFolSyEAR4ngUHk6q
	296GXiHeXxdgs1opfCGvVuoS/r7prFaQMPCaFIbYRXahqm5wYaknY5JrqEdouOy40+AxewqTwltPi
	+R/uj+Bp1gsFxyfAFAQNzO2T4JO/H2WZbvEJ3MsggdoOpfobLhvp+oJjHl5okS1+/FJoD4Y3vPspb
	nDnbQlLFsa/JM0ow1O423eIMq3RIUcdVdD5o/XaCAU9P9P6gmpa5jwYzlQBZXSIsM3MAOn2DSTSmn
	qcpRtmUQQHOvoA9cHqyMYJ1mgs3M6ZsNuqA88dBUgAqBYcR0H7XWxCYta9Eg1AgU+yAhvVKf147Ss
	6GHH9+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzY1g-000000076hb-1mHM;
	Mon, 09 Mar 2026 10:39:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzY1e-000000076gd-37Dq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:39:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzY1b-0005pX-P5; Mon, 09 Mar 2026 11:39:47 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzY1Z-004W4o-1u;
	Mon, 09 Mar 2026 11:39:46 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzY1a-000000006kZ-3XVB;
	Mon, 09 Mar 2026 11:39:46 +0100
Message-ID: <4777a26fa1406067d8e7126851ba0b56b32038c3.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] dt-bindings: soc/reset: ti: add binding for k3
 platforms reset module
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, 
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,  Tero Kristo <kristo@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Andrew Davis <afd@ti.com>,  Jayesh
 Choudhary <j-choudhary@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Abraham I <kishon@kernel.org>,  Roger Quadros <rogerq@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 09 Mar 2026 11:39:46 +0100
In-Reply-To: <20260309100800.1134701-2-alexander.sverdlin@siemens.com>
References: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
	 <20260309100800.1134701-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_033950_802600_A1F6DBBE 
X-CRM114-Status: GOOD (  10.55  )
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

On Mo, 2026-03-09 at 11:07 +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> Add DT binding for Texas Instruments K3 Multicore SoC platforms reset
> module present on AM64x and newer members of the K3 family and consists o=
f
> the RST_CTRL, RST_STAT, RST_SRC and RST_MAGIC_WORD registers.
>=20
> The planned usage is to provide reset reason information.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  .../bindings/reset/ti,am64-rst.yaml           | 39 +++++++++++++++++++

I think this might belong in .../bindings/power/reset instead.
Or maybe .../bindings/soc/(ti/)?

Like 'device', the term 'reset' is a bit overloaded.

The existing binding docs in .../bindings/reset/ describe peripheral
reset controllers that provide reset signals to other hardware blocks.
See Documentation/devicetree/bindings/reset/reset.txt.

Since your bindings don't contain #reset-cells, I assume the RST_CTRL
register does not contain direct control of reset signals that need to
be operated during runtime.

System reset (restart/poweroff) machinery related bindings are found in
.../bindings/power/reset.

regards
Philipp

