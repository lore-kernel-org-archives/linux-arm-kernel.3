Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1203BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pC7vKNtvxXJSB4veOOQwTeA6v2wJSbqIf9D6+uJhGQ=; b=BUy/SzSWcx62N+f9EBSirsapDf
	HORis8ksKPSKZcjTI7kxdJQGvlhl+gd0oMLwWQCPGXz1Sr9nJAa0OLqqu2dNHV+1qb/4j6xyqaQYC
	5fUFdGm75/l2soK9VbTbi9B6Txg+yI++BoVzQcipVw1agPHqtZ9KIUg6MJwUhmUrVRkXpckTTdCYW
	SBYkvvY+pQCKtAyldrgtIlnxx9W2R69V/UmML+kGLpdTMlR2miEdlafzHjNWI8Pqvrkw4c0rvecxi
	Wgme0MY/sI0yc5bjgkf4DGBABYD/2ILXbmQrQqLs+ztERvBwddTAf8SWwhL4PsMNCh6qqZrwyX0df
	kpXjexYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y4B-000000078uB-3YPN;
	Thu, 09 Oct 2025 21:20:51 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y49-000000078sa-1f4A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:20:50 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so1147962a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760044848; x=1760649648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8pC7vKNtvxXJSB4veOOQwTeA6v2wJSbqIf9D6+uJhGQ=;
        b=uzEficT4iYsehXIdU9Q6WI3W3rsZ63la/u20LGFIiBQ7IourBCAdrZI+PMRnCjyfsY
         8oKRBvGxU3YSr+1SsdaOE8stPyep3SQ3Wl4oaiaTHDYGvdXvfOzgnufT3ml26kEo3ILt
         +8vf9xGsPlIbOzhxXtlhX/X8bmZryl/chHwbnCw+yaLM4NqDI3QDKZ8uHynGaURdh0cZ
         ID7wXkHb2WhJdVlvb7UgwwmTBQcUr0o78NwN224uI71ui6/vgzx61S84kdY0gUks1mYn
         9X4Jl/9YOxeUusjwztGEVuiBql9wX6U09cmnofNf4g/WDBQ6Vdym7vgQN+ZgzKfSapVE
         D9MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHbQ+k/O6G5eBJbbsbdG4bcdou+FeNP61S+pAiSI8kDSNFbrYOIToocYGoyi++BlV/aN3szU7p1WzvvMKVX7HK@lists.infradead.org
X-Gm-Message-State: AOJu0YyYpY7K6mNZknx+FxYXwEkhE2EAAoTcayEaOGC1kEbunJyv/uhb
	1dIkTMhWYUmgmZ3TUv8cWjFgMiLZN0e0YrrLeeXeJBc6qaxUTaOq8YzOMyBN6sITIBrAIJ9FljA
	w8IZz5jC82bR+XzAF9VkX9X997qqRR58qCOMPQdgEURgGO80bdWC89ADSCmGz1L0DIkM1HH2rPQ
	040SvRTjL+4boCX5rf+0fI6RwtQ5X5oEspHlvhMcAB/J8DlEXhc1fbX9shG3DhqgpQ9ONqQKx2C
	q48Od9ghdXbn/iVYSrRY6VtHTU=
X-Gm-Gg: ASbGncs5kRsAXlc291muwBzsox4djxIXQZglNL+qGO3/WVedl/22r3Dipju36jGJQ4j
	e0hrDTfBCxHY+TbbWYZL1LC+MGjIDKhPldSxYnkKhVsbTAcpeqtLUNwDwmWqLx7HtC9Mbsrim0d
	TAVVCRODfzQr2AQrTG+xRd4KugZhkYnBUmJIlaj1OcVxRUBHXAGt2ZWM1gEWB2iHjEoOeQK7oW2
	Iq3Gvkbtfc9ACL+CybP9ggCxY9w8rTnraVktxFy7RxpiT/jrB42rOKvO+AEahOSNUmVhRABPumP
	wJN2jYUku32QdsCZkoDY2EQXgdY+MW3o2d8ubMgjJBqLxCSXKBwKNfh0Ze1GiEyO3K/AVBRoUag
	eA5KUjdutoUzjFq9R3wz2LC3jkSUooPFVaKpB3lX0o9NkksFWNkrNmESAZkOlZm/0wa/J2d/8yB
	UDLA==
X-Google-Smtp-Source: AGHT+IEGE6avTfBkjA8INCLKTI3ci2q6/oIgSskbYT8StU/pdcBrZWZ4TnjvkYu27HZmXTq95uOT6HK4KzB5
X-Received: by 2002:a17:902:e784:b0:24b:270e:56c7 with SMTP id d9443c01a7336-290272155cdmr122007465ad.7.1760044848610;
        Thu, 09 Oct 2025 14:20:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-29034f81fb2sm3067085ad.69.2025.10.09.14.20.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Oct 2025 14:20:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-859df490f9dso251619385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760044847; x=1760649647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pC7vKNtvxXJSB4veOOQwTeA6v2wJSbqIf9D6+uJhGQ=;
        b=HP1t8lEiMB1zbOwYRTVv+HDNdd0ljnG+U9Wu4/gVu8rrQA0GtoSnHn5mSjV1woMuc5
         uRsZaVTgZzwp3HMwGpyaK7DQwaoXY8CKIz0CZLYjlBAGrzRoGVjJAUTQyrPL4OF4p57N
         X0+PU2GFzw0pOAgtE2Ua4g3lmi1CurXp/KGYc=
X-Forwarded-Encrypted: i=1; AJvYcCVw8rDF5a7XAWEO/upl/8UdqiC/+fHimlMOeVFjqi0NEE5KBuwlAunM6v8kLJu5KEdlvkXslFIyslfwFFg0ySt3@lists.infradead.org
X-Received: by 2002:a05:620a:711a:b0:7e9:f81f:cead with SMTP id af79cd13be357-88356de6853mr1368994985a.71.1760044847474;
        Thu, 09 Oct 2025 14:20:47 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:7e9:f81f:cead with SMTP id af79cd13be357-88356de6853mr1368989785a.71.1760044846973;
        Thu, 09 Oct 2025 14:20:46 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ae428sm274832685a.16.2025.10.09.14.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:20:46 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v3 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Thu,  9 Oct 2025 17:20:03 -0400
Message-Id: <20251009212003.2714447-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
References: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_142049_436083_15879F74 
X-CRM114-Status: GOOD (  11.50  )
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
index 97d958c945e4..21b78f468169 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4972,6 +4972,14 @@ S:	Supported
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


