Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C7EC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 04:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9SOmEHKtxnt/FjMNuH1uNatxTpKuGKSJFXtnrbflUGQ=; b=3Rcnzrh6CiVlZdfzojWlC4PQWN
	CzCzbbkNMVdlpHtBPE7yn4rAmSxa72qv4nAtwF/2AQXru11rA+XhpJWmG1JFxBI5kixQOIKjDKkog
	/Cq6uDhVSJigXxo4dSotd4JVn3xveICyBo/y0FG3Qlt3L/LpRUoZtfqzko2tGtF6y4WcjIgYyTmw3
	5hMql6CX/Fu7SA3l0DQvH/BQgFdvSJ25EUTMB7Y9PEZHBZQG3x4skF6XLi+4wBaRAObgHetw9UnP4
	DIYlVP/ZzxRNWb0El00ty1GGMu0GkD3LwXbXTkHPg2XTbp2tj8bj8zMjcSTx1D/WorYbR8IUfZyNn
	LL1pcVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxvJ-0000000Gg3r-21WU;
	Thu, 20 Feb 2025 04:12:29 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxtn-0000000Gfsd-3hZk;
	Thu, 20 Feb 2025 04:10:57 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7272f9b4132so359051a34.0;
        Wed, 19 Feb 2025 20:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024654; x=1740629454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9SOmEHKtxnt/FjMNuH1uNatxTpKuGKSJFXtnrbflUGQ=;
        b=efxJtY/IxEbc3uIN/W1LrrX7nTS+6HAD0IJlgZX1oaqciq9aXUH2y6OyFRTrPw6nfJ
         JFXzpHI5RCcqW+FCVSP+RNL9TfdVWHzUj+gfRfjYoH2gAam8stuYUB71Bs83bKtACL+k
         WWLwCcUgMvbGKdR1cokTUUckO003yrtC0WP7+j44ofbDjYLA1qozyZZcSpmiMwgjzlJh
         H26oFZKyYW/8Vghk/5q+8xj3y+fINeNHwufJb6EQGAkrg3DUjrJmInpaZ6AvnY8C//pv
         Ec4SO1BjdKIKh7fPo265GlAbnCSauUEAlAry65nBsVaCXizS1RXDBPIPr2eEuw+bI54y
         k7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024654; x=1740629454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SOmEHKtxnt/FjMNuH1uNatxTpKuGKSJFXtnrbflUGQ=;
        b=tFiEIsMU3PuzKLiyIGiUEIza/Ey/A5zjiEultdzhHdnSustpbVIZM+GZVJyiFFPqpC
         xoGmOOZLSVLHAlLko4TJ3W4ue726tMmf5W9Hzd8Ebpx13I6oQ4145+FhazfsSXO35WNe
         NNIr6vGU4jjK7lnQNH5Ts0/L9D9XMB4HgkjxuTLXMSXhSgF7inREcBgYMZRac0buEC5C
         ntR3vR3w9tAHwWhESo9P6Hp8KLYIkMey007Coh2I0QcRjaeG1TpHo9sP/NJF7lclp5Ya
         IlS5Esp297C/1Dh11/HRHkBctNaEEqRNyi+O7nJQccuBQWBJBatDkRWs841hLl8AhnmX
         kfVg==
X-Forwarded-Encrypted: i=1; AJvYcCUgtmDB+mf2D1CaDqsekcMVcSu5bmFh47xHCMQ/e57GmwQ6z76OetApXTEo7ZjRVSfjjcNbvP1QZ5I7I/Md5N0M@lists.infradead.org, AJvYcCWX9uPb5YIcHytesbsSYqzYFNMWjMwgUfaCzQ3uNaB7V1AqzI5fIbtLLUfOb7uF9yygk6qfVb8z1LuAugqp120=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjzcVAwNHOpez6EYy7qJ+Cu9gPn+t7aWFIk0UVc8BBaKSCRQwu
	N7w+Jp0MGnvzXYS1DvbMR3KK+99D+xeR2HjS+1/PM57wenU10rL8
X-Gm-Gg: ASbGnctvqabV5aeGCmZjalopWLRtJNC7M8uFl37bawNS7Y5GlZzMvkCjjYocO07mH/f
	4gaT9GeyqPoZxq5VsbtaTWdn/DJCRfW6xBi/IRoBJO4IMyQMNR2r2wN9+BEzDd7eH6kfQViQdPK
	T1KQsEgLNQaK99wmbBrb/uWm4aINWZF+0PmqqvaQd6Te7yurkGJFqHbE0WGsN4Xi2Z/Cg9ajQ6Q
	S1HaEKoX8pIeGZIY27PS0i/ObuPMR8DdXHpzpr8F5bXUO1TfjjLq00M2Ge17/0300B5dGsRIeVK
	/wLQvXnSy9ovOFFBj4ZxBU3q
X-Google-Smtp-Source: AGHT+IHCvbgOiUNK4JM990pKQOaGt/m682yZIACl+zliSAkxtTUBeduDoCl/w2cP2mdXDUodQ14SeA==
X-Received: by 2002:a05:6830:6a8a:b0:727:2c98:4b1c with SMTP id 46e09a7af769-727377694bdmr5641466a34.8.1740024654424;
        Wed, 19 Feb 2025 20:10:54 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:20f3:777f:5ae9:b018])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727378237e4sm1025875a34.47.2025.02.19.20.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:10:53 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH UNTESTED v5 0/4] Orange Pi 5 Ultra
Date: Wed, 19 Feb 2025 22:10:06 -0600
Message-ID: <20250220041010.3801-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_201055_922609_61FDB0F9 
X-CRM114-Status: GOOD (  12.26  )
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

Add device-tree for Orange Pi 5 Ultra

This patchset is looking for testers. I do not have the hardware to test.

The schematic has been published for the Orange 5 Ultra. [1]

It's a sibling of the Orange Pi 5 Max [2] with the HDMI0 switched out 
for the HDMI RX. As a side affect the pin for USB_OTG_PWREN [3][4] has 
changed.

Patch 1 and 2 can be used on 6.14-rc1
Patch 3 can be used with 6.15-rc1
Patch 4 is waiting for HDMI audio patchset [5]

My testing branch with dependent patchsets is on github [6].

[1] http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-5-Ultra.html
[2] http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-5-Max.html
[3] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts#L306
[4] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts#L321
[5] https://lore.kernel.org/linux-rockchip/20250217215641.372723-1-detlev.casanova@collabora.com/
[6] https://github.com/jimmyhon/linux/tree/integrate-6.15

Changes in v5:
- add USB 3.0
- add HDMI1
- add HDMI audio
Link to v4: https://lore.kernel.org/linux-rockchip/20241229184256.1870-10-honyuenkwun@gmail.com/

Jimmy Hon (4):
  dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
  arm64: dts: rockchip: Add Orange Pi 5 Ultra board
  arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
  arm64: dts: rockchip: Enable HDMI1 audio output for Orange Pi 5 Ultra

 .../devicetree/bindings/arm/rockchip.yaml     |  3 +-
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 75 +++++++++++++++++++
 3 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts

base-commit: fa15cc73121279f93757ec76312b0d0b73f7462a
prerequisite-patch-id: e7cb3b62d173506d38a10a8e71eedd62ba6a1bc0
-- 
2.48.1


