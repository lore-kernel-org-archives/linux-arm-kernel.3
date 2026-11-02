Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434C606EE89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oaKELkvp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kn2AwfZf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=; b=oaKELkvp9W6UYX
	28TPDvKuFFa0DIwIXs9OmDY+PJQkO5Zn4XMWJ5Rgv2q+gQl2gV04EhLxLkDibZd8OuLztUxsfoYVq
	8TYPqrr/UHIsaUzcfBjVoIUfs2eBq/kj50uSbwWew+0FQg/kk+4F80zVcKOxCK0+93W/xsh50XB4W
	s0Xz5r5tPeEjmQYn5/2BNQ57lIRljicNqo16qdscox7uVCO9rUWxUA1e3zrBLxkGb/Am8GwEWOa31
	rbzp5rwThZ19zYUokXmAUz23JG9BqtQCJU/NEEfUpQqZKCDCmSCEFquUzQj+jMpOvNSPlZovRVP4n
	G7JeRmBMgPr8d+VqD0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7v-00000000EJL-3TYP;
	Mon, 02 Nov 2026 19:55:31 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7t-00000000EH4-29IH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:30 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so1988605fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649328; x=1794254128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=kn2AwfZf8W/ig+4Wkfoz0jfv1IcrlPs+TPa2iCykzYmOn6X2qIfyHzHnt6CrzTopQ6
         TCR76MjwsnXXHs3sNa1qfwqOFIEFtYdmrIlqGAjTtm/zCc0A/v3XYD9pNyE6hepFA3eN
         vtLAunwTM0WPn/o60TyCFpG97wgOEGlAIETj2JwYnXz2gwq5E1MO8tmDnjgHjm2f1MB0
         ikvOS9f/zem1b6uOKG03IvwunVBZo3Wcu3DYfSTBdPq5FfkfLXN9ZYIFdisr0nkYVsfE
         gtikZcSvT2k6Cda0KO1V7OAJwB9WbTn6nCxvcHPklusPtEapItiF3KtwOtQsKmvwB0tn
         LL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649328; x=1794254128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=XbBqnfazfPerLxrfsb7mHGoKkvvf4xWVQu0b5MKiDN1OgZ888a0PCaRfrgvozTTgQ3
         APXSdh60BFRfwbXsShIRr8VmBUnskkKJcZF6OXRks+iT5UaFtllK3nar90Qvd42m7AeN
         Ek1sKVBt84FS7Orv/Vp8MawmsnvqfB6lhY1/M1kKlbjyH5/G3HMy1OrMMWZpwGGImVAZ
         5LoIKdkE+Y9UadpgVz+dkEGFDFfIerf2vlQEqzY5EbeAHzZxwvxXfkrvf9Dz0dQ62b1+
         ERgCPEE8bjOMeo0e8Lhy5vj552eIogI+00+PPFVbhUUFPhbV55SbPLLUPnRUONfx0cv8
         +Hng==
X-Forwarded-Encrypted: i=1; AKwUvBxX/95pHEcYlsZ9WSsqlHawmGi4UaW0hkIAQ1YuYmDhb915ivnuz3MB9V42I985YctdXZG84BpDvokzfDfQpyWS@lists.infradead.org
X-Gm-Message-State: APuU4Z+kgIc6RFJjV/qp27bz9pIAwxB4ohWSjDglDG4xWgw0El2xjOFf
	PsgZYUQslxr8HD+nO5G9FtAzbNsiM3KnW5ikcLY88b6daBaDYfpBZQ3p
X-Gm-Gg: AYBFou0I1hK5OPxbgkL7UpGuG10PBI28k+IJ3lkqfq196FMBskpJJJ5IahiEj/WV+SN
	sPexutHrvLFOlEz2v6d5LwBvJncrgORWvpkblTFmfq+tYmWdRdDzkDaJMPMuVPA0ENjuuZs7aqK
	0SF4nS77UgWpqeYP0Rh+ofzgVXXHaoWRu+5NyR307bXh2QMKdlBPiGM8IztOX+3pSSMD23KIPAg
	n+aLssUNdh28w9Jgli6QiLGSrawwwkYxboYNnbQ8jBLHS2xPXlJbkaGr9P0qrKCLNqA2iXMZF7n
	I0ZY0e8nGFRBtA4G825KkInD8h/PyWIHVRc8yyUW0H+JIlzt+5EJOP9NBubpgE9z1tS9lQ2I/bx
	mC49TcslEumk9kFDuF6AEaZnD2ZEXtQg8FykNExcAi1RZ2LVrARTUX1qCvml6eymYhsmVuYpeVb
	V9Mn3qc1t+Ml3NCKRD50mYBorwFEfpseWOzcAtfahXcQfsMl+sWavFATRbX12wiGEGc4+trzpJ9
	0PUn+8bbZjpLGTN6bmwIY1lOOCwCVQAUPpChhZPrVLa5Vx/wq+FEm+EqX4FF64dFo7jOmZ0WlXD
	h3znkRgi9tIA9mGHVHX3H9SNj0Cly3+5NNsfVKyXeWv++XqILps03xjMVd8yt/1w47eh0uBXzGN
	kAk4iNVSZgi0RyLJYtl9Lzwv6M2BgWqxLkqY22Qyi3zuLEjGMHOf4CH90whIG7tTIkzEtVwmSLv
	kiwVq6Jjxcr5oNJlATczGJ5P+imkp5MGwrrdJaDXtkPlQZNxIGfgM=
X-Received: by 2002:a05:6871:580e:b0:475:e2e9:4f4a with SMTP id 586e51a60fabf-4a9076b7508mr7711963fac.24.1793649328190;
        Mon, 02 Nov 2026 11:55:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:18 -0700
Subject: [PATCH v6 3/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-3-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_115529_582145_E3DFA28E 
X-CRM114-Status: GOOD (  10.06  )
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

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0


