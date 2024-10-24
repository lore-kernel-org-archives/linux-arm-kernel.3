Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FBFCE8E69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tv6O+TghCU2f9mC++4kG9WDH4zCondacLVwevpdizzo=; b=yce/MpfnNvrvv8e6o6rwaIqy3m
	/kazgP261E8O1ZVkql7BQfyB2feJa083zklZ9OnBoz9L1NujxH0Fyk1ok/wlhtsNqmuBtuVNuZX6K
	zXWFeMC+Nd+d4BpQluoXDX7npgqtwc0LFFXmAu0UV4S4QGz/W/N0onK0BLa/zU8yVWw6yZOtHWOQy
	hCNnCgE9Yl99+IC68w8xHj0wY498jwdh2viczs9Ha3Dk3t3mUWhcg14kDlAxspOD9VrwLGP+xqeT/
	Pju46ga9riVII/YMW2QznNFtjDLoCfGcjGJ17oT86RMY1a63x1mAa7vYeo+Ej6zCbERIT6UZqz+G7
	n1JRvHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNu-00000000Fvz-3KF5;
	Thu, 24 Oct 2024 11:52:11 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3w5J-00000000Dfa-3zBg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:32:59 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-20e576dbc42so7080455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769577; x=1730374377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tv6O+TghCU2f9mC++4kG9WDH4zCondacLVwevpdizzo=;
        b=IS4rml0shEcWLlSbADb1fPzqj2EGNZWt9lyByRg1CsX7MSsmVlHULzK8XjjEGFQ9Qt
         zNZzDGMIXznN9Sf3CGaJeU5HjKRkazU+8w2MuEXrYVI8st1WuDeyzrxYoOKs9mgB1QQ5
         wOcuh0EfyyUyfAfUAn76icCd92DuwzUESQIQWkNXxbVR3s3PKhLa8mTg4gU4wAKlS8o6
         yDMoWqDK9L1ZEJB/xveLOYFoU+S1WK9i8iD9AaOkz+rc7GALdNzEAHDgilDLyNxNDg8Y
         nticmdQkpgO545MmuT1vEMQAcNf37UzwiFmHk8OKL/9Pm47nOmGi5vC/WQIT3YyS/PRf
         V4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769577; x=1730374377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv6O+TghCU2f9mC++4kG9WDH4zCondacLVwevpdizzo=;
        b=mL+ayw2NfF9OMZ70RHVENcYta6SduOC70ybUU0Nq4lQeRqZWQMPyCug9taSkhC5PSL
         RSSKRawDF/6J36gYMQlNXGE/g5c6iIGpPo0VS7SES36Qk5PwuUlGwJz96C982W4raUZP
         WTIRxOLNDJlqFjfp65I0sdirvwe/P5d6Yy9RUmZYReYUnvf8S63LsTjZ0xCaacAe9OaM
         d3vr25grYCpbaSb9kgDyQRvULkpk3vCjFUXPWLkprL+Ldo40Jj6effVQ0NebnM09YV7F
         koIJUiMObHf6t7ueAKvvG2FsEfxmERifny/yB0bOiCpL8AVVlega/EgpgzQdjT1Eleg5
         fJDg==
X-Forwarded-Encrypted: i=1; AJvYcCXm/db4nG7lY8qNo838H2+u4un/gtaXL+rH3fUHEXqMFI9eAvrZAcacx5Mhj5AaEN0EEQP/qD2xQYXutM2PeAuf@lists.infradead.org
X-Gm-Message-State: AOJu0YyJgPL7eCOw2zbdqrF6WZ5S2dI9CxTYEC0rF5Zo4i0BrDxy6iyZ
	vlaTsDWnmqKd22J2qZygELN321kaa6dlZ6nHKllI4Val2UqFj8dnDDdHVCLkvdsQMzE5
X-Google-Smtp-Source: AGHT+IGnX8BAozTq7iV5Cfb4iMWgUhRXOngKBX3V0+lNlRioh+e/fyzPpLUXG8x8OAUIikKgPta+wg==
X-Received: by 2002:a17:902:e80c:b0:20c:e5b5:608a with SMTP id d9443c01a7336-20fa9de92a8mr80789405ad.5.1729769576555;
        Thu, 24 Oct 2024 04:32:56 -0700 (PDT)
Received: from codespaces-a350b5.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([23.97.62.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f364bsm70916385ad.264.2024.10.24.04.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:32:56 -0700 (PDT)
From: Jensen Huang <jensenhuangnvdia@gmail.com>
X-Google-Original-From: Jensen Huang <JensenHuangNVDIA@gmail.com>
To: torvalds@linux-foundation.org
Cc: aospan@netup.ru,
	conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org,
	dushistov@mail.ru,
	fancer.lancer@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru,
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com,
	netdev@vger.kernel.org,
	nikita@trvn.ru,
	ntb@lists.linux.dev,
	patches@lists.linux.dev,
	richard.henderson@linaro.org,
	s.shtylyov@omp.ru,
	serjk@netup.ru,
	shc_work@mail.ru,
	torvic9@mailbox.org,
	tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru,
	wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com,
	xeb@mail.ru,
	Jensen Huang <JensenHuangNVDIA@gmail.com>
Subject: [PATCH] MAINTAINERS: Remove some entries due to various compliance requirements.
Date: Thu, 24 Oct 2024 11:32:46 +0000
Message-ID: <20241024113246.22901-1-JensenHuangNVDIA@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043258_010826_6E4F9FEB 
X-CRM114-Status: UNSURE (   9.73  )
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

Remove some entries due to various compliance requirements. They can come
back in the future if sufficient documentation is provided.

Signed-off-by: Jensen Huang <JensenHuangNVDIA@gmail.com>

---

Follow 6e90b67

---

Linus Torvalds said

"I'm Finnish. Did you think I'd be supporting Russian
aggression? Apparently it's not just lack of real news, it's lack of
history knowledge too."

So we should remove Israeli developers too, because Israel is committing aggression and genocide.

Link: https://lore.kernel.org/all/CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com/
---
 MAINTAINERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9659a5a7..9ce642d40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2275,13 +2275,6 @@ S:	Maintained
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git clkdev
 F:	drivers/clk/clkdev.c
 
-ARM/CONEXANT DIGICOLOR MACHINE SUPPORT
-M:	Baruch Siach <baruch@tkos.co.il>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-F:	arch/arm/boot/dts/cnxt/
-N:	digicolor
-
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Suzuki K Poulose <suzuki.poulose@arm.com>
 R:	Mike Leach <mike.leach@linaro.org>
-- 
2.46.2


