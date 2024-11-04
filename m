Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C8ED111B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCrYpQmHtF7S8qAhF1e10rg05ea10pvsNpYjs321mqo=; b=K0pxFBfaN10alX6y01L8ltKW/S
	hZtlABRPc84SJevBcyPOiBjMhVnOgN/iHXPb6ijO2lDWk5jcip7JQmCWQrebInj553oxhdOVNWueq
	BNPxgOxYXsA97JDXRTqZrnWyhpOC1IBFbNAcyVniBFZwbGBdGFOHLu6oWA+YEuxVCRtHYTzN8/nL1
	1SYWRvoCl13aZZykk+dXRr6M8vlzWqh0Evi1W/R4BfS2mvmIMbtp+JJMsVIBq9SLm9AcOV5LaxTag
	7qaLqhfNN7qFh1AImbY5BjtQFP9JzhbIksksZBbq8Q3m+qXE+uboFCeBe+XflsNHkxzwGVANJuoP7
	Z8JvMxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rW9-0000000CqnL-3PLa;
	Mon, 04 Nov 2024 07:28:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rUT-0000000CqhA-12ZU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eCrYpQmHtF7S8qAhF1e10rg05ea10pvsNpYjs321mqo=;
	b=QyaHgJGpPpHLQyiIiQjRLzM7UFFWU8yPtjZfta4ZdxbGxCWvmeWHKpcNWlPew1
	aGD2uMgD6tl4nzxOS5oUqioXtN3cbDBC0ufkeyAvwkEMkckqTzXwikf2Dcxya5qQ
	XXqBtbr/31ojJj2vqgxM9bwvHcbHbE97/s6xAVPBJ4xlI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBX3tQqdyhnhWKmAQ--.16318S3;
	Mon, 04 Nov 2024 15:26:36 +0800 (CST)
Date: Mon, 4 Nov 2024 15:26:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alice.guo@oss.nxp.com
Cc: alexander.stein@ew.tq-group.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v4] soc: imx: Add SoC device register for i.MX9
Message-ID: <Zyh3KkEQ7ZFY9870@dragon>
References: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
X-CM-TRANSID: Mc8vCgBX3tQqdyhnhWKmAQ--.16318S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUciL0UUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhqNZWcoMhXQgwAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_232709_659492_CF41006A 
X-CRM114-Status: UNSURE (   7.91  )
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

On Thu, Oct 31, 2024 at 02:54:38PM +0800, alice.guo@oss.nxp.com wrote:
> From: "alice.guo" <alice.guo@nxp.com>
> 
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
> 
> Signed-off-by: alice.guo <alice.guo@nxp.com>

A side note: could you git configure your user.name properly to make
the author/SoB appear like:

  Alice Guo <alice.guo@nxp.com>

Thanks,
Shawn


