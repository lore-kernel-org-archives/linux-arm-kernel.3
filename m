Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F302EE0AC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jy0zqFxiGtM8RRIAuefc1cwhUyt5c/DWRun2yfGxJ4s=; b=MI9egfXExnHRkfGaiS2mYqlBpa
	11DIlSGb9XH4xQx9PGkaHmcCOEFeiZpjhONfVNORSAxG1kLdkBOyeWN4z8pt/XE1xAFLZB3e8KR7c
	afJYI/KrsOwc5BU3RMfml6Q4mOJs0Cql9hBOkW6af7wrxZdoeL5I2Ff37an8xDs6jiahAM0zVmsG5
	CHV3Q8HWAiIQXv1MtZziXks70eN7kXIYorfHFQ8jPbd8u/ZYfIElDIxkcFPk8YZyBPoYfETbHu9PH
	7AtS0rocjJKRynESGo1WZpVj1v4+Kf4wNqVvMh/H7P14EdX3RBmO2xKUHQ2Q1mDA68/lzskCAFn5h
	CU5KRNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofyh-0000000CMx2-1IbW;
	Sat, 07 Feb 2026 10:55:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofyg-0000000CMwn-1wdZ;
	Sat, 07 Feb 2026 10:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D40426001A;
	Sat,  7 Feb 2026 10:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071C0C116D0;
	Sat,  7 Feb 2026 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770461748;
	bh=15OiEL02Qm3wXK7Z4IXbHK91DpcRfYb2m3WwtlFNacs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMdeA3gT1N5iwodU4W6zBC6L8CvCTH0sPAYh7cvfqA2s3CxlV3xzh3B4heysU9DNj
	 6weNeDP9In8ZW0QAcBxlr6kY3JlUG+9nxsRfy6kQZl6ruclhTvdU7I50yf5lW/XrIb
	 cZs/TNUmvVl4gVbXRwhKsoh8bkWDTlp7CWzov/w4v722CiXvAQlJ3JnbdmACrXbj6H
	 t3q385uPDcU6icK8OT7w0L5SKJ7Xg/38sbkra+u4tT4hO9HbzoLqnpD0+Ph8k4dqLJ
	 i7e7xuw7H46ODxkTb5indKV6VDZ56A1ZZZPWaG2hMdqCg7YBEOCcBf9VemDm1RdYYs
	 mG8ZuZS9Veagg==
Date: Sat, 7 Feb 2026 11:55:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH 00/11] ARM: rockchip: Add initial RV1103B and Omega4
 board support
Message-ID: <20260207-crocodile-of-eminent-imagination-cc5a5e@quoll>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
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

On Fri, Feb 06, 2026 at 03:12:58PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> This series adds initial support for the Rockchip RV1103B SoC and
> the Omega4 board.
> 
> The goal of this series is to provide the minimal device tree and
> platform support required to boot the Omega4 board into Linux
> userspace with the root filesystem located on SPI NAND.
> 
> The series includes:
> 
>   - Base RV1103B SoC device tree description
>   - Omega4 board device tree
>   - Required pinctrl and clock definitions
>   - Basic peripheral enablement required for boot
> 
> With this series applied, the Omega4 board is able to:
> 
>   - Initialize DRAM
>   - Boot the kernel
>   - Access SPI NAND
>   - Mount the root filesystem from SPI NAND
>   - Reach userspace successfully
> 
> This submission intentionally focuses on minimal bring-up support.
> Additional peripheral enablement and feature support will be
> submitted separately.
> 
> Tested on Omega4 hardware based on the RV1103B SoC.
> 
> Boot verified with root filesystem stored on SPI NAND.
> 
> Fabio Estevam (11):
>   dt-bindings: clock: rockchip: Add RV1103B clock and reset unit
>   dt-bindings: clk: rockchip: Add RV1103B clock header
>   clk: rockchip: Add clock controller for the RV1103B
>   dt-bindings: pinctrl: Add RV1103B pinctrl support
>   pinctrl: rockchip: Add RV1103B pinctrl support
>   dt-bindings: mmc: rockchip-dw-mshc: Add compatible string for R1103B
>   dt-bindings: serial: snps-dw-apb-uart: Add support for RV1103B
>   dt-bindings: soc: rockchip: Add RV1103B IOC and GRF entries
>   ARM: dts: rockchip: Add support for RV1103B
>   dt-bindings: arm: rockchip: Add Onion RV1103B Omega4
>   ARM: dts: rockchip: Add Onion RV1103B Omega4

I don't understand why you combine around 6 different subsystems into
one patchset, especially that there are no dependencies. Only difficult
for maintainers to apply.

Best regards,
Krzysztof


