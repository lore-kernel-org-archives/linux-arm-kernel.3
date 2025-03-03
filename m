Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C49DC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qm3QR1l1rz75lcEGPLzMuxgJ74yGB+NJLQmmsI61JAE=; b=aD8xcF/Z5K1an2
	lIT6AnmY78PTNvMqDerNfTS0k49/o/IhLFvPYjCCHAaII39CvAYby+H7M/karLl40VSaw2yAW+e4L
	YhCDCJx43kTgrpKqfhcZ4YWz0uXAn9NoUM1pE9eZHu+3Rw19LxmKOG0CX9OZ4GIJCt68J7PfX/S0Z
	7dWbqwRVvbGqvZzbiwbh+A+d4/rn3E/+MvHbjPRFTV5C917C701B6QPsmz3PcLRJPZDSvCe6/b5cM
	huUe4mKSpMahPwbPudy+8ovUafrovN90xmYp8pfsopQIJQOApOohgRUikeeah9obeflsUO1vbUcsv
	s7lbXT4PS0alcM4IKs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Qd-0000000HZu2-05xc;
	Mon, 03 Mar 2025 08:45:35 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Mu-0000000HZGL-3qLo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:41:46 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30a303a656aso43007661fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991302; x=1741596102; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm3QR1l1rz75lcEGPLzMuxgJ74yGB+NJLQmmsI61JAE=;
        b=xn4vtPUo8V6cSnltdaz5G2Z005A6IGA2FY4okZfk5INkzBUFa1TZck/Bm3p/rDVOPf
         TA7HH9YQQb3RMQFNONK+Q87bcTKEvoa4ZqP56pANm8SIesOMoNSfUkJ1tOm4oK4CWKEX
         1TfbVoeT0kYnQOkIK26SsPfr7eIZqxArkaPzRHstQcEJJ4npBV9z9fJXIbewcKWBDgT0
         Wncgce1gPFDm/zddeozoDzdA5hCQi/U7SOFpIkHmW5fP3CdITkh0a6FCt0AirArk8XuI
         vdPcxCR3+XA3yUZhlJrsyEvRnf7C909sfCS0g58Exx4CP2yBADOut61PF+VIjYMewfcu
         jvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991302; x=1741596102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qm3QR1l1rz75lcEGPLzMuxgJ74yGB+NJLQmmsI61JAE=;
        b=EZm7wdYb/pJ2k37TIRqpInbfGzdDmb6YQWK1s+CS4qy80SGX74l+04vjiZ5Eo6IJN4
         GCoKi6KbFjJjWiC7wtLTA8Ay0uNUo+itwMldtSivLwXXqbrNCER12jQMYUYZb/XnIRcr
         0WNzoe7rykNT6+hDSSw9wVGXPA5GZGJkoGOKb2Mz0DnPTLIq6dOFyUavt9HRFX5b1+Eo
         Dxpbr1Jg40R5F74tWfUisvsqa4zbljdWySdGnCkh6hsDM79nEpln4lT7Xp8rFmCSWVIg
         yz9TDStnPiep7vdGj5D009u96l7zu+SQ2FmWVSttQxpt3uARwZageXigFJjnJcTp7fC7
         Wv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXS26hdDSn7Zj6ohLb7j8wImTLw2gcSzTjxG+2V1Jibv3xK8tojkN3m1aTTzaFre1qDvDn/VgEX0sdqn6/+TIU/@lists.infradead.org
X-Gm-Message-State: AOJu0YyyNTADUDfs+g0/aVqQ25h5bCo3ispmlF2Bp7PLsheoF+8uKeP4
	f35ki78NgIu381THarAzPqHQlT0KE+3x1OwDL6yOKk52m6ONlLziO82yvekWqnw=
X-Gm-Gg: ASbGnctmVBBN3Ybg46CpgzswTmE+plsYi8ZZg1y9fcJSwUYN4i2N3cJ4SYYI1L4/Au9
	Kny3YtOsSAHbi0XS9tHdDlf02aB7WcYKzISJzn8dk3C9rcnvxbZLDptACOsXhH/StryF+8/Z32i
	qif+21MDQCYS2GZ/DjFc0UpzSbC/IxfdmasG1JSGxFhQRDO9BU5OGPOnxYNyykTz3yGCfCQgnx3
	WhOHhURYFLKwQXo11tqndlJXh6hEBqm/aaexfKkZzvh3ESOW5x06XBS9vDxVuMLEk5+w60NWrPq
	wUwKlQseuYvh1CResQdYrLrzsODATA5L07KpnFb1Y4feYUjxm6muzak=
X-Google-Smtp-Source: AGHT+IHn6Tj7glT+a+fHasyXMm+tHoyL5R7gnvFAOlJhkpEYXGi85y3PLUTOtOvNOM+AGZKihutEzA==
X-Received: by 2002:a2e:9f45:0:b0:300:4107:6294 with SMTP id 38308e7fff4ca-30b933139damr42795381fa.35.1740991302342;
        Mon, 03 Mar 2025 00:41:42 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
Date: Mon, 03 Mar 2025 09:41:40 +0100
Message-Id: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERrxWcC/x3MQQqAIBBA0avErBPMIYmuEi1Kx5pFFg5FIN49a
 fkW/2cQSkwCY5Mh0cPCZ6zo2gbcvsSNFPtqMNr0GrVRshxyx02505MTZdFa6lYMZkCo0ZUo8Ps
 Pp7mUD3sEYwRgAAAA
X-Change-ID: 20250302-samsung-codecs-6366e1b3f283
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_004144_968485_DA5279B3 
X-CRM114-Status: UNSURE (   7.91  )
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

This drops unused includes and converts one Samsung
codec to use GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (6):
      ASoC: samsung: bells: Drop unused include
      ASoC: samsung: littlemill: Drop unused include
      ASoC: samsung: lowland: Drop unused include
      ASoC: samsung: speyside: Convert to GPIO descriptor
      ASoC: samsung: tobermory: Drop unused include
      ASoC: samsung: tm2_wm5110: Drop unused include

 sound/soc/samsung/bells.c      |  1 -
 sound/soc/samsung/littlemill.c |  1 -
 sound/soc/samsung/lowland.c    |  1 -
 sound/soc/samsung/speyside.c   | 37 ++++++++++++++++++++++++++++++-------
 sound/soc/samsung/tm2_wm5110.c |  1 -
 sound/soc/samsung/tobermory.c  |  1 -
 6 files changed, 30 insertions(+), 12 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250302-samsung-codecs-6366e1b3f283

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


