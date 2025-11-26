Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B325D111A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 21:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JRt4FOqb+cxebYzpTusmfYDJqVSBuXj/fYgBxabbYbE=; b=dUmMt0XbR+cgmPFU1voYRU/qSE
	KdyS+uoUIjmjzmQMzSvEdKLEIlpBbJKyuWvnz6r90FDa8VClaGaZiTWpmY/bceiWze9TGuvPut//2
	wQA7BMfGUlXRzppvVGuWdBZFaLkkzlv2nIatiL2UoO4IDxVQVbHBvcL514p+Ckbbku+CLAYZy8qQC
	BIJAyTtd70Om0PamC3aPV3dCEyUPgNCR0zlBp/VNxD4HL66n6rdrZStceiT5SpU3Tl9c+Yrmjauee
	YuH+1EZq1/0OmS6ivbbg6ug82GGFIZ7/JBzR6GfW6yhNFSQ96/LQ9pKhgxUPp+vMu6MPfgIZL1XRV
	3biB8UaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMsj-0000000FfAd-0FZC;
	Wed, 26 Nov 2025 21:16:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMsg-0000000Ff9v-1jQn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 21:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24C0B433F7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 21:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA15FC4CEF7;
	Wed, 26 Nov 2025 21:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764191813;
	bh=6FSXv6lvj8Cxw9bAiqE0JGXXnCopMs910raX/aEiueY=;
	h=From:To:Cc:Subject:Date:From;
	b=uWO3HjYDThOYfpBqwCtm91Yweuelw481K2wJe9VK1m6sVqnffr5zIpgjGG4v9fgrO
	 kOrwjAd9Igw0VIi6uBggtNY5tutVTD+S4n5xw53rJ+hLK0W3CqyboSK9rAzb8iPO4e
	 c+2CJl5TFMrzbaPVEOSDW+WILmlv0tL0Wqv5UFoiQqgLYtzYasDIOvucKcQuZn86lr
	 hhqJByiQ1s89fbrPRgL+kA20E2KUjjVvabCUobhN4F77ZggEOA23JHnFWnQKSGg36v
	 4exweOY9ZaZN6L44+ODCcQ+NfdXUv0duQTZhe9V0Vu5xwu9NJhYIvm8ZxY0srkGEj+
	 8aeIA6Uh1M0aA==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC driver changes for v6.19
Date: Wed, 26 Nov 2025 22:16:32 +0100
Message-ID: <20251126211634.8864-1-sven@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_131654_473464_B32405CE 
X-CRM114-Status: UNSURE (   9.30  )
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

Please pull the following changes for Apple SoC drivers. These have been in
-next for a few weeks as usual and details are in the signed tag.


Thanks,


Sven


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-6.19

for you to fetch changes up to f95f3bceade25914cca30c871187b2d33db23f34:

  soc: apple: sart: drop device reference after lookup (2025-10-13 18:32:53 +0200)

----------------------------------------------------------------
Apple SoC driver updates for 6.18

Two small fixes:
- mailbox: Stop leaking a reference to the mbox platform device during
  lookup
- sart: drop device reference after lookup since it's no longer used
  afterwards

Signed-off-by: Sven Peter <sven@kernel.org>
-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS3vz815OHsEaWy0u9EEX0kKnUe6QUCaSdsTAAKCRBEEX0kKnUe
6Q3TAP9LzbLNHLFbDgCQXRRU5Qb5RxakNQ6o6eoyJP2I4C16SwEA0PChp6r/yH7I
US56W3mTG3vlJKag472fLyDmZITkFw0=
=9YPH
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Johan Hovold (2):
      soc: apple: mailbox: fix device leak on lookup
      soc: apple: sart: drop device reference after lookup

 drivers/soc/apple/mailbox.c | 15 +++++++++++----
 drivers/soc/apple/sart.c    | 13 ++-----------
 2 files changed, 13 insertions(+), 15 deletions(-)

