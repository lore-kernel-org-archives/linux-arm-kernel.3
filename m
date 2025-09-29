Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085ADCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=; b=lblnKhGw2jOC61jr7TlSn6CHJ3
	9YFyhTbTIn+gtG5JU1tlBoXhj480gaobDwpeS8doinTbheAf+odHxJ5dpu4T1fY8EfvNJVoTJyu9J
	aGHYXgprNT2shitBsnorK8SzLKYmLGZBXxZIKaoj/atnuQyOy6uYMOGULe1sZDGPzt6GVLrPLNsZi
	eOMUGq2Nunevz4fNSOS4lNU0L7IVOrNXyXRVjKXiw+9j3kEderaq7t8tN9JwewU9h34g1mjUurAxw
	ML8Px2owr35XX0QZivSNraH9fMuzwMhCyJQ2hoD2292+ExMtrzFSJGpqI1NIAKj8D7WdrTbLop7C1
	u8223v/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K9H-00000003PuL-4Atn;
	Mon, 29 Sep 2025 20:07:03 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K9F-00000003Ptm-1280
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 20:07:02 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-27eceb38eb1so62095315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176420; x=1759781220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=UXN4/roOx5EUQkTtQ+DOiUqZ1ixMBmzYB0gZ+Wda9HXwfUqCVEs+9ZD5EoGbcjCRJy
         RIsXrd1DfbGeWUs4kcOruZbOhipICeSXnhM3TnS4UbasqAPFrKl/EMQfnQzgjOF37YqZ
         s5zIF3W2t5/PaYJwezmygmsqI2O/Y+GG4Rll2+8z6b9V34hGelcHnPFhfJrBJVNDGWYr
         TbeIvL2TtfeTvdH/066u2INO6Mm6vhbVRazDKOgfCc0OjmUI1JTVGrkBMJyn3c3coICW
         Deza8MEWS2WaktY7W5zfAHugg53uZEwP1zchJ2uToffdyzaIB3CaGTVUE2f3E0bPfTrA
         ERQw==
X-Forwarded-Encrypted: i=1; AJvYcCVjBu84MBMpOd5VL7eFfwnYA4ojafej0iZm6RQujgcxb0iv7st2wd7KVouUQRyMXDhx/wOwzlsZNzYPRcCaEs00@lists.infradead.org
X-Gm-Message-State: AOJu0YyVicD9841LAcYl+7YY9X8GnHpCerbAJEKmLIBIQas6IWWDnLlI
	AfvdyImzX2fcUsfrwDhjzDKaNjDV8wM0UNOCIKz2KsdQ09zVfGg5IbQeFVz0OQB9FYPBQGABlKd
	VHQMSOKnVsZawaWuTBwsToUy/DWgn7kgHNqoXNNoD6zDl7exVLHWSMaHesjdOO3hanuvj/QyUS/
	p45bQMx1k96+1sF5T91C64SeGZ7ggi+dPyxjKCDoGDrVaStcrAHVr5LSgIuzS6WfRJqDyE+Z2yx
	MDmS+aFz5LICIWcXxxHgC9fdlk=
X-Gm-Gg: ASbGnctA10bUzirWy/pmoDhUHJjEkLpR6avhzlnuTE3A2GIBY2kxxDlEir1ikLG2LrU
	Sl+izSFWdvRTZwDv9NZozYwPw/yKsBURbX64gSt4Fb1WGMzFaiB6vZagfuSHpEk1Zl1tId/agb4
	NxmJBSL7gtQCYolL6o/dM+7PbQz90V9FSHIx9m1BPGr2EsKxvkVS29S08l6LhQhQ3imJtlfTpMt
	QY2Qj06kR4t7QSzyoCXeKnm2afUuwZOFVH9evYQYR4rEi2iUoizcEQPksTy50RQplNrcMNOeR/f
	eKYQxw1ORp8AOULuSUrEtzcD6RyMCwfR5MLAvpnyWgQimcHBkPWm3JKi1yDB8wDOJKUR5lIo4oX
	IZfTQ1XrWURT4//hJrNdi
X-Google-Smtp-Source: AGHT+IH7LNf3NMsH8aSk5qfYVTX4A/54Z9ExdbMVRk2iT163PnRh00A5p3jPIaGe4ubaGZ36ZyCzD2HsTEB+
X-Received: by 2002:a17:902:d54a:b0:283:c950:a783 with SMTP id d9443c01a7336-283c96f3137mr90124875ad.56.1759176420277;
        Mon, 29 Sep 2025 13:07:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-27ed67e6700sm10641715ad.42.2025.09.29.13.06.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:07:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-336b646768eso3236393a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176418; x=1759781218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=BXNub+w/dopMyWrHT3Sr/XZ0AmJGNvreDSEb8jHJWhrqKDQwfVCojZ/fbPnlskzpcW
         fNuswRnROQpKkHid7UOpRexDjISCDLnxftyv1XyjJRuhvkbf3ETH57xuR5Ce2peiaR43
         OIG7opYPca+zo0oVLMwziIxzKHQz3oh8e1png=
X-Forwarded-Encrypted: i=1; AJvYcCU1ctRMbjsGy77tmuTJaYuJpMJNPLj0stlxHXBdv3eNO3vEZ8JEp0JAuo4CFw7toGwhhWAkkP5sX7xqB8Wn37sf@lists.infradead.org
X-Received: by 2002:a17:90b:1d06:b0:336:9e78:c4c1 with SMTP id 98e67ed59e1d1-3369e78d5c6mr11368277a91.15.1759176418531;
        Mon, 29 Sep 2025 13:06:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1d06:b0:336:9e78:c4c1 with SMTP id 98e67ed59e1d1-3369e78d5c6mr11368259a91.15.1759176418122;
        Mon, 29 Sep 2025 13:06:58 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:06:57 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
Date: Mon, 29 Sep 2025 16:06:24 -0400
Message-Id: <20250929200628.3699525-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_130701_287022_DFDBFAE2 
X-CRM114-Status: GOOD (  13.26  )
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

Adding brcmstb-hwspinlock bindings.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
new file mode 100644
index 000000000000..f45399b4fe0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom settop Hardware Spinlock
+
+maintainers:
+  - Kamal Dasu <kamal.dasu@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,brcmstb-hwspinlock
+
+  "#hwlock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#hwlock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwlock@8404038 {
+        compatible = "brcm,brcmstb-hwspinlock";
+        reg = <0x8404038 0x40>;
+        #hwlock-cells = <1>;
+    };
+
-- 
2.34.1


