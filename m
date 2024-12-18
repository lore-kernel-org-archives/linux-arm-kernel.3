Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3DAE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qNc9bbXIkaEAXHmkzJsg6tVAk/RGNozbWEU6KnPyaP0=; b=M9hGn8I73RUOLSxx3/dA2Ib8MW
	gbQxrshVhF3Fp1TaNw1tqIhV2pFkqU6Kl24VabSBtTaU3fgPjVoPWJsCZa5l4wqbG6AOF8eOt/6oN
	ejf3Hh7wNkAyDrSIJZSh73IFyd0RHgL3/+GNDIlFZvvOESrJy8BiAkfsCWNO0O35CsVxL0w4flsoj
	D6FkTEboWVQ7LQ/vnEDQuslo8+d219RshCBCyuK0Uh4oWXnxmE6tePJvmeF3NXX/XiVtZnRYcbQdv
	slxarbxVjSMg/tjNaFhaUmoE8GE3W1yh3kJV1bktgnaaRcxcdqx2iZh002EkvB2XJSvXidD46nsAS
	Id1XXXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyoE-0000000HRT7-1iZk;
	Wed, 18 Dec 2024 18:30:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyn7-0000000HRHb-1yRK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:29:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2163b0c09afso111625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 10:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546540; x=1735151340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNc9bbXIkaEAXHmkzJsg6tVAk/RGNozbWEU6KnPyaP0=;
        b=YD+4ThrxXjrAmwHL3uTkzn7teqtPOWcsDkoabl4ljZbL9qLaKF6twC4I/m11w07fMm
         Dd8V26uCywEid9LnGXlHuJhtpNfHT957b7rVMzsIpr7YPD1lchcIt2gZYZwRnfQk0rAi
         flhvW0rlzdnzJlAtFGh8w1fAx8yeEshBwjOWNJaOEraO2dIBM71IeSDoKp3ADj/A+5cE
         5WM2cGN8/WFXkKdmkG+jPz16nfEyUmtfEoAP1boycMnwBIjT5EumlY0aM+5IB0IKMP87
         VzPtGRKA/qe9sh4VZPZAnQIdGt/RPtZtwwr+DCIamq5LkzVWkMVI2SewpNvBF++USruc
         xdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546540; x=1735151340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNc9bbXIkaEAXHmkzJsg6tVAk/RGNozbWEU6KnPyaP0=;
        b=XTmAbzU3A2ThiMvAWVgsuFewnljxevwtNw7d/6baum735CiG1u/2gsFxLsJfMaPVXz
         f4pRvhjsygXX6O3nXB9/hqsvOUlpeSiSaGOzbzOd9T5ga9/7tn7mKUzADtUpLyvfenK1
         fQ7LjDJ4RlJKc0PfPss8yw0hHcqfiZdzW8vaUUHIz0XtVSklG312lNbnsbcwZvl6eR4o
         vZpOYNtxsjFdZCujt9xkwNJNrUEOISfiM874D21/c4wlom7RaIhQNv5KlLUcNlAZozB2
         /MoBbyzYDRKQTg8uk8aCNdaO/ZWsXzcwXttP/wM9BGZ+5RONCeRr/sL9QNFRRPONSNab
         0cRA==
X-Forwarded-Encrypted: i=1; AJvYcCUAG/GMp2RYzmVCTtN4xKAScCQf5jQ9r8Bp/2ojQ68fiXk+skJSgU+nNHUZO23VYOh6WDrfcTqP0HOKsO45yKBo@lists.infradead.org
X-Gm-Message-State: AOJu0YzBS58zxgYlxe7UNsia2Hvdu28uBhHAVP0gd+kmXHmr0jmRjsvY
	fNlQQNl43XH/Tim1KmradUrLxojE9lsIgUKcsiNF5Hxh5NvUM9sJ
X-Gm-Gg: ASbGncu9ezQx5QRAg5rZgg9vKLhufp81FrH1Lech1Ary3Xw5YAgfJjHIjR5T/7hMsGd
	87MsUJiDlqTH5B5r2l/yMtrYNHfWZqmVIFAQ8aQXUIJ4G+0r/DyGGaQgTw2683CwFZlCe4dBXll
	0MBDvk1eSWcg+ufpok2PF0TGw2X96Ayou97FxWhEH+Cgdd0CSC+0ZOyWJ+1Zlhx6cxte7G0bqDP
	rEMX/abnZrZyDyb9rg70K26XkxeNTYGch7/8z7pf34a3AFgEQ+/ClMwRg==
X-Google-Smtp-Source: AGHT+IHxXWjf3S+DdVVf1jMLuuc8tXpGWFk/e409lCT+hKGNpbdRe9fl9r68eLBILkwmcXvTlksMPg==
X-Received: by 2002:a17:903:120e:b0:216:4cc2:b1e0 with SMTP id d9443c01a7336-218d7216b93mr55843765ad.20.1734546540124;
        Wed, 18 Dec 2024 10:29:00 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:28:59 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 0/7] Apple A7-A11, T2 SoC cpufreq support
Date: Thu, 19 Dec 2024 02:25:02 +0800
Message-ID: <20241218182834.22334-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102901_511319_507E67D2 
X-CRM114-Status: UNSURE (   8.68  )
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

This series add driver support for cpufreq Apple A7-A11, T2 SoCs.
Device Tree nodes will be included in another series.

Changes since v2:
- Use NSEC_PER_USEC instead of 1000 as multplier.

v2: https://lore.kernel.org/asahi/20241212070344.3858-1-towinchenmi@gmail.com/T

Changes since v1:
- transition_latency is in ns, APPLE_DVFS_TRANSITION_TIMEOUT in us.
Multiply APPLE_DVFS_TRANSITION_TIMEOUT by 1000 before setting it as
transition_latency.

v1: https://lore.kernel.org/asahi/20241211112244.18393-1-towinchenmi@gmail.com/T

Nick Chan
---

Hector Martin (1):
  cpufreq: apple-soc: Drop setting the PS2 field on M2+

Nick Chan (6):
  dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2
    compatibles
  cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
  cpufreq: apple-soc: Use 32-bit read for status register
  cpufreq: apple-soc: Increase cluster switch timeout to 400us
  cpufreq: apple-soc: Set fallback transition latency to
    APPLE_DVFS_TRANSITION_TIMEOUT
  cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support

 .../cpufreq/apple,cluster-cpufreq.yaml        | 10 +++-
 drivers/cpufreq/apple-soc-cpufreq.c           | 56 +++++++++++++++----
 2 files changed, 54 insertions(+), 12 deletions(-)


base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
-- 
2.47.1


