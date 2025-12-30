Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B2EE92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXz52BDb0gVRRoyn2YWkB+/E8hzCdvW2udKwjplDP+E=; b=ezb2OEf1wyiQ9/GepF2voVrKl9
	zubx9qtOHvzxzObAUgUAq36Ug9MYeQw3fr6B+4leYUJNEwhMZgAy4wJUOM/n7Ou1KisIUGtyWkpRb
	X3QQNJ9zfGRRq19ffr9yPz9Y2byEMV94BJSpTIBIGnL2AvQA2XPnFKaJi5NVqJ+PVaWvAE+1/YGPT
	Jrsw1b8BN1iq56GFebsdDePcjSZyWhKZhubPHMsSLkkYcrt+NyZ66Oyc8KRZaCAz8q8v/UcDyvaUT
	uD4q7j1AoL4klOYi1UG0XydW1ZSqjnqTqcTIOOR3xn6ST+6BVpGM9rxAE6khjO8qOV4j04wC7EVtl
	Lyu0m7Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPKv-00000004IVE-0IYq;
	Tue, 30 Dec 2025 02:19:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPKt-00000004IV7-0c42
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4225D60010;
	Tue, 30 Dec 2025 02:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6C2C4CEF7;
	Tue, 30 Dec 2025 02:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061186;
	bh=WsPnlXAeGWWyvfoz7fE2YJBhrIMmZkk6VEdC/cu1WMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGnKrIZJQzFQCw241+iLQOodHcNvwIGaG9yN0ld0s/xBn79ZHrh8XHm6tLEOewFjq
	 MQSrgrrYGCnrZOO+zv3TchwuKQP7aSZa2kxHAAQDReFWs2AmP/w8aVJFeTlAhu57TM
	 DgrqZNJ6OEDoiso0OEF6ldRMOQfVC0zGHxQowc+4N788x6KqpX186efW6r+5wI2IE1
	 LzyLQcLDfF2OoiohoGYov3dDXy7oLgWOC7Sc5llJwnDLCT/tCYRfZM2AxcHQ6nIGri
	 OtSZ7QHwPcdybRAVPuIrXb9UNF6mJ9FvbwqKcPFz5tx0aiZVteWoJxQuArwSbtt/Rp
	 LYakBXwE4tEBQ==
Date: Tue, 30 Dec 2025 10:19:40 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Waters <justin.waters@timesys.com>,
	Akshay Bhat <akshay.bhat@timesys.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6q-ba16: fix RTC interrupt level
Message-ID: <aVM2vJIPggFjHn2t@dragon>
References: <20251201095606.990-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201095606.990-1-ian.ray@gehealthcare.com>
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

On Mon, Dec 01, 2025 at 11:56:05AM +0200, Ian Ray wrote:
> RTC interrupt level should be set to "LOW". This was revealed by the
> introduction of commit:
> 
>   f181987ef477 ("rtc: m41t80: use IRQ flags obtained from fwnode")
> 
> which changed the way IRQ type is obtained.
> 
> Fixes: 56c27310c1b4 ("ARM: dts: imx: Add Advantech BA-16 Qseven module")
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>

Applied, thanks!

