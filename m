Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1D1C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ciLKL0oNaTcGqmqIOmbZomzL3RZyKAIBEpvy5et0b1w=; b=F5Ccbyawxd8JVB
	jC4WI52cOnL30g9up/9BEXjQ/6LGgZF1pZzkxbEmS3w4m32mdkPAacwCZ1s4ZJMUuOAI3PvrHt6JJ
	8BBfcsfkBfQi5fC7nXktOEbKbdAL1nh0aiyxXsNjAa+ZhN7etqS/RIR8CUy3xCSgJniqt9eRZCgvC
	r+hel73flYHYaSB5SgoDzwlj5Aud5DUb1SAHT4LSysC3tMzNs++u/5vLTnNGDtM8GY6fbsCA5c1Vt
	PCX8AeIOUnD3tVWIxtHdq1o0UghyJ68FVwGbk+NtUxFr/VXWXcbeyc5YlURngH8zyZwAlOhe5LAHN
	dC2IbnJ7Y8Uc22sqHaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV35-0000000BRMu-3gZA;
	Tue, 03 Jun 2025 17:03:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV0t-0000000BR0j-3IVR;
	Tue, 03 Jun 2025 17:01:24 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a363d15c64so4108830f8f.3;
        Tue, 03 Jun 2025 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970082; x=1749574882; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciLKL0oNaTcGqmqIOmbZomzL3RZyKAIBEpvy5et0b1w=;
        b=WyAqxH3iYMJRBK6JcjDWH6oRlPP7F+rtK4zaSSt9LRRy9Gh5g5wzGfayNDenQXwJ7W
         /Kzqs0w5+yNp+QKLW9HfLJw1Mfkz5sbz19JHzet7cxQvOnkd9/41v30w2vXXbvQ2q2M6
         jiOs8xIOSKd1RG3/nB9WOdtV+1Tsto46HVkYK3JH5GRo6tuL5UI4RHOjM/HmYg23Yo2c
         VFz9ZQU7bcHVXNNfSvcAEzDhyGWTvg4dFZgO2yS4Ae3jiE+bBAIqRrse+VKKXpSs54s5
         6iWacJWrg1WHiuJYKpR6sPBSXU6NKqOAeTpByw/SSOu9duSsJtggvPvVVlwTuGS9drJT
         gh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970082; x=1749574882;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciLKL0oNaTcGqmqIOmbZomzL3RZyKAIBEpvy5et0b1w=;
        b=RSxzR3rVOTYnnYzIz69er32v9WIdCSMQyBc45pZyV/5pLOHBWAQfs1oFitzttKipgm
         ydfeQwwZuZgBf2KHthj/KlPrhz3pkzw3w93CfF1C4k4VzstgiZvCd3NwDfeQkdvL6NV5
         Fg3mlAvvrzEZb29TR92LIUFGEcPY8pc7zaqbAs+frQyOfzr2QY6A3msx9npjOndCNjJC
         j/SZsMnc6uRIcpaY8TSy0aaTypvVg8C4ZxQ6QCnmpmIQT9Lggi1LCnFzckY9OMZzRklV
         PuRkgZ6YjZhF/+HavbXm0JJcMsA17Op13a44y7L3zmp6GXu5imtFFrLa7rHmp5jxKnz6
         4wHA==
X-Forwarded-Encrypted: i=1; AJvYcCVlN0P6d+DxWYSQEIMkan6i50h6uGQUGXY9OA3oQjrLuZXmxpD2zw5852FHKl5WHBA3cDLEY144gS99UNYWCnHs@lists.infradead.org, AJvYcCW2KWJOzIR5Fnwv739SmcWqLQ3huUWjSd3M4qZhmDJvq00EFU5WJTkDdrkhVhjyQZ3TPEjyAQLtx4lfFKbBWPg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxmQdPyEe2gJWxNml3CTjBumo74w+s0NZiKwbxkpQ1Lq8oJByh
	FAiY+ii+2UnjrtOCVeBBBrLSpwGJSFKbVKCASTkUZVe8txTS4FWivshX
X-Gm-Gg: ASbGnct4O8aVt/MCWx+H4t1F+rTkRbiag+2NlVSQwgxYtdJ/jFv/1lBSk+7/OqVJs54
	lW/mFu8rgt+UtAT066oB+3PVp1u1qyPWEPWX1oFVsgkNTEmpMMDiG2goJYg76ycZt2eNaaDMdS5
	Ezk0JlKGgmeTqOnvYTrtZGhzRoKyDU+VfsGXbRxQfvNbDLjHNtqPNKETinN00qy+56pI1Rncumb
	RmtIZ4aO8PIkIOvGxAL0ybns4EmdxFbnTVoh+G8npM8ERuJ9oAiban38C6qVSVfEYDrippjEUh/
	RnMM9fUWOx7erjMIxqEIIlE/gdo2pmPLcoNhvYL4IQrj0y9tOitp+b+H/eqgUJYBYCFGtFy2ALM
	og+wdDiFrhu6TMTYStekHYVmuNg==
X-Google-Smtp-Source: AGHT+IHfcVfMVKXiAN2N/C9X+Ipnx2mNMy/BaYIgLXf2ajWTXyjeI/MYVV1vFjJZEyxZ2B1igc6u1A==
X-Received: by 2002:a05:6000:2c12:b0:3a4:d64a:3df0 with SMTP id ffacd0b85a97d-3a4f7a025bdmr14716348f8f.4.1748970081226;
        Tue, 03 Jun 2025 10:01:21 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:20 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/4] arm64: dts: rockchip: enable further peripherals on
 ArmSoM Sige5
Date: Tue, 03 Jun 2025 21:01:12 +0400
Message-Id: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgqP2gC/x3MQQqAIBBA0avErBMcQRddJVpoTjYbE6ciCO+et
 HyL/18QqkwC0/BCpZuFj9yB4wDr7nMixbEbjDZWO22UcCKrrhL9SaI8OhOsRo8BoTel0sbP/5u
 X1j68vxPhXwAAAA==
X-Change-ID: 20250602-sige5-updates-a162b501a1b1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=1451;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=I02Vlr73sM+rN6jjjm7Dd7get1VU85/AhuEx5Fpndmg=;
 b=VT4GHoLJKWU5AaJj8JZJB66ttYh5p4rDf2CqdTIJXtZD1qVq5vL7nkleI9J5KaCO9xegTgX9R
 3gPRGqEW/LnCMEK9xv2lkAp5KTnYDLqAhhQ5W6tYfpSncCx4QswdlzH
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_100123_829635_ED5C861F 
X-CRM114-Status: GOOD (  11.96  )
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

Add support for the two USB type A ports, link up the CPU regulators for
DVFS, enable WiFi and Bluetooth.

The bluetooth part might warrant some discussion and thoughts from the
list, given that it's connected over UART and thus not discoverable. At
the same time, there are two revisions of the board which have different
Bluetooth chips soldered on: Realtek based on v1.1 and Broadcom based on
v1.2. I'm not sure if there is any way to determine board version from
software. Mine is v1.2, so the respective patch deals with the Broadcom
case only, but maybe it's better to move it into a .dtso and thus kick
the can down the road (i.e. make the user deal with board identification
and loading of the right overlay)? Thoughts welcome.

Best regards,
Alexey

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (4):
      arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
      arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
      arm64: dts: rockchip: enable wifi on ArmSoM Sige5
      arm64: dts: rockchip: enable bluetooth on ArmSoM Sige5

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 135 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  16 +++
 2 files changed, 151 insertions(+)
---
base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
change-id: 20250602-sige5-updates-a162b501a1b1

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


