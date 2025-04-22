Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2A9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29nqVClkVJOEOI67Hmj+Amifgccth5t3PZQd0ZpbUiQ=; b=RYs/sjErrtj5jsKEBSXbaBCPro
	24l3nIsUTyeL0RxYnP3uDrO3XoaX4+0dbbyGMXPOzble5vt0HHGSAzXp0NSBN0QjZXdP1uwZMTm+O
	ditanRmbPAVoHxi6lfcf0y27hYmvHzCVhqryur7XAPN0Wmw/j1eCDY8mYva2Flz42YwL+/By4lw1I
	90l6AmvM85zHVBx9hW2OZAvCUW5chy2AuOs7G8y5RcOAr6eYkbPiYIbo3nb/89bTUqcy7iI94lgXi
	Z8ijaOVCLkLxv2yELVIdo+EgIEqb+UelrYl5WFAdT01CzkHQhfc+66jbMk81HDXtEyHIBhHFOnhdk
	J11Q09vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Gai-00000007w59-3j9y;
	Tue, 22 Apr 2025 16:35:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7F7I-00000007bmx-46rk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=29nqVClkVJOEOI67Hmj+Amifgccth5t3PZQd0ZpbUiQ=; b=rQ2mMiaztt3yrB/gN6a1Hhlc14
	wKRbAfHk6NMJaaWizl24Qp43YxbsrgFfQPwFKEcAeO8ODDl+erqZ/nRkLahizuGzkkOxtoeiS0n/Z
	6qtxNMMBzzTNUnzdqsqmzLhYFAtf4e731yy4HOunBwY0h0kyFPAMyFz+5dBSaChxqwSA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7F6z-00ADQa-PK; Tue, 22 Apr 2025 17:00:37 +0200
Date: Tue, 22 Apr 2025 17:00:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <a53b5f22-d603-4b7d-9765-a1fc8571614d@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <aAaafd8LZ3Ks-AoT@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAaafd8LZ3Ks-AoT@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_080057_022535_0D744151 
X-CRM114-Status: GOOD (  29.81  )
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

On Mon, Apr 21, 2025 at 08:20:29PM +0100, Russell King (Oracle) wrote:
> On Tue, Apr 15, 2025 at 12:18:01PM +0200, Matthias Schiffer wrote:
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > index 45819b2358002..2ddc1ce2439a6 100644
> > --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > @@ -74,19 +74,21 @@ properties:
> >        - rev-rmii
> >        - moca
> >  
> > -      # RX and TX delays are added by the MAC when required
> > +      # RX and TX delays are part of the board design (through PCB traces). MAC
> > +      # and PHY must not add delays.
> >        - rgmii
> >  
> > -      # RGMII with internal RX and TX delays provided by the PHY,
> > -      # the MAC should not add the RX or TX delays in this case
> > +      # RGMII with internal RX and TX delays provided by the MAC or PHY. No
> > +      # delays are included in the board design; this is the most common case
> > +      # in modern designs.
> >        - rgmii-id
> >  
> > -      # RGMII with internal RX delay provided by the PHY, the MAC
> > -      # should not add an RX delay in this case
> > +      # RGMII with internal RX delay provided by the MAC or PHY. TX delay is
> > +      # part of the board design.
> >        - rgmii-rxid
> >  
> > -      # RGMII with internal TX delay provided by the PHY, the MAC
> > -      # should not add an TX delay in this case
> > +      # RGMII with internal TX delay provided by the MAC or PHY. RX delay is
> > +      # part of the board design.
> >        - rgmii-txid
> >        - rtbi
> >        - smii
> 
> Sorry, but I don't think this wording improves the situation - in fact,
> I think it makes the whole thing way more confusing.
> 
> Scenario 1: I'm a network device driver author. I read the above, Okay,
> I have a RGMII interface, but I need delays to be added. I'll detect
> when RGMII-ID is used, and cause the MAC driver to add the delays, but
> still pass PHY_INTERFACE_MODE_RGMII_ID to phylib.
> 
> Scenario 2: I'm writing a DT file for a board. Hmm, so if I specify
> rgmii because the delays are implemented in the traces, but I need to
> fine-tune them. However, the documentation says that delays must not
> be added by the MAC or the PHY so how do I adjust them. I know, I'll
> use rgmii-id because that allows delays!
> 
> I suspect neither of these two are really want you mean, but given
> this wording, that's exactly where it leads - which is more
> confusion and less proper understanding.

These DT documents are supposed to be normative and OS agnostic. I
wounder what the DT Maintainers will say if we add an Informative
section afterwards giving a detailed description of how Linux actually
implements these normative statements? It will need to open with a
clear statement that it is describing Linux behaviour, and other OSes
can implement the normative part in other ways and still be compliant,
but that Linux has seen a lot of broken implementations and so wants
to add Informative information to guide Linux developers.

   Andrew

