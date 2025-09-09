Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725DFCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dG6XF2PIOMDeR4MOZBWi65Kf7chBzQecby0CPXw5mi8=; b=l2XFoql93zzCcSStb1t5G50msz
	yAq32Ieebq3J7cCjsih0XKc7x2NY39eYWQyhjJ8IOQWseq87dLnqrx2Zn91BT+TXn4n1Dghns0d45
	IEMkp6iJp0GyUu3PNhNtWwCfXTQ1vcLRcMXs5B4vlutbr6xC34V9SKkkRGI+4xC+xLVx2rIFRHTcs
	Ptmxns4JcQby4E2OhH6Q2/w7gfgO4H4pGyoW6qyeBaMjiMZoIKbUcApX6F11y9AzErhZLnIkbKfiF
	jzBGf+FAVFkYJll3K9rXG1HDm+Ps7K62LfZo+pQhaYmwHrzTTzkM+dn0T6TI3ZUQeWperitFh+xsx
	t0/AG/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1z7-00000008ssv-3Iz2;
	Tue, 09 Sep 2025 17:18:25 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyR5-00000007Oo2-0DyZ;
	Tue, 09 Sep 2025 13:31:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32d6c194134so3642087a91.0;
        Tue, 09 Sep 2025 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757424662; x=1758029462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dG6XF2PIOMDeR4MOZBWi65Kf7chBzQecby0CPXw5mi8=;
        b=CAaQiHbMSnc3TCbXZ49Ym1f4J+UHBdWhQptMwyx/dSYOxRQrl0oR2zSnscKd8dqoXF
         z6tjq9FEfkqfr2MslVFBdleqIHe8yA0MADD89uyleL7U2FD1mbPYW1WiPtrVi0V+lMCX
         YGItp5knJWFSjhr6jDBKCODyz09/0gqINKYY2GKFdnFyooEGs4Vv4tB7HVeOgZYa7KO9
         2mso8YLnG14pIwoap8/t97LK38TjRPyQUOr0STHOLYFvruyLg85MmcFskcpgy+KVWHfe
         VkeZrNBlo9qN30GItm5TrqmU3XsI53oEEYPBteh2QTQqwZqO7Ls98Lw2ouiH50k+dT7/
         7r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424662; x=1758029462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dG6XF2PIOMDeR4MOZBWi65Kf7chBzQecby0CPXw5mi8=;
        b=PXkYwom4z5LucpEv2k/13zJKdTZ3vxdFDODRIXn0S1dqv10TJtKgR/2Br+lyjte5Pb
         Vfp62g319MjCWsHL1oSQTLBwGt7PETed22UFJy3tVW9HFtjN7m9v6v6y8Kcu2qLc8GtF
         DImEfYvXcWNwvkjgU4FxSxQZa2+gPBUlQix/mBge2uUr0HbEHy1sBTIcW2FbQwffn/8a
         whTQJS0aASuJfu9eQeLKjfE6bfI9WBD09NgJTORIxORmLtO7+OkRpu7aXvKGxFM45jEE
         bypj0fSlbYEksDRG7khLhoCYApsQTv3SHlXlYk2ROFVIxgfmqyQEeHgu3KFywnLQA3ST
         s8dg==
X-Forwarded-Encrypted: i=1; AJvYcCVNIm0Za2zqWJXmNKCvh9iHBbF4BLw2yZOZg3kqJxNj/1GZ8vYOBnloe/ug8vtNGjsDtqgPido1jFmz@lists.infradead.org, AJvYcCVxOzb/zfnn9uW404CbCR+gHvl18AQMW7IhbwxvcHJu68iTiOB2hAk35eCt12EI0dIzBGONBpYpCskDh08YYyE=@lists.infradead.org, AJvYcCW26aN8Ufk6ZSFFeVLu/ycW8924aTXP/KvqJVdvDZpWtomXMzwITjBhxybIgdMkgG/X4qjnYGL6B6G/SO58ig3H@lists.infradead.org
X-Gm-Message-State: AOJu0YyzzCzDqulQ2oEpb49UXOnDfKd9xNO8Pa/KaoMBEn0OZ4QX/syu
	dBDy17A1TNzCYfHfQdwK8IPGnjiUZMHSVuBEjExfNq0m1DJqQ+SgiPDwvc9lljAeQ30=
X-Gm-Gg: ASbGncunORUz1qkwIjvZmo/LtFcfr6LHOte0bnFXq+rOlxWCGJ4yruUWUCfdscaJA7V
	1TICiMKZ/uBGelRJiWDs4ejiihffEDTvI28eHN1JGG7wmMX3IcUlcAr6nkN0l8de3g3OXw3phE7
	w7tWqPLXxWyMaDz7TQySYtJtdpIyUKScDKd3Ns5zmJ9o0VPDlYstj3nlk4FM015ExWidHmER4ZX
	EMcb02qhytSgjdfpslbsPLqnuPprutFSrReX3uFy8tFm0NhReHh1FjHc00qQClLLfZR8GLRutFd
	68ECu9TBZXeuJj3die068Tubsvfe88SPGliQfLdF7wF1enR+mrpHF+v2QIG99DV7iVun5hq1Xb5
	ngIfOvPPb+wkWy39Js/WYVTfxsBsP0kpvtjM+amIV
X-Google-Smtp-Source: AGHT+IFvzCSi3Jx1813Qml8IRiQpzQZCTcshHHIDJ588+57HfZOE6WtTLDZVN3MrY4AiWuNHBrHx4Q==
X-Received: by 2002:a17:90b:5584:b0:32b:cb05:849a with SMTP id 98e67ed59e1d1-32d43f936fbmr14109516a91.29.1757424661526;
        Tue, 09 Sep 2025 06:31:01 -0700 (PDT)
Received: from localhost.localdomain ([240e:3a6:1c4b:13c0:db95:4539:1490:64d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab173060sm810778a91.5.2025.09.09.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:31:00 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 0/4] Fix USB controller support for RK3368
Date: Tue,  9 Sep 2025 21:29:54 +0800
Message-ID: <20250909132958.26423-1-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063103_089317_F08CC045 
X-CRM114-Status: GOOD (  10.32  )
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

This series fixs USB controller support for the Rockchip RK3368 SoC.

Key changes:
 - Update phy-rockchip-inno-usb2 driver to preperly handle RK3368 usb
   phy initialization and configuration.
 - Add usb PHY node to rk3368.dtsi with correct clocks and register
   mapping.
 - Add missing OHCI node, add missing attribute for usb host node.
 - Add dt-bindings document.

The following changes since v1:
 - Remove the duplicate structure member I accidentally added.

These changes were tested on a RK3368-based board [1]. Both of USB ports
can emumerate device (HID and mass storage).

Main code changes come from the rockchip downstream source [2].

[1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368
[2] https://github.com/rockchip-linux/kernel

Tested-by: WeiHao Li <cn.liweihao@gmail.com>
Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

WeiHao Li (4):
  phy: rockchip: inno-usb2: Add usb2 phy support for RK3368
  arm64: dts: rockchip: Add USB2.0 PHY for RK3368
  dt-bindings: phy: rockchip,inno-usb2phy: Document rk3368 usb phy
  arm64: dts: rockchip: Add phys attribute of USB host node for RK3368

 .../bindings/phy/rockchip,inno-usb2phy.yaml   |  2 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 47 +++++++++++++++++-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 48 +++++++++++++++++++
 3 files changed, 95 insertions(+), 2 deletions(-)

-- 
2.47.2


