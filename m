Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE15C79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=k3AUNire+h2WURQcH6zMYExzm+Y/imAM5rniVoBDFzI=; b=iVoTjRNu/HiiS3
	V90q86zGzxIx97h3t/868ecl2W9DjQ4TI8L+1AgaRTgjIy7iLQr8PW0c+yKs3qob7mIwwx5wh2saU
	jNlprFm1gc4fMsdtJdvEY4AbFC8qxurvVmDKTY3/Bjb4h/9+fLOgQ7BNeXOvDeZcZlIpeDJwBAJ7R
	vtAzBGwVZUM10vOVzQJuefNyQfidu7z9Ar3tB/rsBj5wEt6W4IQEsdgt+4J5U3ckuxaYm1Qm8pvd8
	VL9d5wdcqW/1uJPzuZh0umDAQbCLcGTPoCwL10/mDL9rvDTEmsWMPXpt1BkejhnjfUgM7IIXi++Bj
	L35PmCU/qRglrCD2bXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoLS-0000000BpPn-1WTU;
	Mon, 05 Jan 2026 17:26:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoLQ-0000000BpOe-0JoP;
	Mon, 05 Jan 2026 17:26:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 857B143A4A;
	Mon,  5 Jan 2026 17:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EA3C116D0;
	Mon,  5 Jan 2026 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767633974;
	bh=QRhjmAuGgDI4aNSnURCOuJV5ccPObzRNDO3W9guQetA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FKOtaPGUO2G25GOPhqyxd4OfRl7khmGTwHNfQB/l7GSxRtsRSiuBGdG73yMP4jLnI
	 penFOUDTzfWGEB7LWAgYIGod3IsPAAT2jlFiJC/0s8XUOBQKLeDAKjHmo4SwlhCYuF
	 TDuYxrk8+zUXE1afMIrSneo8Fsyv+5GsMefvxADfHuDN7FFIlZ96j/A7+4KWuAGZpJ
	 HNFVhPTDiyEGJxGKGL66d6k93ioNkDpjmWcSlhdD4fTmkSatAEzA29tDjSv15TQ/mj
	 4ZPNClHlJnXLZYWEF7BsCI7k/jUagh0KgX2SUmbpBadFFpVWzrk28rQjdDT40Z07Dm
	 ku47N3Dd4Slgw==
Date: Mon, 5 Jan 2026 11:26:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	bhelgaas@google.com, robh@kernel.org, mani@kernel.org,
	kwilczynski@kernel.org, lpieralisi@kernel.org, yue.wang@amlogic.com
Subject: Re: [PATCH] PCI: meson: Drop unused WAIT_LINKUP_TIMEOUT macro
Message-ID: <20260105172613.GA322262@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105125625.239497-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_092616_137754_F523CF5A 
X-CRM114-Status: GOOD (  15.07  )
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

On Mon, Jan 05, 2026 at 01:56:25PM +0100, Martin Blumenstingl wrote:
> Commit 113d9712f63b ("PCI: meson: Report that link is up while in ASPM
> L0s and L1 states") removed the waiting loop in meson_pcie_link_up()
> making #define WAIT_LINKUP_TIMEOUT now unused.
> 
> Drop the now unused variable to keep the driver code clean.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Squashed into 113d9712f63b (which is now on for-linus for v6.19),
thanks!

> ---
>  drivers/pci/controller/dwc/pci-meson.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index a1c389216362..0694084f612b 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -37,7 +37,6 @@
>  #define PCIE_CFG_STATUS17		0x44
>  #define PM_CURRENT_STATE(x)		(((x) >> 7) & 0x1)
>  
> -#define WAIT_LINKUP_TIMEOUT		4000
>  #define PORT_CLK_RATE			100000000UL
>  #define MAX_PAYLOAD_SIZE		256
>  #define MAX_READ_REQ_SIZE		256
> -- 
> 2.52.0
> 

