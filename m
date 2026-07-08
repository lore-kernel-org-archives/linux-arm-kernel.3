Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9029EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blQnLE3QF5OGl50/VGSrziVsUsYR4d4CLR+QxxJMASU=; b=GIjVUkiqdU8Ge+HKOrcK1hbm6W
	k5/FYIKefwX/+RBbHLz8NPB/ZlD3k1g6w/RvuT2iOhP4JafYZY79AgxbTeoumb1gXLNj4AFlElW3l
	NHuZunA1wCF8pv1B+OVawp2nLVWrP1rAy3GD3LwmFzywC35ayvzDjkE62QTwhu9+F/lJ0BlQVhYcg
	1TGj2HHqDi3L7QJ6fM6LP5VjB/8VRjuoniB6QdEQKNhktT+NvirXPaHWYc8NBtDUgdUA7NSRVzNVp
	SAuyQQZ+tseu8zRDYJFESRzfFvz9QhP6PxkUd+FogdanlxH4Yi+jcb7ACT4ZHatIf3x8SecVpe1PN
	eVPxVHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whML1-0000000GSLN-3fwG;
	Wed, 08 Jul 2026 07:04:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whML0-0000000GSKs-2KVM;
	Wed, 08 Jul 2026 07:04:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF36340369;
	Wed,  8 Jul 2026 07:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DAA1F000E9;
	Wed,  8 Jul 2026 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494293;
	bh=blQnLE3QF5OGl50/VGSrziVsUsYR4d4CLR+QxxJMASU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Db6dN4K1AdG21HPkpWzWQ0eFqmwQLsnC424gTKAuHfBxcTm1bqcX+NfJWjpWojk6c
	 FJXPhJVoa9oLvP373F02aYAhcQYxvuZTvhG4eyuB6h3NXZaJmdj+Q86WhIKoT56nuC
	 WRHVD6CmkAXdR6i+OJs4T4wFfHJqHB4/KSoKqPnPxXGtaqVOte3QZ0zNadqm4iSMaQ
	 ZX1hHbT5E6fQkkZcJ/b5rVm/SThbozAz7BjvLmX4gbL3t098nmtc2BXsUHDDZajoJ2
	 pECPGKxGIc76g6sySi7ZqMJlVC2u3ftXJ+4jFZ8D++wpvdLTBJkJoGdtAC6MoYysCw
	 tlPcRdwJcGEgQ==
Date: Wed, 8 Jul 2026 09:04:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, nfraprado@collabora.com, 
	irving-ch.lin@mediatek.com, macpaul.lin@mediatek.com, aford173@gmail.com, mbrugger@suse.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, justin.yeh@mediatek.com, 
	kernel@collabora.com
Subject: Re: [PATCH v2 1/4] dt-bindings: power: mediatek: Add support for
 MT8196 direct HFRP
Message-ID: <20260708-poetic-ebony-tanuki-dbdbe6@quoll>
References: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
 <20260707155535.199383-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707155535.199383-2-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:55:32PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the HFRPSYS direct control power domains in the
> MT8196 SoC, controlling power for the DisplayPort and for the
> Embedded DisplayPort Transmitter IPs.
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 1 +
>  include/dt-bindings/power/mediatek,mt8196-power.h             | 4 ++++
>  2 files changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


