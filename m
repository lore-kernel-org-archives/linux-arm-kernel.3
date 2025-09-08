Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5172CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8cLOdt1hIYkCB4MaSL4jPaHrbOPLRP5d/EVxB+63Rc=; b=BbFGblMQltySytKu2qvTQkri/t
	Lzt+04U5dq8ZeNjSHYrBWecoReODLmsaZuE4uDFj1WLrzA7V7LKb3h+2ruv+Mxwg29bjjq33MtG/u
	ySpxN6WxeQWfowQ6GL5+pLDLo60bp9xbefH/xvB0vrXAs7zcqBKcNO7FUBNqmsjRzv+Hav0YoUfXe
	ESSd9AaTQnD9einHfeDBvT3tpKiuP3wYL1awOYvd1Jc8z+TpKpkrf/uwXp2e6PDf/dzqREqJtw7yE
	RmLdagYow/5J2WABp9cDeOHLMXnR6Y3eLLCa3wGnea1ebM+wcLip2VOEqwlr3QKDqMqsZX93AvZZE
	JAEEdn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWEm-0000000FGZG-3AdV;
	Mon, 08 Sep 2025 07:24:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW91-0000000FEFf-2kCa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D630960052;
	Mon,  8 Sep 2025 07:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9F2C4CEF1;
	Mon,  8 Sep 2025 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757315909;
	bh=hYOzoWKEBM/BtWQa0qqsbJN76jL06X8FvYZBp7aOrlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cJevj1VaI+ui3XH0g2sVKi9fAWl4Z+T5RSOgs0UGBP63obJv+6rSGyYFFNQ4NwYRQ
	 FSuC1zx6Y4nYv8rxTTE6IWq9t7L7+8XX/OYyIqCLbpS9JMtZmYsj436dpRFf1TbCBo
	 OmZTvJpIcg6UxTTvSISX6lM5K/tSrD+SlZr7NaR+rJiPl1OLtuIpJ6nvYnDvbFvhI3
	 pl+OtcF7y1p5sVkBvwu9I6YDLKT8CHEc6pGau7RqwZqa09Q2hcUtI8ZUghkJQa+a8L
	 0HZQUwfwvZMVrxbjkcjEuGVHvFL0Y5IJbzxgecH/ar/ZBFUH6NRA6P5t7+oI2IMkNO
	 JbNLllH/+z/ZA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Michael Walle <mwalle@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Message-Id: <175731590658.4102.1088493924360430422.b4-ty@kernel.org>
Date: Mon, 08 Sep 2025 08:18:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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


On Fri, 22 Aug 2025 15:15:24 +0200, Michael Walle wrote:
> Now that the PMIC support is there, we can finally, upstream the
> support for this board. Besides the usual device tree, this
> patchset contains the support for the on-board house keeping MCU. It
> make extensive reuse of the drivers for the former SMARC-sAL28
> board. Besides different hwmon sensors, all the dt binding patches
> will just add a board specific compatible (in addition to the old
> sl28 compatible) to make any future board specific quirks possible.
> 
> [...]

Applied, thanks!

[5/7] dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
      commit: 530c7063f753e18a8c4b793cc9e96e3b529dc81d

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


