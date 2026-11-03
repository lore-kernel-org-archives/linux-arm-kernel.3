Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D139D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1XmO/min;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivHVzEsw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=; b=1XmO/min47aEJ1
	0WFq4R1wvrKWSeaQZcA3G1qX+s79T4vaek4zuZxW1HPENSw2OzYGkMIYb8HL84pSHTCWW8TbE4yln
	xDRE7EMbiaWj9Mt9cXWTU77/ll5E47gnNiXeeZQ70NxwWyQwCKm+Bh+WQkCJQjJHKDMRQj6FEe4b2
	N5VQx2+Kek/7g4WNTjECYoOpH2fsCvOIe8JJlJnb+VQEAc4PtJ35XQ8eNG1ZZpQ7HneEPJwXGuANr
	1bfpt2uUGftd4P0gOOwLnRxah7cLTrwMdwZ7iXmqwRzpzxvK0BrVO7s+WXPAGxP9U3wbm7Elau+Rq
	C+YpN+UXDb+k++RLnheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEx-00000003jck-19Hw;
	Tue, 03 Nov 2026 21:40:23 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEp-00000003jTU-33ZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:17 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-85d363fb73cso23771a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742014; x=1794346814; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=ivHVzEswQGzt3bo9Yq1KlcX8uteE9c5M41iDbc4GODZSQNMidDcFIUBzXIsVd5CSDS
         1eJgdvJcDouXwuIA9Sf44m72jiSGNiVXAb58yWI9KRgPJN7RmqNqLkLjIzwZO1uw/nwr
         KGqdPdXeUP2NNE/N1OmC+HKSo48nUZvt+Dg/0deWycXSmL722B06gO5zG4ound6PEydV
         Pxbx1iH52xM1E73LpX6gpISqdliO6x3+xVi0MPQnuc3d8KsZWhuoFJ/OALaU2HeLA0Ug
         ETo2UKwq9tXZ5yPWobyj4Hn2wC5fzO8Kq7zHcNlN9rgKAk6uiKkjlm8puM/nTOYucIDw
         eW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742014; x=1794346814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=215ic0jWfnTIrY44GsfuRf55/pChbmNnF0owhevlDXCAXX6UfLFaRdrqBrkNlE7SK4
         +Ig4bHJ2aGnW767jP5BMkDdzIr/pQatuX6yfUr7BJkKD+otFDRNuZ4HVrXJooQacxf4D
         c1QiObJOZ6gWr8TyVm83Bo6NOdAbCyxes9hOQD/kD4vxoePo6hokFPb4sZXV5MaeO5G2
         Jl3q+xOuVTe5pExuydfzWUsTVFm6M7QXZrjtSfaXaClZ84jOu8v+UfnnoKl3H3oaUOmf
         Q4RNkk+N7M4fbpTm7U3sVsz2R4CMGLYU3yTkgT0el+15wdgK/qQNGmNsfyblbO+aTm3+
         0x5A==
X-Forwarded-Encrypted: i=1; AKwUvBy3v0ipGdOesm08prb1WETQgcuZ+qvVGTc4Wm3hDT0APIU1kTeCwjgLbKMdmxruCb/oqBjPc5UFgEJLBlu/TMvI@lists.infradead.org
X-Gm-Message-State: APuU4Z8TJDbNdhYXl6oa6ZFsMuWuEwtX1d7SIoLOlWwf/9QemZKqm1iW
	Gicxi4K9++nCMGFm+vSAdqLgS7lT+kmz/p4pLo8/gd+bHjYC7OFo6ydn
X-Gm-Gg: AYBFou0QMDlG/VZg5D257hjREGt+1GY1MrHmt7Tp5bn1w0FJ5UYWhfktEAS/1mvRGYH
	wlQ/y4oV9hdV5CTWQATSiz+U6QDuhc1jWowMbMzokoMIhx+ApZaBWFKsuFacXQsNWO/IaNRhN3O
	hKsnlOFZntVUgHSNYBEUdnsFdyms1V3q5RmoI4VKX7DmdJFQZfPNLBA/suyQvEB6Ev6j2Lq22Kz
	ow21kwaLu1h1XNtw2HVNPtmJI8tqERsVT8I2vuZfICfIy8Qy45gntEbrcy4D/RzdpNvK39SEv9Y
	Ise+m3dwEbiTjJC2VHvMoLXT5PaNINM+cooAX4lR5D42vnLbsgR9KmkgICdBBGy3IL0GUVCSFcp
	WuMvm2umJPP8e1H7wGKWkTZHDajsi/KeFMq+qLITAkvEry7lPCy4tynpmluhOUYF/Aw9aV2MCyZ
	yGtCVrOa2VcNDeZqz1fI0FLSpUPFS+Vl5m5fWkrZYpy16Ipcc1S71PNl4vVP54No+c4gCAoAeve
	fbxfHSxAuFNWGIko4zl4TnRuBG9kzCKjDcNXNkDfhUpn7QA3FzI3j4xAzlgrjWX35GCa6WS0B55
	Mw1/SMgtRYl/QYfc6muJltqdBoOvVfveIxdoEOaLhtL4P+LgK/fnrz2T5w/TH/dbJlzUaI2ZqKR
	vebJD6FFfvTVvhbnd/O3PcvGRa7HxHbvl3jHTUH1swtc0+Qoh7T6OAbgFDKntf6uBCdPnonL9u2
	skTlROmSgIVKarTgUhFtZYEL9JZrjJv4INuwEW0PktbeynysoEkh6+
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5640dddd764mr9603574b6e.36.1793742014606;
        Tue, 03 Nov 2026 13:40:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:02 -0700
Subject: [PATCH v7 09/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-9-c9e248d685c1@gmail.com>
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
X-CRM114-CacheID: sfid-20261103_134015_789710_FCA1671C 
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


