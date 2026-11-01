Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D52606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B7fUaq4c;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jQ/cLWVw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P0/aAmuW0CyqaK3PactR+FND9DgMw/5CGgOfekT7jEU=; b=B7fUaq4cpdDMNn
	3dICaLRLXRZ7K8As6dzY4YTemNzdu5E+0lBv7yPJhsSqdw2JuowEQuwvTenzH7JII224QZItUwabI
	FJFL+u0dLxvcphh8Wh0+Iy/173gmAmNDupXlK3YpP63PUYjipNUC+aSGMQJTa8fFFENC6t78LxpUZ
	5JH2SGac45Q3GymIo4TBEyLE6GA/hbpI41PBMGss6CUmxMdGAZDB3GpU7L3Etypak8eFKYrLpvuhE
	fK3UoBOWM/16xcGzR2Eo06T7rQk/GQHrM97jF+VoJc+jyyfJ3zCI6LMRcMRCP0jk9G9igOeFaIKHO
	ihQOrCKEG71fFvdiP3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdsu-0000000F6hB-1Si9;
	Sun, 01 Nov 2026 22:18:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdsm-0000000F0Xu-194F;
	Sun, 01 Nov 2026 22:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=P0/aAmuW0CyqaK3PactR+FND9DgMw/5CGgOfekT7jEU=; b=jQ/cLWVw1VGy7cg3FZP6Dt2sPa
	fuCq8FAq+WocEnRYcK4eM0adoCG4B+ClDnApOIxd9sxhSgQH7p6nzuo9FavcnaYpXbQQuLuRgtXl5
	t2LuOfUptrsgiwVK5Ed9yYhxYGrjfxy2a6ev7RQf0ZcVT/FDBO+aZJWoaKn72uBbyCcIxNvakD7Dh
	xFiuIqkKVvjR/LcJjOgpOx6o0SrrQWWAXv/gR9Gyy9DDfY3yIVv2e/2YBEe74pDiDWF1G5LlVxsDY
	PDhqR8H7CIpnAi+HS3JTGVqZCUQfXaY/MlpIQ/jZA/Z5yp2XhKkEDxnawWOPt86jbFbmbI6KS+klM
	GCvTYdIA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the battery charger to Kobol Helios64
Date: Sun,  1 Nov 2026 23:16:30 +0100
Message-ID: <179357139334.4108484.16394732199796045492.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261004-helios64-dc-charger-v1-1-0eabf0274d47@iav.lv>
References: <20261004-helios64-dc-charger-v1-1-0eabf0274d47@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141832_341384_17BE5A02 
X-CRM114-Status: GOOD (  11.58  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 04 Oct 2026 22:39:58 +0000, Igor Velkov wrote:
> Helios64 has a battery backup built around a BQ24133 charger. The
> charger works on its own; the SoC only sees two status lines:
> 
> - VCC12V_DCIN_GOOD on GPIO0_A2, a divider from the 12 V input, high
>   while the mains adapter powers the board;
> - CHARGER_STATUS# on GPIO2_D3, the inverted STAT output of the charger,
>   high while the battery is charging.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the battery charger to Kobol Helios64
      commit: 5a4ee10520cd66f294b86645423885c1845ccdd6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

