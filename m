Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B3AC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccwTO1+murNAroUo7i8VjIf/zQTbfNXH6TQUxv/Gevc=; b=sJyGVnVVzuTsNt5RrZPPV+ognA
	Ls4+smZE0rm++g+7ziS0F13cx2A9MSo9AfHEZCiKVHXifoCmmF88RPI8ot5SUFYh1RZMTHhkTGLe/
	UaCoxO9YUyoVls1lYYEgVfK18ROawSnpZadg9//MYdLR7//GWKuorYamfnJqkkjSUhuTCJuK3mqsi
	nMYUvPR3M8wy/onNM8mb3IUdygIPAHLXB7IunypzvGlI82LXUjElNtK741U+D8fca+du/WyBQUUUc
	40RyZGCx8jUmDQUk43i1uPnkrVSZBDXcCnqNvO+OlHcFjmmUwCEmACxT6A3F1fafN+c6EfgQe4+UG
	+3SRorrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdIW-00000005wq4-3gyV;
	Tue, 01 Jul 2025 15:53:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbhB-00000005eEp-3Z3n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ccwTO1+murNAroUo7i8VjIf/zQTbfNXH6TQUxv/Gevc=;
	b=FfptibPUzI2MDrxoHVXSUm10uI51Bze4AISF9oavkrSCrh3Y738BNsWXSLIRAj
	olZ8EgnkwEdyfM/Jr3zGS4l1NW6pAtn5lZO52sHDpDyEkw2fQpR7MoNvqENrSvoD
	gzLXv0SJ+8SFY0RC7HuWpLxvimLoymi5Oy1y2Eatw6YO4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3v6Nc7GNo2bQBAA--.3640S3;
	Tue, 01 Jul 2025 22:10:37 +0800 (CST)
Date: Tue, 1 Jul 2025 22:10:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx95: Correct the DMA interrupter number
 of pcie0_ep
Message-ID: <aGPsW7iUj/0K84rw@dragon>
References: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
X-CM-TRANSID: Mc8vCgD3v6Nc7GNo2bQBAA--.3640S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcv38UUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIR5Fqmhj7F4r6gAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_071050_224544_5187F6EA 
X-CRM114-Status: UNSURE (   6.93  )
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

On Mon, Jun 09, 2025 at 05:11:27PM +0800, Richard Zhu wrote:
> Correct the DMA interrupter number of pcie0_ep from 317 to 311.
> 
> Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Applied, thanks!


