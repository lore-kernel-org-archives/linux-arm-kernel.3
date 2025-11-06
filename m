Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC95ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEOhzAy99ok5RAW6jieLPiegp4B3qFQ45Dzi1nI4ADE=; b=PND9i9p8HSIVhbqYi8gUYPPoN1
	JUBC2HDKA1SfTb+HPWmjx1RRJscBZe5/z2a4aYYGrPxI3k1aMQlHnIFvj4pEYSZQO3V/fi4aB4VyG
	DJjXrt16sq9Zf6CDjPViX3Or+yne3geRPMlrAP2y11trRnEbTyYSwAth2gn/MAXr1cV0tuHP1HaRP
	6TJO2pnL/uI/NjfFGwdu8n9aTa9bo1vWiM5epD/8gZT+3NKZ8jZOCZTALqj7O6XybXWOc1/yNTpy4
	p76lEZiWnNdXT5ThNIF6T/9h88nhGiz5pKVu4Epp/qEdtukTL1nIJuFO0owmdBnVm61tBAPJk4D7t
	JtYBncoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH08Q-0000000Fa53-2nPk;
	Thu, 06 Nov 2025 13:34:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH08N-0000000Fa4B-47Oc;
	Thu, 06 Nov 2025 13:34:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FF974020C;
	Thu,  6 Nov 2025 13:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4C6C116C6;
	Thu,  6 Nov 2025 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762436078;
	bh=UxsA7mpBbTvyv+g/LrSCFPsTpp7DeoIh9dJ/dkCgAxY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=llznu7vxVvCdwnCl/IdM4fTDwJiq1ztqiQ6zJ2Ed1+c3HAjvpQk1TkOwDcnTxNJRZ
	 wWff58/kXcPtX0BGe7JdTaR4eGFQSAUwCj2ySVW6AYwbPeVsN463BW05DfIpCWw/hl
	 Jj06IfZCO6KqhJ0grsxnLXj72NGc6eQw5N1vyoBG8o7dBfKxaUqBZ/Bg5VwJpot8/O
	 CvuRqY0Q0zTKdoKJinZos92gB/UOC/NIbZwxyhbXL+BeTpjbnSQOo7CUBr7c+L9Zc6
	 P4WKltBa+np+i9Frx4hv7oveioFV9m0sYcgu5mhVs4L50JnJ7xN3RgtvTtIp0le4rg
	 jmxcZgsRfxNtg==
Date: Thu, 06 Nov 2025 07:34:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, sirius.wang@mediatek.com, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org, netdev@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, jh.hsu@mediatek.com, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Qiqi Wang <qiqi.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, vince-wl.liu@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
In-Reply-To: <20251106124330.1145600-3-irving-ch.lin@mediatek.com>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
 <20251106124330.1145600-3-irving-ch.lin@mediatek.com>
Message-Id: <176243607706.3652517.3944575874711134298.robh@kernel.org>
Subject: Re: [PATCH v3 02/21] dt-bindings: power: mediatek: Add MT8189
 power domain definitions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_053440_046759_EB244724 
X-CRM114-Status: GOOD (  11.47  )
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


On Thu, 06 Nov 2025 20:41:47 +0800, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add device tree bindings for the power domains of MediaTek MT8189 SoC.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  1 +
>  .../dt-bindings/power/mediatek,mt8189-power.h | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251106124330.1145600-3-irving-ch.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


