Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703D8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+9AKP7zQ1+iMRVWZx18hsEz57eDtfhGlOAA50AWGAU=; b=wkAS/00kSQAcaZk+5KWfVrLAjq
	xzavprvp3CN5Yn+HKUxqtvSyVUva2WF94ITiGcRVOtMMH48r6ioZ1NIgw0UdKQp77ARZt25VGseEp
	d8633Udp2oUXhHcCO69jKJe2UJZ1XOVn11I4Dh8h6x47go/ndxanbKDmoHX2arQfdptGElv38Ma8r
	QPomQBMcwPlR5DDVx+pw/7i02Q8XWkoU33GKV9HiXsMWT2cJ4EFd42E7GSel0gjYmYpMPmoab5A4P
	roDOz0EjCToDvBK25TkTjJa2BxUOFAccm0Ce+/77tuB5NmHxL5ShJkgUVGLeUxXSkq054rfPvbd17
	tzIBUeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gMe-00000005uoN-2qGc;
	Tue, 15 Apr 2025 13:30:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4g5W-00000005rvQ-26AC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=S+9AKP7zQ1+iMRVWZx18hsEz57eDtfhGlOAA50AWGAU=; b=SyhUf/n/OF9SyPoLA1ckdHwam6
	5WaQP2y7KmbnQjEBT4QA5bWMeKLM0hBfi+nzMnWSov05efBfqdCcy/VRO6BApbaoyKMQMrYHrMukf
	u2rgHQFqsw7Z4wPUihGUMayHx1i3aLoJpiB/JQqoLl+5qtmG8EmXQOUJ4v2Gs1SJgLaA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4g5B-009RlD-7A; Tue, 15 Apr 2025 15:12:09 +0200
Date: Tue, 15 Apr 2025 15:12:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
Message-ID: <a0904f35-8f26-4278-9090-9bbeef905ef7@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <20250415131548.0ae3b66f@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415131548.0ae3b66f@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_061230_539997_BD76A0FF 
X-CRM114-Status: GOOD (  10.80  )
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

> My Perl-fu isn't good enough for me to review this properly... I think
> though that Andrew mentioned something along the lines of 'Comment
> should include PCB somewhere', but I don't know if this is easily
> doable with checkpatch though.

Maybe make it into a patchset, and change a few DTS files to match the
condition. e.g.

arm/boot/dts/nxp/ls/ls1021a-tsn.dts:/* RGMII delays added via PCB traces */
arm/boot/dts/nxp/ls/ls1021a-tsn.dts-&enet2 {
arm/boot/dts/nxp/ls/ls1021a-tsn.dts-    phy-mode = "rgmii";
arm/boot/dts/nxp/ls/ls1021a-tsn.dts-    status = "okay";

This example is not great, but...
arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi-                         phy-mode = "rgmii";
arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi:                         /* 2ns RX delay is implemented on PCB */
arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi-                         tx-internal-delay-ps = <2000>;
arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi-                         rx-internal-delay-ps = <0>;

There is one more i know of somewhere which i cannot find at the
moment which uses rgmii-rxid or rgmii-txid, an has a comment about
delay.

	Andrew

