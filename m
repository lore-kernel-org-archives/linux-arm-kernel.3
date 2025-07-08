Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A959C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHqQ6Qvo+VIgnUbpe0z6j47pHudG1wFE2fdrjCnPqko=; b=H1c/fmhbaToQ9mnXLcquP4DTC7
	rBXPv4XvGpIR/LPdNi1cGomGQSKH/8DCaaZXgfhkDcftrSfUlUZ4ZITPw236MaUBHJrKzKPbyntYL
	Hz21+r79/Cru9b+l8prxyE2wfsx1u4XjQ00RdE5f2c1f+K+g6f0N19Haar2wHx7A8DwZkfQjfz3kz
	fv08zSI0qBhTrkBInK4hH699GJBrxc2GQI6ceoBaYstz94CrnWHl7jSR68P5ZVtrwGNiDjDJv4Eed
	I4kGKHS9oyQTEABGakZGu3EDWqwOsWPKTp18EKb7c94FuI2MquBbqbetUFdEYPe6Ct7fM0APdp/2W
	6ZtqrhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8TN-00000005SOq-2fWP;
	Tue, 08 Jul 2025 13:35:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8IK-00000005Pte-16SW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:23:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E56F745767;
	Tue,  8 Jul 2025 13:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23DAC4CEED;
	Tue,  8 Jul 2025 13:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751981015;
	bh=kG5yQ4Z0omO38H0cx6vA3VUsN+la842ikKfx/Pkvzds=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Dvey3kkVvoDRgilLqHRQwtysdmaJHNksaZZaxZOz/Q0SrLBbH7QEMmvl8le3jMbsY
	 DL6R4AapbMHL3yjiiz6WDE6N9QHZbgGA0AQZtBPrda6zWn5w6fqQ2AAL2Od7B/7FIa
	 Pt4Xcta8PVEBtEDyCuQ3MV8R3c8ZsgeWXlyVQ5VfXt7fLJ5hzdxMKm6H0Sl6LvIDS6
	 1KAmOX4zMdaiLHdZGxEUwBpRp5LkmUTaKkZeCI1fVchf7VyG+DpwYMeW3AC0gZ7ryO
	 NveFnIAk7fJQXg8eefGXjFpXQwBGXmM59SA6jvezMlP63kGJIWs//srLaEk6i3n6JA
	 nbKu8iKZI1uNQ==
Date: Tue, 08 Jul 2025 08:23:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: s-vadapalli@ti.com, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, 
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>
To: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <20250708084252.1028191-1-c-vankar@ti.com>
References: <20250708084252.1028191-1-c-vankar@ti.com>
Message-Id: <175198090755.436953.6586253094300469079.robh@kernel.org>
Subject: Re: [PATCH v5 0/4] Add bootph-all property to enable Ethernet boot
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_062336_362066_2C67CE5F 
X-CRM114-Status: GOOD (  17.35  )
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


On Tue, 08 Jul 2025 14:12:48 +0530, Chintan Vankar wrote:
> This series adds bootph-all property to necessary nodes to enable
> ethernet boot support for SK-AM68, AM62P5-SK, J722S, and SK-AM69.
> 
> This series is based on commit '8d6c58332c7a' of linux-next tagged
> next-20250703.
> 
> Link to v4:
> https://lore.kernel.org/r/20250429072644.2400295-1-c-vankar@ti.com/
> 
> Changes from v4 to v5:
> - Updated [PATCH v4 2/2] by adding properties to the respective board
>   files and split [PATCH v4 2/2] for AM62P5-SK and J722S-EVM.
> - Added a new patch to enable Ethernet boot on SK-AM69.
> 
> This series is based on linux-next tagged next-20250428.
> 
> Chintan Vankar (4):
>   arm64: dts: ti: k3-am68-sk-base-board: Add bootph-all property to
>     enable Ethernet boot
>   arm64: dts: ti: k3-am62p5-sk: Add bootph-all property to enable
>     Ethernet boot
>   arm64: dts: ti: k3-j722s-evm: Add bootph-all property to enable
>     Ethernet boot
>   arm64: dts: ti: k3-am69-sk: Add bootph-all property to enable Ethernet
>     boot
> 
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts          |  7 +++++++
>  arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/ti/k3-am69-sk.dts            | 12 ++++++++++++
>  arch/arm64/boot/dts/ti/k3-j722s-evm.dts          |  8 ++++++++
>  4 files changed, 39 insertions(+)
> 
> --
> 2.34.1
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
 Base: tags/next-20250704 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250708084252.1028191-1-c-vankar@ti.com:

arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pinctrl@4301c068 (ti,j7200-padconf): mcu-cpsw-default-pins: 'booph-all' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#






