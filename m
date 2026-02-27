Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D9FEFB5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqmQSAUq7QFNoiAkvEPf6SeYuRKHHIVdHOpVVRk5YZc=; b=MfS2leSvED5BnC1LaHceluA++d
	5KAPvjd0l0UM3pViDBdwj24acvR8MGMKDAWTDnVLsSoavC2sJQ1a24/ur0qRxCvL20aKOmrQhc4tS
	9CYwHbaK7Uf+F2DFXgHeKNl7pbhTYg6/cLdYcHna8FdfNG7Yr6RImOK2+4pbOAsxBFgPCvhkZ9NLj
	0qBFIyxbtPtGwxoGbXgEAout/f7qk0HL8bus3lbl61FROW/Q9xLIjzKV7f9wDFKE5+4s0R0Z7YHSg
	A4EYDRO5OAGfju8xBum6VLzmMBtfZhxJhIbiNZgyOgMDV80c7BD+KGFX7cjTl5/1FhjY0h6RiQsu7
	eMJ7dS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzmP-00000008cz9-2QVQ;
	Fri, 27 Feb 2026 15:29:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzmN-00000008cyd-2q3T;
	Fri, 27 Feb 2026 15:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A799433D9;
	Fri, 27 Feb 2026 15:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C34C2BC86;
	Fri, 27 Feb 2026 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206163;
	bh=eSxvpC1A4x44gz8OQPYI1TH/oWe+icsoC0P6p5bEiWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SE1Tx3kWJq9WCfTc/XyuHXYW8WuZufsw6+I9Uv9vCSjmxjxmm/h18KYPkSeSj8A8D
	 Vp2bix50lazsq92tLoXuuQxOAXBYoN/OyMaAEmIEkCfHPF2cCD3IBhpoNysx8jch6s
	 25f0YbO5qmrqDoLai20zNtIpO8Pw4RBhoLE+0U1Qq8Y19x2afB0nXWpAl1OjMAcYpF
	 dc6KuSMvOKl0TWFaPQLW/sq5vRqfwBUXNL2/aXsP4hGIBjBv2bOTb62US0dYGh/Z9F
	 TDBEfpWmeg6bbG69ghXDM2aIciHpzxAtJX5fqDEtDxLpTM2hyEsTF/qrNjZstWCNZH
	 nbGyjYlb48sZw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] Add support for mt8167 display blocks
Message-Id: <177220615729.330302.13271524782737465316.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:59:17 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_072923_739003_7010D222 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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


On Mon, 23 Feb 2026 16:22:44 +0000, Luca Leonardo Scorcia wrote:
> This series adds support for the display blocks on MediaTek mt8167.
> Tested on Xiaomi Mi Smart Clock x04g.
> 
> The first patch just does some reordering of dts nodes with no other
> changes as this makes later patches cleaner and easier to follow.
> 
> v3:
>  - Added mt8167-dsi compatible to driver instead of changing the binding;
>  - Resolved patch formatting issues.
> 
> [...]

Applied, thanks!

[3/6] dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
      commit: 7df891f2c39442c120fb4f9bfdd7c80e6de84015

Best regards,
-- 
~Vinod



