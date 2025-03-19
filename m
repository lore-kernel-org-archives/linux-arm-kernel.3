Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE94C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f0q7E5tM1S5F77jiBwtkLZDXXcMdao0HW+6E1Vs/98A=; b=SXDjvUMCPdi+GV
	Sol8azthUpq3eILmsLjZPUskOzy+bfLay6x0IpGMcXUxD0MRBkagi7wpHSSZkMjuzhP62GEbwbpMy
	pC0S8HL8weMHiA3X2ZOE7pnzlQUKKbJ8tCD5Tz/0JNf07YxtjFfso90AwI4PcY6qhFSb+EUXBk5ne
	thruOPBUuhMdHOr3J/zRFVl2aDrAPjLO+CiJMkblhG7UWbu0EYJ6jsIn4UIk1OTR6opf0K7qrQOC0
	Wc2/7QfM7e10xHUolWy3blebl5YieEWJ7yfgIcsVux7a/FGPwm/HN8V8fvxe+zIWq5jpbQsCevzqC
	uGYgat2nurLgMAfyY4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tumA0-000000084js-2fKx;
	Wed, 19 Mar 2025 05:40:12 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tum8I-000000084ZV-2szp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:38:28 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so12025859a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742362705; x=1742967505; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0q7E5tM1S5F77jiBwtkLZDXXcMdao0HW+6E1Vs/98A=;
        b=sixWI71nwLCx0K8s8IN8jfABmKlKrGH4uE+Mfc+Qp7wics6/i3lmtGkk3/S1xs3RM+
         tjTKtGnYdlGj7pBT6sHr+78i6dsHYQI943jJCvwbWCqOng1pqEK66Raznt3nfCAhjkyQ
         JeZfjUBykMibeL33Foea1Hqwc3aTTe3RcYjYulUJWcsmzlrki6iBD99xmORlNXd89THR
         aMTsNeE441nM38vuAi06uydondpBD1J6N/lV2C2S29OfPWh1YgDw9yXUVE2GKZr2/nc7
         ebTnqkO6VjWdZhSRMnbWh99cCiHwSRsoyyQ5sk6dfbZ0fXXxllvM5L5GzH12PkcM+ILx
         TkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742362705; x=1742967505;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0q7E5tM1S5F77jiBwtkLZDXXcMdao0HW+6E1Vs/98A=;
        b=LxzSexK0HbX4orQeD9Cph5kLnxz5X1LSODhEKNNEmhAxgh8K0AD1AFfzH3gDpkdjvL
         ++pm+7WEqlvpe+AB2uIaZOh4tyCtN4fQN5wNeO2Low8HJEJikRffkcShKEtwnnkRlf6k
         G/254tq7rV5OUzgKxVoeaJr4iy4bqUB9T1qlFwCenz0//0zjSfts2p3xagfmPVK2+ec+
         OslrzeiR1gCz8nqSbyQuHx8CnRP3tozZC52QPO6RXGOzcqCwrmMpZeR+Ha9iQzW02e/B
         03C5XXLPp1y0qdsRA/VE47/iM1/B1pA5ShWaLlnLklPpnmC1xSiSmoJzXmuUQrp+QakC
         O6yA==
X-Forwarded-Encrypted: i=1; AJvYcCU0ayPgQiREbQH1AcKIf7Yd0KZNW3LW2zFYt9/U8mI2d1VIzGmNoWxmllxFv2DD7weEnI1jn6dWUi6cA/zTU28t@lists.infradead.org
X-Gm-Message-State: AOJu0Yze77sUpDFhIgUrspzHzh61eYvSVfcrkDCALl8Ak3BmtJx9txGS
	nIV0vYEx5XSUDv4FZqxnfQlNet2ZB0WOU7DyJ26x+lyBeYEsiNlGa0G7QURL+7o=
X-Gm-Gg: ASbGncsCxg6TnYjIkKz+PZTHITz/Pynh59YwvJ8SwbbsKFOPMv8uRc3jHT9fSGM+mXS
	owRNNTwJ92tPrZNQ3HC+bg+IaFGEivVpwko3CWVIXo60ppHcz+F+CSvplPuXPTlaXcDOMkBVxcB
	J9a7weJHX9xo/eb9MzwsY16hsPw+H/LCNL5W9BOT/vffeWYQiQSnyJxYX3ycHrcsfkRoWo2f+ho
	XW9dVTWeCI7KD5W2qf+RFJFst2z0PEl5p8/gi2j1pgVxc0zais8K1CQrhVoAVLGiNk5ncOlkj8w
	04s5ASwzwiDTp8I4jWDc4D8H5bzKfOYgmlMTUnDtPMXyT386qVnQZhgKVjhBvmvWq1oy8HH4yE1
	ATbvjbim169WNUh8+NzGXTXTXLeRF
X-Google-Smtp-Source: AGHT+IETxQF0HlkGWOHJrycNWdW/ghv4ToDaVOtd9+KfaAEsUmmTturYaUcuKAjEXphuaG6v07nawQ==
X-Received: by 2002:a05:6402:26d0:b0:5e5:e032:e820 with SMTP id 4fb4d7f45d1cf-5eb80cde046mr1054827a12.12.1742362704825;
        Tue, 18 Mar 2025 22:38:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e6d4sm8511817a12.9.2025.03.18.22.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 22:38:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] firmware: exynos-acpm: read fix & reduce log
 verbosity
Date: Wed, 19 Mar 2025 05:38:22 +0000
Message-Id: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE5Y2mcC/22MTQ7CIBBGr9LMWgwFKsSV9zBdIE7bSRSawRBNw
 93Frl2+7+dtkJEJM5y7DRgLZUqxgTp0EBYfZxR0bwxKqkHq3ggf1qeY6I1ZaOOCHJyxJ2+hHVb
 GvWj769h4ofxK/Nndpf+lfzWlF1L4m9TBO7RKT5cHRc/pmHiGsdb6BWOSCgOlAAAA
X-Change-ID: 20250314-acpm-fixes-348c058476a7
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_223826_731742_BD6F6C4E 
X-CRM114-Status: GOOD (  10.02  )
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

While trying to use the ACPM driver, I stubmbled across two issues:

    * acpm_pmic_bulk_read() doesn't return the correct register values
    * superfluous log messages during boot

The patches attached are the result and hopefully self-explanatory.

This driver only exists in linux-next at the moment.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- collect Rb tag for 1st patch in series
- also drop message from of_find_device_by_node() and simplify related
  of_node_put() (Tudor)
- drop patch 3 from original series, as not useful at this stage
  (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org

---
André Draszik (2):
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot

 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 drivers/firmware/samsung/exynos-acpm.c      | 11 ++---------
 2 files changed, 10 insertions(+), 17 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250314-acpm-fixes-348c058476a7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


