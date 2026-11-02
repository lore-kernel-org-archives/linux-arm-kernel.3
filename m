Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F57606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r9YmA6q3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JPtBKN9/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=; b=r9YmA6q32KrH3v8u/M+BNxxRtj
	fumvWmyFAF3+YiOSimkyD5SRosQ2uShBzY0+xLcOKBTphgeAM2KKLgPt93EUWrGxiVj84Fo8N84hx
	Jt1gvN9Leu7S0GNhA9VjWV8naFbt6Qo39AECGdNaj+CTztNr0P9nBNq7BJYRG6vFO65wJ8Pzmg8yq
	uzJ5jOZKQgGvaSGNNyNyhPUJY/Fg7r+aVo6SO73jmaaHHfU6lAc3McQPBkL9lOfdBP0UwLBJBO73b
	o/681GhpG7j0FxhU/McxvVj0Zrflr9lShRhbrTJ1D+F2pbNeOLV0PeZNAsvNroeKJa0GQvQx/4wA1
	Mt7uqNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0k-0000000FvWo-2HxF;
	Mon, 02 Nov 2026 09:07:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0i-0000000FvUr-1h0O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so23342385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610440; x=1794215240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=;
        b=JPtBKN9/fMv4IIwx622G1o7NcSBLSWTnGrdizhbFgWQomB+bYWN7B0JdT5cdTmpwnT
         08DKcBsfsPe9NWDRVBmArlt/RaC4JtfNkKZQfeSbMcJRxr5g7ph1qftjsp2rVtIqRSuc
         ePvUhEdclIOh/jP9Ln3LbojAHkNU7SBtgsoJzyptBeBkIOkoVGOEFkOftVCC3MoPBlxp
         IlGGCUjDsHl2t4y9LFqLe4W/JlLQ/4GvHeGwpfTYsLNPV6rzDa/C/CXXBr5hR4uPaMAp
         ow5hp3BY5SNv6ix1fe0Y3G1bzv/6fenzYc9Tkwotmq5Yod1QCJKClBbZTUomwJtBDDnI
         UCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610440; x=1794215240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=;
        b=Zo6Ua8dBS6cuGlo02f+S8Rr5ASru0qu6OysGEtngw5NeBUEBLbQOhs/INcy/poWQEl
         6yG6uSl7GGEaASdtzxYuXusz+3HxMNWmrEtcEbIhYTpmyoT/0Q2buNAZTIfaQ9Qpe9cG
         J/csFZozCMbeB98PiDahX10aTng1mknf6trdjI6ZwuN5Kn01+Ah+46smEcbYJR7/mwzf
         N3AfigDxL9/aoFkGDSRtHFmRCGSWc7ZmEqM+6iimz7gThABcQFXQfi1wAZ9rb4oAcWJ6
         zjvstjeTQscCGtDNUf31Wbf/4zdHG4p6XB9vIluEsSzFj5xXeV5/N6+U3G1mHx5cu2sE
         /yGA==
X-Forwarded-Encrypted: i=1; AKwUvBwggf84yoPRnmoPD4sthoo/TsE7jGn0jwu+dBLHLsVtqREjXD8WcWAy8cQ18YeM7y7PfhTW59C/l1C7+rBDIBvQ@lists.infradead.org
X-Gm-Message-State: AFq9FYK/dubSa+3We3J5IpiDarxLuDi9W4PXrtTKrAQw0UvEOzSViueC
	iNfOCxFJEQv7cbbMBhiV0mQNttvTp/f+MP++xcm4ysaxehjftyZACuGv
X-Gm-Gg: AYBFou0iibA8kB01HHTK8FWwvgjwqx54+Rj0OdYqi/V2MBtiXFKpzYSKn1bkExQ/V5O
	0ZHKaTvt9+kNjPfbv/1D+MQ2FC9uD1H1pJgCpa30M7X6+igt98/oWbwChgH34ChXpiFJIjkuiVB
	sj0AwjGeG0ZX5bdweMkiBfUDzlkgA57FMHpReFqggHlllPmipnibdJWoqBR9ITgj3ByHvqnBfzk
	eKYp1hetGrRYA3KeO6+BL/7RbdqvZozOGY7shXgH9PD2sFniIQv4sxmCikwtleuST5CHFtc7V59
	lL9sIh0udWH/WF1UQgxcyWt5m89EZZMS8LZoy4qCRDCmbURUW3L0EoNFDvqxB6AjcqHxc0UJtVx
	qPltxbL9iqoPEVjFrbKOB5gyKvUJfe+ud06Miabw1peugIVwVuX/iWs0b4jIGBIXgHS0eLt3aP2
	7tI/ueYjWxZXF6bUe8cCtJSEpt6mvChZvZTtlJjcULPmi+MeIBbK77QZNMGd0dwxVBxrrvhkU8m
	peHbSKG5hIJj/U0coU7v1Bzv9eHR2P9qRrr2VY6fGKZJurEnO4LlxW4Z46FQoMvfnUIBsufPEY/
	MSKkeAaSojiUDoeD2nivE3OQs7+7gh+qJQ7FX0uJYAeOZgmj8MjE3rbPL0wV+F9g78+hY8kfauj
	aTiXIcX6fSayLDpteEov7R0RkJ4qOUNlX+p2benOoMmr/mJ1ZNSSaT08Oq/31n9jgvOlceGAfn+
	9yN/VbRtrVjdJN
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ac182dbb5emr203556405e9.33.1793610440331;
        Mon, 02 Nov 2026 01:07:20 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:19 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
Date: Mon,  2 Nov 2026 09:06:50 +0000
Message-ID: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010724_464929_308EC451 
X-CRM114-Status: GOOD (  14.23  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
that support 40-bit DMA4 channels so add support so this works upstream.

The first patch updates the bindings, them patches 2-5 do some
refactoring and add the support for the newer SoCs.

Finally patches 6 and 7 add the nodes to the base device tree and
patches 8 and 9 enable it and configure HDMI audio to use them as
per the down stream device trees.

The series was assisted considerably by Claude Opus 5.5 based on the
various downstream Raspberry Pi patches and tested on a number of
RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
and dtbs_check pass clean.

Peter Robinson (9):
  dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
  dmaengine: bcm2835: Refactor control block handling
  dmaengine: bcm2835: Support controllers split across several nodes
  dmaengine: bcm2835: Add BCM2711 40-bit channel support
  dmaengine: bcm2835: Add BCM2712 support
  ARM: dts: bcm2711: Add 40-bit DMA controller
  ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
  arm64: dts: broadcom: bcm2712: Add DMA controllers
  arm64: dts: broadcom: bcm2712-rpi-5-b: Enable HDMI audio

 .../bindings/dma/brcm,bcm2835-dma.yaml        |  31 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |   8 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi       |  16 +
 .../boot/dts/broadcom/bcm2712-d-rpi-5-b.dts   |   8 +
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  10 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  40 ++
 drivers/dma/bcm2835-dma.c                     | 496 +++++++++++++++---
 7 files changed, 534 insertions(+), 75 deletions(-)

-- 
2.56.0


