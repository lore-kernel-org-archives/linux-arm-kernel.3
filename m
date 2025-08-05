Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6684FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/N+pabulBvha5ZEhN29wupcgWLXk3sW2tBjPgU74Mpk=; b=vBn3nT5NhamA2eP3GC2z7PwBLF
	IEyWGTW7SjDjppCkQP7+ouNDb29LMQ705/NJNqI4mRbmEUlNSK2GykowO7V0lJ2GxohxdEplilNcU
	sY4sJfHJw2YtOXUx2fxjaOkv0qmdFsVzI/lZ1q6BxjX5GGpVr9R12kYnE5QUtJabYe0b0vKKTB2CS
	a4o5BxBCC03e0KaIWUheldbJg9gCC5t6OqENQ7LL4E6jH3bAva8UVrO7rO7s3rNwElhwt9VvwHjyq
	6z9l/RjMrZ9MzQ4rDJZ8nTlsE6nEkfQnesESocGdOWdqBuQTKNh275XVXRWA1aPLpZQmF4y2Nat5M
	IrC5hLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFMx-0000000CY2q-29fV;
	Tue, 05 Aug 2025 10:58:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEyA-0000000CUn2-1lIO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/N+pabulBvha5ZEhN29wupcgWLXk3sW2tBjPgU74Mpk=; b=1OPuWg8/x1VCIQSz1+viSjZdDU
	698zT2qyHXZDGe+4K8fpJnRl13r6a/YyMNqF2vKIljJk5TZcNu/3/OZICgz7kH/DyaQrIVvF/VOuO
	RKo7+PAI+2C5XKRTzqyaDg5Ruazmq2KWOTZoSvO8fEOtGYJnn2DyXUWQPBiSJPPEx3nssI3Z+r8cG
	OSv6ugU7fCyaZ7u2TA6RmftMbisSlWxNRnACxFJGob+lLOedoQ00kPZi7tvFZRZuVhx/A2itZraVB
	EdxsabgA+oGpGUEN24zU+HjT29x8mGZoUjfSBwORfixBnjRI23pCStEW6vmI9JfWbMJqamoD7B3Ky
	BZ66+4dA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53592)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ujEvw-0002us-1r;
	Tue, 05 Aug 2025 11:30:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ujEvs-00060p-2B;
	Tue, 05 Aug 2025 11:30:12 +0100
Date: Tue, 5 Aug 2025 11:30:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] drivers: net: stmmac: add
 STMMAC_RELATIVE_FLEX_PPS
Message-ID: <aJHdNMWPqNsU9AiK@shell.armlinux.org.uk>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
 <20250724-relative_flex_pps-v1-1-37ca65773369@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-relative_flex_pps-v1-1-37ca65773369@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_033234_482726_1DC86279 
X-CRM114-Status: GOOD (  11.81  )
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

On Thu, Jul 24, 2025 at 02:31:18PM +0200, Gatien Chevallier wrote:
> +config STMMAC_RELATIVE_FLEX_PPS
> +	bool "Support for STMMAC system time relative flexible PPS generation"
> +	default n

There is no need for "default n" because the default default is n.

> +	help
> +	  Say Y to add the MAC system time to the arguments passed to the
> +	  PTP driver when requesting a flexible PPS generation. This avoids
> +	  the tedious task of passing an absolute time value when using sysfs
> +	  entry.

How does a distro decide whether to enable or disable this option? What
does it depend on?

If it's only for some platforms and not others (due to causing
regressions) then what is a distro supposed to do with their kernels
that support multiple platforms?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

