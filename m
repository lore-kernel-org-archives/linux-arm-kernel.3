Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2BEC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1v6cngyF8++0dRtG6rbIiu5VrvO65eoMW3ZM+XoUJc=; b=qYx1iXshR3BAJd4wNIadCibIwh
	EnWBi2j+0F1KVf7m2VGHulBGJV0SAbhJS3JCFqFjvRZtMUbmCZr91jWOJb3jAXqqtW/M82Z4d1QOq
	hwQ090m6ZGsqZIRqor77G7JqHwAX4B3e7r0C2c7Tv+9Ayi5HJrSTasQV/VLtKfisNaa8jhjV34f2o
	Hx0KY/+qd2IXmoV0XTkPSPNdaHapRFHmlTVZjMIKrBM9+V1pVenq4SVQRp8ysMiBv+lnatGmZMFTf
	twbgvZXiAHf5DysBH5pa78Wc7Xc4A9B1XLCNecrm3Oxpv4kc5xpRJaeiRCptvKA4sqzmK4aR3JVR9
	xcTjuyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEly-0000000GBmw-1VKF;
	Thu, 05 Jun 2025 17:53:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEh6-0000000GBGG-2CFZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 17:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DAD8A508CC;
	Thu,  5 Jun 2025 17:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023D2C4CEE7;
	Thu,  5 Jun 2025 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749145679;
	bh=Vc58Oa/CYTfhNPPdVaJtGNwwC3wsXvAVKJEocn2OeU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cdNLQVGQii5rss8ytGr4U6veG6kEPy+GHpnQHAB7z/DI+p9QuSvLtpVzSAUVu5haw
	 aO/DVtIq+UjRJU7RJXJ5E5UyAitURhzC2VKvDoaoiGx3QlocsaJffM9F43lAwG+jP/
	 2hcw+MJUl8xDH1sCc3UVW2Gqoos0yRBs6SSOCaaDJlqRcpwcpvGXejbsavWp0Z4SD7
	 rKOJJ/ZBGe4O7erznqTs9pDGmS2Rug2p8ZbAWRzHtw0rv4U1y+xHZYG1LKcSjE54gZ
	 d2NpZilgXhW8p4neumVVmTyZCoUDGLXILQc8JphXzVdIb/K51AMsGWwc3BwsoggrCQ
	 JbS6x+eZajHBA==
Date: Thu, 5 Jun 2025 12:47:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com,
	sunyeal.hong@samsung.com, sboyd@kernel.org, s.nawrocki@samsung.com,
	mturquette@baylibre.com, alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org, shin.son@samsung.com,
	karthik.sun@samsung.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, chandan.vn@samsung.com,
	richardcochran@gmail.com, linux-clk@vger.kernel.org,
	dev.tailor@samsung.com, conor+dt@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: exynosautov920: sort clock
 definitions
Message-ID: <174914567467.2924605.14306583560925504695.robh@kernel.org>
References: <20250529112640.1646740-1-raghav.s@samsung.com>
 <CGME20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb@epcas5p2.samsung.com>
 <20250529112640.1646740-2-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529112640.1646740-2-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_104800_639406_35EB7AFF 
X-CRM114-Status: UNSURE (   8.28  )
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


On Thu, 29 May 2025 16:56:37 +0530, Raghav Sharma wrote:
> Sort all the clock compatible strings in alphabetical order
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../bindings/clock/samsung,exynosautov920-clock.yaml      | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


