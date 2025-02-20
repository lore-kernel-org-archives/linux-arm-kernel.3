Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32308C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNwF/TmLe06a3bjDk2gyUgRGrHM5swdU3hTbrZcKuHQ=; b=1geb0ow2Vq+YWcjyyCKJD2EWdi
	uYHI8thM2WS6Vj4K5P4Fs9cLLy3eHCotGmTw3s0BvAnttdefNtQ1F380VYF7xNZwmeEmsBlIqY8jh
	B48xI8DBfu9p9q1x3Jdpq3HUqqWjL525ZvQ3NtLH88S6047ouHSjynmIQ6uzvQdLsRrR4MYcBne/B
	SlgSlSoV+P/vMfy+/MIXNe3jByMGsElO+FuD6Z2S+tvVu29nhIEDnGwIYPgYGwf1niCnqSpW0j+Qf
	2gUft/masNVf2NkKx2fW5KpujbhvavW8go3/i86ew3DMo+5KPasaS++zjaSNthHacfBokf8/QxYTp
	kdCzYLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9ak-00000001udS-0b3L;
	Thu, 20 Feb 2025 16:40:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9Xh-00000001tuA-17FF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:36:54 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8250A20376F8;
	Thu, 20 Feb 2025 08:36:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8250A20376F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740069411;
	bh=cNwF/TmLe06a3bjDk2gyUgRGrHM5swdU3hTbrZcKuHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O90HNH/WVZcizQUG/bBmDXrhQmO6I6OuNcVudW3ubvh6sEMRKmFsVh320lL0RI82m
	 gB+l+vwS3571aHGPAe9oRsh5knORk/AThp2CLTkuLZlJTg+MlM3A7nEWXVnzzet3Ai
	 AneBCVj5jBieBuTrlJZTpjp/uzwBxBXe9+gGakck=
Message-ID: <fb162f81-9365-425d-8153-75c2c7d5ff13@linux.microsoft.com>
Date: Thu, 20 Feb 2025 08:36:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 2/6] Drivers: hv: Enable VTL mode for arm64
To: Michael Kelley <mhklinux@outlook.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "bp@alien8.de" <bp@alien8.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "kw@linux.com" <kw@linux.com>, "kys@microsoft.com" <kys@microsoft.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "will@kernel.org"
 <will@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "benhill@microsoft.com" <benhill@microsoft.com>,
 "bperkins@microsoft.com" <bperkins@microsoft.com>,
 "sunilmut@microsoft.com" <sunilmut@microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-3-romank@linux.microsoft.com>
 <SN6PR02MB4157EFEE74BD71B6392502A0D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157EFEE74BD71B6392502A0D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_083653_336464_1B93DE44 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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



On 2/19/2025 3:14 PM, Michael Kelley wrote:
> From: Roman Kisel <romank@linux.microsoft.com> Sent: Tuesday, February 11, 2025 5:43 PM

[...]

>>   config HYPERV_VTL_MODE
>>   	bool "Enable Linux to boot in VTL context"
>> -	depends on X86_64 && HYPERV
>> +	depends on (X86 || ARM64)
> 
> Any reason to choose "X86" instead of "X86_64"? I can't
> imagine VTL mode making any sense for 32-bit, but maybe
> I'm wrong! :-)

You're 100% right, appreciate your review very much :)
Will tweak this in the next submission.

-- 
Thank you,
Roman


