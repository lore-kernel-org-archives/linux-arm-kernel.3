Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF12C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mhr5tq+RWra1XjjZq+xikp8FDAk+xbCALKNb1DFU3eY=; b=aefbAvm3rIUEP65bi6l3mW7Evw
	X7HmRgY3nA5KVLX3ECuGFLO5ZIfByEW5CfHcdrfiqt5t2RzrkCTKImjplOuv8/W3XMtHdXjFLItYI
	widAg1hztLHlSZ+Z7OK/QvE3seuSAo+2FLfubTEWFO3F4ahgIGKGZdm1kNwDdHqxpbNhz6DaAfjLk
	IoJYYqNgMAfUCB9kEZkUFCBRJJZSoqeztUmnyL8e2bFoprLCy5NHjs696em9btMU4aDygUVHFzSi4
	VqK6ukENtWtykcOKw3kcdnuXKu1jY7i4juJplmtjAGp47zK2/pv6vaj/+E9HVTuaNSaBxouQAW7XZ
	g4MB+KFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWiu-00000004TPe-3Gzd;
	Tue, 01 Jul 2025 08:52:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVyi-00000004Mf2-3Q9y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19656434FB;
	Tue,  1 Jul 2025 08:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BACC4CEEB;
	Tue,  1 Jul 2025 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357072;
	bh=XR9jDohx2+YhItNyaDv7Pg0vMjnF3uLLK93y84AWj14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDLE6KRaFgHYfI45ve/XExNF1c5plly4IiUiW/t3mecUvktqfSi0kePxOGCGhf92/
	 wMlRcmEVHrMvHv2maG2wu3Tgj5rMBsAyQR3LMCNRmPUcSWwPwCBkLcZQzQp+R9JDKm
	 Drz7IxWQzf8TKxv+g2juxNjjZ311AlFpO8xbK/bo8vznEuX0HsRgAJ6Ho469f3nIRw
	 kFb1YrmzEecZVhNlbCJqxzZjEROTjuS8cQxYRhl+qwNoDEDmTXwH/M/ev+hBykIlWk
	 h7Zb7BbkPwW3cQt1KBiTKS7Q0HAJcZyG6Z8vLIEcJW4FVUVZeyOoLjxV+Y/SkH3N9V
	 6sjeobFIy37fw==
Date: Tue, 1 Jul 2025 10:04:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Message-ID: <20250701-wooden-arrogant-goshawk-ed2f12@krzk-bin>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
 <20250701002239.972090-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701002239.972090-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_010432_941235_ECE66932 
X-CRM114-Status: UNSURE (   9.36  )
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

On Mon, Jun 30, 2025 at 08:22:38PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add DT compatible string for the i.MX8ULP EVK9 board.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


