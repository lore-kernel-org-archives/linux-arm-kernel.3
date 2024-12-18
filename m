Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20C2E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 21:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7FQw9uOElZgIZ5UDsdhuv1rYgmZlf0US1wMCQAwdrE=; b=X5K0aZarHU0lj1/SvDcAf0w25p
	RhYfMnQ3rldrV7mooB4z222Iy6HTQfNDxwZet8rEha95qupFXdKBD2n5kJfyyT1iwxV9gY39XcX1Z
	AQmPGSnbYcvgzZeEpNK/gH0pZ9ma0jspSoizbGrof4iAfoFyFh6QGGib4y+bD3b+ygA5SFbVpWXo6
	BjLWHVA4xi15hJH4fjTt5yHYJL+jzyykEVI6NZLj8hrForpPPE9wPzUwY9gjALj/EKstR9CUhgBza
	ED/715tbGV4KKfV5TPxxKt70IbfPnOV5YQpdHENaWlZbpWw1AV37vvae8jhZ1MY26mWz/MPRCInpp
	6bEDrMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1H3-000000006KC-0QQc;
	Wed, 18 Dec 2024 21:08:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1Fw-000000006BO-2STh;
	Wed, 18 Dec 2024 21:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q7FQw9uOElZgIZ5UDsdhuv1rYgmZlf0US1wMCQAwdrE=; b=BoguQtj8+rXLW6V6ooyLURyozJ
	TWtNmopJSj5X/ps+yMRRJ+HfXCbrW6x7W7fv+W+QJOe3dTTtfHPgR4g3GBYvrlAFnkkTn1xwiqFXt
	oBOYBIUamvHoqtRphdam47hJ6Uk1rFWHH5T3/u4P2orz33ggi8JDZBGxCa3ulryD4wTfSRYe2u7rc
	YpfhOF0yjDSP6Q/1fwoMEyt6kshqKFJZr8eJL29dPB4FO+LB9GQuoLwJZEHN0S/6loFpEN4y+zSgl
	yM4MjlhB8syG7kvS/xwIonQeJKxmWJhVn3y5BXQBv8janImfJ3HQtjWCj3ZKuTPvksRgRzKUcAOZX
	M3s4axDQ==;
Received: from i53875bfb.versanet.de ([83.135.91.251] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tO1FZ-000516-EB; Wed, 18 Dec 2024 22:06:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jikos@kernel.org,
	jic23@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	srinivas.pandruvada@linux.intel.com,
	bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH v9 0/9] Drivers to support the MCU on QNAP NAS devices
Date: Wed, 18 Dec 2024 22:06:23 +0100
Message-ID: <173455598053.629326.7463057625807840374.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107114712.538976-1-heiko@sntech.de>
References: <20241107114712.538976-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_130656_666111_2F8C471A 
X-CRM114-Status: GOOD (  14.50  )
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


On Thu, 07 Nov 2024 12:47:03 +0100, Heiko Stuebner wrote:
> This implements a set of drivers for the MCU used on QNAP NAS devices.
> 
> Of course no documentation for the serial protocol is available, so
> thankfully QNAP has a tool on their rescue-inird to talk to the MCU and
> I found interceptty [0] to listen to what goes over the serial connection.
> 
> In general it looks like there are two different generations in general,
> an "EC" device and now this "MCU" - referenced in the strings of the
> userspace handlers for those devices.
> 
> [...]

Applied, thanks!

[8/9] arm64: dts: rockchip: hook up the MCU on the QNAP TS433
      commit: 989e3dd871349e76919911ac628e97ff6cb1ad51
[9/9] arm64: dts: rockchip: set hdd led labels on qnap-ts433
      commit: 47f34eab58294d7bb2583f9519b4022e74d56437

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

