Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1FAC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gf0KuFmSKTNqCEIxnMS1RISpHG0M34ZcMXhe1a9iApw=; b=vrfq40pN1OrlmrZHlDnd4szec/
	8H4ci4XPK9kbtiJMHFxi3IyxgWbXr/PDs+sFDUS/v+SgV+fSFunoeSB/4og2hLwBSuTBWzG0gBvFF
	gdhxLr/2hgVhaUc6s0Q/lYBLFe3vb2Wgdk3M/BHceD+jxtMS5FDYiW3N8bB2bfgSE3zTiVY8USfYz
	A15hytG30W/TmK6IfRWZh9UY8/9aV53EkiS7mRD/mZ7Jy8l4GiNLHvbkZ5AYMujebRLAWgNJGUxmk
	1BaiC66br1pjQSiDmGlKiqCK++PDTocaHXumR3x34LyZqR6+4cjTotcmXZ5Z0ISM1eVJWMzSMxHyW
	kv8JFYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcoW-00000009R9x-3ijx;
	Wed, 19 Aug 2026 09:42:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcoV-00000009R9q-3KEk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:42:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F24D860A58;
	Wed, 19 Aug 2026 09:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2501F000E9;
	Wed, 19 Aug 2026 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132546;
	bh=Gf0KuFmSKTNqCEIxnMS1RISpHG0M34ZcMXhe1a9iApw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsUEYzzW7TnoCO1AT4j/E/+8N7DFlBpUheWzZr8EvTw90yUyDQlf1lumrLmK3YbMV
	 Z4pcm1TtUrgNdwqGFLWnYnzHbl425b9gaVzFs0WSFcNdfSlI+83yLH3A8lwgFv2s1J
	 CiUO9vQ+vKfNhrocQEe2zZ1hC7iwCrd5y6vC1kAaGqUuTr9MxnDXpYjNj4ZwGzbyA4
	 jh+nAdi7+ze3f0APyxRYSJ2hmlo3JA4sbsiqxR4a15pSqBmhwn6mWw6a6ZkaC/GNLy
	 OYY/nHFHkNU+ucbubuRa/1YcdvmOT1lwBrVM8rvMil4RJG8xIRWtNXHlrtlYOh0FIO
	 UeLND1xWta4XA==
Date: Wed, 19 Aug 2026 11:42:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georgi Valkov <gvalkov@gmail.com>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, rafael.beims@toradex.com, 
	avraham.stern@intel.com, error27@gmail.com, s.kerkmann@pengutronix.de, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag
 marvell,ignore-regulatory-hint
Message-ID: <20260819-generous-nickel-dalmatian-b6bb08@quoll>
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817215428.84740-1-gvalkov@gmail.com>
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

On Tue, Aug 18, 2026 at 12:54:26AM +0300, Georgi Valkov wrote:
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> index 930b700b73d0..5f235cb9f3e5 100644
> --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> @@ -59,6 +59,12 @@ properties:
>      description: Calibration data for sub-band 3 in the 5GHz band.
>      maxItems: 502
>  
> +  marvell,ignore-regulatory-hint:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Ignore an incorrect regulatory hint from ROM,
> +      so userspace can set the correct regulatory domain.
> +

Same comments, so you just ignored entire feedback?

Again: you need to describe the hardware, in commit msg, in property
name and in description. You cannot tell SW what to do, that's not the
purpose of bindings.

Best regards,
Krzysztof


