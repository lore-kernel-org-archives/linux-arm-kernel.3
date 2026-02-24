Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB73EA4FD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U3dB7+eefW5Li2eyi5u+nXkNwMUEBPNrYMz+/+fKzj8=; b=gr0bYa35hDWY65enNOucI4vekq
	e4i8ZSj7FTeQjO0Fd9V0QT42gKoP/ulAH27i0q9jzgQ1xvqg4sIyZguQxgHgZ9OTMh4hPcFfG+G5j
	Y59e4i6tAslUjnzw8TiziUfTuFE7Bl+oETj+V+CSZ+WmurXRcuBzLg10McpLeVTqqnGLx3+46POr/
	1ObmuklXyb6pz/fVOMSs99LtC9qpBCRU8ow8Ct5fban4xKdhBejceqS8iL+MuiuudgWwjdROI0wkw
	gzC8gnCOUmSihVbZvPUetmZjuHwYkg2rueoYrfR7oDXsWbx4lE5UNwIeL9w8deRdAeYZDA0lRHOo3
	w7E+TXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhX7-00000001IyQ-3Cte;
	Tue, 24 Feb 2026 01:48:17 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhX5-00000001Iy1-2rZ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:48:17 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-c6e72d7a4d7so3184834a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897694; x=1772502494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3dB7+eefW5Li2eyi5u+nXkNwMUEBPNrYMz+/+fKzj8=;
        b=dQ4alCCG2kg+HKgTbsrxMQGqxFYB1lX8hRpdoD37jo2/5V0t/MCt4VVbBVgaWf28NY
         pO2sBiRpCvxLfoqr28nG4rWJFC+Yxb73tOumZCcYru8vlkTq06JI8ccgYbhTOzFz68yf
         Wv4/tGVz3QbqfyGKgi+f5Et0Fbw026fJOx+sbDFtcr5uqsYcP8gmGfl5mu4tCGZrJm3t
         HB5vWp41+YDFd8mp2uTqhYNI57XA+umIWgno09BUDpSqh2fRcjzMFFGw7VBxum2b8xbA
         Nk2tcx+41wDZ7F0xhV204q3Ni49uu164JgY/JY82oWnFiigNnppkazsjWcwYu95phTPS
         iTvA==
X-Forwarded-Encrypted: i=1; AJvYcCUc7B8GqLFi+4S8LcM2+I00GPn2a00U3pKt5Bm1ZnVXnXtUaRBrsI2R8y184hfnxVgl4RloNoLeM88luaPUr2mt@lists.infradead.org
X-Gm-Message-State: AOJu0YzPEGp3CmABqylEfwASnNOXueqiN/LYaVoLCowvmxxya5CTdone
	RgE8osxOy6h1PCl1v0VvcaF0g1WlyxkAjbCchnWygfZwpkj4Ef7jfXOZUwb5Y3TnmMw/9WjlLZo
	yUL0sbxVF528BiwyKjz/Ma20Izy+bbxNjhPK9i4ZSBg2veu0FTYzDiQ0C5ntxLjYOwPPgHTgQ1j
	qI1p22zwoB3tgzBX5CSuJp2WR3FqCfi/hRTCKVr+Di/HhUNjhyNdMLDCySb2QD0Yal5uazJq0ae
	OI/JWkmkLoYIv/RE7scuMsBr3E=
X-Gm-Gg: ATEYQzyLjMZVuJS2bTFhBPbTM4CF7LkBfAgjazCcqwzT3HdsiB8VzueMOv7J9CKzK2n
	HsLzpqheoWwzoVmY0L1Or0RwSKPIiim3HkVfHppaC9TeL0PXd8GVDswYv+ZOR6FDuyMbkzcqjSK
	0NSCHPVKea682V910ZPz9xmCiyvKoJkBYFmgzuVsLRl3+de7lTVTpErPWZ8fwSVblsns7QHHpoJ
	PCJG7t2lwboxOlXsBJNYhrOxXh3rwLqFGCxRBtTAxAYUp6XjVTt9vLvFJv5zwRpOHg9jbfWqqtp
	qlrnBsFz4GGBs5JNO4UxoNyt8psUnChHjw9Er83UORTh8WgklHXy1oHGVWvjm/deZQdGtLtbZwJ
	U05As/Gd/X1XHup+q85bDeNhIhpOR/J7Xr+QTfeWj1cezoTsEcJv5ewS5NAi8qq+5o9+E4BrDlP
	RQgO/R+/xaUtfgXIQMe4yNym/cMbrAim6TJcKJHbEtHHxQjwJFfOGp+H6O
