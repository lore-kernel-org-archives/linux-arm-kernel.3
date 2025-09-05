Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D49CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j3bWvwmIfZ1QK2lN+pd29Nat7eqHMsah2RpM/tEgMvg=; b=BDhakFBwxaUhexFGEPCRJDltW7
	dN1w75c/w6Wr9N9QtG7cMMwqk7sHyJdB2Ijrxa3qeBDjchmbEUf42ex3yz/MurkdWuFocxHY8Wo8l
	4HIARH/mNhowFS7YkXqlWWJPz13M1ZwWcV0mjZ06HHD35utt3y0Q/4wiqYpBIZphaChdBNGPUfMDq
	ThlQGkkQE55qs9wcYr/PbAmYgexK6e7vg/ob73JAp3xNRXV2Y3gKcJDUhfN8UFq6Npkm6wndLdJ3a
	G5b4BiqcBh8hehWTQsoPMeZ3KxtJPd/i+7kVExDMEHi4IKOM1unczIChFI3a2Oa6mEawBxcQatG0n
	HXgdUIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEv-00000002hU8-0oHC;
	Fri, 05 Sep 2025 15:20:37 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV5Z-00000001Ww0-1bSA;
	Fri, 05 Sep 2025 11:58:46 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7741991159bso1271730b3a.0;
        Fri, 05 Sep 2025 04:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073524; x=1757678324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3bWvwmIfZ1QK2lN+pd29Nat7eqHMsah2RpM/tEgMvg=;
        b=Db/KIWwYV2lk8DmdA747ciYHo3WOOuFeHN+LU/TFJb4F/diPH/Mu1PrVQIndQYj7+w
         r+C3gX4cUzlRs1Y/YtSWBJDm0Nuvc3Nyw91tpsYTh0svxO+wmzRx7Lv2mwSAshoFeVI+
         JbU0xM5479Pju3HuzK5tZ/nkTyiHeG8GX9epxI/hHURPkd+6dORovqBLU4D3NSYM2w10
         X6EHPORkfyoL4AV6P3u02oifwRtt/YbM457Ka5QzyBRI0GJ4g1jUW198hNtyQeMZUDC6
         4rsjLfoaXkNplzPwFFAFiO2KeTqsxPdKhJw7duacc+cplyyuw2ZFII5DaTIms13/q+ux
         Fghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073524; x=1757678324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3bWvwmIfZ1QK2lN+pd29Nat7eqHMsah2RpM/tEgMvg=;
        b=mTSjVt8kri4lJ2XGnmCYCubTQDBy5aiBy0B22rLDPXa1SJGiqy+49XD0WWZYSGob6J
         iD3iWQcwrOjs7eoMppMsP8nV9ynyg2ADxYJ5M/fhKOEB2IKw3ITuq0W6+7ynkZosxFXr
         aPbt+3Xx9tG5TvOQVfsDY4XVLfiK80nbEgxIuprhJIsdh4OrfDAmpODTj++/D4G/1401
         Qnu4UknHFGw66MrzzqzwKEC/mm9eJMKa5qo+wh91Socq4evhz40XRMFe3ULdMvILBF6n
         zmJeXrpLHs0rXn4OiTYeRUO8lY+mwklRFN5ZCYOPkKbfoNWiC1WmSzDSam3w+v1EnhQc
         D8gg==
X-Forwarded-Encrypted: i=1; AJvYcCU5gXNqq9F98GvvQWZFYvNiLs+R68D8iTUxYNPVxHaqknHGl9Z4elJLazUjuRk/xf3wByfawjnoFHuuOz2kjgXmGw==@lists.infradead.org, AJvYcCVTknpWRBHyv0fO+muWKbDw2elGB7W/LyHiMjcyi4V5l1SwI2F+DiXN1tKfbyoNKjdpgRviI3Q3euy1DwsV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ckJKuE/W22yy1xOeNzcHYVz59FVIRJzZozicoac6aVCNSj/I
	KKl5JEHQrKSqfE5sA2i3VFG3i+GUHApnaTGQI88H/qudiAZZCjs84kJHIn9kgA==
