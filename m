Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D816CCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzkCMSbAiz0RbYrwT1k48acSVtHVOJzJmwN7JFNWl3k=; b=BVnkCGSY2eA9DEz12XgSGvltLR
	Tkic0HU+hVSu1rfwv1+3BxEoeDVaGh4lcuis9OnEO3Bdk7/oV3PPUkoouJZVmn11V24uTHQDXfx59
	qGQKUcV4v1oPDfaoPdq4GUm+aP4Kk4gTg98Ov3DQN7lGHiA2Wg//U4+hmM3gh0CnJvC+U02nWkWnQ
	F6AfxqF2L+SPJe7OhZJYb9+hHZstH1eeAx00eH/9t5ayeo4L1WG37DBWO3q0W2N+Pnz+XAv4QTayh
	PXLP68UFL7Pm9ElhcSBXM7EnXXyZqm9o4zT8NCbMpaqqr0e1kXg9d8frlQc8plJ21SKsb4NfTto5m
	cqzAYK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Zt-00000008Nc7-3Z4K;
	Thu, 21 May 2026 15:44:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Zq-00000008NbO-474z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:44:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2F3B1C25;
	Thu, 21 May 2026 08:44:43 -0700 (PDT)
Received: from [10.1.32.22] (e122027.cambridge.arm.com [10.1.32.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 822D43F632;
	Thu, 21 May 2026 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779378288; bh=UrfZUUpRqaH1mE/7ucNYsDj09LOk5RANQORw2tRBYiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DlX1kQJI04Azq/gx7Xr7XCerghscK+I2BjbSQ/IkppD9dcgn/K+ofLohDMd8Tr4Vg
	 UxDQegPlGsCyuk11Kc2dQTExT7chHzDKE6BKxEhYB3So5LdVFnyDQ8SKvfE0CCd9F1
	 1slydp5jvDctwffmGyk/i4tk6l+O04R3g1ASQ2+0=
Message-ID: <9989811e-ef1f-43a1-becc-04edc6a69b38@arm.com>
Date: Thu, 21 May 2026 16:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 05/44] arm64: RMI: Add wrappers for RMI calls
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 Alper Gun <alpergun@google.com>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-6-steven.price@arm.com> <yq5aecj8t10l.fsf@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yq5aecj8t10l.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_084451_068058_87032448 
X-CRM114-Status: UNSURE (   9.63  )
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

On 19/05/2026 06:35, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> The wrappers make the call sites easier to read and deal with the
>> boiler plate of handling the error codes from the RMM.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> +#define rmi_smccc(...) do {						\
>> +	arm_smccc_1_1_invoke(__VA_ARGS__);				\
>> +} while (RMI_RETURN_STATUS(res.a0) == RMI_BUSY ||			\
>> +	 RMI_RETURN_STATUS(res.a0) == RMI_BLOCKED)
>> +
> 
> I guess this is not used. Also, that would require the call site to have a struct arm_smccc_res res.

Ah good spot - yes this was replaced with a proper static inline
rmi_smccc_invoke() function. I missed removing this macro.

Thanks,
Steve

