Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DAFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei9FNw6IjtxDnJGtZ0ljQWti041QWdVAFekLHXRFiv8=; b=FPRTD8AfhtOEvXPlfGJVBJC5G4
	6bckkMObdFm+JskYkGcz/BNC0qN06B0GCTnvIk4giJaPVzMjdVY72/WscV/3yE0tD5tSEUvDKZj0O
	efBHHG5IKLUXYsOcIc7mU/kqWZtNGwuKnHNxPOfXo8b9L/b8hQvZc+Y6eYsgHNfUWLOeAEUBOSedU
	MMAOrwanSKExfWq2Gq9EgS/c/FksXCfUKt3LNnh2p/W69QSI4Ai4amLyaEaByL9p9cZJKm+8J9r8c
	orTiXL3ngNek9CrNoFR628I2pRYfa6sPBej1abJ/wPVL+WFpOC8cDXOcoSyiY3Tw99hFEMhYDM/GU
	P7TfbVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3r-0000000Eb34-0agH;
	Thu, 24 Apr 2025 16:04:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w95-0000000E72c-2sAH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ei9FNw6IjtxDnJGtZ0ljQWti041QWdVAFekLHXRFiv8=; b=pquxH5TcA9L1wdWXApkcJYJYcv
	UuJ3wPBl6Qmnm2H3WE6PKIU8sdYhYUPw9ic8jzEr/CfC4/gHksuQ73zK1kAnNeZiQSY6Ul2QErFw2
	D9Fq3/+6GVrOYvNUnytuZRe1jtUZXE60Apy3/Yd/3HF3SongBjPChdvdNGR9KEAHSfBM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7w8t-00ASoP-Lw; Thu, 24 Apr 2025 14:57:27 +0200
Date: Thu, 24 Apr 2025 14:57:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
 <aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
 <20250424014120.0d66bd85@minigeek.lan>
 <835b58a3-82a0-489e-a80f-dcbdb70f6f8d@lunn.ch>
 <20250424134104.18031a70@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424134104.18031a70@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_055739_720261_62E5EF38 
X-CRM114-Status: GOOD (  14.23  )
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

> > Just to be clear, you tried it with "rgmii-id" and the same <300> and
> > <400> values?
> 
> Yes, sorry, I wasn't clear: I used rgmii-id, then experimented with those
> values.

O.K, great.

I do suspect the delays are not actually in pico seconds. But without
a data sheet, it is hard to know.

       if (!of_property_read_u32(node, "allwinner,rx-delay-ps", &val)) {
                if (val % 100) {
                        dev_err(dev, "rx-delay must be a multiple of 100\n");
                        return -EINVAL;
                }
                val /= 100;
                dev_dbg(dev, "set rx-delay to %x\n", val);
                if (val <= gmac->variant->rx_delay_max) {
                        reg &= ~(gmac->variant->rx_delay_max <<
                                 SYSCON_ERXDC_SHIFT);
                        reg |= (val << SYSCON_ERXDC_SHIFT);

So the code divides by 100 and writes it to a register. But:

static const struct emac_variant emac_variant_h3 = {
        .rx_delay_max = 31,


static const struct emac_variant emac_variant_r40 = {
        .rx_delay_max = 7,
};

With the change from 7 to 31, did the range get extended by a factor
of 4, or did the step go down by a factor of 4, and the / 100 should
be / 25? I suppose the git history might have the answer in the commit
message, but i'm too lazy to go look.

	Andrew



I briefly tried "rgmii", and I couldn't get a lease, so I quite
> confident it's rgmii-id, as you said. The vendor DTs just use "rgmii", but
> they might hack the delay up another way (and I cannot be asked to look at
> that awful code).
> 
> Cheers,
> Andre

