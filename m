Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDA2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 19:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TbNRXkcRyF0tlmC6FGx5LqgTK6hjgJWXGfuNeKftOQ0=; b=3DT+w1EEvAXgeM
	8aRKOIyw3tvT78wOyKyPVTCNx7xSyvPnjbso/vp3NZUdTaoR8k6kRpeH9M9OwQUC7MhKYVItz3RL3
	KVaOtXEfg73uI9SE7LEbAvxnMQaPsQnq6kz2lGGRSR9WgmH+x5UmN5k6hI3Mn289uQWX32cgYsqDA
	QGgdDwdXJJOzB8q85NFxaICoYdQkauHr5kP6ZHjCg/gnaWP/CNNlltbFcp9Pm10jkcxbOpzNtzuvU
	AoP0Az9RsKuQPdxGfgwbeBAa6/1j1McwuN1N2i6VQuPhLh6A+JGmARu4THrp3+rl+LWLyJKZUPpYx
	En7D2l6YY4YpJplRpaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZxNo-00000006Jdu-0Gsx;
	Mon, 20 Jan 2025 19:24:24 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZxMW-00000006JSW-4AF9;
	Mon, 20 Jan 2025 19:23:06 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30613037309so48881011fa.3;
        Mon, 20 Jan 2025 11:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737400983; x=1738005783; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TbNRXkcRyF0tlmC6FGx5LqgTK6hjgJWXGfuNeKftOQ0=;
        b=gPm1LrfSpJJ8U0Spn+KGbivewnplbVocvZAhTAa/quwPLKki5+q52pz/kBb9CJHFAE
         lKOYaA8SG1aaV8JAW0QQvisnWBFKzdpK58Rn9ucDKBTVyf3nOMK9WE/T63jKW41CRFU8
         eFycR+bG6GBeq2kWdz2CLEdkIoqblqmPhB7l/++I8sJ7fRW+gSMP1pfhc8UVZMi6UDST
         RGAmAry75WwYDsgERNk2fOGHRpS9tHwWDjKu2fjo3KjuuPSmx82KKemmWSx//C9aJbLa
         l9no8ZLNSI+m1W/81fd4gBdQ6rC1zo9rlEu3GaMkOs3/lJXslsZxLdwQOhdWp4GGBjPw
         pYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737400983; x=1738005783;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbNRXkcRyF0tlmC6FGx5LqgTK6hjgJWXGfuNeKftOQ0=;
        b=jdtNdIO095CY7Oyq8jsbDyzwTmTnwQlduOse+F0dJ0hqIYk48QVyNhgyQ/K4cKo+Fz
         C62519FuL7MMqed6RrI2pFggvWWwRSO0m4OHLk7n3n9M4hWuBLTfJywLF5MkXTBiwBcM
         iUgOjjqw4QTH6iMzUKQVt4Xb5v14mRZKqq4flT5+i2rOxiipTlPbGehFV1CYRMAXM7xN
         XMyP+RXKU/T31UTNgaWGljzdMWcG0zwTApJxCfQO9ivr/mDt5d/p1JOb72gauoIs+Z7T
         kOv/HgoGXMke0ynvr0FzHDGeEKd+USmxDg31v3tqonRYJWp/6R6lvhBfSbj3WawJ7u0N
         1nJw==
X-Forwarded-Encrypted: i=1; AJvYcCV3lvYWw2wSrrQHiUlqDqBFPPbXknxsnPsaDD1zij72Eof0s+qr0vT/DLBnAQt0qbs46JCiTyPu/Rhi18HuWLY=@lists.infradead.org, AJvYcCXohDDoeW0frl+s/hMr82N+UJpWUTztFuOm68x9m9SqcqpGDGI6lbEO04o/yUDpcXE3gCFqwmUORAsGjGpdtq3m@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx4ZKPDpKnRYEXGqZKsh9UZ3bQs3HdShL6TZiqNiYxdPJ2SU9f
	GCDjsUgzSeFdfFLY5FQ71wfrX2uOabpuiphamWmgXnD1A9Styzv8
X-Gm-Gg: ASbGncuD2TmjiwX/ylAuLaTjVVW/42oaZUNLoNrCXYVakoALgXTpX7fkPN3TtUActGT
	PI35xOZRkDhqnn0FXrxh9enLsE4a+YckkgaipOtURa1EeLJpWHRLhXDeSZi9B8aHdWoVA9wjPAy
	9wkcDt3BPhqmzljq+7lRvqBF/uDJ+3Z8vx5yfX7Epd+zR0UV+czDg70avjE1OJaUXn64PAH562a
	ByKsC/RxY/J4Qc+o7/laKokK2MHLMMwVux59TM756uIX40pUOolUB0IUh+c5ZuIwzOoMiY=
X-Google-Smtp-Source: AGHT+IGr49WU9BhdIDFszJomy7IZC0MsVfpvVAJ7VOlKiHTdCZ06Qn8peWJsF+uAk6nP3W4Y1Yz8hg==
X-Received: by 2002:a05:6512:aca:b0:53e:37e4:1457 with SMTP id 2adb3069b0e04-5439c280723mr5124215e87.33.1737400982537;
        Mon, 20 Jan 2025 11:23:02 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78fb0sm1460156e87.247.2025.01.20.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 11:23:00 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Fan updates for Radxa Rock 5C
Date: Mon, 20 Jan 2025 23:22:45 +0400
Message-Id: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIaijmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMD3aL85Gxd02TdtMQ8XUOzFAvTJOPEpKRkcyWgjoKi1LTMCrBp0bG
 1tQAm5U7vXQAAAA==
X-Change-ID: 20250120-rock-5c-fan-16d85b3abbc7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737400976; l=714;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=UQf76tNPeFw670A+FDlUpizi4uK712nfyrh8vXWuH1k=;
 b=TMyVo8vcwj2r4jcUALxh9vVoMsAPW3huM7SQAfS8P1HFA9A0nKAuIvCN78QKCOm9g3y22jqaE
 eNRUxXEEAavBTNWy2VZkXXnPNhtcO7Fa2knTgzHr8o6ubnAbWXHtAq1
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_112305_037646_67C4E753 
X-CRM114-Status: UNSURE (   7.94  )
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

Couple of small additions to the recently added Radxa Rock 5C device tree
to improve cooling control using the onboard PWM fan, similar to other
Radxa boards already in mainline

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (2):
      arm64: dts: rockchip: Add finer-grained PWM states for the fan on Rock 5C
      arm64: dts: rockchip: Enable automatic fan control on Radxa Rock 5C

 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 34 ++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)
---
base-commit: 4ec376748558ba132a2a49513acd3b08774384e3
change-id: 20250120-rock-5c-fan-16d85b3abbc7

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


