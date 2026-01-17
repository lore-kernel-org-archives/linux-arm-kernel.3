Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04FCCA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 22:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgw4BVFnePM/0mIVJpR9dLoyHods82vVO/5jAlQl624=; b=VDWv7LLCsUj7APp6EFy0xr/lck
	hFQyf7r3EHdRj+e0tYAgLbFEyWy64y8A5h3FaSWP3GohLOEIXXZB6ioB6MXzPJQaiTffYN13ojJ/2
	Yx6z2KG+Li6x+J1UgNMu98QIhGD+Mg4GsXc22r3JTCTNO96kr+QRRFYZhoTziqN7r6YtAxxhS0Jou
	JtLSnvorFLk0OLk0gP2R4EArf0AK+0c/UJBlOS0H5UiM+NgR3J52y84v0GYP3hPEov7yjpoWALobf
	tbkW1B1TcXybMhAM8bGlprPtosbIqyeAkKVHrHo7ASEfxFMKmZTROjmzUEPrB4D4Xs6Hf3g+x1Ovu
	8axD+AMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhEdA-0000000G5db-35Ye;
	Sat, 17 Jan 2026 22:18:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhEd8-0000000G5cj-086p;
	Sat, 17 Jan 2026 22:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kgw4BVFnePM/0mIVJpR9dLoyHods82vVO/5jAlQl624=; b=shDWFC/jxIS90nsHE82y9XVXeO
	Dz6fi7Zllpw98ScdUTLxGMycleoz3ab9ehFnuPy2lMM2DtbH3+jut5U6A67wfkXeawZrZ3uRlWTdq
	n3Led52P0xD3yponWtchsV6ctTmjWLnXZRxxVyu0FkL8wVZytTWAb36qI8AuaBDHKb5Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhEcn-003GDV-It; Sat, 17 Jan 2026 23:18:29 +0100
Date: Sat, 17 Jan 2026 23:18:29 +0100
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
Message-ID: <30f44777-776f-49b1-b2f5-e1918e8052fd@lunn.ch>
References: <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
 <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
 <aWfdY53PQPcqTpYv@lore-desk>
 <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
 <aWgaHqXylN2eyS5R@lore-desk>
 <13947d52-b50d-425e-b06d-772242c75153@lunn.ch>
 <aWoAnwF4JhMshN1H@lore-desk>
 <aWvMhXIy5Qpniv39@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWvMhXIy5Qpniv39@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_141850_073890_AF163201 
X-CRM114-Status: GOOD (  14.83  )
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

> Airoha folks reported the NPU hw can't provide the PCIe Vendor/Device ID info
> of the connected WiFi chip.
> I guess we have the following options here:
> - Rely on the firmware-name property as proposed in v1
> - Access the PCIe bus from the NPU driver during probe in order to enumerate
>   the PCIe devices and verify WiFi chip PCIe Vendor/Device ID
> - During mt76 probe trigger the NPU fw reload if required. This approach would
>   require adding a new callback in airoha_npu ops struct (please note I have
>   not tested this approach and I not sure this is really doable).

What i'm wondering about is if the PCIe slots are hard coded in the
firmware.  If somebody builds a board using different slots, they
would then have different firmware? Or if they used the same slots,
but swapped around the Ethernet and the WiFi, would it need different
firmware?

So is the firmware name a property of the board?

If the PCIe slots are actually hard coded in the NPU silicon, cannot
be changed, then we might have a different solution, the firmware name
might be placed into a .dtsi file, or even hard coded in the driver?

> What do you think? Which one do you prefer?

I prefer to try to extract more information for the Airoha folks. What
actually defines the firmware? Does the slots used matter? Does it
matter what device goes in what slots? Is it all hard coded in
silicon? Is there only one true hardware design and if you do anything
else your board design is FUBAR, never to be supported?

     Andrew

