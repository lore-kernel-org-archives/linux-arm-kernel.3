Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB32C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPw5Z2uvInKn7g/gZE/EvdCBuTQHsMF4h31bQ1SEDak=; b=IqBIo7P6oYJ9eDjqKvzxAjHUvv
	VYXA6YC/M1jPxznV3oWTmcR1dNgeqzcPyFo7iXYr4+Z8TeHSAtf8WT2rrj7WpYE+MKP+wyvX04tiM
	lNft/zE8dIIWPgLqz+SptxMK9OQ2h7axGqepNva0OlfF6QwLtKIXY42rCsUkFFljR/WkIEuCq+MaG
	3/RVo3HS5/MdeZ55hEjuLHQzKDArGbV4WCB50DAR46IhYVV+wBbeU//jGWNdTGofTvcklk+4aJdnE
	9xP92JLdGhF6b7WZ/vny/x66gD0+1Vyp2OXMhtNOF1QaXryBEBHSrBOUlFgKzIbtmdYFe7WvxAihc
	rytUMM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsTP-0000000CvMd-049N;
	Tue, 13 May 2025 16:27:19 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsQw-0000000Cv0y-0XkW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:24:47 +0000
Received: from [10.137.184.60] (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5A823201DB12;
	Tue, 13 May 2025 09:24:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5A823201DB12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1747153483;
	bh=hPw5Z2uvInKn7g/gZE/EvdCBuTQHsMF4h31bQ1SEDak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PujOiI0dqkEedcDbArZnlNr4qQUkjW6EgaOn59dT9qxC2WYV6oog4dOtjs3YNI8TE
	 iAo+tTqsxqY0YkeqIDjtwXto1i0zsLHljx+IWZtRP3rsFwkrdIs0GdGWeX8X0pmiB1
	 aqecwOK6IVebzWSG+HdIF3zto+Z4WMHhZemZ+tA8=
Message-ID: <dd988a9d-edad-4362-a4c2-a6e6b1667e9b@linux.microsoft.com>
Date: Tue, 13 May 2025 09:24:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v2 1/4] Documentation: hyperv: Confidential
 VMBus
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com, arnd@arndb.de, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 kys@microsoft.com, mingo@redhat.com, tglx@linutronix.de, wei.liu@kernel.org,
 will@kernel.org, x86@kernel.org, linux-hyperv@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
References: <20250511230758.160674-1-romank@linux.microsoft.com>
 <20250511230758.160674-2-romank@linux.microsoft.com>
 <5d21de5c-2da2-4a33-8d30-0475bc0edf4b@oracle.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <5d21de5c-2da2-4a33-8d30-0475bc0edf4b@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_092446_219939_EC3A5F19 
X-CRM114-Status: GOOD (  23.20  )
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



On 5/11/2025 10:22 PM, ALOK TIWARI wrote:
> 
> 
> On 12-05-2025 04:37, Roman Kisel wrote:
>> Define what the confidential VMBus is and describe what advantages
>> it offers on the capable hardware.
>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> ---
>>   Documentation/virt/hyperv/vmbus.rst | 41 +++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/ 
>> hyperv/vmbus.rst
>> index 1dcef6a7fda3..ca2b948e5070 100644
>> --- a/Documentation/virt/hyperv/vmbus.rst
>> +++ b/Documentation/virt/hyperv/vmbus.rst
>> @@ -324,3 +324,44 @@ rescinded, neither Hyper-V nor Linux retains any 
>> state about
>>   its previous existence. Such a device might be re-added later,
>>   in which case it is treated as an entirely new device. See
>>   vmbus_onoffer_rescind().
>> +
>> +Confidential VMBus
>> +------------------
>> +
> 
> The purpose and benefits of the Confidential VMBus are not clearly stated.
> for example:
> "Confidential VMBus provides a secure communication channel between 
> guest and paravisor, ensuring that sensitive data is protected from 
> hypervisor-level access through memory encryption and register state 
> isolation."
> 
>> +The confidential VMBus provides the control and data planes where
>> +the guest doesn't talk to either the hypervisor or the host. Instead,
>> +it relies on the trusted paravisor. The hardware (SNP or TDX) encrypts
>> +the guest memory and the register state also measuring the paravisor
> 
> s/alos/while and s/via using/using
> "register state while measuring the paravisor image using the platform 
> security"
> 
>> +image via using the platform security processor to ensure trusted and
>> +confidential computing.
>> +
>> +To support confidential communication with the paravisor, a VMBus client
>> +will first attempt to use regular, non-isolated mechanisms for 
>> communication.
>> +To do this, it must:
>> +
>> +* Configure the paravisor SIMP with an encrypted page. The paravisor 
>> SIMP is
>> +  configured by setting the relevant MSR directly, without using GHCB 
>> or tdcall.
>> +
>> +* Enable SINT 2 on both the paravisor and hypervisor, without setting 
>> the proxy
>> +  flag on the paravisor SINT. Enable interrupts on the paravisor SynIC.
>> +
>> +* Configure both the paravisor and hypervisor event flags page.
>> +  Both pages will need to be scanned when VMBus receives a channel 
>> interrupt.
>> +
>> +* Send messages to the paravisor by calling HvPostMessage directly, 
>> without using
>> +  GHCB or tdcall.
>> +
>> +* Set the EOM MSR directly in the paravisor, without using GHCB or 
>> tdcall.
>> +
>> +If sending the InitiateContact message using non-isolated 
>> HvPostMessage fails,
>> +the client must fall back to using the hypervisor synic, by using the 
>> GHCB/tdcall
>> +as appropriate.
>> +
>> +To fall back, the client will have to reconfigure the following:
>> +
>> +* Configure the hypervisor SIMP with a host-visible page.
>> +  Since the hypervisor SIMP is not used when in confidential mode,
>> +  this can be done up front, or only when needed, whichever makes 
>> sense for
>> +  the particular implementation.
> 
> "SIMP is not used in confidential mode,
> this can be done either upfront or only when needed, depending on the 
> specific implementation."
> 
>> +
>> +* Set the proxy flag on SINT 2 for the paravisor.
> 

Alok, thanks for you continued interest and support! I'll incorporate
your suggestions in the next version of the patchset, great points!

> 
> Thanks,
> Alok
> 

-- 
Thank you,
Roman


