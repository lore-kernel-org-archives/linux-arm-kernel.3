Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D66D609A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fy8cPLCOovByR7duSkHnLMlAAw1x2JYUBLYA70d2EL8=; b=JJjbbe1Le7DJZLOMnsGJxtezCr
	EAUfRuiNgOjIzUKyKQWm72klcE2p/xC3i6dnQetl56Ol2VDDy+RFYCSS1gwKdRQErbYfb7iHmJzII
	lcQoxOiMB+VSdj0N25e061WO4MCgeyHeHbtsh2qYEsvtO5jco2ANGKrFXm0hLPLChf6AMhC5UmzGC
	nJdEycHw3qd79gD+i+RgmHTUJQjQTagz0bxnBRRHI79J4/1w0JNna5eOloK8wpV2Y5r2tftUYZ2la
	4FelAcGkxA983DxwGCmdSc3WUT74SydwhGM8un3HhnbhXEK9okpvZq8/+J4KlLa0lJO6CStgwo3ua
	S9maPwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCcr-0000000CSQD-2pwB;
	Wed, 27 Nov 2024 07:38:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCb1-0000000CS43-2bnE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 07:36:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2124ccf03edso65024295ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 23:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732692983; x=1733297783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fy8cPLCOovByR7duSkHnLMlAAw1x2JYUBLYA70d2EL8=;
        b=T08zajlIBG7ffIMEofzNZPfarewdT3EJiUiwEH6rDhWPC9jjodmxGPNDrDHBYP2yQk
         8JwYgnuHPb6EFgYD4GsMDPwMrex3Ej4LHxwuZaWV2uAF6k2wYeN0rv2FU0CVHCObaa2q
         XnGpQYzXszJx+mPe05gnqVsyrgYp7UCgkOn08ovXlXkrkJAhQ6W3/yW0xPOz1mTceyYn
         lr4Sxm2+TwU2ugKa4hByi+NMJXJYtax8oTttk+hxVOdPLmwUKj1FDkKM6o4aPlOo+bOy
         mIgXv+WWhAvj6Q4/HU3W17Za2bMts58A07CG3CJZbzYeNIKV9VRPEy2NkV3rvag0enW/
         PRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692983; x=1733297783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fy8cPLCOovByR7duSkHnLMlAAw1x2JYUBLYA70d2EL8=;
        b=IQ5eQc0Yf9AhE1QDmqbv0GP+XGC/l/tz++8VteD3voqxeR73ixYGfBjTtaF8F347P0
         yDhOA904kzY9fyEnRkYXaPdzk/BkgkzoXafNPgVl/Ax4L3a8iYQjBQZgXTjV6z4JGa3W
         ATUlXvfizNFeyWasIASsZRAaKrxpyEqUccnTwLUd5XZ2/p3DF3qHb0dk2FpHEZMjXvDz
         RMK2B9FMo4QeCzwSTKWnaNDjEX1PnMErgXlZmdxmsft+d4OOda03DPmlYPQG1FMoDdDs
         KNRqx4rKuBF0OorqCsSNJ6UjKjOgBOacYMCKwPVDbG6mj/mSFHaKsXNXpZdDvI0Zsykb
         hCtg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Ic5gwQGkNU5G6JbZx3LM5PcDEpNiXvGlN+ix3+CuL/2SPTjgkmgdqV1Mt1+kqDxCuKiECTG95UGLjsXaISsz@lists.infradead.org
X-Gm-Message-State: AOJu0YwydxLmR+Xrd7VF60HJ6+pJqZFHdKCgXIaGtAHLNZjFzZrmP7o5
	q9eTh7VuAWd3wZ5rbR6CkCmPjpS0dQwl7Nk/gsKHKodUF2jnaPOl
X-Gm-Gg: ASbGncvxoOxne/QFqB+PF+7VHl8HsPxPej3wjt7pyhC111bRhtDh6yIqxpB2/qH5Tit
	9QC6rnWjF4qFGtuNa++/Qgu6bVHh1wJVLMs7XLl6C4pAhTIH4ieKSgg5ihEHLmHNKA7o+fVmrl3
	9Z16NdB2O5M/3C0Px81nen+01w5BIyWYE+muHtrbXPCr9S1/pZ1KRIeB1sxpukown9L6oFCVHjh
	z5iptprAifgieow9gtQYxjmaTIh48ec3AhmEWPe5P4zU2exE8RE6M8jjBieVGNEFmrz0b2ZEze5
	VgAg4DKUclPpuk+uGthC2YOdn0eZJqf8v3kCBHPtZaspsTgInOt7G+pXqUnBnMuK
X-Google-Smtp-Source: AGHT+IHNTUQ81YL/jM93lEIywiHdpzGHp07oN4iZZhDd/1Fq5BjO2kzmAdEFYgPuCUXoBa1FrIKwmg==
X-Received: by 2002:a17:903:98e:b0:212:3f36:d985 with SMTP id d9443c01a7336-21501e5c1e9mr30168905ad.53.1732692982407;
        Tue, 26 Nov 2024 23:36:22 -0800 (PST)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c645sm96597095ad.16.2024.11.26.23.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 23:36:21 -0800 (PST)
From: Jason Hsu <jasonhell19@gmail.com>
X-Google-Original-From: Jason Hsu <jason-hsu@quantatw.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason Hsu <jason-hsu@quantatw.com>,
	Jason-Hsu <jasonhell19@gmail.com>
Subject: [PATCH v5 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
Date: Wed, 27 Nov 2024 15:34:07 +0800
Message-Id: <20241127073409.147714-1-jason-hsu@quantatw.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_233623_659738_6C08C5EB 
X-CRM114-Status: UNSURE (   8.13  )
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

Add Linux device tree entry related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
---
    1. Modify email content.
v3:
---
    1. Add mail list.
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
Signed-off-by: Jason-Hsu <jasonhell19@gmail.com>

Jason Hsu (1):
  ARM: dts: aspeed: ventura: add Meta Ventura BMC

Jason-Hsu (1):
  dt-bindings: arm: aspeed: add Meta Ventura board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 877 ++++++++++++++++++
 3 files changed, 879 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

-- 
2.34.1


