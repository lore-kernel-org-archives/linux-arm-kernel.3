Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E1DCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXg+TwApvHyBfHN1Mn6tknXlZkUAZ4R3cFUijN8XpUk=; b=HkQXWvw2H67w4+UEHNxYb91RUq
	fbeWigP65melDLRhGfXPkXnq+zrSD5KLXe7nf+tqO0soI6noZUNsVWUmpUfLhf+Siu7DuTnBkop0r
	skg8+cdsdXTTyLTGJz6Ac3A3sHFELqdAXfRpOLE/V3k2O+dLZblYR+eZ4+Ra9haObunRXuewWcFdc
	Ww3VRCaK9aMBD6mMzn68VGUgMGEdLJEC72Ff6exLbavtM7sgARwxhGZZJcfiJTybjylGlBuEs47LK
	Rhl8EtYQQ0m89wzsHeq2Zd4D9erPGkN3iGeRolcICo2B2uG6dCgpiRi+7A9pXcL1cmpG1dA7683Sp
	akhEDMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFMp-00000004J9W-3NBl;
	Wed, 27 May 2026 14:36:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFMn-00000004J97-45Gi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:36:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B05927B5;
	Wed, 27 May 2026 07:36:08 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E65CB3F905;
	Wed, 27 May 2026 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779892573; bh=xPhjRaRIDlDtchGeq0oSyyauxla1xE+J7bpPOmlvIsA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SWa++N69DNj7YGWaoja3eXI2S8aaoAmN5Udt019tOc2rUf6+WDpWGOv7r8mwoqn9D
	 i0UVjaSBQIhhI4iaA+L7/rvQKvvOISdjgUdt3YCH5HPP1K51PVhMAB/5A4t2ZV0CRQ
	 n7Mf1zoHu0ELyC3VRNKa2UzaSBQ4XODlsbqq/TaQ=
Message-ID: <4ee7c3a5-0104-42bf-907a-d822784ac3c2@arm.com>
Date: Wed, 27 May 2026 15:36:02 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@kernel.org" <david@kernel.org>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "jic23@kernel.org" <jic23@kernel.org>, "kobak@nvidia.com"
 <kobak@nvidia.com>, "lcherian@marvell.com" <lcherian@marvell.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "punit.agrawal@oss.qualcomm.com" <punit.agrawal@oss.qualcomm.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "zengheng4@huawei.com" <zengheng4@huawei.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <TY4PR01MB16930EBC1FFCB5C020D3969AE8B082@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <TY4PR01MB16930EBC1FFCB5C020D3969AE8B082@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_073618_064693_5AFFC4F2 
X-CRM114-Status: UNSURE (   8.77  )
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



On 5/27/26 01:42, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
> It looks fine to me.
> I retested this patch series and there is no problem.
> 
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Thanks for testing!

> 
> Best regards,
> Shaopeng TAN


