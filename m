Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6BECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wDJcKGcGxupJM604GGXLvgc51Kpu4CWdIIFkT9cgoI=; b=vQDJ/Zn/Chze+yX07wzSOu0jUK
	0xMYYlh/nHTLMBSh0Nmnmjir5mAnU3X6jFEqsT5zQKEu8KyMlIM/xR++c/Q6W31hiCt0JiijIWw92
	FI5s7B3llsxkgwCjYqIKMs94YYLG3MnMpYNnJyM/M3rAS/zV5ggrrgz1qMIYd2YBAPCMGWaHwrpNb
	TPPoyx2qfa8G0DFhrbRcbTq/GA8NuVoyAkdUDlrIJIxRs5bTPNhqzDOJczMLIDuGwE4vRq49ULeI0
	C0wvRydPBEVzZd6KWswtd772SBWKLU+M2cxmUchD+jWGI2mHbZSa2ynwtlbkhbTYKlhJwr/Pao24Y
	ce+KhvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthtL-000000054hL-46fI;
	Wed, 03 Sep 2025 07:26:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthlk-000000050x9-0M3a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 706CF41A37;
	Wed,  3 Sep 2025 07:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB547C4CEF0;
	Wed,  3 Sep 2025 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756883939;
	bh=ZIuFqgAiUGNMdLEb14nhjqW/5x7OSbzlYnguRxrnXtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfQ/aKQRPHWLa2/xC6SOkrUTiSOmO2665c0RuiJmNm//8eUnqCAtOypxhPc+q4ilx
	 jJ6JpROOVvtkogaWrZdCZNb9usGXQMtmENumkgNTjX9/A61z9Vsie0majUkdxSVEos
	 hLjKhz2eLeQppAZn65yVNmwoXBr6Ttyp9VyXEX8DIM/10sIePjPEZMQeitHi38kVIc
	 0/GCj9G9aVymPwg+9ujDC4IWnoyl4BKjLxVBTu24MXFGfeGA2tenyhGx+ZXLm646ZI
	 4y2Rcgx4dHiT+PMNxdvu8NKaqYgtrX1k5v/hPmOy8VhRn0JA4eKu77L0qjtQd65hJ3
	 /HvDxSMOWHKxw==
Date: Wed, 3 Sep 2025 09:18:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Subject: Re: [PATCH net-next v2 1/8] dt-bindings: net: ti,rpmsg-eth: Add DT
 binding for RPMSG ETH
Message-ID: <20250903-vehement-outrageous-corgi-ddcc6b@kuoka>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-2-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902090746.3221225-2-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_001900_141684_283AFF84 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>, Lei Wei <quic_leiwei@quicinc.com>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Lee Trager <lee@trager.us>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-arm-kernel@lists.infradead.org, srk@ti.com, Paolo Abeni <pabeni@redhat.com>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 02, 2025 at 02:37:39PM +0530, MD Danish Anwar wrote:
> Add device tree binding documentation for Texas Instruments RPMsg Ethernet
> channels. This binding describes the shared memory communication interface
> between host processor and a remote processor for Ethernet packet exchange.
> 
> The binding defines the required 'memory-region' property that references

Describe the hardware, not "this binding".

A nit, subject: drop second/last, redundant "DT binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


