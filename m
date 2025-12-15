Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82452D5B871
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI1MY4kOzgLcU2iIDea7bQ2I0yRp8F1R+dwEE1LToL8=; b=dFlpuS6piT6m+HP+I6PeEDGrBW
	NmuoPD8QTtAen+HTEujEXMPc6jAyi5pdTw4Jjsy3Vnv8lc9VmhvMY32TjGDFX5jI/odZgrAyQj+aX
	3uEpZsRMeZA/P2Pw8ZlaCxx1Nsf1ex4UWyDyl175kOMnZ86sdsNeilxu1cl3hvXJpvdBxTLjuIHCm
	6aXgoKTx3fcaKdjkoBMKdoHGffN6OImQvZIuRhih+RyG7O3KA0BPQpNdIBk0PxnQS/HkP4zr1R7kb
	kyrapE9Brv69n2mOWfjFE9kI3KYpuUmyNMNKt1SCdys4y0viR7lT2iNWaTyUgzvPyKwDxuxurPIpd
	erpVHzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGQE-00000004KVK-1vI6;
	Mon, 15 Dec 2025 21:48:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGQC-00000004KUr-19VH;
	Mon, 15 Dec 2025 21:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OI1MY4kOzgLcU2iIDea7bQ2I0yRp8F1R+dwEE1LToL8=; b=qtsMobJ81loav8R/ZLTl3g8U1R
	L2p+F7xhPDfocdnt+ksIho08Wf/uA8kiKZoc9oe+GmwipM8X4W/cOGhVhXb/TxLCdS44J3cbq3HdL
	wU9DU4mrnDwLovhiHhVDAlziOkk30fvlqhYskGn2HIwN5ExSSokSJRP959789FdLPOf5MInF5i6JA
	fbIlsb6GrPBhrRg0a+9V3ZMz1ut2RGdejRQR89FtifAaFIMNRahTtxwRJRA1gii+Bb+Z+aW+5V6Kw
	DiRYPdNFKgnsMT+CcXTTfeZcDxTX3GMWr0x6C9zKuYQujZ+jAK+i5wS4Y/H1WOhhD4AEyturWb5eC
	oBnGTi2Q==;
Received: from i53875adc.versanet.de ([83.135.90.220] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vVGQ8-0006sg-2B; Mon, 15 Dec 2025 22:47:56 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Martin =?UTF-8?B?SG9sb3Zza8O9IChQcm9iYWJseSBOb3RoaW5nIHMuci5vLiAp?=
 <mh@probably.group>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable dual 2.5GbE on Rock 5T
Date: Mon, 15 Dec 2025 22:47:55 +0100
Message-ID: <2080394.PIDvDuAF1L@diego>
In-Reply-To: <176580661874.1441131.12947657582985645446.b4-ty@sntech.de>
References: <96516D1F-9787-47FE-A67E-4745D11D9207@probably.group>
 <176580661874.1441131.12947657582985645446.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_134800_339635_5211B939 
X-CRM114-Status: GOOD (  15.32  )
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

Am Montag, 15. Dezember 2025, 14:51:03 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Heiko Stuebner:
>=20
> On Fri, 12 Dec 2025 17:23:35 +0100, "Martin Holovsk=C3=BD (Probably Nothi=
ng s.r.o. )" wrote:
> > The Radxa Rock 5T board features two RTL8125B 2.5GbE Ethernet controlle=
rs
> > connected via PCIe lanes pcie2x1l0 (fe170000) and pcie2x1l2 (fe190000).
> > Currently only one interface is functional because the PCIe controller
> > nodes lack the necessary reset GPIO configuration.
> >=20
> > Without the reset-gpios property, the RTL8125B PHYs remain in reset sta=
te
> > and are not enumerated by the PCIe bus. This results in only one Ethern=
et
> > interface being detected, or none at all depending on U-Boot initializa=
tion.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] arm64: dts: rockchip: enable dual 2.5GbE on Rock 5T
>       commit: 96029ffeccf677b1e4baa98f30909a83a485b6d7
>=20
> I've resorted both the pcie phandles as well as the pinctrl entries
> pcie2-0 comes before pcie2-1 etc :-) .

and dropped again.

Please resend this patch with a proper Signed-off-by line, as stated
by the developers certificate of origin.

Also, what is this probably nothing s.r.o?

Heiko



