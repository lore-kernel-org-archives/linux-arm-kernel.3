Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB93C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+7+m3dklN5BRrQFNvyT5Rxwt8KoxsY+mXnt8BW9089c=; b=MQMxAS8vq8UJt+
	cRAxdo5uBbbR7UIvY5mk3jmIKrItJ2PSOvN8vMJWXf3xRSKMUSQLqdLQRXFg2u4MaYSfTne0zjlBS
	PYxz6q2MimOMmyIbfMxuEEat8dnbvhB2AbmYgIFp2iz5VNkMBbRRuNmGafcvkWL1X4FEQXtsx6Gk2
	8fg8xPkC+FGp3BKICZx3vCGRLlCbX7VYoLfXMOmALZDvzBqEo0oslMreBmSs7RMZTMvCmbDRae+uT
	lfeiIsjY4eRabkbCKbmYGt8ty7hO3ePvV0f/i3DQwvMsfGZjF1lNYGOzq5yks56FTeFRKNPIjD7tK
	uEqzEaUla2BifWIpLc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkeA-0000000CL28-0VVn;
	Fri, 31 Jul 2026 10:39:22 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpke6-0000000CL0U-3sb8;
	Fri, 31 Jul 2026 10:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785494352; bh=+7+m3dklN5BRrQFNvyT5Rxwt8KoxsY+mXnt8BW9089c=;
	h=From:Subject:Date:To:Cc;
	b=QAUKIBgaH5p3BV9wQ63I5oZX5qIkAAhsZvWpwcmbmu62ZLAb05m8qsPYHrPNZBC1J
	 72VKchIav91oPuFm4xSBg4hMvCqaIbyxzoK/M5sGtcA//xUfVGtEJTdfwwUTZxdYRw
	 GNPNUPP86fQ9tjHUoKUoJEIHowwm4zjrdDg7hNgE=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9C92DE69; Fri, 31 Jul 2026 18:39:09 +0800
X-QQ-mid: xmsmtpt1785494349tbz9oo6kz
Message-ID: <tencent_E25C9BE6689264E4138A464803B810FDFD09@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqfXwvW1uM90Jo4KT6gQnEzkZrH3coZOCZPEuJOqVPZGVyCvGdGPx
	 H3irH1LXBVGRI9xn+Mx/1Gwo+bccio4Pk6pQ8Ngu5+5+vRds6diz+1lGNmFuui9fcrzZB5XfQ4p3
	 dBFW1LCzho6E70Yj0naK9+Gg+0IePXiZ8lHwcqggWGV5n6zYYlq8v5OcTorxGpiq8dXxjiaFDBTs
	 74bNQb9UqjCh1hAW1knFfxwlePsBHBpEihPc8dvTQoWWTmSP8rCqov181gfzEr4ipSIMoA3QkYfd
	 Ck9jVBh/PFEqkU/v9kRuWwfqSRVz7doekYOPYjuXUWr8VSil3j+5jUq4T6HDXFk1TTnbZRj5IIAk
	 jueMWbhNgZbBAIp9Jmf3WfDoK5KKzw0pAACOkWn92jnJg4XjGfyWJSD7dPTKzl7a42z3/V1oL6V/
	 +NzBbdNkGriYeskQI9YpW4uM99TrTVIxBOqU5GtVS3DxXN0UMbAEB/6/kYU50vriU3BlE3cAjAEQ
	 q4UVgKYY1pPz73kIQQTvmXIxOk+ZpwsdTignUOqBNJGSM1kamNQkaDxX83ZX1N+gDtvlSUfnqPY7
	 Iqyvw06gCof5xea06/bbEQveyYcw/gokd6d6R1uNEKFuDJ7SDmuRhQlKDeacM4xzd9aqUOmHA50b
	 SMWel/ZQy8mNRblQ3UhouKIDmKUVGhVA0+wqh0JL2GrZElLheyCnTi0Eh3NTSb4sbbEdxV4RCZRw
	 gIDFu+/zaRQJmZKig7IwiGN9YAt+pujMH/OeWM1lpsrVj/Sg8AnaEJRKF22aPMqqGihmmp1F2xVq
	 5dmNHIMeoifs8W1i4d5f3dAkG3dTcqDXLU9h98Dy9ZQYPKe92TEFWSstvT4PkJNSKNWXN5wiQlng
	 EXWI4gnOFU+80h8j+3ktrIchK7QCVAZhdQVikCz+XJDROiYGl5uxF6ti70rgDENOkNxdmGU/Gl2D
	 IsfzD8WjnoAt2k4lmX+pJeTc/5Ze6h/Ke/N5Nuvy7tTKDQlZZ52+yp8z2qK0MAk8rkkMVjvh9uXU
	 5jGUYyVcCLM+pFSnfeOzlQAOi7VffrqqrCxy4LdE9h8PEMmuJarVdtrkvZw21GqfsEnhpgou7ewm
	 fPw/59LJ94KcMbLNc=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Cunhao Lu <1579567540@qq.com>
