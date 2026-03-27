Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB8210AB830
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rN+yRBaQKZ5TwBJHiFty1c+c93Da6IVp4Bl5bC5JE9E=; b=fqFOOHzodBjjla3irYmh9HHqGk
	2pEV5hmCq3GqaxpxYzamFK6D/EKFmFoeVozZiRvJh/ChYBMP2sAfxrWdLJtZ2qLZBlRHuE/qfeGU3
	coALx2xcJJR7korifyt9Hb43hakKK1NIf3m/rw7s2mcuE0EZKu9szuLidc7X/TeQBqtUCZUJMFRGJ
	Vt9PlJuePuk0ZpShaHOsVjnHF6fYCSNPNYoH/T2vajJe9fT5xKoPaz6hIcMkuU5GMp5g8xF/eBRXZ
	60BfGrGt1CXeg96xqO0VULfuSmr/Btx1jHPLYkgR5lmXObmAltjF6neAx4mFzT5Z/8wI19vQJlKHx
	znu116jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67y7-00000007aAf-0dwo;
	Fri, 27 Mar 2026 14:15:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67y4-00000007a9M-0eck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:15:21 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-38c01150eb2so15224161fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1774620917; x=1775225717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rN+yRBaQKZ5TwBJHiFty1c+c93Da6IVp4Bl5bC5JE9E=;
        b=Mve2VjijvU9+N2I3R49o+l+T0TVdr0KQusJoHv5JUJJggJgEWWhaMGQ0k6McAfC8ry
         JSJmxGpokMDk1T5CcqpEKfmNB82+zIfWfubR0bm6rxQ+jScEhw9Nsz/3cWAC+paS02HG
         JuMYgElRiV+PTwZ4CLrgBWyxziO1Wt3Tcrxng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620917; x=1775225717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rN+yRBaQKZ5TwBJHiFty1c+c93Da6IVp4Bl5bC5JE9E=;
        b=q4/AwLNxVeFohjCl97g0pN3uKI7B/xqHRsqleTzV4/XHPXMrwZnMbf9oTU0aaz7EqP
         7mbX5RcBsYHEhuOcc5QwzNeZjicEJLd2XdxWqdqwR+J0gWCcK+M7f2EPEnBWa2YJC6h4
         7wG4tzGHGiPT63cHeuDfvPqjOHWeKc2lnQDGx80IZOMYtweROmF9EOsu9VruN5H9XNGa
         s010PWN1T/ejasm8V0KJDsVooIWZ2dMJoj5y5UqkCNma7BvO5ivDOKOCpWJstT/SzVNO
         Uw2/8fdIhk6RlM8ENShFFjWZXexBdjcSVdG01ugEF1lG8b77BVr1N5052042bpccjiSM
         mRNg==
X-Gm-Message-State: AOJu0YxIUiN5Pm5eH+4fdn5bV3wsRJ4YcMR3VIA9XpLzPG0YzcfjLy6F
	DBdzPfvpv96SMtkZUlN+QcyQY4N7j1DRgK2s7zTWddrzXFRJgRUzRys0YT5k8ZgzlDqh//8KWUj
	B8+lxm8U=
X-Gm-Gg: ATEYQzzBgOyYF1sdkLBNzzsGittHNMzHcSeiqGc/nx/X8/5TtNKawxZIb0MOo1k783E
	OmG3DfsVqiSnWqCvX4epJ50EL8dcfFB/FdIjmj7/AawlEH+j0YoCk8U3nW0V/q1tbOlXBGXSLWc
	N1bXq1x6EhjA/XLWftU6DTEc1Rtg40Mh32OApeIAfZUL7qKpb1u2MMMxgJRcwNO/gRZKTK4Z4Yx
	cskAzmIQvpbNI2X1V7d8f/dVFZ6EBa9q3mT+zz6LDNE2Mt+9h50PypDofuDZ/yGiJHcjsFioy4K
	AV247McSCJ+MUl8FcSeWXOR0TW2qsa+mG6cG2kERgJWgZlcd0+B4NlfDoLX/ePIxMQlQymCTCGo
	npw0srVCdXw35cnJyJOZhdX8hxKFnV/A1mdpXptW88kVn9Zt7qhUdDQpq2AzCQMJzRpUbOkJIpL
	EowWMnAjx7Yf6DkFtisScT5NsJnQ==
X-Received: by 2002:a2e:ab18:0:b0:38a:33ec:98e6 with SMTP id 38308e7fff4ca-38c7337658emr10187741fa.20.1774620917177;
        Fri, 27 Mar 2026 07:15:17 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c5330111asm13335441fa.33.2026.03.27.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:15:16 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 0/2] arm64: dts: ti: k3-pinctrl: some minor cleanup
Date: Fri, 27 Mar 2026 15:15:11 +0100
Message-ID: <20260327141513.1250499-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_071520_228523_D6A27288 
X-CRM114-Status: UNSURE (   7.03  )
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

I stumbled on a few things one might want to clean up. No functional change.

Rasmus Villemoes (2):
  arm64: dts: ti: k3-pinctrl: consistently use tabs for alignment
  arm64: dts: ti: k3-pinctrl: sort shift values numerically

 arch/arm64/boot/dts/ti/k3-pinctrl.h | 82 ++++++++++++++---------------
 1 file changed, 41 insertions(+), 41 deletions(-)

-- 
2.53.0


