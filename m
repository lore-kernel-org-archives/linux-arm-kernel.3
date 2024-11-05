Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359F3D3177E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNULnuma14COqUngEc7X+vkKAjiZWym3skCS5oc9EOQ=; b=T3gxIomXNIdopGHwo08J3OdKaV
	l5yoUBDZgbXMcTGuFLPVmHwu3qx2T6J4Og8m34I+2bzvfp7k6OoTUZdvS5VnpChuCIoeBUzM+mZVs
	mN+1JOxXsewIiNQF9gF8wbZDDorRKBDJi9Mc6DFRlV3RB+tbF7fdSVp5OVDusFzA31h7+uftmOYWp
	8eAPxcLBbrjLLBub1/Ob0G1EGMjlAvHms5lvbcsOv/ua+Yc1Ybfy0Jg+EATCyBIsjBzL8WNryXHSj
	2PvLkaHlLdW0BmSHOTvCSuG8dkrhMvFL18BTcdDmkxEKJ6coud/obHGqIe57zpcjj/e4y6FszlkOv
	YF4x5NmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OH2-00000000Mw3-3mB6;
	Tue, 05 Nov 2024 18:27:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O5O-00000000LPB-1b0F;
	Tue, 05 Nov 2024 18:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85ECEA43809;
	Tue,  5 Nov 2024 18:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134CEC4CECF;
	Tue,  5 Nov 2024 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830525;
	bh=4kEDw3mpTS72uH6/guigCdvq4B9391RyXxfp1ONslIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o4EjHN3KIWyxO4EVu77Ic7n63NEXUNIJOI1UTcN1WeMkCroMfUSvNcEIl3R0tYTWW
	 FvD7rzQpq9VH/Oym9sZReWhFOtlQQeijfLMpa/h1niRTILkqYAbwUbVZqXvg2K3ijM
	 5RzBf9MAczmhIg0o+v88USk+hLM3L+dBl60ff0SvpnXvfJPFosYglnxc78Atu9Gov6
	 AMklzazp6+h4RtriKf8HcN/RuSgIr7L5BegqYxcbbkp4T0EcsYAmyeerjF12oX1Tm7
	 Dig+4rIo1CaleamLq358AQsipcjvqX8bCQkQjPNfQth6lAetRASKf0bONDg1N+/710
	 /XY8RTqTlTOGg==
From: Mark Brown <broonie@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
In-Reply-To: <20241105091246.3944946-1-fshao@chromium.org>
References: <20241105091246.3944946-1-fshao@chromium.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 mediatek,adsp property
Message-Id: <173083052155.94172.6768091589461565148.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 18:15:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_101526_541670_BDFF57EF 
X-CRM114-Status: GOOD (  13.96  )
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
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add mediatek,adsp property
      commit: ed4bcfbcf45d02fa81c77cff86e914d71c1b3c1f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


