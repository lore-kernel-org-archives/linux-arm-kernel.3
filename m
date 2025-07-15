Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85BDC83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pA/xwgYVaaXhQcyZX+Fx5dwKhr33A2Y88J1MPjmPgg=; b=Ly4EXJzVt+IwppUMl4jtISCxsH
	PKMVO+Yjz+ENqQULjpak0vyUyqwXbyUg79j/ngDK4LyvQLQ98veqXbhczfKZ3xzQMLJdjBbUbHDUk
	JMozdwJ7EzRlXz8yOvKq/PEcqE5mt6dvnfjf2urEFnXkRg1gk0WEZNo0DTlpiJxc+gS+R1rkciIcl
	+xaktTCW4mTMKDfvsC9pDfMBjlOnzwko0AMyDzh15G+XPD6Zq2M85vczLHX6XZk7VAFKsnqRXNSYm
	gLVZghj+6S4U1n+uucjzGUl9alX+P9k8g8paTjnfvZZYY5iJljdXMFPyEm+5K+UoU5rEtlijy1ctD
	bhaA8PSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl7C-00000005yMh-1JOR;
	Tue, 15 Jul 2025 19:14:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhmd-00000005d3c-2KWR;
	Tue, 15 Jul 2025 15:41:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E591761468;
	Tue, 15 Jul 2025 15:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99037C4CEE3;
	Tue, 15 Jul 2025 15:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752594090;
	bh=9R74i+8xUMSEjjizVKVHIpxeVkW6Fk9LHFlO/Fzc1DY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=h7rdeNla7v//kuHuFZuZhCmbfC/JlVwD+QRkzlHdBkTDWMj2yVx997+Iqtc+vH4V4
	 Vp55eUcGakznG/gRTl+odHHGcaK9hczJ+L0dqovQ+oD+R3MfbetTzKJZhsFmsULETg
	 uRhCzF1AO4YJfHdmL3dBGPflX2H+Q3CtMwguq3QPTGccZx1lgDB1YMQPZcXQIb/O/L
	 vju4rf+deiWvMNnFj8u6E33srhh7IVjZAKnRLJz3Jxc+ncleX1BSrh1V1I1mNHjaPV
	 obJ/ycRijwV1+JDhktcu49H3B/4IQLP2dlEfo4aVkJMq9whUOrfe4+Ts/v/W+s2Y6q
	 QysaB9nVdbUGw==
Date: Tue, 15 Jul 2025 10:41:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lee@kernel.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 wenst@chromium.org, lgirdwood@gmail.com, broonie@kernel.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715140224.206329-8-angelogioacchino.delregno@collabora.com>
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
 <20250715140224.206329-8-angelogioacchino.delregno@collabora.com>
Message-Id: <175259408775.1380012.11849397051967783374.robh@kernel.org>
Subject: Re: [PATCH v5 7/8] dt-bindings: mfd: Add binding for MediaTek
 MT6363 series SPMI PMIC
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


On Tue, 15 Jul 2025 16:02:23 +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek MT6363/6373 (and similar) multi
> function PMICs connected over SPMI.
> 
> These PMICs are found on board designs using newer MediaTek SoCs,
> such as the Dimensity 9400 Smartphone chip, or the Chromebook
> MT8196 chip.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6363.yaml         | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250715140224.206329-8-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


