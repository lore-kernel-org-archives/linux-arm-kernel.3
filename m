Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F104CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSpD8SrbGJSSt47g+ep/HUhaAmDAdDice/9Pn7cUpNg=; b=oGcvgg7HDw8NookfK+bjvr2l52
	8HpCPQLgXmI7pd/sQmCndbbJm/BtqMko+q7vpQIGnexueekhkP0D0s2/gtVOejEcRzWBtqz1eXfvX
	1RcZ30kqotvrIJW7NNsqiA5sR+zcRXE2Wn9D9bOsFCP3d3y+9d4MLC2OIKiVBfRoy5Yx3nTjDB8BG
	7MVx77XtVqQM2wIvnrStq6DzP1wUB+a1RKwEppBYwJqrh2G/Ko3z8T9iEpNMfFD4KUpGnkmWzUC4F
	CQEkXVx+c6+uNf0WiKQy1AHlye2/ZMSc04uyESIG7w/CC8AHPwc25MOKEqcfcwcgAw1EF1btTmNvG
	AsnLY5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFA-00000003GJx-3S48;
	Sat, 20 Jun 2026 08:40:00 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warF6-00000003GIN-0deG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 08:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781944787; bh=DSpD8SrbGJSSt47g+ep/HUhaAmDAdDice/9Pn7cUpNg=;
	h=From:To:Cc:Subject:Date;
	b=ho0pY7wfIKWGeqcNMeywAT+vn/gSMP/QmAFDlP9bPm/I/veydmhElZDZvnClns8zV
	 H5iOpLt0/TqkZDIbsuQ6Gby7Rh3eO5ODxKgxLVeDaAwyGut9weQ2LQoUi6AVQJsCaP
	 5gBjVtAFcZ8MN/y6aOzegmwUGqjx/uCRbTU6f9qY=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 9E3A1AF0; Sat, 20 Jun 2026 16:39:35 +0800
X-QQ-mid: xmsmtpt1781944775ti7z7fdcv
Message-ID: <tencent_5169A5493D56510D24B06E86D31960E0AF06@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJxg2POt1M8rOE/F0jF6WoYwRM2fNOQEiTuWLToIkRC+gTp4Mr3W
	 jJxouHgRpdMgSNyIPYbfq4fvQmMpqM9GMdRB6R9p61aIW0MVRlfvPPmk9zHMfgh8/RLcH37CXZe+
	 ygT0BrECpmuVpiBaFacYbGUocBgeCpL8PxRlcdq2VD27/cdjMy5itlJRlPfhxf36TaTTAK6e6rPf
	 Bj5urCQYj22UwVA6bfMd1m3NPlbRdns5b5yaEyhmjMqsmQBJWJtUcJCSumo2wuRkiDHE68HvPDmU
	 Bd5quvZeWihBUhxuxahdVdknkVZW0cwprd83LYmQu7FoI9vCy1AbafCNTwnQRzcYLZoY824fCDbr
	 P7/oeQqnjlXEQhPO5k5v3+cdLltQ4TeWnkCyqI+vG+NQAgetfulk2rUbmKc4XBRzq72VzwEKeiKh
	 b2+gRWpgWWd44yuGTh3zeQrYy5kK5ycBtTDceOcdUipwqlXhRxPbh5E1BlINE0tBJQJ5+qNPyeH/
	 GclEnQhBl7kCg/3ExGJPvNIy54RZFFOQWKQy+UJqQbjCEC9/cCJ7dA1+LY13VjtaPwQxS2DKn77R
	 AOvox2u8iWqezI5fOmyXMrV+5X7v/p1fFECKHRPnvH4suML4yzf5C102uzbt2z9E1k+VZyo3nhkf
	 O8H8RJVABEmVIohrGsCJ2P/ugLRwmALeV0QnoGBs5wupUanB8xk/0BQSj1E6qx+t1wEz1JszTLyd
	 iarubmxWSNqxXnvJ2n5hkDCRSot6OzVjMr1XDZIaqdpruP6SC5JpFVzDu0+UgvDsOz5sbL2svaSa
	 RsbDJRQYp1Nw2axWB9j80+/keDcaewzuNyOWF9U3TDKPX9aQInM9vQZm7A5pd2SDXBDOuXuQ4kIn
	 RIo7yFhEWBRKrb+gH5fh772fFsMi5MwA2w6YhbDPHsO8Xsx885LemIxxaJswkBYwXnmEwiD1x6xS
	 7t1UtTpBKxllTvFQcYgGzW3VXPuHpjE9M8897EKypvaFujwkKSbUvbXzbX9pJp4cd8Rn7eMnoxTi
	 bEGOWA0TKn47V5DMY6a/76XJDq4+5OFlNcCG95dg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Jiawen Liu <1298662399@qq.com>
To: broonie@kernel.org
Cc: cl634@andestech.com,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	anand.gore@broadcom.com,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	olteanv@gmail.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	yogeshgaur.83@gmail.com,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Jiawen Liu <1298662399@qq.com>
Subject: [PATCH 0/4] spi: fix PM error handling in several drivers
Date: Sat, 20 Jun 2026 12:39:27 +0400
X-OQ-MSGID: <20260620083931.1120616-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_013956_861420_F7A462A6 
X-CRM114-Status: UNSURE (   5.88  )
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

This series fixes several SPI PM error paths where drivers continued
tearing down or reported success after a controller suspend or runtime PM
operation failed.

The patches are independent and only touch the local error paths in each
driver.

Jiawen Liu (4):
  spi: atcspi200: return error from failed controller suspend
  spi: bcmbca-hsspi: return error from failed controller suspend
  spi: fsl-dspi: clean up after failed suspend and resume
  spi: nxp-fspi: disable runtime PM on probe failures

 drivers/spi/spi-atcspi200.c    |  5 ++++-
 drivers/spi/spi-bcmbca-hsspi.c |  6 +++++-
 drivers/spi/spi-fsl-dspi.c     | 21 ++++++++++++++++++---
 drivers/spi/spi-nxp-fspi.c     | 31 ++++++++++++++++++++++---------
 4 files changed, 49 insertions(+), 14 deletions(-)


base-commit: 9e7e6633458362db72427b48effad8d759131c35
-- 
2.34.1


