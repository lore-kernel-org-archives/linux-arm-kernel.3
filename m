Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LSfASw4X;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KfJtO4yn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=; b=LSfASw4XgiJHTHsnu6mCBkiCsv
	cdWdajbJ9oMSHMl5X+fySFU6WzSvP4xKUyG1om5+Qqx4nWTxDi444Rp/YwJKkwQ3m94W1j2cqqh4W
	98n4iRnl37CJwUkF4GEIijXLwUnJj1Sc4dA5Sq8vTASZ+DrdWAQ6R2AV1nJlBGv6dtKsEPc04anHO
	htAC0RbZY2dNF09kg73LVyOHkOAbHzaqiw1EivhLtrtSr/c/hzvOjKegHuT6w0xTYD7uc1CpQnuPn
	p5ogX5sDnFG3hxkuwukfxzxfWcozG/n1kpsHedUCvSFz/rjvnzFH1V1fLxyUaE5TtN4LsjDYOLLQ3
	O5ah1yMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7wf-0000000FWhL-2ciq;
	Fri, 23 Oct 2026 05:36:01 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7wc-0000000FWgb-37IR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 05:36:00 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso193949eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 22:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733757; x=1793338557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=;
        b=KfJtO4ynj5dH3QiNLWxmjMLNf6c/sh+IRBDvqDrg3oVuoVPqzcRYuIhXJEMPNG724C
         R35rLiJBFHEltoiP2wCIa70lgXYg0jnKo9JYfw+cP1a1k61y6bANfc8cHc4GjmaQpqh+
         2pMSc871VO6rwMfZtv700kkCvTJ9FiTvioX/SFdvLahGgHVknj/jhs0Qi5lk57KXsc6j
         ddMQocWm1FUMGj8K/WSRJ6kLUygUGv5imS4MONsVn7ow/+vabSWNgObDP9qXZYZhgjHV
         CPKwPbgSX+VdaYl85KmgbZ0D8K9tWgoGzSis3WnBvBwBDUALVy0gcl6OJMEYJWVV03W1
         tfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733757; x=1793338557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=;
        b=13MeNX7PIytHULkvpF+F1sdr+x9P5Tb5EHCODyrI06rE9NVc6UyyywiNMR0sOPcJ2X
         1W6cMyEnVQyH9ZK1IiiAQLKQs14ElcWYctsbKdB8rkA2eNwKbhHe+wE/NwJyq+WxlmPP
         oYkQIjCouVbKsM81udWWdUIBcLxBYI5kCoqymYneSerS/pXoQ7QASzOHAMrk9/dsM2Hq
         bRkKZSXUEHHe9DUQqmLV7b9NW3e0JR2noslFPmCPU/DWHhyMgnAo48K5IEWEC7KMrpsv
         sbyrF9HlTzvlZm1Vcw82ROOZwcdMYS1e0Ecz5+1CC4mjqj2JkqVBryQi34k4rA1eDMru
         bnrA==
X-Forwarded-Encrypted: i=1; AKwUvBwyoOQjWo+J0aEqypmVwdW/F2Ej/MVHUL8v2M+jrdQyYkgMnZXbncjTxKbhqrV8Ygxl6ILHCmkxIRgkUF9haVcS@lists.infradead.org
X-Gm-Message-State: AFq9FYLjl2k26RVLpXmDab0lAEdZ5FhT98hSHHNkQrI2uq3Z99IIR6sA
	hx8bLy+zxYgdhZOessuInrAxRNQdzdrgDr/4kSTTmCxb+7RY/r6oDPx2
X-Gm-Gg: AYBFou3g2Usr0/LgBpxGpsZIX8GssbMzExo2bUpNncrTZVb3xI+mJ0LXZpVXEjJK6/N
	37Q44E9CxV3IbuoeAmznNgpFgJ/k8SmxWFkpO9LarYo6/Q1dOO/OuhNdzESfXqUf2mfseygYDcX
	BYP9lAmQWcO/I2fzWOYpZnVOBVoIHLDQwszBvJSXsWnHkppTxIbfx0szgJMw2JnllROys0rqA2X
	Qnq3bo0Xafxei7/d7qvqaVum2s92XBLJyiAw9Ave5FumnZYA0kNciN5H3gmv6c+NpugnGvo50KP
	+P4884tYk2myCougeplkQ2gTsxY+NE1VKABppPUSgssbu7wabtsYcfibpocP8ZPiQSm2bi1bVp4
	wqMF8M1KGmHhjbXhdw6TjyNAoDFCOVDcg5wWoXoTqbUBo+Bf8e+VTaGY6bJIhor66hbTQYri8tQ
	1f0AUw5fUt20xtJZlMGz3dOS56XlriD5IKdgUbqj+WXtooMun++h1MbOpv73my5vn9jNWrY8bY8
	OJNDSpvVEIcAEH5GgIB51zS/dyWUC4wGiUd12pBPkmfHftjCdQivg==
X-Received: by 2002:a05:7300:c3a4:b0:34e:e7f4:cc78 with SMTP id 5a478bee46e88-369d954ad83mr1482862eec.5.1792733757137;
        Thu, 22 Oct 2026 22:35:57 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:35:56 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 0/3] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Fri, 23 Oct 2026 13:35:45 +0800
Message-ID: <20261023053548.1595033-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_223558_789236_30F814B1 
X-CRM114-Status: GOOD (  11.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the RK3568 XPCS and fixed-clock nodes, describes the
RGMII PHY LEDs on the Ariaboard Photonicat, and enables the SGMII LAN
port on the same board.

Changes since v11:

- Drop max-speed = <1000> from the SGMII PHY node. SGMII is
  1000Mbps-only, so the limit is redundant (Andrew).
  
Dependencies:
- XPCS binding and driver (rockchip,rk3568-xpcs, XPCS glue, dwmac-rk
  SGMII, pcs-handle binding): merged in net-next and present in
  linux-next.
  https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

- PHY binding+driver (rockchip,sgmii-mac-sel): still in review on
  linux-phy. Not required for this version to compile or pass
  dtbs_check; only needed for the follow-up that sets the property
  explicitly.

- Generic PM domain (genpd) changes: runtime-only, not a DTS
  dependency.

The XPCS node is disabled by default and only enabled on boards that
use SGMII. The fixed-clock nodes are always present, as they are
static clock sources.

dtbs_check passes with the current linux-next, since the XPCS binding
is already merged.
---
Coia Prant (3):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 67 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 23 +++++++
 2 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.47.3


