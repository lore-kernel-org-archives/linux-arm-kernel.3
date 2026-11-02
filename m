Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479AA606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EmxwRd8M;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxUaCqL7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=; b=EmxwRd8MfO+PK6JUjhEKaNcL6c
	+eGf88VmKBj7j2bw4ItLDVGxuwlLZuE/6Fc4634S2bfktgaMl+yXAJqjqoDTMnpqvCC2ppiCrdk2M
	xzSbOJKiaOfRVijIPoCfk6473y7wIe/P1B/iX+RIi9Ex1UMERQfn6c6Nlo0AeLFppegAwkbEaZffU
	+ZnXigfL6JCM8FAz9gTDfwqlqV1kz923qrnjSL//EfgvKUaQ3htB0/nVB/90G2EkGP2NLcGk/K0dF
	/kxp1GpxMkHErZf7PZ9c0DhGD5/zs/qV+L3gufkD+yPUTYC/ENcUSiz7YA1soyE9YAuu+CRtexf7w
	jGp0ct6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkg8-0000000FaNv-3Ygi;
	Mon, 02 Nov 2026 05:33:56 +0000
Received: from mail-oo2-x04.google.com ([2607:f8b0:4864:31::4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkg5-0000000FaN9-3jMh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:33:55 +0000
Received: by mail-oo2-x04.google.com with SMTP id 006d021491bc7-70399d7f076so1215961eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 21:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597633; x=1794202433; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=;
        b=lxUaCqL7dSmnUvLH4y/QzwHbTKyrocr6QbSdmzcmkjOvcL8mJa2Xa4aehQTzmCkJW6
         l0VBvXashbelyfMTPniy75l36Fg/c5AzXeLqbPS9Oja2ScX+JtpupqaZnb7xfVZoaDzz
         H5XR22SuqxVj3nAK8uwX4vIB8yrUKVcR8sphRnvXePxpd97T4UFKeEwtS6ZpXV3Ev1Hf
         zMVX5UzKFRKNa6Uei/OmmzmJeIyK1QzXm3fGrdNx/Mz/zUrKt5TAirflhPcoaweIkATG
         +BsSvSSEEl14AIPkO3A0vklpPin7nmy8KJQlUz3/Ajn0+AFr26LPmBT+pycfzFjv04o8
         SrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597633; x=1794202433;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=;
        b=BtZGc35C4ncBK6sTUC0/l31Nl9vad46l0TMCAfGKxelSj/eRF/YoXKJ8KBbZ71H6Ph
         cgjcwq3jLqtticJ57QDOuTwkyyVPnrL8lJSJQNzh6fQ5qUgQI4UJt+DYGgdnEnaA9/Z8
         iIe1ps1M5L2Uru5oKuJq+FNecaYSCPAgBlgdWFO5U62pI2CvidPOwWlp6B8swzrVw1KK
         HgXUN+4dRk/8xxYZYFioZ+ztL1KkZZCOSShg778ueJvWVld3jFDgoQepVVLop9oin63s
         j4//uiDQnp3ONsCTSRkvRb1rJtzB51LmhqdwUYN6lahEsZA2Qs3kZ5M7IwpJC8UzPFIO
         ZXSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLpCIjdSB7RpXUFDrCsPXP8kGJOTfHA00GRA2yKvioU5fCZ+uj2K8RfymcoZq4kPN+O21JFZh3xrOm2QMux6ok@lists.infradead.org
X-Gm-Message-State: AFq9FYKw674lAQD3DJ489tploBSoiQcKA0LHWK1MmNeqB4BE69jppxoH
	BYxP2GS8cPNIjf43U8W7fORnSaOn95FlgNhlSbyZM/IOeRgdN9tVKRiK
X-Gm-Gg: AYBFou2rFYnelnpKV8Dkp0iPw78OXPpU+01jayPp1o+uraMrfCiBF75QrR90vw/TUUk
	jSlb1ijR+fFwGxP3gx13LyPIokTysSVAR4nmZ45YNlnkSmyoS2cn9roz4f1TTM6OEi8Aj+7IRg1
	2e9OJWDE3UEZEnKbdOCGIhUoPl9SVEfJ+3YfymprCzsTN5nb0jVMSVGQdulSagUQT2VcYK1lEit
	3jX+N6RsRhYwlD6c0//daXzsjNX7hom3ZoBVV2EfzktTJNuMGOfq2efNZGBtqPYDBcNGvYf/4uZ
	ZC0T8BRp3UXRWMTYMjToqgVm277km5pj4SnZj569l5LjwqGjSqM1Xng1jLC3lK3GrLMd0oGqE67
	DgoiGE88B6vWdqyY2tObUHmx7DrslaXcGtzb7HZiMyiOl1YnRQ0EvzsrP+eJ14f+uAq17cRBK7p
	3yEy6N5if3BZwYC0YZzdXYBESVBJbu3wjyj/tps2dYK2KWZT31msLbJrfPoMJxMLTj7F/KG3xnI
	1uA2WK0GfqCQuNwHH8HdPmY+pQ91KWvlvXi2pPLUY6Hy+YUVM3MlpCl4PYzDPYX1ImdQ41yxEuu
	Y3XDfoooAh+T9z7xga3XgDgW
X-Received: by 2002:a05:6820:208c:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-714f24fb531mr4934585eaf.5.1793597632682;
        Sun, 01 Nov 2026 21:33:52 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:51 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Sun, 01 Nov 2026 23:33:45 -0600
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrCMAwA0KuUfC/QNqNqryJ+dDWbQVZH2oo4d
 nfBd4G3Q2UVrhDNDspvqfIqEI0bDORHKguj3CEa8NYHZ/2IOmlnrJ2/2LfalNMqZcG1BbqcUFt
 G8k+0yWUX5kB0JhgMbMqzfP7P9XYcPwxqctd3AAAA
X-Change-ID: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=2043;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+AH9smEBqnGEd7Be3eQjkLdg1eIcwhdAuP4jWupgQ64=;
 b=eov85h6Nzm1K0qbn0yx99tHtOauCX37OjFlOU3aSi5SRuzvUuLcnssjUB6YtD+fdgUHfOIXME
 oIzVcU1KxpLA/SNkK/Wou5Q7v2zxcnGEVyrhCx3FDnngfTHaWMF3e7u
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_213353_995056_D653D06A 
X-CRM114-Status: GOOD (  14.96  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - the bit is set at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Both patches apply on top of the RTC nvmem layout pair, new in
v7.4-rc1. That pair went through both rtc and mfd, so I'd suggest these
two go through rtc only, with Lee's ack on patch 1, if that works for
everyone.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's 32 kHz output
      rtc: mt6397: provide the 32 kHz output as a clock

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  6 ++
 drivers/rtc/rtc-mt6397.c                           | 85 ++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h                     |  6 ++
 3 files changed, 97 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


