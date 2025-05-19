Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F51C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 02:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WeBfK84XKo6BwGaQIvaiahY5jByMMmGweFecshqHhA=; b=vw6W+EPN9fCiN5Ctt5WuyRQVTS
	F8rAle1f7sxqtFA/vRNZyU4OyhS+LAUnvDBVdssPbeJ3jFUOu/QOedJiwEAaTGGBH2Ai9Lv5E/t7i
	1LlI6BY0ao8uFH1Xq56x/QJx8eFmIus4t6qvYdM1bu9KqfOydVwApvraXVkrE5sjvYKI087FE6atj
	5ADpEO34NiebYT4nVwfHi0hwyWgQb0bCRXOUZcr6Mb0B92IdWWJmq3E+j/avKiaE77GjKWjbSaKVm
	vI2Z3U7P2silT9kpBUbqOVShXG1ZzmCOTOwOtjWgzT4n1vZAkcGGaTsi28wkA5rQcQM6++msTLzh1
	UOK1HGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGqhE-00000007snY-3DU6;
	Mon, 19 May 2025 02:57:45 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGqaF-00000007sI3-4AZq;
	Mon, 19 May 2025 02:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747622934;
	bh=0WeBfK84XKo6BwGaQIvaiahY5jByMMmGweFecshqHhA=;
	h=From:To:Subject:Date:Message-Id;
	b=JRDn1dtTiYhLuG7xQFbderMkv/IA9BZR7XV8vVq385ZYvI+w5mJQkZQPu6oqTFVYX
	 WLAHCpS2xQ/2rNzMVboxH3MQ5XD5WKwPRoEpRNVePvid8ALIRW6Koi1qCX8GKiEtoM
	 +KFnAT71yoWF5E1f7BYPENhlCfbB+EMJUFRFLOhI=
X-QQ-mid: zesmtpgz6t1747622932t38c3880a
X-QQ-Originating-IP: 1qM8DlRd+zQizFZjrQ/zm7WNDykiRYLU3hqETrh1PeY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 10:48:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16466651914765562108
From: Chaoyi Chen <kernel@airkyi.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Zhang Yubing <yubing.zhang@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Diederik de Haas <didi.debian@cknow.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Remove unused usb phy prop for rk3399-eaidk-610
Date: Mon, 19 May 2025 10:48:19 +0800
Message-Id: <20250519024820.194-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519024820.194-1-kernel@airkyi.com>
References: <20250519024820.194-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MYha8DeKTomkEvbJs6axZM3rMWgpm966NNrSWUBwL1WUKmsRc+vgEhsL
	nFXvsvatGzmulJ2+hSb6uotJ6QDR+glmuENM+3EQ5lsqJzOMRB33J2UpbarFW9CZpoxTJpj
	dJ3Tc0J/A/ZLACwT4QdkiE9VG2aKfVKXMVqgMyaiZlowcnPKdccq9PRWd/qj2k5E+wZslwS
	z9rgZu2RwCbXnC5Nau/JjvlpODAA3NoArOEXWzzZ92EGnXhZW4my00Hd67smZBhRr/JDxPN
	E697Tzst+puGvNRrPkemKQPFLZjVqp92sy74qnEKiRLkRFsvaoNRkSs4yJ3fg76JfpmjmGt
	+MrBesGAG7WWwfuzziZ7uxlUjHqbtR2klwh7lVslOS66IBjgl81Ped74CwUYIvv/RLull9p
	lAy0/ajzkMZ2g90Y1QDr7n6SCiivsurkTCRMrEIVKkPZLhTc5hgyA7ZXj+3TqnESNf8IAeP
	91D8sGHbprrYMDNNSPMzal7CF5/oA19u/cuG502gnhoDk7CL1zuQU5Ny7ims4kMFhZNrExi
	gfzBF6FdGA/pxfj/qNtMlE84kApW5pVw0Jt6AbFzlEW5htZv/mKBCt/uEHXdw+RNyqgleOa
	HNaL6t3xWbaroCAWhIhSsQ9d6vbWVDL7+qLUTxgV5hZjdhqAYEKtu1gK9be7dRffv1IT7QP
	p0Qcj4Z50nKdry/sbF5qMrMHqGgCWMb2JG0KnX/qKVah3yzdyiwm6bgDpSwFoI3xxo6xzlM
	eur9vNBa+Yb7boS/nTzh3E+f66e7VZiateRYeh3qBTL8PvZ4/bNRKOTYp6zrwDWFW+eRE8X
	ouLGeDtIwSp1MfkFRtOO2XZi1MNpssbO6IBjQBZexpTzPPA4ndZ1IW2Sql2Z+9MSd/iGsBG
	aSM2ZY/w2zdkirJfq4j02mcAscRDaRxQrq6HFsap1KvGf2SafE4RGpOyGH3SSiy303qQWUS
	t0Xazkdiwd5ZL/wVGsNkIHQjFRhP15bLoIhTMpCQ3AHPFkauaeNz4LDvZ
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_195032_647403_6C9DCAC5 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The rk3399 tcphy driver does not use the "orientation-switch"
property, so it has no real effect. Just remove it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
index b90bf26b58be..7b5b83bd90ac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
@@ -803,7 +803,6 @@ &tcphy0 {
 };
 
 &tcphy0_usb3 {
-	orientation-switch;
 	port {
 		tcphy0_typec_ss: endpoint {
 			remote-endpoint = <&usbc_ss>;
-- 
2.49.0


