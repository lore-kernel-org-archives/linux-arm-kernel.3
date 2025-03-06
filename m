Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD774C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZAt4QQnkQmkYEwPgW6Malh+ZLqvK8RMjR+3aU1a5G0=; b=WekF0gDwyYNow7mTnGV+rGjCp9
	K2baPg1QGkNNP4dAz8mnthEXUT+SB2kBIH3nR+IFCdmjMnZgsBRcEq8Gw1i89OltOEPgunRtqjAXG
	s3bnLD1iR3dnwHq6qvVocZXng/y73cThbxDMOH+UUUwbXcODVUjgq+3Jl24RG0UlF18nBIJ48W2v7
	429KHOcVBIdNx7M5Pnfzsqgt3SxB2Ssa2iILaGQtaOicwcSdWXq1POswB+R7mALZJQ5J1q4xiK/Zx
	Mk9UR6jtqdju8A415ztO4azi+geRNGVJQBcdgGTlIERR5LaSYTkmpZMlXqlFr2JkSuYoDcoLNaT6S
	K4gNNIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJn8-0000000CNma-4Ba8;
	Thu, 06 Mar 2025 22:34:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJlX-0000000CNbA-0azr;
	Thu, 06 Mar 2025 22:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uZAt4QQnkQmkYEwPgW6Malh+ZLqvK8RMjR+3aU1a5G0=; b=F9fSI0Vf6NAUUXhjds6LGAvzjO
	DyDQAcJ13A+MxduWhG9oAQJCLHWNHGFJfu0xgZUmGLlT0fgV339snNdTINNpZS6NJ1MxgEa8aW6Ld
	W1pfO6EIQBQ+h20ihkw/1PbM0Gbw28tnlcGm10c4WuSuoBemumA7NqLY1Jo1Oo2t7bh4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqJlK-002wFL-K1; Thu, 06 Mar 2025 23:32:18 +0100
Date: Thu, 6 Mar 2025 23:32:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: net: rockchip-dwmac: Require
 rockchip,grf and rockchip,php-grf
Message-ID: <5d69f4a2-511a-4e7e-bafe-5ce6171cb1d5@lunn.ch>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306210950.1686713-2-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_143231_178335_3C1B5B98 
X-CRM114-Status: UNSURE (   8.36  )
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

On Thu, Mar 06, 2025 at 09:09:45PM +0000, Jonas Karlman wrote:
> All Rockchip GMAC variants require writing to GRF to configure e.g.
> interface mode and MAC rx/tx delay.
> 
> Change binding to require rockchip,grf and rockchip,php-grf to reflect
> that GRF (and PHP-GRF for RK3576/RK3588) control part of GMAC.

It is pretty unusual to change the binding such that something
optional becomes mandatory. I would expect a bit more of a comment
explaining why this does not cause backwards compatibility
issues. Have all the .dtsi files always had these properties?

    Andrew

---
pw-bot: cr

