Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B78CC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4W4aBHAZSgHGfphuFUB0RcioFOEHtGqGft7qgQ5dIk=; b=KHZ+p9d7W9614gBPYCtZ/KVhqT
	xdh6W8mkheM0KMPaX4VlyEgwCuXyHCDyC/ivE6+Xjraxz+Ml/t5ZzZZ5rlOIgr1L72yi9cr9gV6cv
	+CLKNjl9koF9yuR9CLcVtX7rXQnxvIETZ8fYDXOYqCqnOgbJ8gg4bgibusgztd03Lmj9UgiWyKbjj
	IVgPu3eT4BOEz62Hmv4oMs+2moGjlFhbWq+HfHIrudmnfbDKB81c8pCp2RhrAwl0ag8y78oja6j/1
	i1f0fpMBdY5uMjPjlxhDhCd8Fz4fjBQfrmbym904xijEeY3k5mEK8b1UQyNpUcMA0/3mjgyKYtWbW
	wkz0iT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDot-00000007QdG-3MQd;
	Tue, 18 Aug 2026 07:01:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDot-00000007QdA-0myJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 07:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A22E406FA;
	Tue, 18 Aug 2026 07:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC2C1F000E9;
	Tue, 18 Aug 2026 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787036470;
	bh=A4W4aBHAZSgHGfphuFUB0RcioFOEHtGqGft7qgQ5dIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lAmi7LK/TYUYni8ULrzkEOtyWrsLHETUCnopcaFKf3WDWwgHkLZzV0q6Zmmv0D304
	 vNTqbujYPaY8ggQvAHY0oQZtLxmrSftzQGLnJlzusSzFmoRUPxWqxVczCpAEg2UlG5
	 XZqDPn+EeS7STPmbgw3O5ufG7Rb/UHVT36qUTI4ghnSwZbdtFmfIOVDuHgG3vHCWGC
	 DNIYmkTMggvLlsmWg01BuIbReKgUGncU6Mjz80OE74QsVEWRc1TcFjn5XU36AB6MQO
	 8WuA51lefNxrqluc7QHp0etWStWHEx1k5Juck8sWvgPtUlPldpQQfhy8OZTRG5RN3w
	 8CE6CGccNZkpA==
Date: Tue, 18 Aug 2026 09:01:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Message-ID: <20260818-convivial-manatee-of-jest-acd3f6@quoll>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
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

On Sun, Aug 16, 2026 at 12:23:00AM +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Note: Running dt_binding_check on patch will yield a warning for
> 'ti,keystone-reset' in the example block. The YAML conversion patch for
> that child node is already in progress here:
> https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-1-189389503324@gmail.com/
> ---

You need to send dependencies together, either in patchset or even one
patch, depending on the case. If this has warnings then it cannot be
applied.

Best regards,
Krzysztof


