Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4711C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhEEMSeYIVCrkIn5hi86Xkv5BxenIOVfaRKKVYHvD84=; b=IeDM0wgkdMBYwi4eZlX4cAG7ix
	xhPaSS2My1yEbMm8+vFZJdP7mPu9kCKgGSEZ6qEiNDh71s8mGTJWIhCes0woDgaSLUWkEwwBhnxkO
	aECkTHXQWppNNNw07LQWqXdDmTXcArFjp+EGhqH0OjqPyqj5IesYD0BT8YFaKfVjiknmYXdmIeHDP
	IrTUvkqkdL2nypSropITRsZMeMuzWdWEUimpMgAhANML5EZTD20hBmBlzwHvlmePBDNzT1papI5vt
	8cSOLjm6fL3UkjwOhjT6mFOM+E9/7svfbzt4hXyPNQRdTRY4PKVXZbynPOc8vXct1X4+Ds1W/0Iu/
	mgfDHKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6k8Z-00000008ap2-3QUX;
	Wed, 16 Sep 2026 07:32:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6k8X-00000008aol-1DRD;
	Wed, 16 Sep 2026 07:32:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4D2542AD9;
	Wed, 16 Sep 2026 07:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F205D1F000FF;
	Wed, 16 Sep 2026 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543976;
	bh=uhEEMSeYIVCrkIn5hi86Xkv5BxenIOVfaRKKVYHvD84=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ERhM4IuWUsUDUCi0mxk+QQ4mrLR+K0U0X3WIVec1LX+IL7ZohUfsPxaA8/Kff+DSB
	 1qcsKbCRrZoF9P5pNQzA8kZ6WfUNzY8YgjV1Ua5/aqQqcZPKEpFWwn9eUQ0gb8Kxl0
	 PmPO05XA6tf0yCSo/qmTHuqOllx9qAwbzhcAl0648Z1/1u4PoeQALx3BjXwYpLIiPM
	 9rcgVPSAXAawae5xybgelL7ZlwwZL078ZeAabYw5ajT95XxqV7ropCyY0SIuEHND5E
	 fZubQALdBDGLGG22xtIj3p5oUJlMXVRFVkYD/ST0VNbK+NwWtNa4C+w4vzl2luIccZ
	 YMKu3eeuLqfdw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Date: Wed, 16 Sep 2026 09:32:53 +0200
Message-ID: <xhkdbbj9x1wii.fsf@mkorpers-koolstof.csb>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Ryan,

Thank you for the patch.

On Tue, Sep 15, 2026 at 22:47, Ryan Brue <ryanbrue.dev@gmail.com> wrote:

> MT8173's keypad controller is the same block this driver already handles.
> Its register map agrees offset for offset with the MT6779 one -- STA 0x00,
> MEM1..MEM5 0x04..0x14, DEBOUNCE 0x18, SEL 0x20, EN 0x24 -- and
> mt6779-keypad drives it with no code change, so the node only needs the
> fallback compatible in second position. Add the mt8173 string to the
> existing enum, which is what mt6873, mt8183, mt8365 and mt8516 already do.
>
> Verified on an MT8173 board (Amazon Fire HD 10 2017): the volume rocker
> reports through mt6779-keypad with no driver modification.
>
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>


