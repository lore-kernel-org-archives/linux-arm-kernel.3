Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68EE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rYEgSz3c;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YhMEulws
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aHdZ+oKwe6OINwv5V856+JzJxIwxr2tU0lqEBlQhC6Y=; b=rYEgSz3cQiwSZLrgJY083/t3TM
	jtyyd+eZWWN5KosU28Zav2ooFKVpAzbpE23f5NuuAgo8619xkxvm3vE/LqkjQnhI+Ck/kz3EUYdNb
	lbyopqjDoFjNgCkYX+IOfG09HKsDX50/iS3ilpPVQtw5rFKFCfoRhdZ9Q1wnIlJdBPsSFKTrN/bae
	7GNDxmPspNq1sIlX2pNGNmdzQpliO7PpD1qvij66Z6yEtNApWbtXb1JYrM/M2QOTKKvG5Q9pPwesq
	wenOle5pAnL7Mm94PdHgGqYtUk91HxndwEcIN4htD2t/PR6972GxOUFpZ77RrizBPxUZAUSDu1BC9
	y4V36hpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBGn-0000000FyRI-1t3w;
	Fri, 23 Oct 2026 09:09:01 +0000
Received: from out-248.mta1.migadu.com ([2001:41d0:203:375::f8] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBGk-0000000FyQh-0DLU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:08:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=aHdZ+oKwe6OINwv5V856+JzJxIwxr2tU0lqEBlQhC6Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792746534; v=1; x=1793351334;
 b=YhMEulwsp/QsUd99VJaV3o26pysi14VNd/bt7eNg9qJ8cFjSdyYVIr0cHMXHtEuvGL5Tu1kM
 +vbuBML+WgXNesu0Ewf6zg08nGE5H02QycFHoaurcDX5nofHaiRGhUTzSyEeTrfhk8MMM5UBcgW
 3P7/jgV43qH/fLyLHSxGUHqs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 69bdc8802346e69d;
	Fri, 23 Oct 2026 09:08:54 +0000
X-Mizu-Trace-ID: 69bdc8802346e69d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be58ad9600so6446e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 02:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUR/EYKI5tft1M6FBMsgGEEa2E8jOZBTNAou+LtZ/Qi7FMBBlEs1SAMrA5fIvGa3T+0hpTnMBk/BndcJEa03YI@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+YixVdfOHnWUFQWuJy3mZH+IAFrk7JB+OtJZAlLefsNOOKoyr
	h7TF/eG82wBwaMbZLsELNx6S2elwRn4KwRERJGqcXpghO6X5cGJJzNyA8WF9qrl9wytD+cRKtvS
	377+nhOzQGIKR8WnoylF7l/m/uXWvjYANiiYRwJ8M
X-Received: by 2002:a05:6512:3f03:b0:5bf:a49c:ddde with SMTP id
 2adb3069b0e04-5bfb06b5140mr90492e87.10.1792746528071; Fri, 23 Oct 2026
 02:08:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org>
In-Reply-To: <86fqxwzul7.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 23 Oct 2026 10:08:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
X-Gm-Features: AclHuK8By_xwbQyrvckEGFfA4cAUoxoiGOv41Z9xRvku379045c1KVkkaVcFF80
Message-ID: <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_020858_399739_19981D25 
X-CRM114-Status: GOOD (  10.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Fri, 23 Oct 2026 09:31:32 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Why settle for the least capable option? Context switching ACCDATA_EL1
> is easy enough, can be gated on guest features, and avoid the
> userspace horror story.
>
> I'd rather see that.

Context switching it means accessing ACCDATA_EL1 at EL2, which traps
to EL3 unless SCR_EL3.ADEn is set. booting.rst doesn't require ADEn
today, and TF-A only sets it when built with ENABLE_FEAT_LS64_ACCDATA,
which defaults to off. On such a host, KVM traps to EL3 the first time
it switches ACCDATA_EL1 for a VM, and every VM has LS64_ACCDATA by
default. The cap leaves the register alone, and the fine-grained trap
takes priority over ADEn, so it works whatever ADEn is set to.

Should we keep the cap as the fix for stable, and post ACCDATA support
on top? If you agree, I'd rebase your patches 3, 4 and 8 from [1], add
a booting.rst requirement for ADEn and EnAS0, and lift the cap and the
compat.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20240815125959.2097734-1-maz@kernel.org/

