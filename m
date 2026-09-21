Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5DEC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDYfj0q0WBbc27zJfQKY47KhE5CkSTCe0tT5qQ5LOuk=; b=LeFk7RIqKCspwtZvydJ//8q1lO
	2/psoQf9LkG++a7oiKnLretUd6GGji5naqu9/9Q+i3pTT07iMCnUkcT0O1tF/1uhN4WPeO42ms61o
	ueuaPoAZ8Zdc9aY3HfuSzbeauBDljP+fyGi9tGQhfDbwRTXDDwHkeJ3H9z3VZQJXGZsQyk1RDAFxk
	gbMeRCuS/+W13KxsVvN67JA3An4VyGzastRoMYzW8qc2uKFQYQpCmBfHhzxhfyywAGYMZgHYGwYIs
	x4k7Y3+DNtax3ce/iecrYGsmVYZnPWy8N7VpxBtntt9Pz1J3JsqYGdrztb/CruxVEKgh3b3HcQOjF
	OKUm87RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hOU-00000002v6s-3yB3;
	Mon, 21 Sep 2026 17:01:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hOU-00000002v6j-077A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 17:01:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FF6542B9E;
	Mon, 21 Sep 2026 17:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010741F000FF;
	Mon, 21 Sep 2026 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790010089;
	bh=LDYfj0q0WBbc27zJfQKY47KhE5CkSTCe0tT5qQ5LOuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YIvufl2KQ/GmFXyad1oCBKcuqybWf/Yt8lXLGX5IJCfSonNJA4vvhaTFnghQMVcmo
	 xdZBV+4sQAm0MAZe2kCCVhSY30RNqNxUvsldGpqSGxRkkxNaGT3eCYF3uUUT+jMx43
	 Mh5KIxaE7RZ8rWrfkvHrO4ZJVENXvA/8Ucw5xPJZnIrL87+27oVEfLw8rdqhXoICrs
	 3sVK9FxEYzg140DNb+DzWI9anb5AyljUp9yfDsATkHmOxiBSVr4Wt2x6yv5oX9ao+r
	 E0ztA/vE4eVQsSBun/CZE7RW9fKl3NYMl1TjWTFArFGYHf3c4WA94/525bvdra3x9T
	 ywdZn8rCcHRNw==
Date: Mon, 21 Sep 2026 12:01:27 -0500
From: Rob Herring <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: arm: apple: apple,pmgr: Add t8140
 compatible
Message-ID: <20260921170127.GA894200-robh@kernel.org>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
 <20260911-apple-a18-pro-initial-devicetrees-v2-2-08d06cf011d4@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-2-08d06cf011d4@cyberchaos.dev>
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

On Fri, Sep 11, 2026 at 06:58:39PM +0200, Yureka Lilian wrote:
> The PMGR blocks on the Apple silicon A18 Pro SoC (t8140) is compatible
> with the M1-M4 SoCs. Add "apple,t8140-pmgr" as A18 Pro specific
> compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

