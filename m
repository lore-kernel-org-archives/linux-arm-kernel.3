Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1629BCFA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uJbxIqEiqm1f8qF16st2qXQheMIfNt3xVg34Igpt82U=; b=Jzw0o35fUyFtjO4gM0OeN3QCEv
	YRnpB54ZfJfpgGYBNx5cdkbp7vmB6dgrbWTMoJq0Y1acQGvOcB8m077Fe0GI9bHkVvBeAJkdN8989
	jatR0Ip9cmF5kovhYo6tvqgqOfnwUL8hxBE1VgscX1nochFEP/et+S/z7vMrOx6ziS520PcDLkJZP
	Eiv3UsJqsHLaFUpqbS31dr4Kk5btfADroB0hb+4htF/V8KuW0UTr/A3bI+QPw0sZv0y1JPvdTFFfH
	qJQJLSlalYNEzYqAcPw3NLyVjlPXVv+M3kbf2HD2/G4TXqG9LL0+pfWXY+t/PllrEcEytY6zt+11c
	jmUfDsbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJxx-00000007rQ9-13xT;
	Fri, 21 Nov 2025 05:45:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJxu-00000007rOx-2Sl3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:45:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so1406250f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 21:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763703949; x=1764308749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJbxIqEiqm1f8qF16st2qXQheMIfNt3xVg34Igpt82U=;
        b=FCunR+Z/nUIo2bTs/Okpa0dzDI4b+rFKTth0g6trAl29JA+/IcSfdui9N5oC70O8ec
         hgIHhq/skLjbHVl91c6NJYrWoCY+MLrJOAoo9O91/dzpT/CQX1AD9nB/CHmrZJAHrtsq
         znZhKPUQp/ekKBRaXulDZmlsU2k+gSbcQayti5+XQuWmpLHLoiL0QosRthqb9ZqVZsqA
         qDhap6lKBa+ReoD0K277YDFnOSssYwdiP2aZ41RKkP1DXj773izV5Zi2pkNce2+mAUR2
         vsMQ0bgKlALXddCKlo20QK021GNfIBzn7UIDDEPbKNm6jcfizVViWh4PWxaHIepYPvKQ
         yuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763703949; x=1764308749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJbxIqEiqm1f8qF16st2qXQheMIfNt3xVg34Igpt82U=;
        b=BQ8Yg007MCoH2qHJntGUiPhEWygYGGdy83NI+I2SVwIVndmaNx2rI4txlekIhcjmrC
         rKsiDL6M9IYEK2wpq9w4ISI2PmrYy/VOESQ2sGiU6mG6hdiyshusxfx3+pGBeCnSZYcY
         NCgzuOEbX3OJ409PS1evGpjRoqmKzqLuFQrrixLJ9vYGmXAtttL5424g3F3CWFbEAuVk
         em6rTFNiN8tm7GgeFFDsMyMyR30/PfjIdsJVpoqNrReOfcogNlN2wSTTe+IrdtRWILe1
         zN9W+gPtbwmcDkt75HRlawLd21IYCpzbRPfOz6kGfXE2pRkCipJhVb1tiE5lUN5nZqRL
         FeRw==
X-Forwarded-Encrypted: i=1; AJvYcCWM/mP5upMeg6IHXIjpcpf7QZpYzp9CLYIfbBZ9c1TTZ1+I8JEL+GLWlnlDIho+I+oAYzjeV6M5Xqlp8DGL1GDi@lists.infradead.org
X-Gm-Message-State: AOJu0YzmOXMcGZxH34U1iSqQ+oP4uCs5Tc2Lfyj8fraGubo9bLahAxXY
	ehpIQLni/AWmjDZr5MIUjYMnnD8RZsEiLqd1LGa/8uKXXHcKv4sKQdT8
X-Gm-Gg: ASbGncv/VVhX56cYK8XmWjcyYOqyA/Yu4OAv+EtWz86grWkmLlOGEOPQrjL9/SFPlWO
	IiJ8BeZk6sM0ozRe3swwdvxTOzoYisdmHZA66DRy9UCzzZYHWC5AXzQGNLQvurxQrHeH0yK1wXg
	WzwbOA1W/CI8vRS/pwzMKVRpOWzT+xFk8thxBiciIJU/+42A/wngnI8Q01/4IMEDgZ6ltP/O1y8
	ma7J4xux/wRtrOPLT2pAMYIH1aVwe03+lbTT82e1+eDlTTjuZxVaf/iz23VRfOmHXuRPVa4Rvfy
	uP0tmZ8cN3ofBJcEWiRyZrayE1DWsO/0FCgjpRK90QaHN/wvdQg4B7Rz8VWYM8O1gMhCKAuPbiG
	FrGMzCJSvGKQgXxXXrzGzQ/58Jtp4Q5fBiroizGdPMqNVZAO+ybDAiGJQQBschF1g/c9MkdOqYt
	iDKW1zpceumuLjge/7Yhn4YoVuxpnXD7b3IxOa060K
X-Google-Smtp-Source: AGHT+IHRFaiUyVpXiQGxAycMp6yKMdInYPmebcx1lHdJv0Jzj9BEBBTmyVen82ZvCHfumXjJ/rAv0A==
X-Received: by 2002:a05:6000:2004:b0:42b:5406:f289 with SMTP id ffacd0b85a97d-42cc1cd8f27mr741379f8f.3.1763703948284;
        Thu, 20 Nov 2025 21:45:48 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm9239273f8f.33.2025.11.20.21.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 21:45:47 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v2 0/3] ASoC: Add support for Airoha AN7581
Date: Fri, 21 Nov 2025 06:44:58 +0100
Message-ID: <20251121054537.25796-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_214550_664689_DAD52667 
X-CRM114-Status: GOOD (  14.20  )
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

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (3):
  ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
  ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  67 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  39 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 456 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 371 ++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        |  61 +++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 170 +++++++
 11 files changed, 1243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.51.0


