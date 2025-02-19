Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9226AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMy2QRY00y3vndpH243tF2GxFmlF6KLV7i/tcsJueKo=; b=tvDYlj5TCiDbKrAJ5vA5zxj6uC
	0QPhQsu5goPUFIRyspu0AD2zJfMNG5SvxvL138CG63V6DLGg0NQ0wpvw9F6RdBlPi94GV/w1Da8T7
	mn4cGk9fvnDW9kAVklNaU9Low10jO5G168w1NsdSfGjLa30RAaurP8qNHho1yJBghlmKsCDn/bMUb
	x9S/h0ZIKd+4FSrcfm+FB1voN/pt6G9bi3jFnXTFtyzDg3VcABNGg63kMAgRCDVfYkppz1pKZmFyU
	bk/Dk37UuvpgfzbfomIAlutfiazw+ozB37Ku1dznj0cIrywty9cxYmwKv1ypdYWjDEHZYsGwFr8+L
	tO3igjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqdO-0000000EsIG-1Qfa;
	Wed, 19 Feb 2025 20:25:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqbt-0000000Erou-36Dl;
	Wed, 19 Feb 2025 20:23:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so1550455e9.1;
        Wed, 19 Feb 2025 12:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739996636; x=1740601436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMy2QRY00y3vndpH243tF2GxFmlF6KLV7i/tcsJueKo=;
        b=ciZHm8yryZAt5/wWL0HA7H3qZZkNVDw7NxxTC3Pki/TnhINEW/k68UbBhrdfItqthP
         ScbTgVCvOpov4RzSauATMsbqw2WUG6l4PPnSyvPh/DzdXFj6STXoimRLUXxZYlMGzNES
         dzkETO9+6OuVL6sqg/MaPUiY8Nrcl32s8iSsTqgxtvJf8I7QAzHvviZLidRBzcVlHr+n
         DuVLNYDa3fVk5b8QacnIlEROHGoxo0bxjvLpA5VmTZhn9f8iEHCA1Jx5/MqYeEhcMrIO
         xJgX0SwMr3c0LrdUz1+mzmKCZ8/g25QN3a/+RSrMtYWXX5j4MsM8U86Vekf4qej2bmQD
         G+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739996636; x=1740601436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMy2QRY00y3vndpH243tF2GxFmlF6KLV7i/tcsJueKo=;
        b=lpI6yLwOA6trWj9JpBC0mTrRjGL44FF6Pupmd4b466XZAht0yaPtYdXTUyYMHHUEF0
         FomHrEfDh9H8IODyiVVFyFpsZAZd3bVKgj+6/u3JE0/MA3c/kQu8+c9EQCNGTpiZ1Iw2
         CuWtnQyMqlGUMFee4xDycfYmTJPEVd54jw2F67+YPClE4/PwEgDvQffSPmPzxZC2fjDx
         UNEcJ9Cgmjbhkbcj0g9gy3MllhvkaK3cZCyEK3cH/pOunROBEVTbqQRVTVqUzV5tfpJ0
         ZekYflpqvqBUFWtWRHeqBPp+NVvVF7boX1FOErFthvLU0XwLfFvn6V2V4wJxV7JtLvXC
         cmgA==
X-Forwarded-Encrypted: i=1; AJvYcCVr3n/sbRPrDtZN60sBuv22vRIBeDF2Co9J6IA+fVauxgXTVTWMTcNZvUFqsMZO7ZvH+WShHZQvFP76GSM=@lists.infradead.org, AJvYcCWulIkYBa631jc1cuxhvHwlEVD2wJY47XyJF0ktWZs3RDEuGXO4WR/X2pBjAZyOzpypqeq3bgrlrOq6@lists.infradead.org, AJvYcCXNVOhX4v4Yj4D/jsISmWUg8I8m/dLq1aTsSZhnPXXcNe62TQq425YT6W3/v1u3no4vJi305PnDb21IrkZisnWq@lists.infradead.org
X-Gm-Message-State: AOJu0YzqPaFtDjgMyavmnwCYzJD8SffyVRoH0OhzdjBJwwdfZ6G5kJJg
	chAYk2ZI7qUK3j42dzUa8Op+90WRXumAGuWt75+pBAYiO7P+zGHf
X-Gm-Gg: ASbGncsXrw9SRnKLZ4/nD6eaRcU3LOjsfGbH0LggR3DmmytfYXhZBh8Ha6fyPDzvolR
	XMP03Ok+DW3Xlf0xjoJLYPJwYKKiIUE9ZDHVGVr2cPguZhX45vQn1EmGnJocFocr3DWapKyvioi
	vEqDuWLQEonkkx2JF1jWsCxnLMzB4APwnB6adThMEXNuOxwdBCAZydZMtsPtyPVg/SL/+5dh9Fb
	zCU1cUqyaiuu3TtP8fWDxiIWxTu2azSD4qDtEsbarPvBr/bdZwew8GaUfHwR0wGXRh9WNv15jQQ
	5Muc+nPRJxoG32ko0hu975BESoEkOQ02VKlebvz0c6QEHzJ5JEhHB3AplA/a7JUKIO8=
X-Google-Smtp-Source: AGHT+IG4f59+CX698iufYSZmg97ar++Vk4BBVCCuVRmsKRvyGyXLNfOF7rWePEa5eNVo3mM8fixzrA==
X-Received: by 2002:a05:600c:3c9d:b0:439:5a37:815c with SMTP id 5b1f17b1804b1-4396e74257cmr166567915e9.20.1739996636120;
        Wed, 19 Feb 2025 12:23:56 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b84bcsm230088425e9.40.2025.02.19.12.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 12:23:55 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Andras Szemzo <szemzo.andras@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 06/10] pmdomain: sunxi: add V853 ppu support
Date: Wed, 19 Feb 2025 21:23:53 +0100
Message-ID: <17060368.geO5KgaWL5@jernej-laptop>
In-Reply-To: <20250205125225.1152849-7-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-7-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_122357_774416_D3C562E4 
X-CRM114-Status: UNSURE (   7.05  )
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

Dne sreda, 5. februar 2025 ob 13:52:21 Srednjeevropski standardni =C4=8Das =
je Andras Szemzo napisal(a):
> V853 has a similar ppu like Allwinner D1, add compatible and the availabl=
e pd names.
>=20
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



