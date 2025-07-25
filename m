Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7007DC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5Lo8sUqoMyzZqpdFGnx3unlYAAJggBjScZeS4UJw3A=; b=ou8+2PKQzpvdYO9IB71qvXJfKW
	cMfExu368tdwitnBcKKwUnleNN7dY/qOzgL4UkYOfzOl1o4WzDuwLgs2yADVE9/W0fzqYQzDyVdAR
	JRVLbzaGCxacYco77NOqF4QpDi/B7W+ZdyQzHDwjEbOihYGbj2Y0dQOL64//EnLZitKRvCrKPFJPT
	6ovYOoGBrLhif5Q6hBorYTvcn8BllVUTiBPP4pSD/rFXqOLlDx1ryYJXxjkM0E5mvtWJ/PUrqW8jC
	P4hpaDplllO1sLpyMYYTFKWgT5pYcNaLO7HiARZPl5RL4Gb1dkEwv3g1uNsJqmDyQXTz4p8HssSCS
	SRbJS3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRbt-0000000Aq4n-0rC5;
	Fri, 25 Jul 2025 23:13:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRUV-0000000ApMl-2zYg;
	Fri, 25 Jul 2025 23:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDB85601DC;
	Fri, 25 Jul 2025 23:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6392AC4CEE7;
	Fri, 25 Jul 2025 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753484773;
	bh=8vnCCU3LPQGo53C05dFuO3MKjV+pOSMNfVK636KtS6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djIISh6YSRnwbypyxmMrAcPIUUF5v68Wdiwz93/UgTP6WNGlSue6F0OcCzQrZG/Zu
	 sxV/iPajbiXLYwfkki0R/DK9I/KVRQXo0WqgVHJjKoLhQxf3hQZxLs715FLHVQBuPm
	 crPoWpACcui6Im2dZ5mc+qrKo1XDtXvUhg9ExD8DgK+RVldhB2w6d4xkZlr3GTEvPz
	 zmeE5b71gF1tNqmZWVZY9GykFDPmPtcjhvZFveml/6vCq7nGZE7EYsShbqNBoEULL4
	 LzAZkEB6gHsWfNWNJRBItw2Oj7UXsWz/+xvKkNl0N387AaMtBHlfN/qcz1nncI8DnS
	 yKgoA+adJ0F+g==
Date: Fri, 25 Jul 2025 18:06:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: linux-usb@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	devicetree@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 06/11] dt-bindings: usb: dwc3: Add compatible for RK3528
Message-ID: <175348477194.2001313.779930445119740224.robh@kernel.org>
References: <20250723122323.2344916-1-jonas@kwiboo.se>
 <20250723122323.2344916-7-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723122323.2344916-7-jonas@kwiboo.se>
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


On Wed, 23 Jul 2025 12:23:04 +0000, Jonas Karlman wrote:
> The USB dwc3 core on Rockchip RK3528 is the same as the one already
> described by the generic snps,dwc3 schema.
> 
> Add the compatible for the Rockchip RK3528 variant.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


