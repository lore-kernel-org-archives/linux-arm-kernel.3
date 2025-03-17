Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569BCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=POAt9Pl6v+5VOwi53a8XwCwJ6f8Q2+wA88xSDSYqCd0=; b=t0SG1KAjkMaxSKiy99u1Nn6Aok
	um148Rsg4axSJYYHdHwSWYiRxMuOSwTkfd7za4XBryXpAbJZUtvsGjOHwozwoi9XCKvol3O+AIYuM
	exVbfnPCQ94nHQkTFlK23n9TXsJyDWegNXywGtB5S3TKr5kDvc/TowVaN0S3R/Eh7TEQn2lVpItDp
	CqNAxnnjZBXUvwe/KDdtOPjEegmuZtaNY1QnAbmSm7N7wvEFzoc92JAzsHd9dbvKTEM61P8qGEwsE
	ZSBpyd/mBv+3lj7rFLufiDnyErbiOV6qtpS5AeLS8xb+ZPUK8LXnpbZjCPXICL85GyIih8RZ2sfUT
	xLkpJ41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFAz-00000003gyq-23w2;
	Mon, 17 Mar 2025 18:27:01 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF9H-00000003gsn-49bR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:25:17 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-224019ad9edso39669575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742235915; x=1742840715; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=POAt9Pl6v+5VOwi53a8XwCwJ6f8Q2+wA88xSDSYqCd0=;
        b=gBw6Xlep5DXi0nXqZnU5CsX0PCJkf1KXy3LHMILWX0+cgrGEDCRjBDaHJ0VqgKZ7VQ
         6apOc4E+u3tKSBPx3LAvt1domIpo0yfjzzPQwLL9mIExcdUWKLp82mUHaPwgb2cRe5av
         6OqXCh5AJItQ9Zk6kRs8MqtpKUbON2Wa+MXUh8viJEP0Fbnn7b0hbX64vEV4U6mCWBq/
         Oue+XDwBIchYzwJRHcUlsGZU3x9C+oVyGIdcL/55f/70vlWfrg95ysxewVhMJfsYpkD8
         RCoQ06hCAQuADaZO0p9v/Y35h6fCSvP9hwTc79ej+JVsVTeAp48KpIfrPnVoaWw1/Fgl
         MEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235915; x=1742840715;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POAt9Pl6v+5VOwi53a8XwCwJ6f8Q2+wA88xSDSYqCd0=;
        b=ILSqb32k7FceTp/My69i/fVoikKP1oFBFexwSCIyKe6RE/NgFuXb7tf5ZrL74XEYGm
         hLTPwmHcbrxm6o+/gJVk5XCRg+yWg3Cc0Dirbu2o3aYrPoqNTsJkaaoAzHAPW7GbqNWD
         IZF7YdaQuP9YpU/CSE/dyT5YkeTgokT35nqRRBwUzxmQEcoThH6wZgXM4vPTSFqdAn33
         TG/SVu7bMmrxFy5Eg6u5oDQ1fi2rqdbtvTDJ14Bthzin3n3YtLdqzwPez756LZHPYOAz
         VJa/RqsmsXTa2ANa4yDMW04sVC+hNGso9ZsKVrL1u6g6u/uZfxctRbw/uLRl9R7dToFu
         oa1A==
X-Forwarded-Encrypted: i=1; AJvYcCX3frW7e7WSUfxhEZ3urBzovFwAyNAaa4sREwVnpSiPDvUzSUX0V2RNyreu+kbK4QJXRx+Fxm6mR4Z84RK56be8@lists.infradead.org
X-Gm-Message-State: AOJu0YxjkHR/1LEVlH87awzqRN8DlNSJF8+l9TmOVm0oka6WclnQoOaM
	AB/qAVKlLNmKmUlk9xD6E/TQ+T91qYp5fk7ER2rHiHkJEZhDQinTwe6VXjZGoHo=
X-Gm-Gg: ASbGncs9uy9lIFHaonl3A9Bmu7tk38Zu3C+Z0JGYtcpZTcZ/Cptt0qZpPuWEcETkj4k
	HQpRqzU3XJmw4ZBo5xJZZpsERmP6k2i0aEboSYqLIj9iHnCCl789HtqJ3rInfzJFSaONK0WQWAW
	L22IJEw5gISC4wFqtpbH6eOR7d0iMABZpzPSi/mzMw+yoDP45qT5rU7FolLyexI/1QWhWpIkQUu
	M3sFMVanxaDRMHClnXxwK3/xEQSoMAkRU5V+zj+FYBdjmklqSRO8OWZxtN/Pjxb4MopJk+B023K
	tB3XIvIhfs35It9uuRti63EXs2USl6DGABtrKgWvtFM=
X-Google-Smtp-Source: AGHT+IE+WFZbIbKZVR1Ierd5Hw06H1qgwrQdddFAnectjHJowyBTGk1xMScRIVqNGcKVFoQUH+RMIQ==
X-Received: by 2002:a17:902:c952:b0:223:6744:bfb9 with SMTP id d9443c01a7336-2262c5ee786mr6788795ad.41.1742235914800;
        Mon, 17 Mar 2025 11:25:14 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a407asm78970415ad.62.2025.03.17.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:25:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: misc. OMAP updates for v6.15
Date: Mon, 17 Mar 2025 11:25:14 -0700
Message-ID: <7hiko7qzud.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_112516_224821_02FA6722 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/dt-signed

for you to fetch changes up to ea07a4775df03852c353514b5b7646a17bd425be:

  ARM: dts: omap4-panda-a4: Add missing model and compatible properties (2025-02-05 16:26:34 -0800)

----------------------------------------------------------------
ARM: dts: misc. OMAP updates for v6.15

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: ti/omap: omap4-serial: fix interrupts syntax

Krzysztof Kozlowski (1):
      ARM: dts: ti: omap: Align GPIO hog name with bindings

Tom Rini (2):
      dt-bindings: omap: Add TI Pandaboard A4 variant
      ARM: dts: omap4-panda-a4: Add missing model and compatible properties

 Documentation/devicetree/bindings/arm/ti/omap.yaml        | 7 +++++++
 arch/arm/boot/dts/ti/omap/omap3-evm-processor-common.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                   | 8 ++++----
 arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts              | 5 +++++
 4 files changed, 17 insertions(+), 5 deletions(-)

