Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB53C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 18:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1frkWFr2J40XR/9vE9VGNeGQ92bKeQnuoGbwfEnbrA=; b=xkjUQhco9Y7cAWvBTqipkoXVEm
	n95L7wwqQuYisWCab//NIoVlw7sMw4EaiFH5eq/Ly7mMwOEqFz8dKgHz5ULKkE0XL9W26HW0P1TWP
	+98iG0j8/9WlkztdKKv4sCTFj8Z5AxgCH1eSLGCizDMpOrI+t+XcgXwv0R9p+OnT58deqj55VJmQf
	lllQPM+43NnIYhBLil4cgJErBpoRRMDsEHnnfF0jY0VQZ/929SD9PtA0efdb8B+Q1EU7t4TfsB+m7
	5K4zOtiHqOOMqaug1oOZES1HZRQukLNmzDUdrlQuOTP/F3d8eNbGtGKa97JDKk6MJRjxK0707R4TP
	B9UAF2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCqq-00000006DoP-0pwN;
	Tue, 08 Jul 2025 18:15:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBvX-000000065Sv-3YBp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09FC161441;
	Tue,  8 Jul 2025 17:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FB9C4CEED;
	Tue,  8 Jul 2025 17:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994978;
	bh=9BnTd3kqHiI+RLRuW2SIH7nDiSe8klvUWwh1RoroQaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOBPe097FZ5t6a0C9qYnF21fHnNu5epcIpuRDUjCKell5EMf45OF6TYRCrf/PtuGo
	 7bbp7XyPxJwGxS/N4dlApJAbEoqBYTXs8IShXKgysMPjJkBVWlhGfhOb6W3olv0p4H
	 5hGVRwyRdnlcsxBYNWh+76bNB+/R+HDW15Ss03oAzfrhlwUA0d+RvRRBHuQEinpAqW
	 RXiUVbFFnw80AtaEQrb4uP/ezbEvygBln7JecSNcjr9zLOz/GD5AsWOt9gPFz9kUgI
	 HBZBtxxE3+ZsI9wCDqZ9410ou+7CJY9C8p18JAXYkrkAhx5NsfzoH7AZkOo4RZ+MJg
	 waCzbupzZPt6Q==
Date: Tue, 8 Jul 2025 12:16:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Yong Deng <yong.deng@magewell.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 2/9] dt-bindings: media: sun6i-a31-isp: Add optional
 interconnect properties
Message-ID: <175199497651.649032.8001124742935274339.robh@kernel.org>
References: <20250704154628.3468793-1-paulk@sys-base.io>
 <20250704154628.3468793-3-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704154628.3468793-3-paulk@sys-base.io>
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


On Fri, 04 Jul 2025 17:46:19 +0200, Paul Kocialkowski wrote:
> An interconnect can be attached to the sun6i-a31-csi device, which is
> useful to attach the dma memory offset. Add related properties.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


