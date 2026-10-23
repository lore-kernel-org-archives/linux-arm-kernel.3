Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EoroGRs7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mn8dOb90
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=; b=EoroGRs7pKv08C
	CI5Ur4d2tp19vZ0nu4/0YNtBKX8kysdwTtKxSS3H5XU6GZnsdO5XsMbyUgXWnVE8OSosom7AEloy6
	Sh4efDKB/7agWHksvOdC5gX/EBmpbrgEpyCdcZ8lKL/1VFJ/KI4uoEApMmo7YwjEWyE+2BN+ZzFoN
	f3u5xylVVXz5oyXm6ox4bNvWaBtswTC3ISSldOAprji0ENg/A+uPEo8v9qXKLDyh2Jnp2QRC5idkQ
	2PtjZCE0xI2swakJBlW0USdUXZNYKsTtgoFr5kODkqd8Zgx29kZRptlSwjbFsgPziLp+op9SZvIvs
	EsHTfQeYb0KxXo2iRh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9mt-0000000FlhO-0cdx;
	Fri, 23 Oct 2026 07:34:03 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9mq-0000000Fle4-2Mgd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:34:01 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-81ae6aefdceso531729a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740839; x=1793345639; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=mn8dOb90gBHtPj348krvSoaERwLJOGPNI4h8TVhjfUr5sUWpBA7QSIeVWIigjhEEmZ
         Q3q2zyHeaZrAAb8tExXxFQbErSn2woi//j/QmHB/XfJ6LOAE5FQwn2TkNKsXNGk0MFpr
         1+mTyvl9qMgboFbsnGthhVGUrgztdP2es+F12tzzTth26pEJNdw5MGK2RYtlpiOkKDE5
         5KaHksJ8VtRDrCI3aDiujpghHptq5Z7yg5ovLddNIj6rO+P80UPBNMpzakuWQT2D6ynH
         NgKpRaFnCxdqNVreBmeH5L29BeTAlTTz+2bEnQpFLLQTs7KN/ZrgyEA90nFt8Z0GucwN
         3VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740839; x=1793345639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=xacShikE9NjYsMo3bx3jncgMkQh+Ni3K39oPzwNrZZkZQdveq1ppWQ906A5Ie0XTj3
         j53Erdd+jsfYR76nMifAYzFv2XRizni89F/U0Pcn3FqKx0gVsi0pX5vqyI3KOYgBc1S0
         NU3atvDCQKgTeJeWadHiGKubdUTN9UBxMgljTjQNK784nsO9X2D6nZfnl1tIyaEZpxoV
         zLK6nKRIdeQEwHErtsA0DQBrzv/GkX47EWq8T3zCyx5X1po60BH30RuaqbM4z5eLwJ+/
         IhjhrH2alUZW9N+n8d9AJPp95YoyfhZnIGdDqMVSQeZifZ57jSknMm+q9ldmw0k499eF
         QmRA==
X-Forwarded-Encrypted: i=1; AKwUvBwcXsPjY8Rp+55z9N6MnnJt0200PgvNIN6IVljr3abyX+B5+KuTf27M4Z/zS+B2RxCfrrOx4TBxJfWJuiKXPsBF@lists.infradead.org
X-Gm-Message-State: AFq9FYIKraNEWv32ShPeplyYEzzKKmvoy+Sr/6VO3OyyKvYODS1bhXAZ
	5IljnBSrNG7mCcGbQVX0kMtfsQDLshm5/p7MOLADRxx7dYUFo2CeJBdb
X-Gm-Gg: AYBFou1h/aru+CaJxctOOWFWDTNJosW7Rmw6YhBS3zdm3ddUqgyKeW9GKPQeAHW5Ejm
	C36I8jXvPV4zhGKmF+7vaWhxiBWibTuPxkNMkf6oiXF8a4bJG4tWENJLhElLOPsFxGA7XC6DuRw
	eYfoKkv7angsR+eVoaFzQdsgEBp+U0gzlanJP7/AP0PYOFF1HbS7J5Z4MEWpFGBMYa8Q9XEAKvV
	4fRYb2uhCKIhIWUDcFnWjpRQ56U9jsMI4QW908RXJ2HX8KwFUeNp5DZ3UfvaMI/eiueZtkS1BJ/
	kUUEdkadQY0sLh0s/9uyHNcFQzjOPgpML63mPplnIfZ3FgUgjy7tOifPNU/phMUizXbf+/4ZOTv
	nbmymcjzRWbnYnt2u1XUG0y2JLp6FasGIYkAgDpgi9RJNbgTh6W6GSSNi0dwMkHNwk3iU6EyLgp
	5BWh0+4oqLNDLusW2m50czd3wPPcjTqrFbzWPRb9oTHbqWZOsMw35n1TkdxwXDm0B3SrGnri+5+
	bFkqhZTj1mlvsCsOy2yYyanp67+ebSHR6OQVEuTn22DgL5EJ6JiR69zUfJes2C4Vl7nqHrY9QJp
	jMfUUXJP3USohqZP+pO7YhU7Co4x95zft9Jlac6B1+8wlrplTxT8Z73P2nqRY6agMMzZdzuiamt
	ZWiRfaS82Ph3fl18vst+qWqkF4u/GNVsxWM5lgVK7Ih6LteCDFg4q59BAYn8DIyqPH1jb2DLo5n
	3rZrs=
X-Received: by 2002:a05:6808:16a8:b0:4d5:27da:a496 with SMTP id 5614622812f47-55be873584emr874475b6e.48.1792740839404;
        Fri, 23 Oct 2026 00:33:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:33:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:49 -0600
Subject: [PATCH 1/3] dt-bindings: serial: snps-dw-apb-uart: add Allwinner
 H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-1-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_003400_646933_7E85F762 
X-CRM114-Status: GOOD (  10.26  )
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


