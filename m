Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B98E94116
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBdUSUUzUAO+uHJDNXuR0Aabeb5i3eNcfLnKDRmJt3g=; b=M9ac/m4ULkpdBi0Y2Py+j8qxz4
	n4wvrqp2kKrQw0Y5ghWMFqwzKw3ANylSjEbcAQroLARGAzSJFXjiZR7OexXhQY/9Qa+nlcn1xoEXO
	1NaZIz4+rL3x36KZTwthM/hfPPHvhDYuCmzqpmMCO/vgKsKwBf8YBYmlB/kDiPufEPGPD0WwYCOeq
	YvqQvfu1gsfW5Cas+fLEF3fCUNI48UjOuR+ufFIX3BBs9dShqh4kKVGA6MhstysvKIlIBfhdR2xWs
	3Cqh7lzATqdf8Rh6YEQgVKQ4fqLw7TZ/3au0XcGOG+x56wYZ3R2dyf0XL8p0tMgCgMv7H2d80JmFY
	qwZnVRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTkn-00000004UJw-2b8A;
	Tue, 30 Dec 2025 07:02:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTkm-00000004UJo-0NiP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 07:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 292E36000A;
	Tue, 30 Dec 2025 07:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A22C4CEFB;
	Tue, 30 Dec 2025 07:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767078166;
	bh=CfJ8F8iU9Q/hIIflH6ucf/8jx2EhqfUbm9hLwUy6qnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOf189r85cTs9Ba+Xw3eIq23Br0d1tzM7BC45gdWbxaHKzC/Ix1OWX5muJsK7T8V2
	 fF0YWU3L431zpEntxEXFLr1DMXS3x12bVpIZkC2QsMENfxt13fwmV9AQ7PeB3MYC4F
	 2JfseOBasOg5cqx3ugjfk5DrFUKvWZt7Aq6o9DIyf+WcuQ7x0CKBuBCOnKc3UAHocf
	 Ye0DjnK9CL7hPDjVMUpjSem2EUoZQlzjW2FS1iqnNqD+G1g/wTBYuNos3EX1PfZUcE
	 /+p2z2ZBamV/2sY0eU5L4X6LNqwsCVWo62GMjc5gW8e2fqHnZ7ptgk9lHEZRkx00h3
	 S03jQjWOWxpQg==
Date: Tue, 30 Dec 2025 15:02:39 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH 0/3] arm64: dts: freescale: Use phys to replace
 xceiver-supply
Message-ID: <aVN5D6PqZVLumY89@dragon>
References: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
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

On Fri, Dec 12, 2025 at 05:57:18PM +0800, Peng Fan (OSS) wrote:
> This is a pick up of patch 6-8 from [1].
> 
> The drivers changes have been picked in 6.18, just resend the dts changes.
> 
> [1]https://lore.kernel.org/linux-phy/20251001-can-v7-0-fad29efc3884@nxp.com/
> 
> There are still some other device trees not converted to use phys,
> those will be converted later.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (3):
>       arm64: dts: imx95-15x15-evk: Use phys to replace xceiver-supply
>       arm64: dts: imx8mp-evk: Use phys to replace xceiver-supply
>       arm64: dts: imx93-11x11-evk: Use phys to replace xceiver-supply

Applied all, thanks!

