Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB63FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U59vr0zBBqMHwQ7X8QxznFMvqw1Fg+vz+3lxSO/2TPc=; b=wUKafGd1Ref/gu9Bpvem85N/PK
	4wHFNtfaeFHOYQ+3DxTlEZdHAMjZ6GyAiNc3EABt+0lKC6WQYbGPNkv+rc4BlsynsbRJFs8HgnK5Q
	1IDkS338M0B10BKBpRmgAyUkfA3eyQrFYvjUOYrfukoB6Gwu5dRedEnA9XxKTo6aAmQJ0FfR5XxuO
	Ai5/jhSka1KyHvDYq1MqCiyLy4KRozkNFvvw0tcQa7cqGg5v/QfUodsESo3dvdFHA8e3tD2FJWxKE
	VXi3J7NFCViJpfQ//zAJIDcR2KVkFmeC/+NA83i3N5v6v7LqkUTK3ZpEWE5j7qRMZmuwK7zU/PvBF
	qlJv2dig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybeD-0000000FRpt-2ywY;
	Sat, 29 Mar 2025 19:15:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybR9-0000000FQZP-0OSO;
	Sat, 29 Mar 2025 19:01:44 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaecf50578eso561631766b.2;
        Sat, 29 Mar 2025 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274901; x=1743879701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U59vr0zBBqMHwQ7X8QxznFMvqw1Fg+vz+3lxSO/2TPc=;
        b=cy0mW6z6dtlQpeC7XwVPczoYqr/nIEgKZi5eikZOvAd5XRQdI9EL/CwgrUW973cN+n
         n4HFbiF4zEJhqzs0Ycuxdvvcuv2F25jF+zn87LfDkE93DofrTMEdpa9Cf0qms+O27kek
         bl7pSb9YxSFI3j6dnmHFAmq+PT2M9TO2gzHCUiWvoXFk3M8wPIsdDrqvI1vTkmgUnWzP
         yRagsE7fzs2XYwsTk3GLI7N7GMaxU1+TKjhGavePKCb1vnH5OSDj3H2rkdxvZ95qROD5
         Yipj8ymcEuhTV/5LVl56sGfwR7P+P1odJ8ShsLgy3emvrY/8cUjybYiBOCgU/5yITlnx
         Q0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274901; x=1743879701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U59vr0zBBqMHwQ7X8QxznFMvqw1Fg+vz+3lxSO/2TPc=;
        b=vhhticUT5wULbOVhXraSGxqVPwTNtOPvG1adl0YzwBt0+rD2fwnk1dKtpYrLfSp7uT
         E4WtZxGnOA4nGxCzCeln8kq1kUs1SFkWbglqg6b3iQwmx8bjPLN3VkXFho21Ftf4xE5j
         KqDO9XPigLjuX4e3eZHtnDVG9L4YvWCyvnpZ5tpSYuDZisYbDo4WS2tZugevuqQDU3Hv
         xx+fGyycTakkKy3O0/FVoege9pmi9IjrbP4eCjY9N4yuzfhtW76p/1i7Vc2HAETB8L5B
         4f4D2Bno+SK09znhxe3yy2nY2YKsG4KTE7Xc3EceKE0okrSWfrLdcuCjDUyCvJoWJt8G
         RKEg==
X-Forwarded-Encrypted: i=1; AJvYcCW1PmXALzwywzxIJXtbbZsWONjk1ifUnt32qtWte8EAIaQotvpUFphG2Q1PdHQ7NF1OCkuS810kQhjVqtZWBFqr@lists.infradead.org
X-Gm-Message-State: AOJu0YxKdpz9vquRneq7PdbD38KxuYr5+NeAVfwWqirqWUlVTlrDkkju
	UCWtvcKXQDCqPWfhb49QLMBeJ+kWsafjMshCq6HuD2fjTNuFDNi0uC9nMA==
X-Gm-Gg: ASbGncsZ63a/vSPQ6psfMTbEO2PWE4+T+xv83UZd0L/ykVRfTDRV7/0uOvh+n6m71/4
	KAjS0I2dkm9FUgmjkgiRFZN3Er5FHHgL6Cx2Ar2RJ/TUELfwi8eJ5sWfrm5XJBiE/nqG/qTVSDd
	e0VC40z+RnHK7Sr1gtcICx2rTv1tm+xAmimDtVS043/fS6qFLO6pbV1kftVdgYRvnz0UPyDFzHV
	Te6abAqZyOTVS2pNn1qqBm86E0+vwIgibBgp3cgvqoRwsVqXNvf53mer01dVucVvVQr57negcw9
	YvopgkkTMiB8g48VhsvICzZpBsTx2aaYdc322AqmT8yoJQuvPp7Lcl5T7nssKcrNfv7iJ2JO+IM
	CWh0rLGfL0yGX/ql0F60hjdGUpa2TgQk59gNf9Ip6zPlO37aFD9pwNLN7AwAdpZ1nTKt/zA==
X-Google-Smtp-Source: AGHT+IFCZmQvxgAXplrXyIIkWZNZdRoKac8B36FAtmzTprgUIMSkQz7UFb/RGY0oFoPv2TH62Ye4jg==
X-Received: by 2002:a17:907:6095:b0:ac7:358f:1b11 with SMTP id a640c23a62f3a-ac738a49b90mr357126166b.23.1743274900941;
        Sat, 29 Mar 2025 12:01:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac719621718sm375998066b.102.2025.03.29.12.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:01:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linus.walleij@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] pinctrl: meson: define the pull up/down resistor value as 60 kOhm
Date: Sat, 29 Mar 2025 20:01:32 +0100
Message-ID: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_120143_133622_0EAF09E7 
X-CRM114-Status: GOOD (  13.38  )
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

The public datasheets of the following Amlogic SoCs describe a typical
resistor value for the built-in pull up/down resistor:
- Meson8/8b/8m2: not documented
- GXBB (S905): 60 kOhm
- GXL (S905X): 60 kOhm
- GXM (S912): 60 kOhm
- G12B (S922X): 60 kOhm
- SM1 (S905D3): 60 kOhm

The public G12B and SM1 datasheets additionally state min and max
values:
- min value: 50 kOhm for both, pull-up and pull-down
- max value for the pull-up: 70 kOhm
- max value for the pull-down: 130 kOhm

Use 60 kOhm in the pinctrl-meson driver as well so it's shown in the
debugfs output. It may not be accurate for Meson8/8b/8m2 but in reality
60 kOhm is closer to the actual value than 1 Ohm.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 253a0cc57e39..e5a32a0532ee 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -487,7 +487,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (meson_pinconf_get_pull(pc, pin) == param)
-			arg = 1;
+			arg = 60000;
 		else
 			return -EINVAL;
 		break;
-- 
2.49.0


