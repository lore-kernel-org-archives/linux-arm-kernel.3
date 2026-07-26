Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FF0C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czLPdPzPEzGnxXOs9XFKlCHUMcOVjehz+yDqbFnpv+I=; b=hKydWVMm7ZmnFWIpLRP5u8sYba
	NFDmcss+0nLvMlRlMUY9jNjkS5Z1+fzNWHLup7Xx/GKLYjJYt7qL3X0Vtk12+w9BxARO1FbgUqFEP
	ddQrYxUGWqTHrpXtIthFhIIm8t1lO0wcO5kHB9LH6aM5H+0wPlt3ynF04t3coUsga9DaDHKU1YvHK
	OdOlaJzolxQFZ/6RxjMA4o7R2UVaznJvInJF2/VUhv2t9TU08iTTX9VaN+NhhEoWsgTvlvIAMb5u5
	PX2Nd7IRDS7g1OKHSlQSZCj9rfdrEaUDBAYgYrZ8WZVT6BKpeeovq1RnpCUoxT3s5AGSU6F326yPf
	sNLmbBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0PO-00000001HT7-2XDr;
	Sun, 26 Jul 2026 15:04:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0PN-00000001HT1-1fSh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:04:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0A2A60008;
	Sun, 26 Jul 2026 15:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF901F000E9;
	Sun, 26 Jul 2026 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078292;
	bh=czLPdPzPEzGnxXOs9XFKlCHUMcOVjehz+yDqbFnpv+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TvFpVa4dtTLHvYfummoGuesnzNWH8hYrYfNL8htixBDEZs3aJUd5JJ4bq7qSs5L6Y
	 fkrZbHRSwz34OOxPBeaP7LJwbQZgBAeIVTSCnUWXZusU/jfasRdQoYTerwHwIcobpA
	 6a6CjN+zbZUAIbaGpBtiRcO3wA4hC0L281E5+/Qu5jzBr1RGEq+ugZgDRqxNgwU/xx
	 SvQom09I3hti+NH3cs7Qw5TDRoTCHzN0+cm9t7SkXtaK2lqyy92ObnGGMLItqKfM4t
	 goSwp79B/u/zx3kIRzls+H6Ed2bdbdNccJGxxaO+sDE+jaI66gimL8JRB+suow6z6n
	 /qHzLjZHt5h/A==
Date: Sun, 26 Jul 2026 17:04:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: i2c: apple,i2c: Add t6030 and t6031
 compatibles
Message-ID: <amYh9XtzAbTtdWZq@zenone.zhora.eu>
References: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
 <20260724-apple-t603x-initial-devices-v3-6-bbeba0420603@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-apple-t603x-initial-devices-v3-6-bbeba0420603@jannau.net>
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

Hi Janne,

On Fri, Jul 24, 2026 at 08:16:46PM +0200, Janne Grunau wrote:
> The i2c block on Apple silicon M3 Pro, Max and Ultra SoCs are compatible
> with the t8103 (M1) one. Add "apple,t6030-i2c" for M3 Pro and
> "apple,t6031-i2c" for M3 Max and Ultra as per-SoC compatibles.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

