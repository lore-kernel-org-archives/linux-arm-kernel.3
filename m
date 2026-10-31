Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE88606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yofd8+oZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+6K1BqB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=; b=yofd8+oZ4bdBeD
	Oc7riqeJz93y8Px6U8oL4QLy2XcsGw22WJ0WQ3CcoXSodUNJpAxeoauZGYc/th6Z7vb+EMx0vwLXa
	VuHdEx7VK53cQp1wVfFVLQ4NdSDDlyLYSy+/iFtOK0nlVPMbXtMcUx4GedgcmE7zWzJk8tBSwwopN
	JWZQj+YzHQmBYVchdzfeG7sh1Hi4u2RCVT3pEqCvRfBM+R71m9oUYgAdjcCnxnI67QEplspQVFMQh
	Jxrjmiopru/EhjWxrgUPZGeA1amR2C2Wf69+ab+E/YafO8Z6KRndYKCPCXgYZnOXa93lPptX5qoVu
	zl01o2UAkC3wQ9J9s85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyoO-0000000CsH1-22E7;
	Sat, 31 Oct 2026 02:27:16 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyo3-0000000Cs2u-3PnQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 02:26:57 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-82380b0f55dso622005a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 19:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413615; x=1794018415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=;
        b=t+6K1BqBVXPL5taq63ZZVFB3cS8jcNn60/n5uzVfNtnWOUe6tXrliPjzzrsXHrBx3q
         dazlifC0Dg8xDHQGrGSh9EjVvJH58u8Lj1DhOdPR1L+56v5sx3bcNQZ0B7vCu2Rmg8F7
         nMtAof+m25+1rNP/84kcAv/jcAOrIueQRc+aID5oZF/pUi/qbZOWsqohHh0Np56kHHzZ
         rU8gsyLGfdcpYLPLXWj73zdxGgb3dkxyVXBJpW3UV3TA3G6xLRleFbeSkFuKDat9JMrm
         uL2layVY9OtOpGbVmmVdF43lg3+TAc8EDZlw7b5qpeNqOFEUjNQmlu03D7h8xKxvXlWR
         IhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413615; x=1794018415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=;
        b=mKYflq/tcTtXRIW1dIP8ouTA8OY6w88yWuVOTFYLOuS8fys2YSPbFuHYDoPhP3qQcR
         4JJGday0p3tWkumWakoFEGn5KJNOFLvyEar5J5Dnu7lQuGrmZHFRV3Yq63CsmiC71QzE
         pj5AIjBcuKtiPya/amdGkehi7f5OnAUlobrJav+K+c6KyDN5MVsBZ8dPJatKtOMsymcR
         WSwq+hNR6cuLu3eXR+zJzBgfSgxxTzgVE+nJSipTpkGPnPpESkaIhJXLaFc5O6Mbx3S8
         s0aoiCbTKuPD+7f/3BRNZT78Z5omLZ+nPI/oYi370NItApavWjXidMRMz5kEdn1jGDUQ
         n8wg==
X-Forwarded-Encrypted: i=1; AKwUvBxKplQfOum+4MAbUrGmnbw2M7bInqVDjuRv5mL/CBViFcvsEfokZwsCsZoAlASaEVWl6rTjmw26NV+dAzXKv8Qr@lists.infradead.org
X-Gm-Message-State: AFq9FYISM70N9rUL8YpyIA20QGFh68zbGAtz55ZK43jnshAdbznYLdNG
	dgG3LSgP9Jhs7KJZ0vUM2hI6mca8xzY+GfXGjOlTwe9a4PMOOAl5Qi5F
X-Gm-Gg: AYBFou2/kBmjyKBmhf3ve0SPqp1mPbt1sv7xwZ9F7WAG4o6Jz5b8reL0Znb3Flf0RSd
	sNCP8rJm6700feNwzQTrU5EqiBpvaunOzFKynNQHBjl0apA679RLXIKhq9qfd9mqrIHZUbzebz+
	tvny76r342V0IB9PJyEPOu01LBnVBGOiphFMXFdN2G6u4sCaaj7ZHP8bggEDxU+Bz4XEsee6cAs
	XvS07CbpG5JN6S/AzV/4RyyRdDIgLfrXGYFawL7pv6l2s/ZvxHmav7fiuuL6oPAk+adtpIteK+8
	dBmu9YCE4qvSLwDrYFIDkn4Fav5vYaS/ik7NBMtnGvMgkscpcydvxzBJFi5Tp/lGwWO98Ed8TRH
	iZFhKh2humwTV9knUt6VJ54xH3u0FFqg6TXHc9Z5wixBxas7iOWNnXmJu4WvsBzrfsgBTY8cjJD
	9Wi9wyQUj+zI8y7+1upd5s/L3MdPQCCyj2M+O0+wXVJDasbK4N8jor8HaDt8auVcl+WyUqZ4ofF
	/vsGRWnwk/cVrMk7/7cdUkbuCsLgBNyqMnMiZfbrbf/JwFuztEzr4z40j3uK2ZTf7voob4ttKBI
	wpHxUKJn4ZBNjMD7T/F1G2CgRg4nFcMMahQgS+250FlKreSps1eOT9foNDQG6UQ6VTy2K6uQlqp
	pb458xg==
X-Received: by 2002:a05:6870:8101:b0:491:88f1:f3aa with SMTP id 586e51a60fabf-4a9076a4e0dmr2895056fac.26.1793413614745;
        Fri, 30 Oct 2026 19:26:54 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92196a7b7sm1528358fac.8.2026.10.30.19.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:54 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Fri, 30 Oct 2026 22:26:52 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-1@gmail.com>
In-Reply-To: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
References: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192655_880338_02D3A361 
X-CRM114-Status: UNSURE (   8.19  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Radxa Cubie A7S board compatible together with the
Allwinner A733 SoC compatible.

The binding hunk is unchanged since v1; only its base offset moved.

AI assistance: Codex:gpt-6-astra.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01bf26063777c97b14dd27851dff02..37a7d713ac71691e33453159592be31194b974af 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: a733e6bbf6de77dd9f260e65912894fd4d97aa78
prerequisite-patch-id: 2bc04cc14b2b271fb6aa55f78351e523cd81d1e1
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: 9abb4ef3faa58b35d636626e69b4b66ed4b04cbf
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
prerequisite-patch-id: a42183a0bb2ac1f94f7e040c125ca270cf77c44f
prerequisite-patch-id: 2f5645c9f307df3edfcc73dafc4dffc78c607df2
-- 
2.53.0


