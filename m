Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF218C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQVB5OQw+LtVyf24QaIUoEka84p5ZbKTXpb7QDY16o0=; b=1J1si/RX+hnLGS+z0Hl0WXGPVK
	NVsfYM+QgdlXVJNvJiReVnDbRx2Zdt09C2TyxotdMANikBHrgYAqbXR9RMGWrCM7V2JnCOL8PpVp8
	315dLqMABrzfZIWXrD5AmeO52nBLRf4Qm17ugQpZRugEo+lJKuqZPljAlBamRtBJ79yIpxwAO3aPk
	IOP0pM4K4cP4X75beciBRXP0nTiKp08RIXAlihAp8yI1+5xPSOEx9u4YZNI10/ezK67vBO5P+wkDA
	Bwuh9/Cl9WFfFHUNtqhhXA1kX3wa+uJHJGX7NuI+1irOULwhYodrk+tvKIaVWVN9AMo0sjCKk9Uvk
	roSROHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7iF-00000002KPk-2Plu;
	Sat, 18 Jan 2025 12:14:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7gx-00000002KES-2wKN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A84B5C51B0;
	Sat, 18 Jan 2025 12:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FCCC4CED1;
	Sat, 18 Jan 2025 12:12:41 +0000 (UTC)
Date: Sat, 18 Jan 2025 12:12:38 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: cki-project@redhat.com
Cc: yoyang@redhat.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.13.0-rc7, upstream-arm-next, 1950a0af)
Message-ID: <Z4uatgrJCdtiyUXH@arm.com>
References: <45567.125011714220601212@us-mta-568.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45567.125011714220601212@us-mta-568.us.mimecast.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_041243_782861_F298FFC8 
X-CRM114-Status: UNSURE (   6.79  )
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

On Fri, Jan 17, 2025 at 07:22:04PM -0000, cki-project@redhat.com wrote:
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         xfstests - btrfs
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1629927092-aarch64-kernel_upt_56
>                    Non-passing ran subtests:
>                        ❌ FAIL btrfs:install_xfstests
>                        ❌ FAIL exit_code
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1629927092-aarch64-kernel_upt_64
>                    Non-passing ran subtests:
>                        ❌ FAIL btrfs:install_xfstests
>                        ❌ FAIL exit_code

Looking at the logs, there seem to be some build error with xfstests,
unrelated to the kernel changes:

random_range.c:596:5: error: too many arguments to function 'srand48'; expected 0, have 1
  596 |     srand48(s);
      |     ^~~~~~~ ~

-- 
Catalin

