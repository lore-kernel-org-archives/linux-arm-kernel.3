Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DBBC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWuVVEEzCO6CTK/zeEtGw6vKXtOS128jKZE/G/8MKJ0=; b=K29/nCGWynSZxio1Or+UAVq5lu
	0t3uqQDxwPhU7qZVqZ8oKdCajUlWIbahkFg8VgGkyPbCOl/PIb0yYhN1XVcu5I0z71c6ivHkU+5jP
	Xq+5Qw0Xq5msUdP5QwQ3lb+6l8x5oOxojSegH8Lffcbd4nFlx6BSCdiG5CmDC2SMnIxW/0qVNFVif
	CPyiyVxOi27gXsMjwdjlk+mVXQ+9V7zVUhOBjYj/xYXXC5R0n7vkk8AIwfUa3o+KTs08Cp+P7eI4M
	bYAE+u9Ar3VjX8+jhMwewSOhKW+khCJPSfvZHxxmLqUB4bG11QpsYD0DyGm6JT8lXsPMoW1g3RXE9
	9j/Evs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pwn-00000006hWM-3Tpz;
	Mon, 28 Apr 2025 14:59:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pjl-00000006fp5-0gjK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XWuVVEEzCO6CTK/zeEtGw6vKXtOS128jKZE/G/8MKJ0=; b=HxF2K4TuhzmH1NjzQixF1OySKO
	6MKUqFdnxdCWEKsJdo/LQnQxKBW241ZeAuPOLZ57ZLBLUd/Be4x7yxuNKTOpt3Kjrah/W39Ja9icC
	q6pyoJ12YKinvnVisGPYKJqe1oQDgDObnQz2WSjrqlXLFcpLszegSM8gg16lbr9btloM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9PjR-00AqaV-0z; Mon, 28 Apr 2025 16:45:17 +0200
Date: Mon, 28 Apr 2025 16:45:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
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
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <e5f75ff1-a4ed-40f7-9919-aecd2f9a0ae8@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <aAaafd8LZ3Ks-AoT@shell.armlinux.org.uk>
 <a53b5f22-d603-4b7d-9765-a1fc8571614d@lunn.ch>
 <aAe2NFFrcXDice2Z@shell.armlinux.org.uk>
 <fdc02e46e4906ba92b562f8d2516901adc85659b.camel@ew.tq-group.com>
 <9b9fc5d0-e973-4f4f-8dd5-d3896bf29093@lunn.ch>
 <8b166e41-8d21-4519-bd59-01b5ae877655@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b166e41-8d21-4519-bd59-01b5ae877655@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_074537_206247_D350D16B 
X-CRM114-Status: UNSURE (   8.72  )
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

> A complete description might be something like:
> 
> mac {
> 	pcb-traces {
> 		mac-to-phy-trace-delay = <X>; // Nanoseconds
> 		phy-to-mac-trace-delay = <Y>; // Nanoseconds
> 	};

> In some designs, the "mac-to-phy-trace" and the "phy-to-mac-trace" are
> treated as a part of the MAC block for example.

PCB traces cannot be part of the MAC block, since they are copper on
the PCB. In fact, such a consideration just adds to the confusion,
because how do you know which designs do and which don't include the
MAC block?

	Andrew


