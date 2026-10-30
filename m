Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YjmLAWHT;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kkm2Aj9N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=; b=YjmLAWHToFRngn
	5MDRjKFUgxlZzZLHdrQSFLSe/OQvMGHLYPf54pN7wO4eFGZr/NbOwD8g+FA8f37quCPhEMQ4+g86W
	J+V4MgByd6PG67SDKMH4ExNAJALi+BcrHEdy58+FNxFJTx/FOTY+9jPYzWxckZ/CS8dSULjVt7YxI
	ZEyAsEqp4AbG9plYz3p2esSVE52+0scUfxlWQTCdIiamjKhbv6N4MQ9K0vu/RNuDquJ4U7ZejQ+8C
	vcVq0hPyiKB4+cVosLiUGyyJFhtpIEeP2aUOtyfJA86gzLlf119Yfhsod0t9vYU0oNsOynECA627o
	csWt6q0plC348YaRMbSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0D-0000000C3Qn-3T6a;
	Fri, 30 Oct 2026 15:58:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp03-0000000C3KF-3rHP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8852615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375917; x=1793980717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
        b=kkm2Aj9NAX8DLvEQIn0qZggcptmP0awiuAIYoVAOYZuJdd++L7F/fDJvhwyQ81jw5x
         r5q9frZZf7PBZy6q13QaP3gf8TFtJvD6kGlSuSxDONewJe+FQXGq2zMOTIlwim/Afedu
         BqcfMqfQeXKRk+PLNUaAvvP51SuQ8gSJ5P9owDyhAFLGjSNDRAKnBAiHSZ2Uaun7U0oF
         lMaotpS2CU+2ZyayvzVMDnXRi5IUPHMaRa2TBNik7YESJMiIxosvd01TSrjT5q92SvIi
         c5dSYP1EGCwfgDSRvK73OXr1UvgGBb2f+a4tRV4zIdwJ7SwbQT5RK5yJwXdfRhW9LjEa
         CN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375917; x=1793980717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
        b=O3ef+NEyj0AYycBHMxiYaFk2h9HWJR1YYUal/EEQYipfJ3AIR+byeER5cxI1FynZtv
         XNZ/0A0Mf5ymQJnIUgYUUh+0GvpHo1AlcnZwW1b0ZPEeC+rQ0yghJ2wAJ9Qe4hmd78Ns
         DO6WzTPTwAjIodVwoaMPhsHhmcskF7Pvuh1nCikbxu3132gZqizpTPAr4BysvYQi7Niq
         4wPH1pKzpeCdUZ57PdK13PbQYH8NlYTmrHihbAMh3Phq59Jd12xxkS5c6iqvVLycoWCL
         dJHH5Wmqn+HZZxHQ8qbcMVaeEbTZEROKm/RPaN+pa43VoUaw+mozkw6S/lqSo3ElQKVX
         im7w==
X-Forwarded-Encrypted: i=1; AKwUvBxxEZqjkZcm40NJlTLWwEoI7rI10LG9Oe0FlIIKXVipycN4sBM7mudo8HzEUNbuu4KQReSJZli98Tzf0gFkqLQG@lists.infradead.org
X-Gm-Message-State: AFq9FYKBJCmBhVf3jNlvtd5SG7ynBOjw3fcjdoaDFYoubC22FQrRCtqD
	AAzToIdtFkJipwMthYAWq4mWEyh8D4MBbuRP2nGg/zxFXo/lbpHFyI1TxxgPVYop/Y8=
X-Gm-Gg: AYBFou2f+7bEAmZI/nB2msKC7ZSIvyGdAB4GC7DRDTZMU8RVHc7g+sDeQXa627y8NJt
	9RIxtvqPJsrkOc0g6Y7q9vIgHxsF4fatljROPFLUOpi/Cvk2/LkLdmr7E/M8w9znSFPONadz2Qn
	MyV1Pa8q49+qVDQ+YoYnXpDwYsDuucjt+iJvjBjcCMBA4Hg2Bev68yyaa1I9N94InoqGXtEbcHT
	uoBDmg5EJliKXSxwr1VxWmyeOHax4rMR2bOSQZ0EWCZ8bmWCHN0gATQYYPx3BMfYUd35Z9Yj2fH
	sgt5wfQTlnwmUaJrkHQjiUYjnVjNwU/H79SYQcd3LTFWa2KR3UMYASiUimq1CDAPVUItp2Yj7tm
	AVmsnHH/lDj2r/fe+NtkI8cUlii+P8rgMDB5L1KbgZyelu8Egv/zeBUmtNHkBbn8hevSN8T9i9n
	ED0g0u/5lmFDFSBLG/E/WWabB0kF2LpQBcZylDKrCLCHKp4eN8LQH8kXSMP3gMd2JGaGhwHGE1T
	9831ExDrhdSpvStWB+FGcAzX2xZNyxfVNN60LUA8Cp2wSxEIwZwF7laWTb/BbK3qNkyAuGkca/5
	br24N/LTC/0GknGrcMiaEyKn3hSEn/o8Vcv6yhMWHSekYHRwrB/iz0APJ6nNG/pMJVV7/ntD
X-Received: by 2002:a05:600c:e543:b0:4ac:ab43:b50b with SMTP id 5b1f17b1804b1-4acab43b5f3mr32931495e9.26.1793375917487;
        Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm40803375e9.3.2026.10.30.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:33 +0100
Subject: [PATCH 02/11] pinctrl: scmi: map the schmitt trigger enable to its
 SCMI type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_085839_971999_A438D541 
X-CRM114-Status: GOOD (  10.21  )
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

PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
INPUT_SCHMITT and refuse the threshold, the protocol has no type for
it.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6bc94c68e89a..5de47e060e8c 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
-	case PIN_CONFIG_INPUT_SCHMITT:
-		*type = SCMI_PIN_INPUT_SCHMITT;
-		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		*type = SCMI_PIN_INPUT_MODE;
+		*type = SCMI_PIN_INPUT_SCHMITT;
 		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;

-- 
2.56.0


