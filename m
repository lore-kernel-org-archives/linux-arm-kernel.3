Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF11606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EP7H8zpZ;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kXigmMS1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=; b=EP7H8zpZurqaAE
	2ghNmBhfaQ4lxHVaHgUrmrnilyI8LI53ZhTYca29B95gN8uKRwrWH4L9lPcbbbzxWD8UINyRp8Uj3
	tzudJ6bfgCFLqJHDNE/0iQJPujP8wRYX2bHuCHKe7gGe0AslcCRDfB7bYWqhCJ2LiN81I6x5Jm5Tf
	txtDIQIfn6LSb2OeAt3JvUf87tZfs+KX6dch4F9B0jEQuWqMpksD1uey9ZqME+mocy2SnCdLSZHf9
	WSG9W3AmY32e7eQoK3i5xPMs9Ztmg/RLq1Ha3g/cggRw3CSZKiC8+r+p78X823n3ILLZkKfWo5ZsD
	UGAtad5eP5Hp60g760JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy6E-00000000DQV-1dBG;
	Mon, 02 Nov 2026 19:53:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy69-00000000DIk-2LAz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so33058805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649220; x=1794254020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=;
        b=kXigmMS1qpsbQlWqNUv4gAFJH0KP39qHBb7VqWbRzmMOHA2eTyOrJp2Q/zZAb+uTUv
         O3Se/1YxioXZR9PFD9VaxNXrIx4sI/dkCtp23N024SdCS2z9y2LGGSC/ak4pMqQlXIVs
         tOUJ4gQfQxfiQLajN3FHsWHWxcB3C+3VxLHB0XS2/qtFJjnxPUq3QxGmcd/wogxtdv18
         fw2J+J6TgIAP6dvVBjlXSIN8eYmCtPE8dUxsjmPzdahRdBW9Ivav+yHzC8pzbpgHbsYa
         IyMBo80l8DE3F/7A2Mw9NTgbgIXmq1iBnWTBzR/wqss8UtaC+Y7LcDFucffQgHGDSeEv
         RAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649220; x=1794254020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fpz/uw2nhdb0euDYGKBTP+bqdC3yE0PUdZgdE1EJC8=;
        b=T/2yYPg6hQP8sJWHWc/wz0+e9JYf/NxrMKzKU9YmnfKcs+t0WFtDTtia7trusuKnjf
         D4Imp5VoV8LmcXoUrzJpLh5QkjNE1SyoQi/JEBAzM0U3raEL0IbY/Wn5r0ZDo+5dLNLH
         gOo142nKPqMUwZbssXTV8tnRQgC9PkuuhNT6FDBnHwX68rK+5a4W51aHUe2WP4iP36Gi
         G3isFF0ucU3cE0gcr7JCqoLgWTONAn0apLk7fmTexo4ALxrfqIMUZv5mVK2OzDT3B0vP
         CK2Gj/8wfeL2/8OV2uOAJPWIoK7jY3h6crWPjSvChdwkiVikhK2mZ99UPTQJeR9Xw+3G
         xvaw==
X-Forwarded-Encrypted: i=1; AKwUvBxj1NZIDZHYFGVs8fTy+xPoaJ2bve+/RMKvPeTPH+6KheQyuyN3JGR3BkNemm1x099aEGlVvXqIaIKytSjw0zoU@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9QA4kRIJoWoAQdPT8p3mkMMcrXn8EoVlOcmHMy2BoDaTzclIB
	jTZhFe5moJeSa83dTbJ4judJtSbQ7jsSGStAT1kiAzo+Rho2zoNrk5yvJZ1B4ylnoXg=
X-Gm-Gg: AYBFou0BR9VObp9H3EUhW17py9h9RImd3zE6PmNn3WnPOy3xk+gHe0E4vDPCHYe9Jo0
	cGZQCZy50KbWSJBmAVgWx1Y/VWw6wyCxJprDNNvw+3uC1wg/BAxW9lLvRM6//1vTIhvD+6Tvyyx
	j+g0tWBlZDeqOYj3iUskdcOkl0MYi/InnoY7UW8jiYRCRxYOe47Agk29BHUOHzehOENA9pf/jtS
	CL5I4UB3lfrkf7eHlKPhMJZ+lzFgMNmOWTGVLXERXJP8B8T5tyNOoIwpF+qn1LaBMhAeYMo3M7u
	WCWHzJM0022MFuYVYJADOrcdmqHC78RoR3nA6WLas9hXU9MxR7qKQjDzqNoiuQLYYVxnJyCHlNz
	NKiT6O9WXglwaUpbKEmlNdUKnUmJp6d7+F/dqw80gV71fbNlGbgvL3+bQ2i6a/N1DKQmnXmbMEL
	6zyh0BTNeFNbcC7V4F1fekVR0rJJiDOniXCKlFx+0RQneANLTnocmPdKbLxhmJyTD6UCLXeCZkh
	2ggaS8bj7gzp14Mn6ETtra0Jx8Nb98mfMvSEvpEn8wBcm6r210cxI402f3Ajs9RUmOCcnbfiF6M
	4UYb6/rPuSzJq5kKXoqQrJlCnLLiywtYcrWdVvoITZQwGnTrftlllVh2W39jVgD5D+Zm44An/TA
	jOgjNkyGJcQbp8wzL3WnFQ6PmLw==
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr260265065e9.27.1793649219912;
        Mon, 02 Nov 2026 11:53:39 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:39 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:55 +0100
Subject: [PATCH v3 9/9] ARM: dts: omap: dm8168-evm: enable MUSB multipoint
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-9-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1481;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=GPDgtWDoINKJrraqXEHk7avh0mT0fUwCN99SIrQYwCE=;
 b=rdyCT6dPdNGjEGb0mGj7AcMz0ZkRYEhJcmpAPs44qs2/zbWAbI3Wlil1MRcniIsO6bUaDt8X4
 vYzMD3bLdtQBzai49938vlHle0a73q/YWslU6vw3k9vpk6Jx12fmEy9
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115342_679562_34C38AA3 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Obbard <christopher.obbard@linaro.org>

The DM8168 USB controllers are used in host mode and must advertise
multipoint support to the MUSB core. Without this the kernel disables
external hub support and warns:

    musb-hdrc: kernel must disable external hubs, please fix the
	configuration

On the affected board this also prevents devices from enumerating
reliably, with descriptor reads failing with -EPROTO:

    usb 1-1: device descriptor read/all, error -71

Set mentor,multipoint to the default value of 1 for both MUSB instances.
With this enabled, USB devices enumerate successfully on the host ports.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index a6d42766a496..4b4e4d850231 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -198,17 +198,14 @@ &mmc1 {
 	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 };
 
-/* At least dm8168-evm rev c won't support multipoint, later may */
 &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_pins>;
-	mentor,multipoint = <0>;
 };
 
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_pins>;
-	mentor,multipoint = <0>;
 };
 
 &sata {

-- 
2.56.0


