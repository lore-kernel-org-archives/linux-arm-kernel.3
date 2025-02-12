Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F9AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgP2P2s0bKk8vLZ5KHTO+UkvCszavZHV8wdbaiCNwEM=; b=Wf65rN3hw/N2uCMu6GMcQ7lcdl
	/hfHNPngU/DGKq5+ANij85n7Ok3XuinC/TSUvIor9VGQaHhAo6UJsrmo6M0ldTF0Urmr1oP5w80N2
	+RN95q0lD0geRpKO44Gzj6fRG2jL4ajtjj/XoBf/nCti6sRsGzelzCgaqjkaBh6g72GZxH7LufckF
	HGI8vp8kWoKkYlD9rCbDpY3bTCNcMJXJnhV1rsjxOzvYYQLrjP2BBu13nIKntYbaHf6QAAlHP+e7H
	/VVE45eY7hJtIbV/UlnIfueLKo4W5MjMpbfd3QASsPA1VcAtBudFDOscg0BWG46h43U+erHP/rJhs
	v0jPdWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLFP-000000092hL-3fwr;
	Wed, 12 Feb 2025 22:30:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLDy-000000092Il-3G27;
	Wed, 12 Feb 2025 22:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pgP2P2s0bKk8vLZ5KHTO+UkvCszavZHV8wdbaiCNwEM=; b=lTQYg2xD/RhTQBHrmhLorBk+zx
	KkDrZA3NEtGLhYqBUeWV2ZiZfmN4u4q6Q8XeSz0a/TNL2UJbAalDpnsd7uUtwI/C44GlQpGPUoi5e
	nMp4Vq18UTEkhKfk8ZX/MCi5jptNd0JI33e9uDxpSKfZCALgAXwNSUuNV2VT3iwdKj0rkvaPtCg4P
	akufR2hyWaKU9Yy+4hetOlWnKyWmzJ1BQXIJPIJ7amHh6EXUoncRefpPBDSNzuw66eYVV+XRc186+
	iXBjSa1/7uL1CpdG33vdwqVcB3t87cSaLyPyhM8F3i/TGH3/NjT7GH5Jopv75MYK49O+VNp6/VvBH
	BNXvLOCw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tiLDh-0001kz-0K; Wed, 12 Feb 2025 23:28:37 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Chris Morgan <macromorgan@hotmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Stephen Chen <stephen@radxa.com>, Weizhao Ouyang <weizhao.ouyang@arm.com>,
 Alexey Charkov <alchark@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 0/1] Add Radxa Rock 4D support
Date: Wed, 12 Feb 2025 23:28:35 +0100
Message-ID: <3934037.fEcJ0Lxnt5@diego>
In-Reply-To: <20250212220236.116383-1-detlev.casanova@collabora.com>
References: <20250212220236.116383-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_142854_835864_F9B30CCC 
X-CRM114-Status: GOOD (  16.49  )
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

Hi Detlev,

Am Mittwoch, 12. Februar 2025, 22:56:48 MEZ schrieb Detlev Casanova:
> Add the basic support for the board. (Not officially released yet)
> It is based on the Rockchip rk3576 SoC, so I haven't added the
> following devices yet:
>  - VOP/HDMI
>  - UFS
> as the support for those has not been merged yet, but are close to be
> and I already validated that they work.
> It will come with another patch set.
> 
> The following devices are supported and working:
>  - UART
>  - SD Card
>  - Ethernet
>  - USB
>  - RTC
> 
> Stephen Chen (1):
>   arm64: dts: rockchip: Add Radxa ROCK 4D device tree
> 
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      | 649 ++++++++++++++++++

it seems you're missing a separate patch adding an entry to
Documentation/devicetree/bindings/arm/rockchip.yaml

Heiko




