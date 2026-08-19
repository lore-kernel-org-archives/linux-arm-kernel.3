Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFDFC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3xq+poQ7DrCsZFFx/PFFj8t8tD/+36W/+yKuLEhob8=; b=FV8XvC+b+3fnIylp+Wbon+2e9V
	riPwWbERKwY47KN2KktrorMnR5v5EX8J8pa0dRbRF61qAkamCHhgo8zFwwxA6Uu4FdRkVHbhtxGZU
	gKYxkU7p9/aPNtcYwXiYkY6HQs++PvgX7GHWdF06hvshUNtsMQ3LQN/LORLYAHzFFuk4nBvzNJzLF
	85qUTs4xi88KexPOd5A6fJUBYpHbqti5W/xmPB6xWZkIcGS1FAuYbB0kVI9APUQDtVSZyDJoIT0D9
	N/tOpq69RtNH3ahyB5dQedW6mNXPVqxBcwJ5zvx69SHTRFPwvLauitTgpKTRNcpa1IxRqjcjkgMha
	BZ5U8P7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjBp-0000000ABW3-3lOQ;
	Wed, 19 Aug 2026 16:30:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjBo-0000000ABUw-0VcD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:30:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A01BD4E412D3;
	Wed, 19 Aug 2026 16:30:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73B835FF42;
	Wed, 19 Aug 2026 16:30:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5BBE11C7590E;
	Wed, 19 Aug 2026 18:30:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787157050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=J3xq+poQ7DrCsZFFx/PFFj8t8tD/+36W/+yKuLEhob8=;
	b=SAUwiGiFS2urYtAi52iN+jmjozA1hoC6CIl4mCyNxRB3rYiiILTdKPvw12QkVG6IO5W/t5
	Hay1EBlN+FlD1MVDuqUh63k+p9NoqMdPAxj+bRtK3iRW0beoVhpj8berbRjh9EfwxlhuGp
	K//jyx/u8pr8+vGOezIbWOJzuAAWBh1wWOXCW2aTeCsod0S/6Mp0bxCCtUWFXI7lioQqDn
	NS9pKo/0izUdpOktltO+ZAlLxFItw/6UzbS8IYVQLFVPONyn2FIujusjUIb9KAToepRwhD
	xyCfNFm83GNq9tliX9lWLjg922/TvrYHba7wnO0/rNXGU8tAPEZmr47v2qIExA==
Date: Wed, 19 Aug 2026 18:30:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: s32g: add missing MODULE_DEVICE_TABLE()
Message-ID: <178715693837.130787.12737079831199612183.b4-ty@b4>
References: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_093056_307707_F3820E91 
X-CRM114-Status: GOOD (  10.44  )
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

On Sat, 04 Jul 2026 20:20:03 +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> [...]

Applied, thanks!

[1/1] rtc: s32g: add missing MODULE_DEVICE_TABLE()
      https://git.kernel.org/abelloni/c/f1daef283404

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

