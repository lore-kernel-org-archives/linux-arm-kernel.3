Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B1DCF6486
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 22:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxiZ256yC1KWBY4rW2iAW+zPotMWvRus/oGs+S2yL8k=; b=GQsHeE8Mg9F+h3qZb8QB9QPhTm
	MtBlO8Wh6SQl3ZGn6E/XqWXeV+Z6q8+aZCWKFZxm3bUJWtlasL7eyXp1/Hb2FGatTA79fjwYa//8a
	l2EmlsdKYBIqP3AtyhV8w6s8iZ3ZKHPRCozARFDkJBH2kVnmcbBoUAuIZirIAlI08MA55cjA2gsKa
	qqQZ3IdDQTKGESxAdHzggbDZJdLBHBQEet38GWVt61lveNg77u+gQUW2zCJusb6a9ZJM0/yTeoRUW
	AfBUWoogXD1dffSh4GZ0uDqdtfNpDKJYGnMXl0GJZBvMmMzpKIejeFydgsVRztVDoQpnqyl2Lvec5
	ZsXGCFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqeT-00000005nJM-0c8v;
	Wed, 19 Nov 2025 22:27:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqeP-00000005nHT-0X3F;
	Wed, 19 Nov 2025 22:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7333B439EE;
	Wed, 19 Nov 2025 22:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F339C116B1;
	Wed, 19 Nov 2025 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763591264;
	bh=/8R3jAWH+04a5Vi5dU1uhypE32MurQD61AqM5GlfyvE=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=imgY6TDyVrEfccxsqc/JbFsbLsaXzoHtyOOV8BlZzxLiO+SL76sJwg9Zh+ELx2/J5
	 OgiA92KZgdudADz9TaTi1aTtC7vtO6iteU49A97EOyJaxPB25BjGev/FWSmPEPKzVV
	 pykdbZKYcDMu6XBqFPl68iypkMuz7ufGCe91P+hSSVsjPh98sQHRwEC1MEUb1jQnJq
	 uB8qS+0igzH1+kRpLKnpX7s9+1LG8+M6+lHnA2WM3D+l2+e8jTMtmZZDhAzlhreHyY
	 l++gSrpKYrb06UMcMGC6iJzzLZ1FgZfHrk8QR9Pbkq+AOLQyaQ8WCHS7VxhqnjFG07
	 cH6by7OtQwJKA==
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Nov 2025 16:27:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Wunderlich <frank-w@public-files.de>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20251119175124.48947-1-linux@fw-web.de>
References: <20251119175124.48947-1-linux@fw-web.de>
Message-Id: <176359122549.3467832.13147318038488444877.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] build full dtbs for BananaPi R3/R4(Pro)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_142745_183344_818815D2 
X-CRM114-Status: GOOD (  16.44  )
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


On Wed, 19 Nov 2025 18:51:21 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Build devicetree binaries for testing overlays and providing users
> full dtb without using overlays for Bananapi R4 (pro) variants.
> 
> It is not required to build all possible combinations, only for
> common usecases and to test if all overlays can be applied.
> 
> This series is based on
> https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/log/?h=v6.18-next/dts64
> 
> Frank Wunderlich (2):
>   arm64: dts: mediatek: mt7986: add dtbs with applied overlays for
>     bpi-r3
>   arm64: dts: mediatek: mt7988: add dtbs with applied overlays for
>     bpi-r4 (pro)
> 
>  arch/arm64/boot/dts/mediatek/Makefile | 53 +++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> --
> 2.43.0
> 
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20251119 (exact match)
 Base: tags/next-20251119 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20251119175124.48947-1-linux@fw-web.de:

scripts/Makefile.dtbs:20: .dtbo is not applied to any base: mt8395-radxa-nio-12l-8-hd-panel.dtbo






