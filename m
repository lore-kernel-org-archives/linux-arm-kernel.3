Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DFA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hS2GyQw4;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=gnAMqQCB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=; b=hS2GyQw4UmXyVOuQRc7CbgJ8iq
	JmJYLvp0eIbA5es/Tq6DUsQa40KVP4Ski1asCh5TkcF80xS9uDLp8peX3fDxtiohFVaRwFXtg2xBH
	3E04h+a0VnbEFaOOBifR3FiNBdLbSm3nbAAclx02ruYbQmDQw1ODvSqWKt9aEw2+7T18rNKrwnnWl
	FPP5hDVgxq00y5kP6zZy09WQlqFMXMfakxYmqZEH/IefsSUo1F0c8lsn8kNsFx7msp31fSmehxjm5
	UNxEJw8ZyH1ppYA1N4ERXDWpdS286jDP6pdKiCSR6LdWHetvpow6Ct0SWczchqAER/GC6g+ztIoBY
	oGYw1+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSW9-0000000BTok-1LUn;
	Wed, 21 Oct 2026 09:21:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSW6-0000000BTnb-3YJs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:21:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so5593025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574509; x=1793179309; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
        b=gnAMqQCB/JU1dJEZnuMnyGQv5ieXB7jSGqrGorukYLS/O1X1J+es27T62bFBPkpual
         TQ2h9DhsPzLEYpbBDiz9U61JV9OAL99n5aw7XH8xomJHNyYRJfqNlKfIrCCreGG5EpyO
         MiK0UXileR9kAOiZRJ9P/YZVrYuoDKtae4bkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574509; x=1793179309;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
        b=WLRUEMythrSn1WKG1SSyqM0+dB5sZQcQKyimGwfFii4BJYpGRMUxRwTcuDMVeYM29e
         CXq4whl8BA1MXIpyCh3B0FvW8mHz3/1nW85Jz1TYc8jhLAhpGIWd6mjLkQjbvPuRTVSx
         Cc9qLebVBK12DMdi+aPlym82ORYSjgINlVYBAmSPTuRACIFQsYT2LXC8oOJykgQbt4Bd
         ZsQtHEP/0E2fByQ/mWwB8YoDQe3ssyzI9+pc+4StuUg2JxSXFQ4QviP3Il82N7pCuCGp
         nYvNok9Nz815zcjtq0gbbRXLhZpeGpswjp9NPj3uHtfVXaWu4QL/d35KwdtZrIsIFroX
         PLDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2cT6C8sGd0+8kGwDyPwQnW29WpJXVj9qkrGiUlJI0fZTzmz0FFJUefpL4w81AS2K/KQMZdFDdRTkugradZazm@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5WrtupLVHOnhWXCVJSNnwiIy8q40w4jZKJQBnaQkxLV+OjeLW
	TIawkBdZWN9zX9zqybS44nNe11jFHHZs2oY7IBefv7596wUAAxA8kpjmmJzsumgH3T8=
X-Gm-Gg: AYBFou1qlqpYA1LigvPh29DV7ZXtjKF0z5lCY6Qurd39N3a1mnsQ4FM5zFFeONZg3ul
	bV4NYo1QfX02fNc81gUwROW08U6n/hn0Ebdk6yn/q3tmV4OyrW6BTMotLBOMj6mq4UM4pDRQWe4
	k3kX96cxS+3PVIsFq84awBAnRAUQDP4h2f1ZnqNigNyGVBVWD5qWttBaq6914I59yzeD3qVpgRk
	ZQYlRd11wpU8+NTdehUMkGo8jRRgi44kI6k9zeLf+OR4/CIAxwJqWnZZXUIwotjrb02ZQ/Dg7vp
	V6ISyf6pmBuuWRg3AZhUfRIoks/cg4l+Xx/RER4b3WXEji4vJ0tLafT6JIKXqyunTTrd2/7ceQa
	TGnixHLQh+H8H19AKbYFQuT1vYEc9+O6Ve3k2B7T3oPCNW/GOVgy0gJAAumUSS1ja7UtaZRvkQO
	eCJvkwzuydd6oQDuojxsa/U3r18ekps7PnA6dGNFRPYlImXmuZJD+0nFBKKMaHquD76P7oz+Yow
	/H8ff9DvOrHBuZeWA3k1EKs50jR1sVAaDnuR9eDzbq2jCKiLklLewVtKYxWfqNYl2/j4EiNVHBo
	zpoXH3J1IF47Gu27gQ==
X-Received: by 2002:a05:600c:6385:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a1fdb0d18amr28979085e9.21.1792574506584;
        Wed, 21 Oct 2026 02:21:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:46 -0700 (PDT)
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
Subject: [PATCH v3 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 21 Oct 2026 12:21:36 +0300
Message-ID: <20261021092140.4142493-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_022150_913340_8EC4DBF2 
X-CRM114-Status: GOOD (  12.72  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


