Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39797606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VavzJxPh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvkMsLEp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=; b=VavzJxPh2mlkwV8KqivyKA5xl8
	2JrMypRDfY4njw7CWs3OMQBzfDcflU/kFy+cKai8hyIp3DzHz/a8f4/TVe4FAwN14Hoo+BHR+WZKW
	BBcnkT0kjFRA0QHlQQF+CJeANOTgWDRkreBu8ofbvWn0dbxLnXjbTVq99lsQm5Ouu/EU2pWFAkPsK
	+RVncskJsqW7HSy7JHgz008XqQoPm2DY221zMUlqBtJIMtLVW4IGGNjXLOjM4NiIdoB7pBnJaFYat
	oQxK3KmYKFxZt9xJQcp4QLplbQqvisLXZHkXo1UL1pfYkFmCGIrvUo1NT0rSUIzM/THHcjqtrGS94
	w4M6g5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLokC-00000005n4h-0f9j;
	Tue, 27 Oct 2026 21:30:08 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLok8-00000005n3L-3L70
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:30:06 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-170135e43c7so428301c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136602; x=1793741402; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=;
        b=tvkMsLEp+SexWhzGW5/Pf+AsgA/Vis+JX+2tO8V06cNTDFuT04wLrUUiW2bfWQczGI
         wd2CNIwEqpKDnYAAjRdZr3pqGghHk90twG8eyNcAu5Wbmq+xq82YamPuIeK6n3V93bZx
         yBZInyRxtr60bqHonJa4RADXOKKaZY+WcvN5gI69n9zDSG1pSD6Pvt7YEqkCeP5H4w1m
         LO4A4DLMH/bje8l362VG2x+zJFpqFILWvizSRDuG1yz7h9b6yC1au7zMwQ7k8tatpwRW
         yoCZIGQRwNyTqtpmvre5B3/dYL0QgabQn6GyxNCryPhALehlqj0P+WYzgSgton317VHl
         vZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136602; x=1793741402;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=;
        b=sR4Fys8LogwjJa6BfvXYrfpJ09WPHQ/AXmLSJPGj2Bn2olB60ZlzEAl6zKXcdGKIi8
         p90Jlz9UOCMdgKJIfjBo9Ms+OY/03nPUqQ1ZAcefrRQofciKD0gvHAMGacHBf9Jasf0p
         q3C9VMQzfbzAjLWeC3K+skSL5Tg7LaouudFE5npg6BBHrUIRZKXNKzYBRn3WV4FLlqqm
         GAKw2gzlfYH0wsY18VABAZrgHh4QK98LLgcPIHuU77ELTq8qR8m/nmSZfJLBMpfbedWI
         Med07iDi2h6DR7LUI8Vg9YZtGJz1wM3Wo0cf1yZF+zc0bo9aQxrLu5IL/nNW7Wc0c0zX
         PWqg==
X-Forwarded-Encrypted: i=1; AKwUvBxM1NR4l+IuFn/qp04sMfgkNeJYc8stkps+9a86T6ztvgpn6QBShdSrzhXTuBhSF4zpPkkAmfZ2+hbu4Qk0miIv@lists.infradead.org
X-Gm-Message-State: AFq9FYLR2k+eJpis/GhLS0JPHnb7jlpO/swZmFecFZf8S0mHSp/MduAj
	BdhxDEdPAI15b1k6g03PnDwpbH4hSLxFamm+raNmIwGqj5KXYCPKRpEGDEIB9Q==
X-Gm-Gg: AYBFou1SRoVC10ed4uRseOFCbhyTweWEMJurwkRtOuwOpJI8MINSsTNOjudnT4bd3ZU
	5HKyfty73KAH8x5WlMeYSfo8D0B20wv3M9EZI1jz88SbxwsYhTBe9die+I88S/7vZtkf0aI6Ztr
	ksF8n76ZCkdcNOv6UFllfAGG7Ojjv2iktI3CNUbLGqMn5PhTdNVBrwgyBx9fGC6IeY5jBuhyQmo
	313mgj42Mi1mNHLHS4PE/Lp5N2/QuMjKYuPzcRlO27lQynL2howj8ti/d/gDRGICxi/tIjDVxTi
	YBv43V41qG0iHxCHq/idSR85tZktoZhKcu4gw9Kr7QFT/itbSZKIe3M5/uWuwdsoPXz7QyqKRtT
	bc4lVAuBtOlMIcc59F1LVkAMovFIOB5lj+WuOZwzsGTXnJeiGWKYbB5Lp38oGQBrEIzSNDDvyf5
	9ctkOsQunGpB54VXD2ITm5yOKir0Ifmsr8D5qz0ZZ/Tzz4sNSAP3cYdUJ49F6rHVrkQEI+czH+T
	UPa+sx3DRT19kEkhbURbzHTRUriX4Smzv46wyqDyZrim3gyqAIlnz0p+uCUXDk95zc4k3RUoYNC
	TUIN508giD9t5O/6y2NvyZvSTg0BRl0YHHB0Hg7UGKzM
X-Received: by 2002:a05:7022:ea8b:b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1a6ce2fec4amr557384c88.31.1793136602060;
        Tue, 27 Oct 2026 14:30:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ARM: s3c: crag6410-module: software node conversion
 and cleanups
Date: Tue, 27 Oct 2026 14:29:54 -0700
Message-Id: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIX4WoC/yXMwQrCMBCE4Vcpe3YhiSWoryIe0mSsK5pI1mqh9
 N2NepjDd5h/IUUVKB26hSpeolJyg910FC8hj2BJzeSM87aNYw2j763he0nTDazvXBI4IO53g3f
 bYCy186PiLPMvfDz9rdNwRXx+a7SuH5Phj4B6AAAA
X-Change-ID: 20261026-crag6410-module-swnode-aec98b623a01
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_143004_847021_3789B5C8 
X-CRM114-Status: GOOD (  10.08  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Convert extension module definitions for the Samsung S3C6410 Cragganmore
board to use software nodes and property entries instead of GPIO lookup
tables. This also fixes GPIO chip label errors, corrects the WM5102 LDO
enable GPIO lookup name, and drops the custom WM8958 device name that
broke regulator supply matching.

Additionally, remove the unused CODEC_GPIO_BASE definition and switch
codec platform data to dynamic GPIO base allocation, drop the empty
wm0010 platform data, and configure the S3C_EINT(4) falling edge trigger
type for wm0010 in board setup code in preparation for dropping
platform data in the codec driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      ARM: s3c: crag6410-module: convert GPIO lookup tables to property entries
      ARM: s3c: crag6410: drop unused CODEC_GPIO_BASE
      ARM: s3c: crag6410-module: drop empty wm0010 platform data
      ARM: s3c: crag6410-module: configure wm0010 interrupt trigger type

 arch/arm/mach-s3c/crag6410.h             |   1 -
 arch/arm/mach-s3c/mach-crag6410-module.c | 202 ++++++++++++++++---------------
 2 files changed, 102 insertions(+), 101 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261026-crag6410-module-swnode-aec98b623a01

Thanks.

-- 
Dmitry


