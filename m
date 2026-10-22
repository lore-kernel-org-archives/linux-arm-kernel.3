Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE460A6F50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O66GWcIX;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0pqLAYXn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DQi+ERJyD3sfh40jg8gA/Z3Y+m7AgqIVEp/8MzWx99M=; b=O66GWcIXFZHv12TcE1wIq2r/QB
	gt/qNwxMNJzbFWwkkoUSVxu8Sujx0Ud7hPfq2Z8Af7JoPe3VyccOCFK6NM5PWWZ4239X+rpDymiwL
	hX1WQ+ylYyEijt8uHjauVK5zPwgkGwayfJkcsvfsoRevq3Sh9isXUatV9u2foU6U6LotwdBBq2Tc5
	3/kRpi2amtfQk2NRM7d9XFtao7YJYSFOXvhNXthAP9P0GjO65CmbYSnrRIooQHZqa2gbv2PxhUVRc
	j0w89lARDym2MnjxsaMFo5tGeNfftmikwBtU1HMEj/eFI/m9fCe8Lf3wtQIuDo5jNiCK+cFFvIt+0
	lgG1VufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxaU-0000000EinX-0te2;
	Thu, 22 Oct 2026 18:32:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxaR-0000000Eiln-3ruT;
	Thu, 22 Oct 2026 18:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DQi+ERJyD3sfh40jg8gA/Z3Y+m7AgqIVEp/8MzWx99M=; b=0pqLAYXnkRPf5E9yN6b/T630PE
	IsTiYko2hx2nYIdLW4S4dY00KtvqwrvYtgQeidcq/xpbIkoLn357EMe5adW/J7N2QACE1XubeY1sm
	wNWP4pfgM6661puT2UTBcPqBOw5Hzo3YeBTpPjCKQQF2DnBKX8pl7s5C3kG1N8uW5AGc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xJxaI-00CJMm-GV; Thu, 22 Oct 2026 20:32:14 +0200
Date: Thu, 22 Oct 2026 20:32:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: David Heidelberg <david@ixit.cz>
Cc: Coia Prant <coiaprant@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
Message-ID: <5db14c14-2386-41cf-8b66-ba248d49fd20@lunn.ch>
References: <20261022025844.150320-1-coiaprant@gmail.com>
 <20261022025844.150320-4-coiaprant@gmail.com>
 <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
 <fbd174d9-261d-4fed-b26e-2990de7af2d0@ixit.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbd174d9-261d-4fed-b26e-2990de7af2d0@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113223_961293_7BF79196 
X-CRM114-Status: GOOD (  14.91  )
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

On Thu, Oct 22, 2026 at 07:13:06PM +0200, David Heidelberg wrote:
> On 22/10/2026 18:58, Andrew Lunn wrote:
> > > +	sgmii_phy: ethernet-phy@3 {
> > > +		compatible = "ethernet-phy-ieee802.3-c22";
> > > +		reg = <0x3>;
> > > +		max-speed = <1000>;
> > 
> > Pointless. SGMII cannot do faster, so there is no need to limit it.
> 
> device-tree is a description. whatever the device can do should be there,
> 
> "Maximum PHY supported speed in Mbits / seconds." thus 1000 is correct value.
> 
> thus max-speed <1000>; LGTM

I did not say it was wrong. I said it was pointless. The PHY will
report what it can support, which will be speeds up to 1G for an SGMII
PHY. The max-speed property will then be applied, and does nothing,
making it pointless.

max-speed is interesting when you have an odd design, like only 2 of
the 4 pairs are actually connect to the RJ-45 socket, limiting the
media to 100Mbps. Using max-speed in this situation will remove the 1G
speeds from the supported list, and so it will not try to negotiate
such a link, which will probably be successful, but then data transfer
will fail. If the PHY supports downshift, it will then drop to
100Mbps, but it can be confusing because everything says it should be
doing 1G, but in practice it does 100MBs, or nothing.

      Andrew

