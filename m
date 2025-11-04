Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EE0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hf3yfP5WjFx5kEgG4kNJ9Ust+IArWtery7ZC6AeF2Q=; b=DP/ozgq978XE2+sOQ14RNREvvQ
	oEi0a4Vq91nMCmKRQ89rJxAQczQs8RSv9mTfGzd+6Abo8jTH0VESemOKFe8MbM7m5LsVNpFqhp7u2
	fJxz9gaTQepHw8v+vMJWVCwIFRNVCblJc2hXyBd4N6Lu+4aId8OMxp5kVUjyiqa80Hvs7qmp8vooo
	KoTLI6Oq1YNqc7X4ZHIBHKOkUhbZHxG89MmQE9qOw30O3j+sd/oaW5QjfkO8feSY331A7Yf5lEa0d
	/PrPhSArVtei/FAVKbsEwpc3bHRcfOlAGeOqaHs/0CK6D4MypRhbz4Wwrqn1bQMWF8tKCRlVogi/A
	/TH5J0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCFu-0000000BP2d-1vU6;
	Tue, 04 Nov 2025 08:19:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCFs-0000000BP2J-3pSB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4740D43651;
	Tue,  4 Nov 2025 08:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927A6C4CEF7;
	Tue,  4 Nov 2025 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244344;
	bh=i4i2ZezZUkHgyxzI36i1jgZxCZSfy03Oaa0uCLjqanU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EX3qRrcNsxISHXHS3gzCD3Q+b90CC4lAcftjm0w3Ite6R4rXomGsnm4tqFBqYOBbO
	 NT29rRKutGn8d1BWvXZgSzWx3d0eHPCSjDk7iwpkP6I3hRZcYj1SSmMV1gcI4dPsMb
	 c6hu+ZgxWlSPmfFbBJa3+qMDKfRPtD/AlDjzqa+yHRsd8j1EmMaEk9urXUYFt975k+
	 vlSNOV9xLf5+DpkPy3nNQwce5lq7Kro2PnzI3gbusASkI3Z6aOfpw3ldRE+ittBwZQ
	 mQoC/OQxInggfVu74SM/X/Pxt3FfzYcBUYcqCX0EAud0fx+rVJIAnQV1ihGgW7oFi2
	 9oeKFf88+901w==
Date: Tue, 4 Nov 2025 09:19:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Message-ID: <20251104-victorious-crab-of-recreation-d10bf4@kuoka>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_001904_969624_4CC0102A 
X-CRM114-Status: UNSURE (   7.62  )
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

On Mon, Nov 03, 2025 at 03:39:16PM +0800, Jacky Chou wrote:
> Create the new compatibles to identify AST2600 MAC0/1 and MAC3/4.
> Add conditional schema constraints for Aspeed AST2600 MAC controllers:
> - For "aspeed,ast2600-mac01", require rx/tx-internal-delay-ps properties
>   with 45ps step.
> - For "aspeed,ast2600-mac23", require rx/tx-internal-delay-ps properties
>   with 250ps step.

That difference does not justify different compatibles. Basically you
said they have same programming model, just different hardware
characteristics, so same compatible.

Best regards,
Krzysztof


