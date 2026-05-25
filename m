Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0596CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skzTssuwru7jF3TpsgIsQPJu8IbIuLMfcBBNvTemjVE=; b=tI2viLtUEvqlyV+RPzLDbjcRTn
	s1eiOheIfNbiak1Ojo6Hy4VpUEas5mNHYR58s8V6+DeM1MIwZVeipVkAPSO3nhGTwDtWpKRF57sSc
	mYvSZp9eW0BHHOq/lPwNN7XZ4x5tFhNACR84b0aYEsDYeRFYUh8tGYMUxiSge8qATErvEjk6qQ3Zz
	BYMFRmfb++KMSmFC6sYABAu3gcnan52sL/bTyZz/q2+AxuncFqucKoO7TYLCXwNNHN5XQOvR8GmtD
	7sRBCycdHhRvCzEZXu3Cn8trxETBO27kbGktddt2ThraXWSpEvdBwz3uCZLUlx2CBVRjz9Uu9MK9b
	kxlHarfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRZY-0000000GoMc-3Aez;
	Mon, 25 May 2026 09:26:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRZX-0000000GoLw-1Sdp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:26:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 724AB600BB;
	Mon, 25 May 2026 09:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A02E1F000E9;
	Mon, 25 May 2026 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701166;
	bh=skzTssuwru7jF3TpsgIsQPJu8IbIuLMfcBBNvTemjVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H7H8MfXDgcg2czwLwQhZFCL2kqMjRCt9tXoVzp4zeEDmKAYkQrEXUVc2JEUW2iIjK
	 Vuzy3H5k3Lla3w9XIbEjkEw8EIAEUxPr9Ik+YywZqcE3XvMlv0kK6kyA9tTXjno7ax
	 YZGG6k95KRRS3MHsk0avHWKKMJA+wHrlHeDeeYtuBWyv+l8X9+TDVPr8HJxWx+TXLZ
	 DzQ4fKJC3n1V0kfuXrlqZ9kmDUuSBoEywRGAyrWlR1QAL/PvGbajSvlG5VuW6KgYe8
	 Pg9qRoSl+NV2ibriujglyE7gRvcEXZwZx+fG2cs5PIfYpf+TQ44LxUg/jTMrE4RZvv
	 Sdbjhi2TLVoxQ==
From: Sven Peter <sven@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Michael Reeves <michael.reeves077@gmail.com>
Subject: Re: (subset) [PATCH v3 0/5] Initial Apple silicon M3 device trees and dt-bindings
Date: Mon, 25 May 2026 11:25:48 +0200
Message-ID: <177970089799.4336.5106410094266979561.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
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

On Thu, 07 May 2026 09:33:06 +0200, Janne Grunau wrote:
> Hej,
> 
> This series adds initial device trees for M3 Apple silicon devices. The
> device trees contain only a minimal set of hardware not going much
> beyond the minimum required for booting kernel and initramfs and
> verify via serial console that the hardware and drivers work.
> The hardware with the exception of the interrupt controller is
> compatible with the M1 and M2 SoCs and the existing drivers.
> `make dtbs_check` depends on the already applied and dropped apple,i2c
> and apple,pmgr dt-binding changes.
> The watchdog load depends on stalled and forgotten addition of the
> "apple,t8103-wdt" compatible posted in [1]. I've replied to the thread
> to get the change merged.
> 
> [...]

Applied to local tree (apple-soc/dt-7.2), thanks!

[1/5] dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
      https://github.com/AsahiLinux/linux/commit/4d28a9a428f6
[3/5] dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
      https://github.com/AsahiLinux/linux/commit/d0960529afbd
[4/5] dt-bindings: arm: apple: Add M3 based devices
      https://github.com/AsahiLinux/linux/commit/5701af106b03
[5/5] arm64: dts: apple: Initial t8122 (M3) device trees
      https://github.com/AsahiLinux/linux/commit/1dfa78533534

Best regards,
-- 
Sven Peter <sven@kernel.org>


