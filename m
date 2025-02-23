Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F99C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 06:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rO+gRo73pxHWZnf3Uevq5TM1eEuO1YJeFmYf2Fpyzak=; b=DlpMVfdaA1PpHszmNNYQlF7VP+
	Vf5IuKQ9/p1/DcNcqVvFmfOodPEJj2sZX1Dwl7atImJM+nCI1b6im8+Sea7jCU0OJE83UNulWOyCR
	t8HCIv6b6A/JdgiYu5Cp78w58/HvXcOUgcZIzOv2TxKRfvSAQUTcP0+bFrj0x5JfG2ZeGKoHQAXWy
	yVpYEbgIll/WA42T+/Y2LUnSoT67Mlh1eJljkj1ej8rylFOf1yYw+yqA/D71Sa9AB0uLeNnI0r31K
	HczYnmyqDHCxH69/WJ1GJTveMnkQ1JSLWIWvBlS8nKL3ngPxE56FRAlvBPDNZB+PMiYr02FWpjY0Q
	AjeqLpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5E1-0000000ATmz-2Pbq;
	Sun, 23 Feb 2025 06:12:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5CX-0000000ATfT-3NRv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 06:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rO+gRo73pxHWZnf3Uevq5TM1eEuO1YJeFmYf2Fpyzak=;
	b=ivsPA/lQcPO96FCaMKFp2KwNIZiIoIl5AgVI/wN/oiTkk0oAQ3etIpaRpAx34C
	O9+y0SlDo8OdYTyCll6j+EwqwbCYfDlx//oo5X+n29K25rTXf4QiED5Z4wZACnZ/
	niNLTK8PP2pykN5p1Xvj5BAR8Sjkp5h7uNN7WOnUbQoFw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnSlrXu7pnhEaeCQ--.22694S3;
	Sun, 23 Feb 2025 14:10:33 +0800 (CST)
Date: Sun, 23 Feb 2025 14:10:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com,
	eballetb@redhat.com
Subject: Re: [PATCH v2 1/2] arm64: dts: s32g: add the eDMA nodes
Message-ID: <Z7q711GJZWOp0j+0@dragon>
References: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203080919.1814455-1-larisa.grigore@oss.nxp.com>
X-CM-TRANSID: Mc8vCgCnSlrXu7pnhEaeCQ--.22694S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsR6wDUUUU
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERj8ZWe6ksyM4wAAs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_221054_172046_521FCB9C 
X-CRM114-Status: UNSURE (   6.91  )
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

On Mon, Feb 03, 2025 at 10:09:19AM +0200, Larisa Grigore wrote:
> Add the two eDMA nodes in the device tree in order to enable the probing
> of the S32G2/S32G3 eDMA driver.
> 
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>

Applied, thanks!


