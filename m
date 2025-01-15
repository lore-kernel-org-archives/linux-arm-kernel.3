Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F240C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 01:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zxKAeTboBvObYWkDQ0AR6zNtcZLXj4I4J7ZDM4Fl16Q=; b=Q9qbHjfygsysbJzv970h4E1oJP
	ftp594/yym7RuCRzMDGeKXpr1zc5QBdqdkVDEKc36ct4CtBwrKB6QIbvnOS41/sDncqcsZH4bUhie
	7Nvzu9hkacSOzLG5fTcdhUa2ru+kl438Zi5A7To/f7/x8gVStMtpw+fTs4LOcNKiQmXBxKb1m2GE8
	cC3iLdN+MH4pEkM1083vfnipDp4pIG91LOGmyfmwkhy188jcV4RnyuXoNg9Kve5Wo5fxpPqzh2/S1
	3y2+7tXv99yorxnlNl+FG2udvj8SgSmdyAJPe2BLbdVsia5X5fgFCtL07fYxumocohcUu7/Mto6rs
	Ue34PXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsCM-0000000AICY-3B1f;
	Wed, 15 Jan 2025 01:27:58 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsB6-0000000AHn6-174E;
	Wed, 15 Jan 2025 01:26:41 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-467838e75ffso78602301cf.3;
        Tue, 14 Jan 2025 17:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736904399; x=1737509199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxKAeTboBvObYWkDQ0AR6zNtcZLXj4I4J7ZDM4Fl16Q=;
        b=BJ4sReGwOZ+7N7GpEG/mhQrhDj2PshFuNMvt5Uo2FYRqnBs1GNmwmf6RmQP9bARNGk
         StybLMlRtWWpm5CXmOpK7L8hcrHWodYAWB6JbdOrl9bYDq7svOSuy73YFY6HCJxCeNN7
         lLczbQM8sst2PE5x8YBPt9z+956z0GUjSxBsQa+BU9UqMwxZutqE0/18t7L6Dmrg+UAk
         /Qz5XwxnsRziFGuUh102qmfPnN2tP99ego65+MR6J8VXEodo4f/f7pODeOtNrCTSLTv5
         Rsbj0ILsW4DGiYPy6EXMLeyLw2I0Sx1kNVP4EhS9el3KBhousvPvkmS69jbg7bMLnPxB
         Y8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736904399; x=1737509199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxKAeTboBvObYWkDQ0AR6zNtcZLXj4I4J7ZDM4Fl16Q=;
        b=jsJkxz6B1DwMbqYwZd6U1GSbUunkOZOeOEeG9UR22E3vzsT2rzCsb6cZD9R07el9Tk
         lQ3q8enVoHd8qwVR2fVYihziLz3SWU5LBdipR+fd3GfuQ60aGyGsya+oTW0bOvdUVIPe
         JH2+1dEMShstY5luxunVc9DQrjiQLhEfNF/z97tAhh8rckOR1Re+zjzY1jTXlyiemNFX
         4KHdo48Lpiezb+3A+QnPmdYtTu3L2r9CkwGsFHBoHsnWXBND+57PAkxvqS+jGKV3JbKA
         OEWBa6K+wT+ST9VCaGyqg6RDlDxnDnpglb7sLMcKXj+EEV7z3xTrHIiJA4VhfRRnHoS3
         IYzw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ3R+nrEmlPNv4tbKrkgLfnmusEftqTGGuR3kjW/Ckbx5Rf1r88VLVkWE6wR0Yz0x3vh2VOJ6rtJ8sRyOcPzDa@lists.infradead.org, AJvYcCX+bwQGyPM6pLyoXYhl3evv+UvLnLgHwyZqASzGi7UWbMK6jtWCMDk5ve9EoJKDLUxF9nFEnsZR22lx@lists.infradead.org, AJvYcCXV04u2jnzzgH1ZdeLT1TIZEj952l0/N7ap1RRlHeihUoNIdCpyBaogbHpCHPY9PoNtkA61+E0DZ8DouuccJK4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdG5fVjuMUaP2FzOFQJlfi5Pvr+TJ1Y7DlIQGI/ocqadT2S3Xg
	gwZhH18a00uB1+QkL6WiqyVIfMmDI1nUSmkmTu6V3b/eaEbgQ+POChhyVWuY
