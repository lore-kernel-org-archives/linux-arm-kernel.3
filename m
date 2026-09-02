Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCF6C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eVYtRrcYxbTiVniZzEVlvJjB3QGXOoZDXbBYRjI7Swg=; b=lj0fFHyyVBhE4mZKCnxv69Qxnn
	P7FEr+5KjmBeczg1vt5ZiIYsuJHcEo6jC7WCTXR3GF1RUwC3X/Oj+4MycsQt9HZoGjuQRfBgyqIET
	Ojty0W4t3feoJMf6AfwclA2FMuTIfoR2GVAXcrIuLcPlxB6VYoz82YXRHp/fO9KxGVKcdR1cNZpqB
	5t0zypWbTf1+agHJhsQL3CnaKfBGKggvezQW9NKMgGtGCt9lX5brt0DWWU463CZoap3JGvutaqLXZ
	K0jY0w2J96zyn2SXBUU3cFFsswu6+aIK0gI6bGPKb6aQeez2sj5GaONreltn1K9KeoYHR/AUhvxPZ
	Mb2sfO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1faS-0000000DyBr-37NU;
	Wed, 02 Sep 2026 07:40:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fZW-0000000Dy3R-2zT6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:40:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso388638f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334789; x=1788939589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVYtRrcYxbTiVniZzEVlvJjB3QGXOoZDXbBYRjI7Swg=;
        b=W2FpJcGcEJLVOwYvuiRm3IPIf9A2VQN0NwJoqdQ0owuvWL9mZXWSONfF2zTvoSo+pX
         kD/Z8/XVysT3UQIXtxUyqoTkzwcWoukjv6QNOx6T9bW4FsFnQqx064FD4m9wHiE156/E
         HVVZTe3VmKtzQUAABTvOiTg28UuYAY6z2h8KtY2FC448vIwG71iX9Nxu988GiuqzQl9e
         oWwnhogcW5AjWlAqHFOkjbg6GyRddpLCu0PS+rya/m40qJYObNUCzvyPIo7x1RhzWrE+
         zIDQi22pd27o9d21NURiMT2kh6VK5/yb97rwECmfYWaQOtwWDiJOr6c4EpIJVQ9zLv8Y
         gizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334789; x=1788939589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVYtRrcYxbTiVniZzEVlvJjB3QGXOoZDXbBYRjI7Swg=;
        b=XwJnC4AnzuTsfeOpZ5k6J55wrrkp73qKWL+5V0wgVURkTs2OYcF4N2zJ4E6F72f5VW
         wvet7KldmuQyKTX1aMfoDjpOKi8HP7mQssgOAoTCIv1d6AiHMEnIuD0unTpYr+BwYe4F
         oFAs1rHiNwc0Da8QxWMm8nqCYBwKicMcWv1iFIg8ZmguyYm1LFNk8yh3LX5e9Xfgoq9Q
         u2x+SspFyCVZoyWrzpQ2Fv5ryhPQTt9SUTLJF8Hn3KjNLt4fZ/o3sKom4kblTN3aj4XH
         DxD3ALWA5Ydoeok6Dyqu7AauqS3xQKYjPgYI2SuOU+IIpjq+HNNUZqYssvXQlGCEL8vR
         KUFA==
X-Forwarded-Encrypted: i=1; AHgh+RowUH8/Nb0bB4jA444JfVWwLYTNkDKlujocUN8tvKxqJbsUi6bxYuffaMzrFwNljqnB13kgeGU60oN2knERAJtx@lists.infradead.org
X-Gm-Message-State: AFuF++kTrMVIp6cQeUaxvd4n5hsni/tJvlRu9H+NScIsH2MkF/Jqs2Hd
	b1+gyj/pVCO/Kb061LIIvwJFD2tnbechVGnI6yrfN50lQfQZADgwxs7kH6h1peAb
X-Gm-Gg: AR+sD10OXuH8ZaaQZbR8jsRbK27O2F8LKdD6Bw6321BGij8NKSZ5VXcAPdr4oDJOkpm
	L9Ytmf7iqRH1Ycuv0N5Oa7a4jdGZtyzYZHPYnhVNZw6o9WAFUfpV18NcjA7eA++MTHwVGy6sKPH
	PAel1GvC+ZIknm5Je4h96aZsWVyhjB3yPkdyfxwApM3BITzdpQE/J2i32wqphR5ikdBz3nfZa9S
	R+sECw1NDmSCPXk4URXVopgbWau7NFD0FWwjFrq3W1X0p/qvOXXtF+8+k80bdu32cI2DB9CDjHH
	ACRemuDYnsdRGoWhehxd5SNgXeG/a3pMg2XxDTVSdzra1aCec/6rMSXz6s/0X0FH3oYFRcEJHNO
	b8XdjxF0losFtxDIJmIEOhiXOBt5CAM9PRzv9NJgZXW5n0dgqyIL8L34wODVUAWOPrm7IjZRTyQ
	/jLicw4eWdfm8zx4TqyM5uG6LPUtm0rkivOqIKijzuoi90lcOha7jLeRwvNxwvztSYAg==
X-Received: by 2002:a05:600c:4ed1:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ce582984dmr35814255e9.16.1788334788344;
        Wed, 02 Sep 2026 00:39:48 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4209375f8f.36.2026.09.02.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:39:47 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v2 0/2] gpio: mmio: report the line direction on chips without direction registers
Date: Wed,  2 Sep 2026 09:39:44 +0200
Message-ID: <20260902073946.3709080-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003950_868724_B39EE7E5 
X-CRM114-Status: GOOD (  15.79  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this replaces the gpiolib guard patch [1], along the lines Bartosz
suggested there: instead of teaching gpiod_get_direction() to stay quiet
when a chip has no get_direction(), give gpio-mmio one and let the pin
controller tell it what the pad does.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. It now answers
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that say
where those bits live (Vybrid: OBE bit 1, IBE bit 0) and -ENOTSUPP for
everything else; the debugfs dump, the only raw-register user, reads the
register through its own helper. Converting the driver fully to generic
pinconf is a bigger job than this fix needs.

Patch 2 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context. v1 asked pinctrl from get_direction() itself; the
Sashiko review pointed out that gpiochip_lock_as_irq() calls
get_direction() for !can_sleep chips under the irq descriptor lock, so
the pinctrl mutex is not an option there.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled this time: no backtraces,
and /sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep
the input default gpiolib assumed before, so nothing that worked before
is affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 2 needs patch 1 to give correct answers; taking both through one
tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: track the direction of chips without direction registers

 drivers/gpio/gpio-mmio.c                  | 63 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 ++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 4 files changed, 113 insertions(+), 7 deletions(-)

-- 
2.54.0


