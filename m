Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889DDD6AAEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqMIcQ51E1sQeKxBU9RN0BSEUB1PBlGsNnfvKutGTvw=; b=M85z4CnjwW/x3dl2MlJOC522Ii
	xGBgWsQUA2uWbwmRjvZg49Qo94hLbdA/9pOd0nKIQMtvNyGbmFITWzefu5z3lHTHpLfChKeqE64VK
	t7/u3cgk0LSPIqdfP27g8MQ32cG2/fVJZPR812OHgOksenJqMRwkYMps5Fw5GK+GdabhLXxXIpKij
	823ZezV+8jj9CgJCTMcc/DXMpfp6+h2kxjmNYfwGJYiho51cBYaVl70AwbZXy9tuCbK72L0+wBDIP
	MFUbfFwPPJh02QKnR2f5nkpK/n/kkTy1x9vsegWh8kXh2DAizCeJhWB6xeKF7slnQLFBFxyfKHuO7
	xhWX5glg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kvk-00000000W0r-45Mi;
	Thu, 02 Apr 2026 16:30:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kvi-00000000W0F-0kJa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E26EA44467;
	Thu,  2 Apr 2026 16:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198D7C116C6;
	Thu,  2 Apr 2026 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775147400;
	bh=w1dW8AZk4reCHACcRL/0+eMefcFQIN8mzWpVA8G3YSI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=KHOyIcuzguDroW3VbA8bQHdLBILXZSpffvP320Gcop3G5/+HewMrRub0Hx4dBP8Ks
	 iDZHmCQD7FnOjeaaWJq49GeqWXgFEnDdcJpq4VQrI+zI8lz/6SjsVFidu0RoIURTts
	 70rLx9nJyQEb2tR8Y63JVX9V/El/5pKBQu7AYUmwpD/Xok/5ilw62F0JwwDME1ldzL
	 zkWXlo7UAgPyn8Ou0yBdlTAHOfA0b5ApTwbiO8KwS124kHhZ0iQNCygnZph6filT0I
	 rLBwc81Dcg0gyCYg/spGCS0zfg/tLbZW/38xh0jL3JKznlOTP6F/IsXyS6n/39UMFl
	 dtNAN9+0M47yg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 18:29:55 +0200
Message-Id: <DHIT8FGUNBB6.3JBUXPIVOP6GU@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Daniel Scally" <djrscally@gmail.com>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>, "Tony Lindgren"
 <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>, "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Arnd Bergmann" <arnd@arndb.de>, <brgl@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 0/4] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_093002_258995_25600D5B 
X-CRM114-Status: UNSURE (   5.41  )
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

On Thu Apr 2, 2026 at 4:15 PM CEST, Bartosz Golaszewski wrote:
> Bartosz Golaszewski (4):
>       kernel: ksysfs: initialize kernel_kobj earlier
>       software node: remove software_node_exit()
>       driver core: make software nodes available earlier

Looks good to me now; I will give it a few more days on the list and then p=
ull
it in for v7.1-rc1 if no one else raises concerns.

>       ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

