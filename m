Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D74C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 22:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/UhymLIMd5eLnLGVlqof6gLqgaGUQuR9VsSEm0PQjQg=; b=qIgfIF5BLeYzMWh0cszarvOUT0
	SNQ2hjRewLDIhAZ+vUQR7OCvXfzPQfoxqInVNaISVz15WM4zMZ01o23xTefcu3SalBDc30TGQT/+P
	xENgCQE7NI7ws2IRXPo2j61M8izDPS/BzWUa6T+sR5STFrW8pdOiY8iltI00hIGrG9d1jkUpHMsgL
	7wnS5BOCuqh3goBHQHjwrXLKe2p/LitoD/h0+FMtKnXc5yb3+yAIVZ5OYUpc7km/A3Kgicrk7QxiD
	JrWjgvIXTS9q4vVpBOYw8+3irFGO5nwwidJkdFEihu2PWQ4Lk4/82zMQpkPOVAdhIi9iIgf1bqRel
	WmSRMh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKP9D-0000000EFVo-3HmC;
	Wed, 28 May 2025 22:21:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKP5W-0000000EF0C-2dzk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 22:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 772464A520;
	Wed, 28 May 2025 22:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368E3C4CEE3;
	Wed, 28 May 2025 22:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748470649;
	bh=zNpLWP0iLRo2SdsjN4iDx0HkI1x+t7mIhg4FFPTD5Tk=;
	h=From:To:Cc:Subject:Date:From;
	b=G7muyCJcjzQJFr92jjgnWBBlpxhlTSkns9tT7dVBsYZ8p066RrwEMoBi52I4Dw0DI
	 eaRLiDhYqbn6faw+B+Y2GJED9hg08bsaHGlfETA9F75ftIxkrXqIi4OsD5QT9YrZYf
	 CsaqSf2zXr1M9TJ7oIMBiqykalOfsuUlS5XATez3+9oY1oYBUkrSTNXzSwCuLDw77P
	 mAIoJS7lnZh5pfi+61KTh5B/5D6Udfk/l7Ahoof46MrGPhVaDAeUDAObZJ7cfpg/mX
	 uxLm3Rt7vPXY3FPlpscg8hjt7CgYs1Zxxy83Afgeh3cmTznC8ByVXp36g6rIFklFa6
	 k/AeUR12dZOyg==
From: sven@kernel.org
To: soc@lists.linux.dev
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS, mailmap: update Sven Peter's email address
Date: Thu, 29 May 2025 00:17:18 +0200
Message-Id: <20250528221718.45204-1-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_151730_689725_89B21F86 
X-CRM114-Status: UNSURE (   9.94  )
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

From: Sven Peter <sven@kernel.org>

Update my mail address to my new @kernel.org one and also add a mailmap
entry to make sure everything gets sent there for easier filtering.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 4f7cd8e23177..7a9cd664183a 100644
--- a/.mailmap
+++ b/.mailmap
@@ -712,6 +712,7 @@ Sven Eckelmann <sven@narfation.org> <sven.eckelmann@gmx.de>
 Sven Eckelmann <sven@narfation.org> <sven.eckelmann@open-mesh.com>
 Sven Eckelmann <sven@narfation.org> <sven.eckelmann@openmesh.com>
 Sven Eckelmann <sven@narfation.org> <sven@open-mesh.com>
+Sven Peter <sven@kernel.org> <sven@svenpeter.dev>
 Takashi YOSHII <takashi.yoshii.zj@renesas.com>
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> <tamizhr@codeaurora.org>
 Taniya Das <quic_tdas@quicinc.com> <tdas@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..b389195fb9cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2251,7 +2251,7 @@ F:	sound/soc/codecs/cs42l84.*
 F:	sound/soc/codecs/ssm3515.c

 ARM/APPLE MACHINE SUPPORT
-M:	Sven Peter <sven@svenpeter.dev>
+M:	Sven Peter <sven@kernel.org>
 M:	Janne Grunau <j@jannau.net>
 R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
 R:	Neal Gompa <neal@gompa.dev>
--
2.34.1


