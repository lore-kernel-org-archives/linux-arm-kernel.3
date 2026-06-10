Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EC1CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4dMD/100adzbPgTxMBB6l472MWU6Q0VLNNG94IBX1k=; b=XxrtcDrezO+u0pkQA8BPnMou6G
	ML4HNyRc50lw+dpvS5og+4Yt2ZWWBxpd44Zz2l0253ve9m6xUH3tpocDUUbvGHZVM0aZ5JwdhXGKx
	YJ4br5N2lU4zbr6F3bllQR3biqmSaYGsNwxBftB4qrM2JiXE8xtPvf/mZTDInzeDXFYkbtCPqSwDs
	MbDewm6FRpYrL5x/+uKOA8wJigvDvp/9WOHQS1/o9YOppmtOQ32rCj2Tb0R4P/n3syZMmvNMCEln6
	Aa4OERJAyfd/CXfaTJIMp7YkTZIOuxkh6M+QVlydJv+dSYQbvqBPHEEF98+JrH32kRiMqt1HiRqnM
	zUkBP6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIbM-00000007h89-1HEj;
	Wed, 10 Jun 2026 13:04:12 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIbJ-00000007h7W-3xth
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781096647;
	bh=r4dMD/100adzbPgTxMBB6l472MWU6Q0VLNNG94IBX1k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WwLjIBF3WAGB9EPSY9fK0KbP0DJmiznjNWC4PyX5rswzSu4aXDjSvRgRLoHqm2SbO
	 J6hJ5kSFNTQ17zvsM9Po4EqTmStCuPRnbbQbPL3uSkNNJ+i1Je7VOGe8Xm1qHvbeHA
	 1zUST1r9/+/ughClIxibXG5j731EfFCXf6ZkIxNPdWOD2eYiqNtjeBF7FDTMbo56rO
	 9dKH0lWpy1OJZMon8TAkyAeYe7vfYJDiRbVcBFYmuWZItTShfySgM8YGmwlbYeMf4c
	 6ofLl43QtXmKi4cTRuOv9cTyxd57cWzBM0YyiCZD6VwVuln+3VafLFxJjm4TOUkyUf
	 un6ojGE3Gwoog==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7E2DA60921;
	Wed, 10 Jun 2026 21:04:06 +0800 (AWST)
Message-ID: <2d1095b342fe0f4b1b4b99b22bb3af410d9aa60e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/9] ARM: dts: aspeed: anacapa: restructure
 devicetree for development-phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: u8813345@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	colin.huang2@amd.com, Carl Lee <carl.lee@amd.com>, Rex Fu
 <rex.fu.amd@gmail.com>,  Andy Chung <Andy.Chung@amd.com>, Peter Shen
 <peter.shen@amd.com>
Date: Wed, 10 Jun 2026 22:34:05 +0930
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_060410_208284_37611555 
X-CRM114-Status: GOOD (  15.95  )
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

On Tue, 2026-06-02 at 21:24 +0800, Colin Huang via B4 Relay wrote:
> This series refactors the Anacapa BMC devicetree layout to better support
> development-phase hardware revisions (EVT1/EVT2/DVT) while keeping a plat=
form
> entrypoint.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> Changes in v3:
> - Restructure the EVT2 devicetree to inherit from the EVT1 devicetree, ma=
king it incremental rather than standalone.
> - Add the DVT devicetree, inheriting from the EVT2 devicetree.
> - Enable MCTP and FRU support for the NIC.
> - Align PDB fan GPIO numbering.
> - Add an EEPROM device node for the NFC adaptor board.
> - Add an additional EEPROM device node for the SCM.
> - Add shunt resistor values for HSC monitors
> - Link to v2: https://lore.kernel.org/r/20260409-anacapa-devlop-phase-dev=
icetree-v2-0-68f328671653@gmail.com
>=20

So just to check, the changes in patches 5-8 inclusive are applicable
to all of EVT1, EVT2 and DVT (given the way you've structured the
includes)?

> Changes in v2:
> - Fix dtbs_check fail.
> =C2=A0 Validated by following command:
> =C2=A0=C2=A0=C2=A0 make dt_binding_check DT_SCHEMA_FILES=3Darm/aspeed/asp=
eed.yaml
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa.dtb
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa-evt1.dtb
> =C2=A0=C2=A0=C2=A0 make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspee=
d.yaml aspeed/aspeed-bmc-facebook-anacapa-evt2.dtb
> - Link to v1: https://lore.kernel.org/r/20260407-anacapa-devlop-phase-dev=
icetree-v1-0-97b96367cac3@gmail.com
>=20
> ---
> Andy Chung (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: Enable MCTP and=
 FRU for NIC
>=20
> Carl Lee (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: Add eeprom devi=
ce node for NFC adaptor board
>=20
> Colin Huang (5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: aspeed: add Anacapa EVT1=
 EVT2 DVT board
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add EVT1 device=
tree and point wrapper to it
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add EVT2 device=
tree inheriting EVT1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add DVT devicet=
ree inheriting EVT2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: add additional =
EEPROM node for SCM

If you need to respin this series for some reason, can you please
capitalise the first word of the short description (the bit after the
last ':') for the commits above and the one below?

>=20
> Peter Shen (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: evt2: add shunt=
 resistor values for HSC monitors
>=20
> Rex Fu (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: anacapa: Align PDB fan G=
PIO numbering
>=20
> =C2=A0.../devicetree/bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts |=C2=A0 178 +++
> =C2=A0.../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts=C2=A0=C2=A0=C2=A0 |=
 1179 ++++++++++++++++++++
> =C2=A0.../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0 228 ++++
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-anacapa.dts=C2=A0=C2=A0=C2=A0=C2=
=A0 | 1077 +-----------------
> =C2=A05 files changed, 1589 insertions(+), 1076 deletions(-)
> ---
> base-commit: 7ca1caf017d34396397b19fb4de9ecef256f4acc
> change-id: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0
>=20
> Best regards,

Andrew

