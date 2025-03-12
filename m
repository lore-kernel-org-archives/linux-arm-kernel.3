Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5B2C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHft64F3TLs6vn9uOrrKaF+BvY2zu4crhf+LJniOPRM=; b=ItBvZpqwY1G9A9KV8Prjrowe6m
	MN1kAdYaMUteVjELzgyHFrHxzQMAAiD8QWkxBoPU/F4uK+qn+3ghr2Iz1/kbZxjRkAfgWaopwNcSP
	gG8Oi13JPC7j0Fwtp3KcFT4MgWu62IAo2Lk+EWiu6OEd//lgCBRvIS04F10W0DXryR+p5Y7YXtWuL
	SVpDil/aTXCmZmtsE7j9Rn/CPm9yQZnR/FpFLoHd0SjtVxFYzkYM9/CVcUSs8A4AHYABJcijdZy3b
	UH38MUEdBy22C7QEZNJiaEbSwCIcCpiT5lLEJd8NEgXqMhCEu6FayWk3J9qPdMt18+VpUGM0AC2lI
	3AptnWMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGlg-00000007jeO-1t0c;
	Wed, 12 Mar 2025 07:44:44 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGht-00000007j3b-1V65
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fHft6
	4F3TLs6vn9uOrrKaF+BvY2zu4crhf+LJniOPRM=; b=Vco/OHRK4F0SUaFxW9hVm
	L+qHjuOrDoHUClKhNdIHZvmh+gzffM3DmcqOR2nySTlZmHK1Ueamg/RygfgXGVjx
	+K7oSqt65DsUs21dFZhcxOEweOBJ4szsVLcqAMWegLEf0/tvsXCinho29dX6hyQU
	Pte3ijui+erR6s1d589s4I=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S4;
	Wed, 12 Mar 2025 15:40:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX dt-bindings changes for 6.15
Date: Wed, 12 Mar 2025 15:40:03 +0800
Message-Id: <20250312074005.663165-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312074005.663165-1-shawnguo2@yeah.net>
References: <20250312074005.663165-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Ms8vCgAnwdRtOtFnQ6_FAA--.2767S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArW7WrW5ur45ZFy5uw17Jrb_yoW8GF1rpF
	nxCFnrGr1kJF1UJrnxtw1DAw18Xr17Aa17JF17Jw18Aas0yF1UXr1rtw1rury3JryxXF1S
	yF17Cr1DKw1UX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhpnPUUUUU=
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxcOZWfRB3jvOgAAsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004049_712618_945BD810 
X-CRM114-Status: UNSURE (   5.23  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.15

for you to fetch changes up to 401735c5f28f41561f60dc11b67520479694f422:

  dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board (2025-03-11 11:35:54 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.15:

- Add compatibles for Skov i.MX8MP variants, VAR-SOM-MX6UL SoM and
  Concerto, i.MX95 15x15 EVK, btt3 i.MX28
- Drop Toradex SOMs compatibles

----------------------------------------------------------------
Ahmad Fatoum (1):
      dt-bindings: arm: fsl: add more compatibles for Skov i.MX8MP variants

Antonin Godard (1):
      dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board

Francesco Dolcini (1):
      dt-bindings: arm: fsl: drop usage of Toradex SOMs compatible alone

Frank Li (1):
      dt-bindings: arm: fsl: add i.MX95 15x15 EVK board

Lukasz Majewski (1):
      dt-bindings: arm: Document the btt3 i.MX28 based board

 Documentation/devicetree/bindings/arm/fsl.yaml | 27 +++++++++++---------------
 1 file changed, 11 insertions(+), 16 deletions(-)


