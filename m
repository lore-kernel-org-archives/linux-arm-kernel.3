Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C35606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cRXsy+wb;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J2SEk8qa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M/fuZlWUlRDE0Lh3lUCBjyyP9KyWX72NdFXTO/NSKC4=; b=cRXsy+wbV0mdun
	WNFW0GuhKk84XHSOETDXCxzkp6/4JVETB5EZXu1WDOgvyNT9KLrYDGDUFQKG/g+n48KLFm2q0gi7z
	0Zu8wH7EmEK6f360H/+Ae5VjDrmW8K2n/c6vbafCWjEPBw/grQ5zEPR43rJ69TaQwnqYx/OAJ60W7
	eok+/I4XRIZ1o+d4iexbfP8rmLf3HZn0sfhVrXBo6DL5mLIXJBXcYcfisvMganuVCXhDSFKII71Sd
	FrDZtQz1Gbat84txrbzxreIGpCptYPrR6vAiF/MUkuRmAANvDELBtaywp+EmKSw2UsP9W0VhGn65x
	6RLygXV+uID2I/UJi+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7g0-00000001BXN-16pN;
	Tue, 03 Nov 2026 06:07:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7fw-00000001BWb-36Tw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 06:07:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 232834190C;
	Tue,  3 Nov 2026 06:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7EE1F000C1;
	Tue,  3 Nov 2026 06:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793686036;
	bh=M/fuZlWUlRDE0Lh3lUCBjyyP9KyWX72NdFXTO/NSKC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J2SEk8qam3sUllp8KGD+HYkKPSnQKHp1EtFfjmWb0A8axvMCR54+tpVStGeGlvrDs
	 xs2/ngRvEl63JW+mEm8SxGHPHdI6ftjJMCqZ5GYSqJkXLpcNnS+c+TEdibkmDUWYKf
	 m1s5j1XKxT2mZKS5fbBlGJsIZOnD6jM3MPuHpc/+/97elO6H5uAwofXNMaguTV0kO4
	 bX5eV9/L1+UqvwfO/U6O/7ogc5Xp83AbkSjidk0VH1CZCuxsiJSF7oDBwgH3mQnQ54
	 jHBf50KM6Y/3Ejb+rYraR3U93bonoiDFM7wZhoI7Fy6PovOGWH9lqLKe/BrTezKvXi
	 uy5OfTkjAkFxw==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Florian Klink <flokli@flokli.de>
Subject: Re: (subset) [PATCH v2 00/10] Initial Apple Silicon M4 Pro/Max device trees and dt-bindings
Date: Tue,  3 Nov 2026 07:06:43 +0100
Message-ID: <179368585832.109404.17974636706511087891.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 14 Oct 2026 08:56:07 +0200, Yureka Lilian wrote:
> This series adds initial device trees and dt-bindings for the Apple
> Silicon devices using the M4 Pro/Max (t6040/t6041) SoCs.
> 
> This series covers only a minimal amount of hardware, which is useful
> as a basis for future developments. The hardware added here has remained
> largely unchanged between the M3 and M4 generations.
> 
> [...]

Applied to local tree (apple-soc/dt-7.5), thanks!

[02/10] dt-bindings: interrupt-controller: apple,aic2: Add t6041 compatible
        https://github.com/AsahiLinux/linux/commit/b462218dad8d
[03/10] dt-bindings: arm: cpus: Add Apple M4 Pro/Max CPU core compatibles
        https://github.com/AsahiLinux/linux/commit/cfebec7bef0c
[04/10] dt-bindings: arm: power: apple,pmgr-pwrstate: Add t6041 compatible
        https://github.com/AsahiLinux/linux/commit/821772c4bb68
[05/10] dt-bindings: arm: apple: apple,pmgr: Add t6041 compatible
        https://github.com/AsahiLinux/linux/commit/1f26b14c9411
[06/10] dt-bindings: pwm: apple,s5l-fpwm: Add t6041 compatible
        https://github.com/AsahiLinux/linux/commit/4a81348ca70a
[07/10] dt-bindings: pinctrl: apple,pinctrl: Add t6041 compatible
        https://github.com/AsahiLinux/linux/commit/a7ae8c716e00
[08/10] dt-bindings: i2c: apple,i2c: Add t6041 compatible
        https://github.com/AsahiLinux/linux/commit/4fb8e76b7f68
[09/10] dt-bindings: arm: apple: Add M4 Pro/Max based devices
        https://github.com/AsahiLinux/linux/commit/a35db2b38f77
[10/10] arm64: dts: apple: Add minimal t604x (M4 Pro/Max) device trees
        https://github.com/AsahiLinux/linux/commit/7b0c21fc2897

Best regards,
-- 
Sven Peter <sven@kernel.org>


