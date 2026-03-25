Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B518CFEA837
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC/9wOCodg6/crpThq+KQ6DfxDsBF0vRkgwmcPn9Xhk=; b=pOdArwQEeR6NM3b7o2Poe9TD4C
	s3NemGan2xw9pZmo6Cq5qZec6Etj+RQ+wUbPko61nDsm0nVU12lZdVTuiZaGe+6t0R5rO9hSHZBsY
	iXOKNGsK+OB34BV5eJLawUvFkldH/kF7+d8+j+8nnf95X0Os1vMfCjaMvWkucTw5rW2woziGd7orZ
	QN01LXvMA/6wzCz4Cv0oL1OCVKbleGQRBZjKNHiPi5bJlk6TK4LFHGQIXr5gC/MWpZHqG9i6b1iKb
	syOtrfD3MYkq4d7080h4XaRe1BCml2xzjmwVs++Pr3XLGYxjYuW3HXrD1wVDJWBgb7u9hXfURZIsw
	jjxLrXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5K7f-0000000301g-13pr;
	Wed, 25 Mar 2026 09:01:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5K7c-00000003012-0FZa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C36543BF0;
	Wed, 25 Mar 2026 09:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB99EC4CEF7;
	Wed, 25 Mar 2026 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774429311;
	bh=XvAxCyWu0L7zLc1NFfaPzwcbGzeBeEzFp0l8Vyl4SjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9928HfEqco1L2ksGkLq5J1XZwYZB+wm7R1NLMjjKjFYzz6eZ99J1UyYE1eHxR9X1
	 qvdNKIGZx+sVQ0KQsN77oD/kIlZO1jtn/gRmv27o+JtuIggY1/anV5/Q/8y+fxs7m4
	 qDi32SBacHZ5rQDUp4GhuMEpWezxbGT8bT5V+MmCzmRY7TNLy9I9570yVxZ+56jIYo
	 2F0fN7sdIi/8ez29j/W2yliQk5hv5rx1iZYIURdYTf5tsIL8FUbjWpS3pG2XoUR4gU
	 s/5rH9rkplweCxt5UaFDyuAVjBcnJ9+dnzEby/UVAJzOWXMOw98JX9aCuSBKSbrNAn
	 3PKB2/EtBipsA==
Date: Wed, 25 Mar 2026 10:01:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, Frank.Li@nxp.com, dario.binacchi@amarulasolutions.com, 
	alexander.stein@ew.tq-group.com, maudspierings@gocontroll.com, josua@solid-run.com, 
	Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, primoz.fiser@norik.com, 
	francesco.dolcini@toradex.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 audio board (version 2)
Message-ID: <20260325-axiomatic-cunning-oriole-5badeb@quoll>
References: <20260324061556.980621-1-shengjiu.wang@nxp.com>
 <20260324061556.980621-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324061556.980621-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_020153_051785_6B0FBFFA 
X-CRM114-Status: GOOD (  10.75  )
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

On Tue, Mar 24, 2026 at 02:15:55PM +0800, Shengjiu Wang wrote:
> Introduce a new DT compatible string for the NXP i.MX95 15x15 audio board
> (version 2).
> 
> i.MX Audio Board is a configurable and functional audio processing
> platform. Integrating a variety of audio input and output interfaces into
> the system, the i.MX Audio Board supports HDMI input, HDMI eARC,
> S/PDIF I/O, 2-ch ADC line-in, 24-ch DAC line-out and more. Based on these
> features, rich audio application cases can be realized.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