X-Gm-Gg: ASbGncv5L11oLxFwNNNJ18weM3h8rHwn8ifYKWWSs91xBaYHBnlNq/UfYDKkKV6r5Kc
	qgqslDnNuoLP7PLf4K9bwuxRNDOqtx9NYWafns26zZ2V/wQtD/4d58V/vx5Rh3FNr+DcuGq9aPF
	ISvArqzJh0Isq0VQCsPUFxyUlcj4Q0JjEzYzdRpfJI9utMUV1YtKWFpVG7XTCnhpWuPba+Dq/0X
	ianz4zVwEV6zaSLOlqwm4G9kq5bMPr4qb6+oE0wvz69J1uyTt8sIQhHujyLIS+55iy+q63xL5E/
	RVzM3BjVD6lgz/oEk1bYlHecWcpFZDKrEPqRxVmRM8NJJcGc8gfi6tmctimUFBVwJQkSM0+02pt
	YFn9Hr8eaqQDchgjaJ4mGC9++kuJHGLw=
X-Google-Smtp-Source: AGHT+IFQen2mf5QG/q6Ic53cG1cbjqTJcglHGfWctLC+WYLJqugGhRSQG6HHJOMsIWHguIzFn2k88g==
X-Received: by 2002:a05:6a00:21c9:b0:771:e179:343a with SMTP id d2e1a72fcca58-7723e3386afmr32227880b3a.17.1757073524442;
        Fri, 05 Sep 2025 04:58:44 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:58:43 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 00/11] Add cache information to Amlogic SoC
Date: Fri,  5 Sep 2025 17:27:31 +0530
Message-ID: <20250905115836.7549-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045845_423021_087FB302 
X-CRM114-Status: GOOD (  10.51  )
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

Most publicly available Amlogic datasheets mention that the CPU employs
a architecture, quad-core ARM Cortex-A53 and ARM Cortex A55 and
Cortex-A73 and Cortex-A53 cluster, sharing a unified L2 cache to enhance
overall system performance.

However, these documents typically omit details regarding the sizes of the
L1 data cache, L1 instruction cache, and L2 cache.

The patches in question align with the cache specifications provided by
ARM TRM for the respective CPU cores.

ARM Cortex-A53
L1: 32KB instruction + 32KB data cache
L2: Unified 512KB cache
L1 cache details, L2 cache details

[1] https://developer.arm.com/documentation/ddi0500/j/Level-1-Memory-System/About-the-L1-memory-system?lang=en
[2] https://developer.arm.com/documentation/ddi0500/j/Level-2-Memory-System/About-the-L2-memory-system?lang=en

ARM Cortex-A55
Cache sizes are implementation-dependent; refer to ARM documentation for configuration options.

[3] https://developer.arm.com/documentation/100442/0200/Functional-description/Introduction-to-the-Cortex-A55-core/Implementation-options

ARM Cortex-A73 (as used in Amlogic S922X and T7)
L1: Configurable, typically 64KB instruction + 64KB data
L2: Unified cache, configurable up to 1MB or more
L2 cache details,
4× Cortex-A73 cores (up to 1.8GHz) with 1MB shared L2 cache
2× Cortex-A53 cores with 256KB shared L2 cache

[4] https://developer.arm.com/documentation/100048/0100/level-1-memory-system/about-the-l1-memory-system?lang=enL2
[5] https://developer.arm.com/documentation/100048/0100/level-2-memory-system/about-the-l2-memory-system?lang=en
[6] https://androidpctv.com/comparative-amlogic-s922x/

Changes:
v3: Drop the commit message as per Krzysztof feedback.
v2: Modified the commit message and added cache information few more SoC.
v1: https://lists.infradead.org/pipermail/linux-arm-kernel/2024-February/901497.html

Thanks
-Anand

Anand Moon (11):
  arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL
    SoC
  arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
  arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
  arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
  arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
  arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC

 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 37 +++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 23 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 36 ++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 74 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 15 +++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 21 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 27 ++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 62 +++++++++++++++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 27 ++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi  | 24 +++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi  | 27 ++++++++
 11 files changed, 366 insertions(+), 7 deletions(-)


base-commit: d69eb204c255c35abd9e8cb621484e8074c75eaa
-- 
2.50.1


