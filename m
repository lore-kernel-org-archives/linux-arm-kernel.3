Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CA9E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXrxemTVaqUjgMVsYG39XHX92KiKfDfge1KnIOy6Lp0=; b=IVpBBPnBfEgmgox0jKY4sqAegc
	GId8WKbReHCtv5jrhSqZe0MCV26ERRTZn3oNfaZZeqzZOco27ANBxZhWEN08DIJyGQM8yAvpIPHaZ
	BLrxJKGz19iudFLeiRusryDUJ8EILNhrMmVzvQb/u2TT57bj2ijBpiJC2KnrO8waTEl8GvqEG/PDb
	7dHzZOG7Dnbs0f6h0KskpjR8RdkggXgbCVv4kEYBxbAXCKAT2lp/nK6IjfzlE0J085tfdd7FWFopK
	MmxCcNxP52yjf9MpsQ4rQY3PPXtvUgS0oeb0j10/Hdw5t/HFU6SkPfegdqmhkRYH3Li2xPFirJLcW
	Ovxe/5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCR-00000005hxO-3E9A;
	Fri, 20 Dec 2024 17:54:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgj5-00000005cq0-3pHZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IXrxemTVaqUjgMVsYG39XHX92KiKfDfge1KnIOy6Lp0=; b=WCYD3YzEOme2+6CQaXwzfrsCTq
	di+xwAqH1nAdbCdo89GUac0ngarb0K2jnYqcSx0JQjPIzxgJxhLDtbV9nGca9vUzj85NK6wM2Nilg
	OOhmV28llWu/OFv9teDBD10neohtmNuyT56qbxoTfTRTHxBIJAClHiQNWXJYWORt2y/E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOgil-0023oA-K6; Fri, 20 Dec 2024 18:23:27 +0100
Date: Fri, 20 Dec 2024 18:23:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Russell King <linux@armlinux.org.uk>, jacob.e.keller@intel.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	robert.marko@sartura.hr
Subject: Re: [PATCH net-next v5 9/9] dt-bindings: net: sparx5: document RGMII
 delays
Message-ID: <cb42f0d7-d2fd-460b-9f38-3b9ebfec7607@lunn.ch>
References: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
 <20241220-sparx5-lan969x-switch-driver-4-v5-9-fa8ba5dff732@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-sparx5-lan969x-switch-driver-4-v5-9-fa8ba5dff732@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_092347_952460_2DC944BD 
X-CRM114-Status: UNSURE (   8.03  )
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

On Fri, Dec 20, 2024 at 02:48:48PM +0100, Daniel Machon wrote:
> The lan969x switch device supports two RGMII port interfaces that can be
> configured for MAC level rx and tx delays. Document two new properties
> {rx,tx}-internal-delay-ps in the bindings, used to select these delays.
> 
> Tested-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

