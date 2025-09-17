Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201D3CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YQymRY1G6OI70qASlT8R/zdjQXoAymvymFeWuPZSMC8=; b=U1VF/bE0NrhopNRmu+7fOI+jlI
	9XV8UBMZQDrJSK+IuiFyOFw/5cQJUup4BMkVWRZZQT/yQaG/YFk271Ma2MDJUfgqjXitYNCj6v7GC
	E9trgna1zC1ok7wHVnZjQnFnRP0cg4PhXqdfv0Gveh/eT+uaq+llcs837y2dn1w93+DSGa0ZKp4YR
	PLuLS5axdFFWTnk/YF5opZfXJiHz41SKKEhBCJoMe+FKbT2pbetFCwAgxMEcRU/wgPFCBB40XvsN6
	sIy52FLJTFqodGM6mUbPOAu1EpRvQPcerIk5YCFp+LLEzkT6TBpQAQpbDw438cJmphTQi8JSYIa0d
	LbNEYsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvjw-0000000DTWJ-0qKg;
	Wed, 17 Sep 2025 17:14:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvju-0000000DTUD-3qqQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5924F60246;
	Wed, 17 Sep 2025 17:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5ADEC4CEE7;
	Wed, 17 Sep 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129282;
	bh=JNby2W/sYXxxOCX2lFGO9FJxNer/33OdhsjWJWm+m2k=;
	h=Date:From:To:Cc:Subject:From;
	b=u25lxxnn6Dl6f6e7pF6z6HFSUx2GcSCr+ESPvXgM7XmoU5Xxvo4gYHHDs1robpBIC
	 cC9t5cVL/Sd3eCQXFxVaj/bcZv9jG13J1/UVCSdulhgDF1ffxOfBPW8wkudS8yFshz
	 RR/iESao+lruTTyRq9rSbuHh1IoNXUDwhfL0eluVzWwCxbM7o3qLwd9QAA0sBw/mYT
	 rQqajcuSOJTZU9X6BZUEn1LzUPUtJ4/3V+/+uSV1k3CExl+NKbfr8Hf4Qv0LzRBX8A
	 39xoY0mF0z6SpYNoKATMY4CvMUoqGShnBlv4+syn9Tmn5qczBSUUXDHYR7e/OC8pTI
	 QagGJYnNYZ5ng==
Received: by wens.tw (Postfix, from userid 1000)
	id 23999606B1; Thu, 18 Sep 2025 01:14:39 +0800 (CST)
Date: Thu, 18 Sep 2025 01:14:39 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Driver changes for 6.18
Message-ID: <aMrsfw-_v3IAiKH8@wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.18

for you to fetch changes up to e6b84cc2a6fe62b4070d73f2d2d7b2544a11df87:

  soc: sunxi: sram: register regmap as syscon (2025-09-10 20:51:26 +0800)

----------------------------------------------------------------
Allwinner driver changes for 6.18

Some changes to the sram driver. One to register a syscon explicitly.
Another to add a new driver entry for the A523, which has two Ethernet
controllers, and thus has two RGMII clock delay control registers.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      soc: sunxi: sram: add entry for a523
      soc: sunxi: sram: register regmap as syscon

 drivers/soc/sunxi/sunxi_sram.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

