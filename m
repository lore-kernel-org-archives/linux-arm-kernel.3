Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A87D4922B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lu3bpGeOQsW8gmipDG9/DhKFs2ssnH/4+/6ehmX5Rb8=; b=ioqhOabCkwzkXF/DorQq5Y4a5B
	ciw/AIU5oPni5ywaSirK1vj8iTu19f1NXgYuaLD/lSPL+KLFHiK0IJWbC+Y+XI3gphq+L4XndYCRL
	REQ66pFXIVPgTMlRpvuIRlphtLyVeSVp5nts97yDcr4KFOJPeCQgHbtZ9YylVTc6uDeRkHYfeIw76
	RBsmvddvVti9E96LfEpS5pQmNcDxIUQvAilHCI2UBzrRfofO/dL+SAeouRr6zYYrWenmxxVnRxN53
	Nu3Oy0agQi5+L0lMcQoQGWuW7mSg7wgmygMJhmGKV3jKVFIhXmArnzo+ctGsggftO+NMtRUFuZbGQ
	Gk5AqJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDR39-0000000D0yk-0CFh;
	Tue, 19 Nov 2024 16:25:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDR21-0000000D0ir-2aJm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE43F5C5710;
	Tue, 19 Nov 2024 16:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60664C4CECF;
	Tue, 19 Nov 2024 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732033488;
	bh=j6RXHCNuVKCw00NDiP75RQpvT8vD3zsb2CJxkx+a5lw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jlQXiGc/YR8uNbwBAQKlWob4eRRzO7iH49Xg2MCH2pQBrvrnaUexWASGP81MF3YpO
	 yFHIEXYEGl77SRDIAO/jQoioITCZu+wHVgqse1FJghR41Vk68PtX+S1dV9TqCwkQY9
	 jbStGm1TiQaxiwtRWIiYnBynNIGFg9ZBFtG9d4c1Iy0z8C86FUw2fv9ITdEZgQvTLe
	 TtEhFXM6awiApADh3Eigxax/s/dK6mDfjW9kZ4xzFYbYbTBl/dUsuylyIfbrNxAmcO
	 ddiOXhgNJli1abovfQGbYKrFijo8KwzLiR3Xw0LBKWO0XZl/WwsTd0u5IXkvta/7Hd
	 p7v+VxLM74kGA==
Date: Tue, 19 Nov 2024 10:24:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
Message-Id: <173203348678.1765163.1636321988738538785.robh@kernel.org>
Subject: Re: [PATCH v5 13/16] dt-bindings: net: Add DT bindings for DWMAC
 on NXP S32G/R SoCs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_082449_738043_BCD8D059 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Keyur Chudgar <keyur@os.amperecomputing.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 19 Nov 2024 16:00:19 +0100, Jan Petrous (OSS) wrote:
> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> and S32R45 automotive series SoCs.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
>  2 files changed, 108 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


