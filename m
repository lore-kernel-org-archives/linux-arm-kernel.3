Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B00606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vZN8fSwK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=VEDWLivC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nPtXLhmYKu2MN1HqVNGXKzPAg4qEhpU7r/v/4I5Gcsw=; b=vZN8fSwK1OTEFo6Z48VlXdMjbu
	qT+CmCOGxFEUmH/68LUV5oTE6HOmqGuLatYorl8NXo+Hj/KPzr1BYrvZKWygxLZyW7HjMONtwheGr
	swIoIAi+mt+6xfFeccmjTA2DXRhpWB8srrra3sJ5kE+4fgAxpvPJcdSXcdAJ2HBrRUgBgVDLPandD
	DaUEuR4Wgfmg3qAmcB3Xh+ZyGDsM/PerNSqH0g6MevtMt4evcduZt9/tYCWoG4MQrmQ/x1SJOvXIA
	mKqoQTwZdeD4CDTXCvGYYpwIZFmx8c887SEnqT6ZUE4jq0ld/i3ay+klu3+L+bR68mC1r6Vx/5u1p
	RkgN626Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtNM-000000066AQ-06nB;
	Wed, 28 Oct 2026 02:26:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtNJ-0000000669p-3QMK;
	Wed, 28 Oct 2026 02:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nPtXLhmYKu2MN1HqVNGXKzPAg4qEhpU7r/v/4I5Gcsw=; b=VEDWLivCoqhxBjJLnnm14TEPWp
	COR2QNe350SBN7ngS9ca47m5qquhREyv6mzRKL+WbB4zC67Pm96/qcSlpdnIfWZ4se8X7lrJLdAIp
	JLyOynqzySu/jv5BmF15h8rEn14Yxs2ASxRzT1T0t8F7demXZgLsXVhnrMbQbLpVCinM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xLtMz-00D2sQ-Fk; Wed, 28 Oct 2026 03:26:29 +0100
Date: Wed, 28 Oct 2026 03:26:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, olteanv@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com, daniel@makrotopia.org,
	linux@armlinux.org.uk, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v3 6/7] dt-bindings: net: dsa: mediatek,mt7530: add
 econet,en751221
Message-ID: <f9249c6d-ef72-4723-a3b5-8d5375e53744@lunn.ch>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-7-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028011317.1557238-7-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_192649_860818_72C3F9CB 
X-CRM114-Status: GOOD (  13.61  )
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

On Wed, Oct 28, 2026 at 01:13:16AM +0000, Caleb James DeLisle wrote:
> The EcoNet EN751221 MIPS SoC integrates an MT7530 switch memory-mapped
> in the SoC register space. It is similar to the econet,en7528-switch
> except that ports 0..3 are 10/100 only, port 4 has a gigabit PHY, and
> port 5 has no PHY, but is in some implementations connected to a
> downstream MT7530 multi-chip module via a TRGMII link.
> 
> The downstream MT7530 is similar to the MT7621 multi-chip module and
> has all gigabit ports.
> 
> Add the econet,en751221-switch compatible with the same constraints as
> the other built-in switches and also add the econet,en751221-gswitch
> multi-chip-module switch whose port 6 is configured as a DSA link port.

Is there a use case of the econet,en751221-switch not in pass through
mode? This is where you could have a different dsa_switch_ops
structure, which probably makes the changes less invasive.

Even if there is a use case for not pass through, you can still look
for the property in probe, and decide which of two different
dsa_switch_ops to pass to dsa_register_switch.

	   Andrew

