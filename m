Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C468AC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=; b=UR2zqH26ohrPQFUbCXDO/FfN6U
	6xdEr2Kn6tB8oJncnet9am+vMSPkTPccpc9M7vxvik2Tbrlr5+CjplRmqsrnGsT32FpNr3XcO83Cc
	ktrPDaMi2o5NzkcH9D2abAz+Vh4jVm051UlXYSnoms72ZqSXoaq8WGJvxb3zUURRoUE7RXS+L4lGP
	CzWrTDf9bKWPClRysdv805rbcpKmJ+ARBthNAO7hTEO1dM/XQOWkHHb4uI+ibwMZXgVv3/O/BJ1Fk
	g2OJwh5/rCo2h8UITgyfdGrkJ8FAEDFTF+YkZDtB0QUr6lO2WqlOFYyjmYCTP4259w/Ehx5RHUA/e
	VQHYrrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulP09-00000007B6g-1U2A;
	Mon, 11 Aug 2025 09:39:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOtW-000000078he-1ED9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:32:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so28018715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904761; x=1755509561; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=;
        b=A6Z6v+I2sAUyTiQEC//9n9HHPweawzuEk+Soisa9n63m9u0T+irXX6WneW8WbbnpZ2
         It2o9imP/3IQ5Bh2jyIAFLseT75EAE7RPqF0lgjhxMSGH65Nes7sdeg511WcpzDpAZsf
         pOAI1BxxMGrUa8ZMm0cUebBYa5aDvvWhris24j+sQuX+hXizIb+P3CsGyvM055rxAdQF
         LJVqjYJeFA7ciKmU/PZe5KkN2ZZp4k2AAhrg8aQkPPNjddLdGmjaiqr6TVNLHhukNM+J
         yMwpb2VAhq1KP+ZVolRqbIbVlG7YgPz154uV9zL2oSuHKJTeDkxKvpg/w60EfXm/JZu2
         6tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904761; x=1755509561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=;
        b=N8PfGc5J/A9ABcn4mvgRvaAB2PcxPZtjh3E1kXOABPCM2ujseY+oKuoosCuOi52h4p
         p6X+ksXoV30Gtgldu/AaO+9gMlYGuPZAdJuqZttQXnaxJ+X0/ZSR4joCdE2AeGe1nemb
         eTarfk/PYjKkxEDn2x2ZBOywu/Oh/cFrMvMXoO7q91J12QScxKWWcHLTRHcslo+HeQr4
         cLkw694VgPpj4SsIaYye4PRo/SFZhnaXoJeFm6ii4Z47p/ub/6B3QttrVw5rNcSyRBNu
         b+jLYueVwhNOGhgE8lmmJF0Hn+Ha3BTynB7PsAQklOZanZx36iwSc/koosU2llzfNaa5
         2XKg==
X-Forwarded-Encrypted: i=1; AJvYcCX4/AWhhn8tGv2oZ/kAqPXwng22o72osWAk6LPlpLESNMReJ0k5avFp/GYqXpn8KFsO3uRNMliHpIKPHUZ3jgck@lists.infradead.org
X-Gm-Message-State: AOJu0YylnSYHC364SNwkX6bRnw7J8VyrII1Jyp+kTsojHTYl2u2jkzYA
	L55zdiQ7pC9M15BLOZ6akm7X66U+9VXJ1efQC1g8EgQzRsEkrTuoaB5hK0r1j//AIY4=
X-Gm-Gg: ASbGncvr22PvY5s4aONU6hYncmO7ii/mlHyoCq16ZeH1XsERm/mCbUvWE+0OyQw1UPD
	RHWC9R15khwSwE9Jz/sc1OgirlQybv6dOzrSrA54t4kaqITxsFROkCnn/409G9aYbXFx19yanB3
	yPduGqSiLUY2MV2cX0gmCPwK6dZ7D214RzcbzKERU0kygVKDS/8xDNtjV+CBAefS5a9eq0nh89S
	VZvZyB5f3wRnsprN2Sd8kzjavK9vt2d75LUDi2yQ0KupRTEhdRURE2ysUu7H8Ig1ZMdOITm8dmt
	m/QUwHNfxTtHhO+1cdGvI3mW51xbMP047Hix5ZQ0GPSwjNsrEudFwP2m8VTxGvSvGkMueG+nmmN
	HKafLJ34rpeO60iQCHdDuzIlpvIWBMRQ=
X-Google-Smtp-Source: AGHT+IEnPjhNqasqLPJXNXfyUk55gExFDeENYeLrLoOeeRhVHgumgF4nMbyLg4qCMWphC66ZYVvMpQ==
X-Received: by 2002:a05:600c:444d:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-459f4faf68cmr95076395e9.23.1754904760755;
        Mon, 11 Aug 2025 02:32:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:06 +0100
Subject: [PATCH 1/6] coresight: Change syncfreq to be a u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-1-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_023242_335061_73DB4147 
X-CRM114-Status: GOOD (  12.47  )
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

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index ac649515054d..746627476bd3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -824,7 +824,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -832,6 +831,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1


