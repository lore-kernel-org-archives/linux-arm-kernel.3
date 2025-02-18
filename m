Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8956C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alsVGP82I8tUPKjw6ZLez29MzizoXC6KfuvyinlS+/4=; b=jE+5Y1xb1zR+k94r+zhfX4F48Z
	wWjcYOc7flPMlNgH6PwymzYySXqURzJ2/Q75fVlOOhHFoxs7yNVESvJAF/KToEXQDyFZksKxJpnRF
	lnGaPl7b6fI7lVkLWWclQL0zYdwHZ6yK++KLKBr3j0YlmtKNbZmhY5hiXL1BHXNboiFMsfmGvErEi
	Wqi1q7mf3wqibB63naAgG33Sqepd9Qf0MtdlkRgNELlTvLugJhUhbr7UtEOEWhnh7wW5K9YyqNGjS
	b5iVihjPG56laeQxk+EQb9gRXSD3KXUNBYwmB2U2OMzK9VmWYwQzeuD6RaGGlQSxv0a+aqYpXaBxW
	YSowZtZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKVN-00000007fa2-1U4w;
	Tue, 18 Feb 2025 10:07:05 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKHa-00000007btd-0NRy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=alsVGP82I8tUPKjw6ZLez29MzizoXC6KfuvyinlS+/4=;
	b=N5zQMtti6LqtMCrUtZFWLRifSuyRdSq9eUreMR1Y+Nib9dyJtawrjwWt23acGj
	15+xFh2eZH73lC3RLBFpVlRo5nzw8QGSZWvD1iXBUg0mxiXnpU+noyFNirFZ9kT2
	+zHn1d2pPwmFQ5YuVCWmy70Z/Ju7lYlijete4/UdU/Z+I=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXDlplWLRnXD06CQ--.18498S3;
	Tue, 18 Feb 2025 17:52:39 +0800 (CST)
Date: Tue, 18 Feb 2025 17:52:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, max.krummenacher@toradex.com,
	francesco.dolcini@toradex.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: imx6qdl-apalis: Fix poweroff on Apalis iMX6
Message-ID: <Z7RYZbBagvnMdy0i@dragon>
References: <20250110151846.214234-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110151846.214234-1-eichest@gmail.com>
X-CM-TRANSID: Mc8vCgBXDlplWLRnXD06CQ--.18498S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1xZr4ruF4xZFWUuryUJrb_yoW3CFc_Ga
	48CF1xJw4fGF4UCw1qkF4a9r1S93y7Jr47XrZ2gFWav343Awn5AF1ktFy8Zr17J3yfZFWD
	Was8JwsrAF1fujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8H5lUUUUUU==
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhL3ZWe0S-IzFwAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_015250_436815_E1188A25 
X-CRM114-Status: UNSURE (   9.02  )
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

On Fri, Jan 10, 2025 at 04:18:29PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The current solution for powering off the Apalis iMX6 is not functioning
> as intended. To resolve this, it is necessary to power off the
> vgen2_reg, which will also set the POWER_ENABLE_MOCI signal to a low
> state. This ensures the carrier board is properly informed to initiate
> its power-off sequence.
> 
> The new solution uses the regulator-poweroff driver, which will power
> off the regulator during a system shutdown.
> 
> CC: stable@vger.kernel.org
> Fixes: 4eb56e26f92e ("ARM: dts: imx6q-apalis: Command pmic to standby for poweroff")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Applied, thanks!


