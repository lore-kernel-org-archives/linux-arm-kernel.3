Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF3BCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WnbVx3Wf8n6g8+1K3F3HfJOpAIxDrMkmDGUSYXimutM=; b=NanCBdF5u+gdBAZqV5vGyixeXA
	CSUfkWrpX47LboX5ZrD4+eDuobILe2q6WeXZ56Z/OgKjJfuCxxIl11JZs0xBH7KhQElYQlwLPC5ke
	UmYE+Jhv0iZd1IvP1vHiqn+drs0LXnyLFSoEebidnBFGISo63nCQLdC8un4HYxZ4xkYpzP5Z7zDjn
	pSssa/jX4zJ3GnmCpH6uc3Q/t+5RZDjLARHps0aInOwDR1F5gaSxeIt7vu/LGVCaLp22sCxIgkYgX
	oSP3ftmdftmO4MOeTfeCTPf7niEHTQ+lkzfQp8fizFfeX4uQQsltZ5Lp2ZvxXrgGePv2iFFGMtAsF
	77CaP4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtEy-00000002GzD-1uku;
	Tue, 26 May 2026 14:58:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtEw-00000002Gy6-03Xi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:58:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4454A400D5;
	Tue, 26 May 2026 14:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C221F00A3A;
	Tue, 26 May 2026 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807521;
	bh=WnbVx3Wf8n6g8+1K3F3HfJOpAIxDrMkmDGUSYXimutM=;
	h=From:To:Cc:Subject:Date;
	b=S3h9MqkNM7nhIQAdnHRqHHOhGORSU9uOCjaf1rtdfYFp1vrt/v0ykAnPzXICAuCZG
	 vszIoZPShp0ycja1BRp8WG9jZw60mTtiO/zDphA1stmOD7LfQr5UjlkzvvJ1JHYP4L
	 4KwJLnHx6A9YdOI/CymDyR834bOH2q+oBe/NOTHboC2esPGsC1hIckPl/57dISN2KC
	 uUTdnHNkwyx4JuO4jm0/6E1thR7T/7IuBbemaAVnHu4XMs/rNdHHssgEOml/bOZdlO
	 HWzgYF4N6H1Ywnx2EGxu/jxldrmdfeJ070ZINYva1heUwR7IFMTnRWRa9cpC2pqeUZ
	 /9jrRFihLaxOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig fixes for v7.1
Date: Tue, 26 May 2026 09:58:39 -0500
Message-ID: <20260526145839.3800-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_075842_069110_E8096EC7 
X-CRM114-Status: UNSURE (   6.01  )
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


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-7.1

for you to fetch changes up to b73953af9bbd5c721c9d92b805a8aea8b0db74b1:

  arm64: defconfig: Enable PCI M.2 power sequencing driver (2026-05-18 09:56:50 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig fixes for v7.1

A number of targets now depends on the M.2 PCIe power sequencing driver,
enable this to keep these devices functional with a defconfig build.

----------------------------------------------------------------
Manivannan Sadhasivam (1):
      arm64: defconfig: Enable PCI M.2 power sequencing driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

