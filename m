Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7FFC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVrGGL5Q0nSgj2p380L09qPkXcrVRBJyN66cazrVrMM=; b=C3ApH6IfSFWCRj4ucKnOkRwKyV
	zmdmaStcZh6lvZ1YVu0k/xuG9BDXPKwjevValmTDaAb6SZhwQfFx4l5gZzNbwicvHKKzFJDSZcEB3
	E98vLflr+4WhoBDLk+g4u/Uvro7WkmKQoeHH0qKGpAVWPrW7H5eoI6NnIZ7kxeDEbDX5f1vWqvp5B
	NbB2fyq/qJSjLT8uMLFDU2UPGiSSGVlC7wUScl7yCsd8qbr2Xv6XHGr62f6GBAwX50zoklNKiqEjb
	/boLDP7Y0aPnFlV2dtk07y5+5LprnynJiL8RdccAQgpRENEbGJ1R11OItgrW+hVKc39q2apRZv0PI
	3MJkAayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTXt-0000000CUDj-3MWO;
	Mon, 10 Aug 2026 17:12:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTXt-0000000CUDX-1Jiv;
	Mon, 10 Aug 2026 17:12:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0B684393A;
	Mon, 10 Aug 2026 17:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5881F000E9;
	Mon, 10 Aug 2026 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786381936;
	bh=fVrGGL5Q0nSgj2p380L09qPkXcrVRBJyN66cazrVrMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjGA/P24nLObN/Vr0Bxq12S0QmU7205Y8TzFWVr4OpTB51Nd4GtcEPxwaNVh5NLY/
	 Hk870KboTaYos41UywIijUWP3lCPNOr3XiUbNzg2JR+WFmMUJ01xs9HHUosv/IG7HD
	 bj54JiKJBhSDlWThr6gedepNZrPRdreI5HoQdfLV/WE5NWmWa654WjYcXxrPStliRh
	 p2Zj5kFWg6+KNdbmipxEEADZGm1w8pFmFt5//PmCO7lY3AUodjHHKu/fLekg1Dtan4
	 Za+sUxmqcSAJSMiDJEfrQzAMrReqclqt8FH7is5NZlviPAdg/Rf7Vy633pOmQOqCsk
	 QhAXbL278yMcQ==
Date: Mon, 10 Aug 2026 19:12:06 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 14/16] power: sequencing: pcie-m2: Split Bluetooth
 unit based on interface
Message-ID: <ns5zexfsbin4om3klprrh4v2xfvhhg5nztbbf5neakyuwq47bc@mckelf2d5x5f>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-15-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724084328.3943997-15-wenst@chromium.org>
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

On Fri, Jul 24, 2026 at 04:43:23PM +0800, Chen-Yu Tsai wrote:
> Some UART / serdev based Bluetooth drivers need to be able to reset the
> hardware during initialization or recovery. This is not possible with
> the current power sequencing API if a unit is shared between USB and
> UART interfaces.
> 
> For now, split the Bluetooth unit into two, one for each interface.
> This allows either interface to independently toggle the power, with
> the last action prevailing, thereby unbreaking the Qualcomm Bluetooth
> serdev driver. This is also needed for the Realtek Bluetooth serdev
> driver (hci_h5).
> 
> Having independent control from either interface unfortunately means
> that userspace is able to shut down the controller from sysfs using
> the USB port's "disable" setting without the serdev driver knowing
> about it. On the USB side, independent control is also desired, as it
> allows the USB core to power cycle the port/device during faults, and
> for userspace to initiate reset and recovery using the aforementioned
> "disable" setting. However when USB is used, a serdev device is not
> created, and there is no conflicting usage, which allows the power
> sequencing to work even without the split unit.
> 
> Suggested-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - New patch
> 
> This patch is _not_ squashed into the previous to provide clear context
> on the change, and the less than perfect nature of it.
> 
> I think what we need in this case is some sort of lockout. The serdev
> consumer would want "exclusive" access, locking out the USB consumer,
> which can tolerate "shared" access.
> 
> Something similar would be needed for the WiFi if we ever add support
> for SDIO for toggling the state of W_DISABLE#1. At least the SDIO and
> PCIe reset signals are separate.

I don't think PCIe/SDIO suffers from the same issue as USB/BT. But anyhow, I
think it is OK to have this patch as an interim solution, but we should try to
model the BT control in a proper manner. I'd fancy adding TODO instead of XXX in
the comments. But nevertheless,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

