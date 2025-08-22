Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0164ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szsFJQd7FpONlwOm+0H1IEbNubvgFFPa2+Vofeysjbs=; b=Ngfcipmeh8jRRo2fclP9eOIwPK
	Sra89wU40pvlAgW2w+8To2cgD1R23H/A2hYJq5RSZKAs2Rv3bk5Bkvj2ymycf4UH9+ivjQF0imBQU
	mtaIQanv7LqRIFIXllviUXoHgIltOh7UOOrTqop8cN+8NThK+97W1SIWP+h4ywCdNRU0e8f3FWePO
	8JAcxJlgXriOd6VnCO4ZSdq0wwElMRdx6J3X1jkp2zjyZif4aqSpTrh5FuDvWAoIgTjhcazeny1Rh
	zDp1et+5/Ju2+hfU8pEE6FRDXBuNTmwLgYv6F5lkbCVdgNbbVKZkJGIRNRWEjju42VsGjO4oDHGJf
	TuxRBK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTn1-000000032tb-2Q5Y;
	Fri, 22 Aug 2025 15:34:51 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNeL-000000020Ew-0EPl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=szsFJQd7FpONlwOm+0H1IEbNubvgFFPa2+Vofeysjbs=;
	b=d5WraUMZ95QQRPkROwQ+DJ10P6fMlQcaMqqvkrYcaC/eItrxon8v3z4g0R4o6c
	tKl8zjkrKgYXpRmu3VT7nhgMDiZwIYAAqifwv6nWO0t5uFl2jeNidrBtao33Oljz
	cQp1nV2sa0bJzLlxaJYFKZmFsHVu/9w7rWF7KQID7148I=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3H9PLMahoWSkcAw--.15940S3;
	Fri, 22 Aug 2025 17:01:01 +0800 (CST)
Date: Fri, 22 Aug 2025 17:00:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH
 electronics i.MX8M Plus DHCOM
Message-ID: <aKgxy6tmlw28awes@dragon>
References: <20250810160340.10042-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810160340.10042-1-marek.vasut@mailbox.org>
X-CM-TRANSID: Mc8vCgD3H9PLMahoWSkcAw--.15940S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeLvtDUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQ3DKWioMc2g0gAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_020129_470514_EBBA9303 
X-CRM114-Status: UNSURE (   8.26  )
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

On Sun, Aug 10, 2025 at 06:03:07PM +0200, Marek Vasut wrote:
> Add missing microSD slot vqmmc-supply property, otherwise the kernel
> might shut down LDO5 regulator and that would power off the microSD
> card slot, possibly while it is in use. Add the property to make sure
> the kernel is aware of the LDO5 regulator which supplies the microSD
> slot and keeps the LDO5 enabled.
> 
> Fixes: 8d6712695bc8 ("arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!


