Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA76DC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvOAAvEqQrXLsQwlnPnQWnbNbrravmSOiEtsZTzR2W0=; b=U7eAiE5AwBm8UUwh03GXcUFjM4
	QMePtjhv9q/qYQO0uDiG4K7KTxFjIjRoI39SnxYZKMLUlt3lPXN+ciqeKRiMyiUS0LLt2RN0yqZ4m
	cPBtuWgdDP8NJK1NOXrbDP7aPvOUsDa/61biDwy5M//LDtzQQkBmcj6smHXlJ/dC9viPVU1uB/zVz
	VPNVr1K8EbvCTdbPj1EJJH1jjEhkBtSyaIKOrZ/a9LUfKXW0gi0eqvI+8+1UbgPqfNkl73XV5xtlH
	mOiEJhbhL49sc/30bYdFrX5s+YY4BpzjCFEnprsHlVqFdBFC2Ysbw9EEz1RRC9RaJxEv1djkBn1Pn
	HUSGCFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77KN-0000000AscC-2apN;
	Thu, 17 Sep 2026 08:18:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77KM-0000000Asbn-2LeY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:18:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D37F560211;
	Thu, 17 Sep 2026 08:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C567B1F000FF;
	Thu, 17 Sep 2026 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633121;
	bh=SvOAAvEqQrXLsQwlnPnQWnbNbrravmSOiEtsZTzR2W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FZzb+MUvs6DCrqSinxiRcAYbsiqLJmbaQGqvWAaPxdsyKGJrCYTqyOls4HSAXgZdW
	 CQn7MYibOWxHyT1JtOiT/aPpYQJbdKx7v2p/y29eC+07Puc2JDxM9BMzCPQotOKKDh
	 NYHNfeoo7GN9L82+janmD/eln+b1xqpG4GXAovuzpjME8VQFyWiwo4joFP5AsdVXs9
	 PhpOT2C960tkSIrhDIdOhhFWjEoC98CtLR4Szior/6FJ/gtAcbVyF56DNjICHKpgsE
	 JSLAUxzVg8Gp3IxgGO0xFz75JwXLTcawr5rjgZY7SuNk/gruMnK5Dour9h9SHNuRul
	 MBuF/um2AyKrw==
Date: Thu, 17 Sep 2026 10:18:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 08/20] dt-bindings: cache: l2c2x0: Document power
 domain
Message-ID: <20260917-sexy-jasmine-roadrunner-c31d90@quoll>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-8-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-8-9d0c17e1f816@kernel.org>
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

On Mon, Sep 14, 2026 at 01:54:36PM +0200, Linus Walleij wrote:
> Describe the optional power domain for cache controllers.

It is already described.

Best regards,
Krzysztof


