Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BA0E77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OGc6+zqQ7ZdEycYdKOJUWB6YUgheiEtIDWzCrRZKe9g=; b=Rvk92vVduAPuj2
	zEi9ZhxBE914e9hbIoVj0IDVC1KGw/mbKlIInz/PPQAB2jeI/oPUda8Eg8nNY8EbiUWG3KkrSzLOQ
	G09t/R0hRXKcvEsWZr3eI07h1hFFmwfdRZdJBXT4mTePjanchXUOXdKwSQri4FDrkOoUUb13yCnDB
	jUbpgLAvN8oWrg23B5v3NU0b5vQYn+l4/jHB6BTwahLZ3H6LLg/I7qrK5Eh9lJAkIghV/MYyPLmlY
	Ax31QzX4oTS1uOatnPtA2vK4knxAmmN5te8AAj5imYHzUPRTXM8eirxueTonfkrs8A0bDaRf4U6v9
	DzatpgUZ8CpZE66ix3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUXsI-0000000HPaU-2Ycz;
	Sun, 05 Jan 2025 21:09:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUXr7-0000000HPQU-09FW;
	Sun, 05 Jan 2025 21:08:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so14641704e87.0;
        Sun, 05 Jan 2025 13:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736111294; x=1736716094; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGc6+zqQ7ZdEycYdKOJUWB6YUgheiEtIDWzCrRZKe9g=;
        b=T9fbvLmKpfPsr0YfOjzV6sW2JjB/EkreGWgmRF8W1hC3oDNhO+82LAi4qeImNJs7HB
         GfSy+C8wIZKcTEDhgX4O+KHxhOA2LLyqTjvp0in0k9vIWSNyEzpFcrh+ZEFuMlVHatVU
         zhKYyXC6lF+p5nb8jiHMLkdJyAsIY3euYOJaOPZ19j+hYSW8dR14b9LE5WpGE5T/VD3Y
         hO27emECAHNTODlvTd9CvTPFRc6bcApQ5FpCAWCLEP4l3F5qzFJjAJg+ob35lfYvESHM
         B0bCAWqehBDcSefw8fl4m+XdQ1VzDpdRKmtq0WPlOKGO5o0HqlyCHdWWp64VE/M9GBV7
         U/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736111294; x=1736716094;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGc6+zqQ7ZdEycYdKOJUWB6YUgheiEtIDWzCrRZKe9g=;
        b=NhJRUlKh6KcwCPaeeCk8G8ECJqoQPI10Rndz4SrgZpgc1ENfrzvit/w9Wivl7b9ayR
         clpCMsBLyMfQiWDZqN0tHJlBzTHf+oNjeSYwhZ9LrjMkV3z6yTbNp/yjXGfeI0OlCn7s
         dLrxJThHrF/cbjXWbbdTv71b4XnD2on/A9AEzk58nATDitmXnUti4PwaaO98iT6kTXam
         5Qbz+8m0vTzZWS3/RoBuEM7WlB0XVWjYBHh/82QEaoBuawmOD+O+IOTJCEbUE+xAtFpF
         2gL6mz0wmTGUpgkgiB7yZLVYUgkfN4oTQ2OVxGt8+/4QN3FrCsyLSheM9H869tl78kQH
         KDLA==
X-Forwarded-Encrypted: i=1; AJvYcCUo2u6zKglCLlHYCdYPK9Buy6wp7UJtmfCU5iy6eqBEREyeJP6tfeo0eejfw0F9EVIu0evEiTpsln2obCZvMs2G@lists.infradead.org, AJvYcCWdCorzLLVCdxvbjItj9eiZvx45Wf6Qtd1XSsHqTLTlqeIh7wntqVSQG9IN8EWTReTVy6ofP0Pw2oUkgRSusmg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRuWCluB5nC24Y84t1ES1EKPATYxJAxjegKAnZYOWoU8nYqz3C
	IJDMEzcC4/CPVz8ezUiFwEZGU+SGNFw+VUqeqOK+PeiCvOh8PzCimBmmjzUKQWw=
