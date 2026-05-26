Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2550FCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E3Xn+0H1KV2KOlPaoQck3gAXVlQji3IkxvruzI4lDU=; b=0i9f1iQXvv2sgsdvY/VY9AvFg+
	poi+DI9mcXIgxiY2j/SOBfCxU0ldoMTnZBqtSRoLAIm9uSvxjB5SzePiKuVdFUKSRNjf7n1UIBldn
	02m22o+P44eScu5nzsaR/1smhZd0XX/6KvnTMZC3uZVILC5SYksDLl8AV/YolvoeNZMwt2sYXWJAG
	kLUizIebM7jfeIi5atDeap7J3D41vAP95MglQkrDsWRt044RKrF/w9RNHsDO8asV1W+hLyHS5UQL0
	Skwf7dEsay8I8niky13sp/Spo5Fgf8C7vBtZlxygsdYe5AwP5O6fcCGTpC1sSK7JUhaPx9jFLk6os
	kYRgN4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnt7-00000001Trz-3LPq;
	Tue, 26 May 2026 09:15:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnt5-00000001TrX-0HEj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:15:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B55C244013;
	Tue, 26 May 2026 09:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC2C1F000E9;
	Tue, 26 May 2026 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786946;
	bh=6E3Xn+0H1KV2KOlPaoQck3gAXVlQji3IkxvruzI4lDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RsnWb1K0ajUHP8IwU5f6eZwKWwbz6K7rzyl+65TYWoHyYnhZsW7GRlua5Hy+Rxt1g
	 282gOx6iSsQyMmxVUXAmlPLKq3Db7pVAJSWC7LZ8yUZDXnqTfiOh1SuF4dJEbTgKRB
	 t/jlnuoXkz4Y7grj5n3hI4+Q5veW3udBqpwrfTESfe9Neric9tWe4nmS7rTpnFYuwj
	 DyDiRUd0Wgd30akzJvi1OsK8DKPfIkV6YLwPyp7090SX6pq9KaW/Q/kgE+WiuMIy+c
	 x32+zr8zha3TO8gklohdgHCkQFzo8xgGmzetgisL9CGGdcyQu78G8AV0xf4LI8/TB8
	 SZ8lQJY3p2oZw==
Date: Tue, 26 May 2026 11:15:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v7 5/9] dt-bindings: arm: fsl: Add solidrun lx2160a twins
 board
Message-ID: <20260526-offbeat-musical-frog-94fec7@quoll>
References: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
 <20260524-lx2160-pci-v7-5-09370c23b952@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260524-lx2160-pci-v7-5-09370c23b952@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_021547_125556_D3BE7BB0 
X-CRM114-Status: GOOD (  13.95  )
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

On Sun, May 24, 2026 at 04:54:44PM +0200, Josua Mayer wrote:
> The SolidRun LX2160A Twins board supports two configurations, one with
> with a single CEX-7 module, and one with two (dual).
> 
> The single configuration is a specific assembly that maximises
> connectivity for single cpu by routing some second cpu resources to the
> first via zero-Ohm resistors.
> 
> The dual configuration was not yet tested and is intentionally omitted.
> 
> Initial review strongly suggests that the dual configuration will have
> different bindings, because from either cpu point of view the board
> appears different (e.g. different number of sfp, fewer i2c gpio).
> 
> Add binding for the single variant only.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


