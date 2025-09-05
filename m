Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139C9CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwsaUsiPTz6C0FNobEgQ77nTd1Kw9HiUyiggzzyF+Pg=; b=uLBc/lKAm0T+4aCok5kz+yd5oa
	pUrZ9kRaDHBX4D4QwqmVJl2/fVf1+kugsE0Thb/2p9KFsVTdiO5WGyq6OdKN6328Q4rkRil9xGMf9
	6N+2euaWFuzPAeE7+/FtcPhOWzw4nCnFi1v7aMWaFyOhBk86s4Cj6zAIRR28DYJ9uMpuo1QuydnO0
	dBUMz2UvAahelPPZ2YVamYXcdsjmHxL7FYUAeWxA7iwgtchBREVthDk/juAOAZrSY5fBJanve4UfA
	DQZkEMpTsTU7ntQQCc8PpTFxkQ//zsd44e0CDl15+eM0VrhHdRvN5d3WPbxBrESMFsVq3p4yNHDtU
	b1Arc/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc5J-000000047Dn-2oyO;
	Fri, 05 Sep 2025 19:26:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXxr-00000002Zrb-0SfX;
	Fri, 05 Sep 2025 15:02:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 694CC602B2;
	Fri,  5 Sep 2025 15:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0750C4CEF1;
	Fri,  5 Sep 2025 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757084578;
	bh=fXAlkg6U4rjB2T88uzlB0xsdi6LWa2QU3tBer2f0tLE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nrXh5JC8NNluI3p5jaLqySzGJpmeKgwV9Zu67Olq4VBiL2OHhcKZp17i1qxOAByjZ
	 IZ4BCOyAB4ZZgxu5fMVQ+gBrLQb/M77HHt6Pfvdmmbrb0gC5kFv2DggICl9HnpqV02
	 iVXgMMfQUTS64BpH9F8/DUQ0kpxwpbRoVVZsdjWg3YbcIJmoiqRkfxX56L+OSBGI8w
	 MNd7Gk13vdIAKKNRRKjk8kHQ5BkwPmP6Fzka3zSdZjAnlil3fc0Y7eeGv9JKI3sGys
	 Jx6VoHtvtf3rU5cudLlcScxlSJT+J4E1IOSyA/AjtvsJypal4QQDn9r61B6dFx9KXV
	 8T6H4OovQB4+g==
Date: Fri, 05 Sep 2025 10:02:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chris Lu <chris.lu@mediatek.com>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>, 
 Jiande Lu <jiande.lu@mediatek.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hao Qin <Hao.qin@mediatek.com>, 
 Luiz Von Dentz <luiz.dentz@gmail.com>, 
 devicetree <devicetree@vger.kernel.org>, Deren Wu <deren.Wu@mediatek.com>
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
In-Reply-To: <20250905084433.26999-1-ot_zhangchao.zhang@mediatek.com>
References: <20250905084433.26999-1-ot_zhangchao.zhang@mediatek.com>
Message-Id: <175708448180.930634.147702031291534747.robh@kernel.org>
Subject: Re: [PATCH v7] dt-bindings: net: mediatek,mt7925-bluetooth.yaml
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


On Fri, 05 Sep 2025 16:44:33 +0800, Zhangchao Zhang wrote:
> Reset BT via BT_KILL_1V2_L hardware pin.
> 
> On the M.2 standard hardware pin interface, the MTK chip
> has a pin called BT_KILL_1V2_L or W_DISABLE#2, it uses
> function-level device reset (FLDR) to reset Bluetooth.
> When it is pulled low, it can external shut down the BT
> function, it is defined as 5 on the MT7925 chip, and is
> defined as 248 on the device tree pio controller.
> 
> Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
> ---
>  .../bluetooth/mediatek,mt7925-bluetooth.yaml  | 47 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.example.dtb: bluetooth (mediatek,mt7925-bluetooth): Unevaluated properties are not allowed ('#gpio-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7925-bluetooth.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250905084433.26999-1-ot_zhangchao.zhang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


