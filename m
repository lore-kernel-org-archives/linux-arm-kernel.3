Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E27606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1RDUNmuX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fiSCFGwt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=; b=1RDUNmuX9In/4O
	C+TwNaaYL8GH3xuxJ6XFVqx2doTzdb1YoCRPROXh1LKvnv3etkOkVH6sFyKzcUQZdGxhgzzsuk9iz
	XKVvPueq2eEHJ90mNleN9XX/W45LvnSnry6fmbIe55GRbU2nziNq9PD67d/QoRe9fPIp6rf6H09V8
	ZZ8PHSa4t55bO7yMiqgCyCYTJc4uwK1fQwDU+HoYbHjKp564IrqSx4MdCwBMwMkUh+/H1hT0nf3Bj
	4FaYWeoEar3nbFhh2BALC3UFaq4pjq79X5+Aws8Yf1+oaFoYCnaVUoeeOmS8B4bHUaCXTogOsoEsj
	/dHaeJFUkNGQp9R2zMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKyk3-000000015ui-16QC;
	Sun, 25 Oct 2026 13:58:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKyk1-000000015si-1SJZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 13:58:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1253026f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936707; x=1793541507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=fiSCFGwtrWj668qajMh0WxOfPFZjJvHyXqfRDV0jGzKvzaVGDHt9Pul5G1pF8M1Nyd
         Hyh5gSS8PEQ+Y1xa3IHZ4XBKvucU9C3TIOI5oXxnraqKG/BhgwU0I5U21950KqPIzkgq
         Meft0tqhb739/3LRk1PY6IFHb3v94EvOiclrCoGE30MOwgrKPs1Xg7KF+zihHeUl/Smx
         AXFLTS2wKvLEjZMHfnKyy+GJRxNpw5QwXrzUXZk7n8TMBTy5/eGHKKS4xD8S02iUV22T
         yR0SFBNDMP/TlupgzYHz6FmqS3leffQhqo9jpn02/nSOd9W1v6sgN4HNgzuc2goK0ubn
         LiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936707; x=1793541507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=v6lhfr/aNElLYCy/Z5LCs/kNK7kCEvHoi83/Z33KCFi9oEQDS+7+JWqiOn09YCNRg9
         pHReZ6r+977T1wGje6275uTc++vURmX1hLdz2Piuq48gJqRnMy/C13DNS8KAaP637gDK
         M84GsSuM9EfNLPOVkrszLkgg00tZKQA4l+j4Axidev9Tg1aGzaapBnKeudMoiYhI2ghQ
         FidwIhchSQ3W5/Hvdx6eKOsgyjA2nTuV8qKhgj0S2QlqscJeQyJueoLUMn9bBd64EPKH
         mFgBnepzTEXmTcEDSggJMKm9YWs66JYzC/q1HXciEE1sWsp03P3EmBOipKpf0cWt9teL
         vtEQ==
X-Forwarded-Encrypted: i=1; AKwUvByM6A5fyai+xr1NB9Rkzuv1u0QLwWAhUWigZb4iM1nT85IPiSj6Ic7gQYCaSkQlxro02BVIKrDRGHp43GkGEo6f@lists.infradead.org
X-Gm-Message-State: AFq9FYLMb3v1FqI3n2ZT6vO6PBkA9aHkrBx/ORg0q/TXlDnMDun3NdhU
	2B5l34Jw5aHbgVljYLhWc5cp1YR3Ax0QTSGaug9tIIiXVnYCg43+u5HQ
X-Gm-Gg: AYBFou1IGsGwJeWeoh+b6qXLMVK7Nt+a6CM/SQId749kDTTt68yVMWfOAi3Ijp+esn3
	vbFpEo8FMY8o5ELZWaqZ/sbSBq6nOvxP3GC2Bt1nAHGeQZaWjP3lCs0DXwudfipKgSbeoQXGbjd
	AEPZRR5ld5SCDpzJ63gJ/yo9hISQJ/EJgo3TEyGrxHpWXawE6mdDaTxBfSTdKyQGLIeO1PdCAEG
	wFP/fqxPMUowMNSHL3s/Jdak9YTfCoaa9pF4mQ/MSugTCST+8aOgW6MRjb413dhrS836zxD7UoV
	NPm38/oWaks4SBZnCu76XOUJpfJxbyv5y9pRBnbCVf15cDvWG5Lr7vL+CbmNVDd225450zdrw9b
	vIGEgTVzJIxC2wiyZv4wXiXeAThRyrtOnv76+gX8HCMAXk7NtznFxIjSVxtuht18aCC2A+7CCtR
	POzgj0pWUSeUTUZmvFWJTxqnkSsP2+KoQryTP8XMtrr2OCtY3VlGI9qnG9oXzjOL1pNMPkmPsut
	Rsro5rQjtx3bfjFbH8/FLGnDlgy4ZvHcHA9hiDriDCTb3/v30ua6huMpD6LwvhWcO4Ie8WXip8g
	hLWSR6wf9uAoDQ==
X-Received: by 2002:a05:6000:2501:b0:48d:f14a:9173 with SMTP id ffacd0b85a97d-48e3eb247a8mr7109194f8f.8.1792936707263;
        Sun, 25 Oct 2026 06:58:27 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Sun, 25 Oct 2026 13:57:45 +0000
Message-ID: <20261025135745.102970-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_065829_407041_C5B92A39 
X-CRM114-Status: GOOD (  10.89  )
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

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0


