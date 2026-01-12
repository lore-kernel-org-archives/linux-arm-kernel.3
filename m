Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31669D25038
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 02:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIwuOx0WUbd44zBInbdsOb+naFLrWH7lMlUXQU5tjTM=; b=iAsEAcOaUj8PBMdzSMRnpqWcyh
	wZe1Wx4MSgtaNavZ2o0aylb3cr32teY4GA8TlkhgqMuJ4esvd2AeG3leqrjx/za3KE2dlMmjB7HBq
	Kb+myMNAydlURkJM0Y0iAr6e9I/JXJL2s/T64HvqqcYMgk+YAxWwC1JGwCEXClA9Gs3cU/0v3btKC
	Yu+H/SmgyGSclOM/8ELjg5nVvMRcQzQR69ImE70YOLxN4xJvD2qJz1lbtVpETYuuKmTcTOH2EBMy+
	iPO35mosnNbcQPM1TNpK/mKE2b0+Zk9K0lLDgLDBPEKgx+8yROMXZ5gYeQBS05hUb//EWXTj7AYrH
	gxktXfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7gk-00000004fNL-2MuM;
	Mon, 12 Jan 2026 02:29:50 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7gh-00000004fHT-465s;
	Mon, 12 Jan 2026 02:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768184928;
	bh=dIwuOx0WUbd44zBInbdsOb+naFLrWH7lMlUXQU5tjTM=;
	h=From:To:Subject:Date:Message-Id;
	b=UNWg8xv2Up28bfwnaf6z19yB2to6QtsBK0nPsPJ8NbMG1+i30GvOFD5W701gT7Ne3
	 YrMOzYcAV8XI64sbjw5kj6sCDnYrZ6DStHgj4QY3gG4xVrP9MkTEQC6ArX62avIc+P
	 e7nMgflF/CUYf7j37bWDUcXfgQfpVuXY+1abDOhc=
X-QQ-mid: zesmtpsz4t1768184925tcb527a87
X-QQ-Originating-IP: 0tv3P5whGV9rlRzIeJcvQZAVEBuNFG93s4wY/0BTbpQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 10:28:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 828163711076642900
EX-QQ-RecipientCnt: 23
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add rk3576 evb2 board
Date: Mon, 12 Jan 2026 10:28:22 +0800
Message-Id: <20260112022823.91-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260112022823.91-1-kernel@airkyi.com>
References: <20260112022823.91-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MgQY1K25Ph0m69AjCHDG8dI2PsODEA/yqsdlEF/RoYHi8na5gLmR7G9D
	Cq6Sct85R+/PAQFJTtv5AdGBT3YuaJYoUYNtslj/uGK/cWQFt7OGa6lqVNuZQE8CrzK/Vxy
	1eR1y+ulqFJ3Xw+/LQceo3eFvMTz67ATLawo2cySQf29VJLuyKgrnAa18+KVciSZRy8tGyq
	UWxXg+rXGcGpt8iYiuOfbfJfDX9c8HLX+K/u2jU+aiGmhg0rTlB5gT6juU5qGQ/H79jnyMs
	Q7YBtJLdJgKTFGLYdgxkRhp8IjQDDxdWxrkm9cKjUctRlJ4J8q3Od7u3B5NWo7p1Zb9W1MQ
	yFM0b9CyvhywzaVrxRc7D8Kys5w1V35rYETOHx6ksbOZLW+1Sgr83g9xNpp1x19n+R/ZCPB
	jom/5saKmMHEZWxKrsltIOFNoW7QqhJ8EP38WNeVyfdrXMjAtEHteSuWYXzwoYnAiazuzR2
	VGz0ZqH4NawXfGipAv//KxK9fJRvdyrJ/qlh5uV4j06mGn6v3caA3yLykDfUgTMINueN5mh
	VzcOFpmQOt5dTVpyL5T0uAO4QNXjXHZx6mXVIxmNcCDoAm/jBq7O6nB5rdv09lrhP/99U/Y
	ubmbAJhlIYgyZEpzzMR+SQju6SY5+xbte62kGTY1EJ6SPapL2hJW7LQ0DLMsZW2mkj4OSWP
	EwYa62bh/5Oeyruy+YNw68Gr/iKkKEyjMDMf8Ojt6rd3Q+jzomix+WuoUkMAjm3Dqa8TxSY
	vyvkbgk6KWJIyRATJF9yevm7l4BEL3UJlfpX13S90KGafIqWD5Eop2crtiYTnRhh35fOe5k
	DMtD7+rWZGkA+NjUv11BM1s+zLY6Fi0dYWAtL9qIz7aE5z1oNCR3oC/249HHA5D1F2mbD1K
	KYnKQHUHCumwoYlNQCHnbDegOW/WvKq5RzmMO8FJT87egjtJGx/Quy2DtFi0LOsn6WLVXVq
	+HOPUPHlTxy7KzpWEDfPe7LERc1uCWRxK4hKSNc35hbrsQ32ldbkRX6MLHhg5xivGovWEaB
	3r7mzObwAYopFnGS80LCjTyb8bmgs=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_182948_448642_B54FDAAD 
X-CRM114-Status: UNSURE (   9.98  )
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


