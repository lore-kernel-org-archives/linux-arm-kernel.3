Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E58C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 18:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DWFVB7+gnqapJ/h7XUs9goC/B2LZQa/R3GJIIRokfY=; b=vJ9yGZHNr4YG6WK3/l9VWj+lcw
	e9l42jsoaNAHuWjjWr3tQ+mztuJ60uW4mITySNz+P/xKWUQ7n2Vg0rr9UVoEuxR9SyzuNf/oFjK2+
	NEtpTNZ+j20wCD2TReQSiRPWyA6g8hnYNIATItjCuhKX0tELwRchYycgX2veai5fMyi0lsmmx7eTz
	xux/jZ6FuPxjlKWaM4nS9vae2dMCO0aJx8sGw8nP9jXEccPycWspgow9jjjqggCh7Nre04FOjevNs
	VIPCUfBqog/sDwFMFYbKR64bcyhHS5vk03EwcPR+Pql+WAzYyYHnLueAXWJxg6s2c+nCtXMsjc1AX
	ld9Sid4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulAp0-00000005tEX-1GU6;
	Sun, 10 Aug 2025 18:31:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulAkG-00000005swb-49CE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 18:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B2246140D;
	Sun, 10 Aug 2025 18:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC488C4CEEB;
	Sun, 10 Aug 2025 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754850372;
	bh=2zwGXhwxWi13w4nSYysw2oa5FejZxpDZAD0f4uYQPXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GlWFNxs6lw9T8Gm49EYpEh52ouUPv13/JA/4lmKZ0BB3cac3L15n1SHc4SwYbHI0r
	 dHxxLcPZfYjeymneVBx2ztn6zZazuFq3i+oo/KhOQGBnvAp9V+4UlpP0uvwRsVNhxW
	 iIT0K6hkQ/NI+xjGhXTHrZYUIDrh7g8I2Xv4aTPu7gyifTMHiqfgVBg3ekE3H4Z13b
	 Qxbj3eSZkw2hEK6JeAvUaRUpVUB56JhZ6Aqnm1MJ23OKSPDNehs58amTM4uxlilEUz
	 f5tpirlHuI8KQqxSlXnd9RssLF/yW6IqVsGTqKCC1zUuyJ3Lalk+cOtj8QPIL9Bcpu
	 pAp9RUuBCAnjA==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] I2C dt nodes and bindings for Apple A7-A11 SoCs
Date: Sun, 10 Aug 2025 20:26:01 +0200
Message-Id: <175485029275.49938.2043201584717247270.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
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

On Tue, 10 Jun 2025 21:45:19 +0800, Nick Chan wrote:
> This series adds the device tree nodes and bindings for I2C on Apple A7-A11
> SoCs, since the existing driver appears to be compatible. The drivers for the
> attached Dialog DA2xxx PMIC will be in a future patch series.
> 
> 

Applied to local tree (apple-soc/dt-6.18), thanks!

[2/9] arm64: dts: apple: s5l8960x: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/68e01988b208
[3/9] arm64: dts: apple: t7000: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/5b1ab37ccc60
[4/9] arm64: dts: apple: t7001: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/a56771d333ed
[5/9] arm64: dts: apple: s800-0-3: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/5bee6cb9d9df
[6/9] arm64: dts: apple: s8001: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/baf703b08374
[7/9] arm64: dts: apple: t8010: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/9f286293541e
[8/9] arm64: dts: apple: t8011: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/1d16ae50cb1b
[9/9] arm64: dts: apple: t8015: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/e1313c2185d2

Best regards,
-- 
Sven Peter <sven@kernel.org>


