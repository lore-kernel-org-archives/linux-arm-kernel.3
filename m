Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AEECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVmUHKrtpOYQxCJmFxIgVTMfEmr948Q51zk/Mp4w9sA=; b=482LGGz2cpzdUW6lJrZD4gJ8FG
	5OOo44vq6hzPTNTs6QopUyUep0L2psKiDTfbRdLB40tbVYs4hekok4NSVnfoe5xY5RMiQyTrdiaNu
	Sjfc/CV6ehgKCrY0jYEkA0Qq1Svv93BqSZZ6z/1mZ51QWdIX95V6qRhHxXTbMvhwD9RUpuVf8eHcI
	Z5jB6NqaADihMuIVPSNDWhVhJgfPr/57SsGll5di+uFJextUHfykzpyPCq5Cxm5SDYNCm7J4j2I51
	Dxh5mKF0xbTdnKjhfQUrKgHHb6+EHbHFJ3YUPEIV+P9ZCHW7Om0qokmK8SuV9DqP2IhOs5IGiUjCq
	07UGoRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upT8k-00000002tmD-2Z5C;
	Fri, 22 Aug 2025 14:53:14 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOGl-000000024xe-3PFE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gVmUHKrtpOYQxCJmFxIgVTMfEmr948Q51zk/Mp4w9sA=;
	b=oylgM3tFSnx4A5WIBcMnNR2bRmfU2hMq+L/eFtSkHY6D6n8fmoggMckqx4TQzx
	aK7N4fozcEq0igDoFMqSDBk62BYarjt7Nn4FnOPKMdsOutEHo+N92VQnbLuUopE8
	qyUdzVJ/X5zF0orwPecLDe1Y5SELceBeIkdtY7uPeLw2w=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3T6cjO6hoXhEWAw--.33224S3;
	Fri, 22 Aug 2025 17:40:52 +0800 (CST)
Date: Fri, 22 Aug 2025 17:40:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/4] ARM: dts: vf610: add grp surfix to pinctrl
Message-ID: <aKg7IhnulkotjNub@dragon>
References: <20250819-vfxxx_warning-v1-0-080930d8e1ea@nxp.com>
 <20250819-vfxxx_warning-v1-2-080930d8e1ea@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-vfxxx_warning-v1-2-080930d8e1ea@nxp.com>
X-CM-TRANSID: M88vCgD3T6cjO6hoXhEWAw--.33224S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2LZ2UUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARuxZWioHpBJPAAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_024112_229595_86A1AB16 
X-CRM114-Status: UNSURE (   7.22  )
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

On Tue, Aug 19, 2025 at 03:44:07PM -0400, Frank Li wrote:
> Add grp surfix for pinctrl to fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: pinctrl@40048000 (fsl,vf610-iomuxc): i2c0grp-gpio: {'fsl,pins': [[144, 0, 0, 0, 12738, 148, 0, 0, 0, 12738]], 'phandle': 19} is not of type 'array'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


