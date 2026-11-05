Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18535606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fl+aorQE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EaXFyTvf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=; b=fl+aorQEeg+b8N
	9FgBqDK9HKACWlb1/6EHEkmVRRYIRsTSUqiVYu6q/ywYDPWafVU2HCaylN4aPVtmYp1TYdOEf7X80
	f/NynXPIPuoY9J22b+Rz6Th2ji+lEJd/iLs56GRWfNTlxMM1MbX8iFSjhShKYzuHe1NhQRf38XaBo
	K+7IUFLbBJkO/cZsdigax+PsQUuZEnkz0zRZhjES4WkLj9nRiDPXj/zYmIAWSXm7APeJJ3pWWIxg5
	ZtaWMXRURsBhN5e/P5tSor+wgkJXeewVo1saakfU7Q2lLKU3GgxDXEP/gRdDxUYHIj+ldKl4wSCiq
	pe+9tiECFz7ux5bJMCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rx-0000000Acy0-09tf;
	Thu, 05 Nov 2026 20:52:45 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rj-0000000Acjc-3Uf0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:34 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-843cf077f10so9728a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911951; x=1794516751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=EaXFyTvfOoLGdC/pTLniMXG/Ma6nnhboLvx50h5rMup4dQEu894kwUiHKVSmdcsjJ0
         k6ZHk93RUtmgbtcr7+EGS5uaL5HDXY+EIO0uLNVP+to1yOMk9aI4DTcEZ8D+diMUjXJo
         oC5MMTKLIJVgwsdR4NthGpabhNBlxO0DSz2KQ4RtpvEjK8OdD3df5utkbFDXcLsuFYm3
         2S+PT9YCVNu60tDzSaSHxTe3vUJ53TG5VuGq7EQUdeGNl2H/4hQr+v3jZYBRQq3cO6ON
         6+C+7F+nLQZaFnLhOhucNLKnSG1vMGA5KzhmBjm9EIciUQXYYDUrwVw5hM7AKKtEbcOl
         TDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911951; x=1794516751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=Wk3d3JwHpqHAc77VSwqhqOslvs9CPufpsd2YvUPZ8C8UWdPCC6061XEf7OjtBCfGMe
         pKOapvY8Ls99gK8PUVkP2Cem4BzuFiKVtVvMDs67SvdwpOWF9ylfdyyTn25BigmjJKBE
         CKoT45Sa2g6sizAjdXAFMVcijnfgDGwSbyI740XIQEl2rwX8kaq8FAqqIZ7b/xMgOPJc
         8Ocy0RAIywYhPz1Z/v4MvEmAEXsKhNfNYMwPOCcHNZ6h8QcNB5hb/fsFC8PO3m1TQWe1
         nfyLu7glurD/AIpb9MnA8PdfvXIakAqiZ7HUbQZpLucSFyVYOWbAaIX8GoRHdIitB/Co
         asVw==
X-Forwarded-Encrypted: i=1; AKwUvBxF8ytmDTilaad//nXfOR0SclmmySDIruYoxhguw4No2ZjQYwssTO0ous7KGuM6zC0VzNWRxfXhUNhZY6MhsFIu@lists.infradead.org
X-Gm-Message-State: APuU4Z8N99PtoXJKpw+pD+Ql8tAWBm0avy2eKwQe5Yr7CFUlu4BQfM+7
	F9yxyFesuN4Dov3DzvxdusIXYrCgJ05e5j6nmPjMStFnl1P8/LsBwQ8q
X-Gm-Gg: AYBFou1/NIe3GxW6wYfzQxFq+k99OGhG48icXIldX4/4pDfaW1ZBIP+B3bbYDYolpHy
	k1Cr6KuGZxZl/UNezBe3CBLNZGBOG2Tpsmde8/LnLZxIeBFy9Uln/lR8c4B+jrb2D7u+OJq7AbK
	d7RkuSAZEdVWLTEQX0bsTGjvxcr774FNCoNkQgscdowlYAyDZ8TfMscPfhPooZxCcvfwdv5F5SH
	36hkNFqPGEXIFI8GMLUrasxtdKM1wUfOCYRW8GxfLS4qlOgccCNMjayqkdHnV+nvfkrKaIFZGRm
	eDyLlEoSEDS2wn6lgHeGcv8MwD/dSfuvb2WlplGTsDNFhf4smCrniWNzrrNTm1lHw/9l7FtfdRZ
	MQrKdnFp8Hp9SbRAKbTmEUI95//mpK/tipwjJP1+PwgYK+ZPSmXUArdNZalIq1ixta66hWvewk5
	P9/aGwGqw+Iz9SvRUb9CcGkTvz7XxRSnQLl//X+mRguYlyvhoLQbjr0a3pYEM0C7zvl5fnW4s3b
	0fr+s9/wCRhzl4Fp8nkp+J2hLHvsA9d8ftz6imUTFmJPTKSVeRdbTSqnVANUa/A9Mb0UK9k7bq0
	sg0/XnYU9+ncn6O9Zb7A/tbbCySgn+6RRIuUT4YeIXo+Rvkx7EHPP9sZAr5ZFuyvn7puvonmigH
	nb5yr8BFqi3AbaLL6DyIMtL/4PMLoCsuWv/hITlTn4U6+zrD0yyG26Pty0YfA7KcLcXHIjy0Ufc
	D7RqF2U//R2DG13ww9GBI23o63b8liWs6S4P3ZL/NhfjHCJp06WOc=
X-Received: by 2002:a05:6830:4c03:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-85f1ce073bfmr525242a34.4.1793911950589;
        Thu, 05 Nov 2026 12:52:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:10 -0700
Subject: [PATCH v8 09/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-9-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_125231_896552_03E8366A 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0


