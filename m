Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC00C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrOx+/apw76P7y8j1/mgdZ4vaD1KHTVdG+YsGK+HOmA=; b=BLCH5d9TsAa4YMjSZF/P9fKlOW
	URAB5+ZFZjTzd8Le1F/Mba+1VIdgOjw92ShE89Ba67kdHQveoWKl9yLt9smZbWlCgyUfE6zTcn9Ek
	w62ejHBt9OygSIwO03V2bckhaUcbQ2hwSbd8tbDb8rUCwKv0Dz5PYw9WGT/wQpj9RvoB0xoUL4yas
	XlBhs58+2HZ3FQHt+tAlKdKoCHomlpQMXWISxiBfiYMJVM6Npsv/UBj7mgVVWnOF2DaB6UVQfECNU
	yXPbFuMqNgUV2m68iuEJzXXEC1VVVtNt/ZeoKH7fk0Y4cwDuAd3XYyWPfYoDM3W6a1EZCUAreb6tX
	lMmwpI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whclr-00000000f9R-1Eie;
	Thu, 09 Jul 2026 00:37:43 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whclo-00000000f8v-0gGW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:37:41 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 1D69320B716B; Wed,  8 Jul 2026 17:37:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1D69320B716B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1783557453;
	bh=JrOx+/apw76P7y8j1/mgdZ4vaD1KHTVdG+YsGK+HOmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUET2RvGdkncNw69to87iw7S3f/NPkqwYmu6fiqYF5YEXLN//hZreIZ84xWdlX6Rc
	 vJ5eJ99cti9MekYuKW5lwMpnHKhL2V1Pq53AFnQo6/zwZu1PQaW0+hpaPMSEvB8a+0
	 rkFCuZzaFnQZwShNW3NfCM1d6kABiFMwvl8F19/Q=
Date: Wed, 8 Jul 2026 17:37:33 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mike Rapoport <rppt@kernel.org>, ardb@kernel.org, david@kernel.org,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, bboscaccy@linux.microsoft.com,
	bp@alien8.de, dapeng1.mi@linux.intel.com, ebiggers@kernel.org,
	elver@google.com, enelsonmoore@gmail.com,
	feng.tang@linux.alibaba.com, gpiccoli@igalia.com, kees@kernel.org,
	kuba@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lirongqing@baidu.com, peterz@infradead.org, rdunlap@infradead.org,
	tgopinath@linux.microsoft.com, tony.luck@intel.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ak7tTVs6tWZPOln0@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>
 <ak4fu1qINGyAQUEl@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4fu1qINGyAQUEl@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_173740_247265_E042CADB 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Catalin,

On 08 Jul 2026 11:00, Catalin Marinas wrote:
> Hi Shyam,
> 
> Adding Lorenzo, Hanjun, Sudeep.
> 
> On Tue, Jun 30, 2026 at 10:09:11AM -0700, Shyam Saini wrote:
> > Following up on this, As Mike pointed that reserve_mem is best effort
> > reservation mechanism, so what is the recommended reliable Linux
> > mechanism, if any, to reserve a predetermined memory range during
> > early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
> > one option, but I'm specifically looking for a solution that preserves
> > the region across warm reboots.
> 
> If you need ramoops-like support, I think ACPI ERST is a better fit and
> we don't need any memory reservation tricks. I'll let the arm ACPI
> maintainers comment further.
> 

while this patch mentions use case of ramoops, there are other uses cases that
requires predetermined memory reservation at boot time, one of them is PMEM.
Like Mike pointed out in this [1] thread, we don't seem to have an
equivalent mechanism for reserving predetermined memory on ARM/ACPI
platforms, as is available on ARM/DTS based platforms.

Thanks,
Shyam

[1] https://lore.kernel.org/lkml/ak3v6dt_VIZTynT8@kernel.org/


