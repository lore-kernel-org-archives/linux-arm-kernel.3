Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C70CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 02:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kbZIg2zkqWzaa4TZTIFqXZU2NxqBThBQSS8aPSbuJA=; b=0gRQSvPnOITWHF0OyvkHQHM5Ji
	I5ZsGwrCyAjCrEKAp/KA0uLKT2nRP4iaZ9xVAcpk58NyZ1UjxCsm8o4I/gbnQWEeQpN5fytItjkiP
	5Z2vwLSQyTsy5O2T2MAuTAZFKjKl/4y8upuR3FFusqVliZPQJyctIMWdc9fKjhxzDQXPVsO64vH4D
	IiYAudWsLpVhtZnuo7fV1+s0r0Zlg4iNAQq1/VVw/55/xZQSxBsEZ9izxvfiBW/O1zhOffw64izmB
	0yiYLS7hlW5dM1TvSlE4gtvmanekr21z1bG9+p1IA+SuM67XStpkhRlq9gCDYGBw0hN7JgRaXXBHU
	TJIkIlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWoM-00000000KYj-0ruX;
	Thu, 11 Sep 2025 02:13:22 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWoJ-00000000KY1-0NF6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 02:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+kbZIg2zkqWzaa4TZTIFqXZU2NxqBThBQSS8aPSbuJA=;
	b=WHdHDVBE+Qa6rifrjy7uSUzeXvCiFBGCLwSsfxxtlL4cCJ8zegvgtrdTj4+OaA
	8Kg8SPZEhx7Gn3MR2jGyjVHjW0jUQLj3rDXQXYERdCLZ8sqgcx1/gcj1mQPiSOGF
	h09ZW+PF1m6tqZMHykC34U7yoW5meKo6Gda6MHgbreyU0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnjyQvMMJo_8tfBA--.20024S3;
	Thu, 11 Sep 2025 10:13:04 +0800 (CST)
Date: Thu, 11 Sep 2025 10:13:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Josua Mayer <josua@solid-run.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: lx2160a-cex7/lx2160a-clearfog-cx: add
 missing descriptions
Message-ID: <aMIwLoRSFQR61UU-@dragon>
References: <20250825-lx2160-clearfog-omissions-v1-0-e3a28c0ea55f@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-lx2160-clearfog-omissions-v1-0-e3a28c0ea55f@solid-run.com>
X-CM-TRANSID: Ms8vCgDnjyQvMMJo_8tfBA--.20024S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0rWrDUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBTFZWjCB7liYQAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_191319_438867_5FBA2F06 
X-CRM114-Status: UNSURE (   6.51  )
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

On Mon, Aug 25, 2025 at 08:00:54PM +0200, Josua Mayer wrote:
> Josua Mayer (2):
>       arm64: dts: lx2160a-cex7: add interrupts for rtc and ethernet phy
>       arm64: dts: lx2160a-clearfog-itx: enable pcie nodes for x4 and x8 slots

Applied both, thanks!


