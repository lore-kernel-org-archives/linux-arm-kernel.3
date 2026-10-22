Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059460A2614
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z1TMK9Ds;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZDsz4NH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=; b=z1TMK9Ds5l54lO
	01pHU5pstefbO9K6W2StNgDDjXr0FdYW1a5LxHEmTd5Ad8NO8cJYi2/xzuF0p5RKveIhFOZ71SwWi
	GnycvrNysb560fsHugw25xyAfupqxqUOWVaJPu5M8ll3hVlLp+xXyFhpERFib1lQNng7QG1mtklpv
	LBiK9LfepvgdmgQ9dmcyLFz1Z1KivNAN3yfQWBjwaaNt/ik58Jybb+1x0ctBszQYvUU0FdiPaJ5Xw
	F/2nHlwdDQrFYPyXisYFa3jcjTzh7olYgJi42FQnH+2/QF6Y+sQjBKEC3F3Gw4y3jWb6nYGZkGIL+
	8apdSMe3VKsPQtAE4HcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGc-0000000E68h-1sHY;
	Thu, 22 Oct 2026 12:51:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGZ-0000000E66t-3w9C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:51:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1205356f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673490; x=1793278290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
        b=ZDsz4NH74sS97omhpFmK7eZi0zmQJg8squYQTjNhk64GMRAwc989aficBPsPX5puEc
         14pzGZW9/gjNxB4uDrf8S3V9JriPwtGKP+4sDPvc52CHTOy2uODg1SVGRWaJYh2lhvtS
         CtfPKnZWL5J/Sq3f/A1SKKTg2haAIQ+d3hOFQUfR7RK5Pz9rav/NENxWADazQNdeYu9I
         9tRtKVf2Kqjo07Uc/Sd4lKdUw9SxhpFMUWWPlP1RUrpjObSNegtsRnYROzhOH5jfPa78
         VFbu1uSZc61drjMMovrGQovCzArVRXcqIPtW62iG+wufXheA3LR0BDxOSYhB1HE2zaCL
         NRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673490; x=1793278290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
        b=iDit20ClsGSKoVNXAFiFs0aejG5vRBnXx0EYIGYGYw7LoVgNU48PMnJz3/djODATAn
         7KFcxX3LqGSbmEoi3txIRh9CNIygl4oJkiXwaUubHK0zyJVrkLNKamOmxpPZERjdwPeW
         2ZiOnOqkKgx/O5lPU8+rvlsBsz8aIjHZNGbScnyH1giDdxed5PLVbi5xaJqRgFuBI8ta
         RmdDkAAHqqkMz5bxl4StibmvvsmnSfOM8OLVeJV03Xl5YikQBL8DYQnTq2gOKiSbRaur
         I/RsXx2/fTAeuVWOfYbHrR+ehWQNozHYDRSY18WU8wo6fHfHGWqb+ml1aZXbx0Q8fT95
         3ToA==
X-Forwarded-Encrypted: i=1; AKwUvBz9TfoSLoJlG5yjwREGxNnkMj1yOlUz75g50ldA/Pe//Zksv63tfZTbm5TiSv+v1EZO2L1FLg0LzcKeIE6acajz@lists.infradead.org
X-Gm-Message-State: AFq9FYIcMXsq6WsVDipfwT+9gk5ZX1fH7SxxK8SL4rtV5wvYBfVeeo0W
	UbidhErhZi03vRu0GSDi2Zk/pwX9Gm3htCgs5JslLHouGwHpOSe52ftN
X-Gm-Gg: AYBFou2kYcfnmCoT2FJT7RCqJnfVm5UDck66onSL031DyGrBZXkoWd2hc3kJ6jVzK4e
	FdVUTCu0KCE6zKNMAvKxct1327BmJjRDT5C5Ir6xXgVGdYTkeDsre7R7aTkl2TO0RKS24nAQJqM
	WODDpQi9/Zr8jvpIgzwCaykjQ6Wnd+z+DQerOUahHcJKi/oZwcF9lvJEamKWYvarVp0P8A6c34h
	nx0sb6/vuOiRTl7VZhEQlXOTfVXORrLenvr/paJ2Z6Bwjp1cxu9JNHVTRO6RhFg07Vq1eKy8lVC
	cCqM5BzsOmqIZTmAj5WtX+Sxh2zEeqwdprwZ8C/tbX2aP4NMMtc2ehkdHcAfy7grEyHfw5pnH1z
	l1WgSwNMI5AE9ZrlO6rauiqtfjMDr7o/xilTIQzw1n8kmRn5PKEVIAzCf7uk8cYpNCC6m++8ia0
	Ed8ahpocENkgsuIF3tLMtzgzq0r8YuN9xBK3OAy/K0meF3KfQcNUP0RYGlVkj+ft9CUw+em9Gv+
	qC7J9COJVpE8JzsB+4y6bnoucm862ucBNiKJNasfSTuaSlC1OnP1LJFiwwVbRooS/ylXBzg1529
	f7q43x4fK4wfS5jV9cWDqeXTdt/36rmajlkNXNz1TX6PS7pcOsGCh80=
X-Received: by 2002:a05:600c:1f88:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4a1fdd09ef4mr107714775e9.7.1792673489828;
        Thu, 22 Oct 2026 05:51:29 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:29 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:05 +0200
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 NAU8822 BTL overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-imx-nau8822-btl-v2-1-b4221ed43650@toradex.com>
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
X-CRM114-CacheID: sfid-20261022_055132_007840_B6AC9E65 
X-CRM114-Status: GOOD (  11.71  )
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

The NAU8822 audio codec on the Verdin Development Board can combine its
two loudspeaker outputs into a Bridge Tied Load output. Selecting this
mode only sets a property on the codec node, labelled nau8822_1a
independent of the module.

Rename the Verdin iMX8M Mini overlay to imx-tdx-nau8822-btl.dtso so the
same overlay can be used with other modules on the board. The combined
Verdin iMX8M Mini DTB keeps its name.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                               | 5 +++--
 .../{imx8mm-verdin-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} | 0
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..a4f26aef77fc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -107,6 +107,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-11-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-8-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-7-x.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx-tdx-nau8822-btl.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
@@ -253,7 +255,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
@@ -295,7 +296,7 @@ imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
-imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
rename to arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso

-- 
2.43.0


