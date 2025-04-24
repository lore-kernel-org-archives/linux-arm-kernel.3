Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B333C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZiphZyoVbuU2HXJVLii+SRj3OxrxBVUtbZVtTcIK3L0=; b=Ked61ZXd2uVdT+u6W26sNV3Ma0
	UdfayjeEW6XYslIl4JcK6FXl+M3KXzBUaVM6BoFHqUF6kksQ55SIThJa6ojV8YDsPBdIPHsbwp3zj
	1F01jQyM2IMiscmy3WhakQX08qEwnMenKLPd0Keal9uD/+xgCQaLtk8+J2gFx9qMLAc/6bMvBic4K
	4Axmw4MyPIsFnOuyAHaf0LHA7WuIjGPotsznvLxLOVTaBhvNbjW8DT4RnPgZk6hhisb33YHCsssHx
	4hMIzM/PbsX+4aoxcThADyCjlpBx66oq593dBIy0jE1vEzRGVJYHIeCag0s6CUPUoWrCcQ95wt+H5
	YSEcmdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x02-0000000EGkX-0lz7;
	Thu, 24 Apr 2025 13:52:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tlm-0000000DfQj-3wpE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ZiphZyoVbuU2HXJVLii+SRj3OxrxBVUtbZVtTcIK3L0=; b=pRMLVmbRPMbPBdXEU8ULobWewW
	NSLgp4CQJ1K+xc/kbqP/jyFXPKjYau6VDGDKW/EML8kTJYOpD5T1mgOyk7TRDiP7UZdds4BBgZzD/
	LEIzjsj1Mz9ldryanFvedjptt8/X/wjK1izxE14eCcEuMwasy5NYLdWsflz6T7sQ6JcFfjRXe+R49
	pgFUQnYT9ryrTE/EISGUcEsu8f7SUBNcPB3EG21t5Nn4gq8P5i/Ie6dKcdcsVshWpE7cnDeNn2qK6
	OzmmKju0e6QqW/qRc6MQuZyO0HCTkewRVJ42EHx0ENvznWWLDXxFR0Ewq6OJE3mcA6uXYuPjajb4p
	SFLgnJpw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tli-0000000BjTI-3MjB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2295d78b433so8515665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490320; x=1746095120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiphZyoVbuU2HXJVLii+SRj3OxrxBVUtbZVtTcIK3L0=;
        b=M8/PRZa5vXI1Tho12TeU1tD/Q0xTAcaCcMcqd/4xUlfpJcfthdg0AB4YmNaQF2cRxQ
         rOdGUPh8NWbuzEUwNmIM+vqgRxRY3JomBVuod7yTjyOyyjJBQ/Rh0GSQCar63lh8GJYO
         nXWfDy4OwWV6YZBw6IleQQlAPXz3IKj//RiVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490320; x=1746095120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiphZyoVbuU2HXJVLii+SRj3OxrxBVUtbZVtTcIK3L0=;
        b=jWALCmKMjOWLTULcOtRzY1cTIeb5tDytSQEpMZYWvUH7ocsAxfupWTfXecEwhEINUo
         B7Z1QbCRTZJfCiqTdDUkfqrFGp38mQJ7v9R6H3jGFsFkg5NHA5sjInEpcyNl/5IPR8fg
         QJ+RmMJ3CNprTJ6NBbqhIyGz0bl1RV0ZAsMHQSCsozQ/Lw7hMlGu3e4REf/2swgteJHZ
         RoUGu7UuucTM2TJTzzg5dYwvp7dJev8RDMJwaTVKTX1OYqlRUFtd8NWzYuDqqePkXzjJ
         j2tRsQA2Td7aecJfGA4qi57Hdg9NPj6D23kEpuijGgU2Y9PCSbfRSmlUjrdMzXYpYeVQ
         xEYw==
X-Forwarded-Encrypted: i=1; AJvYcCVcjTH2luU+H9B4BaalLNTVPMDylVP2Cy43juxg8EOeNmpcMJAxs+CDmKzuAHExfDPFTasJ/ARY/oFOx+9psKqi@lists.infradead.org
X-Gm-Message-State: AOJu0YxW2OT6CVao/RbbUM1ACP1QhW1PDsUSWon4pPPgbHAssvIXDURJ
	bP723Cr1hMA3qKke8Wodn9tyt/cP4yuW+m7WGmwGHLCQf8OhCAjVL5pNXk13lA==
