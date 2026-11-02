Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0176E6087606
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rhPc5bG5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9hLr2RG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=; b=rhPc5bG5DuEMV4
	N3yQJsaL9HCKS9jJ9tVOgWG7srHnZ99/ExB5gQYow17TFQBW1iVXCsMckp5A/LkH8+IimYVLSDRrv
	cbDQv4QYz0ahQi56UDHpRGk/CY0gc6AyXVXF4r/NBIBC9enE1f9B7PSiqy07/mxIzapoegu/tS5DB
	f0uhuC2AsISJoEEOVPlfDbwKi1i9Iy5VaNM8RKiIE95wvbMu64UYsUeaEMm8UPo1RdPoGih4nBfio
	+MO25XQR/RQtlxYUNUuaUwTA0f3jPOBK/q786ljRqojXn1FIPkdtTQI5PTX/O2dgvw3YP1mGx9qiI
	PKygQy7mfibUVhXQ1Vtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgV-0000000HQaR-0LY2;
	Mon, 02 Nov 2026 17:19:03 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgR-0000000HQYD-3cLE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:19:01 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-3550c917fd3so4496993eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639939; x=1794244739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=z9hLr2RGGgL5CSEenEcW0jrSbQQwKfRFLTmtfcZP0Lz22yggLjmomKHlfGM1VMhl08
         AjfLMWKiIF83QuP+F+fF4y8/JyIQRluq6p974oAZAybPjnug4vKeRnCkIk8EU01LwVb7
         Lc50t7PnzdWy3f82Xhi7dqddKRxcYGiRQycQ3uBti3XZ7CL/TmFuyk5rvuA6TJQW7yMR
         JHcXNXhQyknPGWjST92luPvzWKKQyV4SGMq8/jqJItGZLAquXx3oON3SVCOxosr9jrmE
         DTt/D9WhIVId/xOzl1Lx8NNBm+9VE54mMpsh3HLzUkp28P5B4FEYJ2lqPlXJ99nB8Qdr
         RVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639939; x=1794244739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=0ygmdsD7/s3pqRKXQllwupWxYaijW3BSbzzt4xce50dxnqWD2PAeqQ0n98U7Iv1o84
         qHCDRrA/BTGPmpGvAdsdPBsXNsscyQDbSxXrBzJS6zFhsSe1KVzU35WwhKw/Xk7p6kDZ
         BJzzgQgLTdr4ncGIzBdmZsz4iN8enLGCRvSy7ablQ+NOSCrVY49uCq4FQDcx2bRKtDpr
         Sh2oX58WXsEhHaWLV5/G0tRvYezrydjH4FDePv4tII5QY3aXw7ntxiFJIqeW7guJfAkW
         zRlHxivxq+YVVJWWux+so0SY18g09uDL/OURkyhmcPCMJ9qouLbhHLEQa2O/CDkPDEqZ
         jPbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhcKUoikKipnVMWPPr0qddsPUSWRKZm2rEhMQQLdpmCxoDfcYVsrVTrbKGJTMzagg+l4WrLgCxGN25M2+2glCg@lists.infradead.org
X-Gm-Message-State: APuU4Z/ywA2//A8W9C0Pbw4VDc1WMo8Tb4GdIIyCy98bFGKJIFhCNant
	6X0xGsgek9zrK/RrTW/dlKigROpNlgQhuw1637Qn2+t7kxA/M7omFaDl
X-Gm-Gg: AYBFou1nwTq3S7lhZ5ZHmwBTar1bj5l0fHKFf0zEuNPifrKil7NfCn526gD725cEdes
	K+D2tXS8bN6rxV5soZMT2eAGtPt8NS8LK0OjuHIyIG7KjgndpYZvupeTfJbdra3eFe8CacUY434
	v3Qj0e32+QWrLlv2wvdi2V2u4WvesxOH4+Zw27XBifOqCpJsjLIrzO4A5VKCnhxYDdgtEE/UkmC
	ZlWXqKEKCmCWVHgKAQlX7S0dNvmKDCykmIvE0oWa1qAtWwsHFn4b3AFf/TQp229FiIUdW10nFam
	VDQpYkRtZfRLZ4GSWCaub9YMefmsPHJweZsFagmYPJhuQLjUgPz7DVX5q1Bxqwd+1nq0p4njIsz
	KeBtSmHxnmtG5agwo/VbbPRY6cg75BOhX/9JvHlfOIvKGmvq7Jc3fBCQxKk/qpldO6XQhRqV+EA
	dfjgSTbUv4W6wBc2nr4Q9HhuaZ44bDzsxbw7GMUqv9plfAOAYR+bB851biaRwsy4URj/y5m6sx2
	9/lb0ySc4vMJJtoZNv18qNKgCQuZtGyv9IXPSWvSwoTXBe4olTDOGBGRpgdrCKOfRFiVAbgPe1Z
	0vv5mfh5MjKkha4ipKvZmxWbfAY=
X-Received: by 2002:a05:7300:fb02:b0:358:5bc0:4f08 with SMTP id 5a478bee46e88-36a425f611cmr14286162eec.37.1793639938712;
        Mon, 02 Nov 2026 09:18:58 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:18:58 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 1/6] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Tue,  3 Nov 2026 01:18:33 +0800
Message-ID: <20261102171838.2958552-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_091859_894402_47827347 
X-CRM114-Status: GOOD (  14.27  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both GMAC nodes list SCLK_GMACx in assigned-clocks, but only
SCLK_GMACx_RX_TX gets a parent in assigned-clock-parents. SCLK_GMACx
therefore keeps whatever parent the bootloader or the hardware reset
left, which may or may not be the internal CLK_MACx_2TOP.

Add CLK_MACx_2TOP as the parent of SCLK_GMACx explicitly, so the GMAC
main clock always comes from the internal clock source and does not
depend on the bootloader state. The rate assignment is unchanged:
SCLK_GMACx_RX_TX stays at 0 (managed at runtime by
rk_set_clk_tx_rate()), SCLK_GMACx stays at 125 MHz.

Fixes: 156a530ed5ed ("arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
index 4903e32d0ead0..d94bc34a31e67 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
@@ -268,7 +268,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -284,7 +284,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3


