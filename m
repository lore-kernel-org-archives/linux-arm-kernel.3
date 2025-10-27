Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A2DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTONtzzDCzYkWQwYqhc3PDl6+i8mJOuSLhFAjzgzdlI=; b=jUw+DfgGxAc+DSYtc/iAfr4nQk
	s7MEvk7bKj/iR4KCVxC/Lxn3Kmdm7ctScThxVCtRL3Nh6QzIFPGpXIpiEAIV09AR3G0jmAlaQ5Lzb
	h0jCvprE03iHWj+SndnNVeDkqeMp9GLbgdxjmdTZHeD/K3lioS+tg+TiJ1HlG7KGkF9R0eiMS56uh
	3hQlnjopeC5HfChr0IkWR4WT+FAXVtLN7nvBT5T5OJBuS4Dr9Jbq0Qv1EL9T1xTK9onIOUsXKbOab
	LGArXMctlrPq29msvBdGyI6jqiZzDUawcAPo/Q6Z8JjJrxD1Z9xcdunP2D7JOM6S23dEBYYTXk9i9
	wLV83Y3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGyE-0000000DDRi-0pSy;
	Mon, 27 Oct 2025 06:44:46 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGyC-0000000DDR9-04xD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 06:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=uTONtzzDCzYkWQwYqhc3PDl6+i8mJOuSLhFAjzgzdlI=;
	b=lE629Zb2rdpzW8UCnswCe24aAxqKE7PzYPKYv8FSfJfe39kvC3PYFzD2iF3UI2
	dZD/Ezqj9quZ3mcfCLp0R8BIsAAdt9rE7aRL5lo5DaeqKw8AtHxDCXjvAdVvQrUC
	OLCrvAelb2cUlAF+/+ZUSwHShxmubUDQ4ZyD7LlIm5CZ8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD331XQFP9oZPu+AA--.28142S3;
	Mon, 27 Oct 2025 14:44:34 +0800 (CST)
Date: Mon, 27 Oct 2025 14:44:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] firmware: imx: scu: Misc update
Message-ID: <aP8U0PNGA2d0kSZE@dragon>
References: <20251017-imx-firmware-v2-0-b58f68ec2ea9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-imx-firmware-v2-0-b58f68ec2ea9@nxp.com>
X-CM-TRANSID: Ms8vCgD331XQFP9oZPu+AA--.28142S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUemhFUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBJTuGj-FNJBTgAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_234444_373532_9B565648 
X-CRM114-Status: UNSURE (   5.92  )
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

On Fri, Oct 17, 2025 at 09:56:23AM +0800, Peng Fan wrote:
> Peng Fan (8):
>       firmware: imx: scu-irq: fix OF node leak in
>       firmware: imx: scu-irq: Free mailbox client on failure at imx_scu_enable_general_irq_channel()
>       firmware: imx: scu-irq: Init workqueue before request mbox channel
>       firmware: imx: scu-irq: Set mu_resource_id before get handle
>       firmware: imx: scu-irq: Remove unused export of imx_scu_enable_general_irq_channel
>       firmware: imx: scu: Update error code
>       firmware: imx: scu: Suppress bind attrs
>       firmware: imx: scu: Use devm_mutex_init

Applied all, thanks!


