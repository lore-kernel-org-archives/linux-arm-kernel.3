Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26CBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB2QjJ66j3kraGlrqjw6SCUngpcSvfBQPp40F1HnYIo=; b=t5Bz1n26OLObM93lzzNZRaH41E
	L6q8o/1xZcleQKV9PrnD+v5L/ebVu7xEMaMWmlrK/KbHy+xNw0A1+84idHThPYU8YzT/0XuYjJe0m
	S6RUeeeNS9ga5z6M/5PGSaDnXjmMqGF66DJG+6VR5UwSMqq4Se3hQVPCYO8QZOs0Eq7/W793D2lsC
	WI6ubBALSClWa6GlftPABBwi89o/4ymNU1ZJlLh25eGv1iTGCjjN+bJelSaf+uaOKQNoddXW3Myet
	0BFIijIj7c1/QTKkSfNt4FyzUrg7wGbw3UnyFn6PUhbauyWxla0aW34Y8bfay66XkjLBbXSj1Vvwi
	s9ZUKSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88dL-0000000FlMZ-1p8P;
	Fri, 25 Apr 2025 02:17:43 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Zx-0000000FkxS-3wIm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sB2QjJ66j3kraGlrqjw6SCUngpcSvfBQPp40F1HnYIo=;
	b=QeppXBwcJBb4ePAeuS1oYCzcV9k1vTQQ7gJQWzlgx855MAHLtommaeAZ8Sx/1g
	aB6pz4zjvbPG5fQUw1qqRCdhpiT/tc5oB84mxjPOrsD6HMIIFpn+XOcsfi3UcfPe
	M2yCOCQJGQIfxJbWxMudbLd5LogR6YFrRxVy1IoI+VjaI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnXrzc7wpoPm_aAw--.52709S3;
	Fri, 25 Apr 2025 10:13:49 +0800 (CST)
Date: Fri, 25 Apr 2025 10:13:47 +0800
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
Subject: Re: [PATCH 1/2] Revert "arm64: dts: imx93-tqma9352-mba93xxca: enable
 Open Drain for MDIO"
Message-ID: <aArv2yur3ox+RCDT@dragon>
References: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgCnXrzc7wpoPm_aAw--.52709S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARY6ZWgK0Y2F8AAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_191414_311262_CEFE7653 
X-CRM114-Status: UNSURE (   7.68  )
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

On Thu, Apr 17, 2025 at 10:15:19AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Using the MDIO pins with Open Drain causes spec violations of the
> signals. Revert the changes.
> 
> This reverts commit 9015397c2f2d9d327c0cf88d74e39c4858cb4912.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


