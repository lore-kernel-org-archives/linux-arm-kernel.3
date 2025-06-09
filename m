Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39262C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOHakUk5xT1fcNi+NPqv3HQ+xAZj2Oji/+RFN8IiveA=; b=DSGf77saQ22sS8t54uNtHM+U3X
	Pz6t5b2yMKSTOt837QkfPJJrdWwqhKwklhNZ3m4DHLH57QHXPCFlOSA+MzHsv8emY72O6spDWsSgJ
	HUpYxbfT3KszwhbzV2GXH1Z395TxzRUVpOeJ0pplPfVY0B6kksfVvzC6XdxXmJKjCskhB1c2IJaK7
	be4Uo6o7H8d7JqC095yTPQ5MKCs8IBJ8aos2r+dpTAe3uVrP6te3pCxJ4zBW4jewHdGooEvniBUYP
	yJk6R0HylEmmkGqzTV6yKDLcgrYbo+cy5MVM2tVsLgpIjE7IZNzk79ZTCtNtpjZfBkteVgmDKvphZ
	C7a4+xeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYJW-00000003iIK-31wO;
	Mon, 09 Jun 2025 08:57:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYDb-00000003haC-0hFw;
	Mon, 09 Jun 2025 08:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FOHakUk5xT1fcNi+NPqv3HQ+xAZj2Oji/+RFN8IiveA=; b=1R6ba9wkp1ZO9GSRWkwczG90ui
	Uifd7T3spP4VYBkQjasbFUAKxrlDFyusDdhK2NPoVCW0proWCH2OYPyuUu4gv4UTbwY0iVbtDdzuu
	tMS15zAP236F4PI8tZoP56ZLHKX6S2dcsLrHtVTNgs4fwmVg9TAvq/Ves07/fwp2Dd8mG6QNfhy3q
	KIVKTs+fh4/qAdV3DZsn6cPHwyq6v2F5lNpj7jdJqxDuuTlIJs4EzVH7U8Vsx+vZklAwigAffvq1o
	t8HAaZ+BT76JWnkFFEQJIKDhGsOhtAIVhzyeWlc2rhEB9Y0RJRpOlIjOz5CMhBC4EZwQ02NIor6bD
	GDd/kYnw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOYDP-0005cP-0b; Mon, 09 Jun 2025 10:50:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Quality Improvements for Rockchip-IP PCIe
Date: Mon, 09 Jun 2025 10:50:45 +0200
Message-ID: <2266650.atdPhlSkOF@phil>
In-Reply-To: <aEQbx0Qu-2UKhV1y@geday>
References: <aEQbx0Qu-2UKhV1y@geday>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_015059_219626_7792B9A3 
X-CRM114-Status: GOOD (  12.46  )
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

Hi Geraldo,

Am Samstag, 7. Juni 2025, 13:00:23 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Geraldo Nascimento:
> During a 30-day debugging-run fighting quirky PCIe devices on RK3399
> some quality improvements began to take form and this is my attempt
> at upstreaming it. It will ensure maximum chance of retraining to Gen2
> 5.0GT/s, on all four lanes and plus if anybody is debugging the PHY
> they'll now get real values from TEST_I[3:0] for every TEST_ADDR[4:0]
> without risk of locking up kernel like with present broken async
> strobe TEST_WRITE.

could you check your settings for sending patches please?

The individual patches of this series did not get "in-reply-to" headers
that would point to this cover-letter. Instead each mail of this
series stands on its own, preventing mail clients from creating a
threaded display of the series.

git-send-email normally does create these needed headers on its own,
so could you check if you have some option enabled that prevents this?

Thanks a lot
Heiko


>=20
> Geraldo Nascimento (4):
>   PCI: pcie-rockchip: add bits for Target Link Speed in LCS_2
>   PCI: rockchip-host: Set Target Link Speed before retraining
>   phy: rockchip-pcie: enable all four lanes
>   phy: rockchip-pcie: adjust read mask and write strobe disable
>=20
>  drivers/pci/controller/pcie-rockchip-host.c |  4 ++++
>  drivers/pci/controller/pcie-rockchip.h      |  3 +++
>  drivers/phy/rockchip/phy-rockchip-pcie.c    | 16 +++++++++-------
>  3 files changed, 16 insertions(+), 7 deletions(-)
>=20
>=20





