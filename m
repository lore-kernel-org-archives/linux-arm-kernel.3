Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C3CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8VtcumMQpGWJUhK15pJtoo02/DLnPfbplbsv3dC/LoQ=; b=JnT8oy3irFLrbW
	lkGrqK+BLQj1Pj3TvF8rZZotGnKdcWYaafB5bRoPEhMf53T03txjFq3FLIckGTmIk9qceCwO3OOm4
	DlbhYXEQDHA3eIj3PEbNzOLxh6uaSyn33whnk/NgCINqZDebjpYYkOCbK+ZCuVh3nsJZ+5SFK9N3b
	hXqAEonu9Nc8xM8AYj8MpjPY0t1mbsmtt0R1UGgRCsyK7UgKBUocG8ZqPz5an9mrhxIfUJnDLxyPa
	ToosziI6AlaakS7BfHLiNl18S/vvRc0KbrWHUy0008hmbKEaYMS5yeu8OSiJ8J4RoZNJyeyx39pWR
	5NdEOHuCoGHPSswsPrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToMg-00000003ybU-43JE;
	Mon, 23 Jun 2025 21:06:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjmc-00000003NEn-33tt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:12:35 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-74931666cbcso1539585b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750695154; x=1751299954; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8VtcumMQpGWJUhK15pJtoo02/DLnPfbplbsv3dC/LoQ=;
        b=GMB7riNV+x6nelnrz59qXKmHRV94/A+20nh+szKuM3Q87FP8VSInau5hOvslcNBjkB
         11ffov07NyWDjCg6dnlyp7tuUEO8N6iNOt6OfSr7LPabi3a7iTGZkHQXZYzYTn4agCQJ
         7kuBTcsvgafZq4Y6WIkqQHJiSHDjidk+w7AQAuKlmasstPxP9o13oRW13v+uBu+/FVlE
         OJyv5dDvSvZFSF3Tg4bkNL8K62rUbwwjHUErIFe6CVvsx4p/BipOYASO2c4F5njBJmXX
         8Szhg+/l+I4X8+ZLkGcJo81Dt+IfqFt7xnQXF32FD1DW6PAG+R18DvRwUFIPZEiXtnnA
         SnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695154; x=1751299954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VtcumMQpGWJUhK15pJtoo02/DLnPfbplbsv3dC/LoQ=;
        b=pbISze6dWASDtoyISQRnQzUe9F+9/JGX011g/c6kF+9V1rYjpPhC+n+W01y7BECMsv
         1HZ8ZlUL9FOsmZSnLPd154ohYksKDgiPaFAZuJipdHECp5e4c7WVLj16DaoaY1SZfKuu
         fb8TNLa3yTM+b/QqQZ4Gtj+aJkhyySWBvrAbHViHWpNP7y1YPnYxoHL8oRgV3akzJtQJ
         MybhBfW4jmpyiY97XmsdudDceA10v8wgbBfaEqvDv3uxAFY2hkviSHLhZXlG+okqcRef
         XZSbnu0gDef17mJwVA+gB5m4JskHrmZIxTQnRnHkGPBuC734wEzH68tY794MRYDlbAnO
         YQwQ==
X-Gm-Message-State: AOJu0YzkJ9sNan/0f6eJGwCG00e7m5Q84yixvMu/RLnhbS8Xi6dWl6xI
	bqQUHiXy5J8645tdPzCRNDI8ylzLDG5Vs3EE4EFbULywZuVmgmDhOQUU
X-Gm-Gg: ASbGncvyTZeYNUVRmp6KdRTSmzUmj8Cq9HYUVno3UHvGAQM1Ipc2gNiFX/JihcVfuAO
	pltoNlmzb0PrjOT98r0BDJx752dFbyHcAeHVjognlLwbArywhpDofbaDjzrlTlwGyheui32ep5E
	IhzaMNa1lOFtDv0X6raJLAzeN1F/8iRKyLx/c6E51bOsYia7k1j5IxxH66bq7Qw+cvc53XqlCpp
	DFhHgncAHyWuev9it6aYuXMl9qa3yKYo7ZrZldOe1gCLyckdVT8wVWAWcqNgvuX/WtjqhP5KTe9
	o4CPyNgsCMkAyOTqVdEEjdSxIMjGjDhfDY3rQ7/N0V0Hbev3wKIZPmoMmhiWRQhkZw4UbsI17E2
	qNEtcRs4ug63QX08=
X-Google-Smtp-Source: AGHT+IHW3hfevuEAc7PYQYSetzR7HrPI8vD9FdBDkz+I2rAyNHC54TdMIOOA/EJsqo1/5/SmxuoIvQ==
X-Received: by 2002:a05:6a00:3e17:b0:748:ff39:a0ed with SMTP id d2e1a72fcca58-7490d6a2b0bmr17949578b3a.20.1750695153598;
        Mon, 23 Jun 2025 09:12:33 -0700 (PDT)
Received: from [10.22.1.180] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a467e6dsm9029608b3a.13.2025.06.23.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:12:33 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject: [PATCH 0/2] arm64: dts: ti: k3-am62p|j722s: Add passive trip
 points
Date: Mon, 23 Jun 2025 13:12:25 -0300
Message-Id: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOl8WWgC/x2NQQqDMBQFryJ/7YckxGh7FXGRJk/7oU0kASmId
 29wOYuZOamiCCo9u5MKDqmSUwPddxTePm1giY3JKDMopyd+WT5QoiT2X2d2Djl/JG0cmxzAzo4
 PBKu0mkAtshes8rsH83Jdf+DqMGpwAAAA
X-Change-ID: 20250618-b4-verdin-am62p-cooling-device-6479ec40108e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_091234_775049_C3220608 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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

Enable CPU frequency throttling on AM62P/J722S when an alert temperature
threshold is reached before the critical temperature for shutdown.

Adjust Verdin AM62P thermal threshold accordingly to the SoM
thermal specification.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
João Paulo Gonçalves (2):
      arm64: dts: ti: k3-am62p-j722s: Enable freq throttling on thermal alert
      arm64: dts: ti: k3-am62p-verdin: Adjust temperature trip points

 .../boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi | 51 ++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 24 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi              |  4 ++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  4 ++
 4 files changed, 83 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250618-b4-verdin-am62p-cooling-device-6479ec40108e

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>


