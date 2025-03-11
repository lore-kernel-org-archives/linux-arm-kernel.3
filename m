Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF03C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPSlj+DOZhRo3Cam9wIjJ4SVrhTvYwkYYTH4FNeO3TA=; b=0YegTj5mHK1C0h/qkUcqEmE99b
	tPOnUUODXQ9YAVUmmrajk2oMa3qqi9umMAV4pEdM2jK21OvCjqW8oUqoLzYCwkxLlu5GsOqr3evm+
	StdIoi+5V6FVFk2wfhTp+qOnQTTJVwTLYLEgIN5fOfe8QZNdPEXWT8FWS3Awiqh2DMKpeLuz/pLYf
	tPk+V2IMS6ew8tlZeVJRjrO20gMocvEAAx3c1sn8h+w8Z1MCyoYJUbnQMd2WQpK7OZwvGf9/Sb6fg
	NN/ecCOheVPHUJKaknDQ53hG13lpjH+STYg6QniWsR/ZYbyfohoyx/prysHgYxzzy5xhFJvNvhOE+
	fRow3M+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tros1-00000004NjI-158Y;
	Tue, 11 Mar 2025 01:57:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troqN-00000004Nd7-1ts7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZPSlj+DOZhRo3Cam9wIjJ4SVrhTvYwkYYTH4FNeO3TA=;
	b=lHdgC4mZ2a0l7+ut7J0eq8QcsdE3VLD3oL1jzGNXEA/nU/UaVg4rDsby5e5rv9
	IE7uYDzwTWMn/ffe2M4T7oOBdEeKt0EsQTMF+YbkTuzlhUQ5y9jGnf6+fIzO8kS8
	SDvtyP7BTA5wVu1BGqhkJY055ixktUEGp/MHiqRksLIxs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBnq+IKmM9nYu2zAA--.818S3;
	Tue, 11 Mar 2025 09:55:24 +0800 (CST)
Date: Tue, 11 Mar 2025 09:55:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] ARM: dts: vfxxx: Fix the order of the DMA entries
Message-ID: <Z8+YCoJwtBeCSco5@dragon>
References: <20250220124809.2361942-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220124809.2361942-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgBnq+IKmM9nYu2zAA--.818S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx4EEUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgINZWfPVKnAwwAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_185543_846799_83B131F5 
X-CRM114-Status: UNSURE (   8.92  )
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

On Thu, Feb 20, 2025 at 09:48:09AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to fsl,dspi.yaml the expected order for describing the dmas
> and dma-names properties is "tx" first, followed by "rx".
> 
> Adjust it acordingly to fix the following dt-schema warnings:
> 
> spi@4002c000: dma-names:0: 'tx' was expected
> spi@4002c000: dma-names:1: 'rx' was expected
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


