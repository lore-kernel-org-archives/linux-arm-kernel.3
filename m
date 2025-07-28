Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D53C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 05:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJyv4YqdVIVJ8Jq3SdPcfNp2zqx/xBHkBHbXovVJiFE=; b=IkvjLO3BHheYBs6c6CbO8pQPt8
	eg3AB4IHmGoKlfhZWizXwg3xcc800fd6lzK5uB80YfuR7m/L+kc2NiC32VyoK/lsEBN52AKkPuSZ3
	uCVzQtsN6ooHl0TbGhyf+gCKfRunC2TW1wamQSUkC+HPD40nj1ezsWqkx+QIk91BmUjsAd0zEoK3b
	oY5sXg71LdAVJypYX3iPecpuU7BarvcwIjZcA6mf4EPKmE89XywlvY/QpLAQDsT3O8ekOKmEXfNb0
	YPoxW941hnBXaXUMi+/b58U/Nkxv0JzXSb8yhF63YgupN5qb6jVrp5lc7fu63htaT6cmsfqZZRl2C
	S0JVHRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGKM-0000000Deso-0F8c;
	Mon, 28 Jul 2025 05:23:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGB2-0000000De07-1Xj0;
	Mon, 28 Jul 2025 05:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E632601D6;
	Mon, 28 Jul 2025 05:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF7FC4CEE7;
	Mon, 28 Jul 2025 05:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753679611;
	bh=SCnFBh2pOHaMVAfqrFukG2B0hL6vIjUPCh6ccF3qkK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gN7Iq9NCeErSi0+I/651qC9gtqQbPYvfmJV/9O29RskqzV2JOSeMUnqJEZ8x5Hmfj
	 UPXZkvom7b/Ucz+4yw0MAJLkNC0EKS5NRdGb2ZDBd4ke6nOXvxig9Ax55Qr1QSxIIF
	 K4KfW4nkV0054baygkRJdm3iPcSJeO6UJxQPCi3lFfHmNuZPDHxxpZhG+cbzctyYpC
	 gwwJBiixcOmqCGMu+ZIaxUB4M0b6n6zAT3mN9Z6UaR5TPGpKQwZdHU1/UkFonUkua0
	 uqxhfMrnFUcE6Y0EJm6sMPgsXcYiL6vfHEElFG9NMVInU0jERzCxr3qqIlEJu8WxlR
	 E0/RtxjrwuITA==
Date: Mon, 28 Jul 2025 07:13:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v6 1/7] dt-bindings: net: airoha: npu: Add
 memory regions used for wlan offload
Message-ID: <20250728-pompous-bull-of-argument-ddda6c@kuoka>
References: <20250727-airoha-en7581-wlan-offlaod-v6-0-6afad96ac176@kernel.org>
 <20250727-airoha-en7581-wlan-offlaod-v6-1-6afad96ac176@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250727-airoha-en7581-wlan-offlaod-v6-1-6afad96ac176@kernel.org>
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

On Sun, Jul 27, 2025 at 04:40:46PM +0200, Lorenzo Bianconi wrote:
> Document memory regions used by Airoha EN7581 NPU for wlan traffic
> offloading. The brand new added memory regions do not introduce any
> backward compatibility issues since they will be used just to offload
> traffic to/from the MT76 wireless NIC and the MT76 probing will not fail
> if these memory regions are not provide, it will just disable offloading
> via the NPU module.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-npu.yaml | 22 ++++++++++++++++++----

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