Subject: [PATCH v5 0/3] can: rockchip_canfd: fix TX stalls and races
Date: Fri, 31 Jul 2026 18:39:02 +0800
X-OQ-MSGID: <20260731-master-v5-0-5b27029dee20@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZ7bGoC/23NTQ6CMBQE4KuQrq15/aPBlfcwLqD0SU0AaZFoC
 He3xYUhspxkvpmZBOudDeSUzcTbyQXXdzGoQ0ZMU3Y3S10dM+HAc9ACaFuG0XpaskrJShhUJZB
 YfniL7rUOXa7fHJ7V3Zox6dRoXBh7/16fJpZ6f6MTo0DzQiqsa4mAeB6Go+lbkhYnvm94NErzQ
 ktQXAJsjNg3IpqCGQQBRghdb4zcNzIa0KgLxVHn7GeWZfkAe10LWUcBAAA=
X-Change-ID: 20260730-master-a1b54b3cf5a0
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_033919_703137_19B7C775 
X-CRM114-Status: GOOD (  11.88  )
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

While running CAN traffic on an RK3588 system, the driver repeatedly
reported an inconsistent TX echo state:

  rockchip_canfd fea60000.can can0: rkcanfd_tx_tail_is_eff:
  echo_skb[0]=NULL tx_head=0x00060f7d tx_tail=0x00060f7c

The Rockchip CAN-FD driver completes transmissions by matching
self-received frames with entries in the echo skb ring. A race between its
transmit and completion paths can expose a partially updated echo entry,
dereference an skb queued for NAPI, or stop the TX queue without a later
completion to wake it.

The series aborts transmission when echo skb installation fails, retries the
outstanding hardware buffer, and serializes the TX head, tail, echo ring,
and command register sequence.

The final series was tested on an RK3588 rev2.2 with can0 and can1 physically
connected, using CAN-FD at 500 kbit/s nominal and 5 Mbit/s data rate. A
15-second cangen run generated 445,859 frames, all received by cansequence
on can1. Both interfaces remained ERROR-ACTIVE with zero bus errors, drops,
or driver warnings.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v5:
- Move can_put_echo_skb() before hardware TX FIFO writes.
- Extend the TX lock to cover echo setup and hardware command submission.
- Link to v4:
  https://lore.kernel.org/linux-can/tencent_929320CDB8CC5402DD486A402122B7DF5606@qq.com

Changes in v4:
- Split the can_put_echo_skb() ownership fix into a standalone patch outside
  this series.
- Use reverse Christmas tree order for the new local variables.
- Use the same _unmasked suffix for the tx_head and tx_tail snapshots.
- Link to v3:
  https://lore.kernel.org/linux-can/tencent_011F48D3310D8C4C4942DC88698030A28B06@qq.com

The standalone CAN core patch required by patch 1 was posted at:
https://lore.kernel.org/linux-can/tencent_944DADCC4B42C8484EC01DA2B15F42132906@qq.com

Changes in v3:
- Make can_put_echo_skb() consume the skb on every error path and remove the
  Rockchip-specific -EINVAL free.
- Drop the redundant error message from rkcanfd_start_xmit().
- Link to v2:
  https://lore.kernel.org/linux-can/tencent_D802EB485A801362BF9F54130C0D990C6206@qq.com

Changes in v2:
- Document that the TX lock also serializes the erratum 12 MODE/CMD/MODE
  sequence.
- Add the erratum 12 commit to the Fixes tags of patch 3.
- Add RK3588 extended-frame stress-test results.
- Link to v1:
  https://lore.kernel.org/linux-can/tencent_0E5C2332F801372DD0D4CB4C25B88C18040@qq.com

To: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol@kernel.org>
To: kernel@pengutronix.de
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org

---
Cunhao Lu (3):
      can: rockchip_canfd: prevent TX stall on echo skb failure
      can: rockchip_canfd: retry the outstanding TX buffer
      can: rockchip_canfd: serialize TX state and command writes

 drivers/net/can/rockchip/rockchip_canfd-core.c |  1 +
 drivers/net/can/rockchip/rockchip_canfd-rx.c   | 31 ++++++++++++-----
 drivers/net/can/rockchip/rockchip_canfd-tx.c   | 47 ++++++++++++++++++++------
 drivers/net/can/rockchip/rockchip_canfd.h      |  4 ++-
 4 files changed, 63 insertions(+), 20 deletions(-)
---
base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
change-id: 20260730-master-a1b54b3cf5a0

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


