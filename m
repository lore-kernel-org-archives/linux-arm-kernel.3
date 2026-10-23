Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF69606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V+SifvYF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TBKVBNAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=; b=V+SifvYFVw/M/5
	huSDVNt7yfOhzPuek5wnLHTzKHr8W7I84XKNt49S3KX51yXK2LclmeKXB0MRo5B5NM1pWlne1LBzT
	mITxLoy0UJQeVkfLV4uYpLNcs5Z8ARIisyOEYVlK9FyUOySLgp2Iy40Yj11Ozcnpnu7Er8nbfT2ps
	WOh/pPuPsGM2ILEgrT/wI7o2HHVTsyN/yFoeiPk2AUtY1URt7GDv466rFj5L46lN9HOjQxgGEgA4L
	3cTxcAbFNVjxgjK/M4JOljdQNxNjgwSbAXdiidAVAKzpV4NFvCK+X/43euIQhQpi+yPCncvP8rNVf
	gTaxQPolD39PtvZq+78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMfr-0000000GypR-3InD;
	Fri, 23 Oct 2026 21:19:39 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMfl-0000000GynV-2IFr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 21:19:34 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-81ba09a5d23so1375823a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790372; x=1793395172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=TBKVBNAr5VOJSoQVTRgr7wJjjTGOjkrOBiq1ZXJVPmG8r4chn/vo9CnG55bxCJF+3n
         w/CbRf3Y4RpWboY8CwH9WHiCvFCprorD8I8UNPlpRl/FuPIf5fWD+Q4k9q3aukWaV69b
         ZzCUCR52afOBmDz4zBxuEJueUw2v/uJSvW1i6ZXeL7EvpwhOZjKHMRZhnKyOkcxToVkV
         uudGoacBW1shm9DswHEg2Rko9t+YSAToVzSEdEOaHaI2rOxJ7SWUSQyW4zjIjNYMtIJ1
         hEj+JhBZUST3Lh/+1lTzhWNYNB23xvCdt5J8ild1y+BYars15wF/xj1Ke6GYxlaTTxCX
         2WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790372; x=1793395172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=KHKWVKe5RbI5CyUby3ye7fR3Mj4Dr170TTtI54OCiZPSTC7BXFh24JT44Btjw1Pdni
         FKFEY1Ua/zcFg85uZzRT9V0lDX/VA318bRh/TSsDl1zRn8Du1yoqAs9I+hbVEtGqcn34
         iInuLbcjqZ+MpdrmAW52Z/rx5gCh6PsVMC0cka0L9ZdRAWhAKgvMc5oeigYWFQLhQYqK
         b6vwm/n8Oxev9AYsPTW2EgJgQb3//+lEpfxO00HcnnaauKIDE53NSzohj7DTR3bNluPs
         nCdF/FuJfOY52fV8Nctgg5s0P6rKrgO7Bf7aOqFBQtApCZE7yHQgDfG4LvOTGmGaTsYk
         GBAA==
X-Forwarded-Encrypted: i=1; AKwUvBynS7xEDwuIp1U8Ff7CQDOKguFN3hYOmWIrZo5K3HPwH4d1PoRg0sgo82e6UgihMuC55re4SvuhUL+hTB45j6Zx@lists.infradead.org
X-Gm-Message-State: AFq9FYLVKom9LhecchoehO4X8NNGlfZ1E6ifn0gN65iASry0s633yzFn
	qcTdvsQUXgfSoxuep00RVKoair1Kh4aCyALBqUeUDC3OcpCqLrLJvb0a
X-Gm-Gg: AYBFou3oH27L6/8v0GZebQIhr14jA8Uf7+9JUH09Zl34P5s5OLaOMhcOlxW3dRjXJ8S
	JREnUOy+aPR174PUsuekt6444M7+YmM3+vyiN9rGjWxpGQ5LN7LMY8yCCsv6wMQDF+CvsnCOfep
	UNx5NVK2uHAgtkXakXxgqgrHKXGMIWH4ehCAjyIo8cH01eLoJXV4Ww038T4ZxmgDDzhhtAK2jGT
	Mr1+z41VVa/Y5K555uis6euZidJ2MT5Zf64xe3SrutJeBlQaKpKsG5uF3mL+H2tItmu0g6Y2ce9
	8xHkJo0VNjiozwuhetgB8l4pT0Ls/2Xp7W1rtFDwgyyni9uhZU3Dcn12DCZ4/O539pLRKZBKSGt
	Rn2KE/GKo144FcPYPjjqn+nj4vz4IX1uJ1g+zwI5LeGy+/kxLBOsJA/az4t3KMes4Qrvv7WVtQx
	dDtQtOla5TLgzEBRPAWOsa+reYwfbvnA+j33arjds+eIBItxyOaZuLijQu459QztjvkR76K6yNB
	X0+WhzpnjFuRFmALVkKK1TK/X0poB2ag8Ecpwtz9mKmKqyMw3cO0SyEy+hD1OJ0fOKRAa71htPV
	s6I2QxLJi2BKr8bZWevM4Jo1Q8iWrHCr7RS5NKmY3hqsRCP7L52R7NuUexu+HpUIQa6DpZXGYrf
	QzNPdJImUa7SZBsGjmhk7e9FZfOWXlcn5VBCpDr/NE5kWkIaoEMhMomBHsTgH+exYysIaH7UFcN
	OTuQ==
X-Received: by 2002:a05:6830:640e:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-850fedbbf50mr560464a34.16.1792790372497;
        Fri, 23 Oct 2026 14:19:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:27 -0600
Subject: [PATCH v2 1/3] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-1-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_141933_588615_813F7C85 
X-CRM114-Status: GOOD (  10.37  )
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

The Allwinner H616 UART has 256-byte FIFOs but does not implement the
DesignWare component parameter register used to discover their size.

Add a compatible to identify this integration and its fixed FIFO
configuration. Retain snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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


