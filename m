Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B3DCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9hUmKar5O02NFihv/eWeRprhOZiGvnEGK3mmjGeDPQ=; b=F3+jubRBx+gZVk0iNzwkcRXZTS
	f8Y3A2jgy1l1bobgc2oP0zZHUGqqjSSypBbiDfdvb5fMWB7kdUwjl6uD4BWTMgnlaFyn2xXjFCUIG
	Wb/LbBeak1lS40ZKWGT4fQNgoo/z/4e2vbknW3tFAeNW0eiZYnZiRqp3LoKR7HI30I5KMhmtNsYtz
	hO3OLgbn4e8xcCMAaU1Rp9Mj3FIY/SATwtEBl06yV24Q82ES6DgTLxT3Y062/mKsuCBiSzn76ZKtQ
	NRDQ7CUprFVynHTNiVsQEc1nnsc1DPB/KP7Kbgb+AScpu3h+1yb97bEEmg/nBhol+kFmV/hYuiC4d
	XxYbXOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvR-000000072qG-3G2D;
	Mon, 19 Oct 2026 09:45:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvQ-000000072oX-3GO8;
	Mon, 19 Oct 2026 09:45:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ADA641FD1;
	Mon, 19 Oct 2026 09:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975011F000C4;
	Mon, 19 Oct 2026 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403100;
	bh=f9hUmKar5O02NFihv/eWeRprhOZiGvnEGK3mmjGeDPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I0IJ/Q3JQydV4fpFljS1CKzANgZRjBmUN5jkSaBePuo2vvHYZtL949kaI4oXtKVpF
	 Ibrxra4wlgFftp6lfT9oDbtnaPPjsR+M9L9qpwrr0YwPLaXTq6OdISIOcvPG1Y+q6f
	 WtMRwNXTZ3YKlyhQo9TLKeaBBEE15nWUiONThR6H068PwUOww8DtEGxcTcSNyIj+Ge
	 9yLMf9bqMv2dMajCH7IrxjpKnWxQJpf0V9CrCbZaUWz0X6zEI8DLt/FpyVmvAgnEA+
	 kWBgajriVYaVZa+taTaIfFvLpa/yGICU/MMSqlv3EeQB2bfjMTG0f/XPpt+H0Fv2FH
	 MqjKcctfD6cpA==
Date: Mon, 19 Oct 2026 11:44:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: timer: mediatek,timer: Add MT8163
Message-ID: <20261019-cyan-cockatrice-of-economy-adccac@quoll>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-3-f2462b2d2437@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-3-f2462b2d2437@protonmail.ch>
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

On Mon, Oct 19, 2026 at 01:39:59AM +0100, Ben Grisdale wrote:
> Add a compatible string for the general purpose timer (GPT) on the
> MediaTek MT8163 SoC, which is compatible with the MT6577 timer.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


