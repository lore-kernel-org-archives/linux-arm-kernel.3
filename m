Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F5AD5E379
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPWEWQwKy1T/x6ugN2mPNFT/qPZ0Ya980gZlamX26Vc=; b=bQ6tMvxdUmVVrPnOJLDLNRK4vX
	FZpfruJMc6LG6l3kjyCnf12VsXoKMXpaZuNnggYj3OgNs45lOYSWqnh8HniX//dMkqbQpVGk27Ero
	hVq/c9kid7rVC37dzRRhcKQZYMylKEmcC6MGbqcXEwjxUM/78vE3/u5RtWiSlesri7FDJIEgK+Doh
	usxEdpe7hVziMtw/hjMT5fXW+LCniws1+opyH+Lp4GnUyhsehaqllTT0jufG++99mPPRQJAT0Fu38
	zFFpL+g38XCTJv0ZZT1FlpWHoFtlEz23gojFYiDR30m/mfQ7UKr7J6zH5MHCue3PsuOMjQfopslU9
	e3QsN1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qJy-0000000DouO-0jDF;
	Sat, 09 Nov 2024 18:36:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qBN-0000000Dnff-3GkP;
	Sat, 09 Nov 2024 18:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gPWEWQwKy1T/x6ugN2mPNFT/qPZ0Ya980gZlamX26Vc=; b=drIzVRww9gD2qaqcSIZBI3+4fv
	R43MRG5G/ar0InbcUwyQbmm95DcH81Ii6lLgyqyPnoViJMK9CKRhAxrHvUL4jwYj81ZBle/NfloFE
	WcitD7ztGuRtDpzCFiFXTH3sbD5iOgmIanohhxxN1/t0Sqkpov4bK04Y7AK+jqXKiPJKIv4Iiz2hA
	TP9boUUyyjRpRDRh695PzbwESpJVMSfAox/d7sPsqS29zlv14HNbifs2PbpY9zWhWl17tFev9LEan
	WHwy0sPZ+J22hif7hDr3b7yR6KxlKq0LDkEmqMH1lk3j7nclxnruE20X7l9Udr0VU3I5gQ4LS/8Z2
	PKQhwrOA==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9qBJ-0007Km-D0; Sat, 09 Nov 2024 19:27:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI on Hardkernel ODROID-M2
Date: Sat,  9 Nov 2024 19:27:16 +0100
Message-ID: <173117675954.1131306.14874061306696804810.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107211345.1318046-1-jonas@kwiboo.se>
References: <20241107211345.1318046-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_102737_833974_57081030 
X-CRM114-Status: UNSURE (   9.16  )
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

On Thu, 7 Nov 2024 21:13:43 +0000, Jonas Karlman wrote:
> Add the necessary DT changes to enable HDMI on Hardkernel ODROID-M2.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI on Hardkernel ODROID-M2
      commit: 64a098acf119d2a599c744dbce531668fbdabab1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

