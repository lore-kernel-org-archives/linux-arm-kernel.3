Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9664D6101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDvw9Qfr4vqNELgD4bWuCdghWFw0Szb+OOKl9xxGUSs=; b=SYWkQJKcSklLDEM6mf0stMAk42
	uLL5nT3HqiTkZ14fDFCHrkczpYNzsPsyefOhJGwjBiic7iRu1OipypogcaFHhb62e4Auckka7P7DM
	ZLjpnbjvESZBvm91qKGTfUB/4LQBiqlM7VtIAU4p0wLe0Gw5KsBqSqc+g4PeV744X9LfBiCxorfM7
	DDRTLMo42K4sHouN64WYihLeeR724c0PFjD2k+o6A1Jufr5y24xw3+swkGuRuXN//3AA3TsvBoUK5
	uAde3LQcfBK0FmfSTvXn02Q/LDNyjhsCgIjtjiJNsLkWXH8p/utfqHE1vDkTnPixPqGrTH1qQiDvc
	bSaSWg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSfu-00000000CQi-41FM;
	Thu, 29 Jan 2026 14:07:10 +0000
Received: from grimmauld.de ([84.247.166.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSfs-00000000CPv-1JeZ;
	Thu, 29 Jan 2026 14:07:09 +0000
Date: Thu, 29 Jan 2026 15:06:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimmauld.de;
	s=mail; t=1769695621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LDvw9Qfr4vqNELgD4bWuCdghWFw0Szb+OOKl9xxGUSs=;
	b=H9Lk7PLfjvzxEPY2ckj6TV8xHEUfKCTQ9G9AOE5zTrFVnSXne65omKgxno1wUbeCjyDAT2
	nKaMfq625YgEkQvSFyh2j+FfNB290TKowl3414NP6n8K5OGRTjWyI70JHKAHQTpSKPuky4
	8WVcOvtFVpdcWx13hpXbDHI6Tw+gXi8=
From: Grimmauld <grimmauld@grimmauld.de>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <aXtpg0V_sifQEWHJ@grimm-nixos-ssd-2>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809073610.2517-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_060708_582452_117B7932 
X-CRM114-Status: GOOD (  20.72  )
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

Hello Anand,

I have tested this patch.
Hardware/Kernel information:
- radxa rock 5c lite
- rk3588s CPU, arm64
- defconfig NixOS kernel
- picked onto 6.18.7
- DT: rockchip/rk3588s-rock-5c.dtb
- tested both uboot (mainline) and edk2 (vendor)

On Fri, Aug 09, 2024 at 01:06:09PM +0530, Anand Moon wrote:
> Rockchip DWC PCIe driver currently waits for the combo PHY link
> (PCIe 3.0, PCIe 2.0, and SATA 3.0) to be established link training
> during boot, it also waits for the link to be up, which could consume
> several milliseconds during boot.

I found that without this patch, USB 3 ports as well as the PCIe connector seemingly stay uninitialized during boot on my hardware. 
This manifests in a bootable USB flash drive loading initrd from bootloader (both uboot and edk2) perfectly, but then fails to mount the rootfs from the drive.
In effect, boot is not just slower than it should be, it just does not boot all the way at all.
In that scenario, the devfs entries corresponding to the flash drive are simply missing, same for the sysfs where i would expect the USB device listed.
Replugging the USB flash drive during initrd does seem to fix that, but is tedious and not viable for a server.
Similarly, booting from m.2 SSD attached via PCIe fails the same way, with rootfs timing out despite the bootloader correctly reading initrd on the same drive.
Fwiw, replugging the SSD does not work like it does for USB flash drives, and is even worse of an idea.
USB 2 ports as well as SD card boots correctly, even without your patch.
Without your patch, i am seeing "deferred probe pending" in dmesg before boot gets stuck, which was the hint which made me find your patch.
I am not sure whether that is the actual cause or just a symptom for why drives are not recognized during boot, and am not quite sure how to debug this further.

> To optimize boot time, this commit allows asynchronous probing.
> This change enables the PCIe link establishment to occur in the
> background while other devices are being probed.

With this patch, booting from SSD or USB 3 port works flawlessly, and i have not seen any regressions with SD card or USB 2 boot, nor any other hardware component.
This setup has worked for multiple boots without fail, both with traditional ext4 and zfs rootfs being loaded from USB 3 and PCIe.
Because i require this patch to run my rock 5c from SSD, i am currently running a custom patched kernel, but would highly appreciate this patch making its way to mainline eventually.
There might well be something else going on here. The proposed patch may not be the "proper" fix to the issues i am seeing, but it does at least work.

I have NOT tested boot from eMMC (either with or without this patch), though i have no reason to believe it would be impacted.

I am happy to provide more info as needed. First time posting to the LKML, i hope i am doing this right...

Tested-by: Grimmauld <grimmauld@grimmauld.de>

Regards,
Grimmauld

