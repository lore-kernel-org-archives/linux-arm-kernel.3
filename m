Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52310CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFE1vXshyXTaSAq75tk8hvRjBufHsERPehCPxKwyz/Y=; b=qcKXRLWrcifyFn6oHr2A0DxKoi
	Q13n+dXz4ptxWrduG+xDwsI/IK90Mq1vCOPwyoUom2sRrSZmlrmJ8Slu20Lk3ut3/fVHLWhkdeEtC
	HCMTjDfiwfzbl3lNVctD0sOYetN7yAX9xyxZHEli57nUazt6Xk9GV42wxz51yBHeHIUhvoj/8mDMT
	W05owIK0eBiRXZyMtyzoj0mZLclWmVDrrWyKEcn+n/9pSzGApmqhgPsjPIQTYKstDqzi/Gg7Y8ERd
	eNvRZG80ohmOiZbyEDJH4OcfTAAyLK7z2tlJcq4p9OxLsRHEyWm+YISo0qjtFLNwCqesm9xlrEnxe
	l19WWiKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpK-0000000440K-2KNe;
	Sat, 23 Aug 2025 06:34:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upONT-000000026Eo-0mcx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TFE1vXshyXTaSAq75tk8hvRjBufHsERPehCPxKwyz/Y=;
	b=JkxhnaG0RP/J46xlp4ny1LqUom0swzep239Csq1u8pUeX38n6/Q/MzGwcAZOmx
	HeUHK8f9P6Sx/kXcL2IMGW6z8a8ZIY8ununhpvg1ytT13FaM1J/6KMuZARezHxuk
	yGFshu8X453OrPSS8sWknOY+PKNoPkxaAwA7nHHgM6kPY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXDvfJPKhoQqEoAw--.8192S3;
	Fri, 22 Aug 2025 17:47:55 +0800 (CST)
Date: Fri, 22 Aug 2025 17:47:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx95: add fsl,phy-tx-vref-tune-percent
 tuning properties for USB3 PHY
Message-ID: <aKg8yXnj3AMfZ5Zq@dragon>
References: <20250821110828.20980-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821110828.20980-1-xu.yang_2@nxp.com>
X-CM-TRANSID: Ms8vCgDXDvfJPKhoQqEoAw--.8192S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2LZ2UUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgexZWioJsE4MQAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_024807_588639_00E98068 
X-CRM114-Status: UNSURE (   6.39  )
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

On Thu, Aug 21, 2025 at 07:08:28PM +0800, Xu Yang wrote:
> Add it to improve USB signal quality.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied, thanks!


