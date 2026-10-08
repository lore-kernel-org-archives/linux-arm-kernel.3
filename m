Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEDFCA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SBm05BjzYrqNU0OmxlHtZZ2AEdVmEJ8+If4Os62zFsE=; b=fFpDEGHIvhA8xE3yO/mMBBtKzs
	Iu6WwT10QPGgvm05awlkBAxWmr8dxVGVceFLL9xuQkojRP4XFMkpKADFo2zgoB3vqkrpxMzX9deBo
	2Dj+k1Xb9dTqSA+/sZhvX+bUFJXHFTz3MLAe+2jQZw92QJCshUo8AxtS1yYR+xdEyRTDlpTK8w6Qa
	lWnMSAGBu6FLUvHSJfYD2xiwFWOTZWfTYrMXJFdS5Pn1VXbnc2f1D+NIzQj2nC+SDWDlJCfklLHLb
	vQS886o7oCgcj37I/OrNEjvpLxf53eCXgLiYBbCCGBJ4GqrFKZmvp8T8+yYuqJJpNWp5As0tDqH7W
	3azvuznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErI3-00000004jCr-1FGB;
	Thu, 08 Oct 2026 16:48:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErI2-00000004jCX-37Fd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 16:48:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD92260A6D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 16:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225011F000FF;
	Thu,  8 Oct 2026 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791478097;
	bh=SBm05BjzYrqNU0OmxlHtZZ2AEdVmEJ8+If4Os62zFsE=;
	h=From:To:Cc:Subject:Date;
	b=oEf1nVafDbrNUTJblhgy6rb3IVEd3KTUDbav0dTwLqqgBzWUAhv9NO1gUR7+x+FQs
	 1h+eXp+C0vXWRUHjmz9HcTQIMGF2dL95ewdITQ9I89JfXEcfd4XeS0VJHq9odqbNBO
	 1Du9RZpbrDc0Ji7aRRBWdIJ3aVJ80dG0AI7XnKQlISGoV+5UOKgnbH+bPHgRR3PBrG
	 fkxjj2r32MdbtTlsxFJSy0IdqU23gN9x8O5TVBQNvWbXJm8uAbwNMGhFCCTXpJR3iS
	 6NQY7CWNADSyb/VMJQmNWmfbkE046TeX5/20tcv8KOq8Y3zEv4M6INpe+faJu6ZTu/
	 IRtAj+Et7dfUw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL 2/2] MAINTAINERS: socfpga: update for v7.4
Date: Thu,  8 Oct 2026 11:48:16 -0500
Message-ID: <20261008164816.566624-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_maintainer_update_for_v7.4

for you to fetch changes up to 96e948e9811dcb68f513e1d6445e22999f8d099b:

  MAINTAINERS: Drop arm64 dts/intel path from ARM/SOCFPGA ARCHITECTURE (2026-10-05 10:13:13 -0500)

----------------------------------------------------------------
SoCFPGA MAINTAINERS update for for v7.4
- Drop the arm64/boot/dts/intel from Dinh Nguyen's entry since
  all Altera's SoCFPGA files have been moved to dts/altera

----------------------------------------------------------------
Chiam, Evon (1):
      MAINTAINERS: Drop arm64 dts/intel path from ARM/SOCFPGA ARCHITECTURE

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

