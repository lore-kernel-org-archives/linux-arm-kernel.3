Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEC3C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51EMtevrUG1D9D9EfhF610YpA1FxHIla4v/BzSVZ7lM=; b=xyss5nx1ae/YySsLW43oMSbZYO
	SJpIFTd1UUP2pNNYVf8izX29K/dpBOrNbaEBxEuxg1m85RfBwQx+c75qOzuoYPj2GVyQmA0aJTLen
	iC6kPVNUvIjxUDZigkE1yk8IV7ixMTJdmFlzjc6fwfxDodtoWKxf+nFwqdvVr2JTq2QU4Dy1FRam9
	Cv6VkwnPfouBx7eTozIK5LPXioq9+0vCVmOrv31ADb7VG/RSKo8gWF9nBVZKVrARfIL+6mCQSTW8Y
	o10zJu9qJr+721eEUXmDZ18cIzJmeH/VciQxusVRyMexE2UNJ0GyxShw03/5gLJnVdMxMYUyj2uY6
	hIxAT17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidoy-0000000CCbt-3Csw;
	Thu, 13 Feb 2025 18:20:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticv2-0000000BzfY-09sK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:22:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 122B1A42813;
	Thu, 13 Feb 2025 17:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBAEC4CEE5;
	Thu, 13 Feb 2025 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739467351;
	bh=S0OhMDWIGff52utNObwPzkVUWW6web7D0hUEz9SRg7I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FH16R/H28sbPKn7EPgQPJsfz+nmj0y3nzBbR0EjMfaCwbetXv0ivK1A13IlWN4KYn
	 xxh3mjPC0v273p7AuQPftFcvd8uxlNddFF8xf+N6cwk+/Wa22aeIXWXylmbbz+3k+1
	 V4rf78TrK2EGyVh8M+OWZ105e0mtLiRIuntBfBvii2sqzsJ3PoBVxhwQrtzHVHyuEe
	 DFT9W2L+P2eBWhOZMeCIuA8ryD97qx9iHlWx/vDPxYRiJqEG0HiQNHEPLQCzxJeycx
	 QfmCplKmvyQI3L6/Q8R4xYTb2NFl637T3OBXR6MlUmQiLMzJtQlUN5bioH6BPvt9ir
	 cucz4MO8FK2aQ==
Date: Thu, 13 Feb 2025 11:22:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 conor+dt@kernel.org
To: Denzeel Oliva <wachiturroxd150@gmail.com>
In-Reply-To: <20250213000226.277-1-wachiturroxd150@gmail.com>
References: <20250213000226.277-1-wachiturroxd150@gmail.com>
Message-Id: <173946704422.3328564.13834631635241088489.robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: exynos: r8s: enable UART interfaces and
 aliases
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_092232_201049_CBE69F55 
X-CRM114-Status: GOOD (  10.42  )
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


On Thu, 13 Feb 2025 00:02:26 +0000, Denzeel Oliva wrote:
>  - usi_uart: Main UART interface, required for debugging or
>    communication.
>  - usi_bt_uart: UART interface for Bluetooth connectivity.
>  - Added serial0 and serial1 aliases for standard UART access.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250213000226.277-1-wachiturroxd150@gmail.com:

Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:122.1-10 Label or path usi_uart not found
Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:127.1-10 Label or path serial_0 not found
Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:131.1-13 Label or path usi_bt_uart not found
Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:136.1-10 Label or path serial_1 not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos990-r8s.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos990-r8s.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos990-r8s.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-raven.dtb' not remade because of errors.
make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.






