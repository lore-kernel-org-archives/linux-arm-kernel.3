Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365ABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzanBIl/P1H1nynYPysN7FmIsOykUSWG68SMsrzYXo0=; b=XQuBNheGaqqagoCcLzU5NGVpum
	V+cXEw1IYgrMaaxBOuUE5dCD4Zknim7gdkqwwPZK5O/WR6CwLQSLu9sYve62ht33HEjqNlUWHFN/p
	gXQB26TPm0Z24EqDkrdWT/IMccQVo6IS7ZL0c2/+eKowwf7Crxu+bpB2LxILA/RUBU/UV3jpMArrt
	lLo/UJezY/c3UcfAsnYOd5BVcGQAI9bzbjbVhKZ73V+nSjVU1aMe9FCFVb16kfYq41dm4ucJ0nleu
	fD9AqiSgoLL6emXy096HY35MoJmcktjUOHjPZ58iNlA9Tnf9VP16rEoFK/tLjCwkXHDn1QcnjQwAK
	mb49p5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8HB-0000000FQAZ-19M0;
	Tue, 07 Jul 2026 16:04:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8H6-0000000FQ9q-1uY7;
	Tue, 07 Jul 2026 16:03:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7204060018;
	Tue,  7 Jul 2026 16:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EC71F000E9;
	Tue,  7 Jul 2026 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440235;
	bh=VzanBIl/P1H1nynYPysN7FmIsOykUSWG68SMsrzYXo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFw4YemrE7yinlV44MlFnSxAJEvDkYWSz39aqURr3Pw93VpYqhat+Zr3Fpv/t1XRl
	 Cnki21bX11ijKnpEjr180jxDHaGknJ/t5H2omZrMqA51fBpuI9h44YxYtYTbiGfcYP
	 8r6+QswzKmaJ0KWKltlwKhpAJzsf/5lXVFSPNoQu/MLi8Fxwa4XbQNfz+4lLIu0vng
	 HoilOj7ZAWXnH3xLtbDPE30xpbCXl8/4LmXkEDiyFlK5OzXXDi6RvB+PI8a0vdBckb
	 KBBLdy0Pkj2F8Uzl5aweyNouhoO5IF8rHU0efLtDMSIQu7IkpTZHsW7uYoONDeYC0G
	 y4QAJvEKVFz2A==
Date: Tue, 7 Jul 2026 11:03:54 -0500
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board
 support
Message-ID: <20260707160354.GB3176120-robh@kernel.org>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
 <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>
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

On Thu, Jul 02, 2026 at 09:04:55PM +0200, Heiko Stuebner wrote:
> 
> On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> > This series adds initial device tree support for the Vicharak Axon
> > single-board computer, which is based on the Rockchip RK3588 SoC.
> > 
> > The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> > use cases. It ships with:
> > 
> >   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
> >   - RK806 PMIC providing all SoC power domains
> >   - eMMC 5.1 (on-board) and microSD slot
> >   - Gigabit Ethernet via RGMII (RTL8211F)
> >   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
> >   - PCIe 3.0 x4 and two PCIe 2.0 slots
> >   - SATA 3.0
> >   - USB 2.0 host ports (EHCI/OHCI)
> >   - NXP PCA9554 I/O expander for status LEDs
> >   - Haoyu HYM8563 RTC
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
>       commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
> [2/2] arm64: dts: rockchip: add Vicharak Axon board
>       commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1

Both have issues and should be dropped.

Rob

