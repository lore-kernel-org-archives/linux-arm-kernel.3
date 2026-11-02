Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8760850A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PryQPKYK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btuhbWBi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=; b=PryQPKYKsyZk4X
	bHDNfamaoQ+zuG8tUkp7tk1JledkX+RyOHDGXjx6nHPDJf3ir5VMbCrieZ1k2Ur7Hlup5LxiaR/vN
	MD2bN0iWFGrAoIvoXtzYU/txyHSyLES6EVBW01sK6Q4q5a2WUdb5v8gavzJP4p7UD/P1YXOx2gCw6
	B/nnHjniP9KQ0eE57cBz5vY23EjpiL/VyEIMRUczDGXA2XLjLCOum2xa20f43jWRS3xRNTtsJxrD6
	sSokehRc4czZF/UjJypx+y54yuqzD9iQUPykRBVrxVKjcUObRGoesb7zODIzlDPlsv8DZ32BMDqfS
	lYe+a9QhnijVigY17qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7y-00000000EMV-0kcS;
	Mon, 02 Nov 2026 19:55:34 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7w-00000000EIs-1SqP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:33 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-46556b9e02cso2771718fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649331; x=1794254131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
        b=btuhbWBisLLvLNDvjQU4MRibipKYvk1lMqzP/L+WFTSDsun+tQX9CFUYDn/8DLrZCN
         jvowt4Gm+I1ufZYqpXt38GfOkVh6XbHkTSmdHYCRF2P9/jLm2Mgp9CRRSA2E44ADDqn2
         D+AoWxumJgVIG9OyFRhLWznUwMk5ffaq3HLn/vVnyXOpPW7vN2v7N2yedLPtHwVqMdnC
         avC5WXm1okImImiYnEr1RveaiacKPI3QnnWEyCMaFhqi8eXm0Bw9/uFfDhpmsENHHdY6
         fXnZ2vibFN0HdqAfbx+d4qkuHW3xJEKrcyEHqL45v39BzNH3E/ExG8H8nvDY2sjD0VaM
         X8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649331; x=1794254131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
        b=h9kzeApBDx40CoaN5H3N6E5q3w+szsq5HwUkeUCNMRrD9gSMSoyyyZPEnlthOGqivy
         LxAgBrVoIgLJ/nCiksUAfO+rmcdO4pw3nDF4ssB5ecoVpeuExaI78zmAF1GiJR7X8Fb5
         RSG/KoSHkom6q9xuJLFhSO2AZ2oLQijk77AwSjzt0Cz/3qS1MNy6/D/Ldw9jHTSkX+Wr
         E06rHhLYpeA31zbyXNdo5yKJC1G88/PxslWLZNlTXNE9DwXkgkYM6BHXuRc15figOu5B
         VfURsQ/szOKD8TPHZhfsTH4ca8vhUNkztBkFuWIRoTadXDmtfY/j3IjcsPswUUVAEXWZ
         ZAtg==
X-Forwarded-Encrypted: i=1; AKwUvBxgQOh5fQR234xA+lLsWgK5dypXt0R+JhZzSJU+znnE/IdVaSHJKCHZRovMMnfFMHIJLdR7hKi93GdGOKfnlgKp@lists.infradead.org
X-Gm-Message-State: AFq9FYJvdNo5mL+mop/YyqI2c9N+r2Q8Han4cB9LIKOEjJAfrxkKRe4u
	FwFAv7b5w1qVNwlBee1GEv5MSr6D6l3vgCRc3hcYgm9fyPMClAhkidXP
X-Gm-Gg: AYBFou1gTaONXgLTyXBdE/sa/mkWvDJUbI2kalRPOU6GCK7zHLzNN0bglarR0OG2qH4
	Uk4OwKv6M0GcnYaZhvtVBIyvkM6ip7LdnrloM4LCyuZiL5Pd2WqRcYNJ6Ir1iyDLI/VuvIhfsjw
	J3shbUV81+z/3fpcQNY1W774qgGXxZGvefImYxkwI1uQ2rYj4IWWeZezdBrah09thkn/h2UIGRG
	8XYkz+Y45NpQltAm3BpEYrlV9bnOBqaQ5wV4j5cDkRCdq+uC4eJHI/FtDAnwWIZeZ+D+xy2vH2H
	coV1jmFRVwhsn/1812s3PvDdtD5LZC0O5KIC3niiCMRk1cN1A6MhdICQZ/z/yj47gKV3SdgU2eu
	nHK8Vdtn1abGAN6CCsQvac60C9XjnOMsV4xMrzDqOMp/x1BP+pi7gC1Qq/Vui0C5uRIZjdqj+gZ
	fa1l2IOv+ZZJ6kys98FMdIimkG/Xbszr3We2MpEbjdNBYhBXmuXDlLc0FsHwF7aoWd0/VeFK5UQ
	hPnFCZr8vMs1rTD6klxjbMSVfqccJfrZxG/AhnUCZzgKsbgdgRD9gU5SfknZ5T2SPcmlEysLIid
	9Q4RX0XPAGX2i1/KXkBvzi+JXo4KqmmUxAuHni+fUM4jjKsA2C6WC8AUfKZslDIuL96TS2b9ev3
	0eJVtkY4j3y+fqiawnXY09BvBMPJiJj/Qq7RE+B4Eg/lhW6SQ6OW10XR0QH3didiuZNu7DShDPT
	m501CLpKG7vDLzFT3/NJqT/x6IunrVbtL60JJJXb719rUofVJUuNw=
X-Received: by 2002:a05:6870:f150:b0:48f:e0f6:bd51 with SMTP id 586e51a60fabf-4a8e0ac1b8emr6815144fac.38.1793649331212;
        Mon, 02 Nov 2026 11:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:21 -0700
Subject: [PATCH v6 6/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-6-25afcb346b0c@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_115532_430213_2B173FF7 
X-CRM114-Status: GOOD (  10.04  )
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
Its receive thresholds are fractions of that depth, and its optional
register layout differs from the generic DesignWare integration.

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


