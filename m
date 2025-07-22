Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0D5C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Yy54miT/gWfUHu8Cyu4CItLZigxgVN3p5H0HM5sD8=; b=vg9TOL8bNOv8+0FK+N6o/AEvar
	kOwh6OisqTMUJybGCwunQTLmWUTwRWfj3FoDfFh7AxTJMqj8AoeF67eNFnucRPhan15i8lF+lCglD
	D2GOLmBxRBFUS63KToptiI4H6EuZZOCysXpeJLIA9bx184rPNPCK5YLCJiJIUz54TogqaezfOdj1E
	LeYz7SjqYxKRGMtIP1A7wTOtVHjDRtoQHKlHglM4LaeznXFLaZRdlaQjk7rvVNYcQmBJrPAA2F/Nv
	D1qOb6p2qRaHt7mOtGk915nGkrQ0+g2uKGFmFkFSQZprBktMw07MLABnFFPByGUMGBqhqgzm77e0c
	ODpcJJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKfD-00000003WZG-1DmN;
	Tue, 22 Jul 2025 21:36:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKXl-00000003VoM-0oIE;
	Tue, 22 Jul 2025 21:29:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so4598263a91.3;
        Tue, 22 Jul 2025 14:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219740; x=1753824540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7Yy54miT/gWfUHu8Cyu4CItLZigxgVN3p5H0HM5sD8=;
        b=epxkeNqs1oIcPNjbdpdSCwW6WByR2Dfk0hdnwIzY9Lohji76b48ffmh89OGR4ar1Av
         Ds6LcagjqQNbnr4OtTCwQsDXzOKhvPIJhwe1ZUhgZw5qagKcopRnnIegof0bRWedYsKq
         P6pZZ6HVGq7rIUzBWuF9xnYcpRshbci0fPNGqGo9agryuEX02LHIfM1a8/UOISr/aYhY
         DCn4sxZN8doN59nQlTLeDV0yHtb88DiBOFXSO7VdZkt/ejbHl5mRQ72Btua5L0OxoSZh
         KQb6nlS9E46nRGoXuf/FYiXZ0F7gt1RyG6787d5QAoq7IGp34C4/kw+t3vFQu7XmYXZJ
         hohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219740; x=1753824540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7Yy54miT/gWfUHu8Cyu4CItLZigxgVN3p5H0HM5sD8=;
        b=qorfQU2xVTG+h6+uoEwQIVV4aT4+nbKQOMFfJvmlof9vwtJlBep8J5ZoSwIaXtyX3D
         A/rNATP8MY5fbVcKoRCpqHgV6BAh8yITzeyMXqH1VpatiukIOCyILLAwbtLlcUGeUWQ5
         +Qwtmopg95uyYidFZT9pUDUMpUDF/XWw3Ei7yAIexwEhcqoBcsLra/J+T7BIc/dK3n0R
         VX5UJx8+aSEsbyjLLk1E2/OkVD4oqZeyjN++mrtaTPQfT/gJwoE3zJI9nuqa21btnUri
         vuyREZRkdZ2XSTg9ir7LMNVz1DBuPqsyffTBy1tQBUW+5evxt0rfZafLJp/9DrafEQq+
         uJTw==
X-Forwarded-Encrypted: i=1; AJvYcCWC8/sZu42FfX8m2o1TJvso7r1MALz/BPfo3cyQ8oaVkmO45gFjmeOQiBeiwMPjl3dyL/Lnmqft52r/IIB80CE=@lists.infradead.org, AJvYcCWNskDGT2e5Wvxd06BrEwUjt2IHahbIB3ow4Jvtd1R+3HXV4FcSp1r2+7U9i0e8hPY3hggXpienmQdn49FRx5uv@lists.infradead.org
X-Gm-Message-State: AOJu0YxuK2Auzwk8IjBe2fhrjd3QLsXxPNL2poX0o6XVxWHiTU6Kn1LW
	yy4+NSucIvH/SUKr0HlNnRtBLxtzpFbg99e3K8RebYmeiFJeDpLzs2OI
X-Gm-Gg: ASbGncsMnCWGxgMC/1ncKbbXfd8f5gbBU8m66+JI9FpbQ6QNE0oIYrtuSa4bJTiBOX1
	P02XIkSZkERhRorkckyXYMVA1x3TfDpyWdx8+OJ5GyqPkuF4V4xrnjCa58yRIjUKHuMumTp7nv7
	ovDda8cV7XP5yXpar41ULybcI7SxHpz0sdOQfsnDAqq4y7Yoj3vfM1e50uMXwJQqfxOgAyOaSTT
	Zww+8jsrXeqp4KSmrLDDTfbNIhVRNz1Y0+qguApn09P+xWvNmg37w/Ooy9jTnJ+jlAfZpYWkGWp
	TyXmzlDBgsHSPmzshAlyG8QKMD24nZgaB2YgysEw0CXfYVojgPBwjStorO2xzqaD4zKPRBfWFWM
	DILc=
X-Google-Smtp-Source: AGHT+IGO4q762c1r7M7A/2Y82pf5EDsMmw323GEAeChX2rH+Kvl9M0dCW3IK06XLGSI9JA8iiKUIWQ==
X-Received: by 2002:a17:90b:3806:b0:311:c5d9:2c70 with SMTP id 98e67ed59e1d1-31e5075a8f8mr982845a91.15.1753219740389;
        Tue, 22 Jul 2025 14:29:00 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce384sm94942a91.2.2025.07.22.14.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:29:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv5 wireless-next 2/7] wifi: rt2x00: remove mod_name from platform_driver
Date: Tue, 22 Jul 2025 14:28:51 -0700
Message-ID: <20250722212856.11343-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722212856.11343-1-rosenp@gmail.com>
References: <20250722212856.11343-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_142901_230358_85D6F897 
X-CRM114-Status: GOOD (  11.33  )
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

mod_name is a legacy debugging feature with no real modern use. An
analysis of the underlying MIPS setup code reveals it to also be unused.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index 701ba54bf3e5..e73394cf6ea6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -246,7 +246,6 @@ static int rt2800soc_probe(struct platform_device *pdev)
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
-		.mod_name	= KBUILD_MODNAME,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.0


