Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEFBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 01:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6KAD434ircXFlRJySWms6u2Woaxjz5VOipm3aKZlcE=; b=Yic4odLMqNV9tnvKFzypV6be6f
	YsxHxZqwSm6y0s3sVEiXMePUxLgxLDPvu7IRPirFMKO++k07WyFoqkE/AzfZCdEAakKNPW2U/DwPq
	StsjxYenY3tJ4gipDhX6vziioM7W2e/i2UCIGbUnw7j0P1Sg79J1LXkZmhlK3tiuRCS/bZoA/Ctxi
	7lvV3ZIhLwFjeSU0Zcsn4ZztXADKDkqVItrQU494PgjFVdlAGmn2D+qY7V6Gvc73dnfR+R5EFvXjI
	P4p76BJyimtsuBREZIDryOl75jGQZcjxIpdOs3fj/O0znfvAxPKr9E3wEoS4eeDsUUrf3OFnPj/6R
	l3+017/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQgx-00000006FFU-2jWb;
	Tue, 31 Dec 2024 01:05:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQfn-00000006F6X-060C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 01:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A33BDA40EDA;
	Tue, 31 Dec 2024 01:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68679C4CED0;
	Tue, 31 Dec 2024 01:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735607029;
	bh=SLxVkcGz5+P4J5d9OZXZNHaIHpMJMKM6U+t5J5uXOlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzlu31/jwQayZ+6h16cV9QCGnBLyML0qXHeAdr0dzUvQWfXyMYdfJtupRRqI4tfQS
	 yGcmMtJcRKXM9M8sCZzjsOQawmQ4GXWYxSHU1a1GyCqmlmK4sLKd127Aq1fB//2iT2
	 RQDiO85C43tqGgMdndYJ/07ypdYuL5Nwiq+31P2sGvzd20lZZzXddyoA0FBHMiinBX
	 cmaH/FPHNNO1I9m35mZM+yCh15/DeZqfdLXGOlqHLLfdC9JtazvU78caF7+QU7nqjn
	 r91WIQFDeAUL+ozLoT7oe68FW9Mzt5F4Xjl10hRTl522swAEsucTZvNRA5c5fBiEi2
	 RJMqASaIdbSwA==
Date: Mon, 30 Dec 2024 19:03:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	andrew+netdev@lunn.ch, schung@nuvoton.com, joabreu@synopsys.com,
	netdev@vger.kernel.org, kuba@kernel.org, richardcochran@gmail.com,
	alexandre.torgue@foss.st.com, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
	edumazet@google.com, davem@davemloft.net,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <173560702701.2856960.545232938075412224.robh@kernel.org>
References: <20241218114442.137884-1-a0987203069@gmail.com>
 <20241218114442.137884-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218114442.137884-2-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_170351_189234_55E94A32 
X-CRM114-Status: UNSURE (   7.56  )
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


On Wed, 18 Dec 2024 19:44:40 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


