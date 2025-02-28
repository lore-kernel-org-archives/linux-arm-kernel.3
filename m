Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D61CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKcLFlYKbjpxYMs8Fklx2IH1FNht5aVxvzEZPs0pdpU=; b=Z3rz1qlzvXcXs906M9BNvISjv/
	haOsIK+0REUcug0tK5W9d7ulv5J+hG0AhMXD9Np4F/mkuT7IfZ9TKHY7OapRhU2vrjZeNrUfHgpKQ
	qv5Z3VltpHWsbhmrO7JTX+4axPCZJSVmUlVekdK3uEovmyN7juieAv/lq0JgWixISEPB3IHbqT1GY
	Y52+baWizZCssxA+vK/yYFgH6mTHTD6sUyjfcFGpZA5nOthD9aCm5zw7ryj5pIRN+Gjyn1mmpGXDG
	723E1FLNNRYEzFktnd4IH1IfbOBONdS4P7WlL5Tot6uLbUi64l/OVbJp/+0m+ULOPlVu2e0n0hZYJ
	cpTFN3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4lD-0000000C4Qd-1SyG;
	Fri, 28 Feb 2025 18:06:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4je-0000000C4Bx-0jJ3;
	Fri, 28 Feb 2025 18:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hKcLFlYKbjpxYMs8Fklx2IH1FNht5aVxvzEZPs0pdpU=; b=eDwVDg0PXmNAFwj5aQqKLJfeBh
	LNSxwiOXLviLdeOJVmeb8g+yT0h3Ho5IJDnx7a6/EI2zYRVlLrQGscJZtu8NF9YikoESnU6y+Gcza
	G+O6yTGIbF4XG7n6y6//uQwe/cENsIZvSniq2lbFvrOikWTKE3fYjb7e+iAxTcoJi5wOgrlqw3+Dz
	1/XBLjtNb+ZfPnf7xpZSdcLPJ/971tvo6IskOgeSiaPRfJSOqCF3+8FBwMcd6hZr47oHgwhwvqKvm
	N2M35to+WgdsAdSE1BGrnKismvuHsXZ6LdpMeoJFNU2cffB/I6s+z9LS+tToeHzPpo4XAz0HKhDjp
	ac0jwPOA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1to4jP-0002Tv-IM; Fri, 28 Feb 2025 19:05:03 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Wenhao Cui <lasstp5011@gmail.com>, Yuteng Zhong <zonyitoo@gmail.com>,
 Yao Zi <ziyao@disroot.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Remove undocumented sdmmc property from
 lubancat-1
Date: Fri, 28 Feb 2025 19:05:02 +0100
Message-ID: <5186166.e8TTKsaY2g@diego>
In-Reply-To: <Z8H5jjE24cZb4IBQ@pie.lan>
References: <20250228163117.47318-2-ziyao@disroot.org>
 <D848JET5TDL6.2L4ZQR0YHYQU6@cknow.org> <Z8H5jjE24cZb4IBQ@pie.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_100518_234361_3FF228A4 
X-CRM114-Status: GOOD (  14.51  )
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

Hi,

Am Freitag, 28. Februar 2025, 18:59:42 MEZ schrieb Yao Zi:
> On Fri, Feb 28, 2025 at 05:55:47PM +0100, Diederik de Haas wrote:
> > On Fri Feb 28, 2025 at 5:31 PM CET, Yao Zi wrote:
> > > Property "supports-cd" isn't documented anywhere and is unnecessary for
> > 
> > s/supports-cd/supports-sd/ ?
> 
> Oops, yes, it's a typo.
> 
> As it's a trival patch, could it be fixed on merging? Or should I send
> another version?

I can change that when applying.


Heiko



