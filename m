Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F8FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCnoup2TZQt4fJk0GJnAkPItdzQ9WDG1PH2VUvHNiJs=; b=0BNIWXBHw4cutl3x2ZXhQPheK2
	K04FHdjCNrUcXZH/FZBSn0O0RRy81khkrcqPQeiY46OfHJhh3U+0uptcmKlVZulbGyySUIyj0cFAV
	D9fzU5W8p015g/Un4Us7b1ZCFYBzKWtVE69wjp8aUhzJjz3alXw1YI0Ry1Un6zg/gDE83cxhbnUtz
	UZzZ00t1/WJVoHGrutZZ1prwNDeXFR8hXp9oei4Jo4jDoN0f+gTXllO7NR7v4/xqtNLLEAhXK3Gmi
	gUGeWv47kOOtr18ALa2NvtcPMWhXhjB/NcXauNFh/jbCQLj0Q5X8CNiblaXD4Z1VMVJcyzOWM2H9W
	1+I+DGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7qg-00000005LJV-04g5;
	Tue, 08 Jul 2025 12:55:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7kZ-00000005KTl-42a4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:48:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44EF2A53CE6;
	Tue,  8 Jul 2025 12:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE67AC4CEED;
	Tue,  8 Jul 2025 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978922;
	bh=g28q4NZzgjbR8MHAVRF184NIvjRYYLJKJLr/vf5Xqa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvfZfLAN6D+0IltIX1CfxRC4LV3nqjMMYob8x+k/tq5lZH2vSghsXQkcSbA6EkQ9s
	 s53PpjKI1lcBbHdI2NcG7YgWNJD/umeQ7hSWowRigX5AajnQC6NZjd9SQJ85h8FmSo
	 wobXcIJYzu0qP0EQhLQ8udcdZ/mYPIfpbFoHyvSqPtGkaOA2HwGwFKncmjgrsafVHG
	 mqInBklOngKJlfwPJWyWKU7XKPTRszd4I+D9E00vA3NnpyjzWjFWxkEYd7yJWJNFJO
	 F+2MumPHbe9KOXGyWz3qSk6k3QXW78S74nC4IwI+IJFiwEFM/w6t5DGsrBXr42/RLm
	 4I+YmUWHiFGTg==
Date: Tue, 8 Jul 2025 07:48:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, Jernej Skrabec <jernej@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net 1/2] dt-bindings: net: sun8i-emac: Rename A523 EMAC0
 to GMAC0
Message-ID: <175197892100.398224.11294321138188145975.robh@kernel.org>
References: <20250628054438.2864220-1-wens@kernel.org>
 <20250628054438.2864220-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628054438.2864220-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_054844_067657_13E9D319 
X-CRM114-Status: GOOD (  12.38  )
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


On Sat, 28 Jun 2025 13:44:37 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The datasheets refer to the first Ethernet controller as GMAC0, not
> EMAC0.
> 
> Rename the compatible string to align with the datasheets. A fix for
> the device trees will be sent separately.
> 
> Fixes: 0454b9057e98 ("dt-bindings: net: sun8i-emac: Add A523 EMAC0 compatible")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


