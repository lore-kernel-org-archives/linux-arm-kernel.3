Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F93CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 02:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=At16Gf3Z71H4fN8WbMLagv6z/YUJjV/ChPMgSx54IBY=; b=vUNjcf59lQ8oUK8Ltl/HJWiZ7+
	Q/jdR8baWKcDTRAtQFMWm/JhmHFdY8fjFXzOf82zVNVynnW6ARErxcplcF62kz61aGSlCyyly3gzx
	L1pk9VT7Q6pbkD58jntzrTL7/B/oTd0YVdkGv5nQgUiisoXsSjxGE4Kyjgx65mlM07lGZiUaHm/66
	BFJsoK3sgnNsvGp4Dm/CUkNP914AYBNV81tm3p5AJuymP/fuXPPtYyZD3FcgtDdZd+iMUTuyubnLo
	kAkEah1q0U8ZqJxgAcKbcsROExVMagy29NFRBGDRK4s1MzwFSm6VYTPWxffpyro2srVbspj8rzm5V
	YNmj57eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ubq-0000000ExeK-3s5L;
	Tue, 14 Oct 2025 02:17:54 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ubn-0000000Excj-1yH7;
	Tue, 14 Oct 2025 02:17:53 +0000
X-QQ-mid: zesmtpip2t1760408189ta749c9fe
X-QQ-Originating-IP: GM/C8VTwsjaS1Wi9rzAmIB6frejU/WcqC/QEBzy6m6k=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Oct 2025 10:16:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4392001371169270697
EX-QQ-RecipientCnt: 11
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 0/2] Add support for 100ASK DShanPi A1
Date: Tue, 14 Oct 2025 10:16:12 +0800
Message-ID: <3559F82126DCDA36+20251014021623.286121-1-i@chainsx.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N7k3iE00JiuZFQe0rE85YjVL1V8x5yUhmtOb5CTUfbt0zIcVN5K2nF5F
	A90PsrPZ6rjBnebmgxG/fXSlapyCG3Itcw2HEE3qC40nEfI6t8fHiQnWccVqTwYrLm5TNhO
	E+0sObvfCGlCOog1fVKD+1HHmVcNDLtpt6grl8qBgTJO5a4jCAPjy65Yc2zhzp60HTM9kbm
	kSd9InAMM042lEIwi6PeutRW/spJRgfDS/5aVnLxS2HAe0IcK1Qp5nONTugtzuVvEbTGugp
	pIf+O5WBzDbrUm68ls1UHE+FzRDAwY33gUhOkyNhc2gyzmM6LuVVxLKOETq3NAjAW1x0ZKi
	i7XVrr+yKlYBXOTsjBVCKsQc6cysu5SEHw/Fa/wp41gOEGtL6Z4M5U8Q5Fpih5767KbTXJ1
	ecEDuECWG+mJ5aUHiv82rrjB0lhykKeE3hcdNB7zeaQfsCSr6VYSFfk7CtGEnBUOZm6fl1T
	49a5bdemslsORi5CwuaQ25+nDNU7j6fW9UrjLVqpO6214P8XUO2w/BRKto6sgjUsBKTL4yZ
	YIYr1OMdPDg7I6IP0nFp8kY0W3BckAR/YIsa5wKf1tNvilK3dJumV9hHaXzXQplXO4poZaJ
	qluLUINffrw9rHdHbELR+NNWRA/c7WObZ+36s+iEZNkm27funLEGmoJVYXFYABHmwPYI3n1
	IKA1pwIKj8gWozy5NLNeoZU+yj4MgokwLFL/m8xQWFh+bHcSVEl+E2QTgw1xGAsCfrojXUZ
	eDwrNME99NNCubx+K2yRJBat6h/p0wY1UmNghnDvXBKqB1ybUSY5lfyRXZD2o75QHXh3nPp
	gOoouFmG5S6sUj2gblS7tkxKaZaQG62QwpLjbr7zBXu0cUTm1KIWrnxAg8mdfMsfsSaCR2r
	DYNKmQWW6pbyuNew4+LQS/sVBKt4M2b1xsFS0ugn6S+5Qguh8Go9l94rNIL160Aa39sTvLS
	umDz0g4YIECuqD9wPgE0o8rtpG6N903PebydLBfOmgz7U5I6jWzE5r6/6eE6jfLjpRz7dDF
	XIRuzlZS4KI3tL8vMoUi78IXAfcnI=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_191751_999403_3A892621 
X-CRM114-Status: GOOD (  10.28  )
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

This series add support for 100ASK DShanPi A1.

Info of device can be found at:
https://wiki.dshanpi.org/en/docs/DshanPi-A1/intro/

Changes in v4:
- Fix PCIE

Changes in v3:
- Update the name of vcc_in regulator (Chukun Pan, v2)
- Fix PCIE (Chukun Pan, v2)
- Update the name of typec5v_pwren_h pinctrl (Chukun Pan, v2)
- Fix USB3 (Chukun Pan, v2)
- Remove i2c2 node, unsupported RTC model rs4c1338 (Chukun Pan, v2)

Changes in v2:
- Delete the pwm include file (Chukun Pan, v1)
- Fix vcc3v3_pcie gpios (Chukun Pan, v1)
- Adjust the order of some nodes (Chukun Pan, v1)
- Fix sdmmc (Chukun Pan, v1)
- Add phy-supply for u2phy0_otg (Chukun Pan, v1)

Changes in v1:
- Add support for 100ASK DShanPi A1

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
  arm64: dts: rockchip: add DTs for 100ASK DShanPi A1

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 795 ++++++++++++++++++
 3 files changed, 801 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts

-- 
2.43.0

base-commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
branch: master

