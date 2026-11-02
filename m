Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717C606D807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=20QSyeob;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIkKdnJ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=; b=20QSyeobvqrkc1
	0rtvpC2x7rL6UrzGWIQoTh12nb5CSr042lPRIl93ZzQqJRIU8zB/AzMj5K1PApNtgWXXssyjS2fIW
	yJ13nh7QxLLiOl7ML4Tczd8ykTJfJ+W3O1PAUbNXAPTmQ3zI1vGUd7K448t+pYiKVKz6uKdN0HBVh
	wG0Bb+RXXcimt33NTxzNyP0DFfdVAQEZi/e5EA329MQGTdqUXDMAg3uvM1yDme6zlcGkQCxYmK33I
	ieSc+hp2k+R2yCloz+yUUTNvWOPu+ulQkCWZk1F/jVjwJAlu9LJ/7fIAcF46GGGcLNlP+WYWL4V1Y
	REGJBD34/wwE41fPXW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxBm-0000000024i-19Q5;
	Mon, 02 Nov 2026 18:55:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxBk-0000000023C-0QiC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:55:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso33964665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 10:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645722; x=1794250522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
        b=zIkKdnJ7BE+oW4W2gZvTbNI954OTbc5o+zxigTUXvYIt2vfp/aU65ljWgUZOks8NWe
         xppv9ZyvbNJX03PDgNpvkKQmfDlNDvul7GG1WzxHP8SGn+Z04wgPNn5iz0eFHhc7XFvO
         XqYHszmFqwZocj5YTiE0sWwh32TPz8+pMNaOaso8DOuDkevYAnIsh0xCDjD+HyWaN6IP
         XbEnXlWAQx6o+E4tfE5cWZc0u7Hm/+m5kqiLgPj++n1b5rbCPUXemCCSkgbC8uejgJiH
         x2JgHU/roqAlhBOJ6ogLOu/SqvlRq5ojrMepT7Td8whbMeiz59kKCN7Tzcfz59KRDL4O
         CQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645722; x=1794250522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
        b=LH7Tt4x2TW1x5Wn+G5QoO7YOTjFl34m5UbbZqDvqiu6gNT9QHKiWZ8AVH3QX+G5WW8
         NVsyL7ZZgkP0gW1LDTjlLeAfdrTREEmdwy3Gd10f+OMeyttriT7MgTx9avZRXcu1ZWpj
         v3hkaN9roiwh73S8IGcLf1oOygpEkb/iv+WkkRdE7ujwJlIGjSNo/s2LsOKAu4jTwcZH
         Q7TK5IAiS0bFQ2z7zbxVRp4fPNlWAuOwWutIRvwXzuUoNpXFUZfhb/wFicEg8hT3GJon
         n1uh3XlEZdP4Li8MwH7goBoUqyLKhpts6CZ/ZXU6SLVVwlEBfvLD9zW1AvtvWbgYe16s
         azlg==
X-Forwarded-Encrypted: i=1; AKwUvBzSvl/GSjjNqAnyYdy6OE3Zqj9WuucxV5jbPa7GpNSJO/bzQQR7ZZeUBV6lyf5qI/fLXoNegw1Nk66sIXOi63MR@lists.infradead.org
X-Gm-Message-State: AFq9FYJbHtGJ6cZWvR+GZiZLuhDteHUdBV5xTovmhAxZp/i0JfO24X8M
	NHDigwAyN5rtcYTE5uep7e0PVla7RCTQIlIzV7gbE24KuZVKmESRmtB8
X-Gm-Gg: AYBFou3/+o84Ddlfc1BrU2tKOdoFDGR7VUEjJB9wbCE76w01+aN5N1EotRB080FSJL5
	d1h2J2bQucp4++5OPPyRg09H+Wb4ohAWOJLJJB6KxXjOL82SnoaFj+U/w8zoNMNBAUnhnu7TqyJ
	wK9jQzgg87ZA+3kup2oMKKH7Yhgkm0D3p++AD9+/A9L2Tsw3jzrXdvtW4ddATlfNUFs4pXtCobF
	6X2y13vRXyhbEU8bPJUeJWc87J+b+t0DPfUI0Yhm8l3TfBJjzwp4qYsOVs5ZJ0vXHqCe1cc21El
	0D5+KkjqUqbly7j2YaEO+pWG2A1O01ZzdUeSkYZhUV8eqzoXaa5NiM42J5DTuSWmgXp1XVhDW1n
	5KZG2o5kGU2GdJeDFZKUYZcn8xK075lIvbxqtOfF5fCTC1ewZZ174Qf5fxAr0ssyGYhZS3Y0/pb
	c/xfoOX1nUQ8rjhMsgqo5Ry/7HrjCZGp3nWICbbBJCxJ1RYuu1g9viMEn26IFutDPg8n2NAeBOx
	7cZm/ALAkLMypKRjd+eskQZnsNGpoSjZWydTAUqHwwan2mBVjMowkzimBLtsn/D2zk+9KpmMdAO
	qYq2qoNjHhREhrF2FAyusu52BS9nZDuVUnFnWTWpgSce3+zpUy68ivpXTEdz6b88OuTXgsUsCV1
	uYOUlW4sIaH51hFz99yOvz2klMen9zMQWZmDlmAzRDVRT6pFfEkIPqQ==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr251061815e9.17.1793645721864;
        Mon, 02 Nov 2026 10:55:21 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:21 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alifer Moraes <alifer.m@variscite.com>
Subject: [PATCH v1 2/2] arm64: dts: imx93-var-som-symphony: enable UART wakeup
Date: Mon,  2 Nov 2026 19:55:04 +0100
Message-ID: <5e9ae0cbf0b98898a8020bf3d8889fe87405a3d3.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_105524_159009_5FA9AF9C 
X-CRM114-Status: GOOD (  11.03  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the LPUART1 serial console as a wakeup source to allow it to wake
the system from suspend.

Co-developed-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..47203811abe9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -302,6 +302,7 @@ typec1_dr_sw: endpoint {
 &lpuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.47.3


