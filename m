Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94403CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpPOpgYOuMni0Gc6Ie2yYsK6sobe7hS6YKBMvD+JxTc=; b=erqXCbRlmThvPBJtm267MlaXEb
	3GISv9qK7SD6a0jjjpBip/h22Cccwz8Ta6auyzI7h5f2grPo/DwGyaj9ajim0DE808vpVzcW9d8Ld
	c/KztDP4FgEzRldHBq9bjD10fBD3XO33BRRf1wxNulFB+zvE+kpy7SnlWtR8dqJUKL0yd9Gtf4cnF
	m56m1/0JErA542xwbaM3RnqSum+N1A7sSKpOm4Yv/IMu/URrJNieYAb9QJJQbF2aWcuiRx73g/tXO
	+MwvdrRUJyBuY5Q79BAy/atBq8hW4kAoxXmr/ZmtcC8cLobrDcoFXXvMDsysk70wJl//U5duvrFw0
	M9+Huqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHsx-0000000HHnt-3id6;
	Thu, 15 Oct 2026 09:36:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHsx-0000000HHnf-1OBM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:36:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B7D242DA3;
	Thu, 15 Oct 2026 09:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF481F000C5;
	Thu, 15 Oct 2026 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056987;
	bh=JpPOpgYOuMni0Gc6Ie2yYsK6sobe7hS6YKBMvD+JxTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VgioQlErxcQgeRGnfPHcuqWr3lnI0paTj8c3C/F2GmTbhB3XBgPlc2Z/sTGHLxKme
	 EpaRiAwTDBXFlcoqvChYUQzcuVUHnaAKEuJgHBrEY2Y+xucyHQgaZwgSjtjW7yN23D
	 2VjTg5+sJJ2YSo1Qjyx4bf2y/Xn++xgeYkqTgwdOo18R86zc7A7C4HwbN4bva0otja
	 evpsTeGzLA5c2eUgpfcBvrvl9Onsr9q576XOWVJenbzEQR7bCHlh14MOlqYoCIByGN
	 P0l/YjpeW2ip4watTTmyue4U8aJoGXX1rwa1N/5uXoQTVpfaFiGdQBh2lcb4bxoFYp
	 Du1s4gplgAoCQ==
Date: Thu, 15 Oct 2026 11:36:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash
 controller binding
Message-ID: <20261015-fluorescent-sympathetic-coati-c64a01@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-20-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-20-ghahramani.navid@gmail.com>
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

On Wed, Oct 14, 2026 at 08:20:59AM +0100, Navid Ghahremani wrote:
> Add Device Tree binding for the ZTE ZX family SPI flash controller,
> supporting both ZX29 and ZX279128S SoCs.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---

half of your patches carry redundant binding, half not...

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof


