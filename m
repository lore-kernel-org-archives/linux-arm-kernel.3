Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6CECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 02:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ovddB11c5XSfbN+IkHJ3Pb74oXCQSIbUsT6dab88c8=; b=fLaXWZhSNM3ML6yhhqAjKjlhwP
	4cqH0qFhR+rQqJPy2Z1pAJt86Iqf7YTWzoto9PsYKYPMmxR1enJVLHp9qJCn7zZIZwO8kkl6CCdZx
	FSo/5yBIDRvFdbMvEgFJMa74j0XXpuIT6le6SlKur+LakBw5vdqWP4KLwoeU5/NRgtc/HEuXmV2S/
	B0bJH7dvOTdB/XGFsow+6EK2VTt4++NQtyUj+F/nayx5nZSshlizrHpdRIh4U5GIYczotmNabdTT/
	rX4dpbh8AVeRC611fZPa0n3LaxYiADyHUqJrdVOYQo5AbRiFhWOsxnl+YQOUkgF71IC6d0pEQTb2q
	1rzLAzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWfN-00000000IdM-0xEe;
	Thu, 11 Sep 2025 02:04:05 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWfK-00000000Ibz-0SKf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 02:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/ovddB11c5XSfbN+IkHJ3Pb74oXCQSIbUsT6dab88c8=;
	b=TgXMS//u0UN4LXuhEDFiSmVTQVOmuO9rWuV914TrFeefb9eLpMKvnY4/aI/7Qr
	KkM5Cmy5sy7+4z8djApZG7eCUIn28DQPP68UnJgbyAX8pFSk9hFdIbBS2otTcpjO
	8Qdh3H+CjydhZRQ/igAFVOzpFTyezJoGCT7TfgHzZI/R4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD399gHLsJo9n5OBA--.47148S3;
	Thu, 11 Sep 2025 10:03:53 +0800 (CST)
Date: Thu, 11 Sep 2025 10:03:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Csaba Buday <buday.csaba@prolan.hu>
Subject: Re: [PATCH v2] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
Message-ID: <aMIuBwgtrWDe-5Fk@dragon>
References: <20250825-b4-tx6ul-dt-phy-rst-v2-1-0d3ba9736b0e@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825-b4-tx6ul-dt-phy-rst-v2-1-0d3ba9736b0e@prolan.hu>
X-CM-TRANSID: Mc8vCgD399gHLsJo9n5OBA--.47148S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc1xRDUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBLFZWjCB7lcQQAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_190402_460088_CCF4C305 
X-CRM114-Status: UNSURE (   8.49  )
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

On Mon, Aug 25, 2025 at 02:52:09PM +0200, Bence Csókás wrote:
> The Ethernet PHY's reset GPIO should be specified in the node of the PHY
> itself, instead of the MAC (`fec`). The latter is deprecated, and was an
> i.MX-specific extension, incompatible with the new reset controller
> subsystem.
> 
> Co-developed-by: Csaba Buday <buday.csaba@prolan.hu>
> Signed-off-by: Csaba Buday <buday.csaba@prolan.hu>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied, thanks!


