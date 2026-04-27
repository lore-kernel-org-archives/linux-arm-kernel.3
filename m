Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8B1FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFSA0GdWPG2aV57KEJ5QOp2iDhhRiPToTCZD/+0Ar0M=; b=bSeomk9d110t9je74bcDH0WnV6
	mVPdzvHfDKstqn6/n0v8AzeATqJ46+hs/VQ68t/WiaZFNkxa9srLi2MJbRqzxZwRcBjplQ8ey+QNn
	lFTNqfMr5I410eaHBeJMp9LKwqIdCq7Bdr2JeEbDPCldEa7/StcopnAnvUIJoCArUUll3hoDb3edy
	FkiHjZ4bJY6iwpE/2KhhBZ6MSltrAkX9MieLQOP4apZO0BCwYarDGKVVRB9EiJvWl9o/q7SVI07D9
	wfrwYqZ41eSh2uK52XyPzByQqokiJ8qKzKxGis9iX8s699e5AxuvJFuhs0POZwKdUoY7pRXtvEtdB
	VRb091fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHGB-0000000GRLa-4885;
	Mon, 27 Apr 2026 08:24:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHGA-0000000GRLN-4BND;
	Mon, 27 Apr 2026 08:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C6A26013B;
	Mon, 27 Apr 2026 08:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D778C19425;
	Mon, 27 Apr 2026 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278245;
	bh=zvpwmP5OW9BVPljro9l/0A5E+XjE0vObFmo1E7/7drQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j59/t+wTph9MDM/6ZabS4cD6CwHS3v4FDE+e8GB9LgWAQaTMdBwJlLxABT3W6KX1E
	 ATPoALKwUU/Q5o8SNFjrYkhbxfcEl0a/+Jepqn5zonyM0ZX/tQ+Izh/hm7nV1lYTvg
	 KGS8r2Yv0NETjzxVGIZiyVq4KboQUlPq79pTpGWZldohA6rOSjPGU2cAxISxsDRwCk
	 6i4n1feMbycqpIu2hbqDYZDl9wjgOslETt3NEfj8uI3qQAdLGZTKSmdDR+kIAAO1Qc
	 1q4Fg3nONwXAGllKkBtscs0aCJto3EueSFE2Y3j5JzgbTReA0+O9JxaAExtJByVnba
	 TJs2vyKldmmWw==
Date: Mon, 27 Apr 2026 01:24:03 -0700
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Balsam CHIHI <bchihi@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 vince-wl.liu@mediatek.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 justin.yeh@mediatek.com, linux-mediatek@lists.infradead.org, 
 jarried.lin@mediatek.com, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org, 
 Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org
To: mtk36707 <kuanfu.lu@mediatek.com>
In-Reply-To: <20260427065236.1685057-1-kuanfu.lu@mediatek.com>
References: <20260427065236.1685057-1-kuanfu.lu@mediatek.com>
Message-Id: <177727824371.1363528.14088477684280198031.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: mediatek: Add MT8189 LVTS
 bindings
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


On Mon, 27 Apr 2026 14:48:29 +0800, mtk36707 wrote:
> From: Kuanfu Lu <kuanfu.lu@mediatek.com>
> 
> Add support for the MediaTek MT8189 LVTS thermal controller to
> the device tree bindings. This includes new compatible strings
> and required properties for MT8189.
> 
> Signed-off-by: Kuanfu Lu <kuanfu.lu@mediatek.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 27 +++++++++++++++++--
>  .../thermal/mediatek,lvts-thermal.h           | 20 ++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml:99:11: [warning] wrong indentation: expected 8 but found 10 (indentation)
./Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml:119:11: [warning] wrong indentation: expected 8 but found 10 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260427065236.1685057-1-kuanfu.lu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


