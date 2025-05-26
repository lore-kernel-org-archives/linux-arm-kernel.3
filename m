Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02009C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbVnkPRVpMtVn5Z4ZBr7rm8h5rSjIm70f4DaBrWVIqs=; b=JeNe0OcpZ9C25wEPV4dvm1QZUs
	xKj844JsA3Hm4VMz4a08zcyt6P/8JnMFpBsqEptUa26+6DBjC/9ZsBx8bK0rgj3Wq9gDNiYzSFVhZ
	3V1r7FhfiOg3eaTQCsEs2mKseaqTa4fYnqJroows419qGj8Ad962/9GHVy5hAosvQZwlvntP3f+oi
	wRgbADcV6nV3896P0cDGHwO3JWm3sweYi/bFfWpsfZs1HIfyfHdZJ5q7/y3etxTRr3xLhv76EttsH
	UvgadkqjHIZYTWC530Z/zuleBIMTKdiK8REhh76Mmakmq9wvOShonp/O4jZ+9D+ubwUX4USM9YRWk
	5nbJ9HwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaJD-00000009CLg-3b7t;
	Mon, 26 May 2025 16:04:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaH6-00000009CDY-2iXm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 16:02:05 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id C86E42068336;
	Mon, 26 May 2025 09:02:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C86E42068336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1748275323;
	bh=xbVnkPRVpMtVn5Z4ZBr7rm8h5rSjIm70f4DaBrWVIqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VQcTQFFFHvc4iuNUgmNMyC6xui2eGdu15QhEiNHf2/v1oaOuK59MkaUzqoMHl0NsA
	 l+kQojT+RkIdLTERp5TMFTTcXS02VU1NFRqKvpdrnTHvh02Z/4eGtJu7dT5HZMSNCS
	 fVkdhIj8m1XE5j0GwcxLq7OpaiSuGWePJ51f2cdg=
From: Roman Kisel <romank@linux.microsoft.com>
To: mhklinux@outlook.com
Cc: apais@microsoft.com,
	arnd@arndb.de,
	benhill@microsoft.com,
	bp@alien8.de,
	bperkins@microsoft.com,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	kys@microsoft.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	romank@linux.microsoft.com,
	sunilmut@microsoft.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	x86@kernel.org
Subject: RE: [PATCH hyperv-next v2 1/4] Documentation: hyperv: Confidential VMBus
Date: Mon, 26 May 2025 09:02:01 -0700
Message-ID: <20250526160201.2535-1-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <SN6PR02MB4157DC69BA25D889CD838D04D49DA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <SN6PR02MB4157DC69BA25D889CD838D04D49DA@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_090204_739001_31788292 
X-CRM114-Status: GOOD (  35.18  )
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

