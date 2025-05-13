Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41B4C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3jCjysjEl3ixca32vOu7MlYfo1Hu8+chZBMSwZ5FihU=; b=Vtdm4OiksQHEh+u5UcpcMzqTA+
	ziRW9L0VzPdb5WttdYABPSzqbFfnBknc1hW7514VGA82zn/29mGf9i2yhzQCYvFkXc/DDyUVoRKzZ
	lM6NxLyB7/yxiuoCIAritSTS5uO28T48vpJ9SPHyXv59vBKdD8aFURPcwT5YSzFr+occfdM2CiAr4
	jT6sJdtfq5XUM9fXSO83P5SXui+VWzgfLoabjjAjMMPDDHEPXbjv4vtCp9Zqp+tRFUI6oNkKGVF8z
	ANvPSniTOQx8MrPsqL5xZBer2cN58ZHoXqBMqyYKZaWNS8BK0css8EBRK/Rm4VW4UrjIKMOjXb0BR
	CqN8rYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErfw-0000000CnzB-20PT;
	Tue, 13 May 2025 15:36:12 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErbj-0000000CnMK-0eVC;
	Tue, 13 May 2025 15:31:54 +0000
X-QQ-mid: zesmtpgz3t1747150248t8216324d
X-QQ-Originating-IP: lSEZ7Grbum6TmFnvdprfvc3lPQ1BgxRoZkabXqDxsuc=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.25])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 23:30:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4369311442671780654
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
Subject: [PATCH v2 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Tue, 13 May 2025 23:30:42 +0800
Message-Id: <20250513153044.167187-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N3aam2OlSmByrcbKktTbSJKgp+3ek0y4nA+VjmdTSxVFe8th5D7biTjo
	ScrD+Y5EfdGMzYM+UpsfRo43W/oA3MehCkWtu8VrGE7xSNz6zHK3GWEhODOI1pqqntUGn6x
	3YqcbQ4rw4ZjhE+oJKx9me9HQ7xeqUs9k2L7hssk/vSi+FqTKJUohIYfQpkjBdrPg2XQVXb
	4VcctbzibPceM2TIMjSQ6ItfFCpWuDNRUa0clSwy+CuahoNoH3H481b2LfWUZamH2TPHh38
	LBy2TjE+t71Kddq8iI0x1YhXvgZjYl4v4opWtLyXBxltWSWvV6FkzpOmdbIv27Xs8X8bmCk
	+lskDbxM4SW1fV8LzRdIZAXazJeFbU713qVrcujOUG2QW8Youv+DshG0npbJGttFXx1rjOQ
	fvUMHPdrLp9mIsgAdh932ubv+htqmqADrEb69PQXO0IC5uTu6oxlxdBRL0w4fM5IWINbh9E
	5TWYFmSHP96sbQ5hbZpmUvJG+0vvp7rvU4cT0mCO8TKZnTCn1Z4WOWEYsF2QqdLFs2QuIUX
	nYr1yR4GutZe/TlE/EHxCSVK3Tjl/+wl3n8Zd+oPSiXqzfif01g2YXFZ8Nxb397BMzoHpdM
	kAr600Sauysjhc+x0cZ/qzwgVhKm6PWLebeTy+1+InCAplZ/hmaJ8FNK3HBM+vjZKSYnesn
	CwsJJoYdCigWQAyS6jd3bw5sKG7Ei23k30YsEWsZecBgl7cx/MgfYFCZ8M6ogE8iUzILeI6
	QNFcL4rYtA2rjinBiJxJtLxko4OzM3xUMhp46/EbfDziIjmLNnkO8rN3G6IvB3lw3U9V59X
	r3v0Ox+a+n4AvhSeD4eJH8oFLLM5Pw5pAA4FR0nZ6rUtI1GPD3pg+UmjAClTfewhKrP51M3
	34p4V9eMPuDlMkigk0Gx1T5l9CI0o2Lu8RblcMLpS95/YON32LqYxVC037olz/5/+WlyPKE
	gG+a9sRCvlwTPzbGR6mLnguy8N/u58QqYLaAu3IxWOEtkEzlrmGqet3VQNr2F9sHE0W8yIm
	1KGzYJ+iFu+YhRj/ZW3lLR8+VP3E4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_083151_700119_585EBC8C 
X-CRM114-Status: GOOD (  10.00  )
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

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v2:
- Add support for Firefly ROC-RK3588S-PC
- Fix rgmii delays

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 910 ++++++++++++++++++
 3 files changed, 916 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1


