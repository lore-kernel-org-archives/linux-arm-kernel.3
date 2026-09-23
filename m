Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08D1C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v1qWpSubT0BojVUIH2p1MxNnH0XIrg55E6OXezB1Yc=; b=n2IHvqaCXD4R/ZvhYPbzKmbwYA
	da2jtOjHZEJGDXM9Y1hWqwKVSlRzV2ULDHJyMEqBUFu2JE9+5F89pFWpoLnTXc5Ed/3ZDdvu6y+eb
	Iq4LJrgqKoZXItqqgAYSTI+4q++GS7YLU0Kn+8ZxplowhyjZAVdaG7AQQD7oTTW/jUKywp3QKIFPE
	gPSZE0zBwFH1yjC6NmNNLKOoDWXpnLJcxCEKUX6EyL89p84rJ0DfYLMPJmBdqGCpymu7miGi+szL5
	lq2pHuH3k01UCtfoIrBTWMQt+u4Mljib7atK9VLvArK8NpzymtSfSYX7zzwzpk1Cq2waUk4pUnm3D
	gUStpfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jf1-00000007oc3-2E1a;
	Wed, 23 Sep 2026 09:53:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jem-00000007oaL-2sVx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:53:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25D8B60211;
	Wed, 23 Sep 2026 09:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FD31F000FF;
	Wed, 23 Sep 2026 09:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790157171;
	bh=7v1qWpSubT0BojVUIH2p1MxNnH0XIrg55E6OXezB1Yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q1hwjgZ9SQW2uK8nsTbZPgfQjVPaeQF3bBU5t96/Ewon1/bhqTIQIkUFxq5q/H0t8
	 eNDFGiUy/EFE/txm2Jlym50xZO4Ae42PHDyHTo526ZK8NeVI0b2RtT4hDA2K3/aN9q
	 Qpq973qi2Y/8y/v8hHc/59VcHjr5aHCB6/n8BiqYABqJ+9U9B4w8UiEUQiS5fFyBHT
	 SCOl7dXcM84akr/vnS5GdldICfPDT71BxIUlJkSzSqLFTkzPLe9ATK9B1vknUUAgn5
	 D46F5EsoEu7r39jPgvIaFLeDdYtnwzZ++cBKGIwGnmzGzfCY79L1dtUD3bJIttno1s
	 FD8XM6Iqhg0LA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
Subject: Re: (subset) [PATCH v4 2/2] dt-bindings: mfd: ti,keystone-devctrl:
 Convert to DT schema
Message-Id: <179015716864.3923423.9257262506672643289.b4-ty@b4>
Date: Wed, 23 Sep 2026 10:52:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Tue, 01 Sep 2026 05:08:13 +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> [...]

Applied, thanks!

[2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
      commit: e3513583cdb959bbf1370edcbaf3c0b014077742

--
Lee Jones [李琼斯]


