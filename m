Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E4EE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30x72Lym8zuhQtPKTodnKBOIEUAKdFm4/6H/cCa+dEk=; b=FJgd+Z4A5uydfPbuTDfiTwrxKx
	l3NSEsfH0gSQv5HkjJ0Ji1bxiHNGjSiGZP7+oyEBF2wvmmIFrf5zIZXZMU3lSI7WAi/OqxK8j8144
	DiWAajfyhPJbP9eo2j6MrM+v2DQ+Maj7X0+pia1o+UX2qKP2JVwmrZKZddqSYZCb87X+CfDqSzQpy
	kixOANcu3OU+PJPo409HJ5GRBcViAIGCK/9sb7fPUVbeDIE8WcaQ7ic8+wggHVqmhMr4c5iF8YcFq
	piL9U5xbVi6IoqlxXx03+QYUwFBlX3XY/8PvWlmJZpbi6GAjAML69l9o8Lh8AZ7E43/qK8Ome7kVb
	mvhqUFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiey-0000000D719-1fM8;
	Fri, 03 Jan 2025 14:28:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTidF-0000000D6fy-3ScS;
	Fri, 03 Jan 2025 14:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=30x72Lym8zuhQtPKTodnKBOIEUAKdFm4/6H/cCa+dEk=; b=0h2nufZOd+AZ7pLIqEufrR8TND
	Sl42gtR7yretBB8M42k/IFkk/brnNm86uvif8cEMCrejaS6ke+OmZqPSK8q3nC+h1keEws4y1EEOv
	FlkPXaknzsZOPv41IxtbXzBJ2clINNDtrd/Xr10L6Yl7wYUH3N7cSMbihWlcy337GbQnYBgLm4cA1
	FlPSPWzh/nSyzHV3QLpDjm6H4u2rKvBJYSdbU0C12MUFm/ZYd+fBTCNEaCZ/30LApvLA/yLtK7FQK
	eGNrtoizleojWsPzUBza9HPTKWjM19UgK5/eovsOqJ0XDd8P+zwIeIorjzwMoP+1enyHsxqG/1rk2
	ZCtAvwBg==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tTid1-00078E-Fx; Fri, 03 Jan 2025 15:26:19 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Niklas Cassel <cassel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588: add msi-parent for pcie3x4_ep
Date: Fri, 03 Jan 2025 15:26:18 +0100
Message-ID: <13674524.dW097sEU6C@diego>
In-Reply-To: <Z2Uk2A7-YwkSfAOh@ryzen>
References: <20241120171048.2839621-2-cassel@kernel.org>
 <173318214613.1403925.10026428339576666444.b4-ty@sntech.de>
 <Z2Uk2A7-YwkSfAOh@ryzen>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_062633_887410_8996AE6B 
X-CRM114-Status: GOOD (  17.46  )
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

Hey Niklas,

Am Freitag, 20. Dezember 2024, 09:03:36 CET schrieb Niklas Cassel:
> On Tue, Dec 03, 2024 at 12:29:16AM +0100, Heiko Stuebner wrote:
> > 
> > On Wed, 20 Nov 2024 18:10:49 +0100, Niklas Cassel wrote:
> > > Add msi-parent for the pcie3x4_ep PCI endpoint node.
> > > 
> > > The pcie3x4_ep node should use the same msi-parent as the pcie3x4 node
> > > (which represents the PCIe controller running in Root Complex mode).
> > > 
> > > The GIC ITS can be used to trigger an IRQ on the endpoint when any of
> > > the endpoint's PCI BARs are written to by the host[1].
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] arm64: dts: rockchip: rk3588: add msi-parent for pcie3x4_ep
> >       commit: b6f09f497b07008aa65c31341138cecafa78222c
> > 

> Could you please drop this patch from your v6.14-armsoc/dts64 branch?

happy new year :-) .

I've now dropped the patch from my queue


Heiko



