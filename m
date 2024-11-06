Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101CAD59F6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=git7RwFThytpqBRPQPjG3NYoVolRMqPNPDVZ2KDiULc=; b=P798/ukZwv5VdiThdV+RZsGWdN
	28YtDe3y2yq1deYNxQFcKWG9YTa1eRCsfvLg/stdCyuTJW7OE1TLYJiqEttF/HSTXpzfvyRHQ5Krc
	BLzrX2jzvCIpH3e3jaKS7/K+w1s+4GjXGoNVRLmksEAJ0Td4REWFS+mWbPVBR5GJr1zE60vhtFQQr
	uoVYCD1iYhGe4ejLSz0tdGIereGausM8bOhfz+b6mqycedEo4SltQZ0KelIk9jNwqkAQre7EsTYMH
	n2s3CHAsTenKyS0Irta3b8vWHKo6FUvy6Nqv4VWNYkxjHe8+5HGrerWy55mEfR9izGjdst+xzVHeV
	uhC0Lisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lN3-00000004SCK-3m2T;
	Wed, 06 Nov 2024 19:07:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lLI-00000004Rkv-1vEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:05:26 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9e8522c10bso25794966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 11:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730919922; x=1731524722; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=git7RwFThytpqBRPQPjG3NYoVolRMqPNPDVZ2KDiULc=;
        b=MZmDyBSR22D6Pv97aIoAuIlkgGXsOrO47YnkO6IqqcDQspuXErsync3o2H9pouGVBF
         2BAHum6z1DjCEZCDvZLrQFihqX1Dlhnb0fR6A0X2abr3i02KQ06/lTXijgPnesBTxXay
         ufgTbsUe7IL94y+hwyE/cK8l+fmqn612Y7xhvKqB57q2vyOy9M58E8Dv3+78k6rICDLB
         a0lCLIYNR8+ZxouDCsfs2fckGzi1tIsCHzLaC4mty3QT1o1qqqD3rnWpOqSwsTYezkkI
         MZN/Ox6QltQxV5hsAYNokZjxBibUMh4LjB9WPja/Wx4ecmahYwuEc/PtcE2zNALYxGdu
         OAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919922; x=1731524722;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=git7RwFThytpqBRPQPjG3NYoVolRMqPNPDVZ2KDiULc=;
        b=J+/BSZddko840LLFZWrZF02hoWDHH2oCUwtCjnxtOinfIlwwwSkJs9Y60OD/CEQFY0
         6MO/0t3wwQBp+g1EAvt4VZPOVtDudMJbvW5HzUr0uJp+5BMwqRH03HUgl7sB+BRDCj5o
         S0fbDu1ZMOw3LeOJk6nh5JQrj3rFU2Zptp3YR6CKez2TApCrcdWN6J2RQuI741CLUvnt
         BuQVbktdIVtUFQhwPPxp2cvRyGvU6s9uDnSdNnU8+LeKTIea85gasG8VC9FIu3881HCI
         RHtz9mye98vxjs6+MYqQ7QGcdMvWDIihW/5pC10OayDgCEbs4OpX2cWlha7nd1jRtULw
         fK9A==
X-Forwarded-Encrypted: i=1; AJvYcCVCrlKJJq17pN14+waFR6zkM7Ncg6JCddwCxDOAI/tpoLp+hoBfvNwK4wqUOyt3zh81jnqOt3M0WWF05eU8XM2o@lists.infradead.org
X-Gm-Message-State: AOJu0Yy94hExVydHNrls+DBen6XvC2HJnymZYdxFboa2sLZOT0exjV2P
	Huu4V1xAZBoPoSWbZi2MkN/BdA/xz8Yxd/l925P62a0/KS9SscFT
X-Google-Smtp-Source: AGHT+IGLfWHfvOwk4Ib9st26djdKrupvyFqM40x8jybcV9FDbvsNfHRBmNjr49ZmGYpdWJR61X1euA==
X-Received: by 2002:a17:907:a4b:b0:a9a:babb:b916 with SMTP id a640c23a62f3a-a9ed50fb64emr23526166b.15.1730919921834;
        Wed, 06 Nov 2024 11:05:21 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16aecbasm319207266b.32.2024.11.06.11.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 11:05:21 -0800 (PST)
Date: Wed, 6 Nov 2024 20:05:19 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Cleanup Spreadtrum/Unisoc ARM64 DT (part 2)
Message-ID: <cover.1730918663.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_110524_522118_F73454EC 
X-CRM114-Status: GOOD (  10.44  )
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

This series continues cleaning up various issues with the Spreadtrum/Unisoc
ARM64 DeviceTrees.

Changes in V2:
- dropped original patch 2, as it was split off into its own series [1]
- new patches 2, 4 and 5 which fix some issues found by Rob's bot
  and/or CHECK_DTBS=y
- rebase on next-20241106

[1] https://lore.kernel.org/lkml/cover.1730720720.git.stano.jakubek@gmail.com/

Link to V1: https://lore.kernel.org/lkml/cover.1723716331.git.stano.jakubek@gmail.com/

Stanislav Jakubek (5):
  arm64: dts: sprd: sp9860g-1h10: fix
    constant-charge-voltage-max-microvolt property
  arm64: dts: sprd: sp9860g-1h10: fix
    factory-internal-resistance-micro-ohms property
  arm64: dts: sprd: sc2731: move fuel-gauge monitored-battery to device
    DTS
  arm64: dts: sprd: sc9863a: fix in-ports property
  arm64: dts: sprd: sc9863a: reorder clocks, clock-names per bindings

 arch/arm64/boot/dts/sprd/sc2731.dtsi      |  4 ++--
 arch/arm64/boot/dts/sprd/sc9863a.dtsi     | 14 +++++++-------
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts |  9 +++++++--
 3 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.43.0


