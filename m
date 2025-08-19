Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D7ACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z961Vdbeb8dJroetqwaRhJqF0J1N2lBZQhqZ5tgs2aI=; b=ihsW6XQv2lJaK55M1g92C9H0p+
	DRT1rN9fPfP/5T9HNib7LANcKDP8TFxAaHj288yaYxZpxH6IS0Sv/LqCaeHfTNSvTXoKiBqS+6kTp
	hRH4GCH3JqgyYrrRT9VhCHAfyRCkJ3REGyNQuupEdXPBNSjbwivv5vFpYn96k4Uldarncg0BfXMot
	6HQZEiw5jz9lFsOJnm2estnp9YuW+TzaVXzupKCH/ekuVKimPd1iAUwNnsVWFlFhh3XvLDaSQOfLq
	liqW5Azejit2it/0v+K0GMipKrNNI363eugUP+GBoENNpkhXhe2Bx8V5bjw4tXVWzWvr/e4NUnXPr
	s0cFzdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQxZ-0000000BHKu-3Afc;
	Tue, 19 Aug 2025 18:21:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOAL-0000000Asjs-1PxV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 15:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3B3B4592B;
	Tue, 19 Aug 2025 15:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901CEC4CEF1;
	Tue, 19 Aug 2025 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755616944;
	bh=Rz8fa5qMLAhdiq+ZkBx9/eGxPhzWcb2M5/+N2MOWSAs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ju0NDliLS0nWdi/es0O77LLC44TZ9ZJKgJqV+IOpgC7jMTUdAt1Qt5Q7/ZUu8P/1s
	 tE8cGEe5EeDiWx/C+2ndbQUqqezSUHqIylbLiMlUWH6IA2XZhIHQuOWHDOwGkSm0Q3
	 iOSC/pcNasGRoV4NoCIkymxX0AYjCqJtIrLcmIR1WHel2L177AJsM68+8pnFOHwJBz
	 KF7JI4mfd7e9kxeL7QcAdkkXrDPFeTJ9sGlO0eQGSnMYVs4siWDPHAPP/NHXkwR9bB
	 s//05ZNWpo04Fw5K9j9KS+J/SaD+Tb5MMUG1oqj9tKMwjFI9xaDVPrkMdxVTgwFsp8
	 7r7eqxhvz32AA==
Date: Tue, 19 Aug 2025 10:22:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Will Deacon <will@kernel.org>, 
 kernel-team@android.com, Catalin Marinas <catalin.marinas@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
 willmcvicker@google.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
Message-Id: <175561687189.581847.11419028447160198230.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: exynos: gs101: add cpufreq support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_082225_415716_B8DC2E05 
X-CRM114-Status: GOOD (  15.56  )
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


On Tue, 19 Aug 2025 12:10:19 +0000, Tudor Ambarus wrote:
> Define the CPU clocks and OPPs.
> 
> Bindings for the "google,gs101-acpm-dvfs-clocks" compatible are sent at:
> https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/T/#me3cbe2a97485d19eaf505ad23202f20a21305dd8
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Tudor Ambarus (3):
>       arm64: dts: exynos: gs101: add google,gs101-acpm-dvfs-clocks
>       arm64: dts: exynos: gs101: add CPU clocks
>       arm64: dts: exynos: gs101: add OPPs
> 
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 288 +++++++++++++++++++++++++++
>  1 file changed, 288 insertions(+)
> ---
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> change-id: 20250819-acpm-dvfs-dt-06bc794bdccd
> 
> Best regards,
> --
> Tudor Ambarus <tudor.ambarus@linaro.org>
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
 Base: using specified base-commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org:

Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.32-33 Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.32-33 syntax errorsyntax error
FATAL ERROR: FATAL ERROR: Unable to parse input tree
Unable to parse input tree
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-raven.dtb] Error 1
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb] Error 1
make[3]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-raven.dtb' not remade because of errors.
make[3]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-raven.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: exynos/google/gs101-raven.dtb] Error 2
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: exynos/google/gs101-oriole.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos2200-g0s.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-on7xelte.dtb' not remade because of errors.
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
make: Target 'exynos/exynos7870-a2corelte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-j6lte.dtb' not remade because of errors.






