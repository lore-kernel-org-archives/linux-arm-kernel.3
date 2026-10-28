Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70130606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qc9l9/m5;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CZuPkQSb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=; b=qc9l9/m5W4mlTGBHgTLWjZ2YRs
	6OC9FbJ8zbgsLb9IIK/2bxTb6O8urHJfwC54GyyWqy1OiMzjUF3Jf1FjqcFz6rXIXPmp3rUcBoJE7
	Pyh0M1ISi0t5AkML/wWnQl+PPT8CaFIDp8tB1oQSXvD83X3CbS4tpBpf7LVmxq+xTpe9Pkqo+cTBw
	uRDZpIAcZP2nu23ZtmFBgtL1X+1PX/jxIs/aZm/hO6KE+vR9EqUhHbXavtE6v6oZIk5WQmVwJfvR9
	I2OKfXeHWAp8XZIjiczAXIjyCpB+42iCjb7R9ra1+9ZbhJQ3+WGgEMSeXwU4qt6Gz4UrRfzD70jyR
	WgwAwn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1ML-00000006obh-0JG7;
	Wed, 28 Oct 2026 10:58:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1MF-00000006obK-3Ud7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 10:58:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so5364995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793185092; x=1793789892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=;
        b=CZuPkQSb9OMbxSUGYM+g024r45Hn6klhIjQ8V8/z98soWKVENucqHmKuiSaRxT+eF9
         4AbotjlSNTZTezAKQgdvIz/RcgBkjsfJavJl5Mpk0iFUJ54ekdm4t267m5/xxfQq0U1h
         x0Vwab50mBk0T/Jwv8blE2a956N64GkPVd1v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185092; x=1793789892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=;
        b=KfnxhC13m+PUUa4Za4AxNIzT+kbCf5Srnao5qkqjB/GFQHL7FRKmPkCqugdVK/uU6t
         awuW6PWwVx7h1H8kHPDcV7gz28DcHhY6WguY/LrcEHU0j1osTDIqewuA+41xDh+F7GFm
         W8wbFIAne3KNrtVDgV4Vhn+s21KNmYk0dsKnO5jkHNDtU7D7oQUpdjeAsaAkTT1RzJJy
         vmEE5D86A7QtcfqLbtoj+86y+m5mMFcivt4VN4Ek749PEdqT4wA4TcFjvRR5L9sUsEVm
         c3mjzbgP0h6M9ITKTXr6EUEhRYPnOW3OzbMlSjqkw49YOpLHdxguy1GiV7/zbsXsHSYA
         DFew==
X-Forwarded-Encrypted: i=1; AKwUvBwEwOl52sWZWzY+fZJvEzguYFZg6BQdNFhyIu+6kb7Fok2P11N2LPb9cBL14pSvCtOz6ctjuXeXhmIwwW27TICV@lists.infradead.org
X-Gm-Message-State: AFq9FYItP/Jh+trfVXmAg/n5a+5lQ/upESPFugxwRmTIIkq8uP1MOCYz
	MY3vMKh8p6lK5hg/Rhlzizgq75P9ZNtHxjT2cer5tPLIyfvwX35AfNFKar82VWo0nh8=
X-Gm-Gg: AYBFou3a22nz+Or5I7xeM8uRcT09/jkPcGPd2TO+LsX/XCz45CzZP74TErVDglE1ZEU
	EWLOKKGAFv7rr09+X2Ttrg1gY2Apex5cLFhu1N9He/qGtZ7HtGXPc/1ZBD4hVyWqcdP0OiK7477
	5VHTxZTKpv29GZnnOrEFXshYNbAY9JjwgdNfi79bDz6HpRTyCkZmn799Uo4FH6pjOtHdh1udVA7
	f97BYRzFvyjZNKiT6bm2atMMqMs2OCyynknu78kAjgWmOiAs+tEeyUccWpcCpGOEhttpnl17Uyd
	+fnylKte8O6MhZrMRNhJ4hmQ82j8fl86w1Su41Y31R4esieuhYpBpQ7Xs5kudOMz4uxlJyD9Ck0
	eHfGGl2sMSB06ht32g8tfov9BRM5FLl48aOx1McOCo70LjuqKKeBtKbWmDRNZ2Wbfi82taHd3CS
	bQ8PzMmbVLaG8wbhQzC8v/A8iEoOBsW6eQsUlRF8+o+Sc8/BOICkOPnvY8S4XVooWWdPhsL0eBg
	yTvX4RwU8jfw9/AXu74T+1A1yLzw2iMPy3b20WuDKQf24hoja7NUB5lNXS4Dvbssr7j8jHYsfdQ
	CASAcOaINlgy5ZEsrEliw/nQYBp2TQTX8tDCOTkzrmimGVqBx3FQUxVJ5xF5qYpqo4s6JRur9Sz
	p2xhndnjj2F0d0IBgzfhCNhGgLmMponl1i/o4ix5gafLI1iD2pVira8A/GVIOn1E4rHxMtWY=
X-Received: by 2002:a05:600c:4e03:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4a9640f217amr38505965e9.2.1793185092065;
        Wed, 28 Oct 2026 03:58:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42ca77sm35782785e9.8.2026.10.28.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:58:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: add firmware reserved memory to Engicam MicroGEA-STM32MP257
Date: Wed, 28 Oct 2026 11:57:40 +0100
Message-ID: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_035816_667222_48DC5168 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The first 64 MiB of the DDR are used by the secure firmware (TF-M,
Cortex-M33 firmware, BL31 and OP-TEE) and are protected by the RISAF
firewall. Without a reserved-memory node Linux allocates pages there,
and the first access triggers an IAC exception and an OP-TEE panic:

  E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
  Faulty address (IADDR0): 0x80000060
  E/TC:0   Panic at core/drivers/firewall/stm32_iac.c:212 <stm32_iac_itr>

Reserve the region, as done for the stm32mp257f-ev1 board.

Fixes: c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../boot/dts/st/stm32mp257-engicam-microgea.dtsi     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
index 5b4287e86def..6cd64587ecdc 100644
--- a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -19,6 +19,18 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fw@80000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x4000000>;
+			no-map;
+		};
+	};
 };
 
 &scmi_regu {
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32mp257-engicam-microgea-fw-reserved-memory

-- 
2.43.0


