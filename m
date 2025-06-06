Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28812C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz822FN5H/+n8My5Ek051DCerU7On02pfaR6UCl949I=; b=1ZWJr7WgZ04OM4yJqhxjEzRi2K
	lSZR+kGqDQIRXxcKWH73MQHvwVaarR15mb1GfnZU2/O2LBjXR786SqWOVCln9ULVL52svoJQrae78
	LELtg4LI4lWMw646SBZWJ267Y5hRYopSJ7B4WCiErXNMXzp0IwgolHCOCllfMRr7FN8lMHblk0OwU
	pvJGJA3tqc6HGfiJYQ8ykpXh0PnkPK26hPoHbtfr977eJ+9h4QtezzVUruC/0rkQtdtcZsh4A7Ybo
	taQaC3WvV+t+HkUU9o8PCKltL6yLaVuuvgq02txog5SIk6hHhY/PsuPVhEJiBweV/OrKPL8lmh1tj
	oX6pNKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTBt-0000000HVL5-47Ke;
	Fri, 06 Jun 2025 09:16:45 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT9S-0000000HV0R-2ZZM;
	Fri, 06 Jun 2025 09:14:15 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-acacb8743a7so326168366b.1;
        Fri, 06 Jun 2025 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749201253; x=1749806053; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fz822FN5H/+n8My5Ek051DCerU7On02pfaR6UCl949I=;
        b=b7rKkkqR4L5+AJofpXE3DcvI6OGvqUlcP99SNyueGDngSuvbd0Jju6KbkEw9xH2a8c
         d2QIR+5R3ky+kPDFyRbJCfuhavN4lM0qYrBVOtmdDcMpP6Q4W7XEdNh402OBlK/RLexv
         SsZKwijOC0ImzTvEaTIiV8ejVfxYdcQ0rYBiOsHZsysvTac8RkHd1qr/c2Gmg9EQS5Qq
         Mt21xPkO3kC5bHbu5mNf7VIEKph0pxvzXrj2d1PRglx2EfWR2ZkNRVtrkeaUL8l4CXXo
         9biruTo0s85HU0kVo/THydKwmly23vVmUeRm+OmiPMqlSNA6p8QJkfKfpU9FKZFqhyLo
         l1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201253; x=1749806053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fz822FN5H/+n8My5Ek051DCerU7On02pfaR6UCl949I=;
        b=b3aVX6smfYt7abILxD3oKfIqiSr+gaE5dAJWoAIKgajzAz6MM5d/rj2F6g6OlBBx96
         W0tHEJmY7nsJswh/MHs62Wx+eDZwVUOi9WQjNIBfZIrlESQKUYv+W3uc4WXUpuHXseor
         UzIZlj6msbUmCtAoCHrHo0hYnpfShPHwY/3frpuTgQfJCt8NtFCSR8V7Yz3Ezra2V0Oq
         WiPVdYvi8Q45emY9rjSCsk4zvS8lCLSk+ZC1L8cMmKdM4H+VuSWwMoTbBo5j+fs5+sbu
         dEyG4QjIYoxTswBhBba8cE7RfTRBwtKdr1B8hf4Gbri89GnQ7kAg/JK7Pemqh92C2rM5
         T9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwlZdaWA+dZeBc4Zhe2iXw48QbXWZtO2xo8I9SA9zNWUZXF4SALZT5n2gT37sEsS7N0+iOxZOC2qy11L650/BO@lists.infradead.org, AJvYcCX5mgB7eBgJ7vodFi8A3HLygUcQi6p1M9pGSo7TjFHgunITGxQVYuFjXKd7SdJ9O2qbcCxfV3LJwB7YxNCWWCg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ZL3UDOjTR98/PHLKLON3XpR0mnGuthBvOv9if6LBHXfQT6GA
	SsoFZ90vuNY2n1CpgKBbbysalLHyoiyJLkUXxZejxQB90RolJO+2hyq2ctgzY5q/gJKMvSB3QPr
	mdiRiy9dypkTRrHjK9uJmImorH/GvaXc=
X-Gm-Gg: ASbGnctJB0uxF+swYXo73Q+hA7XEQ7ARx/UgULuniqbS9hyGBPTjHqnvqBI06COsz3m
	KIyLIb0SsBzixn3wTrBSYVsyBroBf9ioZ1r6sR0e74G/X9/EZXY6UBxq6mnyIFxeNMrhPTlYZzw
	kNj10BL5LAbiAcQQ4wxu/VNrQflS4wS75rp2Be9HAGlUY=
X-Google-Smtp-Source: AGHT+IEeX2nFYgTt+0+rebDEi2e2f4O2bF7FhHfmP7KwHgiTlO9eS0XJCmIiwJM3RRdB3UVl7gDAKbNxKQYbrHeSUYg=
X-Received: by 2002:a17:906:9f8c:b0:ad5:a122:c020 with SMTP id
 a640c23a62f3a-ade07634c33mr697878766b.16.1749201252792; Fri, 06 Jun 2025
 02:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250606071709.4738-1-chenqiuji666@gmail.com> <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
In-Reply-To: <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
From: Qiu-ji Chen <chenqiuji666@gmail.com>
Date: Fri, 6 Jun 2025 17:14:00 +0800
X-Gm-Features: AX0GCFsmeBUhD5E-WjTAKSUhstkUhcRejJPPS78zNv2KUGTIKC47m2fIc770YIw
Message-ID: <CANgpojXWk1zvu32bMuGgkVGVNvPw+0NWmSUC62Sbc3WcUXAd3A@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mediatek: Fix a flag reuse error in mtk_cqdma_tx_status()
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, stable@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_021414_649543_689ED5AC 
X-CRM114-Status: UNSURE (   8.95  )
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

> On 6/6/25 10:17, Qiu-ji Chen wrote:
> > Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
> If the first spin_lock_irqsave already saved the irq flags and disabled
> them, would it be meaningful to actually use a simple spin_lock for the
> second lock ? Or rather spin_lock_nested since there is a second nested
> lock taken ?
>
> Eugen
>

Hello Eugen,

Thanks for helpful suggestion. The modification has been submitted in
patch v2 as discussed.

Best regards,
Qiu-ji Chen

