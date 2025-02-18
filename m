Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92540C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaXVPd8t0VO67w3iZYFtfLXnSe8QC8xmMPBwsH0TuvQ=; b=2qlb6AErbt/SX90caVk3wOZat7
	TGYiSxOy3mx+utqFf/BM+XlwIimcUJ8ocuCpSZhc2Xz7vdQimjJ9vAXthf7EeLEGz3fe5JPK7i+Nv
	bDmz8uetoa7sgBP1E3FRJJmwXm/flbe/g6WiPtuRZbAwbJQ3T8ztWaWP7w50hhnJ9gPWugEoJT5CB
	jzXHQKRFgIqOZhwepBoakKl/lswGnnfEgp9yw/X8j92qkZuPtbNvz5odBUQSlLwUIlavxT6Y63o8T
	2NTteNeHaToC5dpzgqFiFc61iliEv7RR8f3XCHXgkkpGfcmn4p9uUvkq1hVJ3qzjI58N+vIJfrG23
	xn9FUKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKfT-00000007iG3-21Gv;
	Tue, 18 Feb 2025 10:17:31 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKR1-00000007eQy-1r49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zaXVPd8t0VO67w3iZYFtfLXnSe8QC8xmMPBwsH0TuvQ=;
	b=O7Woy1Y6fI1cNidy2k135tVAb7Fp/6WiaMGPD6RhQWIyc8/2aUF9eKC637+Yxe
	QujN/GV3PqtH9pZrbXJ68ReIFmVa2hklGpGRthsKVFuSpON9tejdk9PsXlVrVXPy
	Oyg+Hfrv5TMBKcoAeIAfxwP2P25lB1J9a60aJdmD4FzEw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCX3MqnWrRnpNZhCQ--.20227S3;
	Tue, 18 Feb 2025 18:02:17 +0800 (CST)
Date: Tue, 18 Feb 2025 18:02:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx5: Fix the CCM interrupts description
Message-ID: <Z7Rap8/l2/V5scVU@dragon>
References: <20250112152745.1079880-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112152745.1079880-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgCX3MqnWrRnpNZhCQ--.20227S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcGYpUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRn3ZWe0TrUtvAAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_020235_787119_4F5FAE53 
X-CRM114-Status: UNSURE (   9.52  )
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

On Sun, Jan 12, 2025 at 12:27:44PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> The CCM nodes are not following this format and cause the following
> dt-schema warnings:
> 
> ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long
> 
> Fix it by passing only the two interrupt numbers.
> 
> Run-time tested in on an imx53-qsb board.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


