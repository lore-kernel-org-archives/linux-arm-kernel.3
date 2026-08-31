Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C76C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMpGKzLtEyNcCRVx8mHNOB6Q4YD3ZVD6yfJwV9Ggd9I=; b=Bg1Y/7o5PZpefjSkAZ0u1nEYj5
	wOwQa7CaWjAqJRY2CE8IZHIK7ozlh3tjCVpLpLk5ZpUGny5ftUsp3k5c+fM37iEA4QkF1ZYGLQK3H
	dgzEb6+QWaPPZt4qh/2BJb+arQB4bVHe3qJHbsfNUZFLeawQtWmxXvZt3ILKLOH50voHGBNi6DRqf
	j0zBxrrmrdSFckJjeer5X46ImKkUfIql7iZZjThAvF+E30Q7Kmo/CGJvlAP2shFAecEHdkTAWfGMd
	EosZyYS6HarH/n/nXZT7or8FTdsy0hnnIroO2gXX0Vau1shYb88Gighg7ntVXryt1qqPqONov3lVa
	qhjDK7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13B9-00000009ejA-2dbW;
	Mon, 31 Aug 2026 14:40:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13B7-00000009eiZ-0EaI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:40:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13E58601DE;
	Mon, 31 Aug 2026 14:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853881F000E9;
	Mon, 31 Aug 2026 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788187203;
	bh=yMpGKzLtEyNcCRVx8mHNOB6Q4YD3ZVD6yfJwV9Ggd9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KM8DaxTDZU+seS1CP7yk4Spfvw2SF9Cz52bCXjTTDovAqR/DJUvxLyzM1GeKFe6p0
	 G8iDHxy89iB3DdgJD+QTsLOaFhmLnPClXer0fin6IoF8/PZNWaBprknu/XO3Lx5B+s
	 E+I7WmVpLF1lj71bXdfwvaGsFTW1vxs81AoARn+2IFbH2VeimlxFGixyAwtvzDXm0Q
	 khHHJRt4VFbBHmYUwgeBIyJfjaB+OYmQoFuw+Ul3o2RIbx7u/UB4IKbA+BDe/oHsfW
	 S8sgDBwgy4upUauqZ4Uic8X92EkBRfj4wqqmUBsyIRlAKHG6IUZJFHA/ma86L5X7VI
	 P5/+P1L0CWNyA==
From: Sven Peter <sven@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/9] Initial Apple Silicon M4 device trees and dt-bindings
Date: Mon, 31 Aug 2026 16:39:42 +0200
Message-ID: <178818713424.102394.1070287458177331117.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
References: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
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

On Tue, 11 Aug 2026 21:36:53 +0200, Yureka Lilian wrote:
> This series adds initial device trees and dt-bindings for the Apple
> Silicon devices using the M4 (t8132) SoC. For the most part it mirrors
> Janne's M3 (t8122) bringup series as it was merged in the 7.2 cycle.
> 
> This series covers only a minimal amount of hardware, which is useful
> as a basis for future developments. The hardware added here has remained
> largely unchanged between the M3 and M4 generations.
> 
> [...]

Applied to local tree (apple-soc/dt-7.4), thanks!

[1/9] dt-bindings: arm: cpus: Add Apple M4 CPU core compatibles
      https://github.com/AsahiLinux/linux/commit/4be8659603b0
[2/9] dt-bindings: interrupt-controller: apple,aic2: Add apple,t8132 compatible
      https://github.com/AsahiLinux/linux/commit/1a8b7a1131af
[3/9] dt-bindings: arm: apple: apple,pmgr: Add t8132 compatible
      https://github.com/AsahiLinux/linux/commit/f8805ac96c9b
[4/9] dt-bindings: power: apple,pmgr-pwrstate: Add t8132 compatible
      https://github.com/AsahiLinux/linux/commit/bda617ad4171
[5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8132 compatible
      https://github.com/AsahiLinux/linux/commit/7d0c3b4c41e2
[6/9] dt-bindings: i2c: apple,i2c: Add t8132 compatible
      https://github.com/AsahiLinux/linux/commit/12672a9c9180
[7/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8132 compatible
      https://github.com/AsahiLinux/linux/commit/a581a2343c45
[8/9] dt-bindings: arm: apple: Add M4 based devices
      https://github.com/AsahiLinux/linux/commit/e23d2b23739e
[9/9] arm64: dts: apple: Add minimal t8132 (M4) device trees
      https://github.com/AsahiLinux/linux/commit/23850378ade7

Best regards,
-- 
Sven Peter <sven@kernel.org>


