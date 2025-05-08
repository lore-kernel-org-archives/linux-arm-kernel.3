Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD765C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyDFhO8OtjpTCJbTfPuoHwFDRMlY45kLnroWzhMw0+o=; b=vGvnflQ7gSGfqWmXBAaDp9q/xR
	jWmuqy7UqVuE9+KlAOWIT7zxISGQvmAUARfDgnSKFNW4cCgqY9KPkFUY5+kqp0QjjEigy+DssT3+t
	QO6kA4iCfON8sPr3mk/s5Kl42tnN/f93ruw23DFUxfmbBBKyZA8XLO/zoHEBhzSv239cry1XLXehj
	0GXtwDMwDy3O5liwAAthrji/iSZEINSCQNqy5kG/7YwbBz90RVe59TgBu7+KUpEf2EAeNkMQvKxrg
	9ihGH3lHpXXen0tugIbtCyBlBgPvrd4BycFnw9DnSZ0xORJ5lTTkQS71LpGvzeyeOSgHIx6sAB2Eu
	ELAd+O7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCv7V-0000000HW66-2poo;
	Thu, 08 May 2025 06:52:37 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuzj-0000000HV0w-3Ide;
	Thu, 08 May 2025 06:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746686614;
	bh=QyDFhO8OtjpTCJbTfPuoHwFDRMlY45kLnroWzhMw0+o=;
	h=From:To:Subject:Date:Message-Id;
	b=EIBFFjXcS1XhvSE80uXG9ACdOd1Elnc6pazPCFetlfV1srzr2i5Pp2jHvYO85xQ2o
	 g2+Gn9I25Sv4trSTf4HSVZosb3BAY08/G5CXxC+71niwt3Vm9WS9Z82NMpiIi9GSDM
	 drJA8tOiWy0FQUUgG2XO3ss7g2Or8RoP3k0XRpck=
X-QQ-mid: esmtpsz18t1746686612te3481210
X-QQ-Originating-IP: zbzDiNl3M4Ey2lstqT3s4mpmSf/C2+GYcEOzllnANXk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 May 2025 14:43:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 997468467344160860
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
Subject: [PATCH 1/2] arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
Date: Thu,  8 May 2025 14:43:03 +0800
Message-Id: <20250508064304.670-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250508064304.670-1-kernel@airkyi.com>
References: <20250508064304.670-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NVonmnRjmRvhk4OsFKw7WpSYgKXhGQbz491Ofm8wDKqRVhLXcKB2Xsld
	U4atBlTofTVism+iTU7osQX0oL9yKD6p2JveJeCfi1xd0oecpbKs2fWSVj7ePNBUk8QmbKE
	jHIEw96lC2OcEljmS3kpskRXoLJvzuo1F+kC7BOsyQHK8gkDmYWPctaid2cUO8Q7eGRucMO
	2KxDn8B267ZS6vMl3RByBH4u8wo++u2xUYcYj4cJzpuuZdm8XSx0ACPx1AYelNMivQIHotm
	w66GIUli/LjYYzYY7SspiX85ulFhVqAYXQsZY/gB9UY4u5OQyg6VwvIwMGkQf6gAdRyYsX/
	3DGGDjQCVT5Dy8F6XcZK8NCfsMmdahPw5VHYSvLi9Sn8qj5LsZ0FGu1gma2vBfUtWFruHPl
	/IxoJYf29GkmsnOp9z0uZsXXRxIWvhfDqVXMN+Tfs4A0vscRGYjpaN603roetxaXiA9cwgC
	rnqXHJzdpO4LNfDmPaKTN9fgSk0YkiKPJPDkYLTMaRLRvMBwK4qnhsyTP88HRWtnTVNMzGs
	0mhciMl7ttyxEcotEVoL87QlTjhtTuYJwk3KAWjKJC+H2lvg/Fkl5n0F9SqiIWFlg4A7XvE
	BQ0T/V1tEqpyQ+PfGOpkPut8LLaBiKcwEEFNqUGNROG24kiAKY3GJ72sjy6Yv6b6XbYISa9
	b09F0zj45gW7Z0hjBSGlM8djRRKJSuNhHNvQ8C7P42kYGdEErc1FoWF9ovtMFp1YxajPRqI
	3LX4YvRNJGUnoDbkLsLbE1Wym+2nEC63Ipk/Vv7PZxjB9JUX0ReKHPYXwf6u6isjrChPwHb
	yngR7mC3QO29rmJ0lcaytxGI0F22TQekVy1/w8xpjr/jdlhZCgdBr6ki1I+QKcLHu/GavVn
	AdaoN9IvXFTb/BtGNqQB5Kws/5nLP+i0paaoYBkm3K9uWMV4jVkJgvxN12AW1StGBFSbNA/
	FHzJIWUfPkUrkV6qbRpzVKJFU
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_234436_311212_AE6070A4 
X-CRM114-Status: GOOD (  10.62  )
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


