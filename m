Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFB9CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APAKyQvFVIBcKOgb0uEOcq1Ddyo8JI5mya0p3PDa9LQ=; b=qJ1jp2iQM4pPcOJdFJ2Nxs1vxv
	eQV6jTDWFNL8RmzrWTU0nlYqnqTndN/q5Ne/zN1POWaE6nu1XSopUgi01AqVCCxScHaQzVqUta4CK
	mE6KYyatxPLII1Dty317ww64HpS0VNy/88WJVOv+D88cbwIEIJuW5Ljq8qXQtowM6iqpp3lB1re4k
	coLaLWFb7UXe9zuKSLWhZk2ZIyKfQ78QsPRrkoX6631RY/x6IfIK4IyO+HAwkjEiPBt98oi+aOUgS
	OeVcuPjJlg6CT3lnGnTxogb5mR4oLTfihNTlR0ijNvYMn4D8ZWVyDPXHQ0aRFQJOIe7bLBghHA70X
	WpW4xi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ089-00000007z7R-3svG;
	Wed, 12 Nov 2025 01:58:41 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ087-00000007z6l-08Le
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=APAKyQvFVIBcKOgb0uEOcq1Ddyo8JI5mya0p3PDa9LQ=;
	b=HLILyDSYnDXEUpkIEhUHcKPLevgW3I2zFhuK/HL7Op8/kgiF1TT70cO9sH9gJ8
	P4lmLuTlJrjVrgOthd7OJo8MYTLp/XCKjpUOBxGUV/2/k2yB2VV6CKUHbKopoM2x
	XYuRz4WJ34IO4oXGvWtuL3aHMASNXoZiM5nwMgXPHyVec=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnLZPA6RNpuzvPAQ--.5587S3;
	Wed, 12 Nov 2025 09:58:25 +0800 (CST)
Date: Wed, 12 Nov 2025 09:58:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/7] Add vpcie3v3aux regulator for i.MX PCIe M.2
 connector
Message-ID: <aRPpvy2TtCyCCegm@dragon>
References: <20251024073152.902735-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024073152.902735-1-hongxing.zhu@nxp.com>
X-CM-TRANSID: M88vCgAnLZPA6RNpuzvPAQ--.5587S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0EfOUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNgLJL2kT6cJyogAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_175839_494573_6F454B3C 
X-CRM114-Status: UNSURE (   5.40  )
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

On Fri, Oct 24, 2025 at 03:31:45PM +0800, Richard Zhu wrote:
> [PATCH v1 1/7] arm64: dts: imx8dxl-evk: Add vpcie3v3aux regulator for
> [PATCH v1 2/7] arm64: dts: imx8mp-evk: Add vpcie3v3aux regulator for
> [PATCH v1 3/7] arm64: dts: imx8mq-evk: Add vpcie3v3aux regulator for
> [PATCH v1 4/7] arm64: dts: imx8qm-mek: Add vpcie3v3aux regulator for
> [PATCH v1 5/7] arm64: dts: imx8qxp-mek: Add vpcie3v3aux regulator for
> [PATCH v1 6/7] arm64: dts: imx95-15x15-evk: Add vpcie3v3aux regulator
> [PATCH v1 7/7] arm64: dts: imx95-19x19-evk: Add vpcie3v3aux regulator

Applied all, thanks!


