Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D642E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZvVG/Bp+198W0pvamQKRGDxmeL2IwNvoQy9V6EQKhw=; b=k2bjPFyEzYFOyyVpxPOTgjy3VK
	06FocR4FfL4b6OHrFmPu0Fgfi1lUkgltRP2pKNoAFj1XR0PPxL5SqUlv4lM0FO6Ecw38ZBoHJ03UE
	CfDvvK32TWhrFgLekqrJ1ch4EqQCb/s8mIxEHKJRKUQzPwjerPKThqQK44WD1tMfaUL/Cg4PWri+0
	30eRPo+Pn978iiDLde/PQUe2VQ8u84CskOr+zZYY7ILDpZOhKziVfuXJUlZ57qLmqKT+qurKpJ3M1
	EfA/E0xi3i2MMSDVX3ZBvmfUrHPNj1m6Nvx/2TSEnLxSkI74UKwt+akgh3ajfYTQ//Oa5ILocFlzV
	UnyPVH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRC8u-00000000W9X-1j3W;
	Fri, 27 Dec 2024 15:20:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRC6y-00000000Vj5-2F4o;
	Fri, 27 Dec 2024 15:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5516C5C61D8;
	Fri, 27 Dec 2024 15:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F85C4CED0;
	Fri, 27 Dec 2024 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735312727;
	bh=IeeczP30L+JhJs0l+pjv1ZQkEXJAq4Amm+GIyITjjtg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jGCV7k85TPBSjYwuAJP7uCjnbH74LtFgpHS9xgWFLkX1Vnrv/9S9ATlJCktdBtJE6
	 UMql9ePqFgwW8f7P8xHfcs7gYDXncODZQIqR8DEtchoxkQNmKovSR28sUi+nyz/lqc
	 ZCgTMFNLs/ZCSE51sg2kzc6P/GqiVORUwdkKW8D1JrEYj7R5DcHVkHVFiQVk0xxsmN
	 mNPDK0RuKdgvTKGaVkbSsqTHnvIXMlgbDUsfuGO5EYW1/Xd0OlAf4sraxLTTrCRsRp
	 gvNLRWQkT5it/PGNZ16oNx7tS7kfHiASOp8eTU+MXF7oAPFnHJinlE4/DwlPxzLoJH
	 q0WlG45fD+gzw==
Date: Fri, 27 Dec 2024 09:18:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20241224084839.2904335-1-wenst@chromium.org>
References: <20241224084839.2904335-1-wenst@chromium.org>
Message-Id: <173531253082.3886317.9089734959024871009.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Drop MT8192
 Chromebook variants that never shipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_071848_619441_10654F14 
X-CRM114-Status: GOOD (  10.84  )
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


On Tue, 24 Dec 2024 16:48:37 +0800, Chen-Yu Tsai wrote:
> The Hayato rev5 sku2 and Spherion rev4 variants were designed in
> anticipation of shortages of the headphone codec. This never happened.
> As far as our records show: the variants were never produced or
> shipped, and no such devices were deployed to any lab.
> 
> Drop them.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - none
> 
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 11 -----------
>  1 file changed, 11 deletions(-)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8192-asurada-hayato-r5-sku2.dtb mediatek/mt8192-asurada-spherion-r4.dtb' for 20241224084839.2904335-1-wenst@chromium.org:

make[3]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb'.
make[2]: *** [scripts/Makefile.build:440: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1463: mediatek/mt8192-asurada-hayato-r5-sku2.dtb] Error 2
make[3]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb'.
make[2]: *** [scripts/Makefile.build:440: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1463: mediatek/mt8192-asurada-spherion-r4.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'mediatek/mt8192-asurada-hayato-r5-sku2.dtb' not remade because of errors.
make: Target 'mediatek/mt8192-asurada-spherion-r4.dtb' not remade because of errors.






