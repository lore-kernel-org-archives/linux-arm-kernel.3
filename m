Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29D2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkpzWS7kKQxS7iHBM5+/9vLioYcucl4kL46RR98FB2o=; b=CAo6ziTPFJt1wO+htCa6azxDeX
	A24OtV8j/23t3ENiUdK/GNnzvR/rYCHfezUPIHWskYdCK0arKoSAXaPCgphde2eAXLhflxjmUw5fl
	HWYjGQs0rqUJ1LWmH/TF1Yi9S/u00vDE9BkdwE5U2N2co5CejncRSbeMnMPQhK9X87VHwo6THwejT
	sKnjmgogAQg+7FhVhdYGGwSO6Y0+s4iFyjgnKb6+UkrSLMd6U9patlKm66VBaBo4Y1wO5df+aFbj9
	ATmgjlCTaTJHZJZudEZC3VW4LLO5o5qPqopmsIVgQLz7tt+DDJzDDeuO7r5Px6ff0hmKXVcv/rEr/
	RuMXAMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcIF-0000000FCUz-26AX;
	Fri, 07 Mar 2025 18:19:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqc5y-0000000FAOX-3C8x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 18:06:51 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id CAD852038F37;
	Fri,  7 Mar 2025 10:06:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CAD852038F37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741370808;
	bh=fkpzWS7kKQxS7iHBM5+/9vLioYcucl4kL46RR98FB2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kfOgPVr5LJFN2ld3861YnCyoXBzp+thWEeMvJ+YweMjJBiArD9U7tYwudHEyeNoat
	 igt1898SeJwvGyscPq6VaPbrQalQZt8Xwoxkv4MYmortZR1uJCXtyOKomZaHk/Sq4b
	 ZHHPwTwLAQWLTYwV6XCRICP5BGc3MKiHJftH/nzw=
Message-ID: <efb43459-4136-43cd-adac-2179d9985e9d@linux.microsoft.com>
Date: Fri, 7 Mar 2025 10:06:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] Drivers: hv: Introduce mshv_root module to
 expose /dev/mshv to VMMs
To: Wei Liu <wei.liu@kernel.org>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 arnd@arndb.de, jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
 <f332b77a-940f-4007-a44a-de64878d5201@linux.microsoft.com>
 <Z8ncFkwzxi9qJFD3@liuwe-devbox-debian-v2>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <Z8ncFkwzxi9qJFD3@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_100650_833559_1149E93B 
X-CRM114-Status: GOOD (  13.98  )
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



On 3/6/2025 9:32 AM, Wei Liu wrote:
> On Thu, Feb 27, 2025 at 10:50:30AM -0800, Roman Kisel wrote:

[...]

>> 2. Scheduling. Here, there is the mature KVM and Xen code to find
>>     inspiration in. Xen being the Type 1 hypervisor should likely be
>>     closer to MSHV in my understanding.
> 
> Yes and no.
> 
> When a hypervisor-based scheduler (either classic or core) is used, the
> scheduling model is the same as Xen. In this model, the hypervisor makes
> the scheduling decisions.
> 
> There is a second scheduler model. In that model, the hypervisor
> delegates scheduling to the Linux kernel. The Linux scheduler makes the
> scheduling decisions. It is similar to KVM.
> 
> We support both. Which model to use largely depends on the workload and
> the desired behaviors of the system.
> 
> This is purely informational in case people wonder why the run vp
> function branches off to two different code paths.
> 

Thanks, now I understand that better :)

[...]

>> -- 
>> Thank you,
>> Roman
>>

-- 
Thank you,
Roman


