Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4961DF4BB8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUe2/zV4rw3eAKHjqP1mXU6br5sdLAclT1ghdsXtXr4=; b=J5y8ykdAKwQjO1Mhnd4yhL1bfi
	4bZqMU+X6gMPH+r3okFVUVyz+0yrSngXph2WqReFapiCwzdgJR+cC3PV2A++qlpq70XA5wvo+Gv3Q
	l4h8KKcXD3wyZGpmeY3Jfx9CAtfX756nOVTVqFbtP4/wk+T1SbKvVnvVizN8CVdW2TfFwAF3+bwtc
	RErNFL4lXZwfhf0gxKKl5yWN0krMKyu+Zi5SHztTcLGfE8eA5JmB97mvnWvtLK7RGWPHFcBGx7qi/
	nlhd3q74F6LtqY/UYJ55cgD5jkn+Ek/ObBMzyNohSkr1xhewPhEZisa89bvUlyY1r7RPJXiGnx4jF
	HqPDmh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0WO-00000002pt8-3wnX;
	Tue, 24 Feb 2026 22:04:48 +0000
Received: from mail-qv1-xf62.google.com ([2607:f8b0:4864:20::f62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0WM-00000002prh-2MFx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:04:47 +0000
Received: by mail-qv1-xf62.google.com with SMTP id 6a1803df08f44-89549b2f538so79361736d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771970685; x=1772575485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUe2/zV4rw3eAKHjqP1mXU6br5sdLAclT1ghdsXtXr4=;
        b=SycoMUmzMBGSin+CadE4sg6RG3IJ9jjwzoPuZpionyrT7GCSMzDY7oICT/GipwcCUo
         J9W/ahnDs7swB8WBFCJQmNIWtyHa4RsOILhIggzxk9OR/vQ/sdRvasM1XAOaOJU+7m74
         PgRNws8q/MxGtP0OYZhx+Fuz4Z1ENyuFCzEhSKkgDFSnEeCbpOmy3YRp0Epg9Ebr7n+Y
         xSnw8tJ5aQilt0KYEmOnNpFgzBlqH2T2LAopfUYy4yuPUrySvc8mzUE4qujVfxWcobpT
         CU05vK8vceFGgdlMqGNmYYXRKewgfQq8xudViHppIBPHCji3cMLXETRLYHz6C+QEUcAZ
         E6+w==
X-Forwarded-Encrypted: i=1; AJvYcCVbPGotyS310BsXxgN6KM5YpGPkLT7Se4B4B3VfrsALjr3U62Hy1YJnstwghQOQIT7IaQ3g2ZtjxfcjU9hVU6YI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeh0hub2yaw9PtkzEL8neWumw5Dm3WQrPHuCCHXYNNW5LwG6r+
	VZ6GzzXf5e/RbQl5wpu0/ZnS56LPliR+9py4mmda6GVGVuQop7govcW8SgfGHVHpyKHvFiB0Yaf
	ZJNlFh/OcoxPsNQX1X3iHzABEuflPUG0AxT76BvyMDW7nfHcLwsTHAjwRfPzXm26WYVyMfkQTPE
	+7cuh4mZdFDY4c2zziVaynjYAjhiYvQTM0R121AO4yOIhrTUTLRBA1Qgf/85RCl6ECB/6iaHVaY
	PwX7KlD47DkucAYeMa67Q7pXLI=
X-Gm-Gg: ATEYQzzFJ+u7hzRtOqIcgcuZzix7juC+Nbk1kXLDU6LCWBP8mPRUYrCVc72D3PqeXSj
	84o5xrKNYkRTdE+bhuWmwunkrqEe+W7KaWXIKj3/SemdII90HRNtSwuxoEgyVLAY91hI00ISqHh
	4LUzHp5pJ0tFJmt6PPNWRXexHv9TCE/8eDaOrVqiNo426UYDyBtBZRSdkzoQgUR+fq8TLeSShmq
	+m5uk4romJ0ie00xCUCAG5QphSihOmckfaZp3gDYntfYFt15aa+gbw/l8c9sxUnOsg3LUGg6HSm
	CpMBCu1dJyZ0Tn7KCR1JMVUjrDGsc/0sP/TljfG3A5ZTzLPAyPaDiZnVSr/2dlPbru7sRN9LZvt
	zSMeV5EYtI4i3RH2nz2Iq1dxywzOV3DcAAYjW7B0rPjtXLI/Inzqifcv65s/Mw4nueJTGc9X3h/
	Jot3mS6PZMcb5Bf03twHFAOsy8W7HNAby6FZxoIKVuenrXvCMK925XoIia
X-Received: by 2002:ad4:5d6a:0:b0:894:7795:a56d with SMTP id 6a1803df08f44-899b8990968mr764166d6.29.1771970685064;
        Tue, 24 Feb 2026 14:04:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8997bc8fef5sm13932766d6.0.2026.02.24.14.04.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Feb 2026 14:04:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bd3bf5dde4so5776417eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771970684; x=1772575484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUe2/zV4rw3eAKHjqP1mXU6br5sdLAclT1ghdsXtXr4=;
        b=MUcbZFQfMSu97bWCeybvTNKXcJv81CcfhKC9My6SxhdRAvLihmo0YwGV7xdiXRQW4h
         fNYQXB4rXShmFs2vkTA+NjTywTdw3cnsg7hwM3BhzB59WWEP6+Cra4DWS4rNgkZ3xEZL
         vLI7NTWqDCrK01PyaXWT1MZ7JdgLldrMNh0W8=
X-Forwarded-Encrypted: i=1; AJvYcCUrxU6ujMynJALj1e/uFaOiuvxTcCtwlsY0qwLHeQSmlqg19plwRlCUG8igoK4o4FO86ovBePl3L2fq/VSWCJdi@lists.infradead.org
X-Received: by 2002:a05:7300:572c:b0:2bd:afdb:72d7 with SMTP id 5a478bee46e88-2bdc317c4famr26768eec.3.1771970683874;
        Tue, 24 Feb 2026 14:04:43 -0800 (PST)
X-Received: by 2002:a05:7300:572c:b0:2bd:afdb:72d7 with SMTP id 5a478bee46e88-2bdc317c4famr26749eec.3.1771970683304;
        Tue, 24 Feb 2026 14:04:43 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdb055507bsm2374822eec.0.2026.02.24.14.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:04:43 -0800 (PST)
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
Subject: [PATCH v6 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Tue, 24 Feb 2026 17:04:07 -0500
Message-Id: <20260224220407.2351692-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_140446_611190_5698153A 
X-CRM114-Status: GOOD (  11.48  )
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
index b8d8a5c41597..cb3e653b204c 100644
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
+F:	Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1


