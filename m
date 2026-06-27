Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2445BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 01:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3misQc9HlKUNeYqqO4Fnmvv4Fv9RkyhsTgdLQ0BWz0=; b=RrkW9bClFXHKjtsPJyTQ4oHw1B
	p9jbagMHpriz0hVvLLuSsT9tmhQ07/8H37Dxq+nxEu0g2cUX7f9FvPzGJ8PTd2noV5Tdrp9Guzf1T
	ALr1JpA4zwjpXUQdKdZcgoUC6ZhBhverK9U3s/fWc4aNHXomRXlUrPSDSFKrYBN3DzHf2dUqVh74P
	cGV8d8Zv3CdMY2SLeAY/zmVxR82NP06bm8eIvINY5PXPLOY+DMeNC2ab4l+Li/v9/7bPjk9Lr3r1X
	KZYu/jX7dMeE9VWm2EssND8Ng5GH7/UD85lkqTfQpMSQSTT12LEFxGrXYnRCKXZ/r5dspH9x0ZrZh
	1wnhZXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdI3s-0000000C3ug-20re;
	Sat, 27 Jun 2026 01:42:24 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdI3q-0000000C3uB-05G2;
	Sat, 27 Jun 2026 01:42:23 +0000
Received: from [IPV6:2601:646:8081:7da1:dcd4:e1f8:5d79:bdb4] ([IPv6:2601:646:8081:7da1:dcd4:e1f8:5d79:bdb4])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65R1EHQ12354017
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 26 Jun 2026 18:14:17 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65R1EHQ12354017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026052701; t=1782522861;
	bh=a3misQc9HlKUNeYqqO4Fnmvv4Fv9RkyhsTgdLQ0BWz0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ieVY684FxDj35+1OdJbAri1pdBhTN2gqeIU7j2Y370sBUQ30QPhmIZvW75cKJPbdR
	 IMWIkamCPLrfWfNgBKcB3PhaMkYzKHTrmnUKLa1e+ZLSJhv19+SOXDBLXcwGBwQUQm
	 r/XHx5z9usnk9iv+AszJJxJtR+3sMk9VLHHsh52YfG3DsQ64mFPl5qVJWfAy/D+2Rh
	 S+WMDllsVtD5pOEp++Uf505LlYCJ5QwZinre3Oi8+jbt4xxPtHa6lglEWhLpIlBWBv
	 8Y8Cvo1WqplQrMHkk6CviVuUOV0LSl6zFgnbsOyQby5POoRmSu/3wfwF+nNtjeJn02
	 kxE798jNrTxdQ==
Message-ID: <33ef4e7b-3139-4cb8-9545-6d445bf6e5f1@zytor.com>
Date: Fri, 26 Jun 2026 18:14:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/18] raid6: warn when using less than four devices
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>,
        Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
        Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-raid@vger.kernel.org
References: <20260518051804.462141-1-hch@lst.de>
 <20260518051804.462141-9-hch@lst.de>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260518051804.462141-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_184222_090636_C0A9D467 
X-CRM114-Status: GOOD (  13.09  )
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

On 2026-05-17 22:17, Christoph Hellwig wrote:
> Quoting H. Peter Anvin who came up with the RAID6 P/Q algorithm, and
> who wrote the initial implementation, then still part of the md driver:
> 
>   The RAID-6 code has *never* supported only 3 units, and if it ever
>   worked for *any* of the implementations it was purely by accident.
>   Speaking as the original author I should know; this was deliberate as
>   in some cases the degenerate case (3) would have required extra trays

Stupid autocorrect. That was of course supposed to be "tests" (as in extra
code paths) not "trays" :)

>   in the code to no user benefit.
> 
> While md never allowed less than 4 devices, btrfs does.  This new
> warning will trigger for such file systems, but given how it already
> causes havoc that is a good thing.  If btrfs wants to fix third, it
> should switch to transparently use three-way mirroring underneath,
> which will work as P and Q are copies of the single data device by
> the definition of the Linux RAID 6 P/Q algorithm.

For what it's worth, this is also true in the degenerate two-drive RAID-4|5
case (D = P).

	-hpa


