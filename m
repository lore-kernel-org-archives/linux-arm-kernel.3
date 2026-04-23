Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03E1F9935E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2016k5GmXlBckNyslRgjVN9IyVwbns3zMM3deEYpsa0=; b=kHhQlwriBlG2yZAiKLeRLUeETs
	h54tMvyIW5bqtDmNjReVegz0BSM8zCvkDnUpuefQZudy+mZJBDZsaAVUvO4lr1+yEY1srMtOWM1HL
	8YyBsE6v/QoZGN2ZMw35oXrv+l+f9936iPOAb+bsuc9BwA+B/F0cX8SImCLIK1brTQW5C+E7ZMyzf
	oNSTYIL61zKYMf3KM0wAgf32N3dCmm8nmVzg+zYsIzF1lkvW5EWdE2yWAqdQQ8zlczdG4H+RuV/p4
	tkYuKV4W6sVokiJIY/8zlML2yHZpk+IkT+U20nHg9bjJbE28dih5r9oNlSJ5rpJk/F4lYiJNWkwsF
	5Tq9NWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqE3-0000000BL9U-2I4h;
	Thu, 23 Apr 2026 09:20:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqE0-0000000BL8H-1gYA;
	Thu, 23 Apr 2026 09:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A963C407D0;
	Thu, 23 Apr 2026 09:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4B2C2BCAF;
	Thu, 23 Apr 2026 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935995;
	bh=qKg5bxgpTTQfFUZxcCD9VWvBgzLKpR1Iot7so2sqo0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTxiAzAvZ7aeMDFlB8ptP+zBdIrxvGYToMwpCPaQ6IUiGmd97xPwNwHPocfDTmgfj
	 3peDCXfEW1IXekkaN7ymT0Eg7CfcXEs/NT4dIaOj9viGUg6yLTF3TOlEXwNwgUKaUc
	 Fma3Yv00kKTj39H1p2VWps07J+EnS8jthRfRNATnWi4ewy4w5+crY4zW6b0ViUNOUZ
	 Kyr1tjayGCVhd9UhkCi7Ger/qDGRF1+ges/MpE7ol36Ngj6wF3AFkIb37XVeV910+T
	 gRKeDo7bhtpmt2HbNL3t7JvKS4vaurM2H3dzdGDA3VJL/bZxcfdtII8+fLAE2JOpqY
	 nIiCVR1XfZcdw==
Date: Thu, 23 Apr 2026 11:19:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	David Rau <David.Rau.opensource@dm.renesas.com>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source
 definitions
Message-ID: <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
References: <20260423042831.21114-1-phucduc.bui@gmail.com>
 <20260423042831.21114-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423042831.21114-2-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_021956_458420_500255CB 
X-CRM114-Status: GOOD (  16.76  )
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

On Thu, Apr 23, 2026 at 11:28:31AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The 'wakeup-source' property already has its type defined in the core

TYPES. It is plural.

> schema. A number of sound binding files redundantly specify the
> 'type: boolean' and provide descriptions which only repeat the generic
> meaning of the property.
> Drop these redundant definitions and descriptions to clean up the binding
> files and rely on the core schema instead.
> No functional change intended.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/dialog,da7219.yaml  | 5 +----
>  Documentation/devicetree/bindings/sound/realtek,rt5514.yaml | 4 +---
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> index 19137abdba3e..fab37cd92e0d 100644
> --- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> +++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> @@ -45,10 +45,7 @@ properties:
>        - wakeup
>        - irq
>  
> -  wakeup-source:
> -    type: boolean
> -    description:
> -      Flag to indicate this device can wake system (suspend/resume).
> +  wakeup-source: true

That's wrong. Commit msg is making here false statements that it is
redundant. I checked (and you should too!) and driver does clearly
device_property_read_bool() thus the property CANNOT be the second type.

Best regards,
Krzysztof


