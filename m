Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A7CD29C2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0rl3SMhzSTIAUIp4+rR+1cMtdJOvQXiZGRrtdfINPM=; b=EezVBtCLqyItpzMMvq/AFRyCD5
	gArfSmqkq+PWt7KbXEF1HWwodAutlr2eb4PmJLowpnTfAtGOUskBSzZ1qaDyuJ74sBeTZ8h/Mw7Yp
	jkIxINRZP9wz6tELzy5jMY1n1bUZ5PgC1OnOdVFc9GW/SqziEd7wLufIzYMxUtfk9V/+HLZicP/Ve
	Z5LnTWXwzfo/pGTvt75VBTBPD8Un1Ro0f5WIdb4OYf1GSlS8ODeLms/dO070KCj8C/VcNMEDA021h
	oTUFcJL0McYHHCgKSicyURBEqwJJK4p+nAtZu/r7ySOIp5fQUttqNNCwgTbpA7CG8bvzNTu2NTjsE
	zijKSvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhps9-00000002DZV-3ubh;
	Mon, 19 Jan 2026 14:04:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhps8-00000002DYd-1dFd;
	Mon, 19 Jan 2026 14:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=T0rl3SMhzSTIAUIp4+rR+1cMtdJOvQXiZGRrtdfINPM=; b=Y9I5nMCnbG8ouhn6DeqAN+7SUT
	Ekkdoaqk+ZJbli/QK35eSVEF8Dssh8nvRD7e4yWodA2vxW8vmlRYZQI3ckcZNG2XiBBY860rTWJFe
	tuXBJh6sWjFmoVMXS/cC3Tt7TQrER1bb5X3TNETy0e7Ru4lWKiY6eQudT6yW7TKCDTd4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhprn-003VE9-KF; Mon, 19 Jan 2026 15:04:27 +0100
Date: Mon, 19 Jan 2026 15:04:27 +0100
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
Message-ID: <cd1fd7b4-64a1-4b73-86aa-d3621ed814b4@lunn.ch>
References: <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
 <aWfdY53PQPcqTpYv@lore-desk>
 <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
 <aWgaHqXylN2eyS5R@lore-desk>
 <13947d52-b50d-425e-b06d-772242c75153@lunn.ch>
 <aWoAnwF4JhMshN1H@lore-desk>
 <aWvMhXIy5Qpniv39@lore-desk>
 <30f44777-776f-49b1-b2f5-e1918e8052fd@lunn.ch>
 <aW4QixwAJHaHWBBc@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW4QixwAJHaHWBBc@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_060448_424831_23CD07C5 
X-CRM114-Status: UNSURE (   9.54  )
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

> > So is the firmware name a property of the board?
> 
> We need to run different binaries on the NPU based on the MT76 WiFi chip
> available on the board since the MT76 DMA rings layout changes between MT76 SoC
> revisions (e.g. Egle MT7996 vs Kite MT7992). In this sense, I agree, the
> firmware name is a board property.

O.K, lets go with v1 then. List the firmware filename in the board
.dts file.

     Andrew

