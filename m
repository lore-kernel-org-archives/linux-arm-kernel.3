Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B837D6AB16
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 22:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frThyFyxMpLfQ4k35kxNNQtt/houBNTigyr3t2CNbtw=; b=U+a+ykC4p5UDrfn5cN+UPkyURV
	7ziiPbEQ2/z43WVRgVcC4aQQVcObLA1aKHf0FYn7hg8/fkQLLTWm0xDaLD6ILnFAIf6LB+NLRkWOE
	1w1uzWgvA4f/qMeqhB3VV9QldPqdYS4HmYpFt6ay3PxKRUsYnJiWPCnOIQb/UP3rwTNE5LhE+hT3B
	ybBNziIaIDqbicWpTSXnSmKiPLlgmIHvjiOZmsnq8ZZp8FJUpehaMBE8Cc+1tRpDgrwqWZ6+6imq+
	uFMX4wb3MEjOD3ChYk8Mm4NihE7a8BtMFgZPnQgki4/cuWPd89FvhhBC+u3pCJ01o5oVGDdKJFoRe
	1NwlYdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8QwB-00000000uNz-10Yc;
	Thu, 02 Apr 2026 22:54:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Qw9-00000000uNX-0ru5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 22:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A22360008;
	Thu,  2 Apr 2026 22:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD37DC4AF0B;
	Thu,  2 Apr 2026 22:54:51 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 43FFC1812B7; Fri, 03 Apr 2026 00:54:50 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sre@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/9] gpio: remove uneeded Kconfig
 dependencies on OF_GPIO
Message-Id: <177517049026.464276.1601296742866533365.b4-ty@collabora.com>
Date: Fri, 03 Apr 2026 00:54:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 16 Mar 2026 10:45:20 +0100, Bartosz Golaszewski wrote:
> NOTE: Each patch in this series can be picked up independently into
> maintainer trees.
> 
> CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
> module. The module itself handles GPIO lookup via the OF-node tree and
> is automatically enabled on all OF systems. It does not export any
> public symbols to drivers. There is no reason for them to select or
> depend on it in Kconfig.
> 
> [...]

Applied, thanks!

[8/9] power: reset: drop unneeded dependencies on OF_GPIO
      commit: 0629c33fe1873a48e1e06078409de76c5a159fdb

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