X-Gm-Gg: ASbGncsnrwCxNnREXrqgYrVg0Rq5yKv/B8NP+9CS89yh6Lf9Awr8SpEzjYfA+XiG0fg
	RSRpQVAnxrGn8dlfOoq25AKNNswL35rVgVkaxHB8m+uA+J0rQN13DzypoXnsRnLsnXG6iW9k4sz
	gxpa0EAyEON0gryktPD1ciltrpToJXYdHdlAHfzJnH/7UwEh/VvEajY9pxieRu2JQM6F004u0wd
	2hVH9nwpDU2tO67l9zRvQuKzw4Rs+4htvy5VQ4hFw8shjUymgdq
X-Google-Smtp-Source: AGHT+IElcDOD5aCIU5kdEC0BbRI70nW6vt+Kv5a+8O8dDy/uTWPiCqctUqNQioF2Q6kUII8MAlBR4Q==
X-Received: by 2002:a05:6512:1193:b0:540:1e17:10eb with SMTP id 2adb3069b0e04-5422957acaamr16138198e87.48.1736111293939;
        Sun, 05 Jan 2025 13:08:13 -0800 (PST)
Received: from [10.42.0.1] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813687sm4773419e87.137.2025.01.05.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 13:08:12 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add H96 Max V58 (RK3588 based TV
 box)
Date: Mon, 06 Jan 2025 01:07:16 +0400
Message-Id: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT0emcC/x3MTQqAIBBA4avErBtISxm7SrQoG2uIflCIILp70
 vJbvPdA4iicoC0eiHxJkmPPUGUBfhn2mVGmbNCVbiqrCONaGyJcnMVtuPEyhF57NQZi65yFHJ6
 Rg9z/tOvf9wMj8ZWfZAAAAA==
X-Change-ID: 20240618-rk3588-h96-max-v58-c2c1bf8e6996
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736111288; l=1673;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=sLcOvAjZb7/WOSHRnPLOHxWvcuoYjh6Be8Wj9gfvfF4=;
 b=0f7T4qFoBCj5Ift+sKZfJocCUd7BL0zYMYeEKBxxDmzTs9NUfR2Asc3WTCFmNwWKAN527OGon
 GDxcFBZ5kZhC8YKzFaoLkN9QN95EcSuOa5diagABcHraGa6sBYE6v95
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_130817_079653_59FDBDE9 
X-CRM114-Status: GOOD (  11.64  )
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

H96 Max V58 is a compact TV box based on Rockchip RK3588 SoC [1]
that ships with Android by default. Add support for it.

Note that there is no publicly available hardware documentation,
nor vendor sources to be used as a reference, so this implementation
is best effort based on poking around my board and staring at the
decompiled stock DTB. It works for me, but improvement suggestions
are very much welcome.

HDMI output is not tested, but expected to work.

SPDIF output is not enabled (base RK3588 .dtsi needs amendment)

Auxiliary LED display is not enabled (no mainline driver available).
The controller used is FD6551 connected to GPIO3 RK_PC7 (clk) and
GPIO3 RK_PD0 (data), which happen to be the right pins for
i2c5m0_xfer pinctrl config, and thus might potentially be used with
the hardware I2C5 controller (to be verified). Out of tree userspace
driver is available at [2].

[1] https://www.h96tvbox.com/product/h96max-v58/
[2] https://github.com/arthur-liberman/linux_openvfd/blob/master/driver/controllers/fd650.c

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (2):
      dt-bindings: arm: rockchip: Add H96 Max V58 TV box
      arm64: dts: rockchip: Add H96 Max V58 TV Box based on RK3588 SoC

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 785 +++++++++++++++++++++
 3 files changed, 791 insertions(+)
---
base-commit: af349ca4d3f8659d84abc667125c826fda155109
change-id: 20240618-rk3588-h96-max-v58-c2c1bf8e6996

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


