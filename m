Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FC2D5E12B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW1YMxyLY4Ufdwscc+Sad9e5U0vNmqpGzoX9f3jzMOo=; b=b1ymRRmaPhwFzaTfk/d9YZx/yL
	a4/341kVKoLHRmEPlj+HarBfNxWAlWS1NusYRfH3hDLYLzq4R+Q6zYgk0mbGmW0dko94cgnoW0bJ5
	50+gB0sPcGHp/LQqXa5ymlRsFyDubI8xlPs/mLl6vgnGnBl8BFPBGOh9R9kRy5jEph4MvY1posuK2
	kcM2Mp/KBWE6fdg/k2xZlhKzb+CdAPfB0ZemBzTVYdZ24LLnYzEfoYna1gpBk5ywJbcREpBcdvQZe
	nw9vt1tfP0BXlmz7JvaBGPCKuX+MkqObda5559WpmaMcMnTx1tw+n5WTVVEYVun6X4fiCqeGP3YKG
	GrUfq3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Gty-00000009JEE-2Krq;
	Fri, 08 Nov 2024 04:47:18 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GYE-00000009GIC-0OFq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:24:51 +0000
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 86D04212D51D;
	Thu,  7 Nov 2024 20:24:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 86D04212D51D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731039889;
	bh=CW1YMxyLY4Ufdwscc+Sad9e5U0vNmqpGzoX9f3jzMOo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=AbnCEhJ4o/VclSdAku7qgYUWX0b3uxgD1xfZhfwCWDdSTklsPG7KLZYd0XWL6atg5
	 l3qFFbGxzHn1zUPxTgC7xBhxFFko/na0EsK2aWF/ClYTMGZd96BdnB9gks88DAGlv+
	 joKptKzFlk0BgqA8lJO2+OltHhgrrl75JackwbNk=
Message-ID: <ee050247-92f2-4c9a-add0-a5a43dbab34f@linux.microsoft.com>
Date: Thu, 7 Nov 2024 20:24:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, luto@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, arnd@arndb.de, sgarzare@redhat.com,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com,
 vkuznets@redhat.com, ssengar@linux.microsoft.com, apais@linux.microsoft.com
Subject: Re: [PATCH v2 2/4] hyperv: Clean up unnecessary #includes
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev
References: <1731018746-25914-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1731018746-25914-3-git-send-email-nunodasneves@linux.microsoft.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <1731018746-25914-3-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_202450_189424_48AD900C 
X-CRM114-Status: UNSURE (   6.93  )
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

On 11/7/2024 2:32 PM, Nuno Das Neves wrote:
> Remove includes of linux/hyperv.h, mshyperv.h, and hyperv-tlfs.h where
> they are not used.
> 
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/hv_core.c     | 1 -
>  arch/x86/hyperv/hv_apic.c       | 1 -
>  arch/x86/hyperv/hv_init.c       | 1 -
>  arch/x86/hyperv/hv_proc.c       | 1 -
>  arch/x86/hyperv/ivm.c           | 1 -
>  arch/x86/hyperv/mmu.c           | 1 -
>  arch/x86/include/asm/kvm_host.h | 1 -
>  arch/x86/include/asm/mshyperv.h | 1 -
>  arch/x86/mm/pat/set_memory.c    | 2 --
>  9 files changed, 10 deletions(-)
> 

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

