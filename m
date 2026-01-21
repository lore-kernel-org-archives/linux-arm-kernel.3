Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB85D262B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMiVJUqDKq7YKJIu3ZUJNtEQU6Eyi5qop1Aw2z7vqEc=; b=jfnzP31QWD7TWWzGYet67tdKS3
	c+GSay6825n/o4Nznsfp0KQdMFceGrw1r2YhIrI2JuTs2X42ynljRAZzeFDbgHKRse0xE+36WJjm2
	L9etCkCmqGKkWth6m6w2WaFBUsWLeNTWoHfQfS/S74kin1Zpc7Rd0Jm8W4gLpw7Y4siKXOsQdC9/y
	bCZOzfKD3+NYBBexlKH//J7gF3ZjkcLq2jbisuTGTRUK7Qhom3cHKiqU9yW/6BJ4wKlu13D2XfHca
	7wjeR18GpgPTMkv1ZJ8LOiP8JCgLz6bpC9BBUDZE1TXGZ3BqFAWxhZq4Y3RkIuv68rzJw7c0YB8Ch
	pzd6/zWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNQr-00000004jkT-1lH5;
	Wed, 21 Jan 2026 01:54:53 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNQl-00000004jga-2G63;
	Wed, 21 Jan 2026 01:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768960456;
	bh=EMiVJUqDKq7YKJIu3ZUJNtEQU6Eyi5qop1Aw2z7vqEc=;
	h=From:To:Subject:Date:Message-Id;
	b=ODS4KFkYUJM9P5JQe7KcA++voyQwBuPmDxf3HV/nwkkoXuiSDK9KhPvpVRQTtiw3C
	 iGUF5XyeVo3t8+Fry5wVHczC5Mgn0+g5ovku1uJCDo84eTtBt4jbRtplfRAyDwrltz
	 OMkkOEYIZeYmXOFTScOP10MljWFG6Bx4g4hxqV0Q=
X-QQ-mid: zesmtpsz3t1768960449t34e3db31
X-QQ-Originating-IP: trgEGomIIScwtOw4X+5nDC8xLSpkC8M3hxjgA5wCodo=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Jan 2026 09:54:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13469771434486797081
EX-QQ-RecipientCnt: 21
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hsun Lai <i@chainsx.cn>,
	John Clark <inindev@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add rk3576 evb2 board
Date: Wed, 21 Jan 2026 09:53:56 +0800
Message-Id: <20260121015357.291-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260121015357.291-1-kernel@airkyi.com>
References: <20260121015357.291-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N2K7JO7TcIoEKhrUTvTn9Ag1/8SN/fVQEb2I75WRUufQLbVg9udwaZK7
	5D6EjWWcbXMDdIAlbgSfjlk0my9tKnt2DF3ts2camqYtpr6K2whrsouTg6pbLryH9zfwMvO
	+T6Fuqqz5YmUGqm2eSt5RMK9DNyZ5kqP7LVQuHMxl+YoROcEt3wXulO6EeA0HVnapTHoPv2
	Bteao2+k1B6oR7GCvASVQJ3peGEivfsTLL3yctK3IPGkX1HegUIhueU/JqU4c2ZHaMz7N/D
	3+WjwdG9EN9gogsOyvnRuDSLdrOhJJH8MvIWrLIO9SHxpqj78wfVSS3EJvApBe068FJ9/39
	RbNrJQXN0vD/bmaQce1bXbBYATpzJ8IvoKI6UD2F2QAOiuujH245/1SvQ6ruw5aq0Ps/9+A
	nksZo4KxtInA0F7JSkKnOB1r/3psqUemG+sPtKLIN0PZRtU697hLfRHb3/K9VAt3153B0eV
	nHn8xIu+o3EMLudIyKe9lxceimZ1saBI9cWR10qxLlaWV9c3IVRfEXRwj+nv2u4eQq+eC1Q
	dB1ydb4torZDKAJivPZO4OsdlMp1dr4e3t19RQmubVeR72lCVYAK3xnFuxRFLBTN21gzbm0
	WS5emVS66gtfvaRyJJu4H9nh6+DwOl9pw8Ur+xLHVJKtUmojdTK/ljXfLvFuU1eqouzMxz1
	CJ4JlpnjU2Lh7QJiH+oXB7mE9ilZElOkTD1BSDghRsJUF8H6KPAGkL5aw1a8f23la+VLyQY
	JrNFXzIiWsCdmOFBnUK5qV/dL7F5hDdWjbJYzU/Ij0fASXCDg5dhTQXseIogrd3Tfp4Tu2y
	uIoY1ATTMnB6Rd/eQUZ2SQAr96BAKTE/TEHcKb0bbpzXtLT/5vftCsJAZ+y88Gb2pprh6fO
	mpXV7RXJrGqtA0Vx00qVyenD5/h2bQDz/UrYK4mb6tdfkgP5wk97+CUIlbFuwbOHwG2J/pG
	E+tQQw3LG8rcQCXMZm5RNhaLpnqHhcmZ2fI8UpzhoN6ZhFB6D+159GqrIgbUSKR97y+6ACD
	4goX+ej/NZSvczUTUL
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_175448_060631_C889E26F 
X-CRM114-Status: UNSURE (   9.82  )
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

Add devicetree binding for the rk3576 evb2 board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
(no changes since v1)
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..59ed57082003 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1136,7 +1136,9 @@ properties:

       - description: Rockchip RK3576 Evaluation board
         items:
-          - const: rockchip,rk3576-evb1-v10
+          - enum:
+              - rockchip,rk3576-evb1-v10
+              - rockchip,rk3576-evb2-v10
           - const: rockchip,rk3576

       - description: Rockchip RK3588 Evaluation board
--
2.51.1


