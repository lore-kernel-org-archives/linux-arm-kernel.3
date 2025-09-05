Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CEACA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FsVe1zNOC/H6ojIiXUvMEvLQQ40mzIiSdTqnpSLIO+s=; b=OGIHo+fxXA5Xj71GnLsCl5aml4
	7C5GT1uKpDULRHbfn9HThz/pmagmxNRY0zZ7idqTeYkssc3OSZoQtJrP7BWh0xXuz2YmCx/00CTG8
	paRzsZTpPFlhYGeRsrVs0UxqL6wmakGV9ievm10k78tvt5MzcOyDt3IWnCq3SKYNiPwZbbmTrnKeQ
	L7lSjHLSyrenGkYdMePVhjAIymtxRKuhLL4gYYjX9uBXtyst84zJoXnQV1189JI9W4byiUQLXdC+O
	vFTIYZWp1A9d2548DhqWC0ODKuB61cFPcuz85fmQSYNko4j2YGHRNlu+D60EWTy+7MSKVQOLlWIMF
	shM/p0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZKI-000000037XM-3Z7L;
	Fri, 05 Sep 2025 16:30:14 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVxZ-00000001oIy-38EZ;
	Fri, 05 Sep 2025 12:54:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7723bf02181so1672721b3a.1;
        Fri, 05 Sep 2025 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757076873; x=1757681673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsVe1zNOC/H6ojIiXUvMEvLQQ40mzIiSdTqnpSLIO+s=;
        b=ii1raru7OIvf7Hn5LsR/rqHc/6JDVZ/ZX2r58CNKAzP2I1fcwJFFf6KBf0tjljQcvz
         868YR5FwsX7N4CZulMPdeIRzjL2DXO9qt9HZGsErqeHq7DCwNU7T6UOMi6iM6T4cF6iv
         g/dgdQBDqZTy+DvpmETvUwz1ceAJH94HARcmDKEnLdBKwxJZh1r4Vfl76tDnFD8InVCm
         7CPqudDuEDYCi+D7eEDYP2VBBLQeNwIUH+0fQ8vrXvOpTA3gRx5CniUt0m/CaM1Aa3f6
         4LqGX7zILhG4bDgNSorh7vSld/DyqanHRISkRJ40szvfHp8gQZfv5Lt+U2wQHoCVYUmj
         pkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076873; x=1757681673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsVe1zNOC/H6ojIiXUvMEvLQQ40mzIiSdTqnpSLIO+s=;
        b=leEztAeH/2m1NpYu6tUwar/b9YQVcxgy2abm0VY0OgUbByX3ABen96miYFwWXV4YQb
         FVDjqrxTmq1Wsgm2ZGLDGThOi+YmXXJDCFTDcxfxoNXetpCJGnzmeW1MJIUgqIWzxssU
         cq01EWN86E4Ks0ArNogrBpavwL+895zQavN5wL0dqfxeWJ2xA3zLIY8Br8UH2Lf52fHm
         8jxs4AXgtQt/0XUDMOzVwzWlWVMZtXwB9NU30HKo6Pk2z9oAqZ87Da4c7ngyCeAjwkl+
         UJIEtFof+7OvCc/ACLjb5EhYKjVebAtAMWAkRYfAgdXcWAk861YWofTU025MwuAFJd/b
         MC2w==
X-Forwarded-Encrypted: i=1; AJvYcCVyHGd4HrbM7dR34zfvPvOV7M4ezAZackvFVcA9wfUHJtRAWHUhwk6FSAS541PB2zm4iLZX+wXVxmPa7ftDA0P+@lists.infradead.org, AJvYcCW2haPWIsx1cyEW8paAizv+priY1ZZPN69fWf3xFGLiNf7/ZGttCxg02biW+wgec87L0XWNL/pfb4JPi/fCGsw=@lists.infradead.org, AJvYcCWGJT6BuyBVKqOYn4bA6Lbc93TkO6HUL4lhlKzoxngPPSYAmMFJEwIFEWOsu2+59E/hr33GfMM5EGjT@lists.infradead.org
X-Gm-Message-State: AOJu0YwbJ3oZb+el55QQLOiZ+wwV/MFZRsu0vUxYmMd6dVAJdTGLbvlR
	voi2g2lUz2zmSfbimdoUl8ZerBGWTiEHRhbwRAOE9D8PvvAPDxdB2PRJ
X-Gm-Gg: ASbGncuzwoXSG1Oy5fyoXcw7RUKzG3FBohgU90u7vj24SA4xUBb3JedViYwd7mWFMUp
	yOb2nZ+yL+s1ByFEMX1J0p6q1psboZ4zMNuMYq/ZBZL/VvhN4jjZpa30oCHOm0djgC59rBtuy18
	OdVatmWLnfEqYv24HyGhYjFM2uoPK3qupGoJ5YmmRiD/UjZu5Vd4XwsgUOrlRcQOXeX7eZwvTvM
	UrcRmrG9W71jhc0Ud8oq12nM218pCdQ0li8CrHSjZjVdw6GgpRBMggmUPV4A83wvS0Iyo/kXhiP
	2I8IykvSKD5auz+dHV4mmatc8iLhzntdokq5j7z5CHPc/YdUNP6BXvSPcRLT3GrJ+2NHMyvLOan
	wPTjB66pJlH3er/6+UrK6Vg==
X-Google-Smtp-Source: AGHT+IGSB/6psGMdfnR0iXpbtMTHmVJmb0qzrCCGWnM1iEKu1OnqX44klrv8XQHpsVoJpsKMYBJaTA==
X-Received: by 2002:a05:6a20:1592:b0:243:a373:a9e8 with SMTP id adf61e73a8af0-243d6f030bamr31504446637.38.1757076872830;
        Fri, 05 Sep 2025 05:54:32 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb98f9f6asm4992305a12.8.2025.09.05.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 05:54:32 -0700 (PDT)
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
Subject: [PATCH v1 0/4] Fix USB controller support for RK3368
Date: Fri,  5 Sep 2025 20:53:13 +0800
Message-ID: <20250905125318.7956-1-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_055433_789237_58159087 
X-CRM114-Status: UNSURE (   9.01  )
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

This series fixs USB controller support for the Rockchip RK3368 SoC.

Key changes:
 - Update phy-rockchip-inno-usb2 driver to preperly handle RK3368 usb
   phy initialization and configuration.
 - Add usb PHY node to rk3368.dtsi with correct clocks and register
   mapping.
 - Add missing OHCI node, add missing attribute for usb host node.
 - Add dt-bindings document.

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
  arm64: dts: rockchip: Add phys attribute for USB host node

 .../bindings/phy/rockchip,inno-usb2phy.yaml   |  2 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 47 +++++++++++++++++-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 49 +++++++++++++++++++
 3 files changed, 96 insertions(+), 2 deletions(-)

-- 
2.39.5


