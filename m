Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4D7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LtfMp9ee;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gasqjzc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=; b=LtfMp9ee6TEgon
	62uYl8zT8JDL7XX8LL3cQewcijuB2OYiOcIMgiRtK2HNNJLJx7Bc2yJNpUhRn7hTFvF0HbJCNwjjc
	p/WCOdiOXtR9zV4fW3sruzfpytttTKMwJIieOxRibjPZ1k0Jy1hNCbruOplTbWtwtG70IkV2LCoBn
	Ga1Z6A01oh/v+6C3moY0Va79WA41hljCxMt43ST6w+aL8NDutMw5GLhMnO1GYmaAwLloo2ZcR0PVB
	aZKbSWfeKK4tsIsXVknYVJEmIHYvdubO73ulSSEHhH2GPxWHv8bXTW0eNFKy7txZRFXXIj/WO5hOV
	fDOWxF4N9uaW3sFKtUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVAD-0000000AA9X-1EYf;
	Thu, 29 Oct 2026 18:47:49 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVA1-0000000AA3C-1Qzl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:38 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6f5a0893610so1994721eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299656; x=1793904456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=Gasqjzc2RLrGes+Cppl+WsC78ExQEgQHEUZbGUNmoHIo9dPDicPAitIGAdFFXj9lef
         +6m7zSAMzUlS3sd594tDMMpfY9Ssc+7r6DhdhGaHS8bWykqRvJSQ5s62Ltd8hNzPW06p
         MJkQpfplbERSMM5n149081VDDnNfhyKGLysmioQohRjCiIMlPtSKj17JpVF9rEpVC4oV
         jExz/9zhsFWYOXOyWj1STQbB0YgNSAxO9f178LVlDR+/dl9+hGhhQOXZR+M6WEfl42yW
         uQjr0LTaFeFISJ3QE6U7NjQ3TiQjv1QTXhe397I0uWcfeQLWr3uTvGl+tVKrk9HuJdPi
         8trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299656; x=1793904456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=VOZbllOXzOnZmS8vJ5/KRh7f8d0Pb7AA97lXCD3YN2kftrbe4Wz0bqvJRcxcSC6QwW
         tqw/U9pEDXor0taxFN1xpQDr3y4RhV8jZTmH5k62woonJPuOuR+0gcIZzhtm8EGEko7j
         CFON5QC1JJGgpzYDXchFXID2IM//7/mp0jUaLkPix3pouqkX+1Rws9zmpeNjd7RtIMDH
         D5gUQ+TdNeYJvY/fJbAx+aeWtqBfiUD7BeOO2zn/+3jjp4igPSDbJrv1eo9cKrxtVp45
         jiRlBpo4YLEJkT+TqO8OWh9mfaYqq5XrlREBE0KDTYYnJMQLHBmytUAmT/JpVzDcz6t6
         9R2w==
X-Forwarded-Encrypted: i=1; AKwUvBytF0fY1+bpu0YimC1HwnIXZbncP7aI6hsqLCqviRZl+fZy4BYljlznTYzTxhX6X4tzOeV5Iu97OqzgSX+IXLoQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKcRrysLfOvY2CqNJJtar3cGmUD71Q9AgWl7kxW22NWFNvpNMTr
	4mVY2rXu589ryTqSQYZf+kpJYOkxEo1QvnWEMxcYHTQyV0XTKj1MSYy0
X-Gm-Gg: AYBFou3WydIlYmEtweVWG7y2y6Y13JzyIxRd9topwTLot5UnfEC5v2ZBPrCznZ9souA
	rMCoaimayImaBsVoZThkRlpP7gNFFX9DYyYLsDh7nSwzACfi4HUtFrXwtfeL9dmpgUj+HyaSrAX
	fuvjFhAxQX47itH7au96Gw6jzxH9dTMdBD652lHlyXp21ETCVluZ3KxoYCSZ698BB9+iLOaHKGy
	ZYCmxEZx+uTEuCiMp+sxlbVaoMX+SFBNvv6yfZCGpt8gJLJF8XGhz67eXHGqvODOndkZmUHCbeU
	yZNyMKFXiDzfnj499+LAAgDagS32lxtlJm2GY+09jW/b7oRE7x2iUd2zGVTdaIK/or7oPkoBU5y
	Pgfrw0ffaeQGVVRTwreYtzpg3VRzzh7/GpwGY/d1j0WAJC+ReVf5WGHdAOBveSQ39oWSs0S5qh0
	RulvQnvPab1X4YqVUkPPm/oQzm0xiolusQXenW9kn3Pq4yjUJb9oY1Ar2ruDbMRY5PT/elu30CJ
	B4VvLbzOXnB9EREa85850LhMlJRy4h+hJgSR7YSHn7g2rkQH/pQui8pTPp7EmtEGiDd2E2xNo0E
	kKXgai5rPwc7kBkOnmZ1K1Ova8sKz+Bt2fPCrxGKuWkf7zkYCAZGRt5eFHGPYWsWG03uyaA7kpQ
	T2Gup/Xkfn2sC3baGeWBw9JRiYJGK2JuOijFlozY6gAjQzGcyUFXnBdSX5Mcakkg/Cyp3l1Tpg+
	s5Oc+aWN010jOmZ/Va8YpbEQeQXVaMMnmbBG5lyHgy3hUn0TnemIQ=
X-Received: by 2002:a05:6820:1518:b0:70d:9be9:5351 with SMTP id 006d021491bc7-714f29c23camr97099eaf.36.1793299655746;
        Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:24 -0600
Subject: [PATCH v5 3/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-3-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261029_114737_392929_D0F2FCF7 
X-CRM114-Status: UNSURE (   9.62  )
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


