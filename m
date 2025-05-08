Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C01BC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 05:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+objnduDEdA6XgtoHIMnhtVVZlrAlpTMhfHb5uGFsAo=; b=ktCdWaUls9X5weQE679d8QtShB
	rkeIIWx5wzPl5u6g8vlcWysDwU84BaNy2z0528vcX6rdhYrOH7q5isoxvK5DsEwjYde4V6v0nbjR8
	YizpgtyC24DJYzbdX8vzsqGhyGGUv833o77luAjU70iXcSs29klg8rn/O/ogei1SaQutcACW3ANp3
	SfPPajKMu3Hf9u17a2UaQawfPtPI4uv5rD+FBj7O7nNH8chfIcST1UADsFWhNNoTEV+gbJ0gntqMA
	t7FSH8kWX3qI2FJG8gC40/Si+kT4Cvct1724h8AdHYF6JxOQh2g+ki5ZV3+Msx1z6hY6feDJCMOWJ
	l4vVdFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtZo-0000000HLZV-1ggE;
	Thu, 08 May 2025 05:13:44 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtXp-0000000HLML-2bfm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 05:11:42 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30c1a269a12so296097a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746681100; x=1747285900; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+objnduDEdA6XgtoHIMnhtVVZlrAlpTMhfHb5uGFsAo=;
        b=t3/myEYZjwgLa5KVmQ5u+azSNkC250dqDz5Ebvjk9XieeVdGbOMx58LYw6Xbvx5Zmn
         p6GsJFwSfb2bmb9/lm6Chu7q2OVnj9B31IRpxx+FlNPl5ZRugSh8VjVKCB4TckFnQvsO
         ZLxtm3rxwfcvvMT+7mxIdytBnSXrB/09tFeqDBMY5Ntln0chYfRF1fB2Xrr3gTI0dGyX
         jtvH0S/U8uutF61RcsmHB2YO6N65OQjjAsGMhXMaTZHWrCpq6tXHzBrDvRT6Fc5n1Vnk
         HcUD3u/7dt3e8PRAQ57ELtlKuGCtdrDmwTHaSNUhcE724UCYcn37gcweeNLn8Q++Svgx
         qUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746681100; x=1747285900;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+objnduDEdA6XgtoHIMnhtVVZlrAlpTMhfHb5uGFsAo=;
        b=wiUEdxifpZaGAMucn7mc99VWCM5ewTemz6/9T/AFMMrOD1BYzUxOZ1kGB3WGh6cG3i
         kwQ3IAImbB5Snb/zkRDngIvT2aCDUMUoJzxlNed17LpkLASzW/S7Et/eDYX0plAh4PKK
         WY6wvYCy54QU/xuUbTRnDzDvJVvX5v/R+bjjl4v+fXc0uyYOinirRdHxucPoTft8PvTG
         YJ3Wtb7lBmcMFZr8Ml4NSzCFjPgdGy/FNbH1a0JYyrjBZXAxz51S9Ix/g+JDpnCXjUdW
         UED2Pee6vTtdWuAln2P/aJmTMLJ+HOnEQOjCkGEtdS6TnO+oXsPVACg6Y3aTJ6zq2446
         hwrw==
X-Forwarded-Encrypted: i=1; AJvYcCXjr5Ie+SjG2OfrbNI2kGOprVLQLQ0YkdDtdWe1lou4FJrEIkQqaUR1KGuJaEfpQg5i4e5P5V/cUd+d1tj3GNff@lists.infradead.org
X-Gm-Message-State: AOJu0YzRBk9hrenR1lVRXCNszW0uHTMUOZytIXY23XSD9jdrwsw3oPeU
	NcaGjLz11+Au4nQLienlOQhzCIjKE9Z11bZ4jk9PPuBk0qRSlWzJ7oMdmJuwS8d/QzphtQmyO0C
	qNw==
X-Google-Smtp-Source: AGHT+IGGonQAPWDxdBzLe2Ueqgy+uFD50vWf7E5zkm1R2s+R8YnCic3HHOe1DuE+B2Hm8cJPIF79XW+rfBQ=
X-Received: from pjj15.prod.google.com ([2002:a17:90b:554f:b0:2ef:95f4:4619])
 (user=amitsd job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a89:b0:309:fd87:820e
 with SMTP id 98e67ed59e1d1-30b3a6d7b70mr2372936a91.26.1746681100133; Wed, 07
 May 2025 22:11:40 -0700 (PDT)
Date: Wed,  7 May 2025 22:08:50 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508050856.674782-1-amitsd@google.com>
Subject: [PATCH v1 0/2] Add graph connections between tcpc & fg for Pixel 6
From: Amit Sunil Dhamne <amitsd@google.com>
To: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.griffin@linaro.org
Cc: andre.draszik@linaro.org, badhri@google.com, tudor.ambarus@linaro.org, 
	alim.akhtar@samsung.com, dima.fedrau@gmail.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_221141_677829_2FE19B61 
X-CRM114-Status: UNSURE (   7.60  )
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

max77759 Type-C controller supplies VBUS into & out of (depending on the
charging mode) the battery in Pixel 6. In order to represent this
relationship, we use graph to connect tcpc & fuel gauge.

Link to USB connector binding that this patchset uses:
 - https://lore.kernel.org/all/20250507-batt_ops-v2-1-8d06130bffe6@google.com/

This patchset depends on the following:
 - https://lore.kernel.org/all/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/

Amit Sunil Dhamne (2):
  dt-bindings: power: supply: max17201: add port property
  arm64: dts: exynos: gs101-pixel-common: add graph property to connect
    tcpc & fg

 .../bindings/power/supply/maxim,max17201.yaml      |  5 +++++
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 14 ++++++++++++++
 2 files changed, 19 insertions(+)


base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
prerequisite-patch-id: 74aa0a6fc4a5c56d870bb15375fad1fe41ffc1e9
prerequisite-patch-id: 46f968300dcf5442e12d882ca23168494249d378
prerequisite-patch-id: 3ad83a2782819bca215bb267d36a1ff04fe557b2
prerequisite-patch-id: 86b5207d8f44255c36b1e600ecdf4f948c5da685
prerequisite-patch-id: a15532888ff2572696d9fa6a14775e8ebf590391
-- 
2.49.0.987.g0cc8ee98dc-goog


