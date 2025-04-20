Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDB3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EEGw4ei1ltPqT9EdfPygnEz1mrR7+WwPBOwxKSKXcf4=; b=nOFxbgT8NKnqwT0pVIP/PSX4Xw
	36QONHGAjdp6Q5B23mn6czYDH5F7JyimdJecZytXSk/P9X7witj3hlxsYxJJQrGgg0Ro9/masmHX+
	qvAm0R1m8HXQBLzesXbM9LLI8tme386ODR8lD7wj/ZdwXBWxF/J6wQUVTfz9lcMu5PdBDf/PsgkEn
	/j/92BVPeoC9/xuzIXDpIE+v3VoL3KffJ1yiTmavbGfm6NkZMvpGrvwWSjgZ0DP34bZgIcjKyRtJz
	JefZkJl7epHZ8dDw3DnOtD0R5N2doTlcUZyTpKNRJyfgo1fVYxGGfadO/RuscYuudmjDW6hT1bYIS
	RxWPT9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Xs6-00000002nIc-1lVx;
	Sun, 20 Apr 2025 16:50:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6XqC-00000002n1d-0pfa;
	Sun, 20 Apr 2025 16:48:25 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so591556566b.3;
        Sun, 20 Apr 2025 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167702; x=1745772502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEGw4ei1ltPqT9EdfPygnEz1mrR7+WwPBOwxKSKXcf4=;
        b=Y5H4cpGSHBcjr7tICj8zOTnyUfXx+SLKXDY/8X6lAcTpqecXSD5QxtP0A7ZETHsJCr
         alcauBlq615+/NZ0iTd73cgRo/LGcYiHnlY4AB3MY8jHd95/W4cFZR/2AzXGrHRvvUS5
         nxialK0SZ4qFsmflPNLygdJjYGLQyyem9hEczdP4b1cVFpRDbJQsXQN8dESufffud4t+
         HiuYkDkIlVJDzF4E7N6rxOh+UFsM+BfJNnToi2nNSptRLq4rmna7s2CtdnKOaod0vryc
         Y3AQ4e+jN5G9imOZYU5Loh8mfY9ByInm/ZOSsJg1Mmvkzek9nzVwlvb7OdMNsN94rvKo
         amyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167702; x=1745772502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEGw4ei1ltPqT9EdfPygnEz1mrR7+WwPBOwxKSKXcf4=;
        b=LvLjlT9cvzd2Q041XZ142yWC2wCPXeCejQLSehyLbcboRDpa1RqjY9FFI+jna6Tj0Q
         eJQLfEmnLaQK4bN+slijhRVTHr80nw3cONTYLAihHxoQCTcgpmKS/9Bojx1QVb/djzCr
         xe0ukTUq8f3zbouqCigRE1SJZC6JlI4rv8MS1nPiaosgRbLemceVcD/4pMmG4eveHntj
         qmhzKhhN4JRwkt5FU6ZqsL9ntrbDV+IIFbT/eFsMx0FzjpIGEbd3Cm10xiR2aFrY93kf
         Jt86nQRsEQ602u0rb3ZRFcqhoT6wnDM8GNUwt/snqpRc98Dlc7+XaXIYpWoRwB51tUDa
         DoCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIepph2aeV/DLnK+RtZq7gDKdGn+P502J8V+i9YFHmPeXgcCan9rfjftP/IxTY7v96cZBqjbDvRYWLAB60Qh2X@lists.infradead.org
X-Gm-Message-State: AOJu0YyWiHiqP0hI9CRW53msNOSzIuZGVAC7rJths6bjxTLc1tJqCAoo
	fTRMzI/KTvAA0CfrM+/JP7JPoBe7e8YEznLBYwFePMM7mg5e6aCKtt92/g==
X-Gm-Gg: ASbGncuxY75b+i1oT4sVlUqlox6KjfJKMDtOszbDv0xWjoDD1+uYvteD5gmw7VMTS5i
	Uf+kBIzbyKW4QSY77H/Hoszr9flAKPVqlc3yhEWIKvr1pIiGELYdAX9EgiU3iqpHZsHZpUyhchi
	2VXhQTjX1eJNaoCdc0+BE7aCPY3nFkYIc4QDZ4POEnHF38NmR1YcX/OzPc9ECVxR3FBZ2mSZZbC
	M+N2Jwe5EnP1gqI3LypkorwyG42amO7ISHwXifcAmSksnU3sWtV+eReUdXhfXzitvTfIhRQpLZE
	Aud/bcoOcH4jQMDY097sd8FCFIHtKN2HmCoibOrP1qBITDx3XNmnNIW/4TeSLyaGYlKip7Kq+jj
	48r0ooBxBrIUwXZ9Zybrq7TZbvore/PgKUaPV6fGciSLuv9JK/HfCvCPl+J/psnNElw==
X-Google-Smtp-Source: AGHT+IE3PsQolxVL2KiqFnBgslOuRCqoai4HIDr8cg10JY7uGcdQOpXmUPJ3NaFiU0N/NqtaE0v6vQ==
X-Received: by 2002:a17:907:7207:b0:acb:168e:c257 with SMTP id a640c23a62f3a-acb74b7f3c5mr939128866b.26.1745167701617;
        Sun, 20 Apr 2025 09:48:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:21 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/4] dts: amlogic: fix FCLK{3,4} clocks for new PWM controller binding
Date: Sun, 20 Apr 2025 18:47:57 +0200
Message-ID: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_094824_259716_61EB7E7E 
X-CRM114-Status: GOOD (  11.48  )
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

Christian has reported Bluetooth issues on some of his boards, for
example on a (GXBB) WeTek Play 2:
  # dmesg | grep -i blue
  Bluetooth: Core ver 2.22
  NET: Registered PF_BLUETOOTH protocol family
  Bluetooth: HCI device and connection manager initialized
  Bluetooth: HCI socket layer initialized
  Bluetooth: L2CAP socket layer initialized
  Bluetooth: SCO socket layer initialized
  Bluetooth: HCI UART driver ver 2.3
  Bluetooth: HCI UART protocol H4 registered
  Bluetooth: HCI UART protocol Three-wire (H5) registered
  Bluetooth: HCI UART protocol Broadcom registered
  Bluetooth: HCI UART protocol QCA registered
  Bluetooth: HCI UART protocol AML registered
  Bluetooth: null: hu 0000000023fa9791
  Bluetooth: hci0: hu 0000000023fa9791
  Bluetooth: hci0: hu 0000000023fa9791 skb 000000003f7acf2f
  Bluetooth: hci0: command 0x0c03 tx timeout
  Bluetooth: hci0: BCM: Reset failed (-110)
  Bluetooth: hci0: hu 0000000023fa9791
  Bluetooth: hci0: hu 0000000023fa9791

It turns out there's a typo in the references to the untested/unknown
clock input that made it into the already applied series
"dts: amlogic: switch to the new PWM controller binding" [0]

The original goal was to skip this input. This can be achieved by
specifying a clock input as <0> (which this series does). When using
<> (note the lack of 0) the clock is completely ignored when parsing
the .dtb, resulting in a shift in index of the FCLK DIV4 / DIV3 inputs.
This then results in the PWM controller driver calculating the
frequencies for a different clock compared to what the actual hardware
uses.

Neil, please apply this as a fix for the next 6.15-rc.


[0] https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (4):
  ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
  ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM
    clock
  arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
  arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock

 arch/arm/boot/dts/amlogic/meson8.dtsi             | 6 +++---
 arch/arm/boot/dts/amlogic/meson8b.dtsi            | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.49.0


