Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1F8D49208
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TAawXV2Pa4jygEr1LKjVR7SSwvft3mACK3InAoqSWHI=; b=ziFLpciLvJt3oQ
	53PjkuTTOMQiL0Pocb3LcyqEdy65VmIA+Do8pxbhGIRamobWhUpHgUJ+HOiVuSCU75Wq9tQJe7GSh
	jSyUKVfMFWcc1TGrpVRTa02f/pkfK0os11kCS09mDUGET+5UhK9yLAcEIrxjudLOGwEDeOspbS9x/
	e42FuIyBQCmeA1RBNZ8BnYSgVlmEQstkREXmusC2P2BS1cGLac6Ui0K37pBjYSLbViDfYx5B19zEZ
	xJDwTgJcdv32psiEyBJl0x+EEmnix6ySnAs4vHO5/+VTBi0wSs5QXqn0DDRSGDVpX77MC/qBrZy2x
	n36ZwMDmFFuS6F1lC7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyjd-000000091sP-1alA;
	Mon, 18 Nov 2024 10:11:57 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyhm-000000091No-23MU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:10:04 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9e44654ae3so483200266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924600; x=1732529400; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TAawXV2Pa4jygEr1LKjVR7SSwvft3mACK3InAoqSWHI=;
        b=WkCyi6GaFaQvELMSlI2g9F5imWn76fP9DIPcQvdyURh5COJtOimEiltniEYEIDP4XR
         zBt3Es5aNERDDE4t9st+9ubj+OYH4m4Q3w/+WOc1Uc2I9MonqEyAC6q4Y8LnIzt4txVo
         sJHRRzPk0aXdW+fAnUDyPawdR4DiFuqywReiPW/jmQn6pWYtgUOgJY1EqCUDJbYRaMy2
         SfPRkPP7FOFEhUE85pgv4TVOfzDJWXFi8T/zJO9q7YwON51eB5vY/5+U39inSqINUAwt
         x0iMudkYYZ+ZfqwSKSWBdjato3nXSHG/CZdbLvmcwPYjXbgF33RZX4nu1ywyjkT/m9lo
         VR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924600; x=1732529400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAawXV2Pa4jygEr1LKjVR7SSwvft3mACK3InAoqSWHI=;
        b=xIaYPdKq+Y5LUbhgUG/Dnxkv5Ga2irf0dJ1K+lLoUtyf7slwipwzRy3eJEy4txdn+v
         Yh6Rd2lXXXNB4acEWSvt2xOT4sucJBP56+ivlLS6ScPA2WH2CzG5kP7d0EVndyENzJz9
         gtnVCCyWMdkcPfctY12Xg9+CVrCWV8QklxF0T4KGPD5g247TrCGbw6qVT789Im3sf69/
         u8B113vC7QumBpxCnTkkev+mIcrw1tjBMNhodbPYAFRWwLgS+c0gJoTDt2uEMwppEAgJ
         mTD45yFQFAl+2WDKbw3jj0B2kSyZyp3gdMbmLRXCK6fPygOFedBLbF7HXjRi91bUbIXW
         Txag==
X-Forwarded-Encrypted: i=1; AJvYcCVb1q5dKxzhZM/PtOHIx3bm0+jlnnQm4SL5dgDppd+zM09YRIeSL8+L5lIvc6Dvz0MkcQdaqG+a3lFLCIvOu189@lists.infradead.org
X-Gm-Message-State: AOJu0YwHJAIWz58oKKFG5gv8hEnS/Op54tu8JECseevWxrgPDCKzrrLs
	mhA8ZEl+5/HPhWDUN8Z2AG32VHtoqqwUJg2FJUjlz8zJRZVSPUm7
X-Google-Smtp-Source: AGHT+IEV887fK4x/zoQ5oGZPDlKSshxiegqGbDkMZtPnNY8t6w/dixHiVJbN2cH6q6ldqdSmIyhyEw==
X-Received: by 2002:a17:906:dc8f:b0:a9a:3e33:8d9e with SMTP id a640c23a62f3a-aa48344ea5dmr1000913666b.28.1731924599829;
        Mon, 18 Nov 2024 02:09:59 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa20e046932sm518546366b.170.2024.11.18.02.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:09:59 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v3 0/2] power: supply: max17042: cleanup and more features
Date: Mon, 18 Nov 2024 13:09:52 +0300
Message-Id: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHESO2cC/1WOywqDMBBFf0Vm3ZRJjEa76n+ULhI70UB9kJRgE
 f+9USjo8lw4h7tAIO8owC1bwFN0wY1DgvySQdPpoSXmXolBoJCcY8WMZL2euUIpWJ1jaRtVaKs
 JkjF5sm7ea49n4s6Fz+i/ezzybf136lMncoasJmFQUSFJlfe21+59bcYetk4UR/f8IYrkWiwqq
 zQvjTZHd13XH+7E4pfiAAAA
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924598; l=1807;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=OL7qRLSxG0s/rBjQDcTGXS3wtyvq3ca7DYri+vMk6u4=;
 b=7jEvmdQJh8PUUcsHhePFwT0jY9Q7oH7hRJfOSJ5ZhmxOfSk4LVTGVseM/tab168KyDJjGuEed
 k65kLp7lcysAceAGTYo5Hq9iJlKoLIzaeBx9AQ5SHr4LoG3fom71zkS
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_021002_537781_EBAD70BA 
X-CRM114-Status: GOOD (  10.89  )
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

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Shared-irq
handles that case by requesting irq as shared.

Maxim PMICs may include fuel gauge with additional features, which is
out of single Linux power supply driver scope.

For example, in max77705 PMIC fuelgauge has additional registers,
like IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input
current, system voltage and current respectively. Those measurements
cannot be bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD
sub device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Make max17042 interrupt shared, and add platform driver
version.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v3:
- pass dev pointer to probe
- Link to v2: https://lore.kernel.org/r/20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com

Changes in v2:
- drop NACKed commits
- make shared interrupts unconditionally
- rework descriptions
- add platform driver version
- Link to v1: https://lore.kernel.org/r/20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com

---
Dzmitry Sankouski (2):
      power: supply: max17042: make interrupt shared
      power: supply: max17042: add platform driver variant

 drivers/power/supply/max17042_battery.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 91 insertions(+), 32 deletions(-)
---
base-commit: ae58226b89ac0cffa05ba7357733776542e40216
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


