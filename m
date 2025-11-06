Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB0ACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SC96mDuXnnQrFFFBLMQXCahNR2gB5gk6itlyXvuA/yE=; b=4J3u8zWIu1gxQg6JHIqhl3D1Y7
	cTjC1IFxEnrXWeiY/tRvwxDw+NMGpVdhKeevOMwmeqbJNIY50dH9Qf6wKxp1X/vInLPxKfFC3wu0P
	7jcNmnp6av0UEoweYLTzOhYrHsCr9jybQHt3WcyFYhojkKHrD0HOp9jNq+Rashm9KywgUCKvm/uIK
	2QBDDGaCTqct+wbX8plC7rQMq5v3MDxG4j+NGAC+MJtj1M2AkRNtdt8hqs3W3BJ+cQoCElwiS+IaC
	G4DIueuYE8DSq0O3V9YwAyPhx3Yfsw47RFQ1vnq6AcVMl32hUJGkDmLRDJimxRjQxiD3fcTU+LHBj
	qUzICNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Xr-0000000FeZE-3wOe;
	Thu, 06 Nov 2025 14:00:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Xq-0000000FeZ5-2ZX7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:00:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA71C601F7;
	Thu,  6 Nov 2025 14:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1BFC19421;
	Thu,  6 Nov 2025 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437657;
	bh=82aafwmRzEUr/9hjLRrQOVgrkwH3sfNcUjGioV/rnbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rO6dqYRv/qSbLypbprhjvGU7B0ZV5J3JyxSGTKIxOpnVfiv27Ef4zLG/1MXXy4umG
	 fdkXy0+6ybPH+o0LznPj3bUHtlcjB0U1t9wg+7GEYV6IT7raJA+IU8qixctSJ9CdXs
	 03Ma18xk4lwm18OFIgbrGQ5KhYECLtihtCxD/j2PCzG+GGyyDeYOsFoNytSiUAve2x
	 akoqOIxagGuJg+i/J56OGvBK+V32l4BqdmCsBGhmw68ZOt3eCSB9109EUhrv6kyDIY
	 E7Cxc7wk+C41OdGbVQZX0KP6nlG9CyTZKXgx6cjFQQ4Vgd9lUh0Kg0Itb+xV3VKxVR
	 rSVzYuOmcPscw==
Date: Thu, 6 Nov 2025 14:00:50 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and HWMON due for the v6.19
 merge window
Message-ID: <20251106140050.GQ8064@google.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
 <20251025-macsmc-subdevs-v4-6-374d5c9eba0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025-macsmc-subdevs-v4-6-374d5c9eba0e@gmail.com>
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

Whoever takes this driver will need to pull the following:

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-hwmon-v6.19

for you to fetch changes up to b340412a3b22b60b5e19cce8726940c7b5b14439:

  mfd: macsmc: Add new __SMC_KEY macro (2025-11-06 13:58:42 +0000)

----------------------------------------------------------------
Immutable branch between MFD and HWMON due for the v6.19 merge window

----------------------------------------------------------------
James Calligeros (1):
      mfd: macsmc: Add new __SMC_KEY macro

 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)
-- 
Lee Jones [李琼斯]

