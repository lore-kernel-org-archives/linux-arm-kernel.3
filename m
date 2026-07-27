Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE9FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZStcuhfdE7XxAahWW2ecan0c6zEbfCVD7CPTonvHjSo=; b=HFl7zji5TowpgTX5VhHNb0CFXE
	0vn+Uq/sRJw1fI//l2JAOKkrMe59ZJxrSafBfK4kMpOq8kDRYXLh7dGh5xzjXJHlboXHpXS5XiMvg
	E9/ghE7GfTQss2/ak21k2dRpcrOPWJaf4XUFbtkDEpiNPKHnYHBPLNxRwH8OKMaex13ht6FNTNqhS
	d8e/bVlGJQCZpSXZNpquCfDln1TTuh8szmUrr8ng/Qz1FAuNhsNaUMmliN2xHd7SG2jU1EUzbhHnU
	qrZ7Xy24FEsJ4xFQmyM8YFgw5OJ/n0RrFDHB7I1uiSMqxvsASlf1pzBjOeb0IGEtTstHlTXzunvwC
	PxRT1WGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG4A-00000002BHR-3SeI;
	Mon, 27 Jul 2026 07:48:02 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG48-00000002BGr-2IYO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 07:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZS
	tcuhfdE7XxAahWW2ecan0c6zEbfCVD7CPTonvHjSo=; b=CBkWPhc1I89BZjYVgz
	2ISa/fi0husOK1ZC2jKDPaF2RFEHOebY9qtFwtzHf7y/lM2AmLMIbkwnEJFcqIA6
	318vwueZQwqLNa2xArFLKj/qz/EMjp/1zteiJgY7VP37trSOeZBwc7uxWLSnn6ZD
	/ajRq0ym5l46ubQLp7lN4FmrU=
Received: from fedora (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgA3UdQJDWdq26SaJw--.39752S2;
	Mon, 27 Jul 2026 15:47:21 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: egg12138@foxmail.com
Cc: jpoimboe@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux@armlinux.org.uk,
	pmladek@suse.com,
	Ju Nan <junan76@163.com>
Subject: Re: [PATCH v3] ARM: module.lds: fix unwind metadata for merged .text sections
Date: Mon, 27 Jul 2026 15:47:09 +0800
Message-ID: <20260727074708.115112-2-junan76@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com>
References: <tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgA3UdQJDWdq26SaJw--.39752S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF48uFyrZFyDGFWDArW7CFg_yoWDurgEg3
	Wvq34Utw17W34Duws8Ar4YyFyDWr4UWF17Jay8AFZIyr40qrsIvw1rAr90vF17Xa1xurZ3
	ua43XrZ8uwn7tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUxR65UUUUU==
X-Originating-IP: [2409:8a62:3e6:69d0:2c5f:9e47:5815:6758]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC0wm5a2pnDQkD8wAA3x
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004801_038897_E3DDC9F2 
X-CRM114-Status: UNSURE (   6.18  )
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

I ran into exactly the same on a STM32MP157A-DK1 board (dual Cortex-A7,
ARMv7 AEABI, CONFIG_ARM_UNWIND=y).  An out-of-tree module whose functions
GCC had placed in .text.unlikely (merged into .text by module.lds.S) left
its .ARM.exidx.text.unlikely section unregistered, so an Oops inside the
module produced an empty backtrace:

  Call trace:
  unwind: Index not found bf102018

With this patch applied, the module's exidx is coalesced into a single
.ARM.exidx output section, module_finalize() registers it against .text,
and the full module backtrace is restored:

  Call trace:
   do_the_crash [oops_null] from level_one+0x8/0xc [oops_null]
   level_one [oops_null] from level_two+0x8/0xc [oops_null]
   level_two [oops_null] from trigger_write+0x18/0x20 [oops_null]
   trigger_write [oops_null] from full_proxy_write+0x54/0x78
   full_proxy_write from vfs_write+0xd0/0x49c
   vfs_write from ksys_write+0x6c/0xf4
   ksys_write from ret_fast_syscall+0x0/0x54

Tested on Linux 7.1.4

Tested-by: Ju Nan <junan76@163.com>


