Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6CFCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 02:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpr9xFXmjkNhPC9HzvxzWnPCgQ3zrHpMC0tkqgto9vg=; b=IZXvZh2ASShSqXfztg3ZW07wKk
	2T8KPThU9Y2Q2BTYmSOmPTUdeaZYimj6QWlv/eJVZ3ZkmLuxPiYAaSdfS4jFOOZj/Uw3DgV0zZfhf
	h6gsiqTj9z9wHNmg0GSmTrKdodrOqZG7k9YFUWrYpwDMbuY/pjEFreVfVmV3GId0lJfGgeMFXjDbD
	R63xKvVb9aWfe6rp/hsoosGPrC11cu52hU+IfIoye6amLVQAg4wuer0tdmyPvUqZfk1nugQJVmm9p
	mm60+KeHBXb//2qAaYA6i4+sD3KNM8CNglaxh18nQoPGlrcWlvaCbU/wMoxjzzOymMtV7jkuuZsjF
	GyUECX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS42s-00000003ACT-1rPu;
	Wed, 27 May 2026 02:30:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS42p-00000003ABs-2r47
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 02:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779849053;
	bh=lpr9xFXmjkNhPC9HzvxzWnPCgQ3zrHpMC0tkqgto9vg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iaw4GdLkKPvJimvx0rRGPb1FU4Og6DZcEVWiEFk3C4ea1qo/69d9KV7zgPPlYFrLg
	 3qCpRwECTDFtqxyNvqiY7CeIS52rjWDyz9tJ9seSNbP/wq958BRXok6rUq6uf1s9as
	 L3uoqUFb3GDz3UezCLDC8sZIKkCBAcAoYrHqcfVia4ka+Co4wfiiKsHAEqL8k+H4iF
	 Xp61ckQRtn+Bjw5ncWT5sE1ASUS7X1R+3Uq1dhraKFoSXYQmSbIE+1zy0LgOBRLAG0
	 T0r/q7F647PkQZtfsOFXuq3VexiER0SMscedY8dhYRd0CzAQ/rqbft/4yCNvaa4aPO
	 TIjAj6saULZ5Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 00261607F4;
	Wed, 27 May 2026 10:30:52 +0800 (AWST)
Message-ID: <a0a62d6bcc1d1253a38fa166f4b121caf0463345.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Neil Cheng <neilcheng0417@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, joel@jms.id.au,
 geert+renesas@glider.be, 	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 27 May 2026 12:00:52 +0930
In-Reply-To: <cover.1779157117.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
	 <cover.1779157117.git.neilcheng0417@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_193055_907758_8D64C882 
X-CRM114-Status: UNSURE (   9.44  )
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

On Tue, 2026-05-19 at 10:38 +0800, Neil Cheng wrote:
> Add initial device tree support for the Meta Rainiera6 platform.
>=20
> Changes in v2:
>=20
> - reorder adc0/adc1 properties
> - add Acked-by from Conor Dooley
>=20
> This series adds:
> - Meta Rainiera6 compatible entry
> - Rainiera6 BMC DTS
>=20
> The DTS has been validated with:
> - make dtbs
> - make dt_binding_check
> - make CHECK_DTBS=3Dy
>=20
> Neil Cheng (2):
> =C2=A0 dt-bindings: arm: aspeed: Add Meta Rainiera6 board
> =C2=A0 ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC
>=20
> =C2=A0.../bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../aspeed/aspeed-bmc-facebook-rainiera6.dts=C2=A0 | 1012 +++++++++=
++++++++
> =C2=A03 files changed, 1014 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rai=
niera6.dts

Applied to aspeed/arm/dt in the BMC tree.

Thanks,

Andrew

