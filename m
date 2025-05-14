Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B67C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU3p2HZazfv/x9pcuc+uTWk5M51PePRd/7turTCqc5k=; b=i2B0Y/4sawDBMygqTpOckYxGNT
	lkUd7Okam/SCWwe+3gwT/WKrFT894rudLt4P68WUppgC7N02gIfT9wjREsJznXwO5aJAV2zk8HXW/
	wf+9LZv5kG+LEZe9selqjAQ7SVbhABr/hT66jIKu7zB5L7lmgBxWV2Brc1a8LNQyY9kw2cOG+C5Yb
	iww7JRKItzlewJSlg9UcEtJPu1ZTkDrvDkLQh3JuYKjLHz5re/LqJnwlgHt3sBw+J3wwm+QQABN0u
	/UDQLG92ZQPNg+CXFYahEjkTzq7cVXam+ENWPenQFkrtg6aBx3+sSvI2HTTvIcDGhfOfU2vEdU1z1
	aygzIOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8BI-0000000Ed2y-3Jpe;
	Wed, 14 May 2025 09:13:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7QU-0000000EUdr-2RCr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so73309855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211117; x=1747815917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU3p2HZazfv/x9pcuc+uTWk5M51PePRd/7turTCqc5k=;
        b=i3NxziAY4YyqCdh14mwR1Ogdi30I3F8UTTUAZjiK36VKCQcuDqWfca+uNwxXw00kyd
         4ePD+Z4jHLPUSb8WyAeIMPcUkHRpCdQzB1Ry/2o20A5NaEDUINn6fmlspse/g8DQjMgh
         unEbbm6mZrUSNIxr+kpv3yp/5qGUYOjjUcAh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211117; x=1747815917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU3p2HZazfv/x9pcuc+uTWk5M51PePRd/7turTCqc5k=;
        b=V/hgAeQVu7mVzlm0io1xjWSzfUshtMPnEZgzLTOvJ9OeP4+BIBpMc8kd2fKHFo86xl
         yG6vzZF8kI/tgFQ02vMfs8gO3fQOcPfyrZ5yb1JjoYQWo9OdI5hU5drOr5/e+KyRW0sz
         2qhYAKuWHRbvB73sMbKkLXABZ4uEuU+dPjIBXEKvizZzJt6YFFz3nOMhxphTMj46Z1/4
         npZX40dhocJMCpnvvjdXND4H2f8Y1VkMmCGJT/Q8rAC4FtQs2PcWtcLJhFeN/D3CeVgN
         +0ab9MTzFz7hmuhIWsroptWk5d7mPNZ1JGCv53AXZunMUa+7iTIYPwcEwkcCL4+RhVK2
         yoSA==
X-Forwarded-Encrypted: i=1; AJvYcCV/NVbQQJ27KD2Gq13S+2E15Gb+UEkohyz71dwRTc4VkV+dHRCJ3Onq8PhNfMwEpMpZLbZFxNNze/CQ9vYgQ1Q/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw88QmwlNrprzawKdyQ/f1Efvud8IKAJwm62AVO6ILH3CC7iT5
	isixzj57KALlu5UN28cLx2p3dEn08MfowpoKFLZAOUuAr1UmD0L3lVcWN5dURkU=
X-Gm-Gg: ASbGncvXK4I1y3SVFREnouf3OZfb22iwwq0fZeRioxIe5Fim4wWAahmFvZxXXGiDeFR
	MngDXaj8iBvru1KujMYqo+sw0lsxTNvwbWaBp45JacX/jO6IRO8KduW7zz82pJemeQKPZ1B7S35
	TCMbJbriPN68w83ZAoOwh7qoPQpHpC4gVDW8SLCj0qpmhLb2sMzRUOHCnXvyHBQzBUw/TLCye0a
	BPuQlE5ruXzKw+KvHAM+Lk87mm3qEGVlzRRpuL5EsKK3VauWYySC5M1/iKPqt4tplFUGCDQy7Qm
	O4yLKGskVeOiIYCpDZpc+ZrW9nKgI3XYoDSm04NqPbnqzKyNnPARl2/cD0Wh12A/QAjWRtc54Bn
	BhvaBj72wjbxNsW5uaXn1gSTiIQPFN47o86hDArq4zoA=
X-Google-Smtp-Source: AGHT+IH06rcSnfaOB2OZhMFuSXU3getNgBYXw3VlOzykqn2k2DHIALSzS9mBkCxcxDKGZiq9xxXxLQ==
X-Received: by 2002:a05:600c:1da5:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-442f20dc6e7mr19271805e9.11.1747211117060;
        Wed, 14 May 2025 01:25:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] arm64: dts: imx8mn-bsh-smm-s2-common: Enable GPU for smms2 and smms2pro
Date: Wed, 14 May 2025 10:24:58 +0200
Message-ID: <20250514082507.1983849-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012518_617787_72EDBBC1 
X-CRM114-Status: GOOD (  11.77  )
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

From: Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>

GPU is enabled in order to use image processing so it must not depend on
display

Signed-off-by: Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index a983072fb835..de70cd3a392f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -77,6 +77,10 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
-- 
2.43.0


