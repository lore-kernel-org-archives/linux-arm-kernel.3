Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B48C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OBi2VHyrU+pOPAueKZI+G7FC7uZmIiWFu/BRss/mko=; b=p+7ye+uV4HGEjS1DLWDYeWRVwT
	nnTJAhDInpEPO6qdGH8QPcFXuCnvAf7rpESU0yNvf1NKJDlSDxxmN39IIn3o5iEJeCiWDtTxC3LgY
	G1YrwdycjfoC5tf8Ckx9zGNgWbyq3tNtMYpFSEr5IwtW1t/JS+wibiTVVXGRlRqq539vPiz6qtMTU
	ItyB0NyPEsfQEhQQNHtblAYDAbH9VXiTrcsgqn21azTqbas8b8mwNIcacxkJf5tr91oEaKUzahfYu
	ofi/dE76WQNqkXp0ZzaoaGADjLImWQnNVaznoYY19eDYkoMyB5IFcVjC2jeiIIjVhJivste5pUia5
	evmiFZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TJz-000000024Um-3P3D;
	Fri, 04 Sep 2026 12:47:07 +0000
Received: from out-218.mta1.migadu.com ([2001:41d0:203:375::da] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TJv-000000024Ts-3dEz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:47:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/6RRvdPfNSRfPhC78RQVkUQB+HiIR+zg4OQYXsiR3d4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788526021; v=1; x=1789130821;
 b=w/2ikd3SC+qeSC018jWEunwvoqyRVuBq8+mED1OYxKUVlCS4r3/8rKHGGcHB219dgaTxlBCY
 WPy79JzMqC8+fkTKZKSFLxwN3++A7ovR9jX8Ili0d5/T3nGsmvRP6RI90vRr4PZwxVtorWXSdmh
 W0WCQ4Ipr+RCMuVmgWEFQH7s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9ea9f0c937c048ec;
	Fri, 04 Sep 2026 12:47:01 +0000
X-Mizu-Trace-ID: 9ea9f0c937c048ec
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so5350e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:46:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwguSSZjmAK+zoJa/vHtJp7RnfmofmK0zA60LghEulX2GxRyxsR0i9s4QyUEMTFcpMhQz8M9l5tcd+Tzi00gfCv@lists.infradead.org
X-Gm-Message-State: AFuF++mzOIjwKb37W4WrU0YDqU4xNHEFChZftf4t3O0mlCEgOQS3Rs/S
	NunIoTxnck3xPUor0zPX3SG0Ibw2SaZxkS5ijonr2odOq79byPXoe7bIArGjMiC6Piu5yAz/OmW
	QVOZduD9BGjxUKOshvsM1bERRpo7QfWWAKAPmXf1B
X-Received: by 2002:a05:6512:3d24:b0:5b5:e890:1953 with SMTP id
 2adb3069b0e04-5b6170e3a94mr115834e87.12.1788526017205; Fri, 04 Sep 2026
 05:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260904122445.31163-1-hemanth.selam@gmail.com> <20260904122445.31163-4-hemanth.selam@gmail.com>
In-Reply-To: <20260904122445.31163-4-hemanth.selam@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 13:46:21 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwW64qwPPAY7GpGWnW7kTHgK+NOycPD+ztZLu8MxhKEgg@mail.gmail.com>
X-Gm-Features: AcwNN1W9fb-ZaN5mBBYmzsD57qiSfwaTLbZIgob5aDfYAa6RFKBB487JA6wU6YI
Message-ID: <CA+EHjTwW64qwPPAY7GpGWnW7kTHgK+NOycPD+ztZLu8MxhKEgg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: kvm: fix repeated word 'is' in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_054704_886702_03A96F78 
X-CRM114-Status: GOOD (  18.67  )
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

Hi Hemanth,

On Fri, 4 Sept 2026 at 13:25, Hemanth Selam <hemanth.selam@gmail.com> wrote:
>
> Drop the second 'is', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  arch/arm64/kvm/pauth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/pauth.c b/arch/arm64/kvm/pauth.c
> index d5eb3ae876be..22ff4b78d0e9 100644
> --- a/arch/arm64/kvm/pauth.c
> +++ b/arch/arm64/kvm/pauth.c
> @@ -5,7 +5,7 @@
>   *
>   * Primitive PAuth emulation for ERETAA/ERETAB.
>   *
> - * This code assumes that is is run from EL2, and that it is part of
> + * This code assumes that is run from EL2, and that it is part of

The typo here is that the first "is" should have been an "it", rather
than being a duplicate.

+ * This code assumes that it is run from EL2, and that it is part of

Cheers,
/fuad

>   * the emulation of ERETAx for a guest hypervisor. That's a lot of
>   * baked-in assumptions and shortcuts.
>   *
> --
> 2.48.1
>

