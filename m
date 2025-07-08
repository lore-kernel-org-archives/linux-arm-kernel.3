Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBFEC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aenlRMHsQWf230y3ByJlfMQQ8hx6Yn/ZktY6wc88/wk=; b=d6pntLMmgloX9vYlqtrxt5hxz2
	EASdfek3xcuZjfKU1ILFY6qiBuFO9Nraj0gmu7kRUb0orKBPXp9nImTROP9yGxm89T+1EsnVOFvBN
	fXauJl/FfckG2O9QMeq0avt7ULZ9vRcxL1U0HAX+cLrD0bvcPc1p5lEMKIFmzoaeAEpIkGzPyP4bV
	WRNaYZbmGk1VMCjcMUItbcsBbCA51BVcXqigfsxNie7lddU4iXjxjGxC2+6ssFsOqTnMdE7Zghm/N
	W0vVnAsSf13zHcXyS/2ZaHFQ+4x/7R3+ZS9kVf1ibtfBi3nKg47Q/4bO2/wu9AlL7WAd8ZzpS6Tg5
	DMI8wU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2Gw-00000004W9l-3GCF;
	Tue, 08 Jul 2025 06:57:46 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2DM-00000004VOL-2qX6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 06:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aenlRMHsQWf230y3ByJlfMQQ8hx6Yn/ZktY6wc88/wk=;
	b=k6YUiYfqUwGLNoz6thTc/RodI5PlHSS+JlBjI080QfgV3Zmdf1apTg2Y4DecnM
	wrG558i6bjxgyuFVNlgLNvVqDw/FsrCiBZXm9X3aRlvDc6OvabntbToTds0cEr9i
	t+tgks8HPtDZM+E3ZSFQZk6ZnmFMCBFJhLIGRDEBHzgsE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3vxZuwGxovnOJAA--.44602S3;
	Tue, 08 Jul 2025 14:53:36 +0800 (CST)
Date: Tue, 8 Jul 2025 14:53:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: Update i.MX entry
Message-ID: <aGzAbk8dYliAfCrn@dragon>
References: <20250707063753.1684144-1-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707063753.1684144-1-peng.fan@nxp.com>
X-CM-TRANSID: Ms8vCgD3vxZuwGxovnOJAA--.44602S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8BT5DUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR2EZWhsn652vgAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_235405_103451_7EFD270D 
X-CRM114-Status: UNSURE (   5.67  )
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

On Mon, Jul 07, 2025 at 02:37:53PM +0800, Peng Fan wrote:
> Add two patterns:
>  - Documentation/devicetree/bindings/firmware/fsl*
>  - Documentation/devicetree/bindings/firmware/nxp*
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!


