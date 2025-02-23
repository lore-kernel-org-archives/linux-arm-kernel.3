Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58270C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJyf244BKYlmxx6vt7GoqUcdxk6vRqqaQBKzOBNAKR4=; b=CkYLQ+Rne726WttGt/cr8eyqtk
	jLkTXe2ZX2RaoBuDmHhJdiT9IslBB90frEa/kysLoOqD8NXq5wHlNpWDbOWEpf7aOzfzaFa0u9bMP
	h8k/17sJrD8vFsYYEhlbKwIQyJvIexoC95h1Dz/WGdfD7KfmBrMIOYeb89wo0suv603deQi6aQqz8
	P0VTKuHJFjGbAmmb7ryLGEu43xopSAUztixhUwtFrsR5EaaLVg36O4pWSqkKGPkpjnv5+uxQsfYMu
	UFdHDe0Fv62BGCfAt/FBJwB2D2HGlCH9kO9jahgenyCsfGT3EkeX/+c/r4hIst84UvoTFt1go37y9
	FWlsK7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm66p-0000000AYyM-3kza;
	Sun, 23 Feb 2025 07:09:03 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm65L-0000000AYrT-17XQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 07:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=HJyf244BKYlmxx6vt7GoqUcdxk6vRqqaQBKzOBNAKR4=;
	b=pwiskjuREwWzmU2YFTlaqpcyXqeUMxp/OSfnAqVymbXf9hiw9Lvtd+aoSjNZHe
	BUYwi1YXBYOj5bCWYD0HVnYRlE0r6lp4+qthgYGqkJbRtoulqY9meTBgNnJE6azb
	lQndUIoPaIjdjeueuP/UIS8n3dTWxJUZRp/W4vAFhnD+A=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3CsgOybpn9z2LCQ--.22768S3;
	Sun, 23 Feb 2025 15:06:56 +0800 (CST)
Date: Sun, 23 Feb 2025 15:06:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: imx: Make IMX SCMI MISC driver only selectable
 on i.MX
Message-ID: <Z7rJDYrPFf9dS+9t@dragon>
References: <20250204101531.233549-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204101531.233549-2-u.kleine-koenig@baylibre.com>
X-CM-TRANSID: M88vCgC3CsgOybpn9z2LCQ--.22768S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVxR6UUUUU
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQf8ZWe6ksy3WAAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_230731_623155_1E8D6EF5 
X-CRM114-Status: UNSURE (   6.93  )
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

On Tue, Feb 04, 2025 at 11:15:30AM +0100, Uwe Kleine-König wrote:
> This hardware component is only available on i.MX9. So don't offer to
> enable this driver without i.MX support or compile coverage testing.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied, thanks!


