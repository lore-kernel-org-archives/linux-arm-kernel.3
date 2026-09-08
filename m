Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A7CC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fl3c/gikJSO45FhDePC7wJBfWWWRLg8Wl47BaYzWCTI=; b=t2kQfU9XnyqgaZpFrCv8sPfJWt
	7x1S728B8GHEhFuPwY59go3MkAPbMrU/NUc5n+7A1t5IfRKNLyHl8u0055K69Crj82aNRELEogQQy
	F/EkSiyMGLxTwj7H5d/P2zmqh7YrNaswH7IwBNWxFx6/6ghI+Wy0kkx2dKCMPQM5oth0NrWoeDEVG
	BTuC990wkqriEbCcaZ/qYd5liZSn88c0ZRXeAn8NkGNUcxxWV5yjnojtcX7Ji15Gq/sBye1YZH3Qh
	UNkG2Vvf5M/FklA7CJn3HZrodmuv1xR12WZ6kplRy2LPeOBcATKDnH6oUA87h3cthmUKqvmfQLg+G
	iL7uHRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q0c-00000008FIc-2ZJ9;
	Tue, 08 Sep 2026 07:12:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q0Z-00000008FGp-12iz;
	Tue, 08 Sep 2026 07:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851560;
	bh=mbZit9u0igRW3Ez59tv3PUZpJvS2CPvENWt+oVCRU+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lH6okMJ7s6x/rWtTmAQeWehqTlVOSMQ1++DTLxkz7Ekrls89gq/eEyHxRe69kqNx9
	 tSIPhgkVWft8/8Q6uF8zxj4cE65yuUg5ht6vO7OheXDMz3twBm3+iYlbUdMMd0GHsQ
	 /6GHLKz8GRzC0j+bdG6sJQVkNSOzUMdBhyRG96Bafu6DFyqnJnxgSxRUOmSo11e0nx
	 ZEuwGdx66oHrpAfxlDjicLlFdZCbOKAKj8xSbuEoESLdq9eW+Th7cd0Npw5S2QtuCh
	 F2+WfXYawNLwGr34dUE6gWN7E8CZzz+SzztOT6oTBfWb5CrEIOdRow5Hznxi21UQck
	 msNj4+XRR2llw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52C5417E0B0B;
	Tue, 08 Sep 2026 09:12:40 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Andrea Pesaresi <andreapesaresi82@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260829151955.3661893-1-andreapesaresi82@gmail.com>
References: <20260829151955.3661893-1-andreapesaresi82@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: correct timer frequency
Message-Id: <178885156025.9724.13515391246937590450.b4-ty@b4>
Date: Tue, 08 Sep 2026 09:12:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_001243_455055_B57DC566 
X-CRM114-Status: UNSURE (   8.79  )
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

On Sat, 29 Aug 2026 17:19:55 +0200, Andrea Pesaresi wrote:
> The MT7986 architected timer runs at 12,986,200 Hz rather than 13 MHz.
> Firmware reports 13 MHz through CNTFRQ_EL0, causing the system clock to
> run slow by about 1062 ppm. This exceeds the kernel's 500 ppm NTP
> correction limit and leaves clock discipline saturated.
> 
> The corrected rate comes from MediaTek's downstream OpenWrt feed, where
> it is applied to both MT7986A and MT7986B. Since upstream mt7986b.dtsi
> includes mt7986a.dtsi, add it once to the common timer node so the
> architected timer driver uses the actual counter rate.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7986: correct timer frequency
      commit: 1cf18e4b9815beaf0439c5b57b65b45151c82ad7

Cheers,
Angelo



