Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D704AC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQVuTn532BqjpTrDnFAQRKU9WCgFqRlZl4YckJ5oZK8=; b=qxXCKFCSS+v2+ynvbrDaE6Maky
	yId36iT2J5qTWKrZJWFyzxZvW8euBd1vI2tUgwr14ypZwUmLlZBkShhUUHWZChy3LNN+BPetvgXmh
	yDwDaPY2iKOBd3PT4pCRm+2uToiRI5fDvJR4E1LivwZjrSR5zXjyeluLQyg3NN/RNp+eU6zpwbYMy
	b96Pt/Km3niXt5VX1uK3EORv8LXJz96GffYrY+nOsS3LaZlzmD1Rd2DPLYe8SrLS9Ff10vAZVXZVQ
	2HdercM5DPZYdL/DLi3rtX81HlT8fpC47/Nph+H+RaL7zOhKnhtn+1RiyoDpW/ddTIbxEj/nx96P/
	LO5CBi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHM4-00000002IL9-3VUQ;
	Mon, 27 Jul 2026 09:10:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHM3-00000002IKx-2V4I;
	Mon, 27 Jul 2026 09:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jQVuTn532BqjpTrDnFAQRKU9WCgFqRlZl4YckJ5oZK8=; b=Dw5g0y4LTO5kakunbJPxd6OVqA
	TsqS+RmdQmEOb2iKADZv6dx+0OBVh0NIdNXRE+joU4dU+nE5MhMKCVEWBv8AI9fjF2fQVUKzVpzVs
	8CGhwa1gA8lCthsrqUAmxZ1ika4lnmGwEvfkNweALIkKRmxFrqov57k2khPdW+JkwVKLon9xCBwZn
	5AGGQ7EBiNk94b5gcvTervmy4Wgtq12hbvr/g4PYOhqMSgopFjCNcqm6al/MqUajZHQrX5U+zQbVe
	XjxCzeuBOFJ1E5GFbybLLDGVkx8aNqEOw8AHAX4hqi6NLAWva9m94MSitLohFq7rs0M01BdqXNw/C
	v2/bR4qA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woHLy-00000003wSJ-1gYz;
	Mon, 27 Jul 2026 09:10:32 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66R99XML02986159, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785143373; bh=jQVuTn532BqjpTrDnFAQRKU9WCgFqRlZl4YckJ5oZK8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=YbZtaMzsnaOn9Pdzjxk305YQUGe1fDBlfnzviCILeO9i67V7dsoeyKwktqlqymYWv
	 p+NViYqhdmKkWVtUTvry46TTS15lQLS/1Y3rkjBA6fpRuy5KgBI0OCJZIfkySkFNq7
	 xTe+g2PpHiTU3Wa0FFmCnOGUSB0wKXkfpGV4Rw07m73L1R7Z/DeDokEvsRDo8HuZEP
	 uGcG0mGOq+myGymXS2JJO3qxg4QBq70j34FZXGELJOzKqy8W39N4S7B7q8RIembBh4
	 rfMJoQbSjRL20rg1Y8YSOSdwa9Ll7xHdni/BVTF8XtOzuQX9p3CTAldHDJ6CHBKneL
	 87PYHJesuC4Wg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66R99XML02986159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jul 2026 17:09:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 27 Jul 2026 17:09:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 27 Jul 2026 17:09:33 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Jul 2026 17:09:33 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <soc@kernel.org>
CC: <james.tai@realtek.com>, <eleanor.lin@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [GIT PULL 1/1] arm64: realtek: Device tree updates for v7.3
Date: Mon, 27 Jul 2026 17:09:33 +0800
Message-ID: <20260727090933.908156-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_101030_814347_1232A865 
X-CRM114-Status: UNSURE (   7.45  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/yu_chun/linux.git/ tags/realtek-dt-v7.3

for you to fetch changes up to 3c778f0c9fa36b6b9a26bd2146df24ed4e830ba4:

  arm64: dts: realtek: Add GPIO support for RTD1625 (2026-07-16 10:34:53 +0800)

----------------------------------------------------------------
arm64: realtek: Device tree updates for v7.3

This pull request includes the following Realtek DT updates for
v7.3, please pull the following:

- Add GPIO node support for the RTD1625 SoC.
- Marc adds the missing the EL2 virtual timer interrupt.

----------------------------------------------------------------
Marc Zyngier (1):
      arm64: dts: realtek: Add EL2 virtual timer interrupt

Yu-Chun Lin (1):
      arm64: dts: realtek: Add GPIO support for RTD1625

 arch/arm64/boot/dts/realtek/kent.dtsi    | 41 +++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi |  3 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)

