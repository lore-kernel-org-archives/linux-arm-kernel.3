Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AFBC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ej8KG4/2/1Ys4Qu5govMGMKUjxOfseiqsdADZaPMHs=; b=MnE0UcEu5q50wRK8SJ9c3xytwu
	w/Cz55vvIpDJb1KdndrRSTLXOLthlr5hOZ1lEhKOfe4fWJIJ239N5/7pih73Wyha++KbqFHVV0CzS
	4jPrLHztli6XM3Op6fEWjRDoICeJoK4qIijG3Hrigz5Ozb3ZMQGDQsI5/f1rQZS7R9mTW7U/hLSKV
	uJL/JLc0etGNFlQz4UXDJnBbWHrTc7xzL7Rxy+fUSILWW5CdsXftlwA0MMxUDS5JRO63I7m3rZ4b9
	Yug0JXoJuTFIbmkih4fxpKGF3thHaQf0X3/ykuSMjLv4SRF8591dQrr9+Pq2/dInWsRed9MTOQ7mO
	xr4QGZwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Ky-000000061zr-2rJh;
	Tue, 25 Mar 2025 13:29:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Hj-000000061T9-1eFK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+ej8KG4/2/1Ys4Qu5govMGMKUjxOfseiqsdADZaPMHs=; b=QA86jJu/HworQLcDYT5rbrBNzV
	N4XeZ7D7wYiE/QMN0hq6iUGeCCzLMMflaW4WSnlUZUWVnVK0FpOdMXQ7Lso895TbVc8PkZLGpSiu5
	hGfLnonx9wLfV653jPxKOP7DSXrlKBC7mJN76nOalY5sC8SYNAqs5W7IWj9pILcqV9DKh7JSs2udK
	EyuwS57AC/kRF0SB2RnEIgsmrMNVEVNOksKda/3nEqQNF8rKs8/ofNsgXPWepxEQnAEgU7bPwN4R2
	wZdeEVFv1hmqCv1FSBvJ2StIR9QC8BkiYHzRA/+eil4rDIQEg1EfKp0TCVOWIy/PM2yW1KfGfuF0C
	nFVUk09Q==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4Hf-00000005SWc-4ASh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 006D35C587E;
	Tue, 25 Mar 2025 13:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D50C4CEED;
	Tue, 25 Mar 2025 13:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742909132;
	bh=dr/I/9nNgrTKDQbi1FOfdC3fHsEg+MgYpU5p3SIxKFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKWM5ZD7jugXW5b5BRsr96+Cfdtb5zImy9KHAmlaWtdOeYduPQKFXMoUrn79QBKoK
	 hlrLoh9b4kBVcBAYPyq72peGkYoERUrgG1eKnzpkDi9Add/E/sKRGqdvylh45TOD96
	 yJtlrk1oHu5JcDQvI5aoO+0fo3Tjz715zakPyooFuXqgZ5aflbqHGo8QiXtfxemt+z
	 1AUe7moQmSFX3wpUfvx0WaNRJMW/aqZ3qMv1hBrR+tpj7ITd28dooL0hl46lgKFmwY
	 Pnl5T9mt3bBUuL6mW8IExIctbXQGxK07xtOvSvQReadebYzipdP5jfJy3IOWzGwBps
	 KP4qV1lCag4GQ==
Date: Tue, 25 Mar 2025 08:25:31 -0500
From: Rob Herring <robh@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 08/13] PCI: apple: Set only available ports up
Message-ID: <20250325132531.GA1717731-robh@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
 <20250325102610.2073863-9-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325102610.2073863-9-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_132536_279434_2C7E6BC0 
X-CRM114-Status: GOOD (  19.27  )
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

On Tue, Mar 25, 2025 at 10:26:05AM +0000, Marc Zyngier wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Iterating over disabled ports results in of_irq_parse_raw() parsing
> the wrong "interrupt-map" entries, as it takes the status of the node
> into account.
> 
> Switching from for_each_child_of_node() to for_each_available_child_of_node()
> solves this issue.

I really wish "available" was the default iterator...

> 
> This became apparent after disabling unused PCIe ports in the Apple
> Silicon device trees instead of deleting them.
> 
> Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
> Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Cc: stable@vger.kernel.org

Fixes especially for stable should go first in the series.

> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pci/controller/pcie-apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 6271533f1b042..23d9f62bd2ad4 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -747,7 +747,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>  	struct device_node *of_port;
>  	int ret;
>  
> -	for_each_child_of_node(dev->of_node, of_port) {
> +	for_each_available_child_of_node(dev->of_node, of_port) {
>  		ret = apple_pcie_setup_port(pcie, of_port);
>  		if (ret) {
>  			dev_err(dev, "Port %pOF setup fail: %d\n", of_port, ret);
> -- 
> 2.39.2
> 