X-Gm-Gg: ASbGncvXlxq3rUZRIzcjNuRrhkIoZYXH6KBKuBf7yGsnI+b5ZUhBB/9uMlQKGP8c24F
	OFhIebBA9XlEG5fqDzEFgE6yU8D1CnZ9HxsGJxbKpJ5FUmPSrZIs5QQPTYZQ9bpT7Yi/SBfT1QR
	7HrbU4R+meD0dL8fePIj1E1K3WoCUOmgeyREYr9m57YNnq4RJl3ubRAcHZyMwXwcb6L6MbZa8JW
	1UwIlFTRtb9Rg2r8ITjUKQTCGqohGhaQCvxTRwHXOl8tBPK/GSrF6SNMkRLjmP9PPPZ
X-Google-Smtp-Source: AGHT+IHkjY+lSGkYzydQLdwGyg5cAMqfVAt8/A/Vokcc+X5oQZqhnf93yNQ9PAJuXC0Ab72Srz1tdA==
X-Received: by 2002:a05:622a:34c:b0:466:8c53:7758 with SMTP id d75a77b69052e-46c70fd31b0mr421291791cf.5.1736904398819;
        Tue, 14 Jan 2025 17:26:38 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.227.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8733130dsm59933881cf.25.2025.01.14.17.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:26:37 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Alex Bee <knaerzche@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Trevor Woerner <twoerner@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Zhang Yubing <yubing.zhang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
Date: Wed, 15 Jan 2025 01:26:21 +0000
Message-Id: <20250115012628.1035928-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_172640_306107_B02A170B 
X-CRM114-Status: GOOD (  16.09  )
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


This is my newly reworked phy driver for the rk3328 usb3 phy. It is
based loosely on my original version, but as of now almost nothing of
the original driver remains. The main fix here is the discovery of
BIT(6) in the interrupt enable grf register fixes the usb3 disconnection
detection (mostly). On occasion an unpopulated usb3 hub will take
several seconds to disconnect. However this means all of the hack around
work to reset the usb core manually is no longer required.

I did my best to document all registers I could find. A lot was taken
from emails between myself and Rockchip's engineers, much thanks to
William Wu <wulf@rock-chips.com> for their assistance here. The rest of
the config bits were taken from the rk3328 and rk3228h TRMs and the
downstream driver. Everything that I couldn't find a definition for is
prefixed UNK_ or UNKNOWN_. There's a lot of obviously used configuration
registers with the pipe interface that are also undocumented.

The only major bug I have so far is my AX88179 usb3 gigabit ethernet
adapter (Pluggable brand) crashes out when large amounts of data are
transmitted. I suspect this is related to the RX and TX tuning, as
leaving it at defaults makes things worse. As I am not a USB3 engineer
and I do not have the specialized knowledge and hardware to determine
what is going wrong, I am hoping the mailing list will have an answer
here.

Please test and review.

Very Respectfully,
Peter Geis



Peter Geis (6):
  clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
  dt-bindings: phy: rockchip: add rk3328 usb3 phy
  phy: rockchip: add driver for rk3328 usb3 phy
  arm64: dts: rockchip: add rk3328 usb3 phy node
  arm64: dts: rockchip: enable the usb3 phy on rk3328-roc boards
  arm64: dts: rockchip: enable the usb3 phy on remaining rk3328 boards

 .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++
 .../boot/dts/rockchip/rk3328-nanopi-r2.dtsi   |  12 +
 .../dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  12 +
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi  |  12 +
 .../boot/dts/rockchip/rk3328-rock-pi-e.dts    |  12 +
 .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  12 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  39 +
 drivers/clk/rockchip/clk-rk3328.c             |   2 +-
 drivers/phy/rockchip/Kconfig                  |  10 +
 drivers/phy/rockchip/Makefile                 |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 869 ++++++++++++++++++
 11 files changed, 1146 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c

-- 
2.39.5


