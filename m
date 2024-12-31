Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2110E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O4LH06p6e80pK5KxPNhNgWz2cmsFSg5nIydohZVyBn0=; b=DKskYceQXBQWu98TwjPkFZnijM
	ckNWK++7AY0QaIG3V8c1ILEKiBGVqB2YLDy609hZCYSdjG6ihMWN5iSG5T+sZnih40fxzjduCShd7
	rXY6QF4Lyf0nObCNFd2MMu2TYgHfS4E0HTlAT4VezPbNEq/1vi4asRdrGfJwJ4QgGzYabLapuogVU
	1Bb7EGonQf6JYv7wRCp1Ri089Jr4BXLM11E/w17jTZ/Jp+O3p+lQaCcMAokDEEpR4Slp/G2rwL+mP
	coJAHRSuXxmOEr8o5OzpIL8UhwFskKmhnSrPPKTdmlYlQzPX+IbB29K7SFjENdW+IvzcMPxm1D07G
	8bki/n1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSi9i-00000007fuC-2ihZ;
	Tue, 31 Dec 2024 19:43:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSi8T-00000007ffb-1U2E;
	Tue, 31 Dec 2024 19:42:38 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so13609833a12.1;
        Tue, 31 Dec 2024 11:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735674155; x=1736278955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4LH06p6e80pK5KxPNhNgWz2cmsFSg5nIydohZVyBn0=;
        b=QiXbfAlVZRcWaGr+sV7AzOR6+0VjJiA4Y1k9ZjATvWIzyANBfIC8/VNAZ3CvDQmo1h
         +4NyGMtYSQnHv5MInVxzfa7R91ci4H5PC0G0HE5/VZYkbCAb6d53zU35AmKQrmN8QW60
         5hF9jHf8sfFkXmHLHpTZFjBsf/cuCBymjdwPQLp0eanulstXZhyhF61qtg6LIveHitWF
         7JfSNJX9MUGQi4jIpqa9wGZvXQfhl/WKB1TAEF9mggUSE3bTS+D87OdTJSRRYcipfEJX
         CyifHKVP/aFvRuP1FykHEF61OhwHsezVqv+PXuSbfldlowR6qRvr7ZchDj562nCIC4D+
         wuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735674155; x=1736278955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4LH06p6e80pK5KxPNhNgWz2cmsFSg5nIydohZVyBn0=;
        b=L1xWhJakb99ysnwCmRjFCnn832UHNHu7aaUvCeMw/Uy/u6xRE0KWeIe0swUtQU+tpR
         rBWu6yB5+erOWIiAda92yYrX2JEuv0FgZLEgOvYc/Xg8XLrCzx0joyikatWBPEw4iwJd
         8oEUSy44zei1iQLM41RIRTVZB6t+Hpnm6cbyNtxrlRPbFOHUTBir/3Az24yTE2V5iz0Q
         EddsnBj81r6Jfq4w2ZS4S40FMNudW6QmySyuCW5zBFdmC3iGwl7ElmNFKRL77oilMlzs
         vQ7VItGeoIJe32nNK/2Wkddpu/goC/nUtHnhab0v3lQosNUL1tOx+Y7L47kuF9ZFbfds
         Sxcw==
X-Forwarded-Encrypted: i=1; AJvYcCUR4Zyx3c4RjLG96GyfBCeD9iB9J0lAByV3YTN8Kjcvg6mLgxnG18qfa+rD0Ys6SQ3Gkx+kGi/IPC4knX5FmcXT@lists.infradead.org
X-Gm-Message-State: AOJu0YyNih2shntE2XXobj36eu0h8ZfzqFe/Th5Tvhf92R0IRV0v7HVD
	1lWdNIJU9ZZG+vLcfgcPuo3wl18+cCKeEYZE1eKr62+FMrvJUuuryJ7O3Q==
X-Gm-Gg: ASbGncvlFuzehu/+0bLs1mQ5nmXs/vzlHh/SZMRfnBjuF4SGmVgYwHdxWvpsg1zHsMJ
	aycvoS7yCO1ceFtMZXm0BzbY3FU+FAyafKC1Pski7ypirkex35/vuQ4cakNiuvpXK2kxw5kZpDq
	Tng4aKCnS8i6e80tHoz/f4s3IGZWSvZ5d7cA6P1OX+mt181t6Jl/2ho0C188x9VL+dsLHRtDp+Q
	KZvVY/g7xsWnI+slyAvwhkhq/FC1N9nKLM8hpbiQro3j1GBi0ykPbr0TZSIov2xpG03Iq8ROvR1
	67fJ0WvbB/oArwBJvfcED8Ht3WGG3ZYP2HpfwqIpuZwvykZtHhcyXCAitjWqG+dGEs0yYpSoM3Q
	HrE99oXPuy0Vqb4glXYOKoMQl
X-Google-Smtp-Source: AGHT+IGXqm/aQBqvNi35rgVLYkC8kH5DSjX826DjeCEUtekC9n0oOmjoa0MClXKsVCVmiNvGJMlXhg==
X-Received: by 2002:a05:6402:3217:b0:5d4:4143:c06c with SMTP id 4fb4d7f45d1cf-5d81ddffa67mr36677539a12.23.1735674154722;
        Tue, 31 Dec 2024 11:42:34 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b300-ce00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b300:ce00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm16237820a12.31.2024.12.31.11.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:42:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gnstark@salutedevices.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 0/2] iio: adc: meson: add MPLL clock workaround for GXLX
Date: Tue, 31 Dec 2024 20:42:05 +0100
Message-ID: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_114237_413589_AB7F95F0 
X-CRM114-Status: GOOD (  12.92  )
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

Hello,

Amlogic GXLX SoCs seem to be mostly the same silicon as GXL. The only
known differences are:
- one less Mali-450 GPU core
- no VP9 codec
- and an odd one: the three MPLL clocks need a bit toggled in the SAR
  ADC register space

This series attempt to fix audio output (which relies on the MPLL
clocks) on the GXLX boards. Unfortunately all we have is a downstream
commit [0] without any further explanation (or anyone who wants to
provide details on this). Since it's not clear if this is a gate, a
reset or some other hardware fix: the driver side includes a warning
for users to update their .dtb along with kernel images in case we
ever figure out what these bits do and how to model them properly.


[0] https://github.com/khadas/linux/commit/d1d98f2ed8c83eb42af8880ed8e206aa402dd70a#diff-c5aaf54323ef93777c5083de37f933058ea8d0af79a1941e0b5a0667dc0f89b3


Martin Blumenstingl (2):
  dt-bindings: iio: adc: amlogic,meson-saradc: Add GXLX SoC compatible
  iio: adc: meson: add support for the GXLX SoC

 .../iio/adc/amlogic,meson-saradc.yaml         |  1 +
 drivers/iio/adc/meson_saradc.c                | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.47.1


