Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B808CC54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=; b=a68KJ8GSdMhe9WjU6CWdaORoJ6
	ps5Z9VLQuK81JC2qi/ZWOodly+4VPE5HSjEVZgH5pvAYg1lRxDEt6EOzxUFS1Qzrc3W+dSwLAtM3E
	ungrAzmmpsxc35MkFgtHL4g2DQXElHwtqVBooYq6eTWwLzvamtOOn/tHbQlyDOdy9+pBB4E1fiS+6
	bYHN6c7SfdOqHv74pGzE7lBdl4S3YwNHlbtVN/4EcRvlNThxH0F/FW3XXHchvLsltEW7y9KCAF60/
	kK0vevgIsWOLgrZjTSdBqQsPZ4WjeyTK9zTfqJzooi798AJYA+8fSRftfIbRy/6lIUyvS9HuOH0qm
	dfcs58Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD94-0000000BNkW-2Igq;
	Tue, 20 May 2025 02:55:58 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD2N-0000000BMjC-43FQ;
	Tue, 20 May 2025 02:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747709275;
	bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=;
	h=From:To:Subject:Date:Message-Id;
	b=mkM7xDdaH0y6I6R4g02anci2qkHgfa9eyRV2I05TN6eA+3ATjXyIYUA/cULtHj9En
	 odewUybff2ZpMQMDWaOPjp181x84xSh8NwFidYG+GYn8/Yus39tJ9NnSv53if0XNTk
	 h4+3BPAV397Un1dSHhu63IUfatmuNGJo7dnJAd3w=
X-QQ-mid: zesmtpgz1t1747709273t11c1660b
X-QQ-Originating-IP: j08/Knoc5sKowREV0R+oKB6ClVB4MQa1mQa6PVd9N1Y=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:47:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12805088329180934383
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
Date: Tue, 20 May 2025 10:47:17 +0800
Message-Id: <20250520024718.142-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250520024718.142-1-kernel@airkyi.com>
References: <20250520024718.142-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MbZKK1WA8nFuo4NFU6pFKIRpfg0WfgbW3eILhu67M66CTZZYratAPdVZ
	VTmW2IoIQt0u35t/nySEwTnik9QaxAjkrbauvGDg/D+CCJoZ1XzdxvhfdUOUOQgwpHNofPm
	jeEjvdMh2qRZYecV6lAAhAvMLnjCGft5gIfvWpLwdGb4Xea2tf3/zVAF9MkqHCPQ/Ts+umu
	QhtFVtmUnJaaXetz0U7zcCF7Zo1GkycKHzedwTChCVIoroq1PQYBk4Yvwt8FJ7tRmV3Bnil
	q9u50R5w2438p0G4HbDiSuDmpplAOQhRKIPCapZPgNXbG1RuN/QmBNivsB0Sf0KLxinQ3CJ
	3n5iwgEewhqbDY8vjHb4Wco1ArV+uXdZvcdYq9oWtMlvduYbTJfPm+PCpJwL+c2zSSqqJni
	Bqjdngz85kNjuK648O9StIqGla284DIApbJAmAQAG4mTekSPSOLlQCdb4otHS8AiLqq9xZN
	0Dlsli7STIrds6al9AWolrC67HtviY9paFZ/6bTrziH+2s7EyPftz971UlsC23/cG1va4WK
	obdaUot/qR94hWtfsXxAF5OlIwZwz0w9+CHoMxQfteThDCvG/Nyr5O/PfUsDqH8xkUCYMup
	2Lpb2wRWM46vPr3Fe2K53/wKLhtqnT37uCK3588o1oAslDZUF2d1xgF5IM8KdTFaIvuoW4E
	guBW4YTbRMw3khWDh1aT6cTO73kGvZQtx6/fURaddbK25lKdp1Z2kM5Rpg7ctHm1gtiKFFr
	7eRy3NWq8L5TcENYLbLFVRJtxEt9F3qjkbPjJbvTnuXc2vhg5CETRZnL+qq67DR1IA9IY5M
	QCma/DPDdBme0iX88K5fzAJV/ytHRR15iprwdhYbQe/Suq69fyrfRALjQrycqBFz8z0CsU2
	ajLLM+DSDOQzIZ5xzaNdjOKKrEMWbfIkO/VYfxRtWg4G9gnGhgkcHmO919Gr3yYQV2tWkzI
	h+NyttvwctbFLkkTyZEEbSBraPhMn+hwQ2bIfAwG5efRGWUx/l67E8S+nJ+TVcNJLbjjy2d
	8OSOwiDg==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_194904_534470_FE3CE0E4 
X-CRM114-Status: GOOD (  10.74  )
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

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 9d5f5b083e3c..e340b6df7445 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";

 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;

@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.49.0


