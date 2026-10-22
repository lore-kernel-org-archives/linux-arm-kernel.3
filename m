Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E46D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GKETC8hk;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhbhBRn2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=; b=GKETC8hkfFL89J
	OvQwBknBN10bj8efjxd/I/6PLr6S9EDZ7g2JbvhTKuv+lNA+bqh0Jq6PdE+ZeGzU/JIrQ2xLeMdkP
	obP8Gi4DIA+bE4IASO4BaIis42rjC/mLQBCAVYnzhFZlYR7zlh/guSTNh72w7L2v+IV1A1M9A+GcT
	Y91vPkZ4rKbGu7983mJSU+VN9t1P/Ee5vHp0O/2n/O11/aTdWMxgeItJqqD6QW42Cv4hEyHS70/Jt
	6aemHvivE9E+sZAj7/mvRdtdRNH2Ydl1iSDfwke9Wyfsg2NFoEPuSw8Qv55EiYg6RjJPZkep8sgc+
	t+wfzXERY6XuZ4z5nGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGh-0000000E6Ak-2LpE;
	Thu, 22 Oct 2026 12:51:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGa-0000000E679-3uX1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:51:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a2074a66beso5066565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673491; x=1793278291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
        b=qhbhBRn2CjkoNwvzMYrSfHIhR9XMRAXJMAX6v9KBfEug3Tn0uOm/IBpnuUu9e0+JY2
         foSFgiZ9Q25QvqgDumg9t4edzuurPD5qMyl7WA2mC9GwRJyky/qkrmgwLJqDkjvR5MaC
         xXr56SlDV4UTYuUUKdpZYkJuG57pbVHkhwdhXwDLcv9BTH5z1i3hCNTufPBC5i48WgTE
         Hs0pq2lBupxSWqTVCLF9wcH2dXqAbticPw1xZyNkcPmBR3bmeCUuHBmA6aW84EsCz8/V
         3u4jFRvmd8+jSUjhyOrZuwqFPLIJlKsmApSkSD4UuT9Ur6Vb1/Lg3lJYozmKc0+Gah3U
         Unpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673491; x=1793278291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
        b=f4wTul3U6XX1XlYS9BJ/bXk0QKbweLfYwqf7sAmRjtPwj0QwzDMCXg+zZphuiB3vFE
         jI67ARcQZVknhVWYyek8kZUxrUIkZPTr6cUSNVM0U1wQ3tHpArF29FWZ05p8WOPbgV9r
         /FYnVyf0dEYIT5B3fxFj+gxT2YMULOCrwXKC9M5TPC7Cmxd3/xHLhcf958ficr2wglmB
         euyQKTkxZlLPP3Iz0lg4xY0WLc2b13tvbV253x0AsXCoJI4pgE373RFvSESauQaGh/qz
         FomTP5lrWFxdHxLOMbhRK8iTbb02SDHGCskQrccqT+VO4i/D4kI/oLw/v91+DIK64lpt
         gx/A==
X-Forwarded-Encrypted: i=1; AKwUvBxU5aWvr+CgtqTUEJavi8IYm59m7wsSUsK6ShcVIGZe4ySnicsCZ3iGibfqUJL38Be7Od0WFcwy2HkyVYaIlcJP@lists.infradead.org
X-Gm-Message-State: AFq9FYJIgTBtRtZueGrVpMtH09sEidvUeA/+i7b4k6kzCIkU0XjmoSz9
	tXjSPxKuoecB1+cohd3PCBVr6ZEvxVVhdT97hRI5a5AWGQuFC3vMBids
X-Gm-Gg: AYBFou3CpeOHHPoSKP7A0QPHC4AkXrs7SIfLNRYJ6BJD87oBIjoQHFNg5qc2oc/iJSC
	4ngqUhafmqzfBkolSuqaLJYwtFCxkJilaDss9T/TnY+gAuIL9lLS3lZhO7d0Ck1KQV3QfLN9UzM
	MqZBPM+9eqC0QRb4lsCrp4PFBCiiM+JrCIRl/NAXdI7ku3gZmKbPu3HHXLapy35zsYZgsbzSZ4z
	pY0KLjCDcEv9NPcETX1B2BmSYi8sHrW4ypB/MQzPgBIWtvrVpySQrMdWzv2CqP8el7wSt7Q3tNG
	7Dt6RojyE8rH95YUmc9Jqc9UZaKB9DHEkSsVGyVhqO5tn8KBZqwK0JmE4ByNHbqFU7ljyvHv3yJ
	eAAMzPhN1SvDiYGWXCkEIiBYb3DrWiU6XHkYaXKhERKIDXArwvLDAxAL9ox4ozorzCFigidUw1a
	dXMtWu89rRwEZYW5u7XbQ1WaOGnlXn5oWr11oveuDqdCYAcCL9DeZdAFd0teANPweILN/59yD0P
	Tt3KnoMSWhm5Y8T0hDfPiG7rN8uzRD/bxUCbsPEJUgWmgTHqePbATRGVh62NqdC3EZNDSKgXr71
	HYorAKG0N4Is4oZQDhpqM+5pdC/Vn3C8FQFCHCXsRUW0UMcIPsMayy8=
X-Received: by 2002:a05:600c:8b6a:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1fdd3bc69mr97539725e9.30.1792673490763;
        Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:06 +0200
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-verdin: Add NAU8822
 Bridge Tied Load
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-imx-nau8822-btl-v2-2-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055132_992883_43A04F23 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the
Verdin iMX8M Plus Development Board device tree to provide a
ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a4f26aef77fc..3821e3f16210 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,12 +738,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo

-- 
2.43.0


