Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB92DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNgMlJS5ZV9CpQ5TDaFZmPvShL3DjCW9G7C159H+3IQ=; b=EylfxP/Fj6EojXF+34f5WeQ02Q
	JBHIETn1AIGHGE1cOaSczQz557OP76J2xxkvvlF4IC+nHG07u0XeWVmbGLHYbnhUbVmwi82NHU4Xb
	+B5s4oWot8Ob4EcFYEMIuI3a40zaEfbzpPYXMGNKW/+yZ3mQP2+oUuX2rpZ/1K1DJI2Nc4KZlNucq
	s7mpi7gC+63ACPnZmsrTsvz1yqiIdoIQqrRgYIDdFkpj0XlaIYD97D9crfHPJ8f486YL080jWae3k
	kij+U712IjCFv/ItGfXjKj9F5BCDTEHHJ3LaZgw5PyHbGDzCCkaDu1dBmGz+TeBXzN2JH/VzHi7b1
	spcxrhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTu8-0000000HWF9-0ai1;
	Thu, 15 May 2025 08:25:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTpm-0000000HUq8-1Vmt;
	Thu, 15 May 2025 08:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08F2E5C02A7;
	Thu, 15 May 2025 08:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEA5C4CEE7;
	Thu, 15 May 2025 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297253;
	bh=PwH7evc+Zg9zQbRLNnZYre+nyvUninerAdI6sm9HyQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8e7QL4f51Ns4Svc0BXooM7bT20NZqGbI//uIINvG1stzHDxRcXJHYef3s//B1WpU
	 7GNI0lWPGEe9/Cj3Cczav4tFDlVpjDBDJ3F35V9E6+r1hAu21RctQtzhUkuXi0jnUI
	 cQCLFRf3tk1S/gioQhLMXqESwWaU6bJNXFZH5m20dh0KJykQ6OS882ysxZPl7UhM8/
	 rivdHdJUeuWxsuPi35S75xgmhmAon9rYsZBF0FicGfQHcIleW6jj/wLftN2vJg9g+2
	 DX2vYLGbiu4BguZ6ZgXbfCX3eVryGzzbkiEiWed0lsYOCjaTy8ItdHkkkh+/wbBRZq
	 pd9djPFaUyykQ==
Date: Thu, 15 May 2025 09:20:49 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/2] USB PHY support for Exynos990 SoCs
Message-ID: <aCWj4cn4y+RyfGiZ@vaman>
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
 <aCRXgpD0Ld2W4lHE@vaman>
 <D9VYC98LJTR0.LJXYC1H0BAKA@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9VYC98LJTR0.LJXYC1H0BAKA@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012054_451675_81142429 
X-CRM114-Status: GOOD (  21.87  )
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

On 14-05-25, 16:26, Igor Belwon wrote:
> On Wed May 14, 2025 at 10:42 AM CEST, Vinod Koul wrote:
> > On 20-04-25, 21:28, Igor Belwon wrote:
> >> Hi all!
> >> 
> >> This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
> >> This SoC has a combo PHY that supports highspeed, superspeed USB and
> >> DisplayPort, however due to my inability to test the superspeed part of
> >> the combo phy (device always enumerated as high-speed, even on the
> >> vendor kernels/bootloaders) only the highspeed part is brought up.
> >> 
> >> These changes have been tested and confirmed working (with the USB_ETH
> >> gadget and telnet/ssh in a ramdisk) on a device from the hubble family
> >> (x1s) and also a device from the canvas family (c1s).
> >
> > I am missing the dt patch, can you pls report the whole series if you
> > would like me to review and apply this
> 
> Hi Vinod,
> 
> I've sent the DT series a while back (before resending). Usually I
> propose DT changes through Krzysztof's tree. The patches are 
> unchanged (they will be resent unchanged when all usb and wdt 
> changes are merged).

It makes sense to post bindings and driver togther and mostly these go
thru subsystem trees!

> 
> Here is the patchset:
> - on patchwork: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250217-exynos990-dt-changes-febuary-v1-2-99935218cbf4@mentallysanemainliners.org/
> - on the mailing list archives: https://lore.kernel.org/all/20250217-exynos990-dt-changes-febuary-v1-2-99935218cbf4@mentallysanemainliners.org/
> 
> Best regards
> - Igor

-- 
~Vinod

