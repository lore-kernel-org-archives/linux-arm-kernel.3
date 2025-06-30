Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4EC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 03:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC3PpwZilNiTUO9T3N1jve3LMEKnZfHx+jcycfs6XYI=; b=oadD/9a+kR9ga6YQAlWoL8SEO+
	VV4EqzI+rG4I5CWrPRZYW5PoZDyhtiP2yawEAd5RJKgtU/wMMrIynN0h1k84SnDWYTG4orqj72eHV
	6T2ZV6I4uFrj0wOPDUPndobEGubOGXhTAA3REjEvP2SiwF+f8GnNZlevsq8Ct+EN/YlxKtEAG42j9
	qstuiu6uFma1xXydlaC56ZYa/PlH1RcRBhlqdJ+Hf7yZaoVc8QXCc7pPi7PGfEDUcE922kxI4jpT6
	IMq4XGYT+vGRyNu6szpiI9nSANeXTb+6cUu1XzCkCrm2sj2fGYnp7TPC3sN3NgV0G1r1tibdK+zNL
	4I5PvrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5Ws-000000019KM-2Ut8;
	Mon, 30 Jun 2025 03:50:02 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5UW-000000018wx-3jj5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 03:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=MC3PpwZilNiTUO9T3N1jve3LMEKnZfHx+jcycfs6XYI=;
	b=N7aGd5qdzoWWFzieN9fkXxNetlhygQmqSIiZToazHyALyoSFCZESx52z1V66gK
	he+efT+cy3t+JM44yyIZ1CTxwW+7NzuhOgh7GjvyyP4uUqUrhvLUVSGjCMIC25R9
	WEszdsj3W6LW0hwHdc3I75YNpYnSDAJ5041WHQNkaTzUM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3nzjFCGJoEjPOAQ--.37623S3;
	Mon, 30 Jun 2025 11:47:19 +0800 (CST)
Date: Mon, 30 Jun 2025 11:47:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Meng Li <Meng.Li@windriver.com>
Cc: krzk+dt@kernel.org, linux@roeck-us.net, s.hauer@pengutronix.de,
	kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev, shawnguo@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH 2/2] arch: arm64: dts: add big-endian property back
 into watchdog node
Message-ID: <aGIIxTjmpPPhhtpN@dragon>
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-3-Meng.Li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608030616.3874517-3-Meng.Li@windriver.com>
X-CM-TRANSID: M88vCgD3nzjFCGJoEjPOAQ--.37623S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1fXw1DZw47CFy3Gr4Uurg_yoWxAFgE9F
	15Cry8WF9xJa4jyws0yan3Zr9YgF4UCrWrG3WrCay3Aa93JFn5JF4ayFsYqa1fAanxZr98
	Aan5ZFZaqr48CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1D73JUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ98ZWhh4l2X2QACsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_204737_292429_7406CE83 
X-CRM114-Status: UNSURE (   7.56  )
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

On Sun, Jun 08, 2025 at 11:06:16AM +0800, Meng Li wrote:
> Watchdog doesn't work on NXP ls1046ardb board because in commit
> 7c8ffc5555cb("arm64: dts: layerscape: remove big-endian for mmc nodes"),
> it intended to remove the big-endian from mmc node, but the big-endian of
> watchdog node is also removed by accident. So, add watchdog big-endian
> property back.
> 
> In addition, add compatible string fsl,ls1046a-wdt, which allow big-endian
> property.
> 
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Applied this one, thanks!


