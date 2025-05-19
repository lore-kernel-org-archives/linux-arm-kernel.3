Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495FEC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 01:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=; b=3HubCl39q574aDIt1+Z5AaMcfn
	fqGiBgtTWShlOoenUmQ8AkYzNyKi2a12uL2sj85+Oi9iGMv/R3BYO+J5I0yFZrL74jCxFofUoLK6N
	44TmxNgCLGYAmzblWyG9D5w3kkm/d1m5N2z/Hoy4zaGG9iVxoFIqYywdaGUbnmLd2cU+p4+szLh9j
	diiLvT7tco8sDdiaDOeTybwAQd8iWFTxHB3O93qr0LP0xeSCjYp4j4vk/Q3D/WaAtTpSQ6xutRP67
	8x7hDR2L3Pa6FMzOC/IQGlA/v0AqakxtY9cfanYADaykFnse5AAMSWP5NfuZ/+sIZ4DZah2rMpc3O
	1RhushoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpMa-00000007mVK-48f3;
	Mon, 19 May 2025 01:32:20 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpIa-00000007m9r-3ezf;
	Mon, 19 May 2025 01:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747618028;
	bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=;
	h=From:To:Subject:Date:Message-Id;
	b=JzpXc7yi1gszkPORq5gql/79ac1DCzYJwxj725HfKeq7wizljNyPSA9S/MplXGsCK
	 EvIXISMeOjrjWmFA6UEq+A50h99e6DqQeVmKMOoLkxfZ0VEPF14fD03PQB/TNyocsL
	 7DTqskwDJnE8yIPza+lOUx9CH6lq+nYIGqwdXFHY=
X-QQ-mid: zesmtpgz7t1747618026t16ca58f6
X-QQ-Originating-IP: j6BCwtD4SfAxd4NPvSFyjN9YnqkjO+XmSHeW003nfGk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 09:27:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4218085974804082630
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
Subject: [PATCH v4 1/2] arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
Date: Mon, 19 May 2025 09:26:31 +0800
Message-Id: <20250519012632.94-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519012632.94-1-kernel@airkyi.com>
References: <20250519012632.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Mm/8i8/T4yneh0XRCTNyUpt6QI5l8JR9+V0Qcc+RB093jkpsdfTfQwhF
	n8/iTVP9Q1rcckBE+guIr3GUIEVuJanMyiBPqQ9eJtvrXTzVr/T3wQFnkLrqCbTap5N/3sa
	xfudTUK0fatPYF030B65UeFapBFJC2ViKu/bKGyZqoQ7AL6rKWkJvvAAik6DHdd5YWePW2F
	/XjBo1/64MsWUL9Pdu7C3f9JROUcpAh0qdNlBIiBSsSLPjK2vlV0h5YA3t8lN1jpLHThKzX
	fOaunTuZAS8n0LKoxxrb1RCSqib3E4iUBzcMLyTa23jiDtvfN4V90kAhha0/hOm31eJwYCx
	/ZuCMIA1brNs9nmIHc7328YupLlD9F3c9pETuu7dJtZGJLfyvYDVbHZKZ3qkL3lleix5pNj
	ThXkhLsgzb8uy4iS/kmkhTLNdOy47Y/jpzobLyH0TB6fHBy1XWSPocNO0uNLKy+WEBdf25s
	iFcuLwKWmoi3a76MH27LkDqvOv67tml9joppKr3QXtYszMapGNk0F40OCB+gCQYDXS/ptmB
	MOdevkVXhfajcsPgetnIKWxluviGOopzMuaMY/fUiTSwKS0nXeNP0tQQzTPqy+W0aG6wKPM
	NMVBL2NYqGE4onZKunkZsgU8WAYEhYwCESgfHHvAZM7XQz98TIcf8ji+qfimsHVyuz4IFpA
	ZQZ+xRHzuVGp+DNwCou0U5TLc1VG/9wF3GB4qShNd6seJcs/6lP/LIQj8GE5pVO55Y2CZPP
	zs7NKBuJyl2eDWss5wijShbGm+tA99dnk3CJVnYR148OJgSaOfrK7Hx1pAXxcgPdWJg6pq6
	42RWhePNvs4bh54ApPXjCN8gOBM4yIByPlBIPSNTQ4mdMIow5CGu4bYh80vmZNaeW6bt5sc
	qiWfsDEzzRTXpF6nqedkYY5lIa3u/zZxtrFgFPvpEaE/3rsfO90YWb1GysHXWYk3yzmpE44
	0U3EJj84QWPKSlDyyiK4pW6cgZF5x6B2YY2O6hbVvS0clo4uN3bE1FBCc
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_182813_732681_179F694E 
X-CRM114-Status: GOOD (  10.94  )
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


