Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A8BC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN/6arrxng22tJrn7BRCyO+ECsAZSProc9+N1c5mFT4=; b=jOvUMOgVcyDvGu0HWrC0192Jx9
	yZq1xd67bWWbnZdhg6qbtYgS1vs8dumRuIslJmPqIZDgpzSGKwbwUToGlfmS8IYyeQnlPhBWM+xHi
	w1Icube5IJpgpxaKsTmtzhmcllchlFVukbmVLtMRMCT/6b2bL6pu/Ufp4BPhitqlF6iGF8uuwRSpH
	asNnryadzHmvnQR9Z/QTAn8H9jOuEmRyKuc1sgQYc6Y7jDtlOXAxUgEAyv5Pj+ekjUS5IM5Qfwsk4
	H8GcuexqVMVdMfJeFbFv1CfV8kkoxNuqznmGUWxDwR7uvaI7G0R8/WoyNGoXPEPwRV3KA4X0kBlVy
	9BJ6kGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gXT-0000000FbLN-0OBT;
	Fri, 18 Sep 2026 21:54:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gXP-0000000FbJB-3bbD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 21:54:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8F336053B;
	Fri, 18 Sep 2026 21:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9771F000FF;
	Fri, 18 Sep 2026 21:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789768470;
	bh=UN/6arrxng22tJrn7BRCyO+ECsAZSProc9+N1c5mFT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QLbvXml5HHRNDrwkCg+JH2fLuaCctWQ8iqIQd6SJOLgqvoHb2+X8/5bGYMqryclzG
	 uFXYD145O0HyAaSciFIjZylqQC74BunUrPHuE5MDQV4FM08qCaO8OnrwvfiNVEk2IB
	 /knds9ot/tok9odystSPYMruqvTiJlsf0ubXx9VWXezfyWoB8ZhRAknMwPjVQNHkce
	 7WaAuEdUVfzZo5h1fvF2GfOFppsdkYlIEj0kFgNYmgXwqWxkf/qas/WwnzlFvwZJ7F
	 /UH4dUkLO1j9uNMqcKpRWYOPCcF1ldLZZODsjqcKsk3RBZqmEymdYUCWjUXzruBGGi
	 CKXHZ2QpQJMpw==
Date: Fri, 18 Sep 2026 16:54:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 11/20] dt-bindings: timer: arm,twd-timer: Allow power
 domains
Message-ID: <178976846922.2411312.3899064627778136436.robh@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-11-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-11-9d0c17e1f816@kernel.org>
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


On Mon, 14 Sep 2026 13:54:39 +0200, Linus Walleij wrote:
> Allow TWD timer nodes to reference their power domain.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/timer/arm,twd-timer.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


