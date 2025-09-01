Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D618CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 02:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pzALHw6kDbKl8y20NWvS45A4lFaEdaZcFqXkb4SrpQ=; b=eJ7KFnymrBHdSA/3k2A/FK3dGF
	dQxUzBZTT/drP6Oxvi3ACOvsBzANOFgaJWjfGSZ0ZKS655DadqHSilZt6h69aB533Qnh480i127DS
	Ua/TS53NPrT1+0oUWsdPcHcj3TpOLJnPaEjAXHoYTZ2iqiHs/uJIgA1PqeJaKMRwmJeFfJLSRhdti
	PP3E4Eu9UwzoU6rgajZApJgtIe3qVhDGGuA2/nN5kUOq+zuJRqPonxD3G5NDo99+9WOBiZG99aMV9
	bkRRDea8oN8aMZAtC5++RYa2osqecIAPdXpxB8sJv9VOr5qqOhE/YFuDV6e4WTktKXDO7/x6bIbUm
	f4DCHukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usujc-0000000AzSE-0oqi;
	Mon, 01 Sep 2025 02:57:32 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usueH-0000000Az0f-1fPE;
	Mon, 01 Sep 2025 02:52:03 +0000
X-QQ-mid: zesmtpip4t1756695042t09f9844e
X-QQ-Originating-IP: inLk59jgu4rpfAkLnWECGvGqi7aoweVxElPZLVfOMls=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 01 Sep 2025 10:50:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12657077797693184159
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
Subject: [PATCH v3 0/2] Add support for 100ASK DShanPi A1
Date: Mon,  1 Sep 2025 10:50:35 +0800
Message-Id: <20250901025037.81548-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MEfSrlLLfgMrvUHZOaV9S9TDClVc4goCp2856XzfhJTy55GiHayrICyF
	PCl6He7EgEYw/iovBsXGJjwh4Ku9yqGZAnR9kfEwcVu1GB24KHOUu8TF5IoGyM82HzAmMgc
	67wGmToWjV3r4hNCkIPtMXKelXlKOoSdbY3je9EkWtR3h8m9VIb5crtYgWTZb+x3wpcMgjM
	SdsCZqTWc8j1RMW6gvjk/G8/um4VAiplN2R5ju4QQGLPvChUQwTNT+8K3HrRHiPhW6F0oNG
	gFiNdxGbvVI8OydRioSASaaf3SEUJW8jY5xDrefXwx14DM502A02CFy9x2xxo6IManj8wLy
	XONnGQySrgmhfMn6owBa+dBVro0PTybFkh8C9RwOM+NHtSEmF6b14bqBrpqNDiM9G/XMXaC
	cvMppmgWzurQmMvq/JmNBpAhER7M+G2x784Nnay2bXW2HsJijX04Tnj39mB9st/Iwj9OTgg
	M2K+Wzqs9xzjIRZstZwn0M6q8eSD/S0ionDq8RgOWsune9CUqMKLiFNAFLtDC9IcdVL404n
	+8O33hfuVKirDcu+xO9uWTmV7crTMSQleONhN81fuWPpPa18lBhj/u/u4jR5IMgNvb7gR5Z
	B0dFeHBGznCymB4kS8w4mGMLJExApNXvtfUV5vBuCK3wCsxGJIHoapkAoxZEMmqv9030Xsb
	IlTAZtsw1JVEdOT0FoRUnqBRTzDokGRWHscpkhkxJRUZOO2guSZOHN4MwsyItHqwSAKhEGS
	P/uBbYWw8/ds4+rx/O++zuvH4n5YXN0oEfTSElyhTI0zE4aXjnDnxFT4KqKp3I8mJwGeRSB
	UVM+S/XEN8YQvPcJz+033fP4Y40pk/lqfESZ5C9CnulI6324DhRNphcWYTud9oHbbxmcX1+
	MSGWMQT4NiARWQKpl35SKqDfAkyPSV6zOUi57GgotZe6DqN/lMeof1JhqzB+uF73uCqqsXD
	7MN24xYygaaHhmtNlT9tbnioJJRVA4NKBrkLY9wh7RvUnoudya3paoX5QNE4+SU7xHMlpNX
	OBedgenukcSGs13ic3mAx8aDJl7s3+Vqnww86O/1MclerFIDdqdC4kR+mSt8b1mgNibUTmh
	+rVvot8v7Ba78MY7992kog7jjcXRuISjGOE8cV9Jd8qVwEe0jsKKT0=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_195202_262994_A4C82573 
X-CRM114-Status: GOOD (  11.76  )
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
2.34.1


