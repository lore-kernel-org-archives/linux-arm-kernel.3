Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC4DCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZHBuItl0ozZkBzFRArPWW9Vsl4ds/W9C4z84aEo38k=; b=yAgv0LU74GTASAEmqZ4tdo2uOO
	Q23PrK6edFQZKYtIGB143aZ2giHb92edXPlcQlA4PbJs6y1USwBD43XZmSZvs/AZ8/T5q7JaS0s+X
	4RPljlkw2h5MIcdDPt67KsFydH1yRwhN82n6aQd4MZSqBQmKaKkmCdNjJrCMmG56HRuLkOSFRaF+9
	aqOszaD1LGwBzdG3j+9+jU1YPD9cceIHNVHDrjGDrJsdQWiPU9pJp7urr/cYOHGUGM637L/KcQD66
	2uRS2v668mFrcxXytwaWYJvCEA4ERnNJoNZkB9EdqpngcnzzHIzxYxGetUAccV70tMLJXHIKCyqiw
	QANkcSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVl-00000005S0t-1q46;
	Sat, 06 Sep 2025 00:10:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaUl-00000003Z3U-0ZF3;
	Fri, 05 Sep 2025 17:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC20344EBF;
	Fri,  5 Sep 2025 17:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E92DC4CEF1;
	Fri,  5 Sep 2025 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757094306;
	bh=qTi3deyURA+o4yjmNVEYbTqALgAHIt7cNmW+V7nDrPQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ugt0Gko+03jwdaV6Miq6KVIAwzYFR6iqsRO9o5y9GQYZfyAiaNQcZs1/cX1yj3d11
	 iJ2l0iqV1qLbzMpFceBhP9G8pMRUpUeSHvNdlyf62QZP9Cq0BhWeI79lGZHLpgg/pX
	 mKmBQFapHk/enEo1HFX3G9z10MfRIv7vvmZW4ff4NyihaNM6KvWvvhAjnKqdvENbdT
	 UV1eHVeUx9Xk9W7QmNDndZ61rYa09P21sVd5c7KRNuVBI3GpFBnQw3/4uuCRLHIpqj
	 qFfr2j+d6tY7rYEUfgs2v0FVbkPxgI9WY5+0uEJVvrzcPvh52ScV5gM9fVftVoOccw
	 j2ZLmGPN/QHeg==
Date: Fri, 05 Sep 2025 12:45:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
In-Reply-To: <de71cbe5db3347756d3173245d01e091d3ad1b50.1757062843.git.marcin@juszkiewicz.com.pl>
References: <de71cbe5db3347756d3173245d01e091d3ad1b50.1757062843.git.marcin@juszkiewicz.com.pl>
Message-Id: <175709416351.988787.3563603110895477506.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc supply for SPI Flash on
 NanoPC-T6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_104507_218848_5C27112D 
X-CRM114-Status: GOOD (  14.50  )
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


On Fri, 05 Sep 2025 11:18:59 +0200, Marcin Juszkiewicz wrote:
> FriendlyELEC NanoPC-T6 LTS schematics shows VCC_1V8_S3 being used to
> power SPI NOR chip.
> 
> This fixes the following kernel message:
> 
> spi-nor spi5.0: supply vcc not found, using dummy regulator
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 1 +
>  1 file changed, 1 insertion(+)
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250904 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for de71cbe5db3347756d3173245d01e091d3ad1b50.1757062843.git.marcin@juszkiewicz.com.pl:

vcc-supply: size (14) error for type phandle
vcc-supply: size (14) error for type phandle
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: flash@0 (jedec,spi-nor): vcc-supply: 'oneOf' conditional failed, one must be fixed:
	b'<&vcc_1v8_s3>\x00' is not of type 'object'
	b'<&vcc_1v8_s3>\x00' is not of type 'array'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: flash@0 (jedec,spi-nor): vcc-supply: b'<&vcc_1v8_s3>\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: flash@0 (jedec,spi-nor): vcc-supply: 'oneOf' conditional failed, one must be fixed:
	b'<&vcc_1v8_s3>\x00' is not of type 'object'
	b'<&vcc_1v8_s3>\x00' is not of type 'array'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: flash@0 (jedec,spi-nor): vcc-supply: b'<&vcc_1v8_s3>\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#






