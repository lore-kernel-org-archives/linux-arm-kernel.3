Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4092C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=La1cQMnqVVGsFeFscKpZ3J24MX4+qZJWDwoDU59tA3Q=; b=aU8TfezkzD2sOLMnleLIadCgSf
	rYSr25Giq9WVCReJrLhyqIPPAql668B7IxLjyX/yahFEdnONldRsBC6+o40MHsOUeiyzZQ+5t9zU4
	ZhxyTrEL4yKUdowBUeDCo1RLyJ7VTJgMw/RDviYm4GLduRTMYa1yDRuIZJ3Ms+NOtZ1eJBj0GZUNT
	J9c61FvkYhT4ZcU9yNuj/WfSahgHk9djDFqeg3QIJGEpkiSpcBZy0c091UVg2Tp6OUICPqOHtnmz7
	oQlRl8RLag29rHd9OCK8IDGzOx7oPwmlD/F8qFsMMvg091BKt9p+7U0K0+ITYZfo0wHsXkUhLK8YK
	vPb5wdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwxY-00000000bYM-3BO1;
	Mon, 21 Jul 2025 20:18:04 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwrW-00000000aHa-2Qzf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 20:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753128706;
	bh=bY4kKbIiOBgmi7jD1TrZFrE7zKbhsZ8NY4YXz0Y1NyM=;
	h=From:To:Cc:Subject:Date:From;
	b=lZ/3l5cqhD+kjK9cCrgg/C4pL7g7MIuyHGi8RwlgvK7/otINOdZwzyBoC3VVrFOr5
	 dtsz+b8i8N05h+w7Fw881aO+DCTfmTrpEa+wuBr+BQ/0Z5H0PF41euQ6d6eHVCVwN+
	 2vKnp0nYl4Ps4ij1yB+AbWjhc58zTb9q41z9dMlIvJghQkh+DBOXqG06vrnQbBD8w8
	 +5dTnFCc0uuPb5J/xN5miXgBhaajq5xfSODhfI5LBR1SRn2/FpTUr39cJQGy8Hu5V1
	 tHNM+6Zg6R6I37GImbXB9L3ELcA3hkEdvMDkPmc4D00GF9tvxfGKROh5L6cge7QSuG
	 utSlxERvx4atQ==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:da10:58b0:4f02:7df4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 2AE2027E472;
	Mon, 21 Jul 2025 20:11:46 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Erik Beck <xunil@tahomasoft.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2 v2]: New board support,LinkStar-H68k-1432v1 (RK3568)
Date: Mon, 21 Jul 2025 16:11:34 -0400
Message-ID: <20250721201137.233166-1-xunil@tahomasoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131150_707876_13A9EDF4 
X-CRM114-Status: UNSURE (   8.38  )
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

Signed-off-by: Erik Beck <xunil@tahomasoft.com>

This patch series, revision two, provides initial support for the
Seeed LinkStar H68K 1432v1 board, featuring a Rockchip rk3568 SoC.

Changes were made relative to patch set version one to address
comments provided by Heiko Stuebner <heiko@sntech.de> (Fri, 18 Jul
2025 15:13:22 +0200).

Those changes are:

* Splits the single commit into two, one for the yaml binding, and the
  other for the board devicetree plus Makefile addition;

* Adds other recipients needed from get_maintainer.pl --nol and --nom;
* Uses git send-email to send the patches, to avoid adding line breaks
  from the MUA;

* Changes comment style to conform with style guide;
* Removes several unneeded comments from the devicetree;
* Changes LED naming scheme with more standard nomenclature;
* Changes naming of regulators, prepending 'regulator', such as:
    - from: vcc12v_dcin: vcc12v-dcin {}
    - to:   vcc12v_dcin: regulator-vcc12v-dcin {}

* Removes unneeded tx_delay/rx_delay from rgmii-id


Thank you for your time and effort reviewing these proposed patches.

Regards,

Erik

Patch File Summary:

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../dts/rockchip/rk3568-linkstar-h68k-1432v1.dts   | 740 +++++++++++++++++++++
 3 files changed, 746 insertions(+)



