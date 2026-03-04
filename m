Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B14BEFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqZr3uXddzRDXU94DEFXMI4Ei4BKXywYVz/8MHY3FwQ=; b=sPFHQzs1jB6w6as6J7jQyiD1lp
	pw6G+dG9c6hPjdTeGLdTvIejqtnQ0ww8oyUsyKkx4cYDWSNOHwfjt3seRGeCr0fO4a5L8/K/U9k1Y
	dKh/WmDUkHNbWQwatj/azzoAKMoxw6ElXqmo6Mu3HKSRxhtXWkZpvD30G6ZMmNlzv17PHYa7h/a/2
	ZhZTELSNVzWtAd74fBm/7HSS9a4/pC65jAL4Zi84LpcoaJZJij6zWBk6j2cMv28fzaqcQpe5q195J
	k3J/0HFEzcieGqKgSjrqupFjeCUcGfyzixntNbFMrx4Owqm0GwuQbYujKj4HQUbZ0psWhWBB+T8n8
	fRKWIVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqHK-00000000CtF-1jF3;
	Wed, 04 Mar 2026 17:44:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqHJ-00000000Ct0-0zmd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 17:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MqZr3uXddzRDXU94DEFXMI4Ei4BKXywYVz/8MHY3FwQ=; b=hjFk78FiGXhn0hXu9Ztfuj9Jw4
	luJp+2ZsHhbq9C83yXS7IKQJpL2eukTJx75ChW9NrL6rbuduLwz3ILjmzNB0/UWbHtg18f4MGY514
	LAI5lN5VHX7qa8nglt1DEQfPZvZWCX+RZI2pwCU22mqcynNUJbaQJLwc2TMKfG81B5BU7/ODskarw
	aGA6k6JUfkvtBwgR5XweA6t9WwxbLG9bDAmWUcuYY0lmEk+lj166/SvOvx34dM6p9lYriqbXkczP4
	qRjduPrqZrDoxKzEINY1J7nLHPere/24YqW9XnqVmtXDSsxVvHsjgcr+SboYYCm340aTqMgQpD8lQ
	ZNeZlQQw==;
Received: from layka.disroot.org ([178.21.23.139])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqHG-0000000DfP0-27Nq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:44:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4E8B6268F8;
	Wed,  4 Mar 2026 18:27:05 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBoQkjxIt4F3; Wed,  4 Mar 2026 18:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1772645224; bh=JitPJO6qRhqiQ0FcIglKO+7Hb0B7tpTsAylIXoKIL80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WZG7LY3w1Oy0hYtEFaNMLM+9tzS+PSZQeR44NgHfh9Cd07Qw+q2t+SCAZh+ZVU527
	 6keGUdPx49rH8LbU333AAZfJrZOkEADXfw7t6lrI4TeWNen5sTVDAqlJt8jaBdXrmz
	 +m3AdY+qAFFlUhCj1PDWeVV14YKaIUw8HkKWRbEp/pGBM21zaq6WesvMJInR74DIEI
	 JeQIRdvkUyJOkLo86KOWcIr6yJ1PK2NU1yUu9kyjtaLrMm5jEugxyA5r5lZ0FjF02B
	 eJXM+YqnzIIqB/0xPmWDe8n94IZeOWoPMxKhk5I6tjpgSXmapUdkWuFQ8AaGTzZ61C
	 UcHYjr8keQfxA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 04 Mar 2026 22:56:53 +0530
Subject: [PATCH 1/2] dt-bindings: arm: samsung: add compatible for
 samsung-j5y17lte
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-exynos7870-j5y17lte-v1-1-eb25902c84c8@disroot.org>
References: <20260304-exynos7870-j5y17lte-v1-0-eb25902c84c8@disroot.org>
In-Reply-To: <20260304-exynos7870-j5y17lte-v1-0-eb25902c84c8@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Andras Sebok <sebokandris2009@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_174454_600255_83169FFA 
X-CRM114-Status: UNSURE (   8.67  )
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

Document board compatible for samsung-j5y17lte (exynos7870)

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 3c18c15598ce1..753b3ba1b607d 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -217,6 +217,7 @@ properties:
         items:
           - enum:
               - samsung,a2corelte               # Samsung Galaxy A2 Core
+              - samsung,j5y17lte                # Samsung Galaxy J5 (2017)
               - samsung,j6lte                   # Samsung Galaxy J6
               - samsung,j7xelte                 # Samsung Galaxy J7 (2016)
               - samsung,on7xelte                # Samsung Galaxy J7 Prime

-- 
2.53.0


