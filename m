Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8736CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HetChZ7XkNQMqx2+PivIhHctcbtcwL1Ak2RaCxoVdfY=; b=FcXk6OIdVWDhH4eUnM1iEnKP1E
	8XqkGgKDXG2tMFFIUfWwds5gNSB0kt2+yTAcIBqj3vvp/e7cjBZhrzgnEI7sIp9oKy755nt4s8L/O
	nlrZtv9/0+Z/znuTjED1/QjIDhzgOmi3chFQnzYy2f3lZHMlywcLo70+mk/ML2AGVLuqFteT/okAW
	MrhftXpPIFbMy/SzyZZbaukYFNnKyZ/a/9R1DgN71bqlAiVXyYCnlUCKc2YkOR1INMuDok/44IGwJ
	su6J5n8240rX9Lq/+wq3/bAw9WRFap9VQ/dU0aWOhhh8POlWdqJo8RmuXv6taIHOlQG4fDcVR4cdT
	3CwF4JRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7xl-0000000GxrH-0Bpo;
	Mon, 17 Nov 2025 22:44:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7xj-0000000Gxr6-27kX;
	Mon, 17 Nov 2025 22:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B0B7602DA;
	Mon, 17 Nov 2025 22:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22B9C2BCB3;
	Mon, 17 Nov 2025 22:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763419482;
	bh=I7cN+d0gaur0/SJt3Mr4dNjz/xC/5q6cHHf71yMS3IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAks66OLL7THCQWMljIpJ+a8VX38FA23KlL+cfdSyzabVhsI+3vp5RGUFjfOF0nBk
	 YLnNYI7s7vyaUCf5kgNfTFQsrtkZf2DRDZ8XP6IlI49Frr8NrHC5KRvzq1/HtWpIup
	 r8nYk4blLfA0k6qoNUMuVcINaEbjEqpLlvL5zLe0yuzj3+sS+KxFgyrXKLvy819mXW
	 RSni2jQHoQloiCYAJzCLxBRO+8GIbVE4wgkHwEuqOYvDCGroeQyajIVZeE3oG3U0MZ
	 WEV+h9PA3eqTcgVnXoYkJKqoYyWaxfXI51T/ewJ5dLcf7eBP3p0QLDQN4m3uxJSNjk
	 0kbAGs6rrALdA==
Date: Mon, 17 Nov 2025 16:44:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: document control-scb and
 sysreg-scb on pic64gx
Message-ID: <176341947920.855000.13401863198434967357.robh@kernel.org>
References: <20251117-aeration-smock-5e7ac06e2942@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-aeration-smock-5e7ac06e2942@spud>
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


On Mon, 17 Nov 2025 16:29:29 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On pic64gx these syscons are identical to those on mpfs, and should use
> a fallback. Add support for multiple fallback compatibles to syscon.yaml
> with these as the first two users.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Awful diff, sorry!
> 
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> CC: Lee Jones <lee@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-mediatek@lists.infradead.org
> 
> ---
>  .../devicetree/bindings/mfd/syscon.yaml       | 219 +++++++++---------
>  1 file changed, 114 insertions(+), 105 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


