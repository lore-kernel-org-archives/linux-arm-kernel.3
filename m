Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63635CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crVrt+azV6VzH/3rk8Jcr3ieOc5saBo85Edk21IHDvU=; b=A6Lg0I7lHHV/+M
	7rFmuGkhexqJiyXH+RC4+0OtatQ04iQVLnHQ3djSZzyM8q3/OVpxg/bbMB9ETxy97324ELji26dnc
	RPmZ+YuJKc1goQiTaQEH+58O6P5BmUat2OgEQ3Uz7JhlooUV6W+fWrnEKN8vd9r1RxEN9MGa8jYAH
	7tfl10GKGtmV2asKyr4sXSOqqzZXgPcDY8uvl6ygwexixm0HPIAscBLUTmwD9GnZ+mn500jgDkdOk
	o0t4PKhUUtfDl03qP+JQ38p4LnP09d6i/8JjUSsqL4sAH22gK2tCPzf1/p9WIdhdqVREptO0g8YJV
	L2qakDGwpFwnpD1pPoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9VG-00000006Gqc-1dza;
	Fri, 09 Oct 2026 12:15:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9VF-00000006GqQ-23Sc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:15:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E89D840360;
	Fri,  9 Oct 2026 12:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21EF1F00893;
	Fri,  9 Oct 2026 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791548108;
	bh=crVrt+azV6VzH/3rk8Jcr3ieOc5saBo85Edk21IHDvU=;
	h=From:Subject:Date:To:Cc;
	b=QtKdvOVuxyrLExAgcfojOGE+jucpqApSPmlC61pMOIDaSLHUJVvvMp9FHrREWYtlz
	 m3WkHEUQ5eCTUfu9xTeNmWpSQHony31ZnygnU4B1sl+n9eoAHgqudKukosMDamyAeZ
	 kHj1ghhX6WQsiSnOdReW4FMkmwmiVpJj71DV0w3aT2S05Ohnb7zGeqX/VZuKq4y8HU
	 AP81kXGm2i+p3LfJF1rbSruI2hijsxKMYFA2RSRsoudIbJht4DCS/CJ3PIgrWYnQuy
	 qJd91Kb47nBauXXVAjJS8zT6g8lqkSPQI9flmmPCYXeoks9mWfGEztfS3rYS3rrWGj
	 LmtDMB6a+nbqA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/3] pmdomain: Basic DT defines for ux500 power domains
Date: Fri, 09 Oct 2026 14:15:03 +0200
Message-Id: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqEMAxA0atI1gZSpSMzVxlclDZ1sphWUtSCe
 HeLy7f5/4TCKlzg052gvEuRnBpM34H/ubQwSmiGgYaXIXrjVi0RrvlgxZD/TlLBfcIR1RtUDlt
 F50OcrHWWo4cWWpWj1Gfyna/rBhOFN7d0AAAA
X-Change-ID: 20261009-ux500-power-domains-v7-3-rc1-redux-acdf755a5efc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
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

This is three preparatory patches for v7.4.

These three are an excerpt from the earlier sent series,
updated according to comments and collecting ACKs.

It also fixes an urgent dependency (my bad).

The main ux500 power domain rework is targeted for v7.5.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (3):
      dt-bindings: power: Convert Ux500 PM domains to schema
      dt-bindings: arm: ux500: Drop NR_DOMAINS
      dt-bindings: arm: Add the actual power domains on U8500

 .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ------------------
 .../power/stericsson,ux500-pm-domains.yaml         | 41 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/pmdomain/st/ste-ux500-pm-domain.c          |  2 ++
 include/dt-bindings/arm/ux500_pm_domains.h         | 17 +++++++--
 5 files changed, 59 insertions(+), 37 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261009-ux500-power-domains-v7-3-rc1-redux-acdf755a5efc

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


