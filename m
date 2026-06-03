Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414ABCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5bfBija3hKjOioAnk8QC657O/TcCbqFHBfv3XYBPyE=; b=QmuO8wi2vFOGBPOop4nVFtSNaG
	sz9EN69vfozY52/r8kWTQ2vvYNDP/gMfgHGYs90kC7lTz8OMC6FxrsVXQlWv4kxzI9zxmuIVzikZb
	FgUl9CJWYnG7cM/XrAFF0eTwz5jRYe1xtE1oMvZwGvoeQjUVwKIZ8aBvCDPA6amoNBzfEwaU1a53Q
	5sI77rn2iamnSVLvNNX2uWLOr9OxExnIBuvABvW/bdwjN/+obKPX9lycjuo3eNTwbWU2fiJP73CJH
	02iUNxYpDYV+Rmu8/FRuwZK24d44YViPb462hd3dHKfy/EJV4OQm691t1WxXbO2zdgHB9tkK1Wliy
	tJ00YjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjhv-0000000Evte-1Vnb;
	Wed, 03 Jun 2026 11:24:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjhs-0000000Evt7-0bu7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:24:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5438840E34;
	Wed,  3 Jun 2026 11:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF681F00893;
	Wed,  3 Jun 2026 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780485859;
	bh=G5bfBija3hKjOioAnk8QC657O/TcCbqFHBfv3XYBPyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MeTSKMWubRAF6yVG5TeZRsMc54tCBAPOXobfdjvzvoYBYZbrF25y6d/BVMTKH6JxC
	 pI11YuqecERKVrbf2hfHNai8NfY6AHyz9Zs4H3unSj/4by40l3YRdyQ+VdQcMKlZc2
	 feIk/k5bpRJt6eS8lFo5YQkUB9N7g5xIvoh2AuV0lP9z4tDMQvF8FlFnuipjWg13OE
	 Zz5PqX2onjoRIR/wkkJVBB5dXTtrWqbRuOp0NzypPLqCUEHwInsHc+AaRklFE6Lgc6
	 9XHWqbAS8nkl4Lpbui+VfaqP82+8yogXcfdXsQb+i3CyPzdqmFfG2XSd9aZgrHUJZk
	 1uQv2L3g1BWdg==
Date: Wed, 3 Jun 2026 12:24:15 +0100
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: linux-arm-kernel@lists.infradead.org, yoyang@redhat.com,
	ftjahjad@redhat.com, catalin.marinas@arm.com, bgoncalv@redhat.com
Subject: Re: =?utf-8?B?4p2MIEZBSUwgKE1JU1NFRCAyIG9m?=
 =?utf-8?Q?_56=29=3A_Test_repor?= =?utf-8?Q?t?= for for-kernelci (7.1.0-rc6,
 upstream-arm-next, e8a95b97)
Message-ID: <aiAO37JSEGED5P38@willie-the-truck>
References: <09110.126060304320900870@us-mta-618.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09110.126060304320900870@us-mta-618.us.mimecast.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_042420_202819_8DA1F761 
X-CRM114-Status: GOOD (  11.76  )
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

On Wed, Jun 03, 2026 at 08:32:05AM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: Merge branch 'for-next/core' into for-kernelci
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2571596185
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         Boot test
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:2571596185_aarch64_kernel_kcidb_tool_21399931_6
>                    Non-passing ran subtests:
>                        ❌ FAIL distribution/kpkginstall/journalctl-check

There's a WARN_ON() in dmesg which looks like it could be due to Ard's
changes.

>         xfstests - btrfs
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:2571596185_aarch64_kernel_kcidb_tool_21398598_9
>                    Non-passing ran subtests:
>                        ❌ FAIL generic/001
>                        ❌ FAIL generic/004
>                        ❌ FAIL generic/005

[...]

but these look like a possible infra issue?

ERROR: /dev/vda5 appears to contain an existing filesystem (type=xfs)
ERROR: use the -f option to force overwrite of /dev/vda5
check: failed to mkfs $SCRATCH_DEV using specified options
Interrupted!
Passed all 0 tests

Will

