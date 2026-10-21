Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614B3606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ERhAALCP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jxnNk48f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=; b=ERhAALCPwR9E4eKJ6vQDPqbk4J
	4pXGV2GY06Izi0yYMzBUuIfzfrtpguOWZQj5fC2ddyrSQ1DKdoUaYbntCTBA4ZrxfSCcsuHEpKq3z
	2HlGoWuMMKTGOUHJVRf/ZLgK+heKPbR3CCwXgI/ul9kKDhX2sAZsXm6hPgKPA7LpAJmZsh+l75Zxa
	ArCtIcqmoFVrXAsrSX5dD/YOht+gjbhHl3EFF4YUtMAMFzr08BA22LKgWqy778ghGfv8tvaIX9xyd
	qS5ir7HiRVMxRYeci5KryZWZ3ogy14jLhUVKg0BlJUkzLAKoVebK9qFusrKcMTUOJxjNt8qvkpPzy
	/ub+WG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVhw-0000000BpbV-23bu;
	Wed, 21 Oct 2026 12:46:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVht-0000000Bpab-2OjL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 12:46:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8520161fdb9so391335b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586773; x=1793191573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
        b=jxnNk48f+cbl/XM3WCxWH3nzuwn3IY/3FAcKO5Dn5tI3qNj7/NGw3pPMqJiPN7J6l9
         wl8zwZjY1QNbbw4gwecK3SCQZydzrDcobfsllyLzR3VpqQmCdvVEeWlva/w5Cr0lY4oA
         H8sWtsWdvwvRHNC+8E+7HWQ3gyitruMXQWiCts8pniBsd/wA+YeDYIxyGNZjYb2C18O5
         SyLgvgD/jb0GjITojCJeMUHVR9meAMSZUqsrspGDtBrk0jfAkErJfaZuTrzaMLvtc4NZ
         tGOkj8vBgA247o3i1SJvl78ZGz8n+nHFmxMRQGzHA2ZfZ45T0AMR6VConjKTtm9O0djL
         sjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586773; x=1793191573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
        b=PQm9L6eCzx6MMPp5QF8fwiF2zMAPLsGv7QBPLCY1nssaw7pUKddR2gsL0M8J3hTkJm
         EzpRUbMuc8Lj52Vdm9ZNxVkwDwrjUHNcSXnuFqGGfqHBkmJhYYFWd1bHW+QmJBhIwoly
         HRDb66B48Ee2LWf1as1o9xidU4tAxymaxtGa1qF9+Ed8fjBvdwi8iUX9NYDe5wwansmD
         5ezBOXUASll7gkbxeOi9z5w6OOKsBel4hQ5mu+MNUIhJx83H/ZDMNhjLrOgk1omX8EyQ
         2HZM7wBX4ML559YE/EHT/rOTiILDtm+7xJQS/m/bG5Oysurcpz76ng0kHroQ4fJsQYAR
         a+4A==
X-Forwarded-Encrypted: i=1; AKwUvBxkS5y1Aa2oQZDpHUKpurPaCEZwIJCdxnHB7VKraokmYJW1vTSMNwBlk7DGk5UgOGzgRckcctLPnNTFjdGKlgt8@lists.infradead.org
X-Gm-Message-State: AFq9FYIpZX5FmRVoUImm8Kc4LaAMqXDcICcg3VP61y82zlckuumAmPub
	v0Bi3tyqJ0FLHfsodlJw7aGv+d7cl9t7A1AiZ7mVoTEvT4qvTpxkyk2a
X-Gm-Gg: AYBFou2jV8eszpgf5h6i8weNSv9ve0N2FzgmI6NLUbrMp775O8DkMtSeXWroKys2k6k
	qomsoQW3zl9CacSo1Fh0r8UggJyL9As58MDqnodRirpxSCbTb+JAdzSIMheJsoiaWvVk/tJACO/
	6bMo5aZ/S+PvTlxbPEjKkvAz2EaWK8sVp/mYhi+LryiRFY9zTPYqwnvGlqDm3xFf9vpxyTd0aW/
	ZWUgXNi6NV3T+CUtPS7ZhXnGPFJ21NRbwo2BJCWm5kyuzSGXmhjCR4kbbNRAW+6QipIrwTOL+kW
	BM91luba2nqwh9kcuZsaR5FnlCJzV2qeDR9epwX2u3e47xDHV8S7fkOPz6FP7uTTxVDxAH0Pen+
	QlvE4t4ke2ugbO/Bclz6qkkRnj0vstMJX+d1cAw03op/uLvmlUTUX2QawzFLpmM04EeYyPuMQp2
	b+qYBH5ZfXkuJV49Ogn9MqhqhqWnQAl8RJE484Qpu9VKJoWmYSD+7RTsdDF0a2+XLgQBu8mlLdr
	WmcEM5sEsuA0UcGz1qrHGO4MXW09Qwa7hOvBhvbmRUf3S/MRH1A3WfoZC2HdGv17fRSIouTsQ3l
	x2oiWgjFG2/1Skc=
X-Received: by 2002:a05:6a00:ad82:b0:899:632a:9613 with SMTP id d2e1a72fcca58-8a089d2c36bmr1490501b3a.40.1792586772365;
        Wed, 21 Oct 2026 05:46:12 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08960fa88sm832964b3a.53.2026.10.21.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:46:11 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Wed, 21 Oct 2026 20:45:46 +0800
Message-ID: <20261021124552.767218-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_054613_614268_ACF95955 
X-CRM114-Status: GOOD (  15.55  )
X-Spam-Score: -1.9 (-)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C. Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Changes in v2:
- Drop the hard-coded 30.75 dB PGA gain from the power-up sequence; the
  PGA keeps its power-on default and the capture volume controls apply
  the requested gain.
- Keep the PDM outputs muted until a capture stream starts, instead of
  unmuting at the end of the init sequence.
- Re-run the power-up sequence on resume before syncing the regmap cache.
- Handle the regulator_get_voltage() error return as an int.
- Drop the unnecessary of_match_ptr().
- Fix the copyright header.

Link to v1: https://lore.kernel.org/linux-sound/20261020143135.623897-1-jerrysteve1101@gmail.com

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 367 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 131 +++++++
 5 files changed, 566 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

-- 
2.56.0


