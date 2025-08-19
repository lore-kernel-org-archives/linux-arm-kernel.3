Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB02CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY+pmCEZ4BseQcAtT0lo+d3XV7DAYvHCQKS87G4OYns=; b=H9r1w1ngrggAnuBTvTedjr4uiU
	KFbiYdPM6NGh9sQHiErIbs1E8Wu4g6HYYg2uQ12FM7WT6shk9qXyATvvyGBkWASZOpGm0GoqO0iAa
	W6luHcs+9j9Puy4shbjta71fRrQ5xIg38DuhoQV1lustj7rSJAu4YXihqgqqmfYB21NgAg9iqKHhh
	CgQX6+x0GkkcbxOynvlDVRgmJjrlcf/gUqtyuey37ZKj4ciow3kic6nHtjB8L5K2aAzwaQXcFmpMb
	lFFFKLjqdRj2Z7FoSRe0u+WYH8fHRfQ2yY20CIQWG4ppjrFYkhaSNYXLiEaXx6VvkTWH+/0jaYSSB
	hWMRaHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpS-0000000BBxP-1Jif;
	Tue, 19 Aug 2025 18:13:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoM6B-0000000AXbR-04Ze;
	Tue, 19 Aug 2025 13:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68B915C62C1;
	Tue, 19 Aug 2025 13:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE989C4CEF1;
	Tue, 19 Aug 2025 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755608998;
	bh=E1BLflhyQ7I1LUYGycth1dtZtOlNawl3tkX+hNmK0Ds=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RpTlbwPjd2AfZzq1dNUXOkwVyn2rjFHjB++s9KXafqnqPBfrq22M9J8l8/Na6KF/H
	 Vkdz9HIqZY1VoNCv2dBIgEKPVDHFMQ4lBIb7MbD2nqomuEH22YgKYbnT9sciVwmqmc
	 6g5QnR+L9N/qdrT2hTgQ3ghkNDllfFDt38f9nhXMsiAU14pKYcdR/oFqZLEDIQZ+5l
	 DH675kdKYlFEKkbQ2BCEwGMxzgkjfYJYRWIO4X7iZ7GHwmaQGCF1FriTNiRoSjYwjI
	 WCYTcAHdrp+Al4v2eueHybxPnIkpQ9RCU50mP5tSfmdUzU4ABr5IEJp/eVZ9oslY8C
	 FcTgVEcfTiu/A==
Date: Tue, 19 Aug 2025 08:09:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20250818185337.2584590-1-heiko@sntech.de>
References: <20250818185337.2584590-1-heiko@sntech.de>
Message-Id: <175560761476.43549.1950103149360296253.robh@kernel.org>
Subject: Re: [PATCH 0/2] Describe the nvmem provided by the Qnap MCU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_060959_091933_0C389EB3 
X-CRM114-Status: GOOD (  13.68  )
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


On Mon, 18 Aug 2025 20:53:35 +0200, Heiko Stuebner wrote:
> Describe the nvmem-cells found inside the MCU of Qnap RK3568-based NAS
> devices. And move the cpu thermal node to its correct position.
> 
> 
> Heiko Stuebner (2):
>   arm64: dts: rockchip: move cpu_thermal node to the correct position
>   arm64: dts: rockchip: describe mcu eeprom cells on rk3568-ts433
> 
>  .../boot/dts/rockchip/rk3568-qnap-ts433.dts   | 158 ++++++++++++------
>  1 file changed, 110 insertions(+), 48 deletions(-)
> 
> --
> 2.47.2
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
 Base: tags/next-20250818 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250818185337.2584590-1-heiko@sntech.de:

arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: mcu (qnap,ts433-mcu): 'nvmem-layout' does not match any of the regexes: '^fan-[0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/qnap,ts433-mcu.yaml#






