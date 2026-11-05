Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9D606A621
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GWuAKgUf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DRzi4VEy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GfbFkrlXGTj8hINUijGxcgmVVtZ3dmfEWvTEJmaVTgU=; b=GWuAKgUfdaSJL/qL243S+xe90r
	ApsGeHV76Ujak6S5O12jONgKZc4/bHYnaNdjbbJzdPH6Kbb+5q6Ary9s2mSOUeab7OO3sCeCZNIcV
	UMACokRnYrbQ3X05UPF9asIUwExZE1oLBeln0mswDg23puxsbUkwuMklP3IhDpSzSCtCNxhAyQArX
	XkEBseGQk3KHWKearHcbmClRyZQizqk+AKYQB1XPU3sKP4PIkUb0+TRx8QBWlRg8JZ22F3+ZG3f72
	9GqeWisyMO/IR58V04fAijJ2sQ6J4GwFRG9Ap9CL2Goo8nVp0xpxmq0hU6gIfC0YUf/54uoM/FMWX
	TutiBTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzst-00000009Wx6-1BLr;
	Thu, 05 Nov 2026 16:00:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzrF-00000009VTP-3Gzo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GfbFkrlXGTj8hINUijGxcgmVVtZ3dmfEWvTEJmaVTgU=; b=DRzi4VEyFWHD2rFzpj6PhsP3kN
	F39iwasjm7/8Ev+0a46CatRL0nzjNA0i4Q/FX+iV8pcMaHXoAGnwk81GdGZCth5ndauFChEK3PP8D
	raYGuwthMY9TYT5rL30Bcn9SJ6LBRUDjIv2InceHI9uxm3ZPO9K24pQpfMKXtkaLHjw8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xOzqx-00EbKh-DA; Thu, 05 Nov 2026 16:58:15 +0100
Date: Thu, 5 Nov 2026 16:58:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890
 GMAC
Message-ID: <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev>
 <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_075833_935541_F629DD20 
X-CRM114-Status: GOOD (  18.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 05:16:14PM -0500, Joseph Telaak wrote:
> > Please add minimum, and multipleOf.
> >
> > I've not looked at the code yet, but default: 0 would also be good.
> 
> Will do: minimum 0, multipleOf 55 and default 0.
> 
> > These values are odd. The RGMII standard says 2ns is required. Where
> > is the rest coming from.
> 
> They are the values the vendor bootloader programs, and I checked them
> against the hardware. Sweeping each delay over its 256 steps at
> 1000 Mb/s, TX works from 0 to about 2.8 ns and RX from 0 to about
> 1.5 ns; 935 and 550 ps sit inside both windows, and a 2 ns RX delay in
> the MAC fails.
> 
> The rest of the skew is not programmed anywhere: the switch's PCDU
> register for this port reads back 0, and with the MAC's delays at 0 as
> well the link still passes traffic. So it comes from the board routing
> or the chips themselves, which I can't separate from software.

Do you have access to another board which has a PHY connected, not a
switch?

There are unexplained delays here. Is it the switch, this MAC, or the
PCB?

We need to understand if tx-internal-delay 0 really means 0, or it
actually means 1065ps.

Just because it works does not mean it is correct. We could be in a
two wrongs makes a right situation, and as soon is it is a different
device on the other end, it all falls apart.

       Andrew

