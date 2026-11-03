Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73217606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ih0ShGX8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JxYTDhRV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=; b=ih0ShGX8yH/VOB
	tFiooU+IZ4cIOF7lZJKLxNbYIHKaey9RPdJxbLI+4GrFM+cSn681QI0NdZuwhRd/XZMvBSM//kdxB
	gjxtIKcDRN6J//Ew2QyoLQE9T38ogeQRr3UeUUWFbnCTl3kfomuTLmFXb+0XMf6XS+7M0toAgZsHY
	Ukb2BeiUfrDyS86VCl2rc6xuLQ/+WuWUHsK4lrqNIuFeqPlOp2PpIjEhMkRgzKQqPeojCzR/d2K0G
	ETSGSGH+kMcPMyxIdWtUr7ekmK6ntq5leAB+EQxQ3Aj/rvpepDcJrjTvqeQqMeytOyh7Zvc+9T5hg
	58dLnAw6HNNrX5eNvuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEp-00000003jUa-3DO5;
	Tue, 03 Nov 2026 21:40:15 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEm-00000003jQ9-0ien
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:13 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-5058b105df7so30645b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742011; x=1794346811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=JxYTDhRVGb2c+3A/AljcTyySdixwTnMVgxIBeU5mzIBK9VnRtrGe3mbunHOoAeUySO
         jcT9MtRQTJVT6m9hxN68Ga7CPlv+WVHQ3Jq+3IvRA23C7ShEUhfzIkOHqjAwHOdILjXP
         zGiNX6cjXWgupbQUne4peqLNLfuaoyEwWXEauyDNcS9K9SOJe1DlXA1IAJsTG+W8AzBZ
         3D4hmjO20eK2LeHTU+OA0yImrE7OgvGoAWNtrygdaOQe7FsWDiMAn6g4eLKi56NKtD8y
         tmeoAIlY3NWqA1uqSs8Y27PNbdT+nfyTv9qvbfDEZ0qS7wCJYo4JharwErTv3UXcybiy
         sycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742011; x=1794346811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=MDbtcoHuJQsKCL23W/lKgJCjduK+NWGt9MDHlUxl5euJoTFmkd2TA7ItlkBBdKlA0/
         aLys8FpEhN+nsrpitRzkA4nv8OfYWhzcNP3MpK2oOdb5jro3qGte97Zs95uxnCkgCvD+
         dx6hSCdtU94+q2oTr/94W2FXAzu78SIb0VBogHuoWVIkV4PQ83k5HEByCeulNp5gqplq
         hMHHgF8kgG5deGfnoGHgrj1MqrnqA6WICJc3Ivh4fMFy8LGhrSwJDzNooBnLTFQCq6TS
         OmPKv7YiDWgDGxRT2jtDNmd/i5e8WYStGMEs87uG/3Y9WVl1FYoShaC9Kvuq1DKtJIzJ
         SnVg==
X-Forwarded-Encrypted: i=1; AKwUvBx/8zTKHubIQHB7DUNtcr1k8CE0J1HQ9YGPneFYjSa0S2FgIgeBMfo8lO6TLdP5kYQPD8kfgfSoqZ4jj/e7jVrC@lists.infradead.org
X-Gm-Message-State: APuU4Z+pLTm9jn632zbnASeJxnCpU83mfDdDmmfdIsnNx89ho+Y4/07t
	pIE2pv/o5NvbjKNuACtJFZY3QSuM5bRe0KAO5oFlr8in24ksVNjePhVi
X-Gm-Gg: AYBFou03NShoEtC3M0nt4gWIlV4af53bZ6hoGFELvlpDtXeF51be7wbDXd++ccTkBb9
	rtIoyDyDgW+v170qJGdt1KwgZz/C9naJ0/CSYrc8hJJO50bg3k1nXwwh1pWpuaJry2glCJ5rq5x
	7dnXV3jWAM6as6eP0kdGelAc7W9FLiCbrZaZowGZztEesBhF2+0PmgKPOfUJKQhfJxtF1nxwpej
	q3sbz9aEx7hporAKEGaBj8AofmTBx/fORDpnGvsKyuLrJSRPQ9hMnOPYIgwkL8D1mZk+8meCf8c
	dYQZgyEs/1rDNoP/HFC3XaQV0Jh/PMwE1lDY407SV1phMJ+QtU855Vj8RGTSv0oDzb1XD+6C2B6
	Fpph3qvAA/LGV0M7TTplYRsuVMPyDKDdKvvBRBJe7ALNFKtPUgN285En2OcaVpJfE4fFOIhDe6Z
	okNsnx8BD6IOkD/QTXFl0dk2cG4cBnpjcEssiV2eGAOYAwT4yaBGmHHHHhQFLG8PxExKG38VsD5
	zz2dmou4+I9hpm/v+v5EnORy+ULRLyVZKlrvXx9Z7ZCB4KJX0FKRy7bB4rzW8q1Sz6+TvzKTPPs
	G+e2SExiYnFbyDVd5BuvT6G3RY+ZJweVz45VOZN1eQPW0kyP4kEFKccMqD8EtXjfHEqs+Gx6ZsM
	HOHPRxeJ2hE7sruEHenevSkJkFTHJq1P0XpU7TACjq7xOBOpb9infC61ydno36kf6htzQFUqWHk
	Q4yK8RdtrqyxFTZitqg+zIgkLqyaERBL3ajyEgyw4i6gamZoSZuoMA
X-Received: by 2002:a05:6808:2507:b0:4d6:90d4:6bb with SMTP id 5614622812f47-5640dd9d63emr10403938b6e.45.1793742011356;
        Tue, 03 Nov 2026 13:40:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:59 -0700
Subject: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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
X-CRM114-CacheID: sfid-20261103_134012_291878_450F388E 
X-CRM114-Status: UNSURE (   9.79  )
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


