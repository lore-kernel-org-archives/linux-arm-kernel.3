Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2242FC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V+hMZl8uGnKX7r6JQDRL8m8Q3q+slkwL1/USsoq8Dnc=; b=qC/pHn5upgm43q
	PkHdt9LdgIizB8feS+jevCz7F6DPg7uypR5M4ZsChaIFjwRKZxJgjw2RuSlD/EQjqXVtidEzBKvza
	v7pUqQFuEAyCuqajJmvA3F8/U3wlpO+Co2uP4kwOHnwKrgMSdi+YrH+mQbuFS5b7iB7+recFHXoqS
	xUqbHx84oAwhuB5EloWxqBdC1r7JKpu/6Uz0+oCmNo4mmaZQ8EqoMoWDm0yN1KZkY2QnN2Riyobj9
	95pyrpeasUzLrBJ+ZW0stqKZxn4YcuqAFVY/gV0L4vAn1baHfLTGdwolS3Md6/YtIyrwN6ryTDj6r
	jAF4g2wnqX6nhR7hiA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3dq-0000000GbuX-2CPX;
	Mon, 03 Feb 2025 21:06:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Ee-0000000GYjD-1FHN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 20:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=V+hMZl8uGnKX7r6JQDRL8m8Q3q+slkwL1/USsoq8Dnc=; b=TAluUydAZMdOkUBN4KO2xaqwxz
	F1NnsdEHkssOCCH7q5AHZqfA7WJTiSkfqMb9Y7UHufAHq9mv0ieJNwFRTezF7VuxxmTBb0wU3zPkQ
	CkjLG4JFNPKmlAAV9dwr14i0FnYx5CoMS5uR2IOkBwMQC3DcQyUaWZAgP3UT6FZxcLi+080xx9YbF
	4FqwuXDQRNRZMo9HJhi7CcNK+Kn2OtO41EMuCDuMjrXsB6LEZgprzhbXxUVxz2YA6sDYLyodQvYzM
	3ZVyMlblNCsxItCPRIQUOoaJ5Q3zB05JbdRj2xt4DBEHHilKSk+M0w9wHcIMNupItcRkCmYETU1iO
	+vmMmwxw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Eb-0000000GB5Q-1MDp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:39:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C890325BFC;
	Mon,  3 Feb 2025 21:39:48 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5x2maqIU6AcS; Mon,  3 Feb 2025 21:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615188; bh=Q5dvsGVyVYjLFQFk5Tp4NzwOjCvA7qPj0qDvfI9KBAo=;
	h=From:Subject:Date:To:Cc;
	b=jqPfvaTbfUKWxbnJmw2OCiI6VMufRPTCOcY6pa+2ZzLBB5Tj/KaMk28Vxd4mjSbQh
	 v/HjO8cxMBSOgXfTtjFoKDwTFvgDCZxhSW3DYWLq2FGg3Nu8kIH2yg3lWVA5CV1s4p
	 Vg1GSRax9kiGOA8v3beADA93hFwZUedg/qm0U98EykQLUo4YziPenVIiVTH07Eg7D+
	 /NgQ5Y/hnM22zrh2Ov1cf4/Mo0I7HNjS4dYnv/GuPJoIlI4D4jGckU3SzuSoYrW5y8
	 k+/sygL3OqKiFTb26dbp6LwGkehO1YRNqDlj0uEaXrmaVMAYhGIKUhXMOvh7nj6htj
	 TAqc9xWiF7x+Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Introduce DWC3 support for Exynos7870
Date: Tue, 04 Feb 2025 02:09:28 +0530
Message-Id: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIApoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3dSKyrz8YnMLcwPd0uIkXcs040TT1BTz1FRLUyWgpoKi1LTMCrC
 B0bG1tQCrdWzcYAAAAA==
X-Change-ID: 20250203-exynos7870-usb-9f3a5ed7ee95
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615179; l=652;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=Q5dvsGVyVYjLFQFk5Tp4NzwOjCvA7qPj0qDvfI9KBAo=;
 b=EAMigpAaLM74IXHgCBAjFWa6fu1CYDvTLcGCrnI+TUqV/pylIX3Oh1bGGpoCc1ZzyZrW2qxtK
 G5JQwsn7ARbD9F6m5opCXr0ZND+O2fl70PrleiFy8l8pm1LdGb1jaaG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_203957_501511_5386907A 
X-CRM114-Status: UNSURE (   8.27  )
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

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: usb: samsung,exynos-dwc3: add exynos7870 support
      usb: dwc3: exynos: add support for exynos7870

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 34 ++++++++++++++++++++--
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 ++++++
 2 files changed, 41 insertions(+), 2 deletions(-)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-usb-9f3a5ed7ee95

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


