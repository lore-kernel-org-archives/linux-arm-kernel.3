Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E695CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCfN1W4PA6mWwb6xh2Jr3LD32MX/NukvOEpPUnuU8dk=; b=LlqrnzLhyy4Z6L71Mtr75tWOEB
	PO6N9b2eKM4YCQVYU0uhHqVGmfnNMVRC5z6GOz4Z0WCjxCBV2hsvSzVIFE7QI6efy0SVQ/OxCABj0
	69gwaiRoAIa1Z1ZkOJN2o/w1COeoCuoD29Z4+1RE7qtqog9KivPewvYDWKuURpt3KA6S3UEEoq40t
	NJnpfrHcQMf2IQJVMeeyNKW8sf/qjUr240jOCMaORJ0rKLzqedm4p9NTYcY+xTj6kUG3lB5MSnbX0
	u8SIpnDXfPF5ORTm2DxPWV1MqrRHRunpatj69M1YMy5m9cFp9nh2lmc3b7WVAXQLoxKulg6gL4vCB
	14pPOtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHIo-0000000Gorm-1wh6;
	Fri, 07 Nov 2025 07:54:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHIn-0000000Gor7-0yGb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CEB86190B;
	Fri,  7 Nov 2025 07:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82EAC116C6;
	Fri,  7 Nov 2025 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762502072;
	bh=3t8OmQN+HWYwvBz12hbfBvBSJ0jdJVm7jFSV6g0Km68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIH4cW3M/RQ8AdoJIJenlu9nKammXIewaPCtUDKifyrThHEXQ5kSlXxi2GPaClpZR
	 jGykLAz3i530vApg7DV/VcBCCHArXeSWdN8xIeTBy8gdoyZVQirlaQBoNhW3gwIZKV
	 S+eYCI+vxJlSUacb5MojnsnSYSJOr5Hs7fSkT/+35r/zINWl1Mh9GlYFl+2IHfYLXz
	 eCYEqtpNNFEj3PHG3R+VboKSowfbKxLvUHUUPurABTZTg/Xk2jmFE01WhYb2J2gsVR
	 dvjO1AxDgcOyzZmzxtdCqFkEC7rK26FyYAWlUxIe7PUBU/6v+ecxH7FuFLcQwrMQ8x
	 ASUUGtzDbOsKg==
Date: Fri, 7 Nov 2025 08:54:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, louis.chauvet@bootlin.com, 
	aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/5] dt-bindings: display: ti,am65x-dss: Add
 clk property for data edge synchronization
Message-ID: <20251107-amaranth-platypus-from-betelgeuse-7673b9@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-2-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-2-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:23PM +0530, Swamil Jain wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The dt-bindings for the display, specifically ti,am65x-dss, need to
> include a clock property for data edge synchronization. The current

clock properties are called "clocks". Please rephrase commit msg or use
proper clocks to indicate you access here a clock (if that's the case).

> implementation does not correctly apply the data edge sampling property.

Where is "data edge sampling property"? I do not see it in this binding.

> 
> To address this, synchronization of writes to two different registers is

How this binding achieves that "synchronization"? What are you even
describing here?

> required: one in the TIDSS IP (which is already described in the tidss
> node) and one is in the Memory Mapped Control Register Modules.
> 
> As the Memory Mapped Control Register Modules is located in a different

And now another therm - MMCR...

This commit msg is barely parseable - language is correct but it is a
mix of completely wrong terms.

In case you used LLM to write this - don't. Ever.

> IP, we need to use a phandle to write values in its registers.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")

You still did not describe the actual bug being fixed here.

> Cc: stable@vger.kernel.org

Best regards,
Krzysztof


