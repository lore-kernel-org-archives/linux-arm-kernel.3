Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE5EFF60D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxWGc2TsHE0VqN8tEOLzDD2Cwy8bGqX3dfs0MX0CZws=; b=W6l3C5TfCFjwQ5INAaGyQnlLi/
	epCr5y62PvJu4WXe4XUvEAAvEZIIoPCCcIZwndY+sV7c8nDmhrH4IfeZKXu2jLW1zDh/AYIE8oY2p
	4SKD0ixUe0ULZx3xOt2HzMX+oGpGVBtTwJWYPX3zzKaxByHNpkXQc7ypRsx8JSNnx/jDaGOPYrmbR
	vIxvL2DMJM45ORpqbbyMl8iC3rrOWXvXLkymBQiKmEkw0+b4h7/hSxGOne9mwpDjD2luTUvvAHhCe
	YtL8Ysx9rKucBjqbu1ifcs/Lrw11LTAqWK1ldFcj4fI+4p6ez2KQbp0rLc+01aBHIST0hCgvHy7rH
	vOAe5/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T9g-0000000CQZx-3C3U;
	Tue, 31 Mar 2026 07:04:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T9e-0000000CQZY-0E93;
	Tue, 31 Mar 2026 07:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9251343B45;
	Tue, 31 Mar 2026 07:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF191C19423;
	Tue, 31 Mar 2026 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774940689;
	bh=BVLZuM9Tb/IhhGxxJ8XR8Poig0u+Q+Ff5TgQHV/QdUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyjRDPlKTvxSBHEu0LQLHoB1bQ/7j2PGJ6zJDIoHHdF+eBnsNlBA5/G4e28/majZK
	 sS077DV5gR/nH1tMgvhznEkv+Q2Wk1R45tJpKqEHewhqdfiBxdx5Em7UNtvvstnU73
	 qBbVOHhjODHeamOhG1TTMXU73wHPIsRUqK/1QqtRvzYCYQRQuN3KsSyqra5jT+VJsw
	 bjrTTqDZJyKs7NrrYsLa0V44TDs2+EJ8o0L0qosiqCKI6uNH+EFpHcFqF3xIg/NYy5
	 +KBqYG+Xo3nwq1B+PeOy8B+ONGiaqyxH0mzvlNxlFCZou4Kar1nWPAiy1Etu9Dya8N
	 5wv0si+9LT7CQ==
Date: Tue, 31 Mar 2026 09:04:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Message-ID: <20260331-gorgeous-bloodhound-of-dew-cfbfbb@quoll>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
 <20260330083429.359819-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330083429.359819-4-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_000450_136632_0EAF4ABB 
X-CRM114-Status: GOOD (  15.92  )
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

On Mon, Mar 30, 2026 at 09:29:37AM +0100, Luca Leonardo Scorcia wrote:
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../regulator/mediatek,mt6392-regulator.yaml  | 74 +++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     | 24 ++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> new file mode 100644
> index 000000000000..24fbaef0e717
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6392 regulator
> +
> +description:
> +  Regulator node of the PMIC. This node should under the PMIC's device node.
> +  MT6392 is a power management system chip containing three buck converters and
> +  23 LDOs. All voltage regulators provided by the PMIC are described as
> +  sub-nodes of this node.
> +

So that's a dead code / schema.

Try yourself if it works.

Your parent schema must reference this one for the regulators node.

Best regards,
Krzysztof


