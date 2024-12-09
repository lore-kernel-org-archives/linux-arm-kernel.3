Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE6FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9t1ybfU0p7i8XBRjmbNqnf9Mds9LGg2edrrvPPWhKQ=; b=qIZkDBVlJpOrMcYMZCygOAen6U
	whP2WFniTp1wf5xtJHXL6j08gPknD+wG6nsjAo3joeKbeQe0h2uLWY2U6tp7Vd4ON1PAIAJhCImf/
	hfHRl130g4xWIN20or+qTzj9kYYQTb84+NiCWMM+ETwTbsnovrMmr1D202H2lM/o2eE5kSoFt1GBK
	GvHK86ToYufH1ztW3WQSsRUUXuu6LP8tTMTFlSj3FMnUVHkPBBfCZIJpkVmIBnLXHKzcNyP8jaOyF
	MU10UeIaWQVl5mt4RTnikMYdwdq7m4sF4l1lpU3nfqIFmydBQNRdFC3uqiWoREAddocBj3kRFqzXk
	w6nwCsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd6s-00000007lUU-036K;
	Mon, 09 Dec 2024 12:43:34 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcvy-00000007hNx-1AOz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=a9t1ybfU0p7i8XBRjmbNqnf9Mds9LGg2edrrvPPWhKQ=;
	b=Di7ejoNyYcqLxWzulNQP0tYoJbO8C8F4kYu+FAb9NdrJmszrWuusAJLAP1Ja0Q
	YeNNLOvd/pGKQU6QW7mRe7EsBYggrE9a2701cmVYkXUcD+58w07hyAtNTegNJwNB
	H54wHZ8uKZble5GadJec1OzCtVq/e5MtZkyhfZe6YzC9c=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3vA0+41ZnRTaQBA--.47901S3;
	Mon, 09 Dec 2024 20:32:00 +0800 (CST)
Date: Mon, 9 Dec 2024 20:31:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alice.guo@oss.nxp.com
Cc: alexander.stein@ew.tq-group.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v6] soc: imx: Add SoC device register for i.MX9
Message-ID: <Z1bjPhQxV34bEZS4@dragon>
References: <20241118021716.396001-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118021716.396001-1-alice.guo@oss.nxp.com>
X-CM-TRANSID: Ms8vCgB3vA0+41ZnRTaQBA--.47901S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUslApUUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEROwZWdW4JcK1gAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043218_678842_EF8294C3 
X-CRM114-Status: UNSURE (   8.01  )
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

On Mon, Nov 18, 2024 at 10:17:16AM +0800, alice.guo@oss.nxp.com wrote:
> From: "alice.guo" <alice.guo@nxp.com>
> 
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Applied, thanks!


