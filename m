Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TQm8sQzB;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GP3jzBNS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=; b=TQm8sQzBUSoGaFfhkp/MR5fxSA
	QK/tKCFA4xtCs4Q7J5l3vAP64pn/Lqa0kppDlgkACUJ5k+I2UzpIkykG+3/dSpx9l9VQMeqFrQpfB
	kJqYjfUPzCpRot+kZVgVIS0n3/tffaS38xcvC+PN8DfslOqetBLvkJ/JwOjo3RKDzENSePCJOwXXG
	wLJJdNqnYfhYlbiaRYQZcp/7GJ+25ysYJf2wyNm744FN31n1Ag+bJoJXxo2iL+l4H5euePQIQDQLf
	pVZ4+MXn1gFoh59v+X5svFHwozzbfnNmjkubS5zQe46itW02YHB7fN0cX+D5J3qW9Fn8ZcEcBkMLH
	ajSvG9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp06-0000000C3Lt-1xTx;
	Fri, 30 Oct 2026 15:58:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp03-0000000C3K6-0QMj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso829018f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375916; x=1793980716; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
        b=GP3jzBNSS1tUpfxNvDF+z1rGbcj9NN7QCy0SlVHOA5kkltAvsBwARuiPbsBDE0ItO7
         zY5W0lOjgEirFASGbjlzdA7szGgwFHln382czCaeXz/Mm51raEdVKPistqgY9nSEfsnO
         MvQZLALrtTjVfckgr+lvRK2ngowxrFOkUuturz+BEugohD6bhc6+DG4fE3Ofi2UxZlpL
         eIqxYkq1gFPLUd9aA/2gzNJI1bA6VY0TgcByfFx2Y4uJPI+BU9vl5wWNJjr7IGUb5gwX
         sLJ2y301Zr9NcZCa3W1BNNlY6E0auCmPkpTQYBpzpvPlc2zjVTM2Ee1FLquLsIpiQ7FQ
         fskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375916; x=1793980716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
        b=tfY4p7IgaGj+jilgkRX+UJeyGOFEVdqntcea2P4UcQvSzZsv/AaZ/2o9KlhLKGZYuu
         mHPDUlCfHb8A6GUudJQTE71ZcIEcIN30gvQVAnlLpPnbOwuiByfXnEaLQpoMwlN8F6bl
         w1UaE+C0/+Kx97sx64CDCjMJcrzU9LPgE0/c4vTDD9S/Go0Xf3GHuXoywLg0jNRj2KgG
         n+SpsejzUHhi7/19OYAi19r6OUP83niKBnd7GccNs9CdJT6NeMhkPTVFAxRiRW7jPzk3
         do4XNWB/BS5HD4Za1e1rLa1C0FxHT7PUcjURCnE9dbVae/j4ItWkl2rS8PFA2lVPVbI7
         7XrA==
X-Forwarded-Encrypted: i=1; AKwUvBzoR9Jqe9Hz2a/7UyLnJc2+5zKDLhBaxXdLtvT0cgak5yIfLggplXnGeCHh8a9IfRWFbYDXKwxkDAGdbtsJPi5G@lists.infradead.org
X-Gm-Message-State: AFq9FYKbLuZ/vJWFgAI2+2rM1f+MZIq5cNnJtLKPxjpHNnWxyA+X0BK+
	EucyE8PsX2rMiQEAayRg2GF4eJx0kiA+pe8fCyViL6jiOvvN9MjbJfEPMpuVevsIJL8=
X-Gm-Gg: AYBFou2kZIVDDuHqthS1xpHSlofF0jmpbVNQ8+zJBlOwJlzRzXvXYKIj8IQSH7Ps5M2
	LHDfdcPR9utHOWdwOtbMTJy4U24xWRCBcnNTrPknlS5+QWvd96DyBK7Fi/dgdCkGER7czKDvwgh
	XKIQ7eN2G854m92rdJYU7/nXXF8T51TkYGlhBhwUf7q7pnY9sL2ms9pexteo45+4i1Z9Y2jCA8h
	TFUFACsGwY0cYJ/rrDnO5oN2IdS5r7fNeaaM4SQEmpX59yYZVeLl+rrf50eWGg+MY9tHuZxxY6S
	SzBnDtiHGHRP7YuttuF05yOi0JHYjl5woXMwLfKPZ7g5Zm49eEiuOWQfVnX3mqlgCkUeAWI9uoz
	AnKOlOVEiKaqAOQEurCG7NaZ5IkmK3aMuSGVUbmlDTpfn/Fy06864mm0kbQ/zipesR35ZhbUNH/
	3kvYM5fKXAo7i9lHHyx4pSSj1dGuIgVuxRR2UPznAhWCjpPmgo97ch1yrlHGGb2Tta/qJEcS81o
	42gWjIdbiHBh9jOJH9th5bYsPUEmSDgx7rrs3TEgocFg+IZ0t5cEveLnrW2uexURVnjZr7RVOnQ
	jSr+caE8owQQ7ZaRSSyVgqmB1KRkUBPmPAekmfV+JM1HGEPB5tg=
X-Received: by 2002:a5d:5f88:0:b0:48e:6419:dc6e with SMTP id ffacd0b85a97d-48e6e4f5431mr6781512f8f.16.1793375915915;
        Fri, 30 Oct 2026 08:58:35 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3862471f8f.29.2026.10.30.08.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:35 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH 00/11] pinctrl: scmi: fixes and GPIO function support
Date: Fri, 30 Oct 2026 16:58:31 +0100
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKe+5GoC/yXMwQrCMAwA0F8ZORtotiHir4gHm6U1MtvSbCKM/
 btVj+/yNjCpKgbnboMqLzXNqYEOHfD9lqKgTs3Qu/5IbnDIs8QcgjIWTbzUGY2firFoxvHEQRy
 N3hNBG0qVoO/ffrn+bat/CC/fEvb9A/N85Cx/AAAA
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_085839_157179_049B1A7A 
X-CRM114-Status: GOOD (  10.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Five fixes: the drive strength went out in milliamperes, the schmitt
trigger enable was mapped to the input buffer, the settings Linux
carries without argument went out as disabled, a setting the platform
reports off read as set, and the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.

Then GPIO function support: report the pin-only and GPIO attributes of
a function, give pin-only functions no groups, mark the GPIO functions,
and select the GPIO function of a pin on a GPIO request.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt mapping, which the platform does not implement. An LLM was
used to review the patches and to set up the tests.

---
Clément Le Goffic (11):
      pinctrl: scmi: send the drive strength in microamperes
      pinctrl: scmi: map the schmitt trigger enable to its SCMI type
      pinctrl: scmi: send the settings without argument as enabled
      pinctrl: scmi: report an off setting as not set
      firmware: arm_scmi: stop reading past PINCTRL_LIST_ASSOCIATIONS replies
      firmware: arm_scmi: report the pin-only and GPIO flags of functions
      pinctrl: scmi: give no groups to pin-only functions
      pinctrl: scmi: mark the GPIO functions
      pinctrl: scmi: report whether a function is GPIO
      firmware: arm_scmi: add an operation to set the function of a single pin
      pinctrl: scmi: select the GPIO function on GPIO requests

 drivers/firmware/arm_scmi/pinctrl.c |  62 +++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 170 +++++++++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |   9 +-
 3 files changed, 222 insertions(+), 19 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>


