Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015C60A383E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YBEmeRvs;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OTPW0OpI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=; b=YBEmeRvs/OVbIPDdSuyPZcr1+o
	KjfJaaek2QhvX7sKmJNdqi4V8ujruyEuQf5xvKpVhg1gildvx5EsBfimUyRPQfjAHJvqIyaSDSCv7
	FXMSltFy0g9QeHFAwkgKDDaEvMySq3B5jPqrKGXbX5FDqQcPkj1rofxVx3aSkzURzre/uPxfqp5LB
	CidZfu5F2Qa+sD1LwbKOdp3u715jarYuJTqH/O32pjQmMoGpX6xP5XZUrKdQhpuf6wHKYgwKGy35d
	mD4LXr4dHP0/uJHXWQdyoZcFPzElQweNjsG2yCDDBobl3D1iLs9wIlhUGJ5b/mmG1e8mQ9azgFax8
	gtqw1/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSW-000000029IU-0h8x;
	Mon, 26 Oct 2026 09:57:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHST-000000029Fr-34Tm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso12136745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008655; x=1793613455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
        b=OTPW0OpIze2z1aHjHVMEolCe+3UFfMVcqZ8QI7EOaKYGocbES7TPVcmapXQUC4ZF01
         uqa5egcWzYQEDDy88hH/o8CgsARwfRxs+OPPLZ/BjuXq7r7N/be0MuqEwxBb9rpfnncK
         vtvbI7LN5YYO0fduEn7fe4WStFGHBJMGvzJthUXyh4vXFgaEoWZt4P7Wm/urRkllQAqJ
         vdWT4KvOZA/OX0j6Hkwykxw32hpbx4PTVFtzCSFzwR9L3lOHUT5rcGBZyna++JVwSaqB
         hE99ZAluEk36hI0Tx2Em12JOnK4QQ+a70HyDTGz3n3rl5xPmOVR/z6ZQ+fghCBsx2AmJ
         lQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008655; x=1793613455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
        b=B5F55IT/oVG2Mf8yrGaJm2pbqTx85rr0pa/DLp1Iv3lrb4Cl5azsb/cocf/Ly5r2ml
         lhb0R/mYxLdlBt8rwnx/XmPrEx7sOcYN7/T3YmA0Eracxtm8Aacgze78ho1BPm92uuj9
         bYaOv750ukd8GE8t45y7rzJiPDEdiqk6WnKn8Jy3eCr+b5OlhEv9SOzU6w1xC7sde8w9
         rskzLzwubLd1OCwau++Bfy2JpJtDmsPrUBGV/O2pRNN15L+gDf7cbV6JUT6fVAHy1FkH
         rP4Hb0DMhoaIopm3To1opP2+gtXtuA7isHJPD6bhstcESvpNQcnRlCdl82FLtEGHOI+1
         o2IA==
X-Forwarded-Encrypted: i=1; AKwUvBzfG5jP2n4OwdjoawEi5bfsP/ZPt8b8DsJ5tRn/TTizGP9ZTEbE9BWjpBhIyVId39ovKUB8jMcfifUX9XMQyaIu@lists.infradead.org
X-Gm-Message-State: AFq9FYIOkd5m8GUUB5jzQfBILRiGyD9ig8O+hsGFV+Kk0H2Ao1PzuuO9
	hmzfi0fKmDDXpOPImHPfz8vn10kOuHZWk47rVu5OGkn9HlgBp585fcpx
X-Gm-Gg: AYBFou3oJngctxBYu2LKT2nnLoOvsVcZDzDTHs2pFJ2WCnB6FukzobpcQPaSel1L2M6
	8IhmmPl8N+INi4bKypM4lF9E3fl0vQmoAskyIE74p6PT/XKEhNP6YFa3BiNP1jDUu+fDL0TZXF9
	3QOH5bXzg+/VX+vbGaRKb24t2L8DgOucKt+j9O9DctPZ0tBUiz0zC/XA1uiCU/oOsTth9tr2vvH
	c/vHlg07qfNFsBbU2Vhf7/ufSZKEp8zlyx8540GBPCeTJEsH60c1R21rwoOXLIiJ8kAd9oeAvnB
	M+pOS3dlygEAVM0WAamxc5Nxpknc76C931myoJdp+uiWC3S41cY21KcOQp+UVUeUu/aj5TYtvGd
	M6qP+wFqHXCT1Oe6nGB/bHvYTM+UvfgkxF6QGjyxovSYX+XrvyQ15g3MqGUvr4QhoELvSJUu+np
	c+E07iIuwzpesS2LXosdlv40tZzDhLX9oKR5kP0pwYQskrUiR2ELhs+1u2l86ZmVL6q8Y7nixbt
	BXQ8mdXV3vutl2nZ1+LsbPTtJLj5oA3PkGBxyB5bJ8p1b1lKRA6sXJfpH5PQEsivwnQjmMm0IQ2
	jt/34vkeb0/sQT+Qh6aCrP9k/fvGxGOxMHCuR5AqzxcyLRTtbmeAbu9zloNxBDfdWRd8wJArwOs
	hCpyRKw==
X-Received: by 2002:a05:600c:4e8b:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a35ac3cb16mr111294555e9.2.1793008655265;
        Mon, 26 Oct 2026 02:57:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] arm64: dts: airoha: en7581: cumulative nodes addition
Date: Mon, 26 Oct 2026 10:57:06 +0100
Message-ID: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025737_773889_FF64161D 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This small series adds all the nodes of what is currently supported
upstream for this SoC.

Christian Marangi (9):
  arm64: dts: airoha: en7581: reorder nodes following incremental regs
  arm64: dts: airoha: en7581: add CPU OPP and scaling nodes
  arm64: dts: airoha: en7581: add Chip-SCU accessor node
  arm64: dts: airoha: en7581: add thermal sensor nodes
  arm64: dts: airoha: en7581: add watchdog node
  arm64: dts: airoha: en7581: add PWM node
  arm64: dts: airoha: en7581: add nodes for all supported uart and
    hsuart
  arm64: dts: airoha: en7581: add crypto node
  arm64: dts: airoha: en7581: add integrated switch node

 arch/arm64/boot/dts/airoha/en7581.dtsi | 673 ++++++++++++++++++++-----
 1 file changed, 553 insertions(+), 120 deletions(-)

-- 
2.55.0


