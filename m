Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8ABC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCiJjNASPfC7nHO1dIVjLeinNlfDfPHkOG7oc+b74Bo=; b=s6beuh5EYsb0krRAGoZKNCYanG
	ADkNOnUVDaXxLuWNKSXzauFFZA13RAUE1nOct6pdIOtBFfUFHnGlJJW582T5YMJhu2OUOHl2y7PQF
	DBn10ASlUnLmkRN1VFR7hOyDjNwwe6parhKtWqXayuKADmPx8HV1MZK0wrXXUoZtSfiy4CIKDC4lX
	3+E5spm/sZU53mR1Qgsj1rk3vRxMVg+lVA67KeyKMWUUKXVfT/53oEJ3Cj4odQLHU/RPjICSW2dRt
	67vUCiZXNBdbfa/HOCRTh8ZVBKsyCFY6BxGBnpXACotyklkL4CC2hVdqQ6FgkuFcYZfP2UZFtj37S
	d0JyyXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16Cx-0000000AEwS-0yX6;
	Mon, 31 Aug 2026 17:54:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16Cv-0000000AEvx-2oq2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:54:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A56A960120;
	Mon, 31 Aug 2026 17:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595A71F00A3F;
	Mon, 31 Aug 2026 17:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198847;
	bh=FCiJjNASPfC7nHO1dIVjLeinNlfDfPHkOG7oc+b74Bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=auKlPgFFlshtATijbmANWtUaZv3DKZM82nUWI/nK3pEj0HCtMBaJRCx57fjPMR0FM
	 C/Tr3Vyg61QkHzwpNXGxjAaFU+j8tmJcy/JMBC92E5f52OyhtMe7jeTzj1pOjZVBqC
	 dtLB0Af2/5X3a6T8g49fsrTRfNsvDZCYAlPQAkcdLOuP1VVyf+z5Z86F+mQ7V08M/D
	 /phHFX+fkkOmtciV1zvlClkFnKyozqk4ZOeAASidkOsQm14L3nTAkAbBL/5WfjgVdN
	 mCtJD0RDWa1QZ0X8PnXFXMAuP5jPjpteQoK3bi6DOSApW7GuDAK7LfMPhwhPg+fpkM
	 hOBfxek2fpeiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Roger Shimizu <rosh@debian.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays
Date: Mon, 31 Aug 2026 12:53:34 -0500
Message-ID: <178819882984.1411250.4839706998234671556.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 12 Aug 2026 10:22:37 +0800, Hongyang Zhao wrote:
> RUBIK Pi 3 provides two camera connectors but ships without camera
> modules, and each connector can be used with different sensors. Describe
> only the board-level 3.3 V output rail in the base DTS and add optional,
> per-connector overlays for Raspberry Pi Camera Module V2 IMX219 sensors.
> 
> CAM1 is connected to CCI1 and CSIPHY1, while CAM2 is connected to CCI0
> and CSIPHY4. The overlays can be used independently or combined, and the
> Makefile provides composed DTBs for both single-camera configurations and
> the dual-IMX219 configuration.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
      commit: 4e40ef9973f7807599c86e390502f078cebeda37
[2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays
      commit: f3b8fb4fbe7bb040df6d6e21e19dfa72f7d8ccc3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

