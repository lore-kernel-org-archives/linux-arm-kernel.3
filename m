Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0374AC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5rlUDCcvbNorSSfBxhY0Uo2Pju4LLTw7V0kTzWGnw0=; b=nQGGcs1N9cMEKas2P9Va3HlSeL
	DI1SDjsyo52G5SIrudJCUwFh/KuOUiibKQ3JkhjbpCKY6vqbfy+zZywAelZT8qVCxLMbudggV1eyN
	2+L8veV5abloo2s2vRe6itIyXqJuvKe/h45DjfH38ZsbqtWk/cZ3YtxS7cNJk+ZJ8vz5w8JaUeWWN
	vsdBwCSJq1kZRSNb6kwN+7/0Ghn9a0PTRi4DGlfx7Uo9nfP873ZZ8RUH5n51ciwve9fZmmF6MBnuj
	3SyLSygMDZiiEn/aiufCWrjLoZlho53hkkyUukcCJMOWWUyAHVLELUV4kFymLWHTggFLvF31wa2y1
	KRdhCTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oLl-0000000ALuC-3rib;
	Tue, 29 Apr 2025 17:02:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oFl-0000000AKhs-2R8C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 16:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=r5rlUDCcvbNorSSfBxhY0Uo2Pju4LLTw7V0kTzWGnw0=; b=Ho9e5JmdTFW+pLmFUi4wNow9wm
	VXlhmjwcdIcVeswarlOATW52sNWISJ24fB8EbnhqWkVPq5rWXCKE4XW6CCvksmzSNXGu6Rjho0bq/
	E09xKIHdsgcp/D40bvZt6p8bdcgD1GU2aPoc/q59R6QMlkz38uxPZV9YB6ACDKlDfR3Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9oFc-00AxlT-0j; Tue, 29 Apr 2025 18:56:08 +0200
Date: Tue, 29 Apr 2025 18:56:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, samuel@sholland.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <b98d6bab-d3bb-44d2-9dbf-623dfb673671@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
 <4645060.LvFx2qVVIh@jernej-laptop>
 <4975791.GXAFRqVoOG@jernej-laptop>
 <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
 <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_095617_627856_44C46BEC 
X-CRM114-Status: GOOD (  23.59  )
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

> > The RX path looks O.K. RGMII-RXID means the PHY should be adding the
> > 2ns delay. The allwinner,rx-delay-ps = <0> should be redundant, that
> > should be the driver default. And there are no properties in the PHY
> > node about RX. All good.
> 
> The default action when the property is missing is to leave the hardware
> settings alone. I admit this doesn't match the bindings.

Please submit a patch fix the binding.

> > TX is the problem. The allwinner,tx-delay-ps = <700> causes the MAC to
> > add 700ps delay, and 'rgmii-rxid' means the PHY should not add any
> > delay. But 700ps is too low. It should be around 2000ps. So something
> > else is adding a delay, or the 700ps is not really 700ps.
> 
> Anything is possible. As was raised in a previous reply, it's possible
> instead of extending the delay range, the decreased the step size and
> added more steps. The problem is we don't really know.

By poking around with other configuration knobs, i hope we can
determine if this 700ps actually is 700ps.

> > You say the PHY is a YT8531C. These PHYs also accept
> > rx-internal-delay-ps and tx-internal-delay-ps properties in their DT
> > node.
> >
> > Try setting 'rgmii-id', allwinner,tx-delay-ps = <0>, and both
> > rx-internal-delay-ps and tx-internal-delay-ps in the PHY node to 1950.
> > If that does not work, try other values in the PHY node.
> 
> I don't get why we should ignore the strappings instead of using them
> as reference or even truth.

If you don't want the PHY to be reprogrammed pass:

* @PHY_INTERFACE_MODE_NA: Not Applicable - don't touch

rather than one of

 * @PHY_INTERFACE_MODE_RGMII: Reduced gigabit media-independent interface
 * @PHY_INTERFACE_MODE_RGMII_ID: RGMII with Internal RX+TX delay
 * @PHY_INTERFACE_MODE_RGMII_RXID: RGMII with Internal RX delay
 * @PHY_INTERFACE_MODE_RGMII_TXID: RGMII with Internal TX delay

However, if we do pass one of these RGMII modes, i expect the PHY to
follow them.

> If the strappings worked correctly w/ the
> generic PHY driver (that doesn't know how to configure the delay mode
> on the PHY side), isn't it working as intended?

The generic PHY driver is there as a fallback, for when the real PHY
driver is missing. It is nice if it works, but it often does not in
current systems.  What we really care about is that the real PHY
driver works, and the system as a whole follows the DT bindings.

	Andrew

