Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D729CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNC29xo2Oju4FNTLwauE84cDif4ZKmEqMXzXqRGThAY=; b=deJjn8Teldjbqqzo2S4VOLiU22
	nfr1Ho/gOIMgUy9rLvHsWHSmzD5bPLCjzVlhMeBChasyK75mry/230I/hPv/FS3Ix/QWMevvBjMRk
	NRUIDpL6SL++uMV373m60N+tfJweSwfH7JXOqioghkYgnzAMLpuCR/5hcsbS42OfRfknSxp0HuitW
	wCzPw28kANaAtye/pU770sh+JqmZePEAoWrGTIgVQuub11AEdvyRwGBBo9B2GmNIRy87bsIawJY/K
	7jyWHEJ+DV+KIIMIuel+Y/olunYyL48Df/4sWAUaNHsCBSWKfenP3Lj84u7pZbu/gW7FRvu5DA9Dy
	IZODCLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2pZA-0000000FDJ0-0LGH;
	Sun, 28 Sep 2025 11:27:44 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2pZ7-0000000FDEb-0zRw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 11:27:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kNC29xo2Oju4FNTLwauE84cDif4ZKmEqMXzXqRGThAY=;
	b=MFweJCNkJkCRBZNcz+nfn33DwMc2XANO/SdftOX3ToXpjpKSkajogomX1g3tVbBFfspi4YbbW
	sb0l2yxtrGDqLme8n7yTVrSVZKdGDN6CHSjQeN4ULEmDoN8GGiTgkKs+Shi55BAKNjHOTTwj8bG
	+gg3s0DO3qheXJvP0BiL+QM=
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4cZMVV11WGz1prKR;
	Sun, 28 Sep 2025 19:27:14 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D62A140155;
	Sun, 28 Sep 2025 19:27:24 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 28 Sep 2025 19:27:23 +0800
Subject: Re: [GIT PULL] arm64 updates for 6.18
To: Will Deacon <will@kernel.org>
CC: <torvalds@linux-foundation.org>, <catalin.marinas@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel-team@android.com>, <brauner@kernel.org>
References: <aNbJ0YiL7Us_eicz@willie-the-truck>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <4016897f-42a5-bb18-4ebb-80de97f99a60@huawei.com>
Date: Sun, 28 Sep 2025 19:27:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <aNbJ0YiL7Us_eicz@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_042741_768363_4EEED4B6 
X-CRM114-Status: GOOD (  10.71  )
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

On 2025/9/27 1:13, Will Deacon wrote:
> ACPI, EFI and PSCI:
>  - Decouple Arm's "Software Delegated Exception Interface" (SDEI)
>    support from the ACPI GHES code so that it can be used by platforms
>    booted with device-tree.
> 
>  - Remove unnecessary per-CPU tracking of the FPSIMD state across EFI
>    runtime calls.
> 
>  - Fix a node refcount imbalance in the PSCI device-tree code.
> 
> CPU Features:
>  - Ensure register sanitisation is applied to fields in ID_AA64MMFR4.
> 
>  - Expose AIDR_EL1 to userspace via sysfs, primarily so that KVM guests
>    can reliably query the underlying CPU types from the VMM.
> 
>  - Re-enabling of SME support (CONFIG_ARM64_SME) as a result of fixes
>    to our context-switching, signal handling and ptrace code.

IIRC they're 6.16 stuff [*].

[*] https://lore.kernel.org/all/20250528114103.GA27965@willie-the-truck

Thanks,
Zenghui

