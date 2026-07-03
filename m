Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D46CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=; b=RrWzYgSMPVvVTbfRnqJz5hMIM5
	JK3xHKADgMVZilSezKShEPO9dpodNlVTSoEN6QDygi1PP1CoTt9f1V4XnOC5lJPL8DS4Ke3Y7jQD/
	rZ7taIfSUNyxonDYWkWDZmAhT3fmmPD3VeVs5fCQnDMNSyn9JPBYaNf54fttXdQW13RD1Mkb9cKSF
	aJwIuj9tNTJM2hDmUFho2slhcPwAZRJOAaw4z8y7XavsXsj2deUuwrHrTCOqb9vcK5WmUAXmJfVMu
	8PdvZPTn5HzVDIdHx6vpkIg4HDeFQ6mOT+RxzKh2lCeiJcCuIWpdgXIMIGxEyAO7sWS6bSPJJa/YX
	CnXbH2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkR-00000006Cmy-40q5;
	Fri, 03 Jul 2026 06:51:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkO-00000006CkH-1nFt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:37 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so442423a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061494; x=1783666294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=lFVajDpZPqrcmZ4S+L7Icjs3BCxx3dC3fuHkDCkzqOg4BShVKGQ97QWUWy29WWULUh
         YOVuvqZOrzE8fdydZBDvf2cqKc8GhCoSYjBqNWMXyGSLCAkpkrlnyV2VAhTYVKPqXcwM
         01eFMzvUXq7Hnn1omvwnC3CR2qyY9Gaoq4VHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061494; x=1783666294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=ZFR0dcQY7OSrFLqvVs/SMQTbb4pEMH3jTRPIAZuVRZ1JzY7iH5jsbRZOdFlfI8FKAr
         O7Uw4N0nxGs8xhiWzRyTfkGQUNOx60MzfxqbLdlKIRgK1n7v5dlSEyEuq5rZujzFyt0y
         ebSQaCPYq+REU/3l50b22UYwI+86kf83LRv8qyxnQkEO2REOldVaBFj+oO/Nm3++StMf
         w56VYhyv2EquL4zfj0+TcPjr3C+o4iumVSrXNdCrKuj/Vhugwrgi2MwEVTpUafBrnb5Y
         g5gmE16wVM71ioTOGxB0BW6kCmBjOGi8pZXiWnQbOE3M5gY2f5BBTQGnotH+uvJxATRC
         egkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPn2mntmn7dQftTVEMkMRFRBfjDrUgQrDWuXkLQ724VKGCFcVIuYrHjiWdXeRIM8H5P116zNdxITb/Lrb74XeF@lists.infradead.org
X-Gm-Message-State: AOJu0Yynz/RtQPN43Xf2muVRUpIWzRLEGwjRqhiN6TSoBsQvWUJWoxBZ
	+skD3QzEjnFr40oiWwpExjTQIPfG3d7HLpljqKQBRP5j18KLrZ4iItKvVwAxsY9ZM/I=
X-Gm-Gg: AfdE7clJITHIbbCAQcj2jbQ4PhI9QTuTeHyoDbK0+67sBcd3rZnQ7nbX26fBfQb64fE
	tQVUyaVmHooJWZLHTjmRMCxwt+3hj5RB5anXfO998MyM42Iy7K8HulgzSUuf1EL1TMf4PG0pVZ1
	ZBv96u7RhvT6gSRuIzNG4LvUqDAFexyn2cFOdtSziCORsbRjZDCyZjRRj7pOKDEEW3btGCYbGKS
	xYlk4l7Ik5sPhhESbPmJooXMZV1mswchnBSmAn8Ffff/tv9xRcPA01/c6SpY8OPJlGhXEMRkk+S
	iFBuw9SnZy2/PSIAT7o1+9jPDKYceV9Hc6zXvkEjbtNA+MhjuzaxjnDgPxcp4g3lH/1YvAfNj6r
	Kp/SepC6BIq4bv5I5anBYFNL/3BOgtPZuvOWNt/FBuny5+M3ja34PAN4PUClUVFw+NcwsZ7Jm4a
	IoJjPBvpOgcSRPtMD/1aJDs2VO1rvOAnaNbSYbmJ0nVrCtGeiCvb/ccLt7Bfmr0iGWxlTAFbNoS
	bqakvvOkUeeLeL3HTpOzw==
X-Received: by 2002:a17:907:9444:b0:c12:6201:c4c6 with SMTP id a640c23a62f3a-c12a9d18f73mr399200966b.11.1783061494426;
        Thu, 02 Jul 2026 23:51:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Fri,  3 Jul 2026 08:48:52 +0200
Message-ID: <20260703065110.1433283-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235136_474199_EFA3F473 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0


