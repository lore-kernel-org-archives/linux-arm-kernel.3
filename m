Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15994C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XiZXeriwtNmD0C5rumTsjv/pcxn0w65lxRr71QDYu34=; b=II1p3pmHgO18W4GtslsGj4z3nU
	Y4J2DOBeMdll5isT6qBeAbwsf/ujdiqJ/q56BMS0/8hsocTDKT9w804Nu+w8AOCWNIn8EZnCe/AKR
	H3Q7tNgWOn5pOVdppAMdIjmCdmUP9v17W5fL6CjeSa5wpUgAyoRhfnHcFOep3RM7poBmewEUc5IP+
	XLEgbxWJESld8JUFLhaU0gpHhyMwHgcFOhz4tjknfii8fVHP+lNVy7sB0WaztuzjHsMtsHgyUH1Oy
	lGBv6LdsubJ9gSmrg5XfpxxMkB6Hfy5syAUVH2HMooPlciHo3/09rb8vAS9Ad4/Y4FaZShn/IxqET
	ptDsWdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERws-00000009LML-3wRk;
	Mon, 12 May 2025 12:07:58 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERtN-00000009Kce-0Gg4;
	Mon, 12 May 2025 12:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1747051449;
	bh=XiZXeriwtNmD0C5rumTsjv/pcxn0w65lxRr71QDYu34=;
	h=From:To:Cc:Subject:Date;
	b=iOjMF7pthxChJdSW3O5nLo0A6fE6ejodJD00jYsDVuXM8A/T/x0PUZ7zqLqkzZQ9A
	 3+Z9oHs1el+fGV3ZHsFC6UJijxxy3ypCfXTD14nZKUmgp01fJE1AHdZYg5q/NkLzFx
	 88y35CFUUfik0u1VsEjKbDcqI51QQk2PBmBbXHMI=
Received: from localhost.localdomain ([116.249.112.84])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id EEBE0F2; Mon, 12 May 2025 20:03:46 +0800
X-QQ-mid: xmsmtpt1747051426tikm1o32c
Message-ID: <tencent_198C6C928AA0BA4E932560238E0CFE073109@qq.com>
X-QQ-XMAILINFO: NEW4AM7T0EBsyYRwy7F7xKNKE1tnYRdimiWvJz02wiuzbc88/Xz92wEqnUEoHa
	 nIY6Ml9xgBjxjzxhhUdxFN7WCcXupbz+XRQpb7ndOCxVymXXJCIbRxj327K6hdVmFgzhRVCdDAkU
	 0QI0Np7STwTCSSgwveSGyq2MlOn9IC2omOFI6yk4CiqMBdUCHTMdaSV1S65Qk7X1J61MVrqFzqs3
	 Z7rnB0RDahifL9Az9ffD0ss79ar04QQoE70VWKT5CerDeVBxZhUqv6jTRs1gZZMwejXOWcLWx6sg
	 k+n1v0fWNwXwnW/2zXUK6UIQQpzwMipLYRelYDwBikFm+UfaePgwAmSbmRf5HEqYVxhUTQXCwksZ
	 CXN8b7OuDU92wMJl0lIHvq69FLSS6+2Q4MGqp/N14YW2dTv5rXDVLrY0u7Bn674VyCUy7XN4Nslj
	 3pEVQpyunv5+MvtPSwN/YhU3cFRSXVf6rczJ08UMrxqkpVvsmj9CkL1Uf9sQSQybzKOc+1b6gp3B
	 gDpjLTZ9GhMT8A4zLO2OaUcB4PNH2IFmOcrNNgdVYaLZkVDhDP8PNUGDF7bpelQ/B5eojg/Qw22S
	 0J3j1PkUPzSk+Az6qz/Q1+iAwGooXy57mK4NiLof+20NxiROMu4pCs2Q59afTtQbU+/gmjLperVu
	 l1JQIzPb0hZarYDCJOgJbrdyqmNO8xH879VkygZJb2jpEqSTnpodwuAm4tgLAL9/8CE3BV0eEHx2
	 ta/V+7qBJ/DezSLCCf49r/LAs+bAYKgP1RYN4T+V6bLHzpWzXE51ZLsp/WTK23MNpbVmaMZAhu1W
	 1Y56yqzzeGlCoz5yQ4UP7P1JjZqzeaBtwn885tHjdukuz9TVYdygd5SD+r+IAS78chJbnD0TeToJ
	 dFNsJ5f9KKg1dOhZRFiLWiS47P4+cACDrzX5fzSR02VdFmeQH6AIwROJlXJ5qZ66oj8fkdrZj4me
	 gVz+KgFVgOIe1ZGfCT+TSgttlYgxvZfNTOo9nbO/x2/Qh3aH5bt8DPf0d3pHsVKNE7X0ynjvPvQu
	 2zDwWqxAUMlU6aUrmJ3ebUEP3Mz1l7y4OfE1CyP4QXm/1A79utCHUwFpyXSCzIn+Ir1FU3YvKlBQ
	 n3T9cR
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: chainsx@foxmail.com
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <chainsx@foxmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 12 May 2025 20:03:36 +0800
X-OQ-MSGID: <20250512120338.312496-1-chainsx@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_050421_462384_EBBFE8BD 
X-CRM114-Status: GOOD (  10.16  )
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

From: Hsun Lai <chainsx@foxmail.com>

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 911 ++++++++++++++++++
 3 files changed, 917 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1


