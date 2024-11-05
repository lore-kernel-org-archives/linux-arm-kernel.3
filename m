Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068B0D2C102
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7i6bfzxTUwTjVm56C1ZM67jMKriadwTwRNk0sb2ca4=; b=grU1fFLXoI/Srls4ii75mYR8Qp
	IEWiXE42SFwMry2UwyqWZMF5Bgm+vaMq6dxsOD7UN3xoLhPQWl6ztxfdT6W39qkNhe9wFF3J1q4XE
	mIrrrxkUGtvOOJ5wROVZ+5SAQQE/GR8e/aTo/3O0KRln9TMNLyS9pSUw7cVYF4FHXuWgGuCATibXK
	KA32lUOdzR++5NqDnbAaAkwkeIKXwwjCIR9weA6m11Nkkp5x2U4ghE3Rt0KWDD2CvqkZVbvR1O7zX
	GBy5MHGZypG5YKfE2geqB8hJaRRiay9h4TZ37lmrV2s4sW9vXKcya3KTgItgDDssbguJJPlnn+udK
	CfQCJUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Kfx-0000000HJ3j-2aol;
	Tue, 05 Nov 2024 14:36:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KeC-0000000HIfn-33sA;
	Tue, 05 Nov 2024 14:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C5765C53DD;
	Tue,  5 Nov 2024 14:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6DDC4CED0;
	Tue,  5 Nov 2024 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730817307;
	bh=GzXTzvTNdEFEvbs3vOmKlQenO+9sg1FizpOvjE0B7tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNS80Tvv78J/0XiKXz32MCfQ1gMlSIb4S2IrPsli6ERQEw8owhylWB2jDKFcKN3LS
	 XMv9bqdLMqAfwzsf26akE4PrHlmIVr+XI3+a6+uS6+fwG+VnPBWjokm/aChor3mdfi
	 BLj0+mE2gPFjaszrFSNOxbZz3Q3WTgIkvxgVq11fGqzZp/6rRz2vJJvBh8t5hZNYcO
	 +PqHkZNHGkqhFrAlEZbP9h1drCTn2F6WUDK+fkj+vUtGUzxg0PiJwHLxQzRBbvwN8p
	 4NYfGo934fPMjs+M17YS30Nz/zRFz8AZmWuvqslJDRfeuNvmIt2PX6YTy1eBOcW0dv
	 gYS5tqJguxQVw==
Date: Tue, 5 Nov 2024 08:35:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 mediatek,adsp property
Message-ID: <173081730525.3220913.16778335543851389759.robh@kernel.org>
References: <20241105091246.3944946-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105091246.3944946-1-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_063508_839196_BE49FCBF 
X-CRM114-Status: GOOD (  19.86  )
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


On Tue, 05 Nov 2024 17:11:36 +0800, Fei Shao wrote:
> On some MediaTek SoCs, an Audio DSP (ADSP) is integrated as a separate
> hardware block that leverages Sound Open Firmware (SOF) and provides
> additional audio functionalities. This hardware is optional, and the
> audio subsystem will still function normally when it's not present.
> 
> To enable ADSP support, a 'mediatek,adsp' property is required in the
> sound card node to pass the ADSP phandle. This allows AFE to link to
> ADSP when the sound card is probed.
> 
> MT8188 has ADSP integrated, so add the 'mediatek,adsp' property to
> allow using it in the audio subsystem.
> 
> This fixes dtbs_check error:
>   Unevaluated properties are not allowed ('mediatek,adsp' was
>   unexpected)
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> This patch is based on a previous [v1] series.
> This is sent as an individual patch in v2 because the other patches in
> the [v1] series are either invalid or for different purpose in different
> binding, so I think it'd be better to send them separately.
> 
> [v1]:
> https://lore.kernel.org/all/20241025104548.1220076-2-fshao@chromium.org/
> 
> Changes in v2:
> - drop `mediatek,dai-link` vendor property because its goal can be
>   achieved by using the existing `audio-routing`
> - update property description
> - update commit message
> 
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml  | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


