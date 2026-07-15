Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126EEC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKCdQZKsrJq19Puk4Z79f2jp8rTVwuThYbvhiTw5hmQ=; b=uqVMUtTHKA2zEw8Opq8NxgG9KF
	P55HBO6eQAnHSGXGYB2wNzPZeSbt+yhuxbzjqnAcSQ8KZRq8IMUDfziwxFGqmiowIMnZgXmYanJke
	YrFnU5JMX1RZ+2U9OyciTd3Y2T84lRVOwGHMZoiTeg4yR2O+K88gHTa+y5yx3GHhb8toXyULSfMqu
	3v3TqNy0bgtpJdxSJxkhfF8ME9Jc9GxQjy1ttOEf531uX4r4o0EiXPBFDN8iZvsQXCOskcwHZUA1s
	W4sDBSj30G5w/vEtJRpx6wPJvgGIKEkEYbnDUDoYNzUndCERHlt988iaJDlOSwQIBiAFf/wmnT7Dg
	/XXZj/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0tV-0000000FCww-0fl9;
	Wed, 15 Jul 2026 14:47:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0tS-0000000FCwF-3viK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:47:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68FC34147D;
	Wed, 15 Jul 2026 14:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C551F00A3A;
	Wed, 15 Jul 2026 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126846;
	bh=WKCdQZKsrJq19Puk4Z79f2jp8rTVwuThYbvhiTw5hmQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kqiNt32gPa/PoX9GShy8W1YmV8pF6kKz4wOcu60yBMF2ICDl4WDu79HTqpL44hXQF
	 ElhZEbqL3uHr1q8cOKH+395w6JtOjHeEp0RUVtgEcCxJSdpiq1Y6TZvhzNaZ9EA1wp
	 O/GFojY9OyFWe5uoupmlJ//lS1bbRf0oSYNFwwoMcZgZgTmSjQNHA9xoDsOGiwx2/z
	 iPqpvBOAiWgQmxJeHIPZ5QB0LO49Gu1t7BJj4N5bhc/65AqiUgphIBRSf5b+hxkwzW
	 yoeW93jnlDzYoNh5rfJ2QYlBVq5umuXK3hHEp/0X1m/E3ihrUvfwNZpBOz7CUOd/y6
	 idv6N/Br6jepg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 10/10] arm64: dts: apple: Initial T6030 (M3 Pro)
 device trees
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-10-df65b2485710@jannau.net>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
 <20260715-apple-t603x-initial-devices-v2-10-df65b2485710@jannau.net>
Date: Wed, 15 Jul 2026 16:46:42 +0200
Message-Id: <178412680286.41818.12702064623332890739.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=645; i=sven@kernel.org;
 h=from:subject:message-id; bh=YscZYkhCUK9lKbh0UR9LVRVPfXsPMoB13J4yA8oeHXw=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1b43JLvfZ/MlabzyE9x+BxTfYF3bUkLg3aEYWhi4IyNv
 GrrX37pKGVhEONikBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzk/U6Gf+qvXnrsVpy/5O3u
 42kMC6wrrttN3l8vn7RuVcSbDcKH10ox/BWw4OGXkPp82lBt+caXm6LF5nw/Ee2l/aWIP2O7bsx
 /f1YA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
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

On Wed, 15 Jul 2026 11:11:57 +0200, Janne Grunau <j@jannau.net> wrote:
> diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
> new file mode 100644
> index 000000000000..2a0e830e0cc1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t6030.dtsi
> @@ -0,0 +1,524 @@
> [ ... skip 356 lines ... ]
> +			 */
> +			clocks = <&clkref>, <&clkref>;
> +			clock-names = "uart", "clk_uart_baud0";
> +			power-domains = <&ps_uart0>;
> +			status = "disabled";
> +		};

serial needs to be moved one node up above pmgr_gfx.

Reviewed-by: Sven Peter <sven@kernel.org>

-- 
Sven Peter <sven@kernel.org>

