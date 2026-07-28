Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EFDC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTB8jM1GR8BsZlOvZgtYiyOlUFOjPcQWnbBkkPY9bXc=; b=tVRAhPQiDm6lGn3J/8T/WzM3+Q
	S+KMqprzlyXfDUiiw6uDnu5qbJFvX8R+3PpM3BlwEv6/rEdHuvwN9n3PmOBfa+edITcXFUGeGnJzx
	f1FFD+7oTkqHZ7KCy3EvDqQCeg94RTnAYLz/V3WbDhRTlLiyIr+otBfWYCXCxQQZoIiw02jOlt6yY
	5Z1td3Kf1xed4IWOJuEfxedseeSNmrr4gX9LENV1rPg5f6fkBouSBlgl9dU51OlYaXOFmslnpS3hL
	49Xgt9WYAvIYPDVhIN51GEdMOKVJn2EnjuGo5QujNfDBc1lMSiwx2YZKsD3H6uF3s96QCTtXOxP2i
	ZcEBnUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woizR-00000005Ww5-3jTz;
	Tue, 28 Jul 2026 14:41:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woizK-00000005Wu2-0MUV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:40:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86FEF60A5E;
	Tue, 28 Jul 2026 14:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBF31F00A3A;
	Tue, 28 Jul 2026 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249657;
	bh=dTB8jM1GR8BsZlOvZgtYiyOlUFOjPcQWnbBkkPY9bXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Pmdg9BoHWzBkZCQRWtzB2FY+8OXhH9KFVinxwFWFYOoiQFth9SjffZR5YCB/Dn1UU
	 qWhfYJDnE7V//QhfMF+yOulJumV6LvvhuOgNf5lBe+ngP3dG5vxUPQEnyi2Inari95
	 Oinid25blOAlpXsHiqSk3ki0Ft5L+KX4wJ/WiiHdceV51Oo3XwFdcs8Urnt3OAF8HQ
	 Rr1YMjr4MfOFWm5lazzXKAtn46fmYuIJkTKZjD3ACv/DQfL6UDTp5F4t5iXUpbHVZe
	 vShbAv98ZhnEK9qvEMthgS0JyO/2Dc/4Fz/QjnfhP7eK5Mu80F0ZD4O8UoE6Joa5Jk
	 5nxTnXTnC8L9w==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-sunxi@lists.linux.dev, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Dragan Simic <dsimic@manjaro.org>, 
 Andrey Skvortsov <andrej.skvortzov@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260725111909.2244868-1-megi@xff.cz>
References: <20260725111909.2244868-1-megi@xff.cz>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-pinephone: Fix
 mpu6050 mount matrix
Message-Id: <178524965479.668575.6507291604446263040.b4-ty@kernel.org>
Date: Tue, 28 Jul 2026 22:40:54 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
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

On Sat, 25 Jul 2026 13:19:07 +0200, Ondřej Jirman wrote:
> The current mount matrix for mpu6050 is wrong. The mount matrix is a
> simple transform from the sensor coordinate space to the device
> coordinate space described in DT, where, looking at the screen, X
> points to the right, Y to the top, and Z towards the user.
> 
> The mpu6050 is mounted like this (looking at the screen from the
> front; the sensor is on the near side of the PCB, so its Z axis
> points towards the user; o marks the pin 1 corner):
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/1] arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix
      https://git.kernel.org/sunxi/linux/c/dfc735fd93e4

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


