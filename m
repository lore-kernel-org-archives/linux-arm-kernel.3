Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4727CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHGTe7z2X8VhNkwBjYC+POamvLkfxWgR48fLTVRtZcw=; b=iYQu6RraqkDRh7D5FQNLUQD3br
	/MlzbOlcTcrVKxcSZHq5wy1R05itaO7QPGE6aYDoTB3AcpNBKYBTrRDeWsHA6/shMCmUorlPJ+734
	uz8oI+CIJGSAh3t1MzxIczZYpTTf2+1TFAT+a8v7HWwgpU7F68GUMUWV1SfftRHMme1VkVYvBs06Z
	hvcgJA/ubc+Bfy/VSV1yKA4G5u/IqvnzFHOwVYTd1FnpeMAvX06Iic8EH5jnXUe6AE5EeDiKz59xE
	la2AzWaonfw7ElqvFCRdiz3vaEPSZkRV/P3B7Pc3V2rjKizAyDYtANxqhu2EKaf6BOeIhN5k0+ZCB
	rZ4Cp/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTp-00000004LRB-235N;
	Sat, 23 Aug 2025 08:20:05 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO8o-000000023XP-3wVl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bHGTe7z2X8VhNkwBjYC+POamvLkfxWgR48fLTVRtZcw=;
	b=aOygQgkooXvr4XzEcpTOuE1/Zwc7ECheoiXTrTD15h+kpJYOhPe0RD191+8wyq
	4U0ajuZTkae81jsumFF/hSuJImH2sEDStGSiD5nCBVjRQYGUS3+iFexh/fznJ21/
	y7IdWGPrkikqoKxC7HCQaJqzfW8ylAe3glUbJtVvNDvyM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnX_k2OahoS3soAw--.11369S3;
	Fri, 22 Aug 2025 17:32:39 +0800 (CST)
Date: Fri, 22 Aug 2025 17:32:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, stefan@agner.ch, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] ARM: dts: vf: Change the NAND controller node name
Message-ID: <aKg5NQH09gNqYicc@dragon>
References: <20250819194018.2850727-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819194018.2850727-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgDnX_k2OahoS3soAw--.11369S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU84E_DUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhefBWioOTcFoAAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023259_271743_29EAADD7 
X-CRM114-Status: UNSURE (   8.59  )
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

On Tue, Aug 19, 2025 at 04:40:18PM -0300, Fabio Estevam wrote:
> fsl,vf610-nfc.yaml references nand-controller.yaml, which only allows the
> node to be 'nand-controller'.
> 
> Change it accordingly to fix the following dt-schema warning: 
> 
> $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!


