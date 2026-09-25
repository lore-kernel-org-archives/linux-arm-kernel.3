Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1B5C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/7V9ZWZkMokG7CJ9aBSYknLa+Ei+QcS2Lclf77fH7E=; b=gSj4t7c3Zymx2ejJf1kE4efJWy
	wZqziMcpVRnCPSjXN0/tukSldqZBL0fY4CtLGSRrTpVmEQcW2COVRtfu6CTdiPlVoGX6YitSje0+e
	WRcNdDm/rcIVR/zTNQqEZkNrhU++W42bFBK7Or3getw2Wup7dkvvnCo/eEW+53jLXRt5gV8DtdLaS
	s9A2gotLYcn48iBQ+dEuy3Kgm12AMzhfs2I4DxB+r/b/L39AbTnLP1ZiSMv/S/qSTO+3RavUH33aP
	UPJUxKQZtgV5QG+eOERx4gEdxrJFvFQ2XdL7IAOR6BbfRpNm5c5bXo0nq9MSW+aVdY0hi/OfSIVSv
	NvK8PgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAD5i-0000000ESR5-1ivS;
	Fri, 25 Sep 2026 21:04:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAD5g-0000000ESQe-10bF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:04:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54DF360136;
	Fri, 25 Sep 2026 21:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B94C1F000FF;
	Fri, 25 Sep 2026 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790370259;
	bh=f/7V9ZWZkMokG7CJ9aBSYknLa+Ei+QcS2Lclf77fH7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CfSfEEKhUZk9XSt5q+z3lsaqtaersmxd+9WaBNJCoZzvYFEmCewDa8ufauCzlsDSH
	 iNhV+KSUPfBmtgobpItQthF4nvB1Qddw8OAV/Z9gelXDRP5NrpuUzm+78wAB5eFrd4
	 grAV7C2hg8B3kRW4YZa2eWgLu3rwPUofkEvktGHPMP6aXoCWKcst2UrKTEIDo9jbm6
	 YO50RNqD7IvfH9shdDMIcA8X2m5B7ZN7utJuwueDHt7FCI6bZDIvGNzRDQutd9YdRa
	 rJsu3OUMvIc0Jj4iPH89Af9NgarTBh+rnoNt125SZAsDNRd1Y8xxsrzUpgy9B0Udaw
	 jqRP2C2CMoofQ==
From: Sven Peter <sven@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/7] Initial Apple Silicon A18 Pro device trees and dt-bindings
Date: Fri, 25 Sep 2026 23:04:00 +0200
Message-ID: <179037002764.105455.15409082344174622046.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
References: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
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

On Thu, 24 Sep 2026 16:17:04 +0200, Yureka Lilian wrote:
> This series adds initial device trees and dt-bindings for the A18 Pro
> (t8140) SoC and the MacBook Neo (the only Mac using this SoC).
> It only covers a minimal amount of hardware, but is nontheless useful
> for further development work. The hardware added here has remained
> largely unchanged from the earlier generation Apple Silicon Macs.
> 
> Similar to the M4 devices, changes to the m1n1 bootloader are required
> to boot Linux on the MacBook Neo.
> Also, SMP boot depends on further patches to avoid WFI and WFIT
> instructions [1][2].
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.4), thanks!

[1/7] dt-bindings: arm: cpus: Add Apple A18 Pro CPU core compatibles
      https://github.com/AsahiLinux/linux/commit/9e70c02c5536
[2/7] dt-bindings: arm: apple: apple,pmgr: Add t8140 compatible
      https://github.com/AsahiLinux/linux/commit/4eb4d9efe290
[3/7] dt-bindings: arm: power: apple,pmgr-pwrstate: Add t8140 compatible
      https://github.com/AsahiLinux/linux/commit/16c4ea7772d1
[4/7] dt-bindings: interrupt-controller: apple,aic2: Add t8140 compatible
      https://github.com/AsahiLinux/linux/commit/c47142fd192f
[6/7] dt-bindings: arm: apple: Add A18 Pro based devices
      https://github.com/AsahiLinux/linux/commit/a1baa6329a3d
[7/7] arm64: dts: apple: Add minimal MacBook Neo device tree
      https://github.com/AsahiLinux/linux/commit/ccf16d328c35

Best regards,
-- 
Sven Peter <sven@kernel.org>


