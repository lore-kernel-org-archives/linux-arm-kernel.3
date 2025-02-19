Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D86C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 00:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5nVBNyMvoi0KxIJeCFo+hLIKx4it6WBKHj67ikmQpA=; b=y3f2LfSl66i6vF0pEcUWLigojd
	/C1SvXUVH4Vs66c7HVDeFSoNBLyECHwivqU4M3F5sBFF9KuPTOuwYDc/7HcIxZsXc4+N2fqo5tUxW
	aTX5Px6cPxn2NZ/CYoGinzmDRm+BbiP5KYx1HPiv0v5ICkUHJMRQAjEIAFMlhhWH8umhXyVxMnymN
	MrXLv+gh43D0Z3oVy41jjV6RSVuDQy3s5pLo7dYZD7mS0Lzk/4yLCTAq86xKkk5iHVuBsRlK9QJtq
	6p2yO2J/OJrO4L8iLsqw37upm/iDHuMNOEwzxBAdzUcQjrguXLXuZsij+ux33hcgxvC7cbAqyUf/e
	PJ1HjQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYJ3-0000000APk2-1XVE;
	Wed, 19 Feb 2025 00:51:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYAR-0000000ANnT-1RKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 00:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86DA55C5CAB;
	Wed, 19 Feb 2025 00:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFAFC4CEEC;
	Wed, 19 Feb 2025 00:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925742;
	bh=9unwMkTo5UzoNGzJpdWJnYAWLU/BdNqcqKXaLoMLxPY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QDtpfjec+UbdsvZgwOPX2TIRpWCkD+eEOCskMLvCj+QA1av3cxtOrpadPyroDfI7p
	 WeHeEZH5r/cE0RT9cdDGYQdf4y0Q5s/tUDiaHMFx+Yu0goDplFJ8n7b7o2bccsj+3K
	 1fxadS+JuqKQHGVDTZ1an60l4xDF/yDme1b6x8h6YifQR6NLAjk90eM78sL1OoJb7F
	 gAAI7zGkZTFNZaY4+Kdb2OY8t7UKB+X4VVbF0jFeejPcPd76720kYUNOjN2cZGNTfi
	 9R0uMZcUFiS3a5nCEp42AHG1s5mBV8qOotxILzU8TB59bjYonQjEpM/uiow0IkGsZl
	 d99CrK7nS5UPw==
Date: Tue, 18 Feb 2025 18:42:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
References: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
Message-Id: <173992516472.2065416.7202033506643575073.robh@kernel.org>
Subject: Re: [PATCH 0/5] Add watchdog and USB nodes for the Exynos990 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_164223_494751_73E3C25C 
X-CRM114-Status: GOOD (  21.28  )
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


On Mon, 17 Feb 2025 22:32:02 +0100, Igor Belwon wrote:
> Hi all!
> 
> This series adds the nodes to enable the watchdog and USB support for
> the Exynos990 SoC.
> 
> The watchdog consists of two clusters (cl0 and cl2). Unsure why Samsung has
> skipped cl1 on this SoC. Both are enabled and working - tested on a
> device from the -x1s family.
> 
> The USB controller of this SoC supports full-speed, high-speed and
> super-speed operation modes. Due to my inability to get any of my
> Exynos990 devices to enumerate as super-speed (even under the vendor
> kernels) only the UTMI+ setup is done - as such, only the high-speed
> mode is enabled. Dummy regulators are used in place of PMIC provided
> ones until we implement PMIC.
> 
> This series depends on the following series:
> - Watchdog commit: https://lore.kernel.org/all/20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org
> - USB commits:
> 	- https://lore.kernel.org/all/20250217-exynos990-bindings-usb3-v2-1-3b3f0809f4fb@mentallysanemainliners.org/
> 	- https://lore.kernel.org/all/20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org/
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
> Igor Belwon (5):
>       arm64: dts: exynos990: Enable watchdog timer
>       arm64: dts: exynos990: Add USB nodes
>       arm64: dts: exynos990-x1s-common: Enable USB
>       arm64: dts: exynos990-c1s: Enable USB
>       arm64: dts: exynos990-r8s: Enable USB
> 
>  arch/arm64/boot/dts/exynos/exynos990-c1s.dts       | 16 +++++++
>  arch/arm64/boot/dts/exynos/exynos990-r8s.dts       | 16 +++++++
>  .../boot/dts/exynos/exynos990-x1s-common.dtsi      | 16 +++++++
>  arch/arm64/boot/dts/exynos/exynos990.dtsi          | 55 ++++++++++++++++++++++
>  4 files changed, 103 insertions(+)
> ---
> base-commit: 783ef70f458b28640a63dda599ae8628c3c7aa2e
> change-id: 20250217-exynos990-dt-changes-febuary-fbc184e8049d
> 
> Best regards,
> --
> Igor Belwon <igor.belwon@mentallysanemainliners.org>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org:

arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/watchdog@10050000: failed to match any schema with compatible: ['samsung,exynos990-wdt']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/watchdog@10050000: failed to match any schema with compatible: ['samsung,exynos990-wdt']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/watchdog@10060000: failed to match any schema with compatible: ['samsung,exynos990-wdt']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/watchdog@10060000: failed to match any schema with compatible: ['samsung,exynos990-wdt']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/watchdog@10050000: failed to match any schema with compatible: ['samsung,exynos990-wdt']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/watchdog@10050000: failed to match any schema with compatible: ['samsung,exynos990-wdt']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/watchdog@10060000: failed to match any schema with compatible: ['samsung,exynos990-wdt']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/watchdog@10060000: failed to match any schema with compatible: ['samsung,exynos990-wdt']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usb@10e00000: compatible:0: 'samsung,exynos990-dwusb3' is not one of ['google,gs101-dwusb3', 'samsung,exynos5250-dwusb3', 'samsung,exynos5433-dwusb3', 'samsung,exynos7-dwusb3', 'samsung,exynos850-dwusb3']
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usb@10e00000: compatible: ['samsung,exynos990-dwusb3', 'samsung,exynos850-dwusb3'] is too long
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usb@10e00000: failed to match any schema with compatible: ['samsung,exynos990-dwusb3', 'samsung,exynos850-dwusb3']
arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/phy@10c00000: failed to match any schema with compatible: ['samsung,exynos990-usbdrd-phy']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usb@10e00000: compatible:0: 'samsung,exynos990-dwusb3' is not one of ['google,gs101-dwusb3', 'samsung,exynos5250-dwusb3', 'samsung,exynos5433-dwusb3', 'samsung,exynos7-dwusb3', 'samsung,exynos850-dwusb3']
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usb@10e00000: compatible: ['samsung,exynos990-dwusb3', 'samsung,exynos850-dwusb3'] is too long
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usb@10e00000: failed to match any schema with compatible: ['samsung,exynos990-dwusb3', 'samsung,exynos850-dwusb3']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usb@10e00000: compatible:0: 'samsung,exynos990-dwusb3' is not one of ['google,gs101-dwusb3', 'samsung,exynos5250-dwusb3', 'samsung,exynos5433-dwusb3', 'samsung,exynos7-dwusb3', 'samsung,exynos850-dwusb3']
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usb@10e00000: compatible: ['samsung,exynos990-dwusb3', 'samsung,exynos850-dwusb3'] is too long
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/phy@10c00000: failed to match any schema with compatible: ['samsung,exynos990-usbdrd-phy']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usb@10e00000: compatible:0: 'samsung,exynos990-dwusb3' is not one of ['google,gs101-dwusb3', 'samsung,exynos5250-dwusb3', 'samsung,exynos5433-dwusb3', 'samsung,exynos7-dwusb3', 'samsung,exynos850-dwusb3']
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usb@10e00000: compatible: ['samsung,exynos990-dwusb3', 'samsung,exynos850-dwusb3'] is too long
	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usb@10e00000: failed to match any schema with compatible: ['samsung,exynos990-dwusb3', 'samsung,exynos850-dwusb3']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usb@10e00000: failed to match any schema with compatible: ['samsung,exynos990-dwusb3', 'samsung,exynos850-dwusb3']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/phy@10c00000: failed to match any schema with compatible: ['samsung,exynos990-usbdrd-phy']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/phy@10c00000: failed to match any schema with compatible: ['samsung,exynos990-usbdrd-phy']






