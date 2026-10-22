Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A24606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=23eemAd5;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aTB3nh5l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=; b=23eemAd56HzGjesRr0lGrUR/jw
	5O/a36U8E94t20sKQgrNnbEQqWgIKqQ9zX8Amq09ZTvZdm11NP3mSQEkyQqKcCXyaFp6N1LIWw4XF
	X7ftcZYf8B4wSAtNIIadsphZOg2J7R0fvEcZoK0g7IMvKIokV1JeADLoRQLIHArPgWxvEOHAabBJi
	BWMkiPtyUk3wplKVS0udOO5YMj5uA9gwrelpWT29AN2snK6waEFaTM7sjHksIQ3Ndce8g6ETsxHu/
	AFWDDasb4UlSSyPyMaT1y4n25GgfPFHLWdy8IJGFbFGVfnIQ9UdXtBGKULlh5R64Ec14zK859XgQu
	nwYn8Mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9e-0000000EuLW-13Zt;
	Thu, 22 Oct 2026 20:12:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9a-0000000EuJz-2yXh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:12:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48b0584ad71so134854f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699965; x=1793304765; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
        b=aTB3nh5lmhaBVCJA7R8l+zXXm0OdGNaHOLpv4j9FXIfwhsjcqxny8edF9lLRcmdLhG
         jBseK8iRcfOe0docgLYyCHC99mR9uvAGEyuG4TsUcW3OKkGPy21cnNWxNgUZJtglq09h
         mS3CEVNlzUJLfRAteonGg8lcVuSH+FmCoTWiKEwCmvmKi7VxQbKdUtkNrPzuaOXF62Lu
         g8uMkiXRriPOqkLYjRtxWK9+Kvz06sX+dJHJ7XoDLo12TF/HjZl8hQSerqscz2fex0Ms
         6wa/1ZJFlvjOR03nXzFxueic2HfKcFsjEqqDAxrFcRogSUelV9IOiXl76S+mUY8Jjs44
         cuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699965; x=1793304765;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
        b=YQXneMr5NJfB6SD3l5TmEkb54e/JsBjExxnKumEl+eCoKfK6hQ0OxkSFb8v5hHqMo1
         CRevag4Li5vF1+TCeiZ2svY8ig3R6nzsoCmrum1mEDYsr3x8UPg8MvrIQCz0XbcYAZJC
         SJ4UKseYgOb3pS7CdZis/eTQPurl9G/QvzN6grPH/azAw4+OflhasuM5A1Lfr6AH1mr9
         wQBO0wIVPRsnWDJ4eTTj0rPUQsN5Yln5TjuahSjzkIrvj3WMx//OLJsLsFHOqX/S6qDL
         bpgpj/G4DC4YVSTaIOvSF6MdRLsPb5beMTbwZ4i/MT1LK86VetxZa6WCIseAWwjdCahN
         3p0A==
X-Forwarded-Encrypted: i=1; AKwUvBzJB04KKK+pcsRNkdPMTHh6rmvoHStsujVUP/scQOW65P+juJMVRO+B8lddkcVri2MQkKa9nC0HsahYzRUczcag@lists.infradead.org
X-Gm-Message-State: AFq9FYL7opOBrqT4HsqdcR2XyfflAZr5rw3sM6uVNTvZXybC18xfo7s+
	oKHP7ruDh7Luvbv+kYZRcX6i4/Oxh9/U9hHKLY5A8y7PQKYu/40rL9oMnZ5QDcchZG8=
X-Gm-Gg: AYBFou3Sfaq274GzF0ri3Z8rG9C0EmzS5+FSPyFRtoHYDlGc41E/d62ozCStyMz3N30
	LGI3g7zsu30DVA91eW6m5oYnpRHXYcuqDTVUFKrkg31J5xsuf9ZyeC5DJHqMk/W5I0oYuMvmuEV
	cEvaEhszf5FC56e4yN9zqys7dLP11BUvBomRV35JFnotfLhqLJoKP/EjGuVXffS+7Xdy/ayRANT
	L7gHlR5T/onXdN0lwVt6GjJuhBGzXCcwavqkcQWupR8WaE14ahBylgGqIu00aN9E6yJIFasojch
	5nygV/BmKIpJSEj+ofif+PzwGKmvzOvg3n6tluaHciscM0tjGW+SBSnXQrzpUyr0py90J9tD3sv
	Vhv8ctTXK3Kr32KMP1WmJmkLCeOWMCs2Evfvsf4NwjqicCy03ftaMkdZCQfiJ3eQzEu6ECuNOHS
	+HfYXWc7R7i8XIcLG8/T/Iy7pU04BLvQdyA8YcFXOKjuesSzvmo9ch1tb+nG/Ep0+yGlie2MOQ0
	JhrlWQr63ZO72lk4x6N9b2meQ95n/b0oCs/M8maH5JroCA4kGCImPg+U/NiVdXFV7NdekhaSCfN
	PtZznHx2Cn8y3vxbuq0x7oyxAeJ+KN6GFnDBXQ1aYA==
X-Received: by 2002:a05:6000:4007:b0:48e:870:778f with SMTP id ffacd0b85a97d-48e2649d848mr12345891f8f.16.1792699964688;
        Thu, 22 Oct 2026 13:12:44 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:44 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/3] Fix the ENCP clock select field on GXBB, G12A and S4
Date: Thu, 22 Oct 2026 22:10:31 +0200
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTvQRrDiVcRFOv2xozWGTCpC6
 d2Nunybt5IhK4xOzUoZLzV9xopu15BMPl7BOlaTa92ha53jJVnJ8A+W+c6Iktgws00aCocRvZf
 9cBT0VIeUEfT928+Xv20ZbpDyLWnbPqBM2Q5/AAAA
X-Change-ID: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_131246_794934_0CDA405E 
X-CRM114-Status: UNSURE (   8.57  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GXBB, G12A and S4 clock drivers describe the ENCP clock select with
the field of the ENCT one, VID_CLK_DIV[23:20], instead of [27:24]. Fix
it in the three drivers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (3):
      clk: meson: gxbb: fix ENCP clock selection
      clk: meson: g12a: fix ENCP clock selection
      clk: meson: s4: fix ENCP clock selection

 drivers/clk/meson/g12a.c           | 2 +-
 drivers/clk/meson/gxbb.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


