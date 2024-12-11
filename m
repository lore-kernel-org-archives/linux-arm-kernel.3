Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337AAE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K60QhhIQzV/URywF5BGDyeDpIbT7S09TCbdpsCT/rGQ=; b=YNZLaa/It+xgxCCK7we2ayF7bi
	eykBf0aRKTE0ywd3qlrnFzDYF4OS4TZrw8x1xm6GlL4FnhNSAeIeinOZoxa2P3PhExibUXQt+cV79
	fCwQXsDCq/JnJOAJcHQLspqlcBFFzjoNagNvn6L9ENrnv8c4MpgUEOna0gWDsXXiCXOqyD/nR6qj+
	cbkvYD8df8T47GsYOjcBV5yNeO6dA83iTriHFa9IKKevNN5DcmOh4g525lMfmgJq2bcK3LdzxNeTn
	uYuACvN8BAdTI6EBl60i2j0yP5rBi79poWuenctW8MBMZr9fAnVBlh8xYvpMiuXbls8YHGo9SqTo+
	v3Zqvfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP8T-0000000FMpK-17xD;
	Wed, 11 Dec 2024 16:00:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP2w-0000000FLRO-1B6Q;
	Wed, 11 Dec 2024 15:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D9F25C64CE;
	Wed, 11 Dec 2024 15:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E53FC4CED4;
	Wed, 11 Dec 2024 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733932481;
	bh=Z/nbk/8Kb/p1U+kHAubTcn5qOKR0MEKHfLVov/7+cCE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MJyw/KlC9PsR8A7QmwQl+ECfyQDa36GtAov7ute6Lb2pDzGHI5s/CwO+Tjxcj9RBV
	 Udh7zF5KgAcRYZgQWVLyZmx1JcBUuZluIh8ocAWasByBGAN41rh1Rm3f9hOXj3NXvZ
	 8al3tAu6BklmNPMeIAeiizXMaMqtPnH13o0j7Nk2vtvVw89epNoshB+UmLQYR89W4B
	 5t26PWGXLee/eytjtQHHRutRJoWxTP8TQHCRCuink5FyoU+Zm7ifMAV/jFBxQRLxuS
	 HgunMtvv8bIqCzO5OLNeEDpGpPti3RzSWDElNMWyi7+owwUELExnEV5/wcZtVyLuld
	 m/UKl145tSb4w==
Date: Wed, 11 Dec 2024 09:54:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel@collabora.com, Aary Patil <aary.patil@mediatek.com>, 
 Conor Dooley <conor+dt@kernel.org>, parkeryang <Parker.Yang@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
References: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
Message-Id: <173393224281.3090994.9490420905071029981.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Enable audio output for Genio 700 EVK board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_075442_403480_AF247EAB 
X-CRM114-Status: GOOD (  16.61  )
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


On Tue, 10 Dec 2024 17:54:27 -0300, Nícolas F. R. A. Prado wrote:
> This series enables audio output support for the Genio 700 EVK board.
> Patch 1 adds the missing #sound-dai-cells property in the MT6359 node as
> a prerequisite, and patch 2 describes the audio DT nodes to get audio
> output working on the two audio jacks, Earphone and Speaker, present on
> the board.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Dropped merged/unnecessary patches (2, 3, 4)
> - Removed unnecessary mediatek,dai-link property
> - Link to v1: https://lore.kernel.org/r/20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com
> 
> ---
> Nícolas F. R. A. Prado (2):
>       arm64: dts: mt6359: Add #sound-dai-cells property
>       arm64: dts: mediatek: mt8390-genio-700-evk: Add sound output support
> 
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi           |  1 +
>  .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 48 ++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> ---
> base-commit: d1486dca38afd08ca279ae94eb3a397f10737824
> change-id: 20241204-genio700-audio-output-fba8f2ebad10
> 
> Best regards,
> --
> Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt8390-genio-700-evk.dtb' for 20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com:

arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[124, 685], [124, 686], [124, 690], [124, 691], [124, 692], [124, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#






