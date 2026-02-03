Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9893DE83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3UlFA0+6h5s1DkPOfyU17WjXdqB8dUR/b6rqqbq2XU=; b=RO54J8h/qrv9DQ39levFaYWNtV
	+mHfHagXL6AEpJzNtZLAiPnrfP8XrQsgXyT8aeCZMi+9/TzS9SaelIbMQXtADoCNpG6O0KpnRbeGG
	kUjCACEWDD8jnp5XdDD5BsY5ZXiPN62OlR1d/aHL6p3aFz+FP/9p7tSUqQkJx0cOvyf7KC4CxEDBF
	bR0jXHrJnGvTavZLXf/an9AJmDbw32eFCzAIUQuRq/rzemmTvGETc3JIG9ptbEnnqBmWuOumgtWPU
	gIK/mqAVeBWLHod1BtKBULLBpwEEBjX7+aAtC/16Yw1EF7oie+APeQ3r3YAyGic/FmGRTS0QaOCIo
	utqB26AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDHH-00000006RWV-0ijb;
	Tue, 03 Feb 2026 10:04:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDHC-00000006RUr-3RP2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:04:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so41449585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 02:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113093; x=1770717893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3UlFA0+6h5s1DkPOfyU17WjXdqB8dUR/b6rqqbq2XU=;
        b=dgqGsbMAoNUg61RZKvAXPAoTm+rpuh2O1A29ojXx0ToN3ZPy6pdSEhmGe4NXIyDEzx
         8/eUwfniE6D2lAH8ry6wUDcnlfpHrC+XGH+pLmFGg8h5LK4cINFFHGWAWT9m+OHyjB7d
         ik4QpF9RJ3CaB8pRJBIqM/kn0oKacFFQhuxgENMN/ieOKfWQnnT8w6b+gTzuVong1i/e
         hlf1FpoRNmSOuYHP/n2jY7ajd09VVN6tXodUxnF6YQzYekRfytdUk3s9OpSKj+Nf8NQi
         LvEfO3KWi/+NdkHbvgMk6Wiog8GKb48bvBD7HoZju9GRwj3QHCX4hazgsj9DjUBc+XE1
         bo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113093; x=1770717893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p3UlFA0+6h5s1DkPOfyU17WjXdqB8dUR/b6rqqbq2XU=;
        b=m0XQJ8Yko0pgHay1WqEmbQFM3u3veiRLZEAMAj3UYaY/8FIjUY5HC5A/zKFfy0NIxs
         m20SUzBU9R8a2BxTTzigFIDKY3ONtRYFwMsGTyq7b66W0S6gX4SRXB+hM52WA7mvNaZD
         Vhfi9L4O+nl7itCo5xPa7a8JX0uJEtfTCB907Wr9z60tGj20i3vfKdhzGLlke7ziP6tX
         Kwa+DyqpkhxDiDsCmvYYLnc2NAABLibq8nZIrwRvqAWXki2Aim1iK/QCaxTDyYZjAjZm
         Dr4xD5NVrutOMv92I4PHmf13kYhLS5FNx49edTuLbaIRbeY88t4BXXfFjMwzGyFYVUm0
         aigQ==
X-Forwarded-Encrypted: i=1; AJvYcCUulG+T1XaZr7v7OvWmBsL0P+X0e35gI+yWstgppKuOtEId6NVAoBIRQhT0y2mYxmO9iQz+iK9D7Ny3su/EtjXz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm+7CnWFbTrrsMvLPOyc7pDqiHWoX/uMHu2UtjXK6Tk7mxoE4+
	mby896bVjrH5AQMpXriFubm8tAfd3ItaCFVe8TPeL+oA26hkXCeOn/iZ
X-Gm-Gg: AZuq6aKQ9KNhQHbv/kDlY3zM+bucAcYHT/9X9ne7W6XgNCv8IaFEmQGJo+pzBRbjq4x
	seEGrvtggwYxnfs9bhSAWSvnEv2Sb3okpCJ7erP4WghxJhoFR+MWhEFbb4iJZ0tiELt039+p8/6
	aLs0KZ4E5XhC0nNwgARiZ8C9JP8UTyJeTV8DdGf4GgOfyMzfh/H8o0GcTwESCXbFif5zI/JVygt
	VK+wJU5C6Cty0qjO22lIDfhSlyAaIT8PaT+VBk56lbAX+fruAZuO9fZF39AcweIzTaIGJDKxT3m
	QnGGmNzXzJIs9+GP3sQYAAhvT9Y0z02VWJmrvHiy1e+rbhoj4+bp018FZ2U0uXxLYadDqdNO6+p
	MJtKvIMSu0SS9wLJCtqysHY0KAwFmgTx8Eo5P6Pjs53Hbx3t1A9TheXTxH9Xswu/O8eTNPKc2pf
	BL4f6+7HBs7JIT1zlnNuoS97YPJPMwVR/dXWcGVw==
X-Received: by 2002:a05:600c:6088:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-482db447950mr171113855e9.8.1770113092893;
        Tue, 03 Feb 2026 02:04:52 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm115534365e9.0.2026.02.03.02.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:04:52 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 1/2] arm64: dts: imx95: add AONMIX MQS node
Date: Tue,  3 Feb 2026 02:03:31 -0800
Message-ID: <20260203100332.915-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020456_800577_887E57DF 
X-CRM114-Status: GOOD (  11.13  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for AONMIX MQS (i.e. MQS1).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..0c55861d673c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -391,6 +391,11 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs-1 {
+		compatible = "fsl,imx95-aonmix-mqs";
+		status = "disabled";
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
-- 
2.43.0


