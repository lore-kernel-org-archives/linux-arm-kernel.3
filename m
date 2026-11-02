Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A8606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fxQVE2se;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGEJaF4V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=; b=fxQVE2se8azdhQ
	WPC8/Htxnn6TKCUkzMXIP4HwHhSH2E5jEODQPh7BDo+mGNeH0qru0Y9L2P/8XQdcxE7VBWC8wPw7s
	3KgEFaWZBY781g7yQaYNABDJ5tk+/+1jVDB9eumLNbrsD/D8Yv2yW0kVxAz0uZDs6hzkv23wL+0kf
	g+JrMaNsmJs5ZGEzvsiCf1mRnBu2N+G804ls42QTozK/RhsWVHMzG7imbQzIQqR/4O7DeYshmcghF
	2eKolzfWm6MLTmiGlTj27+OnQ/zJKvrLFUr3nQ4Hl858DAvnLA4wzfeLmdumLbKoNAH/YbUgPOtQU
	PP1dzhH7JYejQ4Ooz5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpGW-0000000GAW2-0Zhv;
	Mon, 02 Nov 2026 10:27:48 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpGU-0000000GAV3-0M1Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:27:47 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso918812eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615265; x=1794220065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=;
        b=mGEJaF4VvU3ZtCcgq5eQv+9J/ukviLhxOJ3Fs4MeFV4tLY2XLXvoUiLJoJ40ON44qz
         VSziLroeHvbyz77G/loIzI/L8tP3aSD9GDzdw9Mo0MnuefMu7LdZlNNlmnwM2rqop5Jg
         wmAWC1+4P3Vs56/6iXHgy/FuVB42msoBzABlSbuCyk/sp+dVi/ImE+LBQLnsn6z4s/Nw
         ESEgWHblstLnZrcQJ2xqIaUFdSlVLdx4vlatGOvk9RXP0jDT28FZM0l8nX3azXGi1ATg
         OuCSOFb0DuNqbFmWS4yVQ/EHTexbBKIHTNBhIJTTe7/9sDO0mlhUYf9cSgASJS6jB/T5
         1e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615265; x=1794220065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNsBSkBoPNqus6PPGs/aSyWlW1d40cN1RtIlz/2UmdA=;
        b=a4hx2bWq3nDYV1x6N1g2WsZ5huvwmw5hr1RsRaYH29v3bH+iBkMetBV8iuARDfeiuc
         beHAUkvfkbJpSm5WMz2xbXgK/xKSVc/14u7qrTZiPniwvinPS4swRIJnonng225OicjV
         WUxpgyzstnsl3SorCNZDhsc9W/XVpfNb5HGDxwEEImd7G+6tgm/OTzk5gjQ2U4+UUpJ5
         +6eENf7LIz5RRd5n89Pl00ZwTTQC6sdy7tZ1VdPIFJTWfQzO090H+5+9cMaaI73C8VFG
         UJ8wPE506APwNCs002vNZRrFU/OCjdO49AcHEvvm5Wk6LpU5Ya7I2oDNKdEopdkqLc4I
         BNKA==
X-Forwarded-Encrypted: i=1; AKwUvBy7g9RAxM6hkUuyxilJfFLeZPWy//oNgL4NfUYmote19+zLKVuf1VJ/0UmMsPurpe4TWM0BBGRmaS8Pd5BhzrGs@lists.infradead.org
X-Gm-Message-State: AFq9FYLLmuwTNFPP1oDafQRoBYzwDm+69lFDnlxtjwkCwQOfQ6MLdJxZ
	dR2Ga+7rmf3YuFIXBOdf9EafA3QSf/pNwwkR61zLRMkAiVZi6nKk/IKZ
X-Gm-Gg: AYBFou3dfk6ukvLCHCMv10nGy1Hkc4ewwT+ABDpbeKpymTlWOu1izlHS7k8eApIvHh6
	VvB3pOpx6pbaoBxPoUxBSTJhhMGOUaYzEDIaQGzqva/8i+ascv/GF1v2nEcK3X2wyOMIW0MWw34
	lE9ewhtzUU2uHInjo2zr0utkTE7wuxQlF51Yk6jIQTchDBAKh8MNUGrXSCH85M46rE2pIb2NtnU
	o76eoLgNK5wzefPqBRRN1UZl3ruYXJIOVYuoSOK+SHMrt7O1C5ENQ0qUvCDaB4m9LPUioC3zp+Q
	KF5BDBdkReeqsmlfeVKbf7/FWXCj0LUgLAfP6HsDtSFf5sAu/o6pna/8PGyNqkI3xVP6u+FaV6C
	1pjKl4RwXyw6+JdOJEeZI3Fl9xaTwr8ROXLPinZaltzsc6yDQpxxlVx/HVKcp7bUCLPctggB/Kd
	4spJqzqoyJkmGGTQuJWZAIQwwkMHiPIjt3iKb2OKDEsOSh3CQwNcHjdQS64Kt1OcP2sk9xZu/w9
	Ka+AicykweGW08HPbVv1D/qghWXKDajY7PBaWyDlMbd5820Dr98Mml+QBWmNGp+F/Bew9USTHJ6
	MKYyUa29dW3r6MEUn3OMXrn9DUFEG/mx13XVgQ5dCJI78seXs/16Fujh8egh+csIeQ==
X-Received: by 2002:a05:7022:628a:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1ac5b9cb62dmr19707765c88.15.1793615264990;
        Mon, 02 Nov 2026 02:27:44 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:44 -0800 (PST)
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
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Mon,  2 Nov 2026 15:56:52 +0530
Message-Id: <20261102102653.272056-3-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102102653.272056-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_022746_126126_3DA1A624 
X-CRM114-Status: UNSURE (   9.18  )
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

Add compatible strings for the ADLINK LEC-iMX95 module and
its I-Pi SMARC Plus carrier board.

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..baa96b004c52 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1577,6 +1577,12 @@ properties:
               - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:
-- 
2.25.1


