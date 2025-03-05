Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE83C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTXHQ//nEUi07Uq1rIglvGA2poPkXrtAOXEjlPFl8vo=; b=PnRDKcz5jQl2R8y/sjOyaAqZPK
	YjQwbja01p4OM1UYv0oKuJWP5GjpqdpPH34SiWHQ/ZetSTTj9xXwdq+4bSSgZz74LznG3jbvPHbaE
	HY5183F6S7ZEzWosGrdFJM8eTP1PHfiBkPn5LjBcX0l3thVM8jkuFV6Da0Si05nG7FRbskYL01Qdy
	o1Tn8G1e9TwIGzne41W61tMrRvZutkWcq+WjL3nYaRLZk0MTsueiel6RKVGmbX6cn7kn8rRyYyraQ
	CaJxlaFupyizTuDVHIMHPrNKKVM2gL8n3Cv1+mtJauQSZeuZaB+h7UPj9NryDqRWkkBaAGFNOMxeY
	WakpgMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq0G-00000008OeK-1xlT;
	Wed, 05 Mar 2025 14:45:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppye-00000008OT6-3VQA;
	Wed, 05 Mar 2025 14:44:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso21356625e9.1;
        Wed, 05 Mar 2025 06:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741185842; x=1741790642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTXHQ//nEUi07Uq1rIglvGA2poPkXrtAOXEjlPFl8vo=;
        b=WPuE+DMlkt4bJ8913Z5NVFJ0KoQb5GtKlQ+th5g8t7Grcyv15fD6WqXRevl3u8xp97
         /nB/iqIn2qToutI82QDSnav31uMNmBvfJIX20Ssi//SInCu8+2xpzukaWO8s5vqbC6MG
         uTuABnxzEMh4A6Phbli+TIRUhR+gUo2izTOi65K0a9RwQ+XuZztl2W9Kr6b22KKQ4u1D
         xmAZfhJMWIoghkBjc90DkKGJfpB1GeJrmfM0atyPi2Y+LbVIjG+buBmTcYWDtblH5qJj
         BoyFc2BqHEl67Nf1sfIJJvJ+EKKQH4oLmikPKCZGv8PUosCgqP3cEOnlbXw4mBXBIZGW
         C+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185842; x=1741790642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTXHQ//nEUi07Uq1rIglvGA2poPkXrtAOXEjlPFl8vo=;
        b=raBBj5tn6MP4Udi8a4TZE7+RlnMQl3GrfLETO0TLlIQVlgahnMFe+4JI3VVMkQrJ52
         3LBxXrKQxSrYOHT4YxHo97PoNl07Pl3/MOGKMpOEUaOXXNiy/HKyHhsavNgM9fwrlLy+
         hly3cqwdHTrx4l8Vv9jQ1Z39Yu6XBk18cog3Bk5TaEI647Wpaaq5G4TNtDwSVcKjCzkT
         Iv2uG+uKAHtwdZzBVjbygXS9NpI8qvNgWQtimvmIuJtjkYEQvwT11om9fc+fqlLXOHKW
         dXdbIhOXHGbjcPTvwpr5zSDlGO5CxEepGuZh9ar44Kzf+dMCAEvPUTR7jNpj8V/84+Dt
         DJyg==
X-Forwarded-Encrypted: i=1; AJvYcCWD4D8ElIza5/67R1DMRPnHNyA/ChN7rS5R7PkpXyL1Ifsxf2iswrGxsfoENBh25C+LCjcoUMyGnpyj4T4Nt6BT@lists.infradead.org
X-Gm-Message-State: AOJu0YwbsM8pFk95V981I8YYEwauJqtN9hcJ6rTkAPq8ENTAhSqk2Trn
	jNnc/I3BUP3xiC2inGpMA52WP6NfTZ6GG8kSrOZNbNyhKlVLlQoI
X-Gm-Gg: ASbGncucC+neJ4qaNXw7Crz9IE7rmpVK8qoPgyQ8o8EMZeXzykOgarQnasDU0g+mhLR
	y7R5/eHMOkf6qKSN1iEevgMjlXu9P2gpox19zqegRPk9ejHEE/refQH6CpDa1KFomgX3V2ifT3L
	6ii/4+srvRqWTIK1djjBgudH5VXMDOI7TF2a89T5kxtNZGDWCo+pQZma5u0Y4dtRr1uDgoEoPDv
	ScPZNTcIkH1/HaLnOQv00gac798GKiyrz38Q1YxSTMsDFquAv57fi0LVFO1M//v40Lzmr+aVsPT
	y21bka8tsqfVEITQpCfgijUIVyZ1IZqtulcdkbeD8SQTvXQ6
X-Google-Smtp-Source: AGHT+IFGQUVETDs+aLlL7dxjD2415mCZr3U/Vg5NUkmwRGmaxQKvyXyLdfnVx5+BM6nipcBQc1kDzw==
X-Received: by 2002:a05:600c:190c:b0:43b:cf29:b577 with SMTP id 5b1f17b1804b1-43bd2891d64mr30345195e9.0.1741185842329;
        Wed, 05 Mar 2025 06:44:02 -0800 (PST)
Received: from eichest-laptop.. ([178.197.169.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cd8csm19314375e9.40.2025.03.05.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:44:02 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	tharvey@gateworks.com,
	hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: freescale: imx8m-pcie: fix and cleanup phy
Date: Wed,  5 Mar 2025 15:43:14 +0100
Message-ID: <20250305144355.20364-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_064404_869786_5CF5CD56 
X-CRM114-Status: UNSURE (   7.21  )
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

The imx8m-pcie PHY PLL fails to lock under certain conditions when
returning from suspend. This is resolved by asserting the PHY reset when
powering off the PHY during suspend. This ensures that the PHY is
properly reset when powering on again in resume.

Changes in v2:
- Remove unnecessary check if perst is not null (Philipp)

Stefan Eichenberger (2):
  phy: freescale: imx8m-pcie: cleanup reset logic
  phy: freescale: imx8m-pcie: assert phy reset and perst in power off

 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 23 +++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.45.2


