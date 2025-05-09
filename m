Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA1DC3ABCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUwQFda+RlFIMXKiIF4g+n1LDysyAUbuSGkjmJu59Ic=; b=sNtLmq9s0TR2WS/6ya/1NJw1P4
	ea8iE4fg+NEQM7KqRSSqpyoXwXiI+8DD1OqZZbQvftXhmPSQ06SW9CsymAfiKkYx8tAX4GGoehzcj
	WWd0FKjq0y4kJO/mDQxqfETrKW/KNjTdWTMpSpDG7uTznwBmcIeDTCkgLW0a9JodcXlq2JV/KINys
	P0uNaEiI1f3RAHphvbC1gpFvgOv7pkfUDZbAUz/hwICHzGXO8THlvEVtmDMsoJK9Hmb/f/fwTkq1x
	KZSR4AaMC8qZMmb+7RfNXmLtujc1l3gKGcPnfgi3F+uNWkoCLIOOL9lvpzZieuneRB67YT+UvAP5h
	FzNHqXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU7z-00000004jJn-0aG2;
	Fri, 09 May 2025 20:15:27 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOuB-00000003y7S-0AmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yUwQFda+RlFIMXKiIF4g+n1LDysyAUbuSGkjmJu59Ic=;
	b=cfr8GOgmFsA2xfLB7tC4cs6pXs2TEJkPJLkAcTW6VwZd4EUlbSUtIe7stkK96p
	WSOCOj7j5rsObTdgRkl2E0mHplt13wrUI+YDKamzENgs/WjV/0lloc4rrf+mVtP2
	ZiaorTCC6rhl39ewTp7s9FnCZGHgAR/iJ3jYhol/d4NHI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn7xPQEx5oH32oAA--.41579S3;
	Fri, 09 May 2025 22:40:18 +0800 (CST)
Date: Fri, 9 May 2025 22:40:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: imx93-tqma9352-mba91xxca: disable Open
 Drain for MDIO
Message-ID: <aB4T0Jaz2VJk07hF@dragon>
References: <20250430081849.1827688-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430081849.1827688-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgDn7xPQEx5oH32oAA--.41579S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8mhFUUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR5IZWgd36zXkwABs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_074051_472355_9A60420A 
X-CRM114-Status: UNSURE (   9.26  )
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

On Wed, Apr 30, 2025 at 10:18:48AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Using the MDIO pins with Open Drain causes spec violations of the
> signals. Revert the changes.
> This is similar to commit 14e66e4b13221 ("Revert "arm64: dts:
> imx93-tqma9352-mba93xxca: enable Open Drain for MDIO"")
> 
> Fixes: e5bc07026f94 ("arm64: add initial device tree for TQMa93xx/MBa91xxCA")
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


