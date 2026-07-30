Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703D5C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q78/UjlAUyOdIvmwtJY1CrRorkmEitpUjVSQ8zAALmw=; b=v9bzdHlHAg2JKe
	3aTqKsIDBQS1aAcmhgiWhoTUf/+hvtjMrASHekI+7vmkUU7YD8l6a1YrhUUYoIyPvipyx9cwpza+d
	omZUUepUvE4NUcXOJb8NvR+Ke+/vIoPPESkMn2yHTG/U4PCqJqfyADgazxFkTXl+uXR7a1m55AtTR
	XAKdO0GgxMXI0OLyZb5xGAP1Ak5ueAjjIx1VtvofvRWlxj0DYqNXGQBesJ+BW/J2tKjTgx3K74bbp
	tGu6V+atVw7GVXnvtkudDEqaVB0EphQ9q3v90RpuRMSt8KcYkcTgJ5xgA+LqwmKzmSNg3t9l8hABe
	UXzOD8hPZscEz4mbl/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpT8M-0000000Atgn-3opY;
	Thu, 30 Jul 2026 15:57:22 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpT8C-0000000Atci-0Nns;
	Thu, 30 Jul 2026 15:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785427027; bh=q78/UjlAUyOdIvmwtJY1CrRorkmEitpUjVSQ8zAALmw=;
	h=From:Subject:Date:To:Cc;
	b=mdEoECxdXg09eX8wSc9FdBwA8UnsM1ovAyRF3W+tDzJXCUtaCrIPYLiz+yHigLO2q
	 F/tSDIiC9iSVA6FDz9bI/VDFH3l+5vk/iLMEK6Ueg4n/ty3FIlT8Xt9mLaWIo2P1JN
	 ee/amaL9SkeIPg6Ad5j2uS/Eay9UxjfPCrbIPj44=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E4428204; Thu, 30 Jul 2026 23:57:04 +0800
X-QQ-mid: xmsmtpt1785427024td63bdj6y
Message-ID: <tencent_929320CDB8CC5402DD486A402122B7DF5606@qq.com>
X-QQ-XMAILINFO: MGlHWIisM7RbuSFKYH1fLZRtLWiNpvemqdP4tfN2ZZ51uPENTg42exjqwpw4cN
	 uquE3tAkCPyVli7u7GkAzZEYOs/zxTj/xDF9vKQie2kh6SRqHsG6r7xWc1essq5H31303wDNhNb6
	 r6DnLd0epZFPZqXBw+iasY2msMnG5C+BnGyi+StaoUh9v1Gge6cBnLt0oHwFBA7WtEQS5EvLiy6Z
	 GuqVlVu/aNHD0kU5EXZQU0TNIWrZhkYGO4qBNCDfTciLuMhTUoVlp3nr7o8+Trf+GLil3Ne7pDMi
	 U8hJHS//NxAIw8vS3xlQKY/W3fYBh+VQvE2A/hsTB5SKUxHFcEh8F74sEQuQGjXRmZS1C8CNdAZB
	 g+7ADJb+TrPAYjpY9jTdLnE+E0Dus7vnK4sNRLUW4RsPVim5+BSypqo8XdFjxHvlnXPHXBHzMBrA
	 Xa+FKv0v4mzyTBzvIBLuHEU5/DCbGOZxOjdaJGQA4h/Bjx6ICK1QdkFdxkN5x+gT10jSL3MS14/b
	 P9e4RCoyWpnx6ScfdGIS+FDO7mWwJ1COnbGfk7UWvWbJb2M9hC+0r227lf70KtT2xxdVXgvEz0mx
	 pJFfauWZ23kYXFAUzp3jOnZSuvYTTfXfTtij/98Wt+q0pqrp2Y5GokqrJ9+psV48Tn68m7r9xBUB
	 K1atEPalrpjqdWgQ/MS5Dgszzxkw7QRvGRvoCXz8olig0UGdX4beWkZ+a+K1rYx49k8Lx12xt58w
	 B8cGTA2Ixq7fEJCcVbl2KxtdzGWAZ7khAn2zYYdo4823LiotIBkjRsSDWkvTc0+EFpq8Bk1tcPMn
	 InTXkHGzJPKbwnlLXg2TJKcBc+F63iMoHvKK5QZJsCbwEIKu3mgCroNzFmzgUlO3pnYzIOkzictS
	 yFcl4ZmOgwBQGNTPOpbDl2ykacmM0eelYbYSICBwsmEE1mcabvZxOkDabtIjrez3uG9syeQEXMhk
	 5UmsUNkhT3vz/UfdQzXA+Jx2rEz+ukneFnaLNx0hkZ8Q/O5vAJDTXiqyhEZGOPkezsOHfN1yPPYM
	 0bLEx9HQ0spjMiwIhmI8DKmyG13HhCAIJAw+wmSY1FifTi6uH5XF0uTXKJknM63aNjDMxFD9kspc
	 m+6wbm0fBa7Glk+96MhFOEINVf6H5qjwn9IzZDBT+qyPH6j+Rbx+qLyhSa1ejiCPgZzB7JQXUDCS
	 c+vj73jjHyOWzxb/sMtabMh/rPYdCBigJYHUmcg9lUiMpbHQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Cunhao Lu <1579567540@qq.com>
Subject: [PATCH v4 0/3] can: rockchip_canfd: fix TX stalls and races
Date: Thu, 30 Jul 2026 23:50:40 +0800
X-OQ-MSGID: <20260730-master-v4-0-07f7952f761d@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBya2oC/23NSwrCMBgE4KuUrI38eTXUlfcQF2keNkKtTWpQS
 u9uUkEQuxyYb2ZG0QZvIzpUMwo2+eiHWw58VyHdqdvFYm9yRhRoDZIB7lWcbMCKtIK3TDuhAOX
 yPVjnn+vQ6fzJ8dFerZ6KLo3Ox2kIr/UpkdL7G00EA64bLpwx3IFzx3Hc66FHZTHRbUOzEZI2k
 oOgHODHsG3DsmmIdsBAMybN1yzL8gYu1ZChEwEAAA==
X-Change-ID: 20260730-master-a1b54b3cf5a0
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_085712_440323_D4CC5925 
X-CRM114-Status: GOOD (  12.04  )
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

The final series was tested on an RK3588 rev2.2 at 1 Mbit/s with 100,000
extended CAN frames. The run triggered 138 erratum 6 retries and completed
without drops, queue stalls or driver warnings. RK3588 does not enable
erratum 12, so this test does not exercise that hardware workaround.

---
Changes in v4:
- Split the can_put_echo_skb() ownership fix into a standalone patch outside
  this series.
- Use reverse Christmas tree order for the new local variables.
- Use the same _unmasked suffix for the tx_head and tx_tail snapshots.
- Link to v3: https://patch.msgid.link/20260730-master-v3-0-91cf030c337d@qq.com

The standalone CAN core patch required by patch 1 was posted at:
https://lore.kernel.org/linux-can/tencent_944DADCC4B42C8484EC01DA2B15F42132906@qq.com

The v4 functional design and hardware test results are unchanged from v3.

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
 drivers/net/can/rockchip/rockchip_canfd-rx.c   | 31 +++++++++++++++------
 drivers/net/can/rockchip/rockchip_canfd-tx.c   | 37 +++++++++++++++++++++-----
 drivers/net/can/rockchip/rockchip_canfd.h      |  4 ++-
 4 files changed, 57 insertions(+), 16 deletions(-)
---
base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
change-id: 20260730-master-a1b54b3cf5a0

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


