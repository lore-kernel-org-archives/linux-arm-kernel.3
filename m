Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138CDC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 22:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n5zF9eYAfet4a2a7y5aVXc8isdMOf/EErsvnjAstrus=; b=2A3jsXkMWZ3zF0
	tUSOEbFTamqlptAkFgc6/8X3pjkZ3+HM8MNWx+hwYjnGROuU7pRpfQK0w6EHe27+BNNdhmp8sZ/hG
	ECBymupYrp5aSvIA9kqhZcGLTZ5adNjsgupizHL8BUE6gA9xuwXF1cXGz7nldC6kTJST5vCYQRPJe
	sFo4127QbOljMfi4767ueK2vITv5hdg8wyM6VJB2nO5QMzqafFV1s64YxNTekLQgUJJE3jgRXdYO5
	7MoiqBw+0maRWMWJ4X1vsiy5zfSl6ql++EEsQ++stUKwqRlIMDlPwC9qbuFAgzJ2myzcbI2XADvRr
	DYbb7Rvgl8nhrK/sGNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbb6-00000004Xjk-25nY;
	Thu, 31 Jul 2025 22:18:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbVw-00000004XAB-3oho
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 22:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 227D543E26;
	Thu, 31 Jul 2025 22:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A0CC4CEEF;
	Thu, 31 Jul 2025 22:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753999960;
	bh=dGSihHIH6s1bKpn+VJDgTQDiIrWhwFA7/h+sIJx6jwg=;
	h=From:Subject:Date:To:Cc:From;
	b=oLJcqY90eQJdOq4+ZVdz9zCLTXxY9bYXetWN3wruycZl68Vv8gOinkMD1NxlUtUU7
	 KKZdgufnrqxghzfCIpcVsP3a4SUL2gkcBcukTJZTEj+TmrSU4/PCG1awNmtn5dsfwy
	 MQNiKrUxOePQXuomTAgaRPMUZCjAaSS+ARkk8dc49O91FthtGs1ySu4P+hycZIzoWw
	 yJwRvZFKpTm8rpsTb9Ayip8A8O1z697Wp/1bZACv9Pq7uqzrOUGwkXbjCRgaCpD/Hs
	 DipIW8Hnun2M+qLnJ1C338nHAPVgDVH0+SoM+e1SA7/1/YEf+h+MhLZLm1EhasDVH7
	 9ZVX0dE4D+2Mw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/6] ASpeed FSI DT clean-ups
Date: Thu, 31 Jul 2025 17:12:17 -0500
Message-Id: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHqi2gC/x3MMQqAMAxA0atIZgNtRQWvIg5qEw1IlUZFKN7d4
 viG/xMoRSGFrkgQ6RaVPWTYsoB5HcNCKD4bnHG1aSuL/kRWwXmjMVyHInvrTVPzZNlAro5ILM9
 /7If3/QC+DbP4YQAAAA==
X-Change-ID: 20250731-dt-fsi-cleanups-fd1d065fb1f0
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_151240_993903_8239AA3F 
X-CRM114-Status: GOOD (  10.02  )
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

There's a whole bunch of FSI related DT warnings on ASpeed platforms. 
This series fixes most of them except some related to SBEFIFO.

The remaining SBEFIFO warnings are from some deprecated properties noted 
with 'remove when userspace is fixed'. Not sure if they can be removed 
now or soon. If not, perhaps the deprecated properties need to be 
properly documented.

All the patches here are independent, so DTS changes can go via ASpeed 
tree and FSI bindings via FSI tree (or ack if you want me to take the 
bindings instead).

Rob

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (6):
      ARM: dts: aspeed: Drop "no-gpio-delays"
      ARM: dts: aspeed: Drop "fsi-master" compatibles
      ARM: dts: aspeed: Add missing "ibm,spi-fsi" compatibles
      MAINTAINERS: Add FSI bindings to FSI subsystem entry
      dt-bindings: fsi: Convert fsi-master-gpio to DT schema
      dt-bindings: fsi: Convert aspeed,ast2400-cf-fsi-master to DT schema

 .../bindings/fsi/aspeed,ast2400-cf-fsi-master.yaml | 81 ++++++++++++++++++++++
 .../devicetree/bindings/fsi/fsi-master-ast-cf.txt  | 36 ----------
 .../devicetree/bindings/fsi/fsi-master-gpio.txt    | 28 --------
 .../devicetree/bindings/fsi/fsi-master-gpio.yaml   | 63 +++++++++++++++++
 MAINTAINERS                                        |  1 +
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts | 24 ++++---
 .../boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts |  3 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dts |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts |  3 +-
 .../boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts    |  2 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts |  3 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts  |  2 +-
 .../boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts  |  2 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  4 +-
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     | 12 ++--
 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi     | 12 ++--
 18 files changed, 188 insertions(+), 94 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250731-dt-fsi-cleanups-fd1d065fb1f0

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


