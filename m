Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98ECCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIfu0j97IyRXPCOtWvYmSqItFYmGHK25glR1j9+hfWs=; b=uC4Xy65U4yCSSoVo5aBYtm6RC2
	10Tey9RlklOY8X48LLi4HYDTAr0waAD9b+BJ/FS5T+/QLRNQt4mZ7uPZw0FxPnnX838m7QP9WqnDC
	KHv1tgT/fCMAonL7LvZZ8LoJQqDBtch2lqFrGqz1S/f4Tx+XAIcgA5b5UsPYF+NIPk8zL/Wl1c5c/
	5zor1ZBBAD0fAlLpNJjbuRAeXfd7mBjN3jQe+G4UZ52pzJFreTKEQZZx2exaQOhgAZ2ccY+ULww14
	BgqtGNC4kkgrlLroE/abkU7p+k7Ad6UO5zAgNCAcNx40+T5DLOY4T8d7NgqsXVP3q+ORcnRplGaw7
	eBdiwBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1v4-00000008mYT-3kB1;
	Tue, 09 Sep 2025 17:14:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvYE-00000006NmD-33sZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:26:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B85C3113E;
	Tue,  9 Sep 2025 03:26:05 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CDB83F66E;
	Tue,  9 Sep 2025 03:26:08 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:26:05 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 07/33] arm64: kconfig: Add Kconfig entry for MPAM
Message-ID: <aMAAvXz0zWqoiGm4@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-8-james.morse@arm.com>
 <aK7llvNbXZKWhtoo@e133380.arm.com>
 <978cf822-4d7c-4301-bbc4-752f184c93d6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <978cf822-4d7c-4301-bbc4-752f184c93d6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_032614_842569_C10811FD 
X-CRM114-Status: GOOD (  25.55  )
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

Hi,

On Thu, Sep 04, 2025 at 06:28:14PM +0100, James Morse wrote:
> Hi Dave,
> 
> On 27/08/2025 12:01, Dave Martin wrote:
> > <super-pedantic mode enabled>
> 
> Uh oh!
> 
> > (Since this likely be people's go-to patch for understanding what MPAM
> > is, it is probably worth going the extra mile.)
> > 
> > On Fri, Aug 22, 2025 at 03:29:48PM +0000, James Morse wrote:
> >> The bulk of the MPAM driver lives outside the arch code because it
> >> largely manages MMIO devices that generate interrupts. The driver
> >> needs a Kconfig symbol to enable it, as MPAM is only found on arm64
> > 
> > Prefer -> "[...] to enable it. As MPAM is only [...]"
> > 
> >> platforms, that is where the Kconfig option makes the most sense.
> > 
> > It could be clearer what "where" refers to, here.
> 
> Sure,
> 
> 
> > Maybe reword from ", that is [...]" -> ", the arm64 tree is the most
> > natural home for the Kconfig option."
> > 
> > (Or something like that.)
> 
> Sure,

[... etc., etc. ...]

> >> +	  partition-id and performance-monitoring-group to measure the
> >> +	  cache occupancy or data throughput.
> > 
> > So, how about something like:
> > 
> > --8<--
> > 
> > 	  Memory system components, such as the caches, can be configured with
> > 	  policies to control how much of various physical resources (such as
> > 	  memory bandwidth or cache memory) the transactions labelled with each
> > 	  PARTID can consume.  Depending on the capabilities of the hardware,
> > 	  the PARTID and PMG can also be used as filtering criteria to measure
> > 	  the memory system resource consumption of different parts of a
> > 	  workload.
> > 
> > -->8--
> 
> Done,
> 
> 
> > (Where "Memory system components" is used in a generic sense and so not
> > capitalised.)
> 
> (I can't wait for the Memory System Component on the Memory Side Cache!)

Urk.

MSC² ?

[...]

Cheers
---Dave

