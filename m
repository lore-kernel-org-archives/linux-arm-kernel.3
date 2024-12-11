Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432EAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLiF3+1wxeQNn+Qj/FRUqScT1++3cQ1MFzbwCBVRb9c=; b=kgU9M4fY3zK7a2APuvelPCxO2G
	nfQPUHJiUCVU2xjElupsI1j1lF9Q5Q6gRZ8uv2bgYTvtJuwNVVG/mGZhA0ewg+DfpDB8kvOk7lS0p
	B89g0nhQuqsJ9QSpzCY3zFOPUfyjZCEHvTVr80PryMaJxmBwRrLFhvodoj1LHlJv+9GYmI0E4I8Ht
	oZksEDrOAdmpcFJoH2AfW3fbqXb5tbtuOiWF6mFxmZgfqP0MRMReXkFmaGBYQKsY6gt995p/C5UV0
	gMC68zQ/po7aL48V8d6PvGMN6H38kKWJAUYLYQGp22TtTMnG6mZxq5XXNNco+SDYs9+aa/urP5X2C
	9NWLuO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBTg-0000000DPqk-1frh;
	Wed, 11 Dec 2024 01:25:24 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBSb-0000000DPZG-3nhR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733880253; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=QLiF3+1wxeQNn+Qj/FRUqScT1++3cQ1MFzbwCBVRb9c=;
	b=mmJTHp6SIl74KtwtumuyWrStw3W3xv5XBzCSnfaDgmI1+KM/gconQdcZaK6SIt9B5ssLdQszXZqrGXBnyvcDV3PwnvjFyoVng5a6t1p+rC4QGzMJet4Ievyus7xGjWdHC174t62VFq3vYqnyz9f6W8G4iXku3kSLEajVexLKG6U=
Received: from 30.166.1.177(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WLGFXUW_1733880251 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Dec 2024 09:24:11 +0800
Message-ID: <f8786f53-eff0-4fd7-9c4d-c5733f648c6e@linux.alibaba.com>
Date: Wed, 11 Dec 2024 09:24:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/dwc_pcie: Qualify RAS DES VSEC Capability by Vendor,
 Revision
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20241210145335.GA3239578@bhelgaas>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241210145335.GA3239578@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172418_435325_17865BC0 
X-CRM114-Status: UNSURE (   9.72  )
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



在 2024/12/10 22:53, Bjorn Helgaas 写道:
> On Tue, Dec 10, 2024 at 08:04:17PM +0800, Shuai Xue wrote:
>> 在 2024/12/10 06:29, Bjorn Helgaas 写道:
>>> From: Bjorn Helgaas <bhelgaas@google.com>
>>>
>>> PCI Vendor-Specific (VSEC) Capabilities are defined by each vendor.
>>> Devices from different vendors may advertise a VSEC Capability with the DWC
>>> RAS DES functionality, but the vendors may assign different VSEC IDs.
>>>
>>> Search for the DWC RAS DES Capability using the VSEC ID and VSEC Rev
>>> chosen by the vendor.
> 
>>> -	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
>>> +	for (vid = dwc_pcie_pmu_vsec_ids; vid->vendor_id; vid++) {
>>
>> How about checking the pdev->vendor with vid->vendor_id before
>> search the vesc cap?
>>
>> +		if (pdev->vendor != vid->vendor_id)
>> +			continue;
> 
> Every user of VSEC needs to specify the (Vendor ID, VSEC ID) and
> verify that the Vendor ID matches the device Vendor ID, so
> pci_find_vsec_capability() does this check internally, so I don't
> think we need to do it here.


I see. LGTM. Also, I quickly tested it on Yitian 710 and it works as expected.

Reviewed-and-tested-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.

Best Regards,
Shuai

