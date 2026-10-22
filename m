Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDB2606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MEoE8Cp9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W65z/Ak3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=; b=MEoE8Cp9bwc3Gd
	STJ/EpxMDyJe+PZcVQF8upqDR+wpPTsjzZbwJs1CtppCi9DPHbeI5MG7a5YSqJ05+k2br9U8pJOWG
	kkOJxPYUjqq+KYaQf4xDibi1Jiy4fVV0Vrudlqk9KKpb5l8vtUZmbD7F6rycu5AUeh9kHIhEoA8En
	XH2Xj6PqCSZ06BMvVoxkZ6bh+bOKxRP2uQUTBt7ZGsb2nX4U12VI4Zs4gVyjyvtz+n8x/Y662w3G6
	wycl0nvtOkYw5dI9fuUhYHF5caKzbeP0GfaXwrgVz1YpLcd6zXxVivO0sqSWA1NUdUMQk8Z7WmUW3
	tf/wAS6thJm4Nq1ioBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJ7-0000000E6sV-16ek;
	Thu, 22 Oct 2026 12:54:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsIz-0000000E6nX-1J1S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:54:02 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so3303785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673640; x=1793278440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=;
        b=W65z/Ak3f4WCf7ri9uE9v0X/FjTuWT6YWPCW7EOvnvHkmSJo2fu2J/U/hR5NGzzd7V
         P0sfpInmfxJ9awD/Ilfbxb+awDmZ3AjZMu0NWatk1XpiNBIv9p/d8WUMHkSa3WA7jlH9
         nxvaV1RbYtKm7WwQt6cP+qzj/LO/plsmEEk2mBp5blIC1SQx7QLDsMEUZfR1Tf4g7eM4
         W5k5Ph5BL319k7BBrTS51NiTOSQYMesozfUf1msGuBXdOiQjdwCta47L1pkrP56PGcqg
         GG4r+Hj2JSl1dU7Kk/sAxRbxiPFozFeIfIHEpqQv2VJxN18BPsFQ5QK1cgrmiPTNt8Sr
         UrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673640; x=1793278440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=;
        b=wWRC5Q7hV3unx81UQddoQv7SPjtyWL8F1mc1zgw73JtYbcYVS2UUdSUkQ6wqniXgif
         Rr3gcjV+vZ5rm8zwCrZNx1n3r1+f2oofBfPpG72EKxp8PJr6ZzDYnejxricsi0AtnS0H
         tdMDnrOq3Zo30oNDE7ZG6BiOejPZ+GvGM/2/OPSAq5mw21BZ/8OW7pZpAQBlcSyAdKuY
         0pqMbHPszc+LJCmfFQSbWKF+PjMWeAElbrJ3y4NJ/cOseB2oR3yd5ScnZcWNGoUmi9VT
         8B/Z30AoOOcnd59XE34FnTIyLvKPS11Jlo4kcyzxr1bgD1IDEFYKkyMxXr1mQSCgLrib
         spmw==
X-Forwarded-Encrypted: i=1; AKwUvByhFcgf5a8+++v98eZeCgEAapLareVPTWq58iDx9kf7mrUQrT09Ee2omHy/jSQt8yK0W/fttZUXI2rEn6az1Zck@lists.infradead.org
X-Gm-Message-State: AFq9FYJsLK6+xhv3xkEyzYI2vfHzpRI5VGHXRwbax/XWhp/NbayNFloE
	GdQgGlSzTXcL8RVCuP6fc4OSXmNzdIMdB44rRK4rTx08//c8qYIyKsys
X-Gm-Gg: AYBFou1YrWcsMPgB6VeYSTqQ/yMj+cK0dBTIXbCKB1+AWV7a1RZj/YwID6HzqvHrcvW
	IRrzBhl6mpxnUj9fqZBgQOmFNJHeF3JINAQQpkDl8Ne/01norpjQDFBD4NtGG5I6TTF/jN33kaS
	le42NuNc54ASPU/wRmwAGPL460PSXOv1OmbmeYdf+araWLY5ise7kogb3F3Cf4lhdbIQFH88ezM
	sdYnAXANYZwmDB52nBcRwHM6RJ6aRPTW6yrn0BqSCfMP6l1lNZzamfYAWZfkIIjAe91OsgzLb6b
	56TSyz7P0OQP4V65gZ09b34Z+P1KUBAFFwl9QyQxzlb2AoC7ECa5ubyO5TL/d1Is2sxoRirIIRr
	20Jn6DF1eGrHENVkyPB/ubs8Nb5+qQ3MnBp3AQ3gGpmoR06GCTAD2+YP5ZWanHRE+oxOpHoX9CS
	fhbSCa+P05Maayf1PJvwb/J/l+Xevj3Fbr2/I1bqjwh5nnlEUNPtt5jcMPg4+u5qPEYlAri+Gp6
	BcSXtBnLLOKRmblU5zKv/jT56yg3zlSeN3Fpkr0ULJFTcBIBSrfMYRBTyo=
X-Received: by 2002:a17:902:c94d:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2ea4321cee8mr68893965ad.0.1792673640404;
        Thu, 22 Oct 2026 05:54:00 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:54:00 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Thu, 22 Oct 2026 20:52:52 +0800
Message-ID: <20261022125339.82746-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022125339.82746-1-liujianfeng1994@gmail.com>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055401_357371_F634D31A 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -1.9 (-)
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

The ArmSoM Sige7s is an RK3588S-based single-board computer which
shares its hardware design with the CoolPi 4B.

Add its board compatible with coolpi,pi-4b as a fallback.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..1b905a7af8009 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -99,6 +99,12 @@ properties:
           - const: armsom,sige7
           - const: rockchip,rk3588
 
+      - description: ArmSoM Sige7s board
+        items:
+          - const: armsom,sige7s
+          - const: coolpi,pi-4b
+          - const: rockchip,rk3588s
+
       - description: ArmSoM LM7 SoM
         items:
           - enum:
-- 
2.47.3


