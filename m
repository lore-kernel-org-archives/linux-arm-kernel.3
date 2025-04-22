Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11FEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S54P5rf09JI3kvunV4HEvrJrmrs+ZWs16gH9mbduXto=; b=P9ldbMt3KVXGSGiRPioxmdQpyb
	8a9b/gUMgVi6IxkJvOyGg3++jV1lrsp7f7YeHs/mMc3gIktuw/1SosB57seRaNVwk00oceTiXrgXr
	KdepZdF0dvk7cD6wgQHB7lG4Xi7EjisuErO7KNboDVk0EPv+xpDr1kuEeFGGhUVSy8Ad8zBYuP22D
	PUUiEhRkWtFZEU6YIyfiBMcsedg8jfz08l3uQr5ulNMhjT3nbWpyR/Vez+ggs9B32rCsLq8RmbqfA
	WiJkRs4vXuA4GKOlX+MSmZAw4a1DbomiMSzS9sTTU/Y5g3cZ5K38HwAs3sa/HnkNmvrBs7E3EXcqh
	JXh4/Ifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AEI-00000006c9D-0g83;
	Tue, 22 Apr 2025 09:47:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Cm-00000006OaB-2CfO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 08:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=S54P5rf09JI3kvunV4HEvrJrmrs+ZWs16gH9mbduXto=; b=MKCXMfzH5/Iq20PeHCu1q+fLGQ
	E3ZTIpycY8Peg6Cv7jO9zhCBhcuMU+3eN+XiG7pjds3rK60JIJpTSHV7GPaoKEBTLfV9dpo56uOwh
	JhNP1rB9H9t6SSJO8E2x2YA4AFF60hv5sDuCaF/vcaj5AAkO/R7KO/CRYHud9uVx8lpHXA/WNprsF
	zGBWKvUYUQDh/5jiQ9NUYBX7Vpw87j5tY/Uw4m4Ut85cWQi8iKsQ41fPhEHoZj3n7keFB8MsvLU+J
	qSRMTBjGxw2AYGd9zBbkt7zcAd5N5es6siJZeoG2Dwz5m44WLyJbdQR7DjkKi3KhMr92gGWgiL7su
	ECx4hAWw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u79Cj-0000000BAP0-201N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S54P5rf09JI3kvunV4HEvrJrmrs+ZWs16gH9mbduXto=; b=yPUsWyuCuwXN3/Bg2nhooh3nNK
	Svw04aOt11SnDpbJXWhhJW/TiAybsS/AlgHxMw+TE0x+HMZMr+ZWktRKxjylbtGDmPrxXt6v0lZWo
	NNVnPkT8gm8MgrNEMjtiCMUS8+j3KzG2KaJuz9fs+IfqrPVP2A5+mFTw0i8Vz67D3fEetPgcAetU2
	LAszEtD+NQW9nJfm4+pNzL6h+T/5D4hJL+GFjqNy87bp2rIUtbYjhZ8VEsinU8d2JFlFd8mnLqyyK
	qX0nyycdC4zfwLtYU/k+15PyPQfe30gxP8yyjtciZ3/44LNGRqNr4MpZZTZCPot7BttLS8VRxhAno
	dpNBcDfA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48000)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u79CX-00043D-1U;
	Tue, 22 Apr 2025 09:41:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u79CV-0007LW-0t;
	Tue, 22 Apr 2025 09:41:55 +0100
Date: Tue, 22 Apr 2025 09:41:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
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
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <aAdWU4xPc2UOU5wu@shell.armlinux.org.uk>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
 <cd483b43465d6e50b75f0b11d0fae57251cdc3db.camel@ew.tq-group.com>
 <5d74d4b2-f442-4cb8-910e-cb1cc7eb2b3d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d74d4b2-f442-4cb8-910e-cb1cc7eb2b3d@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_094209_660639_A52E1F20 
X-CRM114-Status: UNSURE (   9.74  )
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

On Tue, Apr 15, 2025 at 05:25:23PM +0530, Siddharth Vadapalli wrote:
> For a fixed PHY,

No such thing in reality. The kernel has an obsolete idea of a fixed PHY
which is a software-emulated PHY to represent a fixed link, but that is
basically dead with phylink (there is now no PHY for fixed links under
phylink).

As I stated, "phy-mode" describes how the MAC needs to configure its
PHY facing interface, whether there is or is not a PHY present. One can
argue that it's misnamed, but it's buried in deep DT history going back
decades, and there's a rule that we don't break backwards compatibility.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

