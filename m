Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029D3CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Muhbc/JF15c2mXhAE2ivU7Ll5S6D61f7q/qUwIHRK0c=; b=nDUYoFUjuS2CEBlVHjSRzVFc/M
	4X5omPY7BQEDhD+XjSkcYm/hAQV40pkQRHUQUL8UHz7DzuTMSQH4CMv2PbNPSKJOCBMO5QAZN3zFN
	Pvw7BNqFv6UWjWSRLbnfYOnQxxEeN2CkvUv0PxtCUCTIH3ZiS3P5IqSokSRbQgTOq/JwYhyjSxnLG
	HYFHCpvwBLnQ0iy+l32zICWdfUA3VQfyxzkCaOKYsPyDkfd3JdM8MVQFdA35uDMyfhn6HVOFFyMsL
	z825nGgy0rJLS4WWx7Ysl262R5FDyAt6tANApVlH1PBiucK2ZrXv6c6YCTM7YwKKFuUxSrP3at/D+
	8yDxbl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usStb-00000008RI6-1Dlm;
	Sat, 30 Aug 2025 21:13:59 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usSqo-00000008RF6-2Hkp;
	Sat, 30 Aug 2025 21:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1756588262;
	bh=w7AeKGA0VAqXrgbfJI3DCCFlApUNfQrCz+BcOLxH0gQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j/gdM1r0EA03OeVXNxKphWjHsyz+IaNTwplDXwMdBbu2/hCGR7ujHbAnmvglk+ZbF
	 eL1BWrkxk32VoU+qvjm0ZgqiWBOqfOEPfwh1w2wiqV4Dn9YUknPgbzdjic32exC3Hu
	 czBkqWQqz0KAXuf8JyC/nshKq+/LkIHlUfvxfElIbJH4w97ojPdKJfMOFT/p/88yA1
	 QG0iV98PuoZ3+5y0pqkiuOKECjVwi0wSO6IotVtDtnuJJrdeRtkcvg5AiDHBU6dfKx
	 bq+bf/5jfL0Xm8FEzjOuPIiwtlaST8hj4rVXO/M3drNy1gRxdOMqaksEdJxEedoDGF
	 1v4W3aGcjXkDA==
Received: from WahpenayoPeak.tahoma.link (unknown [IPv6:2600:4040:50be:5a04:7b87:89ea:8410:bae3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id A7E9D27E467;
	Sat, 30 Aug 2025 21:11:02 +0000 (UTC)
Date: Sat, 30 Aug 2025 17:11:01 -0400
From: Erik Beck <xunil@tahomasoft.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: Add HINLINK H66K/H68K
Message-ID: <20250830171101.410bd954.xunil@tahomasoft.com>
In-Reply-To: <175603280227.3445205.12980590537074643035.b4-ty@sntech.de>
References: <20250818100009.170202-1-amadeus@jmu.edu.cn>
	<175603280227.3445205.12980590537074643035.b4-ty@sntech.de>
Organization: Tahoma Soft
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_141106_801270_5CC60945 
X-CRM114-Status: GOOD (  19.48  )
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

On Sun, 24 Aug 2025 12:54:40 +0200
Heiko Stuebner <heiko@sntech.de> wrote:

> On Mon, 18 Aug 2025 18:00:05 +0800, Chukun Pan wrote:
> > The HINLINK H66K and H68K are development boards with the Rockchip
> > RK3568 SoC. These boards are all SoM plus expansion board structures.
> > 
> > Both boards can be booted from eMMC or SD-card using the
> > U-Boot 2025.07 generic-rk3568 target.
> > 
> > The SoM board has CPU, RAM, eMMC and RK809 PMIC.
> > There is no schematic for this part.
> > 
> > [...]  
> 
> Applied, thanks!

Hi, apologies in advance if I'm going against protocol, but I'm still really
new at the techniques for Linux patch development.

As you may recall, I've been working on a similar patch for the nearly
identical SeeedStudio LinkStar H68K (v1). I found this recent work from
Chukun earlier today; my work, in part, relied on an offshoot of Chukun's
work from circa 2022 and other inspirations from other rk3568 boards. 
(See
https://lore.kernel.org/linux-devicetree/20250723135008.1077970-1-amadeus@jmu.edu.cn/
for example.)

Chukun's work from 18 August 2025 is better and more complete than where my
code currently is, with one exception: the gmac0/1 phy-modes.

As I worked on my dts, I discovered that the 1Gb ethernet ports, using an
RTL8211, don't support rgmii-id mode; only rgmii.
(https://www.realtek.com/Product/Index?id=3976&cate_id=786). 

Changing this makes a huge difference in the ethernet throughput speed. With
rgmii-id mode specified, throughput is about 6.5 Mbs. Changing this to rgmii
mode increases throughput to about 960 Mbs. 

I tested this on Chukun's code by making that change, and essentially
backporting to my OpenWRT testing profile, using kernel 6.12 and U-Boot 25.04
(also backporting the Hinlink dts to U-Boot).

I saw this over 100x speed difference both with my tree and Chukun's. 

I'll make a note of this in Chukun's patch email for the dts shortly.

I'd like to help support further development of the HinLink/Linkstar patches,
and am happy to base whatever assistance I can provide off Chukun's work. 

Please advise on how I can best contribute.

Regards,

Erik

> 
> [1/4] dt-bindings: vendor-prefixes: Add HINLINK
>       commit: 7d11b8c260ea68ce8f420ad467b04b21ea34b011
> [2/4] dt-bindings: arm: rockchip: Add HINLINK H66K / H68K
>       commit: 4bef07b79ab1ef7d963eaa2c37948030e418d538
> [3/4] arm64: dts: rockchip: Add HINLINK H68K
>       commit: 86a504b82f8d0e34f99ab9607712e7942c919fa3
> [4/4] arm64: dts: rockchip: Add HINLINK H66K
>       commit: bb9ef44f05c9558d58e3c9da141e93af1aa11c1f
> 
> Best regards,


