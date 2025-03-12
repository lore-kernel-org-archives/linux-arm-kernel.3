Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F79C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6JsuTDCsoktk2NTBO8xvdh4+TgE9AiIWgOBIevFlQI=; b=DUDl6P8t7q1tIPGtI2o5NLCVeW
	pVL8dhgnQKDQt5jt+WmE8sKFt9P0yE6gzB6YwdlZMs5J51tEQhNilGvZK2VceWml5/6q2b9V+Bf0G
	IR4zMdvXPGrz1vniY1X+FSbgxmwqQPp/O7Ff15Ld3v1mynnPqR1052wDIUw73oMa4BwDCLUZXxtSH
	ROvNcvHqFnbX8qvohpMTgFqAsmGVNj5gXVhcLNkr8k9Be3J9HNTRLKZG0fHQ6IVJo5mKLRjWk3Ubr
	J2AFoJ0OLbmlmMyVWTStD2J21itw/MoirFSmQtjjaTlnpHg9YVtACYglrbhtMTeUE1BtdgJTDU9Z/
	0dwg4sJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGqY-00000007kal-21Sm;
	Wed, 12 Mar 2025 07:49:46 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGhu-00000007j3S-490X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=d6Jsu
	TDCsoktk2NTBO8xvdh4+TgE9AiIWgOBIevFlQI=; b=jmY8XlpZ2m5IH20gSI2Od
	qTmN4Fcu6KnthEylmHcYfJ1Tf97hlm6PloC1vMGd2htYndIXMxyG6l+WqO0jNDDL
	+kKOb0qo60vxbS5YpYr5PuhLCFxtNgsk9AWdcWhBslhP9P83Au2sX9GvK7JlrQDm
	3ljmsgt4BPHqJUIqe2yK3w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S2;
	Wed, 12 Mar 2025 15:40:30 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers changes for 6.15
Date: Wed, 12 Mar 2025 15:40:01 +0800
Message-Id: <20250312074005.663165-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Ms8vCgAnwdRtOtFnQ6_FAA--.2767S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrAF1DCrW5uFWrJr4xJFb_yoWfGFX_CF
	WxJa18Xr4UJr1UJw48Wr12vr47Jr1xJFyUJF1DtrW7Xw13AF15tF1DXrZFgw1UXr1rGF4q
	yr1UJr1kAr13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb8sqtUUUUU==
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwgOZWfRB3jvNQAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004051_388103_0C255532 
X-CRM114-Status: UNSURE (   3.99  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.15

for you to fetch changes up to d3ad803a97c7f53d872eb3e9782c2286cae6954b:

  MAINTAINERS: match mxc in file names by IMX / MXC entry (2025-02-19 17:45:43 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.15:

- A MAINTAINERS update from Ahmad Fatoum to get mxc drivers matched by
  i.MX entry

----------------------------------------------------------------
Ahmad Fatoum (1):
      MAINTAINERS: match mxc in file names by IMX / MXC entry

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)


