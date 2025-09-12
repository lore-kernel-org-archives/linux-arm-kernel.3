Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B794ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsDgpnLP/BjJT4aNa7Z5gzzlK373l8JvJuqHZ2R3Td8=; b=lBM9M1/dVbB2JdtpICoQS/ZVJU
	Pb8fdrqz6q6HOmQicAbvMJYSqPVVeCV+SRVGYzUCUtp6Q8Y5KmVxjCyuTTUq8o+ep5XACBQRaJlF6
	0BIelbj3rFjdcSXmwLuqrt+CKFCsdZa7+Sg1Mf9APufrjBEwBuDeyuSSR14xnkdtldFd8JH+7/YlN
	5nN1oKoZ9ot0PYdHUTg9mjHsPFDMhvDPLV/VJDDeNTZMN6ga32l9S8p2talThZ5LxoMM8haeoM5yX
	XnH87yMM3ExcVmmgSBTIzCx778G5D0h59ZzkuPOWbfwB9VFuDb61hzVJlNKkzKJVVVu80g5ddlZy4
	Vq0KgdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAid-0000000BVDH-2qIa;
	Fri, 12 Sep 2025 20:50:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAib-0000000BVCY-08vt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 20:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BsDgpnLP/BjJT4aNa7Z5gzzlK373l8JvJuqHZ2R3Td8=; b=N2P6xMfBJFfv8Ho8/m3dH8Oyew
	s2BCcwl5bCaEtdDiXQk+hh60OVzUTHTUVAgLlwB4rgRJYZlFB9izB5r4NSgAf1FgLeT8o4ZUNkZWi
	LruFkR5O0K01neMIAzm9BDFQhRiE0wxCJCTScxXfjhMsf5v+T0+M4KowaGn6eF0dQ+/k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxAiS-008Fvz-MG; Fri, 12 Sep 2025 22:49:56 +0200
Date: Fri, 12 Sep 2025 22:49:56 +0200
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
Subject: Re: [PATCH net-next v5 6/6] arm64: dts: allwinner: t527:
 orangepi-4a: Enable Ethernet port
Message-ID: <98c03746-2b3a-4eec-863f-4024464dd9dd@lunn.ch>
References: <20250911174032.3147192-1-wens@kernel.org>
 <20250911174032.3147192-7-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911174032.3147192-7-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_135005_075465_82619AFD 
X-CRM114-Status: UNSURE (   9.38  )
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

On Fri, Sep 12, 2025 at 01:40:32AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> On the Orangepi 4A board, the second Ethernet controller, aka the GMAC200,
> is connected to an external Motorcomm YT8531 PHY. The PHY uses an external
> 25MHz crystal, has the SoC's PI15 pin connected to its reset pin, and
> the PI16 pin for its interrupt pin.
> 
> Enable it.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

