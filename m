Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A31C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 07:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TM1ZXgxDnV1AOy6fTMiX6DNJTsvGab4tXjhYp/X1Q60=; b=wYNojQ+Tkmos+J42tEUVkH597s
	Bal258/ogjRBWBNYemaI2jGXHqmMGJ6ACsPjoyMNdgXr21DQcntbNmninFNkjCFH68QTl4bKGvzgs
	uP1rnfaWxwhrnSnjvaVDWHJ5BmVzKFOuePSvWekof9tCNEOpqNgAy8XauF/DEjUz9VJK/YfyrUuJA
	DLsfIECgz/smG8XSkAexAdhZYU2mZ0VPeGjcpl3d9Kd70s7X6ooEiDwYUCSx1CuNx7jOc1szSoB2D
	Uw4VBnpICdRUs5vfzHgfx8xK4CSXHmPMOWt2VdmVyy0XGOGVSjI38R+2ItP3ucZNeE2d36fDW3KFk
	k7ttPAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoTn-0000000A85m-3RTT;
	Tue, 27 May 2025 07:12:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoRN-0000000A7ZT-2OgB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 07:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TM1ZXgxDnV1AOy6fTMiX6DNJTsvGab4tXjhYp/X1Q60=; b=vZtNggNM5ysO3ta5geJEq9GbkG
	nUv8Y619M35gIcy/eoOftwMaKcbe/fXPe6mPy/LggdXEV46mrqRiGEGN3fHO0hdf7GNdhGAI7P7mv
	eOpzwG8lEsgkEyLFehAQCrJ67L/jhiCJ56CiILCGG0VYv1H/uOAqPw9v5jBMfxt1cNasxsnaXqLev
	MDL8q+jMYR8mOwsrID1rvveW8gQgjVdU1+vdiZJ37fMCfJoCcBhs1AqB2oNx+rZL8PyFLHc2PaRDw
	KtH5eWNsQ8ga2fxU5liydXvM/pF8rD38xJnbYCN1u+LdgCikEcGZMZ8z22bBoOKt2Jt/mTeHg/5jA
	+P0qZMyw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45038)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uJoQv-0007LH-2O;
	Tue, 27 May 2025 08:09:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uJoQr-0001EZ-0x;
	Tue, 27 May 2025 08:09:05 +0100
Date: Tue, 27 May 2025 08:09:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
Message-ID: <aDVlEWZlprYpN3FE@shell.armlinux.org.uk>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526182939.2593553-3-james.hilliard1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_000937_609787_3D3A8F47 
X-CRM114-Status: GOOD (  12.27  )
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

On Mon, May 26, 2025 at 12:29:36PM -0600, James Hilliard wrote:
> The Allwinner H616 EMAC1 can be connected to an on-die AC200 or AC300
> PHY depending upon the silicon variant.
> 
> Add a new allwinner,sun50i-h616-emac1 compatible and example, support
> for the allwinner,sun50i-h616-emac1 will be added later on.
> 
> Add nvmem-cells and nvmem-cell-names properties for the ac300 efuse
> based phy selection.

You also need to mention the non-standard usage of phys and phy-names,
which is the whole reason I suggested you need to patch the binding.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

