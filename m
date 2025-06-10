Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E49EC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=; b=HaH1XJfI4nPLt3er+2CcUxxCIj
	V7aHhCvixLlvuYj2sWh0pq3G3BDJkZv45UHUu5pYKYL5HE9nB234iq/8CXnrCi+PReGMQCuPOdGIn
	wDl8H2lY7f9UlpLaIuaeL89YEig8es3LlhjAxUcFak+xOqRc22XixO771lP8BE1WmsRCwv/NBkNS1
	BQ34fHg+UtnYb58XqWybQWSmuvvqC3HUJphKknXo83E33AJKEALsLZEi/D4LfOLyPJEqMvxJ3YrDA
	hse3yfBV+g20C/1qSLig7U6Qf2DaKUYCkX1MVAHPAJZ5IS6HCA3BZ/8x4pNikVMq5+BAWq4jqenc4
	ke/2yY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nG-00000008II5-2Rex;
	Tue, 10 Jun 2025 22:50:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Kz-000000080kV-29jJ;
	Tue, 10 Jun 2025 20:12:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so52487165e9.3;
        Tue, 10 Jun 2025 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586368; x=1750191168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=ZQl5bZQRkEYQJFf4oDsGBArdR7LdtJERe4HBxK1/u3FaAZ6IhfzeXuk9Ni9zW3+IxW
         56ih68CTmz9AgqN2YzIUMZkwVWH9JGkUr86Zf1HeBBoC00HfVq7iKia+WTYfexwqm2nw
         6mReluafBqgYZgeyzQQAnJCeNaycE9JhaiyHG6YpmUYh0ep0JNmgxXTIyjQGjojvbkV8
         AbnDFgFHRSxZiWRzd0y+zhjljDTIOa+2z/+McIZsN8I0PhmVjAef44jwc68tSq4F3nV0
         Kxj3JL6leYuHQy8kv8Zl8D9DVgqhaCHNSMXInRmbRaPSdWeKYJibP9cpvePofMqIosnq
         wRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586368; x=1750191168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=r1dygFuHLHHW0cgwiA+mT6fVYo8QH09cWk+UInB3jIjmkqJQsIcK2jiA+AH/LHuTQc
         qvtXRwH6jucTHhJSfLX+yuMJcilzw/M3qbjRC2IFyLl+0oE2D/xqyivtB4NowHAuvZOo
         0le5u2M5GT/cUNfq36NOTqEj1basnT9DV3F7aZ5R8GT6/cGnU6SlIOiqklqQrBtujXIQ
         DtlFz1ml4ourqZa9XU2GytUVFyusS3/48OmPaj7gywkmzvK+fvPSuvLQ+bguN3tSUf1z
         /hwE6Z5IyzHqURnxGIa/J4v/9yWhZb3vvsCoX/8my9DMjvwTD17uctPM2EzoJfJaLnP1
         xSdw==
X-Forwarded-Encrypted: i=1; AJvYcCXOola479dswkhGKdVC+Jf7qOGUN3T/a6+Fcwj97Qae6cwSuoH/e2QJFGpIsdAEFsDnP6YXk9JFM26RRhgWOUyu@lists.infradead.org, AJvYcCXW2CuaTBX2KufQeL+BKQfYmNJ34z2DKhaMEHVxJZ5jKPRtSxW8fEZNE1yXRJaeADFj6cI6+/7DGbio5lk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCEgxC/xIwQu91fpQq53WPgzLLcR3cU2lq0v8p1s0DNts6Gbqo
	NzOwqUlySHNHpCo6EOfzQmRUUIkdI4rN0L/5Y5sLAdriC+DOMjaXdIcE
X-Gm-Gg: ASbGncsATxatrp06qdr6TfpP1rJt7EeNnZ1XL3Pf95Bsuv7d64sQ9M28E9kKJJM6l0W
	Yyd0YgV0yIHuxbkQKoyMUxtLQjiFYSa+S8HInQoo2bq9qnETAqOCpqEHkMlU/4R6O1gI77MK98b
	30xFGT9JPIbvU2eD7dgsWDr7YkjlKJP2fh1fYWFH2/sw5cgY4fd79c35meeUfzudrkOZN1KYd+O
	yAaKTV6QXKCoeEAaYzVV3eS3mOUuFjWmds5sZJzNkUGnahVbGwpklVHyLbFG1vvR+LPF68YLgWD
	9YvndSZ05UbpQ3mCaWjqXqpY3LfL5LhUTGOSfwL75CPMzZwaChXs2Dv7doQG2rL/GKB3StL0O8Q
	=
X-Google-Smtp-Source: AGHT+IGXmvAFjqs4pjoEAShXCvFmqNbo5KEX4EdMZLZduwvdNUPzMRl0S8PE3/LwGX0j1lxRKthagQ==
X-Received: by 2002:a05:6000:288c:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3a558a4277cmr315642f8f.54.1749586367885;
        Tue, 10 Jun 2025 13:12:47 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:47 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Tue, 10 Jun 2025 22:12:18 +0200
Message-ID: <20250610201241.730983-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131249_552230_7F9F0BF1 
X-CRM114-Status: UNSURE (   9.34  )
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

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..8c23aa111e94 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.49.0


