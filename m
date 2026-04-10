Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFB8F44872
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JW107L/IStc303NYPPlArrLCZGog0RXg1/LldkbGac4=; b=x8cP1gpW7g20PqxTWSHcYdn75n
	TJ8gjcmuSTR/BIfJJXXCDs1eEY2Bjc4ACIfOu3aGT4bKslWOVoDFOQ1hRyECpMw4zoTGSHbMnwGwB
	wYYDlvLrw4gGzx99ie/rZhvzQB2yaQCsJh0hoK6tRdggXWs2RWwfWoQrvejdEJWMI5a7vMPMMWy9t
	u5NiN5v1qwJOm2x94Q6V2oZoxQO+g+ztFWWS6kmeHUdVb/R9++VZe/xDgxs8M7XsK5OQonisIMiAb
	10WhXknm6Ie/v+xqkTJqQDvcaxHYra+QQUeipRoLm3ByYucUmon5ZpWlqUo6Toko79L0k0c0M+wju
	CPExvaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVm-0000000CMDr-0C8o;
	Fri, 10 Apr 2026 14:07:06 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVj-0000000CMDA-0TwH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 14:07:04 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488d2079582so17866365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775830021; x=1776434821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JW107L/IStc303NYPPlArrLCZGog0RXg1/LldkbGac4=;
        b=HccBdPf9V7dAMLvhuuFzdG6ogViyZGiFLXpp4kUEpVJvwXvfduM1Pf3sqFSeLQED8I
         MnQKPD3UM/aZew0bqy3pDC7DM3VLBt4StC5+h/Jjoekm4QxjX83k6YYIOGTSJoihUxqy
         0NLtOxaWHr4saP/nwN5XfdxnlJFBvp7K28Ta2C6rOYpJRHjk92uSiPqEe0keqoy2sDvF
         ALFW3sGHRBkYnrXR25Rcs9ZhLShzxzhWR5WwOdnftGIjZdzlOsyqRqBDDPZQsnbv2qe+
         ZNmeeO4vet06muZThN9DkGLxvKj6dfbn+CtO/5Br5h4KT+cOxTNouOdRZJw8qf+umYgr
         dH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830021; x=1776434821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JW107L/IStc303NYPPlArrLCZGog0RXg1/LldkbGac4=;
        b=pcyu8obotJr7iSfZuy5TlPiRtFr/5sOiV7jRxRdEKJCz41gIX38dnxUMZiAntr6WDy
         unQBsPzdzpc2NDsa4Je8Py42y/fz+usDkkxaV5rtZaWl+IM4l3jo/3VQ5DKNmgV/z5tt
         mKRRlGFugxCAFagG+3cI4lXdvDN6Ims/NSq8mSZruHayzGYxL3JqMpakkWC5um54MsMC
         3Ci+RbLp4563eEXk6B8Ri/YajB6aRPG0nQFBkcjE4FX3vrgtlk8/b9RVPMXyRBhJx3bw
         5ooD09LTU1MaNDzVf6kSwkCJ878YeV+W5mk0XsyXMK5tDp9RY5TsDGIdeBj2DA+2sl0n
         ve8g==
X-Forwarded-Encrypted: i=1; AJvYcCUFwCpadvjlGxs/PrMkVMYmpJVUhLZiE9KNzp8L0oSYW3L5CK05otQ4skhdlhB8HxdBo/CaysvyFCvCHnHssj3i@lists.infradead.org
X-Gm-Message-State: AOJu0YzLVIuaH71FCkgA5efHBBkJejBlk7nCLQuEJRBTe3x3DDzsG+6K
	cZd8uP24Nii30IG/64ATGiptd9Ga7K28TdK1X9daylHDM89lUd51Hk4/jafAOwj5x7o=
X-Gm-Gg: AeBDiesVlF1COiVVMIiJMlW6V8ee5jVIWOyRpB+coFO/Ag1vkElncj83EUX+Km+oB7o
	fpuw0GaFPFiKbXMzw2Q0i1Xe2yyo9WkrXkr6sa1hULoz7f+7pcOm6RoPWY1GRIvYoh6dEskBzhS
	HB5Q2dvFpVHVrI3J+XVZ/AW69475UFKnW9zZ0bdkt8dCpEIChOEVhF+Ke2TFxLLqDIwH13ppZLb
	nNYB1TTmMnvopsBD2gXE1pJCV2IFyTjeYfVwktk3Wcmvi8We0fp3d8gaI1D9L6XBrWAH9W4GfVL
	bAkwtz30Uk5wYMeWx0NTFWkefw66irUmjc+jrGF9dr6ea6XEz0iKotnYr3uZJz3qBwlTNHJKGrg
	1iUv0SowdbAv9LRRhoJnb6THc4vrAuX6STZ/FRQ9+bcYg00xALmkQ/koSdro0deF3yy2UlXHVRr
	ogYqeGhPBxRjr8hnd6Q+WUDEDVFbjEW1XAnRvwDjjNdudhn30OEg==
X-Received: by 2002:a05:600d:1:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488d67c720emr38283325e9.3.1775830020792;
        Fri, 10 Apr 2026 07:07:00 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46713sm8549422f8f.21.2026.04.10.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:07:00 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Subject: [PATCH v2 0/3] Add RP1 PWM controller support
Date: Fri, 10 Apr 2026 16:09:56 +0200
Message-ID: <cover.1775829499.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_070703_191775_DBD7587C 
X-CRM114-Status: GOOD (  21.06  )
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

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which is then exported by this driver via
syscon registers. A subsequent patch will add a new device
and driver to read the RPM and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea

CHANGES in V2:

- bindings: added syscon to the description
- bindings: changed additionalProperties to unevaluatedProperties
- dts: reordered pwm node to follow the unit address ordering
- Kconfig/Makefile: renamed config option to PWM_RASPBERRYPI_RP1
- Kconfig: added dependency for syscon/regmap
- driver: added 'Limitations' and 'Datasheet' paragraphs in top comment
- driver: all macros are now prefixed by RP1_PWM_
- driver: implemented waveform callbacks instead of legacy ones
- driver: dropped hwmon device registration for fan speed (this will be
  handled in a separate patch with its own driver reading the value via
  syscon)
- driver: added new regmap/syscon to export the registers.
- driver: added a comment in rp1_pwm_apply_config() to describe what it does
- driver: added a comment to rp1_pwm_request() to define the purpose of the
  last write
- driver: new clk_enabled flag to deal with the clock on suspend/resume path
- driver: clk_rate is now obtained during probe right after exclusive_get()
- driver/Kconfig: module is now static only and has suppress_bind_attr to
  avoid racing with syscon consumer drivers and with syscon unload issue

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |  10 +
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 344 ++++++++++++++++++
 6 files changed, 430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


