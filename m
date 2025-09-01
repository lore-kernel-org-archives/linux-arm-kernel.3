Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D03CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 02:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqTxvJKSMwA5Wg558Yiq9fp/nWOBu7V/8CLFFiOlqGQ=; b=4NAo6MdI7JZ5wyu3lJdNGcV+yc
	nhkBqd6V+g99d1ie9nD+p1JXcOrA75wZLKmvnWuwlOMN9IWqX7ilqDKBygeUPLjsuIVtYzIwm6K3P
	ECQ+0NnTe4TBTyKFbb5uND9eFpAH5NPIbArmBok7mKAyYGTSARLNTsjt6Cqf8louvK+DHX6cVij1C
	19SAC6eH4hbt56T0la2pT0PSZ7EKRPGGu3+tKHk6yk3fiSpnGLKK1FTV2PM1ysVzuc9RXEw7SynSV
	79H1VP2bURh+sfEd74wlqfCYJNDYeHclNjix0ZuzCpy0NO6slf6x2zvL13uxX8ZqIDflKSczpWRcJ
	oC7i4IYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usuYL-0000000AyU1-3lBS;
	Mon, 01 Sep 2025 02:45:53 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usuSa-0000000Ay10-1lol;
	Mon, 01 Sep 2025 02:39:58 +0000
X-QQ-mid: zesmtpip2t1756694311t8596cf93
X-QQ-Originating-IP: G25zQTT6Y1mPNENVgNoK5LLwMttRCYTYnFgzC58leWM=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 01 Sep 2025 10:38:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6995873977878562389
EX-QQ-RecipientCnt: 12
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
Date: Mon,  1 Sep 2025 10:38:22 +0800
Message-Id: <20250901023823.75199-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901023823.75199-1-i@chainsx.cn>
References: <20250901023823.75199-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nw9C1WBu09hPyJMHJdyC51pnYCrdcUTsbvLof+e0iaiU7ajfNgWMSTNZ
	Lcj4ApKnoRT/Dm05QtQXHQjWFGed2b8/C9PgYYjz42SFnaBVjxX99eA/ihG0wzaC4yZylWx
	+piJiRNXB/BI4s/e5BRpniHo7ukh6oBW2iIXj7HcHBCOCMLTF3yo062AQ7TxcaTo2UXJk5A
	fMYdI+UOhVs0kjj2XRkBGR128NK5JttnegeaU2F7ONkLvQKil9iEn92fI6M8fjBeteumChb
	+FUhI1RxY3WNtegqysA/ha4vdoRnS16F9xuUbHNzsaVmycZB5fqhVtqPmdF3fUPxcnWfIC6
	i2J1gJkZFsjbaAJ2Pk3MZGZ10u+YYp6/btgY03dnSFLivcNexnJbaOuTciSQQDglfaaQj7F
	gSQqiQSDn7myduilJmswrm1JV63I0UKrA+5uo4zUX8dacqkMklVuV7Fc1ka+htHDJHOOr8P
	fJFAW6pLv5nAR9fRoQe8S9i/1svS+m0101eP/G6RaWr4SNMOEz7EPpJ26MDSpuBXZHv0ljO
	PXmANidRo/isujsVF3gedI+gZ6/jTNO2mGFfA4+xKee8YueB+xdsRFmPvuQRqZwcO/uy19x
	Ln4n5W5EHl1TaHnitVL+2LMRFnaRnb8oYctI3feAykyvlNhOHhKtJlmtt01S1cjupxu6syt
	02Bv+HcKHtO8UZqyWcCm+zNl+VK5jFnrEE9O7VcQ7ZEGk99/QtmVFwAEH92LIHWjoHY3x6O
	ZJE2YU4fSesnkvr4rcgGBbPe0K45o+foyHg2N8vQRzLBaB3o+glzeomLXJ8YbUuHFhdGe2j
	aWIhEUXcPerC2zCbpEtLABAbvODejEWJoU1rYCBnaP9m0jrm1VFzVaBtD2T0qoe9KHwyyo7
	A867EjB8Z1EalcTj9/Cwkhjqgni6z7no6tkc0QZIrFfBL4tqoN9U7lt3U+7nkn7wMoKeVRY
	5/I1bKoHgaeU8RFFVJ2PGYu/5do1ctmqHXJEXyZEZWzKjoD9uX1cHlBURgvAY1qkN5P3dpf
	ciKImyWTMfwJ0YOiFl
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_193956_991264_C86D9A97 
X-CRM114-Status: UNSURE (   8.36  )
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

This documents 100ASK DShanPi A1 which is a SBC based on RK3576 SoC.

Link: https://wiki.dshanpi.org/en/docs/DshanPi-A1/intro/

Signed-off-by: Hsun Lai <i@chainsx.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6a..033730861 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -15,6 +15,11 @@ properties:
   compatible:
     oneOf:
 
+      - description: 100ASK DshanPi A1 board
+        items:
+          - const: 100ask,dshanpi-a1
+          - const: rockchip,rk3576
+
       - description: 96boards RK3399 Ficus (ROCK960 Enterprise Edition)
         items:
           - const: vamrs,ficus
-- 
2.34.1


