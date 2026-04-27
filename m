Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3408CFF8871
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6HrkrEMv+Q+KsECCy2j5IGNVAW2RVCs/l06xUaahDY=; b=UzDIzQKmZJF0lBy0L8RWn6iJZU
	hsaSnhNUcoDURKL9WiiGpy/0qkJoL4rQXLPgm8tm9FRgVzsYOV4v2U6VSAQGv49HGupiUaGRLOzrk
	GCF5hbaFQ2aV6MMYmMHzqtEnUWVBrP5vC5ERDtV5IbarE2ovg8pGNt6seK/8oGYc4O91CkpRN/+KS
	7XAJB2MBsujGHh4DGeQhA1vti8jLxlHa3IDhvm2mzRdu8hvkHH0Va6rw/Y4ql6qZusdvaOplb+SlO
	HUud0iNccCY6VSIjSwUP+hKU0VPDRkNxtGUwNEilwxDYSz/6tnrRnaGkqYXxTpWp2WL7UhIfmmIKi
	C0HWC+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSKE-0000000061J-0Fhv;
	Mon, 27 Apr 2026 20:13:02 +0000
Received: from mail-qv1-xf63.google.com ([2607:f8b0:4864:20::f63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSK7-000000005yN-1Z1r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:12:56 +0000
Received: by mail-qv1-xf63.google.com with SMTP id 6a1803df08f44-8a068db9989so107841786d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320774; x=1777925574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6HrkrEMv+Q+KsECCy2j5IGNVAW2RVCs/l06xUaahDY=;
        b=SJ67baaY3xDTF7JuNNs2G//buCFBKLpWc6sOV456NuZhpznfwCi8kQbbtJTWG27eGY
         7jP7cFIwhs0CRHf8JU4D4UxSpQ6yuRd9/v9GPAMRrDnf1CtLY6D1DsPX+P4w04Gf9ESg
         dRNP5FQmPiHhVqXH4GtLX7j4noGPorZUGwW44jQNFZZN1DzoXXtoA5jifWH8lvJVY8EQ
         wp7z8NIkDrT2+T2tN6sXQtkZmwIdMBfWAwEHjQDGIE1Dmy6KuTBi4VobJmlpKF01Xhoy
         rdzMjvMQHlm/BIUBUtUt5bZe2xznRf+iBedQqMC3bLpN6h1QjAOkbrLPdHV648EiTtQh
         bTpA==
X-Forwarded-Encrypted: i=1; AFNElJ/nYaOw4DAK4mJnQL+UC5ppOaUe37b6ZW5jfiHq0r0zUPiO3wnFhQdeeOVViH9pfiOCnnPc4c2FSrO177IbB+bh@lists.infradead.org
X-Gm-Message-State: AOJu0YyuR7q+7zf5DYhB3dj26OB9slvaMCjFkKsdphQocBgRD2D/WyxG
	4XNtdDf3y9Pbyz8QwWG7KdAXI8xRg0/DgmhFuYFmN2PD++BQE9ppzyvFkWmOY/nHZyjXfc+9qos
	WugCc/w8osAlrCxE/xXF8KO1Kg2v5z7JPDnfajbCBDYC/ARvBwOpVZ17Bdh6eq2yqZSvCt2YLXA
	P4v3UjL0NX3opaoEaln1QAPisduS7Wh/3yag1l5HAZcsdJ64aVFqozlFhnlo/ORTdeq7JC/YTNo
	ZxUVbnkV2u5/31yYYjrnnOREJI=
X-Gm-Gg: AeBDiesDqIxYRmXItx5T18wkAcoehOdspzADhiAgutgo7aN3UGhq89W0ws/XwPrhzPr
	7PdykvA4OULy6to/tf19ZFta1ivEVfn50JYNmw+E7HLS3k5yeHjiot8INUBkyzLhT41SB3RH25d
	EDWWyilN4+AHKHnkSpeNu2eXBb0buz8bSxWsyaneJFYde00OR7g7KjWkmOrGzNTSBFSMXH9ZfGo
	dJbjaCZKsT+8ITlx3hoe65zBGsbzLQqJPRTfSCL6XWgtm6SYzumqmwcs2UWzwRH4K4qCII073TU
	0GCgIJEEPs8KAll+4Hp3SuDKPkBpAKTPNnxwi+pfullS1C25XPYLEHiuUjL9RlZGewzw8B4YR/G
	MaOq4OOUP3NOYgVokTIhOl1r/Y3U2I2OgI8Ojv+A3qHXqAmA7NwlL2sSjJ1Vin/mOdRumkl8KI9
	CGG+KxG45YD8LHG+mvFYWZ23tInlpqvE/68wNLiTOGgALmwEZKa6lZ5ucUVl1PDg==
X-Received: by 2002:a05:6214:e6d:b0:896:fb99:f692 with SMTP id 6a1803df08f44-8b3e37a200emr3191166d6.0.1777320773891;
        Mon, 27 Apr 2026 13:12:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8b3e2a006fbsm249376d6.25.2026.04.27.13.12.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so6690925eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320773; x=1777925573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6HrkrEMv+Q+KsECCy2j5IGNVAW2RVCs/l06xUaahDY=;
        b=QZj5R6UWWGGobVeX0GEmCd0WIW94Jv+eRIRRfRaBKji9Lc5pVlXFMrf1KGb0vgaB6f
         7B97lsukSfTVM0Qbz9RtD4HkDi3qlhG+BNpYErUAj6kdWUt1tBbeFZCAtH7O1IPDibVj
         0h5tu0DoE7RlYB+LBdJ/hITYq5N0rTbgQYkeM=
X-Forwarded-Encrypted: i=1; AFNElJ+Ue3S2KK4idv5SyiEeoc+mNYZAIi7A1bV/jzwcBkfHH0brurbyZ7POqCSFz3Gwt2nl05QU28us/tpkTwMWQIX0@lists.infradead.org
X-Received: by 2002:a05:7300:dc85:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2ed0a530457mr90793eec.11.1777320772624;
        Mon, 27 Apr 2026 13:12:52 -0700 (PDT)
X-Received: by 2002:a05:7300:dc85:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2ed0a530457mr90770eec.11.1777320772079;
        Mon, 27 Apr 2026 13:12:52 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:51 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Mon, 27 Apr 2026 16:12:33 -0400
Message-Id: <20260427201233.380314-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_131255_424544_A9A01ED2 
X-CRM114-Status: GOOD (  10.91  )
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

Adding myself to the maintainers list for the hwspinlock
driver on broadcom settop platforms.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..4f3dfc6a090c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5244,6 +5244,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
 F:	drivers/gpio/gpio-brcmstb.c
 
+BROADCOM BRCMSTB HWSPINLOCK DRIVER
+M:	Kamal Dasu <kamal.dasu@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1


