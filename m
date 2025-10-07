Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D466DCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Px5PBDWoNSxvQicSvlQGDgd/7ifZnaEp1y0M1jncvfs=; b=jG9R/YIlacJHxNLD4pD/qrduGh
	BdSpv7j3twnx81eD3PrRTmxY7cfw20z1tZY1MJ067zrK0HkEASJA3uSkSldOPVbn4fmsvD9i6by+v
	UPr1e98zvircCqbzecvz7NYoLiT0VzzISbM1pca/dqTx9lm7crNQd7ZABxd9SJVlG/bRIfdxQ8NAf
	70ecVvUxcHvKRSuvw5PR4pa9I1AL4smPJG4aPaPiUbaxJYewN96p+7eKsyUpiVQaORIpfW209ikki
	0x91EF/1XlQPkV8OrnWUgmzvcffPNZ99QOAFjq9pNhRL5gk3zEYadvuIQb28iCUh/vK33cW5LAAg4
	PZR3IXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68JE-0000000283J-2cAF;
	Tue, 07 Oct 2025 14:04:56 +0000
Received: from mail-io1-xd63.google.com ([2607:f8b0:4864:20::d63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68JB-0000000282W-3Dm5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:04:55 +0000
Received: by mail-io1-xd63.google.com with SMTP id ca18e2360f4ac-912d4135379so249070539f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845893; x=1760450693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Px5PBDWoNSxvQicSvlQGDgd/7ifZnaEp1y0M1jncvfs=;
        b=kVsbVUFLqYWxuT7ApwkSfmPJpi7ids5rSwyWrdibcoAbb37W52qG0crJMbFfExyOUW
         ErjHHvCfMcd0J0rM1z1mXeiEMgBToTfM60qjxMGYnjQtBEiRzYaPEdki83XSZjpzxo2p
         UkviCPAejFMlQ41nk1oFXxbHya91PRQyMXwAYUGsetsr098Lx3on1WR0i4oKhZxRGkDQ
         5bWgzyUomPde5bzfnrzayGkeTYPXcxTM20RDHBwEHjZ6llGkC8vlrX1ymWWMxhVR449R
         P4PfNcZLobnjq5UT8R4rGX5KM/suI2xa76+jL980fVQDYy7dTYBDq1/gUqz6IWCTEB5R
         sw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWguHLDf7Er82xwS/OwOcLlRDD4eY1na4BD6U7H7isAVXTl1RirC80RBIe1lvvFp0KgTLklTsOLJGE+y7hBAxh8@lists.infradead.org
X-Gm-Message-State: AOJu0YzykpicZrEezo8F0TMp9dtNLr01e+EsloCbTwVKSCBxZW9GzXV1
	lKvU2XLtbRJ3SQoGaYkWW3AiitBeAlSJpK3JE9Upw0kj0Zwc+nXT94af0NJeLQ7UUDfx/DPgRXL
	jrpH5HUS3bDFVRWfDOS+TcDNKpkjWOe+ak34SYns8HekuH4hUjsz9ZWCz5cxjyuM37QY3FFR9GC
	diYa23RnHAPGnuIE1s0czhMVlEEKcKqAi9U2RgTX5dHIiwyjA1dfGVF0SIrX2jC4/Cbr/Z9poQD
	LxHkL4M2SkqqBydZRAfrO9I0Ig=
X-Gm-Gg: ASbGncvjNZqoDvR6ANm2fBe0/3e1ruowLo5QfMRLZRkgFFXbOj6SScw+q6nertJOduo
	evKeAdLjXSMTEVaRrvPBxUONhEyopmVgkcSOfmKwgDyofpHuDTA1qVRbGRqLWBYEKjF+CHB//Nt
	4ZJ0YsUiuS2VNOiwB48yXrJqfnOPVM+CXh8l2mUQa1hEdubR4pX0kvYnhs/1dw99Zb3gYLqlITC
	eUh3wveCgMZbu+lcxXhM33PnTn4AMZM1DqH76fNEb/I9gmvOCbxZrK0SawNqB4vZ+qm6+6567Kh
	sYco/3OY+Mr6sGFxhnPe5BECLc1S32i/aneg6+OMrtVeuvPNrPBTq3qxhXesKI6NEl0u2YCHo1p
	k9rGqeUtC5Uv2LElqdhnWZaRCJg2+f3D3CytZiOPFfLkFp0ivRcl0b5sKCfN2nCcoTBqv4B+wvk
	1OwoX+
X-Google-Smtp-Source: AGHT+IGL2grhm5PltfXMc+1EQJ9bHu8RVcB6NeNYGxJLKFh6oVTtNf4bF2ICKdVrXbylU5W3LL4EYsNAaKcJ
X-Received: by 2002:a05:6e02:461a:b0:42f:806b:c126 with SMTP id e9e14a558f8ab-42f806bc589mr27129145ab.25.1759845892284;
        Tue, 07 Oct 2025 07:04:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-42d8b20f492sm12749055ab.10.2025.10.07.07.04.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:04:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78e831e5a42so181056926d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759845891; x=1760450691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px5PBDWoNSxvQicSvlQGDgd/7ifZnaEp1y0M1jncvfs=;
        b=c0J0BSFZa7Mx5P0Qc4D6sAV7Ceu54pipibJQvZfoaTFcoCw87KKy95qKX/swdZFx1J
         gI0WyKkQKqSsdjBpB7m00hwz9sWA5tqe36irsTPa1/SajgTjGMgz2vpV82wF2JmO2/WX
         eJvk1zG7biTU3ilThMqgvCbINMyqCnbO3tqeM=
X-Forwarded-Encrypted: i=1; AJvYcCVOjNFrTTOLx4K+8T3rlJzKuXoexQ+b6CrKtiYBMFNZA3nSLCkChgcasB9peqAroz6WwJ0YTinpJNZjABjgkU1l@lists.infradead.org
X-Received: by 2002:a05:6214:f6d:b0:792:61c0:beb0 with SMTP id 6a1803df08f44-879dc87f7c2mr226139076d6.67.1759845891174;
        Tue, 07 Oct 2025 07:04:51 -0700 (PDT)
X-Received: by 2002:a05:6214:f6d:b0:792:61c0:beb0 with SMTP id 6a1803df08f44-879dc87f7c2mr226137866d6.67.1759845890256;
        Tue, 07 Oct 2025 07:04:50 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bae60b67sm142718956d6.9.2025.10.07.07.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:04:49 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: mmc: Add support for BCM72116 and BCM74371 SD host controller
Date: Tue,  7 Oct 2025 10:04:29 -0400
Message-Id: <20251007140434.606051-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007140434.606051-1-kamal.dasu@broadcom.com>
References: <20251007140434.606051-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_070453_808158_DC15656E 
X-CRM114-Status: GOOD (  11.07  )
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

Updating compatibility to support BCM72116 and BCM74371 SD host controller
similar to other settop SoCs.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..720d0762078f 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -21,9 +21,11 @@ properties:
       - items:
           - enum:
               - brcm,bcm2712-sdhci
+              - brcm,bcm72116-sdhci
               - brcm,bcm74165b0-sdhci
               - brcm,bcm7445-sdhci
               - brcm,bcm7425-sdhci
+              - brcm,bcm74371-sdhci
           - const: brcm,sdhci-brcmstb
 
   reg:
-- 
2.34.1