> From: Roman Kisel <romank@linux.microsoft.com> Sent: Sunday, May 11, 2025 4:08 PM
>> 
>> Define what the confidential VMBus is and describe what advantages
>> it offers on the capable hardware.
>> 
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> ---
>>  Documentation/virt/hyperv/vmbus.rst | 41 +++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>> 
>> diff --git a/Documentation/virt/hyperv/vmbus.rst
>> b/Documentation/virt/hyperv/vmbus.rst
>> index 1dcef6a7fda3..ca2b948e5070 100644
>> --- a/Documentation/virt/hyperv/vmbus.rst
>> +++ b/Documentation/virt/hyperv/vmbus.rst
>> @@ -324,3 +324,44 @@ rescinded, neither Hyper-V nor Linux retains any state about
>>  its previous existence. Such a device might be re-added later,
>>  in which case it is treated as an entirely new device. See
>>  vmbus_onoffer_rescind().
>> +
>> +Confidential VMBus
>> +------------------
>> +
>> +The confidential VMBus provides the control and data planes where
>> +the guest doesn't talk to either the hypervisor or the host. Instead,
>> +it relies on the trusted paravisor. The hardware (SNP or TDX) encrypts
>> +the guest memory and the register state also measuring the paravisor
>> +image via using the platform security processor to ensure trusted and
>> +confidential computing.
>> +
>> +To support confidential communication with the paravisor, a VMBus client
>> +will first attempt to use regular, non-isolated mechanisms for communication.
>> +To do this, it must:
>> +
>> +* Configure the paravisor SIMP with an encrypted page. The paravisor SIMP is
>> +  configured by setting the relevant MSR directly, without using GHCB or tdcall.
>> +
>> +* Enable SINT 2 on both the paravisor and hypervisor, without setting the proxy
>> +  flag on the paravisor SINT. Enable interrupts on the paravisor SynIC.
>> +
>> +* Configure both the paravisor and hypervisor event flags page.
>> +  Both pages will need to be scanned when VMBus receives a channel interrupt.
>> +
>> +* Send messages to the paravisor by calling HvPostMessage directly, without using
>> +  GHCB or tdcall.
>> +
>> +* Set the EOM MSR directly in the paravisor, without using GHCB or tdcall.
>> +
>> +If sending the InitiateContact message using non-isolated HvPostMessage fails,
>> +the client must fall back to using the hypervisor synic, by using the GHCB/tdcall
>> +as appropriate.
>> +
>> +To fall back, the client will have to reconfigure the following:
>> +
>> +* Configure the hypervisor SIMP with a host-visible page.
>> +  Since the hypervisor SIMP is not used when in confidential mode,
>> +  this can be done up front, or only when needed, whichever makes sense for
>> +  the particular implementation.
>> +
>> +* Set the proxy flag on SINT 2 for the paravisor.
>
>I'm assuming there's no public documentation available for how Confidential
>VMBus works. If so, then this documentation needs to take a higher-level
>approach and explain the basic concepts. You've provided some nitty-gritty
>details about how to detect and enable Confidential VMBus, but I think that
>level of detail would be better as comments in the code.
>
>Here's an example of what I envision, with several embedded questions that
>need further explanation. Confidential VMBus is completely new to me, so
>I don't know the answers to the questions. I also think this documentation
>would be better added to the CoCo VM topic instead of the VMBus topic, as
>Confidential VMBus is an extension/enhancement to CoCo VMs that doesn't
>apply to normal VMs.
>
>------------------------------------------
>
>Confidential VMBus is an extension of Confidential Computing (CoCo) VMs
>(a.k.a. "Isolated" VMs in Hyper-V terminology). Without Confidential VMBus,
>guest VMBus device drivers (the "VSC"s in VMBus terminology) communicate
>with VMBus servers (the VSPs) running on the Hyper-V host. The
>communication must be through memory that has been decrypted so the
>host can access it. With Confidential VMBus, one or more of the VSPs reside
>in the trusted paravisor layer in the guest VM. Since the paravisor layer also
>operates in encrypted memory, the memory used for communication with
>such VSPs does not need to be decrypted and thereby exposed to the
>Hyper-V host. The paravisor is responsible for communicating securely
>with the Hyper-V host as necessary.  [Does the paravisor do this in a way
>that is better than what the guest can do? This question seems to be core to
>the value prop for Confidential VMBus. I'm not really clear on the value
>prop.]
>
>A guest that is running with a paravisor must determine at runtime if
>Confidential VMBus is supported by the current paravisor. It does so by first
>trying to establish a Confidential VMBus connection with the paravisor using
>standard mechanisms where the memory remains encrypted. If this succeeds,
>then the guest can proceed to use Confidential VMBus. If it fails, then the
>guest must fallback to establishing a non-Confidential VMBus connection with
>the Hyper-V host.
>
>Confidential VMBus is a characteristic of the VMBus connection as a whole,
>and of each VMBus channel that is created. When a Confidential VMBus
>connection is established, the paravisor provides the guest the message-passing
>path that is used for VMBus device creation and deletion, and it provides a
>per-CPU synthetic interrupt controller (SynIC) just like the SyncIC that is
>offered by the Hyper-V host. Each VMBus device that is offered to the guest
>indicates the degree to which it participates in Confidential VMBus. The offer
>indicates if the device uses encrypted ring buffers, and if the device uses
>encrypted memory for DMA that is done outside the ring buffer. [Are these
>two settings independent? Could there be a device that has one set, and the
>other cleared? I'm having trouble understanding what such a mixed state
>would mean.] These settings may be different for different devices using
>the same Confidential VMBus connection.
>
>Because some devices on a Confidential VMBus may require decrypted ring
>buffers and DMA transfers, the guest must interact with two SynICs -- the
>one provided by the paravisor and the one provided by the Hyper-V host
>when Confidential VMBus is not offered. Interrupts are always signaled by
>the paravisor SynIC, but the guest must check for messages and for channel
>interrupts on both SynICs.  [This requires some further explanation that I
>don't understand. What governs when a message arrives via the paravisor
>SynIC vs. the hypervisor SynIC, and when a VMBus channel indicates an
>interrupt in the paravisor SynIC event page vs. the hypervisor SynIC event
>page? And from looking at the code, it appears that the RelIDs assigned
>to channels are guaranteed to be unique within the guest VM, and not
>per-SynIC, but it would be good to confirm that.]
>
>[There are probably a few other topics to add a well.]

Michael,

Appreciate your help very much! I'll fill the gaps you've pointed out in
this patch and other ones.

--
Thank you,
Roman