X-Received: by 2002:a17:902:fc45:b0:2a7:d93a:a3b8 with SMTP id d9443c01a7336-2ad744d7dd8mr100450275ad.32.1771897693791;
        Mon, 23 Feb 2026 17:48:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ad74e03b5asm10597735ad.2.2026.02.23.17.48.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:48:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba87c0e198so3783176eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771897692; x=1772502492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3dB7+eefW5Li2eyi5u+nXkNwMUEBPNrYMz+/+fKzj8=;
        b=XoZJfvM/O4grI3g4tG5929SE1kfTSZFiHnMdCkgJt3q1PvXTiDMj2uhFJ2P1OS3Q/w
         hFmXvNbLE8flgBP4ZfQt781Eaidod+1+HsGZb4q5onXxjIsbmQBt6uhadv0VIHIL9b49
         tJMU5fgDitrEZktbwE4m6GuuiLKjsXn0Pv8VE=
X-Forwarded-Encrypted: i=1; AJvYcCXKAr+PrJgSW9b2qggs5B8D4hcxENxuOzanXw8BgVaeoBnww+zA+fRjnuONUBVLFGopFAGizsUR9F9D+iSnRIae@lists.infradead.org
X-Received: by 2002:a05:7300:6915:b0:2b8:26b8:3446 with SMTP id 5a478bee46e88-2bd7bae9e1bmr3940777eec.2.1771897692008;
        Mon, 23 Feb 2026 17:48:12 -0800 (PST)
X-Received: by 2002:a05:7300:6915:b0:2b8:26b8:3446 with SMTP id 5a478bee46e88-2bd7bae9e1bmr3940763eec.2.1771897691372;
        Mon, 23 Feb 2026 17:48:11 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af102d9sm8470964c88.1.2026.02.23.17.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:48:11 -0800 (PST)
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
Subject: [PATCH v5 0/3] Adding brcmstb-hwspinlock support
Date: Mon, 23 Feb 2026 20:47:55 -0500
Message-Id: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_174815_793330_7DCC3067 
X-CRM114-Status: GOOD (  14.14  )
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

This is a standalone patch for the hardware semaphore feature for
all brcmstb SoCs that have the same hardware semaphore registers.

The semaphore registers belong to the sundry hardware block. The
node describes only the semaphore register range carved out of the
larger sundry block address space.

The compatible string uses "brcm,bcm7038-sun-top-ctrl-semaphore"
based on the BCM7038 SoC.

The patch has been tested to work as builtin as well as a module.

v5 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Changed compatible to "brcm,bcm7038-sun-top-ctrl-semaphore"
   using the SoC.


v4 changes:
Addressed review comments from Krzysztof Kozlowski and Rob Herring:
 - Renamed compatible from "brcm,brcmstb-hwspinlock" to
   "brcm,brcmstb-sun-top-ctrl-semaphore" to use the hardware name
 - Added description block to the DT binding YAML explaining what
   the semaphore registers are and their relationship to the sundry
   block
 - Fixed typo in Kconfig "Setttop" -> "Settop"
 - Fixed email typo in MODULE_AUTHOR

v3 changes:
Added detailed explanation in the all commit messages as per review
comments
 - Added description of 'sundry' ip block that the hardware semaphore
   belongs to
 - Added reasoning for using common compatible string

v2 changes:
Addressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unnecessary platform_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Initial patch:
Link: https://github.com/intel-lab-lkp/linux/commits/
  Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-
  for-hwspinlock/20250712-034624
Link: https://lore.kernel.org/r/20250711154221.928164-
  4-kamal.dasu%40broadcom.com
  [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock: Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 11 ++-
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


