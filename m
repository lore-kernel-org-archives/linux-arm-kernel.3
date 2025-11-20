Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF64CFA456
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 23:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o99Q6btqe94dFwhCkqr9jpNEkkVzeqWoyeDeppPljwM=; b=bS68Nn2Bla48BqOVgZboVXNpxK
	j9FGK6Wscl8nHRTiKR3yHdkAniNRGLzUm7Z8EjBLYvJ5DhPFgUlXtt19RzrAcT3tTdbUM3JsPgk7G
	vAcTKBRVqd3dCl9L5AGGoAASbD+Y10bezh21roX2JoqL1+/3hSOa6mpzVrx+F5mj/cgfsNM9TaWmG
	3+9Jv+miE2bQOx5S72Fal9AKCXj+YTvc2FnhD0zS5m7ohERMka5nqIVHWeLJCBB3BuBNf6e+Egfg1
	OQ//rzLmSVLqnUboagops6prljGRBCHFYapDqLtADdPc9hJk1i9v0mZLaZ1Gx5do8+sQGpUeXUqjb
	JMYy8avQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6F-00000007ZDM-1c7H;
	Thu, 20 Nov 2025 23:30:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6C-00000007ZBv-27hd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 23:30:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477632d9326so9144505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 15:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763681398; x=1764286198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o99Q6btqe94dFwhCkqr9jpNEkkVzeqWoyeDeppPljwM=;
        b=VbD5Mo+V9yRa4/UiWXbQ2am9ZBEdKTWWsUH7HYX5F9Id93NCorHWeNKW/vvKjPVKWD
         CpT40iJK6F2i8uFNLNOACAgZwVj046GuhvhRVzo7VoyCtGS3LsB2cxk1jmF4GTaYha5K
         QB9FGAp7gXnPu/evnV+fI4AeTSqRx/4cAiKHUcmbDZ6UcUZVbLIz2IpQY187tphCSfQn
         bGNI89SYlVipp8+XlOgnZf+hRY4Jk7y1XjiHbTYco3aGcBu33ddEvNy1dD055otBz/Bh
         qiC1vOQfQHiV8nmT5V+oNmY2oRWZwnlccwgu/N2jo1Y5sgqNWwYXh34JsIK22rRDq8Mk
         09HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681398; x=1764286198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o99Q6btqe94dFwhCkqr9jpNEkkVzeqWoyeDeppPljwM=;
        b=V9EQOfaBHbQps5uc7GWMUX3BqA1hM8/mWqkZHGVljArhXUheFcC23vkA/67n+2QI2x
         oD7bmi+TTqPiWQdrgWW2xs8yo+zaowl0+tKziNN2I+CpqoRAPsHyhb0ZDKl/KgHvrOYb
         VlP/+Olk0pINv8ICrGnMFwwYmwb/BldgbSpmZNQwfazChOurPpTeybfihL7j7eDlID+j
         pieiAH+kTAHLs+RIh8QoZsDrFlX93wib4vkDXakvzjpFCXU6yIomcpAV7Ua1ocHIVLWu
         n/62bFzJMhzMVuKgvUSnexyvnrazjA4kSSD4dbz8AdCcoedlm559ok391YNguDhVPbxT
         fVXA==
X-Forwarded-Encrypted: i=1; AJvYcCUkXc9ja23saq4Ut4zJ9kWHN+DUO9jelm9RJHrw6iw4wpmpl8wmaYimeDMb2MqSY78+N5yx8nn6EkHvF7vzg+33@lists.infradead.org
X-Gm-Message-State: AOJu0YyUghbbtv97DdIlH5sm71O0bVuxMfR/JPvOxDWNZ9HChfeKoFqP
	u4RD9dlYIEg9uZa3zh7IiBNim9rgz7roeeu7xXmzMGJK221jo7AopZW6
X-Gm-Gg: ASbGnct/hUQx8f2q8nn9kxHVJwXO40FoqWOS+G14jHNLneA/aWqXYyz314lBVa+crQ3
	ZpcQPXTpaDJjOznjEO78NNp3a8XoBNKCNbZ0O8y5x3YqmyxGDDDj81jwwe1WUNVxc2DSV1+rTAG
	oXZt1HdLgjq14tMcRWhlmsvsFoPyFk7CqUg+mPSFObSlzWJU1h1ZaKGP1gts3iKE+yeipmheGwm
	yRbuq0WWYG/imlclhprHwDtOCvH2iaQ0Kcbxlag2b/lH0nP+TPV3QhdzrrF4exFPn6rHCpb2BJA
	3XXvMQ+vMo6nFm9szNHc2eNC3hTknxB5QolFPK7Kl5nrPhFGu8PpQNsP2EEl0ejMiJ8N4WqGo5a
	mlTHoqICR6iRsXe+627B8dEn3WIBAZv1n9chkyWOQklBbkbqCUPJOsKUX28l4mUu+2WIe75emHR
	FqF8GLpz68j6V2sE7A/o2qsRkn1TRQgy9UYZzXXsk0
X-Google-Smtp-Source: AGHT+IENcKDSU9p5/g82mvjpGvvEKuudRdiDvyXXEFjAWRPw+rHnGQTHf31HMHlBDVIX2Yzva/jh6w==
X-Received: by 2002:a05:600c:45ce:b0:477:79cf:89d4 with SMTP id 5b1f17b1804b1-477c01ff270mr3630625e9.31.1763681398280;
        Thu, 20 Nov 2025 15:29:58 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm7776315f8f.36.2025.11.20.15.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:29:57 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] ASoC: Add support for Airoha AN7581
Date: Fri, 21 Nov 2025 00:29:09 +0100
Message-ID: <20251120232913.32532-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_153000_564470_74F5A46C 
X-CRM114-Status: GOOD (  14.04  )
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

Christian Marangi (3):
  ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
  ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  67 +++
 MAINTAINERS                                   |  10 +-
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  39 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 456 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 371 ++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        |  61 +++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 170 +++++++
 11 files changed, 1244 insertions(+), 1 deletion(-)
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


