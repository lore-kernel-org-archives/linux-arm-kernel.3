Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1FAE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+GZ76Y3blfTqLHoRuuwSqk9FlkxSrFnwxSn1f2Uj200=; b=NmcrXkV+4hCHclP8PCT9kvrCJW
	ubWbseosFC9wW1P2L7Tq1iGMHuw82DXILTPLrDcDhlYc/4bbA3QZ7rvVOiS/ATROKE5lAd5+nFKDl
	xRYRQuM7iWmDTxx4bhFUvL/3bdDIHrOE8nJItZwfkFW34aypsVI5GX02uCgb/Aqc1NW8KHGUEHkvw
	8yc5TVgKhqDgdwUxh+iFu8CJQ912Cb/ExQ3naI202qiLhahELXF8KaSKIgWbeOFnr7J6Az3pNHx8C
	zn1j6Z48giAGjl3eA+r7oZFUEzbfcG/VlLZMKLjChUjgHQy4aRCTM92jS9VaQLhSCZ5CFjZaLD6Vs
	jtl1635A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSZ2y-00000006zeu-18XY;
	Tue, 31 Dec 2024 10:00:20 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSZ0a-00000006zIU-3EHY;
	Tue, 31 Dec 2024 09:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=+GZ76
	Y3blfTqLHoRuuwSqk9FlkxSrFnwxSn1f2Uj200=; b=nIwmylhpoevGs9ECSQTIK
	XvZRJu81XztHHpQ7zjDYRQHPJNG7oAa4VWMzf8JP1lZXdYsWnd8MtF+Zfkkb3vUw
	Mmqz40iOD6rLM6JCzMd7th0W2qnJoZRNr5q5/TIooaYQL9fyzc6bICdvg7ZMqCiQ
	yDNf7Jrp1dnJ9rBtTno9pU=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dxsKwHNnTaXlCw--.25571S2;
	Tue, 31 Dec 2024 17:57:33 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: detlev.casanova@collabora.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 0/3] Add display subsystem dt node on rk3576
Date: Tue, 31 Dec 2024 17:57:17 +0800
Message-ID: <20241231095728.253943-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3dxsKwHNnTaXlCw--.25571S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFykGr4xAw47Cw48Kr15urg_yoW3trbEkw
	n7urykJr4rAF1rGas3ta47X39xC3yUKF1rGa1jvFyDJFnrXF1xta1fJa4rAw1Uur1I9rn7
	JFWUZr4kZanxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8aiiDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hbGXmdzt4XXAgAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_015753_252021_97C0DA8F 
X-CRM114-Status: UNSURE (   6.89  )
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

From: Andy Yan <andy.yan@rock-chips.com>


As the VOP[0] and HDMI[1] driver have already been submitted for review.
This series enable hdmi display on sige5 board.

[0] https://lore.kernel.org/linux-rockchip/20241231090802.251787-1-andyshrk@163.com/T/#t
[1] https://lore.kernel.org/linux-rockchip/20241231094425.253398-1-andyshrk@163.com/T/#t

Changes in v3:
- Split from https://lore.kernel.org/linux-rockchip/3330586.aeNJFYEL58@diego/T/#t

Andy Yan (3):
  arm64: dts: rockchip: Add vop for rk3576
  arm64: dts: rockchip: Add hdmi for rk3576
  arm64: dts: rockchip: Enable hdmi display on sige5

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts |  47 +++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 126 ++++++++++++++++++
 2 files changed, 173 insertions(+)

-- 
2.34.1


