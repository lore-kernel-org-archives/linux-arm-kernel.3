Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E90CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 00:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWNzekpPLwPTQVybzuyW2DHLqEF96+Dlyy5rNIWbA7o=; b=wqYYZR23fIsmODoBdtSh9xDTSW
	O35aB3FAr2Tx+FvB7MSpTdwPD4IaxsZ38OOQyQpc2QZnOMamb098sG6bhE2J3YM2kKo/izou/r9sc
	IM/YkKMl936/76WAZ9IrxFCn5MI4xiZSBuyDtz1toSyIfURBF/yKCNfYRl4KY1mMByn9OJ12NYgx0
	uVgLxRANLOaKgjOShruIwFJZPk5UVG9QHQVJoa0MF1/VLAF2pbon32oWxOrLmDyUkbLp8aSqPOnrY
	RAdacw6MnHdznUNe0Jaul3P8ff8DOYKqrYFnt3g884jMZ7lFwigs1+fkyQaYkDXAE01rbUy8tzenJ
	J1E+gveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVaQ-0000000017S-45ic;
	Thu, 11 Sep 2025 00:54:54 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVaN-0000000015Z-3irS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 00:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VWNzekpPLwPTQVybzuyW2DHLqEF96+Dlyy5rNIWbA7o=;
	b=USDNm4tNkU2k64S9XzIbZLGDzVIk/XC/RsjSRoSgD+c3gEduwW9DX55lUZQHyA
	L7y6RVcSz/gQaAE67AWdTUdElPAgD7yA0CmulF/oyjOWRqruFciH0Swpmn2jbcPJ
	pqWimNutWW7FyJzXMfA23UfhFa//WTCZhcZvgFhkQ31iI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3b7rOHcJoCbFNBA--.8694S3;
	Thu, 11 Sep 2025 08:54:40 +0800 (CST)
Date: Thu, 11 Sep 2025 08:54:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: add interconnect for lcdif-hdmi
Message-ID: <aMIdzu2eLMXk_OLp@dragon>
References: <20250821160137.108735-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821160137.108735-1-m.felsch@pengutronix.de>
X-CM-TRANSID: Mc8vCgB3b7rOHcJoCbFNBA--.8694S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOksqUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxBGq2jCHdDDJgAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_175452_296583_4934C763 
X-CRM114-Status: UNSURE (   7.15  )
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

On Thu, Aug 21, 2025 at 06:01:37PM +0200, Marco Felsch wrote:
> Add the missing interconnect for the lcdif-hdmi.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thanks!


