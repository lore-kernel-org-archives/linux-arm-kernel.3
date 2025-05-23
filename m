Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4CEC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OFTYQFk9ZumzD8jssYOm3q0yR9mdptrY8VyrJiVHqo=; b=eJJWTiLaCa8BMbM6vMX52yCWuq
	vBb5JswdXI4Hw7GKd1fWEzJq/9GPNSa2q2wl+4V9TWz4tBFNjpTjex2DsGTzThaWmUrgM5s6nWf6E
	7+VuwRhxFnAqh46+gnXIofDFE0W8FXeal80jxesxJDlxaZIM4eBgV44kdRuDIP1ibRCabZdiW3Flx
	TfV328garLDnhduXdnmVXHgyvb0j5Pe20y+ObsrOEq1n6eLI50cp5BI0ZHu1NYlTgBShi/4e0QpEK
	wQIIXVk5/N11vqyGFoNGh2E6bCasJhI3duCID3wdrfQQas5s3s8+Fu5qXLiQHxGDqy1EnYxxgTDNa
	97ruq33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXv6-00000004mRr-0l80;
	Fri, 23 May 2025 19:19:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXt1-00000004mEG-2g50;
	Fri, 23 May 2025 19:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34BAD44DF0;
	Fri, 23 May 2025 19:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D503BC4CEE9;
	Fri, 23 May 2025 19:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748027815;
	bh=JHrKA3GL2+btQ5M4dV8mn1YJFtLDJRKXWtBxFancfLU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=clQVrlbu7Y0j/lMuLit9u7kWHNAEVD2Jbro0BJsft+ZAdTHA1r1MelApy0fJoGeRx
	 ozujjdejxquoGhZ49UbLRCDO9HJFjCFR5Hze0qQHGfAOy5QCkpvkeYAoi+1YFWI69U
	 RlZeM+DzWZYoHIWFMVYmLeRheEsJG629pQiq4KL3uBsNHZs09RD74xDeJWvgfOA0wn
	 3drgZgMVd5Kdqo0ir+AfopMH5DAaaJXyl6qHF93PHBdbKqrc9E9893b0nAGYwLjrt0
	 tvb5UNYPF5WdKSg9f4AGnKDJRHPTe5Li3rAfaMvClM5V/fD2PrCF48KOJqoFhZwWcP
	 EstHME57V6jCQ==
Date: Fri, 23 May 2025 14:16:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Wayne Schroeder <raz@chewies.net>, Kevin Hilman <khilman@baylibre.com>, 
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20250522172535.302064-1-linux.amoon@gmail.com>
References: <20250522172535.302064-1-linux.amoon@gmail.com>
Message-Id: <174802762618.2701053.17389702773465611504.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: amlogic: Update USB hub power and
 reset properties
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_121655_698666_4D0E3150 
X-CRM114-Status: GOOD (  15.04  )
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


On Thu, 22 May 2025 22:55:31 +0530, Anand Moon wrote:
> Add missing reset-gpios property to the USB 2.0 hub node to
> ensure proper reset handling. Also update the vdd-supply for
> both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> for consistent power management.
> 
> Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3: dropped remove of usb2_phy1.
> v2: remove usb2_phy1 phy-supply since now it's managed by
> the hub reset control.
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit 5cdb2c77c4c3d36bdee83d9231649941157f8204

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250522172535.302064-1-linux.amoon@gmail.com:

arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: usb@ffe09000 (amlogic,meson-g12a-usb-ctrl): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-g12a-usb-ctrl.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: usb@ffe09000 (amlogic,meson-g12a-usb-ctrl): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-g12a-usb-ctrl.yaml#






