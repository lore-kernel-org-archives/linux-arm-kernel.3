Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5527FCD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/K23XI4d03lV4vnZkh8tawAwrfuf0tk1XEGUfCzDW8=; b=1F0q+gSDon3HYQYew0U6hHrpSg
	s+SXM2EBKYSy+VW38gS99F/6cPEgxRrfR/oDqNs7/cHKfWwB2ugMK9NGOLp2sOGB67WGMe3dyf8mi
	YqN/3XuvGaydbbM/XxDpSZOIS1cOlb8AdNcXeCY3A8rIOp59GmrXk9hNwhdEWnJLihTAAKt8bqvqA
	tHlWHAGbmC2/SitAqVfhyjD3z3ijdQfKohCl8TFHok6bi7PxU5QRGyJgnvkndDnBFxaQJjZejmNDc
	TVOT7j5FxVCLSwQdsHBKEjjgn0Oed/gbJz2geey7oYJNv4ebMUYp0ey3xLQLOMxtQIz8zRTrgruBh
	GpQMS1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYuG-0000000Eswk-3bh2;
	Mon, 11 May 2026 22:15:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYuE-0000000Esw5-4BQf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3/K23XI4d03lV4vnZkh8tawAwrfuf0tk1XEGUfCzDW8=; b=3iDx1+cetgyRHHX1j3M5Xl67V2
	D7+f0e+EGFFrRC28M3lwLXGYlsYI5g1ImOsiUkx/mbw9mfAAn8RnnupBcrZO4lwrjtD9HvtxRzrKM
	XzaEtzA6bwXl/YVQlfaziean51GiGjwIUB1GVmfUMQMnHULBbjnMOExVWI9BkD442DCg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wMYu4-002Rhj-KG; Tue, 12 May 2026 00:15:08 +0200
Date: Tue, 12 May 2026 00:15:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Message-ID: <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_151519_037890_D2DF7693 
X-CRM114-Status: GOOD (  10.92  )
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

On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY that
> is connected to the station management entity via the mechanical interface
> defined in 22.6 shall always respond to transactions addressed to PHY
> Address zero <00000>.

Did you read 22.6? I've not seen a mechanical interface as defined in
22.6 for at least 20 years, maybe 30 years.

That cause does not apply in this context.

> -		ethphy: ethernet-phy {
> +		ethphy: ethernet-phy@0 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;

This could very well break this board. Without a reg value, the core
will find the first PHY on the bus, at whatever address it is at. If
you hard code 0, the PHY must be at 0, otherwise it will not be found.

	Andrew

