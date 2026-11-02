Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE5606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RAulHxs5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MzYd1dX1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=; b=RAulHxs5foqcT0
	Vy6i7wxdfo/knHIdGuhgonKjnEOvpIGvk8Q4wfT7dyj/J5DJqH6lPXpZOvQoZ98cbeM6hBJMIgnlp
	qTLv7rWTbgJNJ9H1SlLcFlLq2oBKm+76TwRW+XhY9qIcqmiuQyyrrjDMld4z1pcsDRwrBfTeBKpB+
	mOmi4p762GC25wHll6RsZeRTrtRnkf2N+oXvBmsWDt4Vqt/LTBtS3cZi70W4nya2sHPqeX6wsHXhF
	K8viBqoxFV/OmeqFjZun+ZrMSBPgGwejrhk1ZOWLtNuUN/nsB8++rBq+yfNCXi6CNOMfxV5yD0li8
	qUqmhERMICEZ6aULeNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlzB-0000000Fhlr-3HVv;
	Mon, 02 Nov 2026 06:57:41 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlz9-0000000FhlC-0FnO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 06:57:40 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-369f33df08eso5389824eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 22:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602658; x=1794207458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=;
        b=MzYd1dX127GeLxa/pvU+P7N0kkq4v9MAGQy1RN5DOUCFi8/0YWG20dnyO7YQWjBU9t
         E128KtI8WP3tdIEYAsRoGnPPHHPSgoYlAyghK4LDUHB2aH2hck+YxnHSSGk8XsYWUH5b
         C8J4dHVcDEPntfYLhTeet+f09QGjzskCQMCdvY4Or81wik3pzP7UrUc1zwl711kcGbed
         8g1dfGg0bZ75w5m6sdMYgbk/wwnmgqSeA82w26a1Zd9ohJYbtVMOsXZtHArg/zZWXkqT
         +bh+s3HWSh2vmvBhCK7URA01W8kfqV2ZIWC0tPlGghE8Vyq8LbykVM1caqDvV5NOmi0h
         AmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602658; x=1794207458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=;
        b=V+a+DtdR3Ms7P7C1dVvobpz49KBlQtpBKBmsDq6MpMwvpZloR+qLnJ+ahqLam66SRf
         UkfbNpcOA2TytjsFUfTkl5HGwLO3ejZm5m0nxZqPkV3x4c6nCRaIYN/Jv/bmBF6nyfxD
         txtCTtH4eDupIRhqR6Jb1XncaR67N4Z9Mc8utMoGfYfXuYBV7CLZ3dVR/P5MyuBWnfSN
         OGA2N9fK82WlUc3xzMwHZwb1rktdEGHrGzCCUE/hpm79ejDICo422x8PRbpknjYWM95Z
         NqSXrJSSwp2U7qSnAGRDBCILaxFQboJJGBUIyYC3nB6zNoI5uoykU3hhm6fRVFpHhmZd
         efIw==
X-Forwarded-Encrypted: i=1; AKwUvByu4A/h60CbHkXbLUeWEOkJMMQntaMqOEgZoiJCOL4PvNrRyuemmUmHuvwnftzziLti0RMAh3isbisgFC3LARx4@lists.infradead.org
X-Gm-Message-State: APuU4Z8gNcEiakLMMDZjRxdgM2igLi4Id+TUVDVN5+6QsxsUf/ePPvIe
	mjEW6Y66RFVs7oMqCgqF1WXtInYhbaovS0RPYcMvos9LnJu0RheBryXm
X-Gm-Gg: AYBFou2q3gpVH/JG4O+whF9iiTOaPeGVpByYdFMCWk/pJNeyMtxfBfCP7kGB6emmxaM
	ZWjpI9pYRTsJDrbD7uX9xYF+DS19cpB38Kygv3xNwidLGTrVjSmlORS5OOYpWqYhB+BcMORyE4N
	fIOIsEGAyvHr5T7hcwqr6LLjq2zADvAr634+BnmWawWpRVomwvJoNSGcapkXaCq89cmxD2LUjsx
	tfXpGuYYdz+ZYoRKkGlIjGQn6KCNPZGUMCcyne8RDqDE3AJ1bum3NP0p1uyaiJaZD27sh6voCRT
	xXDJgSVflQjnYWwuV2ei35SWwhmV0rfHRcSrAZ3fobDF0IB88TrRwhL8IGwd2/VmTqzoTkyoRl9
	TKwamYczS3zwLPQcMOgR1uSZWrS2MqDuk9nkTOoN1kt67ZMFaBBfoe74LewT+1TuDbP2OIpOYlg
	t9bNTNownNvOOQnWaMfHIGRLeVL2Q53pGFlslDchmP06+t67HM4jnNOLIOtaIduHCsGqJTyKgZo
	xZMG179+rtr04+Znw6tN4ZBKtDOfxPDLDDn8BVwftGOL1XC6qKtLlWVGQc8457wPfjQm8ChbUKR
	bx4ofxv58e5Ld8iUM5L22KxTaNj+o5UsOzMs6waBW3s=
X-Received: by 2002:a05:7301:716:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36a42453282mr12431301eec.38.1793602657852;
        Sun, 01 Nov 2026 22:57:37 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm29169317eec.4.2026.11.01.22.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:57:37 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Mon,  2 Nov 2026 12:26:44 +0530
Message-Id: <20261102065645.121046-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102065645.121046-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_225739_103602_5A0EB143 
X-CRM114-Status: UNSURE (   9.83  )
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

Add compatible strings for the ADLINK LEC-iMX95 module and its
I-Pi SMARC Plus carrier board.

This allows the board to be identified using the following
compatible strings:
"adlink,lec-imx95-ipi-smarc",
"adlink,lec-imx95",
"fsl,imx95".

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..1757ca4b0f44 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1636,6 +1636,12 @@ properties:
           - const: variscite,var-dart-mx95 # Variscite DART-MX95 SOM
           - const: fsl,imx95
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.25.1