X-Gm-Gg: ASbGncvPznn98FVYokPdpIFBZeRDlQ5JpPT+HU/MkWtUqlI78LQTOH1wAVgWhIjECgt
	rpNdU80HwRaiZrkTXMiwsiHaQhRzU+0G5MHJbOMAcSPkTXM6JI7GgBz7ncz4sEGKacapiO9UMb6
	fRLoV2oNqgHuN0CubEIJnv4gzsODXTK8QX/Wn0vWXMRQOd0rDZJFPpWXw0BBk3rFI4GUbMB3d1D
	BSpQpcaSfyCDks1T/FvsW66y8ZyfVsdQvuldK6Ot1UjhLh0/Gg9Cak2yXgDo3jABasdA4p/0aIs
	Q8p52ABGNJXPJN5OwhY5Tv2m4WiP7KaclL6AOtM+iwziWRL5HCOqMTMjCA==
X-Google-Smtp-Source: AGHT+IHKZn/4E+ABRHWYqcKrwGD2nSNg3ytsgaiTlsNEp51ItpCCjFOn8apfWFbXf/8tif5QwDiKig==
X-Received: by 2002:a17:902:d50e:b0:215:b473:1dc9 with SMTP id d9443c01a7336-22db3daee3emr27358095ad.46.1745490319801;
        Thu, 24 Apr 2025 03:25:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] ASoC: mediatek: use reserved memory or enable buffer pre-allocation
Date: Thu, 24 Apr 2025 18:24:54 +0800
Message-ID: <20250424102509.1083185-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112523_025534_5DDD4785 
X-CRM114-Status: GOOD (  23.09  )
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

Hi everyone,

This is v2 of what was just a single patch "ASoC: mediatek: re-enable
buffer pre-allocation on some platforms". Link to v1:

    https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/

Angelo requested that these platforms use reserved memory regions if
possible, and fall back to pre-allocated buffers only if that fails,
to align with other MediaTek SoCs / platforms that already use reserved
memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
SoCs.

There are three parts to the series:

- Part one (patches 1 through 5) update the DT bindings to allow having
  a memory region. The text binding for the MT8173 was converted to YAML
  and also aligned with current usage by addition of a power domain.

  Note that the MT8183 text binding was _not_ converted. It is
  drastically different from what was landed in the device trees. Some
  time is needed to work out the differences. I might try to recombine
  the audio clocks (which are actually part of the same hardware block)
  as well.

- Part two (patches 6 through 9) update the audio frontend drivers for
  the various platforms covered in this series.

  - Patch 6 is the evolution of version 1, now defaulting to reserved
    memory if possible.

  - Patch 7 adds support for >32 bit DMA addresses to the MT8183 driver.
    This was missing, and prevents the memory regions, which are
    allocated from the top end of main memory by default, from working.

  - Patch 8 and 9 are just some minor cleanups to reduce the number of
    "&pdev->dev" style dereferences. They are placed after the other
    changes to make it easier for the fixes to be backported.

- Part three (patches 10 through 13) add a reserved memory region for
  the audio frontend on the various platforms.

  For the MT8173, the change covers the whole platform. In practice
  there are only ChromeOS devices.

  For the other platforms, only the ChromeOS devices are covered. These
  are what I have available for testing.


Please have a look. I assume the DT binding and driver changes will go
through the ASoC tree, while the device tree changes will go through the
MediaTek tree.


Thanks
ChenYu


Chen-Yu Tsai (13):
  ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
  ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
  ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory
    region
  ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory
    region
  ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory
    region
  ASoC: mediatek: use reserved memory or enable buffer pre-allocation
  ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
  ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver
    callbacks
  ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver
    callbacks
  arm64: dts: mediatek: mt8173: Reserve memory for audio frontend
  arm64: dts: mediatek: mt8183-kukui: Reserve memory for audio frontend
  arm64: dts: mediatek: mt8186-corsola: Reserve memory for audio
    frontend
  arm64: dts: mediatek: mt8192-asurada: Reserve memory for audio
    frontend

 .../sound/mediatek,mt8173-afe-pcm.yaml        | 98 +++++++++++++++++++
 .../bindings/sound/mt8186-afe-pcm.yaml        |  5 +
 .../bindings/sound/mt8192-afe-pcm.yaml        |  5 +
 .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ---------
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  9 ++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 11 +++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  8 ++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 11 +++
 .../mediatek/common/mtk-afe-platform-driver.c |  4 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |  1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    | 66 +++++++------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 83 ++++++++++++----
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  7 ++
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  7 ++
 14 files changed, 266 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt

-- 
2.49.0.805.g082f7c87e0-goog


