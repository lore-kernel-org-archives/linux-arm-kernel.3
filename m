Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ED8C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPXVRdAdTKk+04iwLdlaaflbSGUMVrgPOHzRGIn45yQ=; b=0ug0PcxFcpDGJv1Q4dWf9lNWmG
	k//go/zWDYu6sNGnexM6MW0pFCAtunKEYVTyr2nxdLJVlv/Q582Wfx6lfn5rzvNa9BdARsILzTQjl
	8oHXhcgJIbjQIqQMAVqEoyO8eehVlx7sB3fG0XWKTHmCoHG/N6q0oE4GhDGJ30rVLYu+dGONvVLiU
	+aio39uCHQ9gaeS1Udaq7bL+PnFvkw6FfdjqxqgumDVXb0ew6WTIw4GJYZ+Ksy40Pv+u26PVqMC1P
	iKuYiY0DDNAlT42/ovmJsGp2DkdHzSd7xuyEQ7FHVfMMFrvZucupdM0jbU/EslT+pRJrzFrRvMCIe
	coW3pzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6aj-0000000AcHU-0ACd;
	Sun, 23 Feb 2025 07:39:57 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6ZE-0000000Ac9e-2QSG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 07:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oPXVRdAdTKk+04iwLdlaaflbSGUMVrgPOHzRGIn45yQ=;
	b=NJ25arv6TSaeOvQf8IygctFsn3BzU1ead0BXGkM/ZNb2emKqNBj2QZ7MiKFSRM
	4TEWq7VmJE/7hetNDF693lfCMLIuERGkIzwypO8oW2Rlc58WMkFT6o0lpeWJO+a1
	NUEmVZ4McAIcgXGFYsi5D0N4hL+63Yaza4qw92VJku7I8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXS3Zg0Lpnl1efCQ--.23292S3;
	Sun, 23 Feb 2025 15:38:10 +0800 (CST)
Date: Sun, 23 Feb 2025 15:38:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: rafael@beims.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rafael Beims <rafael.beims@toradex.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: colibri-imx8x: Add missing gpio-line-names
Message-ID: <Z7rQYN06RUFR2Xqy@dragon>
References: <20250210123134.1659719-1-rafael@beims.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210123134.1659719-1-rafael@beims.me>
X-CM-TRANSID: Mc8vCgCXS3Zg0Lpnl1efCQ--.23292S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxuWlDUUUU
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgb8ZWe6xy0Q-QABsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_233824_933975_7C95051D 
X-CRM114-Status: UNSURE (   6.76  )
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

On Mon, Feb 10, 2025 at 09:30:50AM -0300, rafael@beims.me wrote:
> From: Rafael Beims <rafael.beims@toradex.com>
> 
> Add missing gpio-line-names for SODIMM_79 and SODIMM_97
> 
> Signed-off-by: Rafael Beims <rafael.beims@toradex.com>

Applied, thanks!


