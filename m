Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB98E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uck9vxqkblasHvKIYn8GVu5axHgPGfdiHnrPp5elho4=; b=hJaUsYGu8ubfE89yDL7G42Usfd
	HoY4PLgAiMAhniw8nLuXmsDWAU4MsQKpNq0yt9O2etfUh+lpokytQIAmv5qYiEQawJQcAuoJ44tKo
	On+ZUY4+jxGmcbMDbNNcHn1SEPk9W+zK05ro2PvvW8fPfEiAZfrlHlpUHMrrwxpXX/TrTSHCOMsGW
	q5RnaIOdHxwF5VOKYRCJzlEwo5eeULzBOG8MCAcs5FAYhxG+6cx3G2PZBGwQZDWuS7mk0MHrZ4Ykf
	rIBLPeSQnZPeTuzQagB5Jy+UYNd+u7F07SSidaTjWnCBAL230vZpEA2uu9B1NyivaFw48XEvmEm3Z
	juUefDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZ8a-00000006um7-0Av9;
	Mon, 09 Dec 2024 08:29:04 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZ78-00000006uMI-3Jyo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Uck9vxqkblasHvKIYn8GVu5axHgPGfdiHnrPp5elho4=;
	b=AYBY+R2Y5CebWsEEabugNRT1aE9+ieboWGLmtFlDxH5T+brP7bxBHxhheEhVCx
	ciqsJR9CwFRGe4bnLHy4dYj9OOfMK9HHlfx7WJS+6U12tWiYGPT7rgRwDteZxTw7
	XneVSL7O8SZgwuTWrUfsPGaAEUMqvUZ8h0G5iBi/mUwlA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnDkXlqVZn58h6BA--.46377S3;
	Mon, 09 Dec 2024 16:27:18 +0800 (CST)
Date: Mon, 9 Dec 2024 16:27:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: correct the address length of
 netcmix_blk_ctrl
Message-ID: <Z1ap5M0KGCcz5rfl@dragon>
References: <20241105054603.1470260-1-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105054603.1470260-1-wei.fang@nxp.com>
X-CM-TRANSID: Mc8vCgCnDkXlqVZn58h6BA--.46377S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-PfHUUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgqwZWdWlR9k4QAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_002735_179079_41D21E21 
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

On Tue, Nov 05, 2024 at 01:46:02PM +0800, Wei Fang wrote:
> The netc_blk_ctrl is controlled by the imx95-blk-ctl clock driver and
> provides relevant clock configurations for NETC, SAI and MQS. Its address
> length should be 8 bytes instead of 0x1000.
> 
> Fixes: 7764fef26ea9 ("arm64: dts: imx95: Add NETCMIX block control support")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Applied, thanks!


