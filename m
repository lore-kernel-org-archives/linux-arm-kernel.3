Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A099CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gre9UR4FONjONwKHgRUr5DGRSLcjn1EybnZAlvLbyak=; b=bwok5eLIhaTntgJXFxoI9CBHTB
	ZUnCo+YFDzgCGAhku73EIKLFm4AEUwSrRY46HUfMPTrIZnxtV46o4J8FXw1v4wJFdk2+jMDJR49y4
	r0jfm8lufiH6KPXv/0b2yk7iGsie/obzlGkNTt0cba5JmOvxanbPXCIjebKqtQNJ38n2wFjAVBroC
	zIVuxNGFu2y0yvoNGBbe342In+t0BTHMy124oq5hl9thu09ZXtjF8sjD3hhayqndsYBbWWhvfgdjx
	CVwaE7kbHgD31JgV+ZYIQjWDvSn7mvkabxIzBGeIVpF+L0Egill9HWdQd3o0FKwb3sDRqbVsTmOeG
	4lUwr2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6W95-000000048Z0-3x4H;
	Wed, 08 Oct 2025 15:32:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6W93-000000048Xd-2z8g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61D2248A8A;
	Wed,  8 Oct 2025 15:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A74C4CEF9;
	Wed,  8 Oct 2025 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759937521;
	bh=6ZyX1kLcLJNXldMegM6HSEKEB5NDJXFXoY077up5ToU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qfdm2Fz11ubxe09xhRTIaDLWoAQKB9VrPp2Bxsevay/2A4m0pDZnQKY85qtpERBKu
	 tVZQyyz5x+w7m7zXQWs+LdbnWOddczRfDpOVmYnZQaagC4y4o+sgX3JpY6zG2AQSap
	 12Y1nw6H8DjC55thOWJISuevZNjugtvXGiWDxtaCoZCUx4xBQY9f9Gd/bQxIDNhkla
	 nRCYsN/MoQxBKzaLdyy2PRl9qKIkOUlRMTNI7wSQ5G0pKwLI8n8863KqCLqnUZ56tH
	 txTcqIHZgPSuF+6fDyDcETHx/CiErx//pMUSyrsJmA5nZemOUFBZflqjgt7eoOOo5O
	 GZ1024/WzyYjQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>, 
 Andreas Kemnade <akemnade@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250917-sy7636-rsrc-v3-1-331237d507a2@kernel.org>
References: <20250917-sy7636-rsrc-v3-1-331237d507a2@kernel.org>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: mfd: sy7636a: Add missing
 gpio pins and supply
Message-Id: <175993751776.2584245.7441294249150226238.b4-ty@kernel.org>
Date: Wed, 08 Oct 2025 16:31:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b87af
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_083201_773746_B2B2F552 
X-CRM114-Status: UNSURE (   9.02  )
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

On Wed, 17 Sep 2025 09:14:29 +0200, Andreas Kemnade wrote:
> To be able to fully describe how the SY7636A is connected to the system,
> add properties for the EN and VCOM_EN pins. To squeeze out every bit
> of unused current, in many devices it is possible to power off the
> complete chip. Add an input regulator to allow that.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins and supply
      commit: 7d983e997cb53d4c48b61b105163c31c92a35823

--
Lee Jones [李琼斯]


