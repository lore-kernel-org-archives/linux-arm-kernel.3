Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654BAE677EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 06:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPj1anUEXZHf/a1qxTMG7RLU/90Mk03XP663TewCDgs=; b=Bqv468aoTC73hrVs5ma81oQXvr
	/ioiqZEJFTG+23rtS+0ek8+v6avkH9WgW0Mkvny5SaDtDDOuIigDc1jH0nd3tdLFX3jvn9dCSsk1z
	BTsp+WH8sKGGa6D4al3QDgSaGlKMkMjm1/wWPIR9pMQm1IqSw6PxXTPE86NNZpNniZ7pbg3GhMDVE
	b8ZHOmDdaokVcaJPRv3tshfM9fqSA9OQSarsgyeNdcdAYgodU8yxQWUg6mXmAHrILH1iKDeYfuBrm
	FIhH4l8yoifde5cC5SIzt4CpIAZRcTTJ/3DZ44SLU+qedDzFfqBqX+6FqjLfhR/rjIU0rFWpAEM7q
	0rzRrulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t783v-00000009BSc-48V5;
	Sat, 02 Nov 2024 06:56:43 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t782F-00000009BHp-0lGy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 06:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qPj1anUEXZHf/a1qxTMG7RLU/90Mk03XP663TewCDgs=;
	b=Eg6HOusQP/Yc7vhQ1yztgmQtYUgUV8RiJhezoGlRgI6ohMPymLyw5HTpm8P49O
	Cujla6ELoaoYavWsZAZGjF110N+t2Iq1qOSzmGQ8esR94udtbUrw61eYkNx+qCDi
	g+LXjnYmc1Eb507Uwhyydv5bJQrqWqkPbdrrc6Zh30zHI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHecCyzCVnCQJ2AQ--.14608S3;
	Sat, 02 Nov 2024 14:54:44 +0800 (CST)
Date: Sat, 2 Nov 2024 14:54:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: power: fsl,imx-gpc: Document fsl,imx6sll-gpc
Message-ID: <ZyXMssAspMI4uYS7@dragon>
References: <20241028124518.72576-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028124518.72576-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgBHecCyzCVnCQJ2AQ--.14608S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcy8BUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCLZWclsr81+wAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_235459_556403_C8F7091A 
X-CRM114-Status: UNSURE (   7.98  )
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

On Mon, Oct 28, 2024 at 09:45:18AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Document the existing fsl,imx6sll-gpc compatible used with fsl,imx6q-gpc
> fallback.
> 
> This fixes the following dt-schema warning:
> 
> ['fsl,imx6sll-gpc', 'fsl,imx6q-gpc'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


