Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63ACC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lzVcPZ+ufeW6xHTEb2H1zOZw/r4CQGt/NKHXM+D654=; b=wXdchDkgstFRiOwkWnYYiqipPf
	LgJg3AmDe4kdZeBohqR7BM+/xl700+yomlNGReK5D4y492eS8kQyLamu4kQtSZOLrVFTwwArjXtF8
	ca5OEOyMNsKADVo4SWAigecFoGi6EBBxxqa7gja7njI7R6VIbo7ig/ir0EPoPNBRw5DUbCkvaB/m3
	KKO3yAhXY8W8tKjLrEA1F7XWWVS+xBzjk6vuWTbqY87ufF5vEotYZMoS6ypujVgP5/RFQYUbSIH/R
	GL8XvS8CW374zJwsxL1dGVC4zrd9XG0sVpfdI5xIUGLBu36JU5ir4pBSlt58EHIFMRlAvNhgfrXy/
	8H/ex0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxR7-00000008k2P-3pme;
	Mon, 19 May 2025 10:09:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxHn-00000008iG1-1Yek;
	Mon, 19 May 2025 09:59:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BE285C1B99;
	Mon, 19 May 2025 09:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C87CC4CEE4;
	Mon, 19 May 2025 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747648794;
	bh=WdkVZramwGI8mC1TPOoMUf9FA7POUXwjiwSg9TZ1T34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JuTHSvGBuao+udd62qaUwmn5rY/W8IWSEw+QbgqOARvez+B1Z1eKRyiuGxy3WxyOv
	 xq/RipGvKezUbwf9tYIZ3WTQCgIPGQwQAGZIgmG3StIeq8J/rPW5R78MHTCV9/hyrE
	 VRYXyHZf3PKgQVO7twf1h7MYXvMLkcilE4Y8CwdPLwoPB42cISK9tDvdS4pD7moz0h
	 oi7VMJ7s1QbtLzlopdAfgjMg8QFXjp54qT7xblesUcVMwbBmhpQgR1/acb0cnZiv6/
	 N7rHl2MnRI5egEGl52GAvTicTvrX1h0U+l7so3OhndJIfRfUSHRuXHYu1HKLPS09SJ
	 3UEam3TxKTsBg==
Date: Mon, 19 May 2025 11:59:47 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org,
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com,
	jh80.chung@samsung.com
Subject: Re: [PATCH 10/10] misc: pci_endpoint_test: Add driver data for FSD
 PCIe controllers
Message-ID: <aCsBE7uwU9wyZIXn@ryzen>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193305epcas5p263b59196e93ef504eab8537f82c37342@epcas5p2.samsung.com>
 <20250518193152.63476-11-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-11-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_025955_454795_2858D18C 
X-CRM114-Status: GOOD (  14.95  )
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

Hello Shradha,

On Mon, May 19, 2025 at 01:01:52AM +0530, Shradha Todi wrote:
> dma_map_single() might not return a 4KB aligned address, so add the
> default_data as driver data for FSD PCIe controllers to make it
> 4KB aligned.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  drivers/misc/pci_endpoint_test.c | 3 +++
>  include/linux/pci_ids.h          | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
> index c4e5e2c977be..d94a94231ee5 100644
> --- a/drivers/misc/pci_endpoint_test.c
> +++ b/drivers/misc/pci_endpoint_test.c
> @@ -1110,6 +1110,9 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, PCI_DEVICE_ID_LS1088A),
>  	  .driver_data = (kernel_ulong_t)&default_data,
>  	},
> +	{ PCI_DEVICE(PCI_VENDOR_ID_TESLA, 0x7777),
> +	  .driver_data = (kernel_ulong_t)&default_data,
> +	},

Are you sure that you actually require this?

Since we now have these two commits:
e73ea1c2d4d8 ("PCI: dwc: endpoint: Implement the pci_epc_ops::align_addr() operation")
0d292a1e6d90 ("misc: pci_endpoint_test: Add support for capabilities")

My expectation is that DWC based endpoint controller drivers should no longer
need an explicit 4k alignment in the host side driver.

Thus, I would expect that:
{ PCI_DEVICE(PCI_VENDOR_ID_TESLA, 0x7777),},

(i.e. no explicit 4k alignment)
should be sufficient.


Kind regards,
Niklas

