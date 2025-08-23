Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3702CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZSqradjoNYlEMEbm1ZzV1lrstXti0Rv6XGYgH3hP2f4=; b=HuY2xOAKUKZqgh
	V7s4JxvkBgUaHQ0psA6QG9iREZlgnUeKX2+7m7p+hUK3QRMkXYbbTC0MTndAU9IFVCzLSRaXijVKH
	tHmojUyd87kEREBRNUn2x+HzY4MZgWe6xLbF2DzKvE7zSt0xTi+C0KLfwIUgffRRXcGeuNYqCnAkb
	LZ4danhVEtr1+kxPNyEd5Mf0MPDLObJKkHnwEnM3EVhNx+YNtZI70jGD8/u8DH9FYkmRet79N6Xtc
	O4XoqyPZdFIZCrZBo+BbKEV0CRS4wwyRDw2E73TA9CNrOhw3+2z4phdF2ykifa1iFvq4oPKLcj0Xz
	Kr4qOGg2CoURQv4qMVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplLO-00000004cnB-0Ofq;
	Sat, 23 Aug 2025 10:19:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upj72-00000004JQp-13Md;
	Sat, 23 Aug 2025 07:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZSqradjoNYlEMEbm1ZzV1lrstXti0Rv6XGYgH3hP2f4=; b=kag9FYfChUNkIwac6Q4QDJIkoL
	xcKy2ETWtdEudf48Po1nDdErtOhdMH6VGfWlViKqc3Dpha6hIkFeKkf8SpbTdsXSkHmVa8FCfBbVA
	xC+685zJeBjIp3KB2inhuRRx3ZcuJ1Dhyvl8SGm2ayU09ZyQFBs7IgrTi/8yqftW7v0XoDT/UQxq3
	4Gdawg5GTNu0Aq1QLi/UbD78mmniha7LKljJhX9i9Bf7WZLsAV4bkumd9GRQrzQ0RkehN7fxnchiW
	jr8Du+vv+0yr24dv0QyHesMpZHDRNsQOOZxWEETMNlCpdGnGlsE+8eQ5WSZ0d5aQhc3i+emwFSDvu
	dRwLZqvg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upj6y-00000001L5A-3omQ;
	Sat, 23 Aug 2025 07:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 009D0408B9;
	Sat, 23 Aug 2025 07:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F99C4CEE7;
	Sat, 23 Aug 2025 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755935784;
	bh=jH/zfECS1KSBq9y+UHL0sl+KGHKSrnJ/X+waTIEZKUs=;
	h=From:Subject:Date:To:Cc:From;
	b=WyQpAI8W8xXT2XCFMrkjkY3lqT3p0RkvOk1Ku7XJ/l2f52GHpOzG3g7yAELI9pOZD
	 EWEUzAIoMXh7IMRDUVGkhAvJF6BwMJ6ei8KmZNnY+bKURE6GFx89IH/zPjbPpToE5Y
	 e0y4Oueij+R+/GAIy3lsA8FB/cVHAGBDpsJaOdNI0y8/kdMki+Qa+yWldOesesTNip
	 tG/bDgH6an8Qa9FAMyCodDOhalNmjwj8vvFyxynQ1wEHF7DQzmiz48aP6StHnFOM1x
	 iBd3k60anVS4YJijSNu8hVJT/6E3OujL4n6Gb0UYAgS2e+od5t7IrgQO0qUh5yDGc1
	 JtN4RagS/HsCg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v3 0/3] net: airoha: Add PPE support for RX wlan
 offload
Date: Sat, 23 Aug 2025 09:56:01 +0200
Message-Id: <20250823-airoha-en7581-wlan-rx-offload-v3-0-f78600ec3ed8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF0qWgC/43NQQ6CMBCF4auYrh3TDkLBlfcwLiYwhUbSmtZUD
 OHuFla60uX/Ft+bReRgOYrTbhaBk43WuxzFfifagVzPYLvcAiWWslYNkA1+IGCny1rBcyQHYQJ
 vzOipA4VsTFW1BoujyMY9sLHT5l+uuQcbHz68truk1vVfOSmQoBXJRrNkJHW+cXA8HnzoxUon/
 OAQf3GYuZp0xaorDLf4xS3L8gbmzAWiGgEAAA==
X-Change-ID: 20250819-airoha-en7581-wlan-rx-offload-12eff66cf234
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_085629_203334_7829732C 
X-CRM114-Status: UNSURE (   7.96  )
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

Introduce the missing bits to airoha ppe driver to offload traffic received
by the MT76 driver (wireless NIC) and forwarded by the Packet Processor
Engine (PPE) to the ethernet interface.

---
Changes in v3:
- Fix compilation error when CONFIG_NET_AIROHA is not enabled
- Link to v2: https://lore.kernel.org/r/20250822-airoha-en7581-wlan-rx-offload-v2-0-8a76e1d3fec2@kernel.org

Changes in v2:
- Rebase on top of net-next main branch
- Link to v1: https://lore.kernel.org/r/20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org

---
Lorenzo Bianconi (3):
      net: airoha: Rely on airoha_eth struct in airoha_ppe_flow_offload_cmd signature
      net: airoha: Add airoha_ppe_dev struct definition
      net: airoha: Introduce check_skb callback in ppe_dev ops

 drivers/net/ethernet/airoha/airoha_eth.c  |   7 +-
 drivers/net/ethernet/airoha/airoha_eth.h  |  12 ++--
 drivers/net/ethernet/airoha/airoha_npu.c  |   1 -
 drivers/net/ethernet/airoha/airoha_ppe.c  | 112 +++++++++++++++++++++++-------
 include/linux/soc/airoha/airoha_offload.h |  55 +++++++++++++++
 5 files changed, 150 insertions(+), 37 deletions(-)
---
base-commit: b1c92cdf5af3198e8fbc1345a80e2a1dff386c02
change-id: 20250819-airoha-en7581-wlan-rx-offload-12eff66cf234

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


