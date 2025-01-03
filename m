Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69459E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9iUvmwvW4biQrNT/OHy2aFphCCMWpxI2DGmSrhMXP8=; b=t6PZiYK9/fF2FypPGm90vXGiyr
	a7WOgAqeqd0jv5/Vx2I9how/zcXBj7NJZLc248hOAv0IyRiKKurBQwC9EPdZUdo6PcFDmTMFvIYKc
	3O1+kwA3GCbe5bdFGIRz8F13it4nBkORdXrvi6yX12xuNgtTABFmWxhu4w2A7RivVYcobDUYXwmvx
	j7n4+GA8eyzTK6e9N1w2Yt5bqYbFY2fsk4fHMf+HL/DqLLfdrqPeIoHepQJSUHvEVXCyeDnyg0ksv
	ZCK/N/B9YJbiluduqQPjJq5wq3xwiNekofdglrwOnnYB7ZtE2UqxczaP1VVpMN6M6FwPO9Ta5ZgWX
	zXYzaKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfpx-0000000CpfD-42Sn;
	Fri, 03 Jan 2025 11:27:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfkh-0000000Cp3n-0D6S;
	Fri, 03 Jan 2025 11:22:04 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_128_GCM_SHA256:128)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tTfkQ-000000005Zl-06kY;
	Fri, 03 Jan 2025 11:21:46 +0000
Date: Fri, 03 Jan 2025 11:21:41 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
CC: Alexander Couzens <lynxis@fe80.eu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_3/6=5D_net=3A_pcs=3A_mtk-?=
 =?US-ASCII?Q?lynxi=3A_fill_in_PCS_supported=5Finterfaces?=
User-Agent: K-9 Mail for Android
In-Reply-To: <E1tTffV-007RoP-8D@rmk-PC.armlinux.org.uk>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk> <E1tTffV-007RoP-8D@rmk-PC.armlinux.org.uk>
Message-ID: <0FB3C53E-2F15-4ACB-9567-C0400762C4C0@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_032203_096720_73EE4576 
X-CRM114-Status: UNSURE (   6.94  )
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



On 3 January 2025 11:16:41 UTC, "Russell King (Oracle)" <rmk+kernel@armlin=
ux=2Eorg=2Euk> wrote:
>Fill in the new PCS supported_interfaces member with the interfaces
>that the Mediatek LynxI supports=2E
>
>Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux=2Eorg=2Euk>

Acked-by: Daniel Golle <daniel@makrotopia=2Eorg>

>---
> drivers/net/pcs/pcs-mtk-lynxi=2Ec | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/net/pcs/pcs-mtk-lynxi=2Ec b/drivers/net/pcs/pcs-mtk-=
lynxi=2Ec
>index 7de804535229=2E=2Ea6153e9999a7 100644
>--- a/drivers/net/pcs/pcs-mtk-lynxi=2Ec
>+++ b/drivers/net/pcs/pcs-mtk-lynxi=2Ec
>@@ -306,6 +306,10 @@ struct phylink_pcs *mtk_pcs_lynxi_create(struct devi=
ce *dev,
> 	mpcs->pcs=2Epoll =3D true;
> 	mpcs->interface =3D PHY_INTERFACE_MODE_NA;
>=20
>+	__set_bit(PHY_INTERFACE_MODE_SGMII, mpcs->pcs=2Esupported_interfaces);
>+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, mpcs->pcs=2Esupported_interface=
s);
>+	__set_bit(PHY_INTERFACE_MODE_2500BASEX, mpcs->pcs=2Esupported_interface=
s);
>+
> 	return &mpcs->pcs;
> }
> EXPORT_SYMBOL(mtk_pcs_lynxi_create);

