Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64385CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkYEsQGADtfjEQqkg0ky53aCfLDAmEGyJ2yLOYX7e+0=; b=htx5jlUDR4vDgHdTpF0ydj/il2
	eQ8cn0TCoDtjEeJ1Ufa6v1nK1eXYUTbClnBwFvVcGxa1zz0AT1ICBX5BQ92ltv9/o3xu0mER4CcbU
	QFQkzgWh3cdhf8UyLwy7Xst3pdCsVn8H0o/TxyQ3Ta+cVzGcRqG8UklFy9CCdKfxvCchQoi/BMjQZ
	kzaRhfjl7dmpAZ00suljizvwRtTrbyUSXHteDsyBcRAB3yJndtJyFnInvJFHPsmhd3hlDUovTG+At
	VzzlL13DQPUKZ9leF7ewxpWlB0Oh0+ncoLukRwNUkwk8wnbFvhns4SELd27v834YpJ4ytQsuLtyz3
	nrqhY/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvLtc-0000000Cgmi-1bzz;
	Sun, 07 Sep 2025 20:21:56 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvLqm-0000000CgFI-1yNg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 20:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BkYE
	sQGADtfjEQqkg0ky53aCfLDAmEGyJ2yLOYX7e+0=; b=ZKDkWWXDdqev7r3ujExl
	vRbb12pNdrb6DOczqkm44D6Tq7aIu7P+FTdA5wkN7u6D+9SVMq277jkPUO+E/j7r
	Oldud7dTEw9sjq7qHulGEU2ttFIld0Hf0pszXOvn6AD/oduMDp8zyH0qBYN9xzWa
	0cESUHOzA51bFtgzl41TemZmS5faAeTE2hXPjlHurDkxa7/xQtjrmZCs1+Xj1Zwa
	ATZYjGzAUCupJBtvA0/FPZy8E8f+IFYKYcjDGHJhLj9AFzUfGS1LxHdI+JYesRT+
	9XwTkuKXm9SEB5bv32k+ax0oryUkTvwfp10+ICIMBd6dExV5dAIP7PuYpvbuZ1MQ
	kg==
Received: (qmail 574771 invoked from network); 7 Sep 2025 22:18:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2025 22:18:53 +0200
X-UD-Smtp-Session: l3s3148p1@wyOXxzs+LMAujntE
Date: Sun, 7 Sep 2025 22:18:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT
 DTO to Retronix R-Car V4H Sparrow Hawk
Message-ID: <aL3orDHZDLri0LJj@ninjato>
References: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_131901_359544_F45FC4B1 
X-CRM114-Status: UNSURE (   7.90  )
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

On Sun, Sep 07, 2025 at 06:10:53PM +0200, Marek Vasut wrote:
> Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> been tested.
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> + * # Localize hwmon sysfs directory that matches the PWM fan,
> + * # enable the PWM fan, and configure the fan speed manually.
> + * r8a779g3-sparrow-hawk$ ls -1 /sys/devices/platform/pwm-fan-ext/hwmon/hwmon?/pwm?_enable
> + * /sys/devices/platform/pwm-fan-ext/hwmon/hwmon0/pwm1_enable

Great solution!


