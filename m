Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA90CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjPNYdwrOQ7VZzUkHlZPDHNe5mCfkmGw4KFMZphd8TQ=; b=Zcjmw/UdAyN65mTV3yR5RB9OUA
	PB2Jx6kJZKTgksWgJfeM6oROjEpD0mCEv1mmsn5z2ADYye5EhUXOv0wQMlNfKN4YbWNXjTURkPOvm
	LDM6epjaHMWkEUyLrsEzjJl5Esb6xwickn65ivQPtcYEfZqYvTFrgFhVwFrp+Eh0W75KDz44g5WNh
	JNk4mmeTitae8In1DMBqU6Mpj3UjG7wiL7yUvmABcO3h6VFz4FRfmXvO43RXwACZggJcQcIjAuq7l
	nldUM382ekk3WC659/tRil+9V2vV84xlxa+bCXBehvJIEHcL1m+apEiDS8JTws1QsA9/Y4dQglLW0
	pSNZbgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvt-0000000Abxx-2ojp;
	Fri, 22 May 2026 11:20:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvm-0000000Absj-0kkg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 11:20:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso60180195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 04:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448840; x=1780053640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjPNYdwrOQ7VZzUkHlZPDHNe5mCfkmGw4KFMZphd8TQ=;
        b=JPFPcBhg6SDxhB59dhMTUyUHFLWZGeF97RDBzzgcf2ZHVVIWwcfEoDhGKhcqNJIWxr
         RI/Xd9iszVYgW0ftazcAXhCber6hpmOK3EAfN7JF2YkHmMkltc1mf24n69fXVZBnTmLi
         osY7uc/ZdltZQjUPVY5k47PBG3KxOkmMdSF0OGlnSJiZ9q3NFrtTn24fTGzY5Q82SiZp
         4Bf3OmvPvXGzNvjKkRtFMg5QV/7GyebcUpY40MEfxwiPDwcSVuf/cXvTvD1Yo/Fo4AwO
         fWhrmDoiNEAs3krVBvuOSrJrBLxcFkp/rJ9lMyCN7oyI2WvydQzCSSFVu7DP5vEyy1wX
         vveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448840; x=1780053640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjPNYdwrOQ7VZzUkHlZPDHNe5mCfkmGw4KFMZphd8TQ=;
        b=nwZXkbReW8Bm0pNgx8NPJdr3/wv5l0Zt4F8VBw/PpDCttQmnxXhPp7bYAfh36LGzwP
         ZTan/hk+Xx7b9tOjLWe+vvlNzBYPjgI9DCUnnQ18dCG2Yn2PbM8Tj58EZCR1quZPpLSF
         f+w1SvnccvDs40W3Zit7OWgfBq6Nn0F4hpA9KcGu1bqB5bLtzF8rH45P6X5jg+BI5h2I
         6a0Ynum98NTMmp9dtf3qs/JkJj+vj5rLwvnKmHUnnaOaOCoQzysNhYPbdVIXehV1T34w
         c+uwMYwCWsLvcxrJyTj2TvXXMcPhGr1XAYJuctbk7qozTrnZK0EY3AhB9aLt4+qlS2Lj
         ypZg==
X-Forwarded-Encrypted: i=1; AFNElJ+v6gE1+Tx8S9CJkgaPd6Xolka0pKdO3q088vPUeJRBMR0q1+tffTVKiOsUQmRHbwFLju6cMvwkZXgm9lrdoaLs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9+t3hYLGoGS1Zql5zCwDTXdvpJzvNe4z2zciobtdeui4tfdFT
	fgM9mnmYEDHjBUmG8lGrvAg20MeIfVg9YLWYBQz02c90+5xb7l9tu/p1BoSQeUz1
X-Gm-Gg: Acq92OFNcZxAYifbDHvADW7ffPlSu64MtOARUXBbHP/q3/zPKH8dAQO5Tj0O2Oj5JI/
	OFcDwl5J+w7234fh1iYZ7aD2FCh7OA8MeJBduucCpVDCPOoPsoWWznzf98Cd39jSUB9FN9eu1rk
	b0lnszxFrfvwiboQEoAUbwCi8nk55BWRssK0g6kp7QEh5l8UjsmcaQc5qss3NAOCfA4BGc9QYL5
	UlxFEx7emJGWzuyiOWSiVhJ3xGO1ntmdRQLcZgC4Zfn3PWiJ9ilxuhqIFj15WzkI26duV4anxYH
	rS7iokqh+dVMBmn8n9rJP3GfsO+kQnWM4pGSZ6QKk0WSVSpKgbCNK76aVcuRIu+uXOL+/I+w38s
	iqgF9UTQO3j+8yO3fdAz6VRvCeOdAFppZ5VqYy5nYnZgydkDCcDaA8FRLw3MNtuF8KJdesrcXhp
	/ZzyTih9yiIMA20LC8r/dyKfYkp/SBIN3dml7/wEuBOGfna3BtJ8VEhoMImQ+oCKiclzZ2bqA=
X-Received: by 2002:a05:600c:a402:b0:490:3d62:eb0 with SMTP id 5b1f17b1804b1-490426d7019mr33176065e9.24.1779448840049;
        Fri, 22 May 2026 04:20:40 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:39 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: freescale: imx95-15x15-frdm: remove common rmem regions
Date: Fri, 22 May 2026 04:18:48 -0700
Message-ID: <20260522111849.783-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042042_238488_5AF85426 
X-CRM114-Status: GOOD (  10.54  )
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

Remove the reserved memory regions that are common to the MX95-19x19-EVK,
MX95-15x15-FRDM, and MX95-15x15-EVK platforms and are used for remoteproc.
At the moment, these regions are not used for anything and can be included
in an RPMSG-specific DTS.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.43.0


