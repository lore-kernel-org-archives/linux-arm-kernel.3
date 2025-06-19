Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E41C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=timvlLjM+uBUHo1IHOCMzNWoKTs+k3Z8AXBdPLGlagE=; b=ozO3m2hqtFe+pQSR+oMWzlThPk
	Lo27rXmdDzLRhG5/yVEGciQKv72iEfKSZRtiVcZEX3mynqb+rPksCqzrEpX7pD/JhJgzHRbr5eRdC
	nNyEz/8Olyh7ZhsfkDvKZ4HUpzOLnkpIWxZvehnl/pYhWjPsufhTkhWpG7nlhZB2Ga7bJJ9nLi+UT
	+VRTnlc9J7ZYfQiDGJd7PwLsKOmNv/8TB30zYW4ktRsgeQqOB9BBJQqPkdj9fR0uEU2QsNJ1Or8gd
	NfGjL4JQG7aQorvbWqC8Lp6MNebw3q8SDaZpm/fnY9AWCCNy6hcOHNvjkDRDxbbQdR0duCKqKZYwU
	FAcpnQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAao-0000000CQci-014h;
	Thu, 19 Jun 2025 08:25:54 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA29-0000000CLmC-3Nrv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=timvlLjM+uBUHo1IHOCMzNWoKTs+k3Z8AXBdPLGlagE=;
	b=l4h05MDLwAW9cxrsZsnetXwAHaOcGNCNw/smiVW1Fj06fb6GVUw7p5dbIOjTOL
	JqwIENTGJzrsaOJkRbwhE0tg5hhZB0rNy+8tKg09EvHF8nloAiLycDFiGf0an8lI
	4el2r4zQSZ/R7kHOZRi0eI/go60VS6E+DrTFTFBUW4LhI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDH7zoUwVNocPP5AA--.63435S3;
	Thu, 19 Jun 2025 15:49:41 +0800 (CST)
Date: Thu, 19 Jun 2025 15:49:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-stable@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI
 frequency
Message-ID: <aFPBE0roFWvBqjXx@dragon>
References: <20250523173723.4167474-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523173723.4167474-1-tharvey@gateworks.com>
X-CM-TRANSID: M88vCgDH7zoUwVNocPP5AA--.63435S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc9mRUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRJxZWhTi3vJNwAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_005006_152155_46A56B0E 
X-CRM114-Status: UNSURE (   8.80  )
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

On Fri, May 23, 2025 at 10:37:20AM -0700, Tim Harvey wrote:
> The IMX8MPDS Table 37 [1] shows that the max SPI master read frequency
> depends on the pins the interface is muxed behind with ECSPI2
> muxed behind ECSPI2 supporting up to 25MHz.
> 
> Adjust the spi-max-frequency based on these findings.
> 
> [1] https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
> 
> Fixes: 1a8f6ff6a291 ("arm64: dts: imx8mp-venice-gw71xx: add TPM device")
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied all, thanks!


