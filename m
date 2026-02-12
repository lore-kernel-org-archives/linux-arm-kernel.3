Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3973EB48F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ahoca4GTm0Y0WxY3JIsBnmIBma9HHAwS89MkyjovOvY=; b=SY41iU8sr057eB
	rpYYQLR82zjKooTASMZJhGanVijvgtzEDf8k8X+8sXS7RZ2wtWwDf6UuNeVHhBxefxSw6Oh1uweDo
	8Cqln+A/FCAmBaAZ80vCvj6pABS3kbUZCbtBDF/+Da5QsbdKmuytGtxnyGcSVZEPfwkA8LGZFLAwx
	szwcnwlQpeJMJUuC3cAiJAiGCBK78vREeD9/7QidVih3EDXsNTDZ8CE0x1sgoIhYK2pTMQqfQfEsi
	WQVpYo9TgQrVfsbRtv1mexWKmyocPHxEnMwsy5d2SukxHrv83gB84PL6U9wYEIYRoAEpxlB7+ALP7
	pcxyl+/D4a+p3iK+TILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUhc-00000001yz7-2yO5;
	Thu, 12 Feb 2026 11:17:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUhZ-00000001yxs-2BQg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:17:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FE59339;
	Thu, 12 Feb 2026 03:17:32 -0800 (PST)
Received: from e137876.arm.com (e137876.arm.com [10.33.10.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A1BF3F632;
	Thu, 12 Feb 2026 03:17:36 -0800 (PST)
From: Debbie Horsfall <debbie.horsfall@arm.com>
Subject: [PATCH v2 0/2] Add Arm Zena CSS support
Date: Thu, 12 Feb 2026 11:16:50 +0000
Message-Id: <20260212-zena-css-v2-0-d33ea23cb9c2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKK2jWkC/23MQQ7CIBCF4as0sxYD1LbWlfcwXVAY7CwKhjFEb
 bi72LXL/+Xl24AxETJcmg0SZmKKoYY+NGAXE+4oyNUGLXUvlW7FB4MRllkMc6e99NqM/QD1/kj
 o6bVTt6n2QvyM6b3LWf3WP0hWQor2ZNw8dtb583g1aT3auMJUSvkCkHrdHp4AAAA=
X-Change-ID: 20260123-zena-css-7b52f0f2a967
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Debbie Horsfall <debbie.horsfall@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770895056; l=1193;
 i=debbie.horsfall@arm.com; s=20260123; h=from:subject:message-id;
 bh=d7YPEI0YKLrZbZeEl6CSXoCKS9It1twSy6+qSTOdpWA=;
 b=s6KardkWv64HT2C7lE3RSNYXac2BhltvtOpJ4A7Lu1wiqapWeGSooS9MnPHaNPaPMhBlpsD5B
 vGhYUER0UxWDRv1mHoWeGCUFobzv2RH0KWSZWFLiluCjVl7L6W9qxHo
X-Developer-Key: i=debbie.horsfall@arm.com; a=ed25519;
 pk=PHSQwhhwfluuPcWn1fk950OfqGxCy2cjbyQb7dfAcFY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_031741_598593_8FCF1714 
X-CRM114-Status: UNSURE (   8.48  )
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

This series adds the Arm Zena Compute Subsystem schemas and
Devicetree. Currently, the only platform variant is the Fixed
Virtual Platform. More information on Arm Zena CSS can be found
at https://www.arm.com/products/automotive/compute-subsystems/zena

Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
---
Changes in v2:
- Moved the binding to the common vexpress file.
- Removed MAINTAINERS additions.
- Refactored Devicetree in line with review comments and Devicetree coding style.
- Link to v1: https://lore.kernel.org/r/20260123-zena-css-v1-0-34adb95cdf89@arm.com

---
Debbie Horsfall (2):
      dt-bindings: arm: Add Zena CSS compatibility
      arm64: dts: zena: Add support for Zena CSS

 .../devicetree/bindings/arm/arm,vexpress-juno.yaml |  10 +
 arch/arm64/boot/dts/arm/Makefile                   |   1 +
 arch/arm64/boot/dts/arm/zena-css-fvp.dts           |  55 ++
 arch/arm64/boot/dts/arm/zena-css.dtsi              | 777 +++++++++++++++++++++
 4 files changed, 843 insertions(+)
---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-zena-css-7b52f0f2a967

Best regards,
-- 
Debbie Horsfall <debbie.horsfall@arm.com>


