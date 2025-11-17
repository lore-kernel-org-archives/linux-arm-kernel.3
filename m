Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C702CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bAkL1Z1gQqOYv9fn52lDehmUngUxGCXsulPI0imzeMs=; b=dbmAkcrupe3CMu45LiD6RnsdYx
	k8lMIjepwaF0jK649ubaQ4P4rDRSKQC488hb4qf2WNKTP63rYQ3lC6sh9BSsVcEyYZDFom6QqolkX
	aLD1yPVj7PNJIQum2TXTWrf/ZUFXp6uwG+zVHoVPM7BXcWqNiieQTMsTv3KShxUlXK7J4b3XbNjRq
	2Ipwh8IKx42vKmd1YGbu3aOTPvk0IgPHVEA36CAmnCe7n8EN+y0lDx8Wlv6ZoBqP/9kEsAqLNLRgo
	3YTiJvtcfVmfd6oWvz493WTH1itHfQZul5U7tuYYZNrB9J+UMTUvDbtdqZqUNjUyw9v6X2rc6VdeQ
	4xc56wJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gQ-0000000Gaht-2zQj;
	Mon, 17 Nov 2025 18:10:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gN-0000000GahA-2mcC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:10:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-297e982506fso55167405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403030; x=1764007830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAkL1Z1gQqOYv9fn52lDehmUngUxGCXsulPI0imzeMs=;
        b=lALcw2PBYeWR/OD4I6mo0lA7f9u5u/Slcu0cnF1V2j4LcccX+XZDjVSW3OxdRqsOWz
         iDR69tjwiey37Fmif5MrSb6SImu4+TCtnRnpesmqJdi67tYaoUDRuNw8N16VO3EM8/q2
         J4IXyYKgc/iHY13ZrjDrT82VyXLpkDGlp1g5hURjo/FVuePTfyQrviPuufUaBFQua/2B
         8E5Lqitvoq5mIyctLx0ozC5SPRc8W/b2T2aMDqAOwHdKMzYc9LxiysN7vCdt63mWIcZ0
         LgZIv2rx630uDTX7bKKvHXzz7s3q+0NFkmVv4NZAeaDvNRKlJjs2yTO8/Am2++24VVcd
         YOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403030; x=1764007830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAkL1Z1gQqOYv9fn52lDehmUngUxGCXsulPI0imzeMs=;
        b=JJiIyTw0tzNw6qZDpalSiIsiNo2w7AJlhAKixFZPOZRcw8jTrundU38EP+DXU3gn+c
         Qd2QAboxsaiwt5WmsYJJh8rz8Q+HQTPupQPc2rZFpswfq45068wugRsv7uibtvp+Y7D9
         4QgNQD9IkThZDbal37Xd+7C13BbVpLkxdO2REUmPte5alK0bH+hfhBpztDI7ECZddl6m
         yitd1b4ip7vgTgYTeT3lecID9woB/sbFZLmF+voJgwO23X0DDe7fERM0DJWyUhK6ngPg
         Pbmxf1BpwDWooZn5yho8PbyMmADQUjrOGXI49o5rqJMXTgKOa4aRzIKqDKp3NGuQFWPf
         u5YA==
X-Forwarded-Encrypted: i=1; AJvYcCV7GTNNIvKvHbSqM6yTLXS7QhmUY1kBK2Y/Nnp2msbXTSMUIMdLanqm4Pc8LnK/DNOgU4szuAdar5iuUK6O/Vd8@lists.infradead.org
X-Gm-Message-State: AOJu0YxoY4RcOTFGiGjrqEzgCeoV5M7IfIhCG9NLshO11nolUqfEZGyY
	l140H3I4Ii1SrD9vA7AN1ejlAUYNy8qlDrdiFT9E/RljP5RIFqmdnCaM
X-Gm-Gg: ASbGncteeiWQIXc2SPxmVJ1Ax906jyGmO//aChqNRCMS+TXEQcjceChw9WLTSGl56Kd
	32VDFRNe7Qw93l77CYKwDrFae8cAKJWMhaNr2Tej7Pfv3SblZLc3VMoN73MllqUlQM6CbmjMklo
	XUMDtqOr4bRR5rB+lPBtBdCPwv2FhQj47DXdecgK9QccHhDqk4fpepVPo5vYCLvgZWgGCwcymJ+
	hKceQXYao+4qTxohP6dpbM3U5h5wG9WXEz0NLsAGjyXeFuGCoAsYsgEyKONpnQspFeBlypFd6L5
	b4w5NTFdITd4g6ZoiK6zppaFKNb96+W0q32uiDrKaxnHzr2gzULpS9fdd3DtqcvchgK7iwDwbb8
	tot/sNhhR3Bh89oV6H/DVarBWw6xb8Kq4l2JqOYR4j0PRHlBhwE04HbLiP8TgeyydGy11WFlUwH
	cI4o9u+Te+kIflcg1xFS2TQ9KxOy59PA==
X-Google-Smtp-Source: AGHT+IGmunqrQlVpfahUUkxZIBVj+bc+HmF1/RslcMS43E5s/13BnptrYkrUhKGL+v/DRdjNaQZxAQ==
X-Received: by 2002:a17:902:f641:b0:295:5625:7e41 with SMTP id d9443c01a7336-2986a6ec9c1mr175237865ad.22.1763403030526;
        Mon, 17 Nov 2025 10:10:30 -0800 (PST)
Received: from rockpi-5b ([45.112.0.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm147237955ad.32.2025.11.17.10.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:10:29 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci@vger.kernel.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-rockchip@lists.infradead.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 0/5] Fix some register offset as per RK3399 TRM part 2
Date: Mon, 17 Nov 2025 23:40:08 +0530
Message-ID: <20251117181023.482138-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_101031_702319_A3B31385 
X-CRM114-Status: UNSURE (   9.05  )
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

In order to enable ASPM we need to fix the register offset as
RK3399 TRM part 2 - PCIe Controller.

Tested on Radxa Rock Pi 4b.

Thanks
-Anand

Anand Moon (5):
  PCI: rockchip: Fix Link Control register offset and enable ASPM/CLKREQ
  PCI: rockchip: Fix Device Control register offset for Max payload size
  PCI: rockchip: Fix Slot Capability Register offset for slot power
    limit
  PCI: rockchip: Fix Link Control and Status Register 2 for target link
    speed
  PCI: rockchip: Fix Linkwidth Control Register offset for Retrain Link

 drivers/pci/controller/pcie-rockchip-host.c | 31 +++++++++++----------
 drivers/pci/controller/pcie-rockchip.h      |  5 ++++
 2 files changed, 21 insertions(+), 15 deletions(-)


base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
-- 
2.50.1


