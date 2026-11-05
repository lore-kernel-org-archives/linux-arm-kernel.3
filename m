Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C7606D80E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3SZlq4cu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=R6cyamQMSGS+vKmEK5CyaNiN3MV88pM7I1W9QX3v1mg=; b=3SZlq4cuHdsZdOojUapa0b+Hpx
	dlgGeqYgVuseW9sidAeG7DRaXfqM0nXaTn2E3bTxu8Dl+TTYdWfSNIB/Ovo4zkg7FWZR86WNoTji7
	M8KYd6x1S6krl3Rq5R0vkA6ncW7mUnuKeN5h1tQRVIH+AkYmPoOUirB5iYka60vmai4Zxn+TEkKDw
	9nyLlt+oU+X4XKcN/5QNrlpbt8eb/cUerqPDpPwumR8OZGetlWjqWJNipDAWUTyY0DkCoDMAgrsr+
	bBC91wNCqMVk+9viy5NSBPOCPMHoZ8amq8iO3OYaBL08DjyCoZfNgoQmgxxpBItp/eQqFUWBauCOG
	JiVV2TSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJd-00000008OAV-2G3S;
	Thu, 05 Nov 2026 10:03:29 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJb-00000008O8u-2fsT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:28 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so13611395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873005; x=1794477805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6cyamQMSGS+vKmEK5CyaNiN3MV88pM7I1W9QX3v1mg=;
        b=qf7fS3JcMjmNKDdSZ1rCNUbvjDkL1FzdJM/2ruPqilSsrvVLNYSUABalCMTKeEWi+Y
         VXmF7fx43jdXWzreetd4WMbiJO5dziQlUpkmUV3bDz0CnSW3rO622ws3K7ftV+PDNV2O
         55i69pZbNCs7ggJK25OoOa3a5fF1pQj2guiyuxrEKOEqKN+bcb60ywxxPrp6RLC/acni
         kGz6XNY7H8VgyNdSaxvWBGrosyvGoKYQPc2JY6WmRftkt1AKkbNzkttn1wfcAxO8t6aM
         BM2uB3fA9qEFJVjrmN/i0JvGeNmO0lxKhx7JACXmGgOrBAcv8bqohitmCzjm2TMMXZPE
         7yrw==
X-Forwarded-Encrypted: i=1; AKwUvBwU4SIkOKX4JkXPz6K1Jiz46fyh0IsbuNbMxdAkb0P4MKqpEx5bhU1iF5Nlx9XnKHHs2crpHYzf2G3NwKvp6Nrw@lists.infradead.org
X-Gm-Message-State: APuU4Z+eOeHJkgGYrKDYs2JqQKHMxmOifZmRo6TY08FkmNK+/f4aB/aq
	gd2CcelnyHGsihmq+AmCXuW5sCDvgmrf3pMSmnweEXbjwtaq6mk2tVZJ
X-Gm-Gg: AYBFou1mL9a4l69GzbthGGUYnh7/DsxZHh6/THlXwomUQ666bdLdtjCdE0ioBHyuAfL
	ovi+fVtSNuOVZG7ipg/5ZiKtO97PKuxsmHDLxslDtQPg3N50yUCdrkBD73O2hiXi4gzY1uR1wIj
	+sVVpO/iQ6k5NnMbGnpRlzPUrIBQXfuGXBUUBGkAhUaJhQFGVIYALgxZJlZDXneRJ0Mkk2rR9U2
	xKSGXkppkwjKk7/1D9DLQSMtpxSatX0Eg2v1Vrqs/NyNuzPnuvNvJQnmU6+isIiZfxqR6KErrt1
	A6kmSJ8Qmok5nP1/MPOlI19kGzgHKsDWla9FB6IOo7QJvRhAyoMJpgWq5VDu/7cO+t75EKS4wFo
	gyoTy0BUrzZIQxFJbi7W0JvTUUU2z8hqzv0GkxvAXzcPzIDvmGb+DPCeirzpyRswPmT9UiOB3k/
	wrigi/8gI3ea2oqmFK5ngKqNdXs1o3CC2L8oKaZXRXw1vUpyfTtRrMq41XG3ff2wPbLhsi1ncBu
	hxH0eNQbrrAQfoQ3ICiFe1TKvWosUNv7gM1WB/KC4h8PRWGYQAvANhQDkItoS0jc6GPWMfdjI7m
	gsYwWlfip/3Dbu1XciYdufXa5Fr+BzF/SZPTNWz5Uw645jOuCBACeSZaKiRN8m+yPw2I2J1U4Kb
	t/j5Z3MDPooCfSVCTGJx0rK3RRQ==
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr211533235e9.29.1793873004567;
        Thu, 05 Nov 2026 02:03:24 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:23 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/7] Add ethernet support for the Amlogic T7
Date: Thu,  5 Nov 2026 10:03:15 +0000
Message-ID: <20261105100322.37816-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020327_691612_78F87927 
X-CRM114-Status: GOOD (  17.26  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The T7 has the same ethernet glue as the G12A. This adds the binding,
the driver support and the device tree nodes, and enables the port on
the Khadas VIM4.

Two clocks are new. The pipeline stage between the controller and the
DRAM has its own gate, which nothing else claims. The glue registers
sit in a block gated by sys_ethphy, so far claimed only by the MDIO
mux, which probes after the glue is programmed: every write to
PRG_ETH0/1 was lost. The T7 node lists that clock as "pclk".

The delays follow ethernet-controller.yaml: phy-mode is never changed,
the PHY adds the 2ns, and the T7 accepts only rx-internal-delay-ps, as
fine tuning. Its TX side is a quarter-period phase selector with no
small step, so tx-internal-delay-ps is not valid for it. The VIM4 is
plain rgmii-id.

Tested on v7.4-rc1 on the Khadas VIM4: 940/941Mbit/s with iperf3, no
CRC error.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v5:
 - patch 2: the T7 block follows the Meson8b..G12A block instead of
   splitting it in two; default: 0 for rx-internal-delay-ps on the T7
   (Sashiko). The explicit false lines stay, as asked in review.

Changes since v4:
 - patch 4: the old delay code is left untouched; the T7 only gets a
   callback of its own, and the probe parsing it shares validates the
   RX value (Andrew); no NULL check on the callback (Martin)
 - 0 accepted for rx-internal-delay-ps, the T7 joins the G12A list
   (Andrew)
 - comment on the deprecated vendor delay properties (Andrew)
 - the MDIO mux and the on-chip PHY bus start disabled in the dtsi; the
   VIM4 enables the mux (Sashiko)

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7 (Andrew)
 - 0 dropped from rx-internal-delay-ps (Martin); vendor delay
   properties explicitly false for the T7 (Andrew)
 - init_delays callback; patch 4 renamed (Martin, Andrew)
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works (Martin)
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands (Martin, Conor)
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - T7-only delay path (Andrew), PHY mode from
   phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps checked against the hardware values (Sashiko)
 - vendor delay properties not valid for the T7 (Neil, Andrew)
 - no max-speed on either PHY (Andrew); VIM4 PHY interrupt on GPIOH_6
   (Sashiko)
 - the T7 node owns sys_ethphy as "pclk"
 - no longer RFC; Conor's Ack dropped from patch 2 and Neil's R-b from
   patch 6

Changes since v1:
 - the driver honours the generic delay properties; VIM4 moved to
   rgmii-id with tx-internal-delay-ps = <2000>, Neil's R-b dropped

Lucas Tanure (7):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on
    the T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 78 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 90 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 61 ++++++++++++-
 4 files changed, 236 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


