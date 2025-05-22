Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7124CC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+OhyRmK+odmcarituTL+EeuhRr8HjjwGpWLcoHucNA=; b=TuYwOj/AkkFYZwyWUeImc0gyqP
	XrADXQ/Gq4VfdK33h795FnWQzCIarybSZGnf4QcpueT1BJeHv7qg7fBSQC3I/X5K8s+gkpdWn6cLH
	3yV1Iawcckm/teWoEB1WEmbB+IrOwtEXUcdhKRuU5MbdP/hxINf0FsvZexB0nQjVwMWhCMbE/IakP
	ctrTwFHlUjDNj8idQw+vy4+ogo9fJygEh9/mYRdjAilNg6DKaCTFJZSWUn35835cT5OGo5pTVcxBz
	lOt9coflEqS1OhOjUUvw9vZxX1QVxfya0C7SP+7Y62PkGkivgwPi7X8YRwgu1atEYRFonEzkyCIkh
	ZAEQDJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Ts-00000001NEg-2jHR;
	Thu, 22 May 2025 15:05:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7BO-00000001J7j-1ZsC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90407A4ECE8;
	Thu, 22 May 2025 14:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65827C4CEE4;
	Thu, 22 May 2025 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747925165;
	bh=8FR4QAUBBTELVo9pnu4KJI7w5E3w2Hnkds8Cgh6qVD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6VAFkiAN5GbPXTcxCwhVT2uN5NJcr491Dp4C2e2uMejHBuUtXKpSbJ5sh4J6mXen
	 MxhYj5QIKqk2XTkuyHW0CBKWeuMZ36u7oJJNjUYQ101+RpGou6A/gM6dGSU18jJnPj
	 z6RALLZaUpxwjEku4MVk35i+zRBHI/j2cf5pKepBJGdQNck3Ihjrf546qsuZdihuVn
	 udyGEzyCqI1zrBOiwaZTXDrgIU3hf1Mw7QEAP8waGPb2wBeNbuHMoN483JPSAdMm24
	 fXsSRkSLJ4hrqY7h1s5R88gULab51K4H3VlgjxV8hRhb5eXiXzeCE1sxLDsf07CaFo
	 Q4/+zYiB+x17w==
Date: Thu, 22 May 2025 15:45:59 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.16 merge window
Message-ID: <20250522144559.GB1378991@google.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_074606_478137_DF8CDEE9 
X-CRM114-Status: GOOD (  11.34  )
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

Enjoy!

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-regulator-v6.16-1

for you to fetch changes up to ef7f3631a44b8e0990ab8ffcbed4b2c3a4270883:

  regulator: bcm590xx: Add support for BCM59054 regulators (2025-05-22 10:57:46 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v6.16 merge window

----------------------------------------------------------------
Artur Weber (8):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
      mfd: bcm590xx: Add PMU ID/revision parsing function
      regulator: bcm590xx: Use dev_err_probe for regulator register error
      regulator: bcm590xx: Store regulator descriptions in table
      regulator: bcm590xx: Rename BCM59056-specific data as such
      regulator: bcm590xx: Add support for BCM59054 regulators

 .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     |   76 ++
 .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
 .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
 drivers/mfd/bcm590xx.c                             |   66 +-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   27 +
 7 files changed, 1325 insertions(+), 279 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml

-- 
Lee Jones [李琼斯]

