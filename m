Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57F8D39000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG98XXWLm122wWN3H5/0OaDdF3a45orRwXDXa/HYuAA=; b=IfysL0TV4Ypsd4x4Q3Rx5ejCC6
	KWx9PieidK3Ix/lizpY6GwK87g0DZy41rJxX6pKkvlSCyOquMgbHqLLbdJV+8FEzg6jIHfOYgKqxb
	76Dv9BtY0JDNBNz9v78L+p/CqhPcx7YtKozt5qbC2win20DCgrlPyhIjGGTp0VrmbrK/I1CikhoVE
	Sy7I+naKeSE2vxJNz6t5Tkrbu6Kx3XQTnsraI5CSrPbIxY+Jh00yzzPlc01oF7YF8TUpdwHopI4YP
	ov4tXSRJTzlgnwnIufo3tteTOn840Yzv2h2SvPmi+2PmpT1bVbRwZHaymA7u2zLFkp2qez5zN/kyH
	jzVw5YWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4yN-0000000ACZj-25Be;
	Wed, 14 Jan 2026 17:47:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4yL-0000000ACYR-1YNn;
	Wed, 14 Jan 2026 17:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XG98XXWLm122wWN3H5/0OaDdF3a45orRwXDXa/HYuAA=; b=RP/MpWm/ItaE40/w2jeE8X5Mfj
	8D7l4clLFVFkOuKMoIH7cj+YPrydgMJ1eeQvcBL5wzmhpO3j41n1f3/Ftttyp8T54tWXWClcU644Z
	EV3OyyU3H6wYLsEim1iqclB57Y7VjaD9WXT0G7PUz6PZ9fBJpnh9wGCoT5iw1wkOOQC0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vg4yA-002pWl-OJ; Wed, 14 Jan 2026 18:47:46 +0100
Date: Wed, 14 Jan 2026 18:47:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
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
Message-ID: <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
 <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_094757_407074_0C2A0CDA 
X-CRM114-Status: GOOD (  19.57  )
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

On Wed, Jan 14, 2026 at 05:29:28PM +0100, Christian Marangi wrote:
> On Wed, Jan 14, 2026 at 04:56:02PM +0100, Andrew Lunn wrote:
> > > > Yes. What you plug into PCI is not a part of this hardware, so cannot be
> > > > part of the compatible.
> > > > 
> > > 
> > > Thanks for the quick response. Just to make sure Lorenzo doesn't get
> > > confused, I guess a v3 would be sending v1 again (firmware-names
> > > implementation series) with the review tag and we should be done with
> > > this.
> > 
> > Since this is a PCI device, you can ask it what it is, and then load
> > the correct firmware based on the PCI vendor:product. You don't need
> > to describe the hardware in DT because it is enumerable.
> > 
> 
> Hi Andrew,
> 
> I think it's problematic to create a bind between the NPU and
> PCIe.

But the NPU must already be bound to PCIe. How else does it know which
PCIe slot the WiFi card is on, so it can make use of it?

     Andrew

