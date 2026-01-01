Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41A3E9410C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIeA2KNOq3j25EC6hciLGLT0ZJhCWc6ylGKcYpLnhhU=; b=I1rvwjl/fcjbVGp5zRXK/FuyrC
	ajRAlBPUF1fSkRewToMEHqccA+zcC+nkgCKs2K/Zsv3fp+vPUzZfWKCHD4llUGErG6bgsSrKEpDan
	i6lF+JanMrjzxhOCeAdUm82b/XjhveSUsM3mrkO9DTXoUpPgJ3a5+PMB5ZQdRX8sTFG2k8nvfZjFh
	DEvi3YOmLE2JXMxJEtY+nlRTUUblnEeJFcFV+LRmEoc6X4OhPYA2mgnTRqnlxEdvPptNSxygpwFQl
	gIHheJBK461Tm+ZRcxdHjgGHXQ0Qw8Bjs4k+XPM2mT3u4RhZhimy7eTLcidCZNfsvbggsyVQeoUcd
	prYloD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9b3-00000006Ynn-1Jjv;
	Thu, 01 Jan 2026 03:43:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9b0-00000006Yn3-3nLN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0f3f74587so159260515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239010; x=1767843810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIeA2KNOq3j25EC6hciLGLT0ZJhCWc6ylGKcYpLnhhU=;
        b=J82Rhxfx4UIvVDtu4ye6IFHDQIh6EnDPB2ZeEtxDgbwOAknwK1L+JE8HDXzPOBvKxu
         ENoWM5PzSe1Mop+35juX3p0dRfJhl099Cy6ASYSQrpO644JTrc+WZbrG25Wi3AErcy3Q
         1BLJIxM7iHALtJFIq3XJgw4MatvOyjF/7bBfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239010; x=1767843810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jIeA2KNOq3j25EC6hciLGLT0ZJhCWc6ylGKcYpLnhhU=;
        b=hAZhTP+n7TSRhBe7qjjJl9gzpjAeZbmoKBJPir7zU1GP/qU3Kjt9JsIayx8ed7i6qH
         zgH9dIrIYrOPZ3yZ/Bz0/V+xkxiISLg/Za+Iy+HTHOyO0t+q8t1HoNMxNs611KV/NIGQ
         1c/EhNTMeT83EIFt7+HCTKxlV0h/ei+2oODU50E0BRnNePWqyByf1j0Z3+9hiLqEEWbk
         3YkREwXckEyIeuDfnR/HAHfUdLd+dtXI+kp1Ai+cb9YZeI+4aHt4pCPNq5/T0NJy9kkc
         upXpP8Tza6L9X21Qpo6pjHqETjsh1l5EE0txww7x4lxQmO8Q9ZbsJ+xGYG8k2+iqb6g9
         jD8g==
X-Forwarded-Encrypted: i=1; AJvYcCUpmfNokapU5dYCczHQWRzgbTdu2Fl/ZXh6c/hNrxUWy2e7SLvmgkB5NI/LSEuhx5LXiGiTt/fFqD7LJlsQSfAE@lists.infradead.org
X-Gm-Message-State: AOJu0YyUHXYFDG9iB5tMl4DJYUUirrZ8sPKj4d82DnhhQaSEfmQod73X
	JzGXK/zSeTqVo/eN+46Ya6o4qnbNPNx63U/lPuZnAyGl1bNIcm2DMUd4R5gqyrU/6Qc=
X-Gm-Gg: AY/fxX5izlnQ6jXvHOEFGWnkAnNJUMc92Vczs7gOpGEq1a+PLw9z3Enw2sFv3W/yFcN
	iac7/8XpJoSIaboZfKFUvZqvUDtKNJqF024Gmhpo+/AWDEYmqUvGpcy2CF0o7Bqe+94La5AisuG
	/YJ7RJzPTppqHkHin0vXoKDQihL14epTtczlS7Un2Q5qv3vUtCTEZunZCjTooXFtzA/vohd14p1
	txeUWpEyucERSgf1antfC7qnhbjpepLfibnQG7Yy7EUCXkWvoyhcAzn1Xm37Y3BS9z95+Fygd/g
	pNogX+qWuwzdcBkOICaKDdGtTSyW55rib3tP7yAMnSd3+wb7oxyxM7vhUFmkYidzqd8FwI9BmC3
	ScYxXjEpHfE3dYE7LuQxAWhOf8yjZpIdfj6w5vGBU5mm2XntycMgnkb92fzCyyK5sIvusnhqyvj
	nHV0Vm0i3rUX6b3DIqzkRDuk+qbxqP2YCj0dUE+ZXdTJqVOShrezuu
X-Google-Smtp-Source: AGHT+IHWLoj2dAsPZaFCTMWbBUjlUV2x4LqvvsY9iW6nKl/Lm6h8sT6ZFW0RZnH1hPW3hXhIU6VfSQ==
X-Received: by 2002:a17:903:1208:b0:295:20b8:e104 with SMTP id d9443c01a7336-2a2f2a5721dmr298948875ad.58.1767239010025;
        Wed, 31 Dec 2025 19:43:30 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:29 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 1/8] dt-bindings: clk: mstar msc313 cpupll: Correct clock-cells value
Date: Thu,  1 Jan 2026 12:42:59 +0900
Message-ID: <20260101034306.1233091-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101034306.1233091-1-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194330_941702_0E6E2782 
X-CRM114-Status: GOOD (  11.10  )
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

clock-cells should have been 0 and causes warnings when
validating devicetrees.

Fix the value and fix the binding example.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../devicetree/bindings/clock/mstar,msc313-cpupll.yaml       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml b/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
index a9ad7ab5230c..889419fba269 100644
--- a/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
+++ b/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
@@ -18,7 +18,7 @@ properties:
     const: mstar,msc313-cpupll
 
   "#clock-cells":
-    const: 1
+    const: 0
 
   clocks:
     maxItems: 1
@@ -36,10 +36,9 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/mstar-msc313-mpll.h>
     cpupll: cpupll@206400 {
         compatible = "mstar,msc313-cpupll";
         reg = <0x206400 0x200>;
-        #clock-cells = <1>;
+        #clock-cells = <0>;
         clocks = <&mpll MSTAR_MSC313_MPLL_DIV2>;
     };
-- 
2.51.0


