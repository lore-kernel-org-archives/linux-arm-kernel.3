Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AB9CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXobWrGdt7/K85JfkhbiE1Xx6KirCAh53EJ7f9blg18=; b=nVVvDvGf3DYfMJ5vxg6OeLp70B
	1T7SpAm+z8t5+UDieg9fvEfIGxrTu9lqrp2zSnDxOsZkHP6Dx+BYem20QlXFolC+eCUR+4xjU+jj5
	qY5JetiDznBJ0DDAoPTUvu7kO19HsZvfkVYGLcmHXgKvBxu1KEPlj2MqnFwbLXkwH/NsyEh13jT/Y
	cY0oexGu6vFD2iZY4IZdZz/B97hVywqgK8YZhSItOOxhJCCbuiNiN1My+lt+FkNxHa0PSXE/GKEsO
	sSz88iFQehTN2wUoJndWCuZ4quaem4UD0xtwwaa4g7jACvsDP63ddXNBeRBkUxJRE473smzv1QRuU
	dmx1Ycrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTFm-0000000H3KP-2Gx2;
	Mon, 25 May 2026 11:13:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTFk-0000000H3Ix-1cZ0;
	Mon, 25 May 2026 11:13:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 83B9043EF2;
	Mon, 25 May 2026 11:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B321F000E9;
	Mon, 25 May 2026 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779707627;
	bh=NXobWrGdt7/K85JfkhbiE1Xx6KirCAh53EJ7f9blg18=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MwGjr4Ae3OPcbzZnE8QRWERBbD6DYQu8iwXRrVD5GSs3vkDaTTz7KBGzwdO/LgoBC
	 +i4+Ax7paoavAuTFOW6nKtToXREgoQUeWie3rTnB+xTpntqNuce0VO8t0gSGYT1XA4
	 PFFV01ZTwMnbZw3rv8x32LDiJTQUyJ264oKnyTHgj95MOtbObrFdOYOZdb4Iptgz8R
	 WjH716z9j8wUz+aFOGsESfBvdCxMZrFKA9bCQPNbfz0cI2MXvte3/7ZXLhBj8Mg/UB
	 k6gtNJoOkMqcv6Kdx3xYmikEnwVTEO/fho/Ja1wPW3HCOCUsmXJSc/38hoQ3ZOwejS
	 uKXdidvqYPhzA==
Date: Mon, 25 May 2026 06:13:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: airlied@gmail.com, tzimmermann@suse.de, 
 Conor Dooley <conor.dooley@microchip.com>, rfoss@kernel.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 heiko@sntech.de, dianders@chromium.org, sebastian.reichel@collabora.com, 
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, jonas@kwiboo.se, 
 Laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, m.szyprowski@samsung.com, 
 linux-rockchip@lists.infradead.org, andrzej.hajda@intel.com, 
 mripard@kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, nicolas.frattaroli@collabora.com, 
 hjc@rock-chips.com, andy.yan@rock-chips.com, linux-kernel@vger.kernel.org, 
 jernej.skrabec@gmail.com, krzk+dt@kernel.org
To: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260525082033.117569-3-damon.ding@rock-chips.com>
References: <20260525082033.117569-1-damon.ding@rock-chips.com>
 <20260525082033.117569-3-damon.ding@rock-chips.com>
Message-Id: <177970762578.3598344.16093942078468322022.robh@kernel.org>
Subject: Re: [PATCH v7 02/10] dt-bindings: display: rockchip: analogix-dp:
 Add per-clock descriptions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041348_442987_2303ED6A 
X-CRM114-Status: GOOD (  11.96  )
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


On Mon, 25 May 2026 16:20:25 +0800, Damon Ding wrote:
> Supplement dedicated description for each clock in the clocks
> property, clarifying the function of each clock input for the
> Analogix DP controller binding.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Modify the commit msg.
> 
> Changes in v5:
> - Add Acked-by tag.
> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml:33:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260525082033.117569-3-damon.ding@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


