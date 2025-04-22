Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4468C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 01:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRd/Mv2IK7FoRUzYMao2nZ0bIVcFKFyPzLBcuxvr7as=; b=MRRP37cyDb+svnAwXrcJhenvy5
	/cJxGmFJ7HGQpjq2uOxJrWS4FHKHniuo/RZlTukuupl+KGaKkn3tcIbshG9AjLsXw8KToqe54DvLu
	EqRRK4Js8WLGVrFVO4R06rAyJcJ7JGEKPFV6zAShSLj4SrOFl3Q2SVO1FNZAk1zp7JFjLHePz7NWN
	cZVAdoiHhxAclm5n/M/lWNoXM8ETo1J4Gp1yyFroJZ/WnBC4SyutvN6KiJmJ+RzooYxYglDus4z+N
	DacdsbIou+YQFAMB+57w/9EI1OZ7G9VXo40ie7VjegBTe11RrzinP9BFC7myOmPGaPPNUCEREoHU+
	aabpgzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72mH-00000005XVK-3bWa;
	Tue, 22 Apr 2025 01:50:25 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72kN-00000005XRU-2dIn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 01:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RRd/Mv2IK7FoRUzYMao2nZ0bIVcFKFyPzLBcuxvr7as=;
	b=RKukL9IzXolSfcWHT/VQNZX015mSZ/RCEj3z9FuKbM9pvStmSTiHp2VHmSMMDW
	NBL1zvflI5/YchYfQ0JmCG1P997+lf8Ys5YzjccWS0Bkg/7XtLw0CiZaC/k/Ladi
	szDdIskegADB/l71A4fbymWtrtXR/asSeh5R78DG4CjEQ=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnptJK9QZoN72iAw--.10140S3;
	Tue, 22 Apr 2025 09:47:56 +0800 (CST)
Date: Tue, 22 Apr 2025 09:47:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
	s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mq: Add linux,pci-domain into
 pcie-ep node
Message-ID: <aAb1SlxBsADlglrh@dragon>
References: <20250226024256.1678103-1-hongxing.zhu@nxp.com>
 <20250226024256.1678103-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024256.1678103-2-hongxing.zhu@nxp.com>
X-CM-TRANSID: M88vCgDnptJK9QZoN72iAw--.10140S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVf-BDUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRI3ZWgGsHT8JwABs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_184827_972641_9FEB6A17 
X-CRM114-Status: UNSURE (   5.89  )
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

On Wed, Feb 26, 2025 at 10:42:55AM +0800, Richard Zhu wrote:
> Add linux,pci-domain into pcie-ep node of i.MX8MQ.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Applied, thanks!


