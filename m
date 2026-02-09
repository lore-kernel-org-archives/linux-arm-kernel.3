Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE18EF070A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 04:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZn+Un7x6aFWol1H9vbzKFNdVDxww8BeQerONjbIvuU=; b=xMIDGwwCDuuEY6tjGrfzcYpzH0
	z6uGfcV8k9LXPMETGEkqFnNpjLOeuWta6rzEvIEKHbxKCPxDUKuuIAU/jh2to/abHib0CcDAGnbK3
	b3afUvkJAKcL3YjThoFd35g9x6IdMA3jBWo3POZPYRmIs7+hZ9UU7LGZFpZ1F8c6G7KcCv8xjTSPJ
	7+lVmyFn+ydsFOuzqiD5iiHQe42Pp50gVKe82mZyprxRUymCu3Wy7cOMkkjBuRa6T8ofKBzxDrySe
	xAgl9f9VacAL9M1WwI/LTJuTHbFx+yzOntM6v/P7ZHO6gzuguW/EsN0nOR1DFE0xktJ8Bhro3zJVI
	IhtVpT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJMm-0000000EpgJ-3KmD;
	Mon, 09 Feb 2026 04:59:20 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJMb-0000000Epeo-3M7E;
	Mon, 09 Feb 2026 04:59:09 +0000
Message-ID: <9c15a656-b7f0-4187-8e49-1c9e304e39ab@infradead.org>
Date: Sun, 8 Feb 2026 20:59:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/12] asm-generic: barrier: Add
 smp_cond_load_acquire_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <20260209023153.2661784-1-ankur.a.arora@oracle.com>
 <20260209023153.2661784-7-ankur.a.arora@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260209023153.2661784-7-ankur.a.arora@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 2/8/26 6:31 PM, Ankur Arora wrote:
> + * @cond: boolean expression to wait for

  @cond_expr:


-- 
~Randy


