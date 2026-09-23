Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC67DC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/KaJ4uoOUinEh73MmdUTlZkerQq9iWPfc11MN39MGQ=; b=Ha47cyD6sNZ7hNjDas4QAKe2cT
	i0ChGr/ASBvkUlpcOhBBVD/OaY6i5I6l9FVfvphTKYeSOQADmsaGyC3H8ntjyfUJLeFgrYxIYHnYJ
	mb8lgM3NQ+KojMBzi5HPyb7/Zc1DErZivKPPmvrSXd1mEDYoXLcSOYLsefD4WCfT35ZFsS81LoqF4
	hI1U+ZvZPzslTeEV6g73/Mh0ZofwyNW4RYr994gJ91FDPAiangTEmAgR5ujeW6L5NZnd/zctRUFLh
	jGugt5lI+0nAzhmK1sCND24ul0Fwoc6Xm0KMHMwEu4rMZsGyadRZyZ0F0E86CzV1HdqMdggl8x3iU
	uLJX24og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RPl-000000098zO-35B4;
	Wed, 23 Sep 2026 18:09:54 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RPg-000000098x0-43RN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1790186977;
	bh=S/KaJ4uoOUinEh73MmdUTlZkerQq9iWPfc11MN39MGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kOMDRUbnzVWko/FkTNKx9yqS9+9W0T25Y1LU+b5s+jZaDtjUGzkobAwdBUpmwqr7M
	 ZMPdgm090MEuB6hsdDmAtIYdY7fQEVakgW0b7tf5HabL0NxJRFon0nhLJMap1LVZAd
	 GWMEFzpSOXWynn5KT7D1W1qCtkjqYcLnMA0hAa/w=
Received: from LAPTOP-TKBJAGN4.localdomain ([2408:8256:2d02:1501:3c58:684b:8f28:d14e])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 25D9783F; Thu, 24 Sep 2026 02:09:29 +0800
X-QQ-mid: xmsmtpt1790186969timzp5gnx
Message-ID: <tencent_8D2E80A7E2ACFB8ADB2BDBBF14CA10C8A409@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnL4Rd1vVVKfORU2nclknIy3CX3LAvPdYYXt+64NubK7N8aPmtj44
	 QizFsQHmqJBLHpXZU2dtws320R0qNwmhK/66837ATAakV6w9Ssxl3caGYTi8hnzxvaAcRfFsAPv5
	 uV6DDnF8EijQ7/xx5cfrnc7AbjcWyrdDOqhp6tVLOyXb3oj9WJ98HIxopvIeA0N7yD/sLdnKgVOn
	 QnYz7q8F3B8TURCgDneMD8Tq5rc4iuBcRBH+cIyVWEQ/gx90EiR5jQM4AbIQbVSI1uqzYucuSTSN
	 wZOl0JjndXop5AszXIrTKWYgAQhpxvKFLOyqjs8F9j95+9Tyo8DNyrLx/1wPmpE0cW7E/F4a7DgF
	 tALuhuxgpeJI8CTMny9aG+Csp2aQNIaZ2iDIAJYzE/AJCM20g8bVkuU6t99Y99LtSW3e8Sl8D752
	 apaia1tUcGzWT8aPHeBst/uL8zRSPVwBiJXf8DqPIo6cFjaWjRxFhEWF0ptU57eWJpJv0qYNMOXp
	 hfQAHyG4Hr3wGWk4BNhkwgQGStjNalLdR/oJWlDhWvBRmB0U/IEr9Ah+gBdg61Y80sR6WfQjYhdw
	 BS4VAlXqwbpf8sT1Mf0XkskJRWHCLkNB1kt+ZP2Kki7m8AYnxrnMm6Qlyl/u5yAK8BRkSfWBQ+7C
	 liu1TsMxoNAsV2IkJaoWiJDAg3RLVYF6g1ETVzFzrNucxbCChfs7SXINg22bbRjKnOqMPm2oi4c3
	 i6FO8KpIjShIxuhcGg/5II5X6kXr5bjYX2qS39D9JTM+vVacxU62uW2dgIWX8dq6pMZcmsANbNZH
	 FfFrFOE5oaJ5YBpJEzWyfTr/Vfpx4cizRBDB+GLPcQG6ovod5qlloCnwBed2ekPzJHiu4PBEkkh5
	 x6bn6Yl4UG+mKnaXxJHTpSL73uWZ52IWwc905nE6SyUOK1GG6xaO3bHJZKPoIOoRdY36R7RgaIGk
	 72lwHHK3tXQ3Z6gXM3MyvxOEtRGkw3QgAsEvaBPcOt2sO3zVOWycA/ZrxpgjidgjTkqpNS/UBCab
	 p34Eeosj+eIv+HBDBVkjb1pBHIz6e0Do1byJhVxY/6c5A45je3Cszv8E0FqDT1PShKCsFg26JFQ5
	 9q7XSa2zx28130roTJH0B6x695yd7p+R0r5btskDA3EUd+7XY=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Haobin Jiang <lemonoutput@foxmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Haobin Jiang <lemonoutput@foxmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@oss.nxp.com>,
	dillon.minfei@gmail.com,
	Vincent Jardin <vjardin@free.fr>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v3] i2c: imx: honour I2C_M_IGNORE_NAK
Date: Thu, 24 Sep 2026 02:09:26 +0800
X-OQ-MSGID: <20260923180926.3706-1-lemonoutput@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_342A87BFCECA70C9982E68A79AAD878B6909@qq.com>
References: <tencent_342A87BFCECA70C9982E68A79AAD878B6909@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_110949_561321_3EF80DF8 
X-CRM114-Status: UNSURE (   7.55  )
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

Hi,

A gentle keepalive on this v3. It applies on top of Vincent's
I2C_M_REV_DIR_ADDR / I2C_M_NOSTART series:

  https://lore.kernel.org/linux-i2c/20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr/

Should I wait for that series to land before doing anything further?
If so, I am happy to wait. And if there is any additional work you
would like me to do in the meantime, I would be glad to do it.

Best regards,
  Haobin


