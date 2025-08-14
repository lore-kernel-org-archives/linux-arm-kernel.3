Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753CACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wUE2x+m9kQdywXWVWcbQSCeQMtR6W0ohTkUSJTDy/o=; b=vK1mi8out3ljFM5PuSdh0qyIW3
	vOlXncZDtMjoMwqCqiiYZhhY8PdCO1tmNMBtT8Y6bMT8zW6iTxlF28SU3imMhJ72tjKt1qzalg9oP
	/ye/njf8przytKeLqFE0KOU69QsBYwD5R5OtoV7YVQqcpHh4JtZDfyVIQoenK0NRJFclwCJe84XK/
	PKbgXmkNYBVNJPTe1i39e0bhtjefFqpWjAYdxFBJSGd9SLB0JzNwjVlb4LH7fzcS37AE6Wdetck+O
	32LjV9EAdMSoF0LpJcqKk4CAdcgf9io4EE+CCMtJRYZuRjGTm6nQz+sI3Zt9JHi6hdIWpcF/9ceNP
	oVMajH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfHr-00000000ZY9-40Ro;
	Thu, 14 Aug 2025 21:15:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfFK-00000000ZOl-2LyK;
	Thu, 14 Aug 2025 21:12:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5E9361132;
	Thu, 14 Aug 2025 21:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E66C4CEED;
	Thu, 14 Aug 2025 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755205945;
	bh=7QZaE8oo44a3hYjhoB1A0+u5s3r77l5Hwj7B/t3szLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3mLTxc+L9jdNvAx1uNjhvCnXnxHRXoLi4oXzEKAX1Zjeb/2hu6ak9EYXz0ZDuNCL
	 IPCWug3YsskWSP8BExrDXNMqvx10RoXWwx8G/kD6AWBO807cxSxWGcS6mNExHT6SPD
	 /mWfkISKdgA4R0CSHV/yNcZXKbMpKJYH1fnnhUdqIR4BwLaxi8+yOrY9TisUpnsJZ8
	 noXprwMZsi92ZzJr4sbrMIDtt7AB2ETQ4SfcIZFioD6xIHk/hgOcL0+0IFjpt+mKIm
	 gEX+2PqY+ejS26Kwr2sr9pzaWlxorbQYankCmkyb98c+4eiR57guKi1SY5qcGKWayz
	 Q7lonV8WfQQIQ==
Date: Thu, 14 Aug 2025 16:12:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, Li Jun <jun.li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db'
 suffix duplicating dtschema
Message-ID: <175520594376.3919024.11270343433080389857.robh@kernel.org>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
 <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
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


On Mon, 11 Aug 2025 15:54:03 +0200, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> RFC because this depends on dtschema changes and should be accepted
> after new dtschema is released with this merged:
> https://github.com/devicetree-org/dt-schema/pull/166
> ---
>  Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


