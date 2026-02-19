Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7ECC531E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=; b=UmwLxOHix1pbTeL+PWyLoSZ5kJ
	JUpK7tSrrfNnsDvzmKQbOx1NMRUpYAsz1u5wLajGue44/1Zh5t5aSGjyjk8wuI8Ua4Wo7HT7Iz7Pw
	Ylm/qMIKiYucBSz84EkidfcUNJhqzdq+TDK/DKW9xlODTAsRG70y+tU1o/RNQPKTFLTTWlK2FmaDG
	TLaWWxX1BMdCqnBl7//8cFY1Q2w3koGbfTnzM6iB5Q0d49722R41PZTLGZ+3dFauleMNTe0QfOmWH
	SMkxKL54QsmOOcgfeQJbmqr7xMyhQNl+EJoUFvc+XrZbSIACrIkUW78/wquJxKRpbawWplpIm991z
	VPbGzihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC1a-0000000C7Q4-0EJM;
	Thu, 19 Feb 2026 21:57:30 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC1S-0000000C7N8-2Gw2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 21:57:27 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-c6e248aa446so600059a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771538241; x=1772143041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=;
        b=Cnqfb+ZmolM/v0K/3Q0V/a2U54ga8P1QtYxWQJHL2xUnjT9JMZnjwBKzXIbrxVj2UO
         uwMyODkHZGXNrORYzXaNPm0ZPZwtCvpH9c7ig4ILa0KTgWYKqwMeH/hXiE9Qbb2zCg/T
         V7cmdfoPzD2Monv1eiz8wIs/QzBCPqAc3zAmR17L+ZnlIgWhEoaUpE3ZJj9v6YxyUUdQ
         Gx8RKny/wrcw9A0c6lBAha9Lu58MFWbJzOmuAnTBEJNxrQPJzy/AXhvEXf0jmKfSP7py
         uNJ5+Hw0NpbyP4vnOkY4Thp5kq/pylj4T5zZmILn2KWhMzLvxjeIVonnjx63O9mdhQ1w
         d5pg==
X-Forwarded-Encrypted: i=1; AJvYcCXCpuTiYng11Ujs7i1ecEqjtm33CUgSFJilp+dxdPdBv3NPKL8sROFtClAFRvEFE/Kud17GWOkSwtLGWrisgqU6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1k560DcmmzL5tr+PcRMffeE7GqnsQVSojacH4Gak5hS7owISF
	JM1FSmaMbmu5Y5MJnyg+a3Cm54vXmktnv7EBoUZhdA9q/TiWaown8EeQuZxHESqLh/I7gTWCW5q
	kfUqud3gvqXAAe0AQk4y4ZHpwuAbsKfwZsVcmxL4QZzCuTJcGAFZ4nhKIQ0De8MZhUbSg6sxE3S
	93HNlkQh02NQDkNwjIn5i4LKVWiHCsVl3WM/cbDaoifeB0mrUgsXW1DngkDvpXTSnydY2pblML3
	13abe5YdcDY25viNhDNhAFSj8k=
X-Gm-Gg: AZuq6aI2V2dxrgTiQx4i0b5bA/QiK7APcjR2o59VziTbv0q50lMfWqeIDwXfwwJXqzw
	8WexqoDkW4DpniHJMvM2N0qRgvd13cXCDoT8icJKw1MVtQXWSCYPcG0JDqOCDY+U5AcokyEONNl
	2AbDowFnW1VraeXkT6dUSbbikJnjyWeuGPURcqt5lzeKCC8BRjoetafnjx2sfX4LJQzu9TWD7ge
	yQ3XGCbFJWB++vgU0JjkD0MKVz6JKoufVx5VGWXVftwOczVzaWPz1OhQfAoDKTCdGz6inX2zUVK
	kyvLCwnvE9RSEe/fYocK+UsdfW+TNbuWwrRnSfH6CjxtH1SsawIGuXikzyuKVbQCf8YTljh/lbE
	B5vk3v33juEPOn369eWveE8w78SmQUHcb4kaLBSLVl7fpf8Oi+d2d/1GLBemOwln1v1m4wjxDi4
	aIQRfr0kkCFyumor1vouW8KlHGDbakq48QWcQQwJ0fUCqB/g8EBYzkdYmX
X-Received: by 2002:a17:90b:3d50:b0:353:5c16:aa7 with SMTP id 98e67ed59e1d1-356aad7ec17mr15340000a91.25.1771538241469;
        Thu, 19 Feb 2026 13:57:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3589d84db80sm197649a91.8.2026.02.19.13.57.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:57:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aaf0dbd073so16811145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771538240; x=1772143040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEEHWNvLAhr/ZF6L79UPjbW5kaI9Zew8uBravIkb5jI=;
        b=UW4TCrz7GRn/6cNb5hGLLSBny9S4fj27urQ82/OtJ5hC5GmI11n+4ItSIp8xWHKpfC
         dnpb0cOBB/qXezFygEwwxnmmmnppWwZeve/iuSeao7V2pBPkZNYbZ6fQ8iSwn0cWvYTY
         YaUChbxf3zB3nPFjn2edhjGotJ5iNa+MZUi0U=
X-Forwarded-Encrypted: i=1; AJvYcCUj7G6l/dMViELqTIG3wxm+CgCaBd+kHAb1jcf1LhQCotyxKYDA0YWiOQQxYLgpiaA59poOHE09iGpprnujuz0I@lists.infradead.org
X-Received: by 2002:a17:903:1b0c:b0:2aa:f9d7:68aa with SMTP id d9443c01a7336-2ab505628afmr204534305ad.21.1771538239727;
        Thu, 19 Feb 2026 13:57:19 -0800 (PST)
X-Received: by 2002:a17:903:1b0c:b0:2aa:f9d7:68aa with SMTP id d9443c01a7336-2ab505628afmr204534065ad.21.1771538239253;
        Thu, 19 Feb 2026 13:57:19 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9d73sm156416065ad.77.2026.02.19.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:57:19 -0800 (PST)
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
Subject: [PATCH v4 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Thu, 19 Feb 2026 16:57:02 -0500
Message-Id: <20260219215702.63321-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219215702.63321-1-kamal.dasu@broadcom.com>
References: <20260219215702.63321-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_135725_844307_C5C892F0 
X-CRM114-Status: GOOD (  11.72  )
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


