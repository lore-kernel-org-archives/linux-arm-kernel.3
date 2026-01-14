Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBC4D39011
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 20:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8z6/tHemAyDUZ6LGRZmbfUFeZIhjen3VER7FZfVnFpc=; b=RIumXmTYSHkAWyKrkiISNQWCyG
	ePWtrY5Pb/Ejqav/Ee7L5BzD0hp1qjRdFMi7MyhmHnd05eF+xmVma+fKiUg8PEZjtFuoyNk2HTmI0
	C/fzHbXHHoyr5+smIBV0h/gNgBDulolDIZ6ssDUxDt6MiJSHeRbANT3YmZO1Rc2u+D1B61gq3pqUC
	6OhkUuotTIVTs7qBYVEgznKayybso/fyUSiLF/9rnhOUcjlflMBrYHzQ9r/ZpjHvf6Bt5ZuMCvVP1
	UcrcEtwse/429c4Lg5+sgxcMI2tscgdtcb463VOd3dBfBb20HS5iKCKghLUysgmymZJTpMktHjP/L
	5PU2PbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7HB-0000000AayM-2fy3;
	Wed, 14 Jan 2026 20:15:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7H8-0000000AaxK-3g2g;
	Wed, 14 Jan 2026 20:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8z6/tHemAyDUZ6LGRZmbfUFeZIhjen3VER7FZfVnFpc=; b=aS5xEqGjmG+E5F66GzJ46hO7mw
	2ylPpsavqTgjSwkIvXwhPTiUslTgntwK1WteYq+FYOiQRP6H1bPUP5CpiD6kAqp8XJ3+hF0Sn6Wgv
	MPfTze7+rthU2+SJp6XqyYXaxHtm/tWu6H9b2M5Iv6Bkl6274+KYDpIG7GD3XCOBOmGA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vg7Gx-002qQc-3R; Wed, 14 Jan 2026 21:15:19 +0100
Date: Wed, 14 Jan 2026 21:15:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
Message-ID: <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
References: <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
 <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
 <aWfdY53PQPcqTpYv@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWfdY53PQPcqTpYv@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_121530_919517_36857434 
X-CRM114-Status: UNSURE (   8.28  )
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

> In the current codebase the NPU driver does not need to access the WiFi PCIe
> slot (or any other external device) since the offloading (wired and wireless)
> is fully managed by the NPU chip (hw + firmware binaries).

Are you saying the NPU itself enumerates the PCI busses and finds the
WiFi device?  If it can do that, why not ask it which PCI device it is
using?

Or this the PCI slot to use somehow embedded within the firmware?

Or is it simply hard coded in the NPU silicon which slot to use?

   Andrew

