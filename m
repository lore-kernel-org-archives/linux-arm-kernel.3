Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1ACEF06E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 04:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EDJMPOdQUIkj7B+MtnJTuwRWWsGcynJpHj9KDB1EX4=; b=EF5A3J0eT2gQuU5uvaD5zIBCxM
	toVspxkb88HqWapsuhSVjQS9KmreyaAB2B8KCuIv9/gNRaoh08TFyftlIVRnzkdpalf3bIP6SsioA
	xZ1h3n6xHpVe84vlI2YNWO0Bjih2//yI2LG0BJQtJOeuSMn6lqRanPu8ZQ/5HN9vQD/+w/9iSQ6Ny
	9zPM7M8LrvPNstN+bkBHyBwC9AVXopzRReyoIBXOfMeoOXvSiR50JPefoylfCt3Rwpi9LobMjCY4h
	rdzFcQgpSF3LTxtVHubJKQsd2I3tBqzIKxPLHdOaxoz5OGQ7K3t3GR9FhgLK1EAPfFQgJWQrTi4Vh
	YpSfifTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJ7L-0000000Eox5-2fEl;
	Mon, 09 Feb 2026 04:43:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJ7H-0000000Eowk-3x9b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 04:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770612185;
	bh=2EDJMPOdQUIkj7B+MtnJTuwRWWsGcynJpHj9KDB1EX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LM8TiHiwLMi4JpxMmygPXU2C3mwSlUbSkF43jtqGvY2th0eP04oho0fdrfmkx4mcq
	 xcgN3b/mtuH2h2wFxPyNmvGSGK+WKhPzBcWkMKcuHXCdZ61nP3EUf79QvNuneU/+sf
	 VjnRi5Ei0q+nYEorLZxdK05JaAEDAFLn/UyGklTE7GGSpLhnBWs+SqPiXWGIsCaqww
	 ButJkpEb+LhtcV486396eGDPbQUQMtvhsVwlRROTMNP8cna4h1Ptka2z2Qm+b++PWN
	 XEGLqThGTkVwBnMkCWIYNoIWpltFL1tsB0GVyQYXYNt1H+BonrTj69NeH66xgOG0U9
	 WX+t4+RYVhRmA==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 72C846024E;
	Mon,  9 Feb 2026 12:43:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Marc Olberding <molberding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260120-alt-128-v4-1-0e5c491a532c@nvidia.com>
References: <20260120-alt-128-v4-1-0e5c491a532c@nvidia.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: add an alt 128M flash layout
Message-Id: <177061218409.863052.13158700639798064370.b4-ty@codeconstruct.com.au>
Date: Mon, 09 Feb 2026 15:13:04 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_204320_179211_14681FE2 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

On Tue, 20 Jan 2026 12:34:14 -0800, Marc Olberding wrote:
> Add a 128M layout for the BMC flash chip we didn't boot from. Including
> this allows the user to write to each partition on the alternate spi
> chip. This dtsi follows the existing standard of using the same layout
> as non alt version and prepending `alt` to each partition's name.
> 
> This patch also adds this alt spi flash layout to
> aspeed-bmc-nvidia-msx4-bmc.dts
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


