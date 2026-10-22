Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2180606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0rkyjiM2;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=Zt3j2xfZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=; b=0rkyjiM247e7us2CO9KPV1ifsS
	HCYDTCHSFiWI/k2RkorWvM4jlmGwWXTbBrOSdUaPoLQWRx57nYA5JZnfHDM9SF20blwlw2CP89mYE
	6XFojc4I23toA9M37f8DinzK+RhTFq0ptW7590OCR9c8IgOIsY8eBRbP1p9YYABPU/plzCeuZY6sK
	8CDVsVF63KDZwGBwQAFfbJBOYsU2SPtrQZwb3NKTNqpXTNkf5ZJFOW489hSNgW+TaGLkmhFSsuqEY
	7X1NFkrk1XFZRtzs2gy9loH4lpED0021crO91XNwkowJaOPvHUF2ru1k3WRX++iFNbK9UabAojqCX
	o6yc4WTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtNn-0000000EG50-0M1r;
	Thu, 22 Oct 2026 14:03:03 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtNk-0000000EG2v-1or0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:03:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dc202a60eso997239f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677778; x=1793282578; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=Zt3j2xfZm406z9M1ZmCEK/pWFGX7zMQhh5I38iuO+yKLy0HLPLRxcTHxnssgJLyNdY
         jeiiW+Qz/uPrOwHUOLvncfJYZv78i6YXa0987Vo6ZWgPTqQWaIRFMrfznEPWz89IUmGR
         csl9RH2BidRF9PhSvu5nkDRAzCDeN6GkpuJl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677778; x=1793282578;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=Im4Auwwoyx/EH0esA2epdBZLdu/N2fkcVirczqSV1V+lRx9RNYRJ1mr4CyFItXXTBo
         s3yZZY48teAfCpcUYKospMMK+QhUQy5vXcmOF5vPiy3jA2tBNnFWJfg3mTPeiRNI/u0T
         PL7irWBV+eS6ZOCck6jVBRVSPSQlidvfByiudQB2yVoIy3UTXIqDtK+lv6ABE25l2gjN
         2YJxNM0TCyXknVbdJJ8Jv5r5LXWEvjG3UNRcGANexd/iybqaNfXIn7vtKnW6W4zCo8Fs
         Z7yOC90CE5Jb5KrFiYY3YvCZEUdZ8CIlN9LPPSkuuVeQnPhdl1+om8jJm7Qi47KNJ1/9
         J/6g==
X-Forwarded-Encrypted: i=1; AKwUvBw26NMYjsZ/ktI1m4acrrU+Rp9OvXzUmNfYPPAZQpVSE5mZKXD778e0VhrZKgfqZy11eCzjtp+6xdoYSCN+Bgct@lists.infradead.org
X-Gm-Message-State: AFq9FYKOU0YMhHmLnRALGI5j6fUWE5bEgD4Jn6J8+tTA+FKvTU0Z8ca2
	JILGQt6yPSiCbw48yPUcZ8NLPPRY5R1bHK6PIUka8mxiCNtjQ3Qoxos2DBv95ERTMRU=
X-Gm-Gg: AYBFou0d/bh6c9VyW8xU1dTLYhZRF7Sl42Y3s0H5I0D/DV2anC2wzYBoXJhZEX79+po
	lzlPwa6gDGjTYzTvqFqPYLluVRzj8iIWvAbUKX6wHI9jfFedCL0TvrIOGPDyfLbGb0srLTtUtv+
	KZOiIniR8MIzNTEq8S/rqXItup+JK7P//38toeEKhpU5hqwdEauPXpweQnb4KrjtR6OrCUkDEyu
	Q/VADuGlqNZEpkoewxJ2HDHl86kPAiJzGQcysw6n6acrsEw5um0hXoXjeZov9jMSfiOsMnqp4aC
	2t0nHWmjlcv9BhfuCxp6YPABMB48apmt4ZSghj00A/wfnzqujqkrGn8N8JGTD+EOz6zBraUcXE2
	5JyxWncuT83PSwteApnzng5xMu6Tzo74p372U8WWLFZC5iQ8BbeAXNK7vhgFn847linqpaZDfYU
	wGg1kvvLA1/lczZBe7loJ7MX+zhFWDn5wPaoq8utcpgsO3o7s6E4Gk9sXT0Zf3deibyEoal4j1P
	E5p+808HiRoEKHiVbc0Umtb542RQXUeSfd/0ykRv6rBUIqblpOsDRInvwK9B/zq8IWpVVUE
X-Received: by 2002:a05:6000:2612:b0:48e:7fb:aed3 with SMTP id ffacd0b85a97d-48e264a5a5bmr11406983f8f.17.1792677776798;
        Thu, 22 Oct 2026 07:02:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:56 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Thu, 22 Oct 2026 17:02:41 +0300
Message-ID: <20261022140244.3476844-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070300_512603_B5C1B6B0 
X-CRM114-Status: GOOD (  12.55  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v4:
  - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
  - fixed the halved LVDS pixel clock in split mode;

new in v3:
  - used LLM to cleanup most of the errors and warnings;
  - proper use of dt-schema this time around;

new in v2:
  - add the tag from Conor Dooley <conor.dooley@microchip.com>;
  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3


