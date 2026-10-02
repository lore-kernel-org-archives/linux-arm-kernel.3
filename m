Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0D6CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvmB6zyAfevLbB9RCSK1DuwhV/UjwgPSkov7Fabnr5k=; b=hcWo5Br3JEBRGWMgZ+hSvbsw5f
	r85ONeqy+h50+B0fj6GFmU4ttL33R5J96r4WQPn3fX0qpB+fR3zgreL/ySH6RtGevtO9tYIl5Lm1m
	mk4OuSTfUF8GSVm5wTzB5YEl5jIWwjxuXzEMd4Ir/I4Wu27jZV5psF/UNYhn+lvhFWMXffeJAgJQi
	qc/5w0fhJN+nII+HPz4QYhYP/AYuzM7O6e1yRnt5UBTs8PDLog319McEFcfVbTf+y1o9zBHvdjOPm
	wXcyF3JEv5BDNGqUiBlP4eoLUqhVdyPmdfzcE7heQoym4oiE69H1RfoMwJu3MAqsPK9WPsxpEScdT
	vTwHxBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfDR-0000000BvYt-0Dly;
	Fri, 02 Oct 2026 15:30:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfDO-0000000BvY4-1igm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:30:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB41143D;
	Fri,  2 Oct 2026 08:30:22 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7875D3F85F;
	Fri,  2 Oct 2026 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955025; bh=Z2LspGkQ5z5Seubq49ws0rOaPx79NGD0/r2VYPepM9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YOBqbhh55rD5PUXRNb3Ao6y0RLQ96QltvKZhxCchZq1Z/lO0gHRPTiAA+LGjUehv7
	 yC7EzJ9USIf9GqOP62vpmL+ofQ/VqCApwg4D9ueDOgRBSdYv6uM+gHHeVMGDx/tv5r
	 /n0vLT5V7kayeSsY5Sk8Uhn6wnKbWzRP4+Mtyc8o=
Message-ID: <7657b40e-ae69-4218-b5fa-dd00417dfc97@arm.com>
Date: Fri, 2 Oct 2026 16:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Use linux-arm-kernel list for the MPAM
 driver
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com, Gavin Shan <gshan@redhat.com>,
 Yin Li <yin.li@oss.qualcomm.com>
References: <20260915103101.1659477-1-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260915103101.1659477-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083026_496184_7A64156A 
X-CRM114-Status: GOOD (  12.83  )
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

Hi Ben,

On 15/09/2026 11:31, Ben Horgan wrote:
> As MPAM is an arm64 feature and patches mostly go via the arm64 maintainers
> it may be reasonably expected that the MPAM driver uses the list-arm-kernel
> list.
> 
> Make this official by adding the L: in MAINTAINERS.

Makes sense - I've picked this up to send on to Catalin.


Thanks,

James

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6215fcb07770..2113a0051b52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18436,6 +18436,7 @@ M:	James Morse <james.morse@arm.com>
>  M:	Ben Horgan <ben.horgan@arm.com>
>  R:	Reinette Chatre <reinette.chatre@intel.com>
>  R:	Fenghua Yu <fenghuay@nvidia.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/resctrl/mpam_*
>  F:	drivers/resctrl/test_mpam_*


