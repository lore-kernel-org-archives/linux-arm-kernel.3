Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1B5C83F1C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9UvgqP7lBIiwwXu+p+VJG/2s++eBd29hPRb0CnUmXA=; b=z/3Gsu/4uhxZ8j+rSVpIW4dXcE
	p9TEFKFoJGMRp3IU0rF3TsfIKeV/ee9+TIhRHchxc+FXu3Hkj6yCSgjQWgm/rkqfqNXulSvWKgOgu
	ujoPkwmaJInkflVsgqMG5hk2G6KW7mVS1a/E1eB/LNwM9zSPqpAOs5AZnLi1KflstT8jcBCgKeB/F
	KyK4aexYI4ecP2ZnPjRn43vawtmFinkaI8icX7gocWgeTSvBJMfTTuyRpfJg2FNNwQi+fvUK/zRy9
	WHC/CgFm9DmX9h/1s0QJ5KStM1ukf105ELeyPChVzyn0hak3F1L2UxCeAdNx1aRaGxOmtrxUU2ZAv
	nZwGzSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiK-0000000A87O-17YK;
	Wed, 09 Jul 2025 22:56:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZbB8-00000009mnS-1xHU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 20:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B5245C6523;
	Wed,  9 Jul 2025 20:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5594FC4CEEF;
	Wed,  9 Jul 2025 20:14:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:13:26 +0200
Message-ID: <cover.1752090400.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752090396.git.geert+renesas@glider.be>
References: <cover.1752090396.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_131406_538393_997037A8 
X-CRM114-Status: UNSURE (   6.33  )
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

The following changes since commit 37c78e3a456fc754e6b9aa7d94365017a33de8f8:

  dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number (2025-06-24 10:02:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.17-tag2

for you to fetch changes up to f2ce1fd2d991c53d61951b3c90eda2d3b0a023ec:

  dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single (2025-07-02 21:13:10 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.17 (take two)

  - Document support for the Renesas Gray Hawk Single board with R-Car
    V4M-7 (R8A779H2).

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

