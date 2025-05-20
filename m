Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B6AC54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mR2jnOGYT5K4oZJbUfjZbxauGvylOY/66NTt/ylAEA=; b=QBmsTPB1DqUEGuqBGA80ax5Nyj
	C7r3k7XOujVO8tR1yd8MCaqxBSJBB/ZvY7v4zHoy3SRP7ugnyOmpDY+DJEl+9ZiAfpmYZPMNhivLI
	Jf1I1BAOulOD5Oy3nEpGgLCOxQ5HH5axPx5SHxIv+0RwWVXCiznbpQKkRWw2Vg8krsiI49dZwfASB
	HsWKmC/k3cfox+xIwx8mVhHkWvgPehJaVPOHPTDNfi+EbJkNZSxsXxnrt1QwWYLu1XIDmorExTVr8
	Vco1TipeY74Ap9yA8SxPsnLq5MmJ0m7kN2pMnfCFd92yE0ABsFiGsUBSwK40Kk8hXxUZr+UDyWC5p
	EgM1Pz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCWx-0000000BJZT-2noH;
	Tue, 20 May 2025 02:16:35 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCUr-0000000BJDE-3iyS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 02:14:27 +0000
X-QQ-mid: esmtpsz18t1747707182t69fba9fc
X-QQ-Originating-IP: Tj2H4w98AHYOiKRZQDY42vO/hTjCivU3dF71q/M76rE=
Received: from localhost.localdomain ( [182.242.225.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:13:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2848661057266188030
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: i@chainsx.cn
Cc: andrew@lunn.ch,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	inindev@gmail.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	nicolas.frattaroli@collabora.com,
	quentin.schulz@cherry.de,
	robh@kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [v3,1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Tue, 20 May 2025 10:12:59 +0800
Message-Id: <20250520021259.2387130-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519075432.2239713-2-i@chainsx.cn>
References: <20250519075432.2239713-2-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OZuCtzQljvyFZveOtd/FbRq7Gobezbioo3up8vo5lQa2lWhw1JfvgWNK
	IwiUr3ovfJf96bD4qPdDqdso6HWI5gCBMIhgzI9bdCD3lIA0UbGoSe8T/gMUbxkdO3BMobm
	1yAAm6SKT0/SPEtVCbBitli9ElriZ7T12KKCJPmOdZBI9sZx6V3E6D7If/APpTVpqSGLZai
	WyriCnD9t59B/CNe/g6KSvR8/NklEE4V7dyC67ie7MzVoP2Knd7jx5GeZTopDt+1cVPFH7j
	6uVuPC70zNo+tvFH2l5rW/QxHiy0knxvge6qQiI45JliaYL5kDVAQx4SeUu8Gdseim+AuR3
	GrxMtFzklYcLfWZvmhl+TCsUKtQAsVl8mPZo9n18wWiaefO9Ktdy0wGgVdLuO1QxVeTa57F
	39KHZFwfpE/wRAt2enwePWWDCzpV0FkcGwM59NxoNGxDKsZXrQTmB2M8MvGQJom/V+XWAy1
	jii/u2upbPAphjoAdmSiWy2+9FaBTjT2aYT0AAstQ6wEzFpEWaDHKzmWlPAYyv2Miit6P/A
	votbD1zoMpMlu4M6vmWfQVRWMPgO5zqC6O8dt/Z09sKMGUuD3b7/JuSVJajn75EmJUIFnLf
	4zJxzLGVhxOu2GiCpVMwWjYxz015N1sB5HunWGj1bDPLvWysVR8a4t+XCiCkChBounEjocQ
	ptUrsOkeU1EwusHDpF86tQk4Nnu1dp1e6CGtbvmNrMgRei6LbPd6kymANl3X2qre/jb4lmJ
	uaVX6T/NDtGSWkFerhPyRmQL2WvcSlcSH32KAo/zSgc/6Ye0xDQ80QO6ZO7x+xfAPXLWJF3
	ebxckKFNhFJUSWRU772BPfKDIpRDjALtzXEybwVjkJ4FeGUhWrRoYtE6nFdit6bdiv/EI4P
	g3bp6P/H0QFK5OMaLfbHjcQSlgGz8NzfyubiFaj/v/E3lk3jyuLtJHZ1KzoPVF1zUXy7ANp
	HHU4cfdiNW+Ykqg03MEpjgmQz722W/a0QxckUVYWGbzi6GkTdc8kC3Zz9
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_191426_437425_1892AFAA 
X-CRM114-Status: UNSURE (   7.82  )
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

On 5/19/25 10:20 AM, Quentin Schulz wrote:
> Would you know what the actual differences are? For the Station M2 they 
> say "Based on ROC-RK3566-PC" which may indicate there are some 
> additional things or changes? Same for the Station P2: "Based on 
> ROC-RK3568-PC".

Station M3 is a product from Firefly. This product usually comes with an
outer case, and the internal board used is the ROC-RK3588S-PC development
board, which is why this situation occurs. The same applies to the
Station M2 (ROC-RK3566-PC) and Station P2 (ROC-RK3568-PC).

Thank you for your review!
Hsun

