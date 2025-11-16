Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF99CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWBBmvT5p0UOXw0ZQWdcqEHb8L1MuEgC28NscIj1Rzo=; b=eFpAfKk5VfHJlVel51FagG5EWr
	Qj2rKxGBOZT6Om+MniL1yxKCtYqv5yKA6GdEA5HZFiIcntNHz/uoxqD0cIE8BGuuYiUIBo6tuJeg5
	FDoAetwjEBEgJktSUmG500osJxSAjE8tFBZNZ4m/oYT848Fd+yALq0sKDYlBNKAXg1g4CiII9Z4v3
	4mbIML82wgeIorMk/Tw28LZ1drqv5BicZtK7ki33g852W3FmdQ6bNj1o0sar/f9eIx4NZVGHufP1C
	ZF816hphsn5tKmEluswANbaXO3R4zXDlR90QWvKVyeH3S2P5FPbWW5bCKBixutzS1tcoYQ4bTxpRz
	sw9K7CzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcWl-0000000EeXZ-3aAv;
	Sun, 16 Nov 2025 13:10:47 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcWj-0000000EeX8-1wol
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 13:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=dWBBmvT5p0UOXw0ZQWdcqEHb8L1MuEgC28NscIj1Rzo=;
	b=EmkVErn1LDwDlPIFjJrwgEGtza1lnQQHZMMu6czXrRbc4FOVfKlHN9p3hnDz+J
	+QLkKVUSVY0Ya0ubuarNLj+3bXZeEJ2UGimlNfreCvBJgJ68DaOB7kW1WVuDfFu2
	xG2nPPkTmfFV/4ckNmPEdJ7gkotZTv+Gh5ud+6e0f1ljc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3HEREzRlpnOIlAg--.8122S3;
	Sun, 16 Nov 2025 21:10:30 +0800 (CST)
Date: Sun, 16 Nov 2025 21:10:27 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, Frank.Li@nxp.com, jun.li@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8qm-mek: fix mux-controller
 select/enable-gpios polarity
Message-ID: <aRnNQ__Ukp_74XA5@dragon>
References: <20251113111444.888985-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113111444.888985-1-xu.yang_2@nxp.com>
X-CM-TRANSID: Ms8vCgD3HEREzRlpnOIlAg--.8122S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8PfHUUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAYlimkZzUZP6AAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_051045_832063_61FBD9E1 
X-CRM114-Status: UNSURE (   7.84  )
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

On Thu, Nov 13, 2025 at 07:14:44PM +0800, Xu Yang wrote:
> According to the board design, set SEL to high means flipped
> connection (TX2/RX2). And the TCPM will output logical 1 if it needs
> flipped connection. So switch to active high for select-gpios.
> The EN pin on mux chip is low active, so switch to active low for
> enable-gpios too.
> 
> Fixes: b237975b2cd5 ("arm64: dts: imx8qm-mek: add usb 3.0 and related type C nodes")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied, thanks!


