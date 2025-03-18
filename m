Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3520C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rv2cgmWeDpgTRXs3pcSTXnSyFEBSkNMNxViatRStrqI=; b=vJzRZOJuea3B7Iy7hYg+Nn/v1e
	LvXDHioOQOhHdYOWg2yANWjke+sCp5Wga0Awy0qm7pVwJMHiOPr7Hpj7Pr6mORYOGDcH5fo+JnRYK
	Noau+ZVVk8DFQz1vBa6axz3toKWyPmF7l4vmQgX3LFmjpkWqDhTucNuXf9vhce4WV6reCxUoUBYcg
	QTlJfo3SiuTkvO6ECd4aiFIOff0UoedixKOWha3Xz9bP4bM6KARLS01KYc00B2pN9N8ABX5jGeXvm
	dOMJdY3pT8SKb/ooq3mpwj6G2jfs6cJ3XILyM16a+Ao7HX6eVCVU6cacw1TfrNhtNXiw11KMZMUQf
	ASnF+spQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaSJ-00000006dRt-07ZT;
	Tue, 18 Mar 2025 17:10:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaPx-00000006dB9-1lGL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:07:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E61E65C58DA;
	Tue, 18 Mar 2025 17:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501DEC4CEDD;
	Tue, 18 Mar 2025 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742317672;
	bh=ClveRfCHzxpsa3h6WnfKVB/u2POf/KIKNL1rIjfPHD8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=m8DO/VWdfaesHQ5jT69BoVvNtsn228iyk8FyWouLmx6BqE6Dpf/ZmT1F1QIOMLXMd
	 5wHGTGrwLlL62BrnRxM3tyc1SMiNPxET5U7HXjKMXeUxeiwCwbHDvGv0Ain3bm99az
	 ETpLdjwARCwR+E5xDYcZmNIlaruV5mCCQxPh8UJWKs/ZuYS2jDMP7UZ4HOeR5X/j+P
	 DhMKJhomyUxcf06pTekpfMFAkQ1oT+zwKJbyJG1Sy1oLJH7vBg/hlhau2HnZQumt4X
	 mSULDDO4k6SBxHXpjSLzbtWvejh8jDR5DQ7xoR30zsKURxg3nIwOGx6tA7w2r5rXkG
	 /vB3aDvmpWhpw==
Date: Tue, 18 Mar 2025 12:07:51 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 devicetree@vger.kernel.org, joel@jms.id.au, conor+dt@kernel.org, 
 robh+dt@kernel.org
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
In-Reply-To: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
Message-Id: <174231753965.3228114.9624277631612711787.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add AMD Onyx BMC
 compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_100753_547691_2F0D4567 
X-CRM114-Status: GOOD (  10.39  )
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


On Mon, 17 Mar 2025 23:12:23 -0500, Rajaganesh Rathinasabapathi wrote:
> Document new AMD Onyx BMC board compatibles
> 
> Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com:

Error: arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts:20.25-31 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm/boot/dts/aspeed] Error 2
make[2]: Target 'arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: aspeed/aspeed-bmc-amd-onyx.dtb] Error 2
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb@1e780000/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2500-pwm-tacho']
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'aspeed/aspeed-bmc-microsoft-olympus.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-delta-ahe50dc.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-palmetto.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-ast2500-evb.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-quanta-s6q.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-romulus.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-sbp1.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-inspur-fp5280g2.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-minipack.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-mowgli.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-witherspoon.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-vegman-sx20.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-tacoma.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-lanyang.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-vegman-rx20.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-fuji.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-everest.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-bytedance-g220a.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-cmm.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-blueridge-4u.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-asrock-e3c246d4i.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-ast2600-evb-a1.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-amd-onyx.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-supermicro-x11spi.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-vegman-n110.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-vesnin.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-bletchley.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-ast2600-evb.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-inventec-transformers.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-rainier.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-tyan-s8036.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ampere-mtjade.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-asrock-x570d4u.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-yosemite4.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-blueridge.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-inventec-starscream.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-yamp.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-rainier-4u.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-catalina.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-amd-ethanolx.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-bonnell.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-inspur-on5263m5.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ampere-mtjefferson.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-asus-x4tf.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-nicole.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-intel-s2600wf.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-wedge40.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-lenovo-hr855xg2.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-asrock-e3c256d4i.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-lenovo-hr630.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-asrock-romed8hm3.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-quanta-q71l.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-tyan-s7106.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-yosemitev2.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-wedge100.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-elbert.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-amd-daytonax.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ufispace-ncplite.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-opp-zaius.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-portwell-neptune.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ampere-mtmitchell.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-fuji.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-minerva.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-galaxy100.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-harma.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-inspur-nf5280m6.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-wedge400.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-ibm-system1.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-greatlakes.dtb' not remade because of errors.
make: Target 'aspeed/aspeed-bmc-facebook-tiogapass.dtb' not remade because of errors.






