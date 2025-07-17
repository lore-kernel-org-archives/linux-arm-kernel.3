Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94019C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmyBVnSCWNBRTlsOdXKz3RmNsU7CI1q0RXFAMQ9Wydk=; b=CrGgxXpxKLTOm3yOdFLVxDsBHS
	yyfHEqV2pnce+7UJRz7X75tJr3aIegRIRl7jCwIeCAuUnKk6HJd+h/ag1yI7CRvR/LyQgmAd4Q5Bq
	r2FA5TnJ23H34mvIGD6kFLkA9tfcqON6gBQIipIAUhpY14Mq7Icusn30zYSVFCgQktjGQkTsYX1zE
	lP1nfeiJqrfhJU93mf+fBkFizvEfoVXBGzAVN6g/5g6l6jaI+alSiRVp+a7SlEmcNlN36dJAaggNa
	zf3opLWoGzndwoZ18NmrXu87qeDObjCCh80UaOPIiwsuJur3a4K6rdJQ6/rSnWyUU+k2OvFMnAHM7
	MF0Zqwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRaN-0000000AfMD-38mz;
	Thu, 17 Jul 2025 16:35:55 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQrj-0000000AXhQ-05m2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:49:49 +0000
Message-ID: <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752767381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QmyBVnSCWNBRTlsOdXKz3RmNsU7CI1q0RXFAMQ9Wydk=;
	b=Oh9dEpt4NBGGciIxe5lj+3Tk12hdtngpQ6Jtc+Bcf+EDW8yCs7dzUVajfES84GLOqKw5FF
	fgPuR4LeyCRiw05DsiitphI4I3JVmDtHb4P5MgMiABARyGo72S41ON6JfWhUN6Pf4LaCcB
	wy4FEebRmiEdiUUuSluf6q0rD0CvJ6I=
Date: Thu, 17 Jul 2025 11:49:37 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net v2 1/4] auxiliary: Support hexadecimal ids
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
 Saravana Kannan <saravanak@google.com>, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Ira Weiny <ira.weiny@intel.com>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
 <20250716000110.2267189-2-sean.anderson@linux.dev>
 <2025071637-doubling-subject-25de@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025071637-doubling-subject-25de@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_084947_657876_0D266677 
X-CRM114-Status: GOOD (  11.37  )
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

On 7/16/25 01:09, Greg Kroah-Hartman wrote:
> On Tue, Jul 15, 2025 at 08:01:07PM -0400, Sean Anderson wrote:
>> Support creating auxiliary devices with the id included as part of the
>> name. This allows for hexadecimal ids, which may be more appropriate for
>> auxiliary devices created as children of memory-mapped devices. If an
>> auxiliary device's id is set to AUXILIARY_DEVID_NONE, the name must
>> be of the form "name.id".
>> 
>> With this patch, dmesg logs from an auxiliary device might look something
>> like
>> 
>> [    4.781268] xilinx_axienet 80200000.ethernet: autodetected 64-bit DMA range
>> [   21.889563] xilinx_emac.mac xilinx_emac.mac.80200000 net4: renamed from eth0
>> [   32.296965] xilinx_emac.mac xilinx_emac.mac.80200000 net4: PHY [axienet-80200000:05] driver [RTL8211F Gigabit Ethernet] (irq=70)
>> [   32.313456] xilinx_emac.mac xilinx_emac.mac.80200000 net4: configuring for inband/sgmii link mode
>> [   65.095419] xilinx_emac.mac xilinx_emac.mac.80200000 net4: Link is Up - 1Gbps/Full - flow control rx/tx
>> 
>> this is especially useful when compared to what might happen if there is
>> an error before userspace has the chance to assign a name to the netdev:
>> 
>> [    4.947215] xilinx_emac.mac xilinx_emac.mac.1 (unnamed net_device) (uninitialized): incorrect link mode  for in-band status
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>> Changes in v2:
>> - Add example log output to commit message
> 
> I rejected v1, why is this being sent again?

You asked for explanation, I provided it. I specifically pointed out why
I wanted to do things this way. But I got no response. So here in v2.

--Sean

