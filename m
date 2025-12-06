Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A354AD3B7D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmiMhIObz4qJTw0WyrJ74DiYS/rNajQtsF986FAkJkI=; b=CxwR3P33u6yS2z0Uqv/+W36qJr
	nbLdokZXS+Ky56RUeZIH305O/TmZOHrIkMhT0juzNav1eH88riJGrMc2e5XC0QCgKvjEfGN41EBjQ
	zm/BPkU0rV2ID0bzOH7VqzrlfzO+wrHTjmyp3iEWSj3ABk0mRjz0MIuRXN/ZO0Z5lZsncJB367GSC
	ZAV1d1EwNh38d4z10Leo4dHobfWAHWf8yUGqsYDXQmSgKgdUCwqK1+GwWjkyiZRP/Dl5cxdha8NXb
	D17UgqnciMDPyUra6OJZsNPlHnd3yLsX62NZmUtnQyclD6WAhl0CjTTYLjBgdLW4s+KLHmEbviu9t
	yFdN2B5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRwgK-0000000B79A-0vJA;
	Sat, 06 Dec 2025 18:06:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRwgH-0000000B78k-0v8Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 18:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wmiMhIObz4qJTw0WyrJ74DiYS/rNajQtsF986FAkJkI=; b=f3LYA1VMSH+smHurSsL7bf7sMK
	zvG+4WsnFEyOgwW10QDnzWvixTBySawa7YqJ6gbYiHV8dR4/9H7Fw/OWLSAyov9ine9BDiVCM/zLX
	dH4pwe/PdWi511d4SWaB5IrGENmV4Xf1JpjuW+4FaKVbHmlXAded1JYT76HvutchG4og=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vRwg5-00GDoz-HU; Sat, 06 Dec 2025 19:06:41 +0100
Date: Sat, 6 Dec 2025 19:06:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com, mturquette@baylibre.com,
	sboyd@kernel.org, richardcochran@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, luka.perkov@sartura.hr,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
Message-ID: <d98b3069-861c-456d-8637-67e36dc107bb@lunn.ch>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
 <a8185e0f-a3a2-44df-af37-1ad505ce9a7b@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8185e0f-a3a2-44df-af37-1ad505ce9a7b@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_100653_260855_01484EC0 
X-CRM114-Status: UNSURE (   8.34  )
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

On Sat, Dec 06, 2025 at 03:53:42PM +0200, Claudiu Beznea wrote:
> > +		port29: port@29 {
> > +			reg = <29>;
> > +			microchip,bandwidth = <1000>;
> > +			phys = <&serdes 11>;
> > +			phy-handle = <&phy3>;
> > +			phy-mode = "rgmii";
> 
> >From chekpatch:
> 
> WARNING: phy-mode "rgmii" without comment -- delays on the PCB should be
> described, otherwise use "rgmii-id"
> #779: FILE: arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts:750:
> +                       phy-mode = "rgmii";
> 
> > +			rx-internal-delay-ps = <1000>;
> > +			tx-internal-delay-ps = <1000>;
> > +		};

I did a very quick scan of the patch and missed that. It is great that
checkpatch is now commenting about "rgmii".

1ns is very odd. You need a total of 2ns, so where is the rest coming
from? This definitely needs a comment explaining what is going on.

Also, RGMII typically does not need a SERDES, unless there is
something like an SGMII to RGMII converter being used. So is the phys
property needed?

	Andrew

