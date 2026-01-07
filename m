Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0422CF6BF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nuKYj0Y1wUuUMoOaJ5Zpda3+a6WcEYKPz2uufgZ8dNM=; b=Zshrk2UElTAbX+Gx01MaJtVGiM
	bckWSDZvbNWIEQqwxrL9EplZgLvIG7N+ALH93U71WCs074KvfpbLc3WcJbQrxnJL5FP3MbQPIWUVM
	ApdI+8fJZ8e+pJ7UOKr6VjW4nLbMkWlvJbr7Tdl+yR13r6xJif6NzZWJhxfAUb7JwDPNJ1cVUe99m
	HsIwrazfuyTIMWDuvMBaJ5hgLcMHflWjGzr3LAa9aNCRNTScbCS0eJZInoAFb0cSn+ceP6y3xAJag
	JmtQJHKyL/+NU0ucg1MK3fDdcxqAMc+HfIftT6RUA75SfOk4ugtiQz4K0NQQcHCvNe68dZlvHEDfA
	o74fXXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNaX-0000000EG1b-2SRJ;
	Wed, 07 Jan 2026 07:04:13 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNaR-0000000EFwi-0kr9;
	Wed, 07 Jan 2026 07:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1767769416;
	bh=nuKYj0Y1wUuUMoOaJ5Zpda3+a6WcEYKPz2uufgZ8dNM=;
	h=From:To:Subject:Date:Message-Id;
	b=j9HL/VjoUj1mXYP+4FNGnQ6+dj3eo8U8KcPV0KqK7hbEPBiOohLxjv5jETCdBI2go
	 wvv+8oytcCACiZ6oN6vfxg4XnvnrsRxIF9LznHAUOLEybgK8cwDCnQ4b5yfPOBKsfy
	 kNMdoN1YxIVc+cQZplEPcA0VMAoQMJQGewjkRod8=
X-QQ-mid: zesmtpsz4t1767769409tae6e7355
X-QQ-Originating-IP: oRYRdMTC6Kb1CbKXxp7jJ8XO4tRaEvz24K2T1J6H2Tg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jan 2026 15:03:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1533395504835066326
EX-QQ-RecipientCnt: 22
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	John Clark <inindev@gmail.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
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
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add rk3576 evb2 board
Date: Wed,  7 Jan 2026 15:03:20 +0800
Message-Id: <20260107070322.323-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NFxyVI7Mb0/F3uMhF03SIqCSYPlyME6Smbp7Yj71Y+Q3s/Se14BSq/T8
	CBmYFHnnozx766WE9Lwumpy2TlnEFDODUrf/MCuSGH1BKa2SUAWz4v605IVYpkK/VWCcF6t
	rSowTFB7o4bxkPNPH9R9wH3Vkw2Uc1SMDPswmwxenoE0GFtCZM6hBrqSG8J3djavPtYEdyX
	SvZJJAb5UWD7J6oIrDnid7qBtqScPIpMlLK3S9gOGCmtHb5pV/g5NwOPqRcVZhIvPtYCwoi
	eOqKDM0EzGFJpiM51d1c5ifyxiYmotY9CA1SnKCgs/uc2V/aKrFI/mPkGZ/A+OOqDfAj+Vz
	GLbqRLkTIG/wcXbfIL/puekAL9eaXM/uOxrqCosGZMErG12jr28IF12FXjCJe+40K7GLq3f
	APQu1WNeqd5FeDYNcleKeiU7q5TonHhsFHmZDgiXZtgnct5nazxGWKi+1o6dUnHeVWlLUdT
	uel7tvudfo/ze9+5md3j+8y71gMFlcDLM7f6eLHatlTyhwdmTYUf1GJqmNGXRegFyceRA+t
	cgGTh+1celMHCanfbzbcnKvac8khEeknOddqb9WmpTM0r3JSrFiovcOx5CruD8G5FmgE+2g
	+6g071hY6YUcCurqLuqzVQZJCk+00VvVs+D+L5z0nKmF+OvkdVXKjZTE68RqaJPS9tvtTRJ
	Cl1WuQCrxAoBp4F15ys2VZbYUUawLmo+whaOhr18X7u7TsffmSqs96msGjaVnzDeGmBBCIf
	S93DELYUwU+/UBpW5QUpfeuDTHusIZqQxscHHggxH8DIkJj36+4Jy5DQTm3DU+OVGt6vDO9
	zZ94A2PUb9D0zBETC+mlYuBd3jOfsVOo02W/18vmbmGIBmjKJ1JV2mElF8QYhQoY93o3D1x
	Y3OJwfVYVnrKDxTvKU4kmt1AWajdwSC/vsL5nrUvOr4/kbSNI1hPSS3dFr5wJETzMEARlZO
	rKn9/I/pD6UyhF7ImumHEJm707q2KM2X6OfkK5yr0pr6NPtXvQCPcfdRT6eyM0n7EhW0X/5
	3GWPIe3f2nGONZIaVFwT5FF9cdVPQ=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_230407_686142_C5C84E9A 
X-CRM114-Status: GOOD (  10.32  )
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

Hi,

This series add support for rk3576 evb2 board.

General features for rk3576 evb2 board:
    - Rockchip RK3576
    - LPDDR4/4X
    - eMMC5.1
    - RK806-2x2pcs + DiscretePower
    - 1x HDMI2.1 TX / HDMI2.0 RX
    - 1x full size DP1.4 TX (Only 2 Lanes)
    - 2x 10/100/1000M Ethernet
    - 5x SATA3.0 7Pin Slot
    - 2x USB3.2 Gen1 Host
    - 3x USB2.0 Host
    - WIFI/BT
    - ...

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260104023703.118-1-kernel@airkyi.com/
- Enable hdmi_sound and sai6.
- Add more cpu-supply.
- Use regulator to control sata power.
- Remove "cap-mmc-highspeed" prop in sdmmc.
- Add regulator supply for ufshc.
- Add the missing vcc3v3_hubreset regulator.
- Add otg capability for usb_drd0_dwc3.

Chaoyi Chen (2):
  dt-bindings: arm: rockchip: Add rk3576 evb2 board
  arm64: dts: rockchip: Add rk3576 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   4 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 997 ++++++++++++++++++
 3 files changed, 1001 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts

-- 
2.51.1


