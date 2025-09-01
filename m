Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E098CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 02:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6a28CoPbWptgmGT0dx6kakA+EH3Wx1Cp0C8cc05VdNI=; b=q7Atqz8YUwIePFCPgwiPyeCTsN
	vdj77bxhXPtOVXWM8p7Bb5FVwxa4EDrBXuB2pjiTOldMfjlnE5HsDKptiS4sOizvN63A8oAsrk+a7
	21EcGLDvKAo16BP/wKPqD3cBggKCcSGDXExXbWJqOVJdcP+l1XSkNIDskHztpVxbho16c+QI/81Rv
	rIhzg9pNs+Qz9FfhHlfIaBITVLyS5LdNuZZ9pSZXZ/A8iXd3Fg7mDSlJeBjzhby1x/m4HKySvByGl
	TCzqZkokTWjvJdvOOox/fhQOM60Oewgj8FkKLjbBf+tOXjnvcAy1P/ieNMRGX8s2T2MdIJWc0+31x
	Rz3mcFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usuVg-0000000AyJD-3AqF;
	Mon, 01 Sep 2025 02:43:08 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usuSX-0000000Ay0X-3rME;
	Mon, 01 Sep 2025 02:39:55 +0000
X-QQ-mid: zesmtpip2t1756694307td2e1bf31
X-QQ-Originating-IP: NrLB7mJd79dihQ9nNVJSWFisUrfti/iWIEdFtxameEs=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 01 Sep 2025 10:38:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4630617426018902388
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
Date: Mon,  1 Sep 2025 10:38:21 +0800
Message-Id: <20250901023823.75199-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MwxbfVbCPSF14T74UfoytvhzlkAFctPj+EqcQTm3BKYHwwu/0Mnm2O8A
	ir67ndki4jvnLIPWjzwZqRz8hNzK/4aZkucqUlSLGZ9LNuLtzz0t5yCCdHkO6mrLsM/WDaI
	pWC+Db+TljemlRZKADf7i7i6p2lhQ5/SIAWh4XyABzko0CcVwQlFRuIXe7GSBJAVkKc6ZV/
	LouN6qvRUL29EGDt53VcHH+smKqD/gJkxO2935inQ+/b7OPr1mSRiw/jwU2tM0NJkMM+GGn
	+HKN+ClX2ZBz0pRLnCqgzA5BtmEl0Lw3Yh+qngweIWtefVWSfcFKnfKb9PjCTgEYBadmSWO
	y6nnkuKC8VWAbrTY73tuW4Y64D2LrYTeko2xCGw+ou+/4Ey006SUQf7T+A6ahsPvHA7VUpu
	pabqkkb4l4Cc/shELFIZRlVDYq2qhb8M81m0srWsldbceq3eJ9J8I0bydd/8sDMfmYjEExX
	hno9kKRoqBKbD2T9HcTTfOR5Xsu4+GBBAmNpKRehQuJnckaENauGsPsG3RC1jYUT6ql+Tfd
	rmYOEzfcervZkLi/DGiRueEI5ld42dwhu8tvGslRFCfgeXg/sdokG7h4E8ystsRvRoTcGrY
	vZ0i2WITEUxGZsPQRC3omZuOZse7Z+TTqsbzyVmwCs2yOfDEp8N1Gb3j0nKkcDcOQxDS50d
	4obYGmNvknhdP04SpXiVAW9+66h6OE8vJajFO89iZs787Bd7p39nUEMPXtMxVfIXwldmX0A
	P8Do8zXyWS7Uc1PPNWOjwit5Fm/GQ66O0STAfNzbUgjbXWB+uQC0+SB5s+JOUloHHExS554
	AZhlHSFFMWZEcc5TGVUhjb5JtA83grUEzUOw+amdHZ1CIaPIdaxmNmm/KFqLGBtdheqBAwT
	LbmGncYeIExsWh1E6HZD1u7/kVDKa5mgJPGPIpvNjCEuWX9NhGVntEfQtsohi/NiUuEcewp
	Hd0En3Oa4OXf7ykjd33Yj5qKbrsrtSpxhqoXmIMmE7JS3JWq2RCEwvLFL8HFFCqWlNzZKKX
	7lQiUlZbyjhob/rs0MGj6fNP+jiP8V3aTGLdYkh9LWmUUCAvwT
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_193954_176017_89875190 
X-CRM114-Status: GOOD (  10.57  )
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

(no changes since v2)

Changes in v2:
- Delete the pwm include file (Chukun Pan, v1)
- Fix vcc3v3_pcie gpios (Chukun Pan, v1)
- Adjust the order of some nodes (Chukun Pan, v1)
- Fix sdmmc (Chukun Pan, v1)
- Add phy-supply for u2phy0_otg (Chukun Pan, v1)
- Update the name of vcc_in regulator (Chukun Pan, v2)
- Fix PCIE (Chukun Pan, v2)
- Update the name of typec5v_pwren_h pinctrl (Chukun Pan, v2)
- Fix USB3 (Chukun Pan, v2)
- Remove i2c2 node, unsupported RTC model rs4c1338 (Chukun Pan, v2)

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


