Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BD7EA4FD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=; b=BPJU3ITFVMBxXdy2W17ro4eLu1
	8xxwRBUaho6Kr0h7NcUXs8qZF5jS6XnG4Lg0eXbWUpzxnCIPxoVo4AzMfaE8jf77SNJnXftyVjI5N
	jHyMqJGHTetJ8ppLr8iy+2RuGAhax6or7g6v3u39gmX6tu8CCjAtSmr8JoYtN8AhScHMaGJL7xI7i
	MGIJ2yS9UCAvi9/rAsMQVBkl6L3zMvQstUV4Lnk5t21NFTK7FxyZxGKCW6nqoNiZ4swVLdS30xEYA
	RPvp8q1iCx1RUAH59Zl4j65NP/ItiQn40T5PWfm+GRWun3JZWn/RsXrwGvMZR3FzIG49huX5399V+
	gmQ4WixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhXJ-00000001J32-142l;
	Tue, 24 Feb 2026 01:48:29 +0000
Received: from mail-qt1-x864.google.com ([2607:f8b0:4864:20::864])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhXE-00000001J0o-1qI2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:48:25 +0000
Received: by mail-qt1-x864.google.com with SMTP id d75a77b69052e-506e287dd53so40820891cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897703; x=1772502503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=;
        b=f7pJUnxmfpzNfhoDTYh5rnDQvEGTnvc6ivlhaxCEdsBmM1oBAlSBgdbPJppTsZ9eBS
         G6691ulDODfs8dlZDOFyqaND/nMnIvhfsAhZjomaFJXX4H07syuEpzHWEFWYdy22HLrK
         oq5Joufz2UvoJXkI6gGHgJpq9WvXgUVmnXY2xuupkd1W0B6V9lJguszPEAk5CS5fSw37
         BZLUx976DrbARs/vpxS5Fqm6vUdQ3fZd0XyhlEjUm2CFlrRH1YmqIPvJDVixVyjQZRK2
         LQb5ucYvZmWHtv6QKqsEMJfi1hTO5MnopFvI7sWWMahABm9pT5q6mXiH96BbfxcXlo4c
         C5zg==
X-Forwarded-Encrypted: i=1; AJvYcCUaH8kgTuWD1Gjt3K8YWp8gRvWnBVDgXj8TlyiAPuiNl2RRyRDmDPcRKC1ujbiIYQNgk1cWuaWzL8E9yZeLeg9Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxTI+T0GgwJhO2XQeX4rJ7k23vTBTrivMQjHP02fGmfJOfQcbMP
	qQhBW16piWGXoI0bahWyjSh47BY8tPEMHfrU0y+W0inALLH1vXgK65Ut4tLX/yeqp5VF3rlNszk
	sMb2o+tKAhjNI8xyWFORD7hC9SwdR8+2kDdretUbP08mfQflRPQIeOW1qUqBI453Ne9WxzUcz0M
	4oObBbW0surWDezZAcMlYtDmaPPidqwMR5y9u7C0NchiL5e4mKu7frs8espCWHW6Qqyu/zq9ydl
	RukBiqb1HAWRjZmdJFUoMkFa9U=
X-Gm-Gg: AZuq6aLz8ZIn7AsT3grMINHGzgEvFCMolbFSRH0l9g2K+vzporYteENoVoOumNWcStv
	1bRvLQW0qtRLduzEEJotEP7XC5hXzOEHnidQImrKYnzi9NPDLsPD5cJjqvN6Q/OAWVlk2PIiq6G
	2cmCIWekDnQIM+c3fAE2sD/t0JcNNr86IChvepIs5Fp5MGHnpJ9Vsta/ti877DWq7d4trJKadvb
	uu3nfesbvq7Re3hI1WlhlCQtIf7sXi+uHOyFyl/LKsde68g48aY9kTxjRCu8iWHwu8LJswmP867
	NeaTRHx6tq3L//uVIIYhue/bFtg5UbqsqxBUG2ljgSn8/TEitLuzfCHgT8EKv7l2MUSnDjrz1qK
	k/M1ZabphUbevnGvESh/NujDtD/wfFiMOf4LKY0KvkQ3DNqdRLcTIbaV9foziw76l5gxIKH68wi
	FJTwQPCVdvSJnTezA5BYTwkmM+4lM+YirtVECQLl14t3m5HCxyISMV4g==
X-Received: by 2002:ac8:5f8a:0:b0:4f4:c0d0:2014 with SMTP id d75a77b69052e-5070bba693dmr158522911cf.15.1771897702843;
        Mon, 23 Feb 2026 17:48:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-95.dlp.protect.broadcom.com. [144.49.247.95])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8997e433456sm10523856d6.22.2026.02.23.17.48.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:48:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127133794b6so6488480c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771897702; x=1772502502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=;
        b=ggVSPQllkFK+8UR4eg8hPAelHm97x9il+S1DRAEcp32v6ZOTLkTayKkej7BPq4yI2T
         BlF9J4p2wBt3ZCrn+gOl5EeQSqWllSCgrDK63YKI6nDbIycrVggfAF79yllrQIYy4H6S
         kMBhTOwQCGVBfNfHl3x9r7GAZ6o9JP2TycaSY=
X-Forwarded-Encrypted: i=1; AJvYcCWdAdE/b/zVmmGKjsH4MlaU6FuMgeT4YA3KXQWcNCoegJfhw0rthMoaK0Hk9KTW1zUoHkawxApJ0ApYcA7xjT7m@lists.infradead.org
X-Received: by 2002:a05:7022:2214:b0:11a:273c:dd98 with SMTP id a92af1059eb24-1276acc4db8mr4490766c88.20.1771897701633;
        Mon, 23 Feb 2026 17:48:21 -0800 (PST)
X-Received: by 2002:a05:7022:2214:b0:11a:273c:dd98 with SMTP id a92af1059eb24-1276acc4db8mr4490750c88.20.1771897701103;
        Mon, 23 Feb 2026 17:48:21 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af102d9sm8470964c88.1.2026.02.23.17.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:48:20 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v5 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Mon, 23 Feb 2026 20:47:58 -0500
Message-Id: <20260224014758.2660318-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
References: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_174824_482440_13362F90 
X-CRM114-Status: GOOD (  11.19  )
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
index b8d8a5c41597..c5971cbcf087 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5249,6 +5249,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
 F:	drivers/gpio/gpio-brcmstb.c
 
+BROADCOM BRCMSTB HWSPINLOCK DRIVER
+M:	Kamal Dasu <kamal.dasu@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1


