Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E683CC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 23:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IxALybYwUKWHWmP+pm+ZrVLIqC1Bo/xICvJMdrBxmA=; b=VHY0iMW9Xe+Nq8XyYhCZWUuP8w
	qInajVnuqmFZLN049i7jpPk2ubr2gj+fOrmtQJz2bzT1jIql69IH2eDgJqCItVwe+qGnZRQA5ho2Z
	cuLh1sEat5K5SMM0DUUSVLc2dczmhWQLvaNyJPSOSva1WAfqWnH5dVichuRpmVzFGjAcs7TE3ck76
	zLPucvGfhkj0/oIxvjD/+rn2QotsrxTgusYHxwX/GW0bKnCx7MqEY1BGs4LC4lKsIxafIxwSBTHs3
	UHtjl4yQyUAkFivasFfbucZs9z2cPTkUL+LYZXBzQMH0qc5FaZcfaJblHmGU74lMzFBwKjysnvFxA
	jrV8PFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcRL-00000004ab3-0xFE;
	Thu, 31 Jul 2025 23:11:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcOm-00000004aOF-2kDp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 23:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BC4561132;
	Thu, 31 Jul 2025 23:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67A3C4CEF4;
	Thu, 31 Jul 2025 23:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754003359;
	bh=YqRSlAt7WN/xNNWKo7aGLNNxJ4KOaokDg2AQCgMVt7w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j1gbCsJSpCt44tL3bNNgXlu94UG9AyBvz9GyWFRDcyS2xS3cNFAs/qyp6c09sEZN1
	 keN7YSiboakqUIZwk7vaAworQPl/VoOr8lr4UsMFUJ80l3LA8DIReIV50cQqGvPWXp
	 E1cqwB4LRH/hRFamALu26o64MUfkndNsbMnQquGypxPPEsEbpAEZlIzV2bs6r9GY0m
	 uX26CLOKlEEvahI/O4jBDdE2aNvQFjxvHOxZdBn2qBjiZYZ0budDYJg0p0ShhSk86c
	 C9eMOTUWQLaHHE2lwvhwo6zeMRqwdenThbi4x831iBby+wjqDynHyvLA3dRw9mmGRz
	 pPqVswV1DGQOw==
Date: Thu, 31 Jul 2025 18:09:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
 Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Darren Etheridge <detheridge@ti.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>
To: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20250731221622.2187892-1-b-brnich@ti.com>
References: <20250731221622.2187892-1-b-brnich@ti.com>
Message-Id: <175400322420.2681610.16971695466089884745.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
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


On Thu, 31 Jul 2025 17:16:22 -0500, Brandon Brnich wrote:
> This adds the node for E5010 JPEG Encoder. E5010 is a stateful JPEG Encoder
> present in J722s SoC, supporting baseline encoding of semiplanar based
> YUV420 and YUV422 raw video formats to JPEG encoding, with resolutions
> supported from 64x64 to 8kx8k.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
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
 Base: tags/next-20250729 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250731221622.2187892-1-b-brnich@ti.com:

arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: e5010@fd20000 (img,e5010-jpeg-enc): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc.yaml#
arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: e5010@fd20000 (img,e5010-jpeg-enc): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc.yaml#






