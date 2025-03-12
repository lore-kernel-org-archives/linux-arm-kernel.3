Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E36C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgNM2rD8/EOf05M0lP85WV+gCmyNEYHLXXzpOfe5KVE=; b=gEosBpARTXaNVGt2moYMEI0Qd/
	GO4YWuz0GuvcvxjZ89f/OcgSurc4RMjoskDYtLdzRHEd72n2mt8XUhxIOI0jAtnMlJh8n1wUXAFU7
	G2XLTRZuzw6aUBwKIXHuNMBcrs/3DcWV1C1xMQi+QdAHSb18UWGVd0rZy7hR58x+FlZK9J+kPoA9V
	mCFh8HtCzWhhNYnLTzAopgMyIkMRCY7+U9v5nbGJEDTz3axog5TfEVq1izfGx95SfFmI7+AZyiMEs
	eJtrI10CsXaUgu1H/o3zsFG0e5OsTuuWjW5nX0sieUiSTugM39AiCUvB1p7tTCk5YvsHSDareCG/a
	Y2VKdXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTXP-00000009XI9-1qd7;
	Wed, 12 Mar 2025 21:22:51 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTVl-00000009XC2-0ap5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:21:10 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 86B37210B157;
	Wed, 12 Mar 2025 14:21:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 86B37210B157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741814467;
	bh=MgNM2rD8/EOf05M0lP85WV+gCmyNEYHLXXzpOfe5KVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pm3SSAYshDZ0/J9DAnDCCWIg7IAiMKcF9WebEeevzy98VYIaLbtZxz8W0R4oz5bs3
	 bx8W1PNJ4LBZ4FkX6cjdoD9OOn1KNZkGtH27nqPcPfkJxVFnXRqfUmYBYdXIJxg7dQ
	 dkyAwa4NZs8ZWgWM4ZixgLD18JrAFkhBHsI7/1wQ=
Message-ID: <996deaab-e1d1-4f04-ba31-c0dcab2d5e1d@linux.microsoft.com>
Date: Wed, 12 Mar 2025 14:21:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 03/11] Drivers: hv: Enable VTL mode for
 arm64
To: Arnd Bergmann <arnd@arndb.de>, Michael Kelley <mhklinux@outlook.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dexuan Cui <decui@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Joey Gouly <joey.gouly@arm.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Oliver Upton <oliver.upton@linux.dev>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "apais@microsoft.com" <apais@microsoft.com>,
 "benhill@microsoft.com" <benhill@microsoft.com>,
 "bperkins@microsoft.com" <bperkins@microsoft.com>,
 "sunilmut@microsoft.com" <sunilmut@microsoft.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-4-romank@linux.microsoft.com>
 <e0f81049-688e-4f53-a002-5d246281bf8d@app.fastmail.com>
 <BN7PR02MB41488C06B7E42830C700318DD4D62@BN7PR02MB4148.namprd02.prod.outlook.com>
 <119cfb59-d68b-4718-b7cb-90cba67827e8@app.fastmail.com>
 <BN7PR02MB4148FC15ADF0E49327262B92D4D62@BN7PR02MB4148.namprd02.prod.outlook.com>
 <caa0d793-3f05-4d7c-88d0-224ec0503cfb@linux.microsoft.com>
 <45171fb1-7533-449f-83d4-066d038c839f@app.fastmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <45171fb1-7533-449f-83d4-066d038c839f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_142109_213629_FBBF1125 
X-CRM114-Status: GOOD (  10.41  )
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



On 3/12/2025 1:25 PM, Arnd Bergmann wrote:
> On Wed, Mar 12, 2025, at 19:33, Roman Kisel wrote:
>> On 3/10/2025 3:18 PM, Michael Kelley wrote:
>>
>> That's a minimal extension, its surprise factor is very low. It has not
>> been seen to cause issues. If no one has strong opinions against that,
>> I'd send that in V6.
>>
> 
> Works for me. Thanks for your detailed explanations.
> 

Thank you for your review very much!

>         Arnd

-- 
Thank you,
Roman


