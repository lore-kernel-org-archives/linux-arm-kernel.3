Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7358CF65CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCqG1JmK0XnIs4nDrNljcp7tqLK+Bq0xGp3bwdNVubo=; b=u1SubSkQOjRwUoebXFZCr6UfOU
	1hf7soD0qwUNbFj4ZVLbs6tqWuBFnCzOLjHOUKJLELy5tbPsMI0ezNz1R99mu0ddz2//v8cxulY6G
	qovC1xrXJccozp9TKJkL/Y3r/i3o8lfT6eReDAoX+KG9jpISiYY3glDvB1Zv2cQQmSt3sQU86xmIc
	faPo/xx1vh2sGwg2r7PN5rCHXo9sc4RAyPbIIt1P4zt054IFZl//ijml/EAKN2ScvEkLpLKYGsWaB
	fFrxrZjRINH6nv+cemNnZBKGNbw+di0xZ5vwqzXr1ABaRRttuO6ejD6OTkqryHRBi8wccJBNwpPvj
	qnVhm5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJFO-0000000CEVp-24of;
	Mon, 26 Jan 2026 09:51:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJFK-0000000CEVQ-2ml2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:51:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04EF4339;
	Mon, 26 Jan 2026 01:50:50 -0800 (PST)
Received: from [10.57.8.194] (unknown [10.57.8.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8D583F632;
	Mon, 26 Jan 2026 01:50:52 -0800 (PST)
Message-ID: <e051c4bb-7b1c-4823-b81f-e4df5d8b1d9d@arm.com>
Date: Mon, 26 Jan 2026 09:50:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 22/46] arm64: RMI: Create the realm descriptor
To: Alper Gun <alpergun@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20251217101125.91098-1-steven.price@arm.com>
 <20251217101125.91098-23-steven.price@arm.com>
 <CABpDEumQ=62nZ_xEN6oMHw=J+6ps=Gy=1vx8i=6Hz+BacO1Ymg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CABpDEumQ=62nZ_xEN6oMHw=J+6ps=Gy=1vx8i=6Hz+BacO1Ymg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_015058_794376_471A7098 
X-CRM114-Status: GOOD (  23.85  )
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

On 23/01/2026 18:57, Alper Gun wrote:
> On Wed, Dec 17, 2025 at 2:13 AM Steven Price <steven.price@arm.com> wrote:
>>
>> Creating a realm involves first creating a realm descriptor (RD). This
>> involves passing the configuration information to the RMM. Do this as
>> part of realm_ensure_created() so that the realm is created when it is
>> first needed.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> New patch for v12
>> ---
>>  arch/arm64/kvm/rmi.c | 117 ++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 115 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index b51e68e56d56..18edc7eeb5fa 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -500,6 +500,106 @@ static void realm_unmap_shared_range(struct kvm *kvm,
>>                              start, end);
>>  }
>>
>> +/* Calculate the number of s2 root rtts needed */
>> +static int realm_num_root_rtts(struct realm *realm)
>> +{
>> +       unsigned int ipa_bits = realm->ia_bits;
>> +       unsigned int levels = 4 - get_start_level(realm);
>> +       unsigned int sl_ipa_bits = levels * (RMM_PAGE_SHIFT - 3) +
>> +                                  RMM_PAGE_SHIFT;
>> +
>> +       if (sl_ipa_bits >= ipa_bits)
>> +               return 1;
>> +
>> +       return 1 << (ipa_bits - sl_ipa_bits);
>> +}
>> +
>> +static int realm_create_rd(struct kvm *kvm)
>> +{
>> +       struct realm *realm = &kvm->arch.realm;
>> +       struct realm_params *params = realm->params;
>> +       void *rd = NULL;
>> +       phys_addr_t rd_phys, params_phys;
>> +       size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
>> +       int i, r;
>> +       int rtt_num_start;
>> +
>> +       realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
>> +       rtt_num_start = realm_num_root_rtts(realm);
>> +
>> +       if (WARN_ON(realm->rd || !realm->params))
>> +               return -EEXIST;
>> +
>> +       if (pgd_size / RMM_PAGE_SIZE < rtt_num_start)
>> +               return -EINVAL;
>> +
>> +       rd = (void *)__get_free_page(GFP_KERNEL);
>> +       if (!rd)
>> +               return -ENOMEM;
>> +
>> +       rd_phys = virt_to_phys(rd);
>> +       if (rmi_granule_delegate(rd_phys)) {
>> +               r = -ENXIO;
>> +               goto free_rd;
>> +       }
>> +
>> +       for (i = 0; i < pgd_size; i += RMM_PAGE_SIZE) {
>> +               phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
>> +
>> +               if (rmi_granule_delegate(pgd_phys)) {
>> +                       r = -ENXIO;
>> +                       goto out_undelegate_tables;
>> +               }
>> +       }
>> +
>> +       params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
>> +       params->rtt_level_start = get_start_level(realm);
>> +       params->rtt_num_start = rtt_num_start;
>> +       params->rtt_base = kvm->arch.mmu.pgd_phys;
>> +       params->vmid = realm->vmid;
> 
> I don't see a way to configure rpv and hash_algo anymore. I assume they
> are gone for a minimal userspace interface. Will there be a way to set
> them going forward?

Yes the intention is that the uAPI will be extended in the future to
allow these to be configured. This would be by exposing new capability
flags and allowing the VMM to set the capability. This ensures that a
basic VMM doesn't need to worry about them, but a more featured VMM can
provide support for configuration.

This series is already rather long so I've attempted to drop optional
parts to keep the complexity down while still providing something
"useful" (i.e. can launch a realm guest and there's some meaningful
extra security/attestation over a normal VM). There's loads of extra
features in the spec which will come later.

Thanks,
Steve

>> +
>> +       params_phys = virt_to_phys(params);
>> +
>> +       if (rmi_realm_create(rd_phys, params_phys)) {
>> +               r = -ENXIO;
>> +               goto out_undelegate_tables;
>> +       }
>> +
>> +       if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
>> +               WARN_ON(rmi_realm_destroy(rd_phys));
>> +               r = -ENXIO;
>> +               goto out_undelegate_tables;
>> +       }
>> +
>> +       realm->rd = rd;
>> +       WRITE_ONCE(realm->state, REALM_STATE_NEW);
>> +       /* The realm is up, free the parameters.  */
>> +       free_page((unsigned long)realm->params);
>> +       realm->params = NULL;
>> +
>> +       return 0;
>> +
>> +out_undelegate_tables:
>> +       while (i > 0) {
>> +               i -= RMM_PAGE_SIZE;
>> +
>> +               phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
>> +
>> +               if (WARN_ON(rmi_granule_undelegate(pgd_phys))) {
>> +                       /* Leak the pages if they cannot be returned */
>> +                       kvm->arch.mmu.pgt = NULL;
>> +                       break;
>> +               }
>> +       }
>> +       if (WARN_ON(rmi_granule_undelegate(rd_phys))) {
>> +               /* Leak the page if it isn't returned */
>> +               return r;
>> +       }
>> +free_rd:
>> +       free_page((unsigned long)rd);
>> +       return r;
>> +}
>> +
>>  static int realm_unmap_private_page(struct realm *realm,
>>                                     unsigned long ipa,
>>                                     unsigned long *next_addr)
>> @@ -803,8 +903,21 @@ static int realm_init_ipa_state(struct kvm *kvm,
>>
>>  static int realm_ensure_created(struct kvm *kvm)
>>  {
>> -       /* Provided in later patch */
>> -       return -ENXIO;
>> +       int ret;
>> +
>> +       switch (kvm_realm_state(kvm)) {
>> +       case REALM_STATE_NONE:
>> +               break;
>> +       case REALM_STATE_NEW:
>> +               return 0;
>> +       case REALM_STATE_DEAD:
>> +               return -ENXIO;
>> +       default:
>> +               return -EBUSY;
>> +       }
>> +
>> +       ret = realm_create_rd(kvm);
>> +       return ret;
>>  }
>>
>>  static int set_ripas_of_protected_regions(struct kvm *kvm)
>> --
>> 2.43.0
>>


