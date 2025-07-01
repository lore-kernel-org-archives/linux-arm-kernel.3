Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71039C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXpEtGQ+Z98FVG5E4BLxNELqHqStstbmKm1c2roUg3U=; b=Qip61KAWNTwPVSPLWpcJwCiFVf
	roGS9yvPuZm9Y5zvXo0elXR9068CwGnMNTI28f2e/Js0YuhzXYbzdmlOWQFgTAhPW7ErRSDGwtDBs
	bDp+8ljlEwLo9JxPyyU9UxhvaYotq5pfpgQzXY3ASD3JTev9jwksAwwsWvNuaso8cG7bj5wlJICd5
	sPYo5w+3xTA40wwELrCtkoX73qnA6QMKk+Sw5sJ9UOeQKQ8+VNs4Hid5bEM+hxc00hmpo/y9GaYX0
	H+EYDH5SWIyPW0iaojl+HTpsAE9yAvXbtuNDQcQHWHXXyiB22xIEtUF5atvPR5HhLnBxHOgcrHgND
	jwDmRLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTJR-000000041Xz-3a1V;
	Tue, 01 Jul 2025 05:13:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTH6-000000041PT-1cOF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 05:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E20045578;
	Tue,  1 Jul 2025 05:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97886C4CEEE;
	Tue,  1 Jul 2025 05:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751346679;
	bh=PAjyZAGdS4a1sYZYyUKK7gQ15IbfNqvQaXwK4FCEUZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w6BFMVuRGt1ZnXye74MHBq4GS0QlHzV5hnT+81JRyt2DdsEryIaHyqy2yp6jQHbJe
	 7dhJmRW6q+W9YIThf8bd+bqDQMOOlsEmPmj2f+rkcJXOJGxH+E+3jZeB8tQiJr9tl3
	 6LF0kpLdEpfgze+2R8HMozw+PjtTHnWjhwuKUUsU=
Date: Tue, 1 Jul 2025 07:11:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Bjorn Helgaas # quirks . c" <bhelgaas@google.com>,
	pci_ids.h@broadcom.com, Stefan Wahren <wahrenst@gmx.net>,
	Randy Dunlap # build-tested <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 4/5] Broadcom drivers changes for 6.17
Message-ID: <2025070139-garnish-leotard-9824@gregkh>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <20250630190216.1518354-4-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630190216.1518354-4-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_221120_481684_C1C068BF 
X-CRM114-Status: GOOD (  15.24  )
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

On Mon, Jun 30, 2025 at 12:02:15PM -0700, Florian Fainelli wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers
> 
> for you to fetch changes up to e3ce7b897388339b407d57969acaa26063e38209:
> 
>   pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom SoCs drivers updates for 6.17,
> please pull the following:
> 
> - Andrea adds the RP1 clock, pinctrl/pinconf/gpio and misc driver to
>   bind them all
> 
> ----------------------------------------------------------------
> Andrea della Porta (5):
>       dt-bindings: clock: Add RaspberryPi RP1 clock bindings
>       clk: rp1: Add support for clocks provided by RP1
>       pinctrl: rp1: Implement RaspberryPi RP1 gpio support
>       misc: rp1: RaspberryPi RP1 misc driver
>       pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support
> 
>  .../bindings/clock/raspberrypi,rp1-clocks.yaml     |   58 +
>  drivers/clk/Kconfig                                |    9 +
>  drivers/clk/Makefile                               |    1 +
>  drivers/clk/clk-rp1.c                              | 1494 ++++++++++++++++
>  drivers/misc/Kconfig                               |    1 +
>  drivers/misc/Makefile                              |    1 +
>  drivers/misc/rp1/Kconfig                           |   20 +
>  drivers/misc/rp1/Makefile                          |    3 +
>  drivers/misc/rp1/rp1-pci.dtso                      |   25 +
>  drivers/misc/rp1/rp1_pci.c                         |  333 ++++

Any chance to actually review this code before you throw it under a
different maintainer's responsibility?

And what's wrong with patches, why a pull request here?

thanks,

greg k-h

