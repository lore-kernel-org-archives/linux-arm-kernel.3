Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5331BCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cFXBwc+8LQYNjWcwa74mUOCAwNkj3U/HZwRWUStzKFg=; b=w6IvGq2uUWKnaQtHoSWK/qpop2
	dcZIvggtr0hYcD7ZQgOaOi7CclDcd9eANN2o7tAnvl3pp4Cg3cYMevw3PXDLHD1AzDNCA2Gg4XUmY
	lCGAo0rd2zpHqAfPaDD/smjlZbdq0dv1ygdDh1h7fEaVvE697S8aD5XP8OkqXO1euOFC+0GZNuy58
	kpBgPC6hJrP5P0Yr7B1I4UI1vpNvS69WkfO7xhVaHy1LjbQBPIE3PXjie460UHWPuWXW0ungsNamq
	zRMxS9GWjmIJlmxtDCtxNp05qBspQMD/DILwD+ulRhpzpgfpn8VAC6rBd88E2ZSL+qxNCu+aMYaXl
	MKR2N1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7ZP-0000000GwW3-1Vjg;
	Mon, 17 Nov 2025 22:19:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7ZM-0000000GwV1-34CT;
	Mon, 17 Nov 2025 22:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=cFXBwc+8LQYNjWcwa74mUOCAwNkj3U/HZwRWUStzKFg=; b=jUoaWV8Qw40ZEHQqcrTKd5gT0X
	PsY0G6yV8dbKrV/05LIMR45zNnUL76tW1TOgVVC0YL+DTBIcG/U+Nm0qzz9KlPa6SO6QaC9ki+SCs
	QUdj4Jczai7D7FyN4P0JhEp2gdkPXZA+I/iaLMDg7j3B4/fu5jx9/8M4QqIRXzPccmijaEt8YnSHl
	NLTv2wfbHy5SkjzvYAJFshxkgCXZUllQJzjDFGZfD/f8DbLa+/wGy1MuH/UrhHOMum5J+ye81WRCJ
	wY2KRm5vU6J83oP0nejxp+K9nP2QCO73LEjbxpUtpyfZUNMEXIeJGFn6+92mZLzONjEeVdGsFBfZy
	sDBOFYJg==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7ZL-0001P4-0D; Mon, 17 Nov 2025 23:19:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.18 #1
Date: Mon, 17 Nov 2025 23:19:30 +0100
Message-ID: <2101096.usQuhbGJ8B@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_141932_769490_61D66A50 
X-CRM114-Status: UNSURE (   7.28  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-defconfig64-1

for you to fetch changes up to 60705b039f960378bb2a0a844f9378646bc0c6c8:

  arm64: defconfig: enable rockchip camera interface (2025-11-16 00:34:27 +0100)

----------------------------------------------------------------
Rockchip support for basic camera interface (CIF) and Synopsis DW-DP
driver, as well as the CEC extension to the DW-HDMI-QP driver.

----------------------------------------------------------------
Andy Yan (1):
      arm64: defconfig: Enable Rockchip extensions for Synopsys DW DP

Cristian Ciocaltea (1):
      arm64: defconfig: Enable DW HDMI QP CEC support

Michael Riesch (1):
      arm64: defconfig: enable rockchip camera interface

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)




