Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33810C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 23:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0yJPOkIyDMkiOueFPsF5bkQpszNXu4xSFqMSoCZp0Q=; b=OWmJ32gBuak4yob0pS/3MQ4SIO
	R+/yAAK7G5Wj0uDK1YUpbQ20NtltoV27nWwfTLVIE3y+MkRxEgOY85tZchkWB8Mola8GLKr/pCgKt
	WJ/eqbSz1h1pAFQ3JjKpJOA1qs+Z8nXPfcOlOMsqkw4m3aCyZPdytBe+5TWG/+udUcYopTkgBqzZV
	GzB1qkg8Y21VgiVbwPzjzejbdsrbZZVYGOGt/Ta0byTtk049EIoJPvfR72DczYscYzIQ7buCgPz7P
	l8kgcfwaRVsBp69puJj9mL2Pcu1fDBXJlfiPAfBu8E/A4I9n24ITxbnrAO7KYBCf+DvDyIbNvbn1h
	122kvOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udd9q-0000000FolH-15xu;
	Sun, 20 Jul 2025 23:09:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udd7Q-0000000Fobe-03aK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 23:06:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14644A52791;
	Sun, 20 Jul 2025 23:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D56C4CEE7;
	Sun, 20 Jul 2025 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753052814;
	bh=emHV5RQ/RrniE4MPPCCTB1Pwwx//e94/Z9PsguhmOpk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=B9zY/gPgqMz3F7IdOsfY7DjaSwvImwGVCx00hBMxc2qSLPfvk1fAi35R5xs542RFB
	 5QEoBnPyRx8mdc9CV2+5mXfQnJawpZKHv1/IH6Zz1BtnDfDOzHhDvK0B/AKK8QuoRy
	 rf75S+Yjn86phaTGRruXlelzORPX+iH7doH2yPiq3V9WlnY7m6QNs+cZHADlq3MPnH
	 AlHxgcAUdUbg28hYQ30RLRT+vsajrVO/ESE6l0WAc07OsY259nUHDkCbQl9m/TKl07
	 5DqHNspUf6Wio9bPmX/1mrWdwDchQB4Ii6DqF8qiQ8GD80/Yk9oDDW4jgZGo4HtXQb
	 PYvrRGOcaILqg==
Date: Sun, 20 Jul 2025 18:06:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
Message-Id: <175305254683.3034354.17781723128972055309.robh@kernel.org>
Subject: Re: [PATCH 0/4] STi device-tree display subsystem rework
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_160656_190928_D5244CC7 
X-CRM114-Status: GOOD (  19.09  )
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


On Thu, 17 Jul 2025 21:15:31 +0200, Raphael Gallais-Pou wrote:
> This serie aims to rework the display-subsystem node, which was
> previously included directly within the SoC node.  This was wrong
> because it is an abstraction and describes how IPs behave together, not
> what the hardware is.  Instead, extract display-subsystem outside of the
> SoC node, and let IPs describe their connections.  Doing so helps the
> readability, and eases the understanding of the hardware.
> 
> Several nodes have been renamed to stick to the generic names defined in
> the device-tree specification.
> 
> This series depends on another sent a few days ago.  It is not critical
> though, since not having it only triggers warnings when building
> deprecated device-trees.  Please see link below.
> 
> Link: https://lore.kernel.org/lkml/20250714-sti-rework-v2-0-f4274920858b@gmail.com
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Raphael Gallais-Pou (4):
>       drm/sti: check dma_set_coherent_mask return value
>       drm/sti: make use of drm_of_component_probe
>       ARM: dts: sti: extract display subsystem out of soc
>       ARM: dts: sti: remove useless cells fields
> 
>  arch/arm/boot/dts/st/stih410.dtsi | 316 ++++++++++++++++++++++----------------
>  drivers/gpu/drm/sti/sti_drv.c     |  18 +--
>  2 files changed, 192 insertions(+), 142 deletions(-)
> ---
> base-commit: b9a572f471993d3e8bf874fcb57f331d66650440
> change-id: 20250401-sti-rework-b009551a362c
> 
> Best regards,
> --
> Raphael Gallais-Pou <rgallaispou@gmail.com>
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
 Base: base-commit b9a572f471993d3e8bf874fcb57f331d66650440 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc1-11-g2436e190bbdd (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com:

arch/arm/boot/dts/st/stih410-b2120.dtb: soc (simple-bus): sti-display-subsystem@0: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/display-controller@9d11000: failed to match any schema with compatible: ['st,stih407-compositor']
arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/encoder@8d08000: failed to match any schema with compatible: ['st,stih407-tvout']
arch/arm/boot/dts/st/stih410-b2120.dtb: encoder@8d08000 (st,stih407-tvout): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/hdmi@8d04000: failed to match any schema with compatible: ['st,stih407-hdmi']
arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/display-controller@9d11000: failed to match any schema with compatible: ['st,stih407-compositor']
arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/analog@8d02000: failed to match any schema with compatible: ['st,stih407-hda']
arch/arm/boot/dts/st/stih410-b2120.dtb: /soc/plane@9c00000: failed to match any schema with compatible: ['st,stih407-hqvdp']
arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/encoder@8d08000: failed to match any schema with compatible: ['st,stih407-tvout']
arch/arm/boot/dts/st/stih410-b2260.dtb: encoder@8d08000 (st,stih407-tvout): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/hdmi@8d04000: failed to match any schema with compatible: ['st,stih407-hdmi']
arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/analog@8d02000: failed to match any schema with compatible: ['st,stih407-hda']
arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/plane@9c00000: failed to match any schema with compatible: ['st,stih407-hqvdp']
arch/arm/boot/dts/st/stih410-b2120.dtb: /display-subsystem: failed to match any schema with compatible: ['st,sti-display-subsystem']
arch/arm/boot/dts/st/stih410-b2120.dtb: display-subsystem (st,sti-display-subsystem): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm/boot/dts/st/stih410-b2260.dtb: /display-subsystem: failed to match any schema with compatible: ['st,sti-display-subsystem']
arch/arm/boot/dts/st/stih410-b2260.dtb: display-subsystem (st,sti-display-subsystem): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






