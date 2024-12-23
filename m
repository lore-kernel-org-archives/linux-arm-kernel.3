Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466E2E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 01:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rZiA8+8cgK1p5p7ZdtgnD9VuQej6yYU4CGShpBV3y6M=; b=wRmKZoTWtfCXOvgTNGYi8hdlpS
	NVpTK3XMKKUxltWWrYn13whszjLnGkl4+eZKSb9A9Rygu/sFlgnmHpF6nJscNavx42Pvr8XwjQ+tK
	9tlxLMDX4inwy3fJp9+X0i09+MnXmpNjl/V9l6tDzBegHWw8yUOcv2HWyh5f1QbGz9n78YAiATDhP
	amYXw+SvoqnaRCmrJY665e28yhq53EsonOJNpv+5OdKx94+ibtaCVbSnaYvZ2RvKq3R3PVL+tQbKD
	SlThLcb7rCylH0NQZ2KcoeG1Urga8Pv6mryGN8O4w12lON6eX913OKhAW4MGygaqoC+zI3o8d8uao
	c9YfXW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPWoG-000000092mr-1I6q;
	Mon, 23 Dec 2024 01:00:36 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPWn3-000000092aE-0pmO;
	Mon, 23 Dec 2024 00:59:22 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6d918f066c1so18478976d6.2;
        Sun, 22 Dec 2024 16:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734915559; x=1735520359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rZiA8+8cgK1p5p7ZdtgnD9VuQej6yYU4CGShpBV3y6M=;
        b=S8bkUhLL13H3VmzCowCQIP1tE/rcf7nkIZ6F30kZUS3V4GzMFqJvFVqePAvbQVEWU0
         wOHSsvaSKUePT1fcajlBFW7V8JtkdVzLmOoR/jNYLgYdwWjD3GcjerldYB3CQw/vWdp0
         T8ZlRiYcrxQXtCF+hU6VPiQ41N7g9H0Mz7PSCPe0CIzZfTFFT4jSkUXUsubMfdnkkGrq
         J9ppXS/g+znJl/LLpkpW+V8ZD9XqPo3MIwhcjMeniOX99PAJROjypiKNfOmhdd49ADDt
         EKr9V5v/stqz+fbqyVvq1dQb+tcgiGFHP0601ZRCJKCkIPOqAM+nI6Ex5/YvU/9Arlfu
         vyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734915559; x=1735520359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZiA8+8cgK1p5p7ZdtgnD9VuQej6yYU4CGShpBV3y6M=;
        b=LRcWG3WNihHOrIi1kCXmPQnIWn8EB6q8K/LTQ4jR3twI7FpgS7I1oJhNRrJzNhjNev
         Qp1gmSRJhjQ3fMNallQH/kMo2M4RzDKZNl+CYw0v1oEj/BIHOMo5tGcl0YjGXRz4z9Or
         O/Qc/HOyzP9ECoEaNQwL0p43YtHj3QgjsIjdpSiAS9CGd/+QOp18we8RMqC5/fFM4zwe
         E1mO4KbVVHSnde04wEatuvIxpzLObYNojntiPm5FnCP/c7PvLM7errbxh0RddDx/3jC9
         u5hiaRZ8gtR6lsWp+FDIJ3jL61ljB49hZJz6bJlfcxzOw+ROiWxFOCU40FmvraUyvriS
         f8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkWKfqW2GEAEBDynaKd4jlHpD5J4HS7wbq+YWrNTLjwPWkBGod9JtPjtig6wrqU6J3/VGEkPCCM15azr8=@lists.infradead.org, AJvYcCWXXn9thJIgwdc/D/+qLXqa38acn3eHzcYsYfXssGSRn1hT65BsO4ZM9DhVTDCzSh3nc1w/gD5dgi2SrsIUX5cV@lists.infradead.org
X-Gm-Message-State: AOJu0YxcVdAqO0J8NZkYIxS9eVRysCprdElpyUtohubF19Y9fdnssMcJ
	f6Re37ZOejzgFU16Av8DJqvfrBZbDBmSQTZKTV9uregxEufdP9NE
X-Gm-Gg: ASbGncsIvxg7nqck8cbwGOYWSZSAcIOsvo8w7buTMJXQSsd6S0HkHbWfpjDAOF/bFO6
	Gx3N8CyMWheaK43WELHjlLVa7eM08V9HxpFm2kpAJOOmo1Hn+JxqcOdJMwt5jTjKj/ZH/pEcWQ0
	pr1LXFc7T1kOFdG+M5s21A/W/KPsrJNYET3dSBImx8vdjdTeMHws+YIknaD7yYjYOZoBdaF5Hu5
	zD9WsIsy6ow+U/4uCdgCrORddAvU5Kc
X-Google-Smtp-Source: AGHT+IHSkClTiIOMU6UV3EvrSaxtK6rioCiVEHPiLA/vc1hX5NvNNm2L1qNaUclIZVtTYbzu6LhDcw==
X-Received: by 2002:ad4:5ae9:0:b0:6cb:ef8d:b10 with SMTP id 6a1803df08f44-6dd2339fb2cmr222084936d6.39.1734915559348;
        Sun, 22 Dec 2024 16:59:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181bb4b1sm39250996d6.78.2024.12.22.16.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 16:59:18 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 0/3] riscv: sophgo: Add ethernet support for SG2044
Date: Mon, 23 Dec 2024 08:58:36 +0800
Message-ID: <20241223005843.483805-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_165921_240587_F83249A8 
X-CRM114-Status: GOOD (  13.37  )
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

The ethernet controller of SG2044 is Synopsys DesignWare IP with
custom clock. Add glue layer for it.

Since v2, these patch depends on that following patch that provides
helper function to compute rgmii clock, As for now, this patch is merged
in net/for-next
https://lore.kernel.org/netdev/173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org/

Changed from RFC:
- https://lore.kernel.org/netdev/20241101014327.513732-1-inochiama@gmail.com/
1. patch 1: apply Krzysztof' tag

Changed from v2:
- https://lore.kernel.org/netdev/20241025011000.244350-1-inochiama@gmail.com/
1. patch 1: merge the first and the second bindings patch to show the all
            compatible change.
2. patch 2: use of_device_compatible_match helper function to perform check.
2. patch 3: remove unused include and sort the left.
3. patch 3: fix wrong variable usage in sophgo_dwmac_fix_mac_speed
4. patch 3: drop unused variable in the patch.

Changed from v1:
- https://lore.kernel.org/netdev/20241021103617.653386-1-inochiama@gmail.com/
1. patch 2: remove sophgo,syscon as this mac delay is resolved.
2. patch 2: apply all the properties unconditionally.
3. patch 4: remove sophgo,syscon code as this mac delay is resolved.
4. patch 4: use the helper function to compute rgmii clock.
5. patch 4: use remove instead of remove_new for the platform driver.


Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 105 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 257 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.47.1


