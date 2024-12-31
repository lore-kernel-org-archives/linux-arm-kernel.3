Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1885EE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZVwPztK9QcjqX7PyTE/MlNuPOJaLJKW3qg69pSaTS0=; b=ya2vjzggGWngPWlW0yu3Vd4SuN
	E944soWSCN4s6d2GYmcSPbJ+onUKPW8xSZArkXpOHzZqvqz09Wo3cC7V5x8AKfbBOa8YKOKtrehg/
	2GgYzmjZkw/vIkaTsN9zZRuJ31GOUSCVz2cZUiYPV7VAXfLjDYN9F2bNzrqb9lb8Xfm71Gk4x0dr6
	uUHOWsHBi98TTTm5QZMYA9aBHe60sav/ycUxGsQC0x3R+sx373cSB8Hi9CCAYDhYxD8rOJ3Ao1fE+
	RTTU+/wKsUl68h8Kl+ykG8mSilakqr9YbCJ5E/8KZ2PWcOeuQbTh499SuFRxhJAe1tb1Ec2/MrdHo
	vxfBxouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tShlf-00000007dxV-0AOK;
	Tue, 31 Dec 2024 19:19:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tShkQ-00000007djb-2Vgb;
	Tue, 31 Dec 2024 19:17:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so18500508a12.2;
        Tue, 31 Dec 2024 11:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735672664; x=1736277464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZVwPztK9QcjqX7PyTE/MlNuPOJaLJKW3qg69pSaTS0=;
        b=XSr3mw78748ZTI0ojQrWX0312dRFmnrwQBU+ZDZZAyBtgbOOzXWykjJ3LZ9kM1VHy1
         9ZaI9PioGw4uVB7B76ONSUQBl9PSzN0FVxRArsadEb2yTil0S7nIN1RCtMaJHcoIEKBd
         EWDJo7XFzdOH4JTmKHG9EFDwEFqPt90zvKSGshJm2Rk0SOTnHbqc+V9fpYFCsJ3edq3r
         Awg6xwAPiTLf/nHlGybNH54fxENlirXMgjqDVq7yIxtZaoUV4k3hv7nhVwWpQvjuNg52
         LTjeumrX1Ol6hhXKSEkkEewj+6ZVqaHj6VeO0gZnNw8dGRfPpWnYNU5wPrhNWsVCtFjv
         0AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735672664; x=1736277464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZVwPztK9QcjqX7PyTE/MlNuPOJaLJKW3qg69pSaTS0=;
        b=vlvWwjM/XYulFCO4WEmmGfhrTrXnYWE1mz47cnbKlj/lRqwvPfBoAiyznKFp2bVHSS
         VtTBfTxym66DA1crtHnUKavWfL+2QyNOHMZnpn02a5DKtaxo8O6KegTkxAhg/L60iwHX
         EY/BjhE3im2FPJ6nTKvLrKTQ2tftheaXOQ1eFokCBbe8YU3pcuCY+dzo4VkRNdsSZxaW
         SaN3m7noKOSqaI/1IeFUg8rku9Phbx9RT6uMWN0xZ87egLuSbidWqONr+Stx8vhCbvZJ
         /Bra+J00LN73Xn37cqrBXGvY/cDkwY96At4kdBPfj4SJbBcQDXRSiK7VXUHPIzE9GV8q
         CpOg==
X-Forwarded-Encrypted: i=1; AJvYcCUkmOo6FX8CiD2Hbl/q1iwOuDiokzSQHAdC42URWyRzX87/w0FiwaxO2OMTDKidxP6Hom7lmhaqP1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyin2IXA3v5p19X5cna8CeCH7+dTZ8TxeAnm1b33/EqcMFNbzmI
	7/3CtwVs0dKT4GXtoaNYna1PoVofkG2Rf979LlPgrDkvojQCv5oRcbMjEA==
X-Gm-Gg: ASbGncuLZNWGJo666xteUHZtMoWmyOE3yGoyz7OPeaflGxuwjLO/7ZMFh/gYIAyatbZ
	lJQU1rIxdRjnvTzDXZ4TbuWJkxmg51Ogy5u10w5ttAfvNM9TK11FaNgnmzFzbKuKZj0VoFjMFWZ
	YITUClvmPoeUh/H+ihyf3pNqPQSClWdDU3yHGV28FeLEOO7uxvIOaUxmP2eQsRt6wd39XAN+Bb9
	7sKBdV5/DMuMxtpLE/OT+Pq/33uPzLXFILoFqsZVX062JigQwUfRhnhLzkXmuci/V9kOjOh92GF
	jvC4N7tZifIBQg1GN/Zsx368rHdFRxHiEPzhkT8eO0k4ntBs832E5KtQO6UOH4txaDDe8WFicsD
	/ixLAD0kQQ8jiklSlJTC5MQ7Y
X-Google-Smtp-Source: AGHT+IELFIqzIaie/MMaC49pFrn1yGHjRrWfgs7WEtGNIslI4mEYrEWNpWlOemqJh6zQTJy/1wQwzQ==
X-Received: by 2002:a05:6402:1d50:b0:5d2:b712:fbcf with SMTP id 4fb4d7f45d1cf-5d81de23128mr33559140a12.21.1735672663916;
        Tue, 31 Dec 2024 11:17:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b300-ce00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b300:ce00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3d2sm16311780a12.16.2024.12.31.11.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:17:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] phy: amlogic: meson8b-usb2: two small cleanup patches
Date: Tue, 31 Dec 2024 20:17:16 +0100
Message-ID: <20241231191718.2764065-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_111746_638262_BA217339 
X-CRM114-Status: UNSURE (   6.49  )
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

Hello,

this series includes two small cleanups for the phy-meson8b-usb2
driver. There are no functional changes.


Martin Blumenstingl (2):
  phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of _SHIFT macros
  phy: amlogic: meson8b-usb2: Use the regmap_{clear,set}_bits helpers

 drivers/phy/amlogic/phy-meson8b-usb2.c | 35 +++++++++++---------------
 1 file changed, 14 insertions(+), 21 deletions(-)

-- 
2.47.1


