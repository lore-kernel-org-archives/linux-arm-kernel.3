Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC969C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6FAWBhfs60pu6OhdgDHuN8n9DU58L3ZOK6V1wpeXKQ=; b=2fjZFeLfmnj/yL2jMsaf0Adf1u
	Dg7rZFE5hbkirtDOpN9RVI2jHhbniWNuaNgS382emIrWQJETBcyGISscf4gecGkleSGCTJDVbEeum
	t1WZ9Wg2C8c9obbtk+OBOg9QyPRxWyKrigomeSljshBCi/rp5otpx1i1a1gO2VnjO82zG1bzJao1v
	rTSqOeTOmT3Vqwm8zZ2eVm6qSmqfjkRDZ2WTCzYSbefoRd0a054Rjb7HAnlajIGJG9Kr14l4b5EKF
	FZVRj3nSY37O1YzZb6NwMdnpHHiiJg8RtmSbZbDsgW3rX8H+ddUBBUdPrNiM2WRSusmn3Lz8YWNXi
	UfYxe54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllNr-00000007gfU-1Zox;
	Sat, 22 Feb 2025 09:01:15 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllMM-00000007gXX-2WPa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 08:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Q6FAWBhfs60pu6OhdgDHuN8n9DU58L3ZOK6V1wpeXKQ=;
	b=EB/CgnJhBXtcC8VlgGWwqzGqGa8DAFbvLirRbGq24hVt5WpMLml7rdum8r6uY6
	iggN4S6DH6TtqioKjznyXtv6Lctwkz7xLkjFmhYjg9uDTMfrL7G8GCKpiW/UcIGM
	Cnp9cn/vcPpfqy89gC5Uj+ibqO7gPVcF/0OTVTdHIlDiM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHKVLlkblnMNy2CQ--.23671S3;
	Sat, 22 Feb 2025 16:59:19 +0800 (CST)
Date: Sat, 22 Feb 2025 16:59:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	shengjiu.wang@gmail.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: add clock configuration for
 44.1 kHz hdmi audio
Message-ID: <Z7mR5cXC3p0IA67x@dragon>
References: <20250120094632.13894-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120094632.13894-1-eichest@gmail.com>
X-CM-TRANSID: Ms8vCgDHKVLlkblnMNy2CQ--.23671S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc8nYDUUUU
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQL7ZWe5dcBkgwAAsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_005943_049110_E41835AB 
X-CRM114-Status: UNSURE (   8.62  )
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

On Mon, Jan 20, 2025 at 10:45:22AM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Currently, HDMI audio cannot play sound at a 44.1 kHz sample rate due to
> a clock frequency mismatch. This update resolves the issue by allowing
> the sai driver to change the clock parent to AUDIO_PLL_1 when the sample
> rate is 44.1 kHz. It also ensures that AUDIO_PLL_1 operates at the
> correct frequency for this configuration.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Applied, thanks!


