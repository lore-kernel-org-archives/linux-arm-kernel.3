Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FFCCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2HYgAFk+fXNwDssXlkE87hVakpkUk3GgjBSxwPzjyY=; b=nw1WgRgpQ9DOxxciJcCyTZgLaT
	b6un0nGooEhq+CEysvwG5P9pc4BABt7L79/U3HgJ9BfEHjBvzmYq8/LHUiitJb83Cqk8zoHoOGiHS
	+SrTk+fTLbqpegA90IeGG1txhD6W3i1ASBztwhfHhRJ8Hc6QfOKpTvKh7xIeiMb2IPeQ0vOT0qf24
	YDxdfpE5j4vOS2IoHcU1u2VznDkuXkXKG+p9Td6LMGJQgfWGmb9yeYUWf0qtRYtCsS58FSxtvFW9t
	iPPc4fUyK4w+KoigchX1px7Dexyh5REbUzvgiBZkUB7LPe6Li7jzM1L0ZAy3apdRlRgBxvu4WB3UK
	HukZr5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4uq-00000005of2-3vnk;
	Sun, 24 Aug 2025 07:13:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4pd-00000005oH8-0xL3;
	Sun, 24 Aug 2025 07:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=P2HYgAFk+fXNwDssXlkE87hVakpkUk3GgjBSxwPzjyY=; b=21bRjTzDJ3J/NurIG6QVqhkUnn
	hMibzK+pWe9y5cJZQZS1fXqKG6hMFNmXzpS5nRdX0N3aaVF3EZtrgiNliuamytoE19q3zzjgvbqc1
	l4D95Ko71GI5nXKmMLepElUcT+T0w+sTVS7nuhYGehc4N7vw24J4dCIWdIA/ksFYwQh/OVZu4Axf2
	vVPS8uY/4nQ7kezTsEOC68SBJAB1vDzozCHxLfQhVR2KXSDcFfa0HHabeexjHDPkyAqDEpt7A8bTf
	ocYlxxPr81OfqUucV7wxqQ+HuOBKd6SKUORmGbAEPPnSFxaWbXlcVhPc/ont+ZuhT44LOglnN51b/
	eeX74Njw==;
Received: from [212.111.254.164] (helo=phil.aerolan.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq4pb-0002Oo-GN; Sun, 24 Aug 2025 09:07:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v4] arm64: dts: rockchip: add USB-C support for ROCK 5B/5B+/5T
Date: Sun, 24 Aug 2025 09:07:53 +0200
Message-ID: <175601920182.3425909.1200060972264006288.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250819-rock5bp-for-upstream-v4-1-7a2365ce7176@kernel.org>
References: <20250819-rock5bp-for-upstream-v4-1-7a2365ce7176@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_000801_263300_343E8238 
X-CRM114-Status: GOOD (  11.02  )
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


On Tue, 19 Aug 2025 16:50:13 +0200, Sebastian Reichel wrote:
> Add hardware description for the USB-C port in the Radxa ROCK 5 Model B
> family. This describes the OHCI, EHCI and XHCI USB parts. The DisplayPort
> AltMode is only partially described, as bindings for the necessary
> DisplayPort controller are still being reviewed.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: add USB-C support for ROCK 5B/5B+/5T
      commit: 67b2c15d8fb3c1447a23358075e4f336d40d9797

dropped the unnecessary #adress-cells, #size-cells from
&usb_host0_xhci -> port node to prevent dtc warnings:

  DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb
../arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi:1028.7-1035.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
../arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi:1028.7-1035.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

