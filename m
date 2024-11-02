Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF96E67497
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 03:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEtnDnK/7wth/uKbwtADHbubamilF5yoOXWVFYE6lhk=; b=fM8kPN2gUcCRiVOawsdrNokqF1
	RtbSA7pykJImsHzOQBFfEb/wohgeJQuILhl0rm9ON4oJATWDQV1rtCqnG2bsN0oQCFH81odUViM4z
	77sxs5M7mgj9LDUTxXbkVFY4lf2qmqSBv+TTwsP58OwhqiZpGFMLT5Agb5ns3UsChmuplPqmBBxaz
	HEGDu06SIFMrW9k4ETfaFLvFPanm2yXuNTNVoG217FjpgRB+57qZxE22ZwjzmifR0xNSvPl20Sixo
	3qd2vjSUm4gRAQK275//y/br7uFDtyE5QD3X3dqTxG+UHLPD6yNC85n6q9Ewj4aZdZZp7RJW28tiU
	CuIJ03uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74oM-00000008x6C-2QKU;
	Sat, 02 Nov 2024 03:28:26 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74mf-00000008wx0-3RE4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 03:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QEtnDnK/7wth/uKbwtADHbubamilF5yoOXWVFYE6lhk=;
	b=dAN5qZ1eUDXdEyf5meWRioT+DSfcFfDJWtgxxUNSgJPuk7x/kUuTQTdgxIEe5Q
	4NcXaFp53WBFh6WqAiud3lnU7k9M7KEXa4Xixsrulhnmdb/vQSfe9peRRC5/Xx1e
	JUbOlnorWPWxC7GSphvb1TKPiZwjzNlOILK2BaqPFFQ3E=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnAIbkmyVnBSB2AQ--.14854S3;
	Sat, 02 Nov 2024 11:26:29 +0800 (CST)
Date: Sat, 2 Nov 2024 11:26:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] ARM: dts: imx6sll: Remove regulator-3p0 unit address
Message-ID: <ZyWb5CBbGDfJ/Nmf@dragon>
References: <20241025010855.1593365-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025010855.1593365-1-festevam@gmail.com>
X-CM-TRANSID: Mc8vCgDnAIbkmyVnBSB2AQ--.14854S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx18BUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERWLZWcliaEkcgABsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_202642_247680_C87E41B5 
X-CRM114-Status: UNSURE (   7.29  )
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

On Thu, Oct 24, 2024 at 10:08:53PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to imx-thermal.yaml, the anatop regulators should not
> contain unit-address/reg entries.
> 
> Change it accordingly.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied all, thanks!


