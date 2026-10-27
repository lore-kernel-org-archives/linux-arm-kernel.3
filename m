Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B87E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=15OdgzaI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vtinVxNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=; b=15OdgzaIl7fMGe
	geG9ehV3XujjV27wp3adQp+GrKVnfqrqxLrHwIjQNdXY8lGdvevDwZ07OSbIHaf1NvOxoICO3yPPz
	v4uK972CmEKTxWLnnS5m8s40jT3qqZQxw9e+vMrafECxJPXrBsjQ2F1QoPbnb1kdKb3EcrHDf9IXU
	e/koc+VO9mljrynOnFcjE6eZTiEzAP2qzNYjlphL4eghgIcgjVEJSbLErgRt/k7X7dJ4V2O7su0ej
	AKHtiM8nabwR6X44eIvIbj2TaSuzabFW5QZvQb60E7PZUvwSy+nikw3by1jxH6aKvECXCMPXDfd6a
	GTRKjaPB/ZuE2fJbPWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEs-00000005tVn-2S26;
	Tue, 27 Oct 2026 23:05:54 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEn-00000005tT5-3zwk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:05:51 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-847ac7ccd85so245895a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142349; x=1793747149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
        b=vtinVxNwtGYhjpjukVkr20fVBQ1FVKqWHCzd7j0+Vrq2KNRlxYsb1BF9bzE3iRRLSo
         uKILbwOZGzuefq8O3XCWPtD4qg+wnt5eJT9LAhOYc442Uq2+Vo6ReJkFakwdVmObEdaw
         exwVaxT7qzvqVV6jvx8yjnZMSqn19U0YJUAdvV5ftu+AdH/wxaMjD40AoGV/kkRckYN6
         9MIEkULIPonwYAy3T3dNHOH9AVvnJOx6WT/tV78Dyh/6+p0MxsYEbXJJFpwE5EVk2Lp5
         VVZ3ZDUEyo/2SEMp1zWbYw8pgQEAKY5Rj71fFTexGK+IlVuELpKbn/93OmTuvJGiSAIW
         pgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142349; x=1793747149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
        b=MG07eoW8hNFRu0lQeO0IIgR/9qcd8QydViIBwFSrej9MHpF3wpr5Rwv2zzhL0e+LTc
         ydHudVQzgJ5AwUe1YIMeQgiVFjWy9ue6RXuDVSxLprWoThKDfn8nonXzOxdalhlvfjVG
         OsZYMJ+lto7ykmsQLnfL1jBmRlGQZPtTUx2s9MPATD2+DBD7GEcsUKV2C3rmlHnH+5XM
         fVkScl0Po/vhEQS4GZKax+Rn0TsfG9e9GQWdZBy8deXy1NAeeSKcpO2G6p0HtZJLR3Fb
         akKEh3Hl8MzkGc2pi/NfidY8/zbg65kZZoKilhYk5gHmmjRv0XhZxTSO/WrI++xMlXp0
         2zGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO9+cWz4NHcMgkW2dyiho1hIPjyBdf0Tjn5HaiQq9WKPjRnGcnAIXbu7FbkI8sa6+2YmcYmMPiunyME5TQnA0F@lists.infradead.org
X-Gm-Message-State: AFq9FYJhHaNMWACNjX5aE/Q1TZYJqVI4fqhtrHxETn32LhAKZMJrXISX
	3mtt0Fgcvtees1IExqytzB5eVEc6X8SofqssAGVTp4ABgh7sYojThQI/
X-Gm-Gg: AYBFou0mmmrIn78NtoR7MKOz5LmNtM6fsLdsDdgBJEHKcHg+QITnUk1D2mLXanE/EUl
	YEPIx8VU8K+fwuwtzMuU1zJuJ3Ul5u7TCUqNgZHXwxYMUl/h6jIhWRRJf61N4sZUgG3KFf31Nb8
	P8gFsOCFz7IZzfWHGVBTOb6fcn8ydevlogg5J8UT00jG2lvpISthpXz+CjeecbkaQd+nZXVxQgt
	vMatUXPk+FHspCE7m3aLGxVApcqCc0Y+pGCTFIVqQMyv7yTlJfDmgLuHSoYRC9bV4kh/QwnwXTM
	rMXPnhDQ9DKBxAWyFT8r/2s9ZxGjQQQb+wF+Mn1tegRpGVzjM1PMqchbR8pymGVfUfead2mwRvO
	7N0E0V3a7DzMkMxL+QHb7HgaW0Zl87qToSeoHK7cPHY25DzCapP4rZPRr4ie2MDEA1xQ8/ET/BK
	+OudRUGaAPf9YMD7D5+V9/TPqQFaqsjnq33OR0xPCoYdrFXRG0bXYsTq4zglLue3GMsJsNnkTIr
	1sXwsqPwhD2JLVYP06QOYUkD29IW6R0AW8egpmBKDpmoAJmlPpE+T87MEfKIStEfB8NoLpMt5MS
	/Lr4qw/2piIo2SomNUwbaPfgl5zJYG1skwdp+pibh/BUH9OOCyA+16o9s9yZG43qsYbZb6PEfR+
	5iwHHPPHlx07o5mpx6fG2J7ubOEETSrQoF63cwlS2BwtXW/lcrAA7IWk3GXrK6UkMs7P5tBh5/r
	QNkw==
X-Received: by 2002:a05:6830:4aca:b0:824:df9:971 with SMTP id 46e09a7af769-85abc7246ddmr898761a34.10.1793142348950;
        Tue, 27 Oct 2026 16:05:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:31 -0600
Subject: [PATCH v4 3/5] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-3-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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
X-CRM114-CacheID: sfid-20261027_160550_003039_ECBBA63A 
X-CRM114-Status: GOOD (  10.29  )
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


