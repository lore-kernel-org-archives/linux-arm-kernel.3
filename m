Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5300BC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 05:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpZwSMsikkY5e1IDRF7CovSvRYahYoXectdVPFTib54=; b=EJETMsZ2jPHyPqHqfpUyzWUUba
	xltc1I+lMwiTL7TbR2RM3HmPc4c5WbT182Eg86IW2CMWOACgbJeGAGYbLek0tiE8M4SvZ0s2ByVQ9
	TLW9DTmEj/4YjQErPNkIRQkiASLqfm4fYuhgg21+1yn1ZcdSZcoyUe3rV3+Dt8ceUfC63NEPB8bWj
	SJuT1qkDYmoWpLWfNJ30m/XBdHErfw0HC0bGse4ZKqGI8b7XzLQXn8N4JYD2upRN72BaCt/ocRjOZ
	sBm0jO5OXPeRBl3cEZfiZaBKFjaJIYgoPtEioGjHlqu1sAVtbAh38l73YcMNssumPS+F0WlEgJfV4
	quVWpnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXZDH-0000000DL6I-0hRr;
	Fri, 04 Jul 2025 05:43:55 +0000
Received: from proxy25214.mail.163.com ([103.129.252.14] helo=proxy41134.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXZAv-0000000DKu5-1h5D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 05:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hpZwSMsikkY5e1IDRF7CovSvRYahYoXectdVPFTib54=;
	b=jzxXinBt44+BQ1jBtQTOSzsNVzdNfH7+Wh7Ibe1IBG1KpMpck/x+K5pTgSWmrF
	Q+x+dvGN1ZOVr3a4vQjexja4jFkhXciEmxPPGx3loNuwvUcjwORVXvcQt8pw3YOB
	M3xekiMNOtoNc9LucooJg4K8NO6XMHCLc0DovTDBkdnOc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3f_QvaWdonnQKAA--.22224S3;
	Fri, 04 Jul 2025 13:40:01 +0800 (CST)
Date: Fri, 4 Jul 2025 13:39:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH] arm64: dts: imx8mp-evk: Use fsl-asoc-card to replace
 simple card
Message-ID: <aGdpL5MUn58Se99Q@dragon>
References: <20250617072646.3226865-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617072646.3226865-1-shengjiu.wang@nxp.com>
X-CM-TRANSID: Mc8vCgD3f_QvaWdonnQKAA--.22224S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzgAwUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRFav2hnaTEUAQAA3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_224129_685619_EC14393D 
X-CRM114-Status: UNSURE (   7.02  )
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

On Tue, Jun 17, 2025 at 03:26:46PM +0800, Shengjiu Wang wrote:
> In order to support Asynchronous Sample Rate Converter (ASRC), switch to
> fsl-asoc-card driver for the wm8960 sound card.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Applied, thanks!


