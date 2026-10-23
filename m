Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084A8606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n72TMa+f;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HLcwo6BP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=; b=n72TMa+f3A7s8T
	nEIFDaXfpuxzEsHcenzzNeBet8mBvxlodEX/+AMsWKgdYNmLdEH5kmxPcjJvrHI58ZyvMfxnTcqZh
	6bF67wnqS5T/gRFfkjfO4o0h3fJIz0SIc8Nta4VB1BNKqd06cCXT8KyOgK/83LxyUBNQL3nhNnj44
	B/j5ZUc/62jx+sk3MNOKTp5rhVA8XJfL/ksvlWoz2FxR1mMIdSTBXFcqyqCvvdv1HUzKP2KxgGFe2
	OZuKcS+D7nuBb1tHhR7J/3GHjLdZ7Fkk6y041S3fhDSGQZUwVrpi87uvCbGj+Gu45aSveYtpeDLcN
	FslPymLcLK0Xq4trQrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wP-0000000FbDu-1GmU;
	Fri, 23 Oct 2026 06:39:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wI-0000000FbB4-17tO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:39:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso5493255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737580; x=1793342380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=HLcwo6BPSuCYs+0lbulpgOoHJxa5gJP8V9U7QdqDCD7zUoFYmA9zgZc0ueY41DVMTq
         iAJC4bS07KI54zp/Q5YCK8ocBASHWhYvduXMr7k2l5FfXcRUIf3M2IvWxCFC+QPl2JxC
         XAnuufRdxdVDkUv8XxU1sm/AVyZy479iagIdnVp20Rz3XA+p+HyXqbghjg7wQJJUaUPM
         uA+IP/ikjZH6jKnQOrowUHH00sJRAne0096UJTQPM2h//8Md+gIYr4vmKVklOk2K9F7u
         Zq0+801wjzJCbfWM1ukVUnrFWJzYGUTZ8r/aLI1cixw0oBmK/16Wu9NlXPKYgISIBuQD
         gunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737580; x=1793342380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=XE2Q4k+wwpgjqHgfLA32CS2fQwolYoXJQD1uEXbexZBNpFpKT2cTTiERNbMcop7fFm
         hTm0ovz1lX/QZLecc+tbGXWF6eng4Z1RUJZniPCZwk/XdjkCQZTkwrIE9rITwGa1IVKb
         V/auy+YTO+dOCDFkqAxqQixbQj+MUYyh9F5eeZ9yieChNJGFVByD5luULZYlamCtWeuZ
         ZsIQgWTBWDGeEJ/7tKXC3W7b5L1fVm52FfI+XmLo3aFf2Q+kosLzEEI03+HPJRHQm/+K
         te2U1zcYUEKn/LVQt6Quf8cigQJuNs10NuubAHeN9j2jpFXAClAoR9zJ/xd3TMNyv0Un
         2+vg==
X-Gm-Message-State: AFq9FYJqkCy3lKkv7PPrgyjqTon/grZF873wKF6IhP/55JedAcX7mehG
	cVXR3l2MJHN0PKzB+UNVi73b6Qx6eMsSqJE1U7a3Hsky6cMPj0LAMncs
X-Gm-Gg: AYBFou0hG9rrBuL0L5ea5ezpo+qKfdoowCUhxUGpki7HW+UbKWVxYIGWkdD8XPZYOHj
	SFKZZJJ/BmA4SsyNiFVnf8w06l1x+XpqaI8YecNUUXrFLa0jDAbLF6w2SR8eIOoSd7FdNhQ4Z3n
	RkFskBoDMtBWwkJBORaGKfxb+Kzpli6SnnGnsZQiqsRL86R1J3JDqZKwmAxCK4zfPiznAa5b2Wm
	KwcxzLYIJ0K+4uofqpwkcFlEN8b4tg3tILXz9kff5uu/HNpgKjxTsZn6AnPSZkCHQOJYWHFGwdr
	5YmJcPEYzRRvUG61t1pKkRR5MM71xwVHQhcDFtDqi0BIfWjNwM2ifJtOBK78H0H8NR3DeZQ468e
	phttA/XoMxyGJ/LCdMWP9TK2d5nUs9n764BYUqJJ7TDDNkq62KaEAXzeqPrqb2FCZcKfPkw/7Vd
	/BcDruXpc+wd+e2Tl7DmwNFNuk4yotReypDJBnEbR1rFzlgi+ANzGNwfMerkh62dqP0LbqSouQN
	T9EH9+MTZEzQBZxowgWIz1cgio714WLHxRNNLpoKuS85HUYHboSXoOhQUIlYAwnDSfLjd6c625g
	gK1R5UpycY0ooiBQDcCZlZERm2R6dBhrjtCI5atqM/IToPXP3ZtBkuMSXUa2ikZvgfu+nM6TS1I
	60C8=
X-Received: by 2002:a05:600c:a46:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a211c50e30mr19135615e9.2.1792737580211;
        Thu, 22 Oct 2026 23:39:40 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:39 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:26 +0200
Subject: [PATCH v3 01/16] dt-bindings: remoteproc: k3-dsp: Add the L2
 auxiliary and DRU regions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-1-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233942_329944_CBB6B04D 
X-CRM114-Status: GOOD (  11.03  )
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

Besides the existing L2 SRAM region, at least some C7x DSPs in K3 SoCs
have an additional region called in the documentation "AUX L2 SRAM".
This is just some more SRAM that is accessed separately.

Also add the memory region for the control registers of the DRU (Data
Routing Unit), which allow starting DMA transactions and polling for
their completion.

The two entries are optional, so existing device trees still validate,
and are allowed only for the ti,am62a-c7xv-dsp compatible, the C7x
generation that has them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 8b1ed384ef22..278b88b7f906 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -122,11 +122,17 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 1
           items:
             - description: Address and Size of the L2 SRAM internal memory region
+            - description: Address and Size of the auxiliary L2 SRAM aperture
+            - description: Address and Size of the DRU real-time register page
         reg-names:
+          minItems: 1
           items:
             - const: l2sram
+            - const: l2aux
+            - const: dru
 
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
 

-- 
2.54.0


