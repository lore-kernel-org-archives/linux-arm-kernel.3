Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+06N9vF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pI2ZIhwU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=; b=N+06N9vF5moBQbN67bac2nqsV6
	oZyJvRIgMkzoV6AHmDlvg/0ysKJb5jnBW8gNK10mNhiObQ/AjEidLQ9flECfc152ZJRUvArDw0ygS
	CJzilK1Pr8K8VZEUDN0awVCbNy01WJoTva/xr/BOiV41w6bmQSy4fwkHaLITZKz9OK/IV7cFaMTd0
	BnmtYWdOdDYTCgWSvtYd4qsvVMrIVD5CnNKT8RczkcLa/w0613bCA46cjoF2ZdBYgdsDQ7FXffk+t
	Xdo5JWETyANRokL4tCPbavDZ1DYgcYKd3fXR3onxHjECNErIc8wA4K+FLF2Re3lPiJMGRHn92oIkm
	ErLCtonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEfp-00000002a0n-27qf;
	Tue, 03 Nov 2026 13:35:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEfl-00000002ZyL-1pk5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:35:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e0d1da913so582048f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712931; x=1794317731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=;
        b=pI2ZIhwU32xan0sle45v+VarVaI/fW92+3eUFzifwC9pGp/6k7NHFXslJzDi+kC3kP
         rbnCdh6XqbksqnNjeKBXilX/f7FBxvPrWrr9nt5Fqa+1PKk9n5pDklAsnxLrxjjElRSc
         umGfPIO9Z8iD4WgrDHOJqgL/+/iPHDvQ57u+UDnRuEPd0oQDYJx+hOmUf12T8CECcPZl
         PBaclNkfVq6qIjYQyE/eSacGSlrfOe8UCLh6BGf8nr6L8bReI8ORtK9YJrp6wmklPvOr
         yx7orCWuthDhB60DyLQEnY5Vxbv5XecPIucmslteZPk1gkUw4ErE0QMOYwOZkzSQX7Xg
         cy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712931; x=1794317731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=;
        b=b9gnaisLDjHQPPr9e8eFcO6YGzuMSCjE5bMp9gkTdFWnMCk69sYx9foBdmxAdktqSu
         HYEhY0f7YwWhf6FksVekQclrIIZg93mG6sYQilnArbr8UgnqSfQZ75dHcvYW8wbz7TPW
         cRDNVloVsUZ36A989U9ODfSEx/qiyQLNeb/RHXwhxT/8RDLPs8PUlwcpp7rbqzlHUb8c
         xiQWvPy97s2QkxxHWaUm2FqOdSzrPD9Y4GMce6Xu2depr4UBYfLilcZys/HdLAXeCvKZ
         7EwKyNa32yqerNhHVIovKAraOTT73zuhBS4n1ReOslFvfzLd29HT0EIIZLkKB0d8jKLV
         UMzg==
X-Forwarded-Encrypted: i=1; AKwUvBxDeLb09Jfy1GXkK2ESigethW9ZUEUaibAD1t1b6iI9VJ/g0HTVkmcFPLFeLHLAEIULo4kbwfpRJprmPOqmXS5C@lists.infradead.org
X-Gm-Message-State: APuU4Z/Xwj/UtqqV5KChQPbu1YZvGtyI7AUzW24khXW1i3Q9T9dXjfMh
	42N8Mquyrm+nu4oMAcg0POWIoXeNcTG1/OL4IKZW3uT/WiBddCVXX3hp
X-Gm-Gg: AYBFou3iYJR7m4RrCSX+PYgFQXVuvXzHk35s4snIYV7l5LU18MKjDD4p5YHLJ77lKdP
	ofg626E1xRUmf9J7JgJuYw30Z+EYTdDUQnC3m2clD0uMEPoJvpiHG1Nl7QorpyPLG0UrzblrOJw
	urhzcNIklcIkuGvuXzLkZIIpP5HuwKoCP6ucufhG/hsuI3tHX0QuHtg9p7mquivAzCEPKyySy8P
	WJ0cTygziF8R1XeQB4S0S6Dgw4//fPEXCVC+Ue2UYtWh/iqj6ObAvKsKmSeklHPwuf5siNa/ETx
	H37YlasLNcUgP85LMJkVN+Rmb+yQ/wHeGwCiGEihtEy0dcMbnK2KMC7H1zoh11H1CwSw3MeyWF0
	0Bpp3hPi/j7Mtlu+06cK3jmF5KauJdI/Sl2xvQG1NBvB/yyiog0lLA2lvdQhRH4iSz5MESAM0kI
	hSX86jm4fov/RMg7E1Q/bo0Wfdk14dyxWjFXNr0SBYh/VSi8Y263yajjNHAN8HkJINkOjItQIkc
	wan4zV8Xm+NGHN9OpSkorHU0/kGzUryurLVGrv2Iwuxan17/vXBKWka5a5EU3VqXODaZtLXqbcK
	zV+SG0JtNiHx0JUFYGB4OBL00aJ6ebgO4CbnBKlshWP93d6Pacvsktcxveqn0fxsLgy5hfUSON8
	B7I9s8mHE9e3jeQmx+zPO4JBmT4REvsHncLWptQ6JuPXWlcwXbkHGApbIH+x6hi8j3D10xt1TIg
	iGemQhucHCTvHDYBHb4Gk6qTATksQ1+PlescCEp/hN5XeEtLoyOyelSQ==
X-Received: by 2002:a05:6000:250a:b0:48e:643e:de82 with SMTP id ffacd0b85a97d-48e6e2cb652mr30505104f8f.11.1793712931006;
        Tue, 03 Nov 2026 05:35:31 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26661746f8f.34.2026.11.03.05.35.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:35:30 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Tue,  3 Nov 2026 14:35:26 +0100
Message-ID: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053533_509901_0936B223 
X-CRM114-Status: GOOD (  15.03  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT7925 USB adapters such as the NETGEAR A9000 have a status LED on
GPIO 8 of the chip. MediaTek's Windows driver asks the firmware to
switch it with UNI command 0x2a, but the firmware in linux-firmware
does not act on that command [1].

This series drives the pin from the host instead. The layout of the
CBTOP GPIO block comes from the coda headers in MediaTek's gen4m driver
for MT6639, which uses the same CBTOP register map as MT7925. The first
patch lets the mt76 core register an LED that only provides
brightness_set_blocking, which a USB driver needs. The second patch
adds the LED to mt7925.

Tested on a Turris Omnia with an A9000 and firmware 20231227 over
several days. The LED follows the throughput trigger and manual
brightness changes, and turns off when the radio goes down.

Sean, JB, is it fine to drive these GPIO registers from the host, or
does the firmware rely on GPIO 8 staying in its default function?

[1] https://lore.kernel.org/linux-wireless/20261012125310.13917-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  wifi: mt76: allow LEDs with only brightness_set_blocking
  wifi: mt76: mt7925: add LED support for USB adapters

 drivers/net/wireless/mediatek/mt76/mac80211.c | 12 ++++-
 .../net/wireless/mediatek/mt76/mt7925/init.c  | 51 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7925/regs.h  |  8 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 5 files changed, 73 insertions(+), 2 deletions(-)


base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
-- 
2.54.0 (Apple Git-157)


