Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32368C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0B7vxdS52txOQYr8MAUjOPGxnkb0yKArb/TqnTim/JE=; b=w+cIHq8iaFdv/hJLsLPJyJA2IF
	YKKrE33ctgWgkI2Fn4q8zKjbgo0HmRqYMx0drIB75yI1oBGe6bryVHLqMYN1mV0+2Ea4uWF8R0f5G
	XjLZ66qY7maJb55ENbEeSxx99u2AhP++Q4XmD8JU0FeAIW0WWkn4euPoL+EvIgJ6GHliQ/BPoCNLH
	cjSyt9PPup1HEP0QuwIJa7W7UHU8iUfa1C+wABofEFGQKd6KzqVTLk5jIBw7ZrFIbdjHSKG7VXHkT
	OiwgFLk8agiBOuWcyi6hJimbEuc4gAeNf9HWaDAVuznZhq+xJQ/HaenFK59yIxKdIIh92QdhBDtjo
	bRFLJgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnDR-0000000AI8Y-0ygE;
	Fri, 31 Jan 2025 09:21:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnC5-0000000AI1t-2bRK;
	Fri, 31 Jan 2025 09:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0B7vxdS52txOQYr8MAUjOPGxnkb0yKArb/TqnTim/JE=; b=fO5N0AY6e9Fe7eGia4ydGVl/AS
	U5f/5AQpGP2olKzC34QoHN1a2he0xkIe1t39UyugTbsuF0DaAMy4hwn9jxFduUIRVRtEYQXipSgjL
	lcrYQ0CM0Lzx2V8ORCRr7JriJ4M5AMdoUpMjOpPQoM5w4cmWy/TxbvOArken6/B4lGgYrduzcJM7Q
	SaXdPbZZjhVhyUnYfmmHnCvW/azD18jKc3IiupUbz/JuKTLqXZ+3T55naGCHmLvoIj2QxpluMUx5c
	U0TBimeFUZaZSLUxwj6rHskipMgsQRG5sfccRnUvxhennAWMQi6skyE3UQ+eCLWDA8xpmqUwS2nT7
	UPT5HCaQ==;
Received: from [212.111.254.164] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tdnC4-0006Gx-0H; Fri, 31 Jan 2025 10:20:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH 0/2] Describe the cameras in the PinePhone Pro dts
Date: Fri, 31 Jan 2025 10:20:06 +0100
Message-ID: <5127541.31r3eYUQgx@phil>
In-Reply-To: <20250119-camera-v1-0-320be4f0dc2b@bootlin.com>
References: <20250119-camera-v1-0-320be4f0dc2b@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_012009_670288_3B92150C 
X-CRM114-Status: GOOD (  14.65  )
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

Am Sonntag, 19. Januar 2025, 23:56:58 MEZ schrieb Olivier Benjamin:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
> Olivier Benjamin (2):
>       arm64: dts: PinePhone Pro: describe I2c Bus 1 and IMX258 world camera
>       arm64: dts: PinePhone Pro: describe the OV8858 user camera

Patch subject should be
"arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro"

patches need an update to accomodate
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c96e63301978f4657c9082c55a066763c8db7b1

And please name the new regulator nodes similarly
(regulator-foo)

Thanks a lot
Heiko



