Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4854ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh2bs9HviW+76/HO35jHDE4EP8BmeuM9unoIVAmInxM=; b=U1N0FbIDA4nRvOObAYyEUE5juk
	9MXtJ/D+RsQUEqy2QIHPf6tLNV4E+SBv59WpOMcTuQGoYW5mBBlqUvl2182e2kKJMpd+pgs084vP/
	B3YPkO/We0XdpBCoalYiXf4tTAM0y1O/nGE/XjhktXyeTrvZR+qtFr3IJnX87gmOiOQihWUdhl4LD
	vg3il36h3i+qRKnu1PSR8Iip+w82yv6YCVCkb3L/lLRT9FfswiWwqrUAs3uOnUeVXIlOktI5eVAk2
	7ENfyzsj4znFtJRHytjeZFfSpJvP4MqJP3uFDD1BJuFr1/YdwEkeVbTVbZilOfDbf3sXcwmYD82x6
	re1m6jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAiJ-0000000BV5U-1XOD;
	Fri, 12 Sep 2025 20:49:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAiH-0000000BV3v-0ziC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 20:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qh2bs9HviW+76/HO35jHDE4EP8BmeuM9unoIVAmInxM=; b=0V7fcYxNhAsYgqZ32AMyVEdAJK
	zokvOnOBWVhtlmbjFYa3QS7yY+fYxNJxphWJCRAALvOx4OCtNV4NV79pf6Pox6CeCI4SrQaeWLhlx
	5HWODB8mVu27GqbkArpnx/DgySEl4+VvYEL82FwPgozfUEYJYn0mV5SB7rqxJ4LJNR2s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxAi8-008Fuy-LO; Fri, 12 Sep 2025 22:49:36 +0200
Date: Fri, 12 Sep 2025 22:49:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH net-next v5 5/6] arm64: dts: allwinner: t527: avaota-a1:
 enable second Ethernet port
Message-ID: <862f4890-12c2-4643-ba7d-2740adfd4539@lunn.ch>
References: <20250911174032.3147192-1-wens@kernel.org>
 <20250911174032.3147192-6-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911174032.3147192-6-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_134945_273584_16B8C5F8 
X-CRM114-Status: UNSURE (   9.92  )
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

On Fri, Sep 12, 2025 at 01:40:31AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> On the Avaota A1 board, the second Ethernet controller, aka the GMAC200,
> is connected to a second external RTL8211F-CG PHY. The PHY uses an
> external 25MHz crystal, and has the SoC's PJ16 pin connected to its
> reset pin.
> 
> Enable the second Ethernet port. Also fix up the label for the existing
> external PHY connected to the first Ethernet port.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

