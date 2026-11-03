Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oJqmjMGJ;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bKKvWtXo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=; b=oJqmjMGJN2BqgCxodfufSN8Ldp
	cRADnshNOXJloNMOqTh5V2+/0ZSib7z4rNQUzVoQ87aBj0CFZ8Fmgn7XbxzteP2pcmqSgNBN/Mtlp
	YOaxdgDFdRCV7uH/Pya2oRJKe/UNPbJaflN8Uk6RejElxOCQpij8x3FmVhjean/i7EQeefviRK2uq
	Z1KlYhhAWGdZb2kECni0utTQ+yXdqX2JQwEGRCwOtMfmLqAKhbNC6owgcUewqMIPqsfKdydiuhm60
	LpirLAvA46N0Mz0AW6+d8JVsAShanNIXhd4QVyRbu2FksRoLkvLKU63Q8dStg8alIhe73eB4ZPuVM
	13KEEiQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO66Z-000000012fx-31kB;
	Tue, 03 Nov 2026 04:26:41 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO66F-000000012bR-1sKS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:26:29 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so2869912b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679977; x=1794284777; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=;
        b=bKKvWtXoJFJV8Xad8Jchq0p+1OWc0h4EqW4nUyEKwkg+uUFhBzMps316AMT06vKw+q
         xRi+r3i+eNMSSFq+9k7KhXmGSfbT9qA/yEhg1GffyL0jyyFMPFzkmt1h1f5Tk4X9ozCz
         XsmUEBwOihq/jCWX8nLA9I4O2tjzGCKZqRyMYc1Aq9AYe1T52vGSjIvD2/GMNEeSoJ8n
         ieKZuMdUwqF/SCXwpUURNzeWepFmG5ZayjAT3remJlutE2WYGeVSUOWy5YBR+DdPTeqv
         OI+0GKPJAkK7l68sKnzLicZy84WwomHtkciPPk8oiLzbpOZgXqNw2MtYLw/RjSivDgjo
         2bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679977; x=1794284777;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=;
        b=03a2+G5iGExUhsoqpj1c72yryBERpL/66hFzBqn037ly4sRGsqvUiRtHZZ+x3ILfUo
         cg+nv0o+4rrjW4RY9i7DEtFcOz6vbSmBPira/F46D0nhYyM4TdTrif9kFjgHWP/f84T4
         qmEJKuf/DjBUFhTfjPqbMwoNsyeRbM4MSOQDYpe3HAkjEVYJyClX4G+DL2RXdcaMhPUI
         InFUxbsXiSnDrzt6mTOj0qehkvPY0N9cJoivB27bCR7aF1gyJyf5zdHd8Kx8QTV8uTiT
         gz/GukIn7e5z3X0FmcTmR38wk1PqKvRQPG6DmDAEkOSeDkxoidMAVg5e+J3yj2bcCRFt
         9BwA==
X-Forwarded-Encrypted: i=1; AKwUvBxgOk9skpj1N6TOOWRRPOoN2Y7WV/rpNJLWVL2EYT64qJwjOBFDSgUcQUqOUojB7q5tqHlgIEycemQLoicTJcSO@lists.infradead.org
X-Gm-Message-State: APuU4Z9pO4T0qvc63bC/vEs3IwxSLWuKwkr6gxr3kSUmOGLJoeIAq4Xy
	e9bMON/KJt9TT4flIhLyThPDrsLDt0HB44wR4q95iv60XjCwc4wmi7EUL2CfpLE75sBbOOHCwc4
	1aXGafF3Ze+wLXsTbsW1QM2R967fA/Giv+Q==
X-Received: from pfei14-n2.prod.google.com ([2002:a05:6a00:c04e:20b0:891:b886:dd4b])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:349a:b0:89f:7ed5:865c with SMTP id d2e1a72fcca58-8a9be396728mr10313189b3a.9.1793679976311;
 Mon, 02 Nov 2026 20:26:16 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:05 +0530
In-Reply-To: <20261103042608.387626-1-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-2-vamshigajjela@google.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add smartdv
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_202622_457718_582E4301 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vamshi Gajjela <vamshigajjela@google.com>

Add the "smartdv" vendor prefix for SmartDV IP Solutions Private
Limited.

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..f15d81da1e3d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1569,6 +1569,8 @@ patternProperties:
     description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartdv,.*":
+    description: SmartDV IP Solutions Private Limited
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
   "^smartlabs,.*":
-- 
2.56.0.317.g454f8302e1-goog


