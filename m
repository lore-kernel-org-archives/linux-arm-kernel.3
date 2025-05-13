Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2097C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hH3wmhIZxD0osaXnIPSs2tsiCIkYF7uD3vrtbYI+QT8=; b=VyGuOyQfP8toHfFq951D/GiGoz
	wd8+vXRJ3SHPcsjqgVGspMSd7cw4IV4UCKTOz1RCrHB6FOFTabBVuMK+44yo+Xo4pA1G5rYyTEo8l
	AhLfEMmg2/eFm1T7+qR1gaBh0bRkNPv1LHTzuqhwVfK3CJgiflqwmg+C5BKniWo+3b790x7NAjMUQ
	Dqb0u0BhMXQ6s/S+r2lUk9tMDyDuhffkyFA2PltG9V3iS6RxxrOvN/CUNcJKFIj39o0wVu6DfrT36
	fKlYx11Doq2LZ5mm1mt34uaDlcTDWzwEMBfukOii27qqoLtiOXcHhOY8UBV0tQmTMeeXSrcbH/9iG
	9t2OlGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsZd-0000000CwEm-3vTX;
	Tue, 13 May 2025 16:33:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsVl-0000000Cvd1-2OO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5D52A4DA2A;
	Tue, 13 May 2025 16:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7DFC4CEEF;
	Tue, 13 May 2025 16:29:44 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id AB3345FEDD;
	Wed, 14 May 2025 00:29:41 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>, 
 Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250505164729.18175-1-andre.przywara@arm.com>
References: <20250505164729.18175-1-andre.przywara@arm.com>
Subject: Re: [PATCH 0/3] arm64: dts: sunxi: Add Liontron H-A133L support
Message-Id: <174715378169.4016543.2717785306714546784.b4-ty@csie.org>
Date: Wed, 14 May 2025 00:29:41 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_092945_674674_7E05A484 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

On Mon, 05 May 2025 17:47:26 +0100, Andre Przywara wrote:
> The Liontron H-A133L is an industrial development board featuring the
> Allwinner A133 SoC.
> Alongside the usual standard connectors like USB and Ethernet ports,
> it contains a number of dedicated JST connectors, to connect external
> peripherals.
> 
> Add support for that board with the usual patch trinity: vendor prefix,
> board name binding, board .dts file.
> 
> [...]

Applied to sunxi/dt-for-6.16 in sunxi/linux.git, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Liontron name
      https://git.kernel.org/sunxi/linux/c/9baa27a2e9fc
[2/3] dt-bindings: arm: sunxi: Add Liontron H-A133L board name
      https://git.kernel.org/sunxi/linux/c/d26382bb852c
[3/3] arm64: dts: allwinner: a100: add Liontron H-A133L board support
      https://git.kernel.org/sunxi/linux/c/b631b0bf7648

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


