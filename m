Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58073C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 06:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHs35dnnQzHDSfzEYkHPoioaYcmY6k0BCPYBVDFVvG4=; b=D+3YHpNVP49axF4/+mcv64H9yY
	PKQSDgqZCHdH9lYKtdY2UlliVqBK9uZTm81FXO3S47Kg6hzHpz+xD2g5LLz5nJpcGXQtqurKvymDS
	GGpBx0dqusBg1XTsMvS2mrOqIkSyGYJD0NGi1XYIE1YXW2zHeeicnG7ALGPNJPYAMv1kD9pveZORt
	VpfhnXpZXQzYkVRu2Bx/qydZB0OpbTgbWPRCqi6fx8LjoShh7WbWtRjTOpdhbxFd8VX8eRyGrIVVH
	wkKC4jcYcxUko5ulP9SmIyEyG+W1j4N7v3nCtITGteytSeLchJZVzYPf8mwa319FKZ8Sak++aNSEh
	VHU7/FCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkH2G-00000006yUn-3WbA;
	Tue, 18 Feb 2025 06:24:48 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkH0n-00000006yMg-0t1I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 06:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YHs35dnnQzHDSfzEYkHPoioaYcmY6k0BCPYBVDFVvG4=;
	b=gyw/xCw58MHy7sFBa0/TA7vOiilQ/ursMeUxqFsDXgCKYZvg5eYlqcYKw/xJzP
	pVrzKwVNesAp246hQlUM4Qv4xB8sAPOcVGAlvPVZLucQ0c2FvC6m9TdiVkdG8lI9
	ltOcxZnuCQuxPGPGibiGORROdAtL51lBdvTuKWZpl+oC8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXze4QJ7RnDRU3CQ--.18618S3;
	Tue, 18 Feb 2025 14:22:10 +0800 (CST)
Date: Tue, 18 Feb 2025 14:22:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] ARM: dts: imx53-ppd: Fix touchscreen reset-gpios
Message-ID: <Z7QnEOYS1B6lY1Fn@dragon>
References: <20250109000710.45574-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109000710.45574-1-festevam@gmail.com>
X-CM-TRANSID: Mc8vCgDXze4QJ7RnDRU3CQ--.18618S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUFb18UUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQX3ZWe0E2ZcHQAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_222317_601853_070EEF69 
X-CRM114-Status: UNSURE (   9.03  )
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

On Wed, Jan 08, 2025 at 09:07:10PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to atmel,maxtouch.yaml, the correct property that describes
> the GPIO connected to the touchscreen reset line is 'reset-gpios'.
> 
> Change it accordingly to fix the following dt-schema warning:
> 
> 'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


