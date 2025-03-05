Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B43C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dw10rXWbw8QMEDjZXtEudXE+XoNHjXi4IB37tgkEhrQ=; b=kpceNQYDvy6zAjjgJd2Il7+FCn
	6p0f0AuyyAXa2vxDxiGL7zW8yScBUO07ocX7lYNmV2Q6fUxamQRAfyEcADud/kSyfkizczSh0msqs
	SoZ+r1eOQYA1351AhnWwELxJI+izYgl5JrnVUW4wmWRDywybkMBVzrGLlY1AUAtOjI22tLDhRQEzf
	35C5M7CKRoc7QlgodG7LRWCrVS5NlBseThttmdfYvjcDKim3sE8kQ4FtndD78j5JJK5YEsjYv3Vnh
	DHCDDjT0CODzWNezl+GOJ2LKwmDASD/vbu1PIGv2qoKMKAQDbOSgqq5OSNyKHRauIhC8U43KLUYDX
	+BrobCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpju1-00000007KeH-25lp;
	Wed, 05 Mar 2025 08:14:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpioU-00000007Cn8-3T12;
	Wed, 05 Mar 2025 07:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55F035C6646;
	Wed,  5 Mar 2025 07:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B58AC4CEE2;
	Wed,  5 Mar 2025 07:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741158305;
	bh=UzdLNCI0bfSar6q7q7rZ73KBcX1BCzYbwcMYrNzDXQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pj/yz0O7pjEBKga/lkQ2UIlP5JHjwdc95mwGGdwFtSrK2EF3Sw5hVWJQZcDgdxMch
	 zuyubpPULuh80KoCz19ZE0hlZJ9I+2L61+WT2wH98AqF/1Cc3f9NnkbXUlLO+bKPQe
	 3ZSGMPGGW8Adzo/1FNjDXzE+Z612U5iacNThZ0KoIcSXPFbnAiR2QE/y79RMvGNlyy
	 USKcSDi7NdhVkos0GFyQ9ffkAmo/X8aRZPE9vIZgboDD//IIyliPAyxgTyZxdV/los
	 SYZMXwdKK4/RjMZZc1DoLMBZQ7NYFgK/JZe2xQCtq6xrRnY9tqLrBRWWu1gAwWFbjZ
	 RKwdxU+NI5YfQ==
Date: Wed, 5 Mar 2025 08:05:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 01/20] ASoC: dt-bindings: Add document for
 mt6359-accdet
Message-ID: <20250305-stylish-grumpy-chital-ea6e4c@krzk-bin>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
 <20250304-mt6359-accdet-dts-v3-1-5b0eafc29f5b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250304-mt6359-accdet-dts-v3-1-5b0eafc29f5b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_230506_941491_EC6E4FB6 
X-CRM114-Status: GOOD (  15.23  )
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

On Tue, Mar 04, 2025 at 12:15:42PM -0300, N=C3=ADcolas F. R. A. Prado wrote:
> Add dt-binding for the MT6359 ACCDET hardware block.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  .../bindings/sound/mediatek,mt6359-accdet.yaml     | 42 ++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6359-accd=
et.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.ya=
ml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1d27148ed7bffee3f73015c8a=
f88bfffa8701843
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt6359-accdet.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6359 Accessory Detection
> +
> +maintainers:
> +  - N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> +
> +description:
> +  The MT6359 Accessory Detection block is part of the MT6359 PMIC and al=
lows
> +  detecting audio jack insertion and removal, as well as identifying the=
 type of
> +  events connected to the jack.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6359-accdet

There are no resources here, so this should be folded into parent node.

Best regards,
Krzysztof


