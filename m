Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D26CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gGJ2j4XuU1eR+kSbHyPUvCzb9zojsG4YTdQlWdLMjQ=; b=uD5aedbtxE31uSdJAlYCku1nFL
	UODRpeL9c2DgtwULC8zYlxMwfCDoBtajaqw/YMgoEXe5vxR3jXYVcv4ByA9p0779xbm7EM0z6XFPM
	itLmN97erfKCOkxz/ClNF0RyxYXJKPjQYL99tKASzGPjRv2XLh36+AKmQ09KR3QKH70LxqNhAE2Q5
	C34SNhqeqX528rv3BRHog4GKTpSz3vtR6y/B8scXLLo1pdsr/7S/W5jaE01RFSCb30zpsIz+kl1tj
	IHn+WjyiIWFhDt5kfYYRFIEZt0KL2pfISjS6jmAQvAJTL7Iq+ucUZ+W/k+PN+A3kRvnM07BiCCfdT
	Wnj/6B6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ25-000000032Bc-0ReA;
	Wed, 22 Oct 2025 13:37:41 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ22-000000032AP-1zbp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:37:40 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cs9Fp5VDJz9tRP;
	Wed, 22 Oct 2025 15:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761140254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gGJ2j4XuU1eR+kSbHyPUvCzb9zojsG4YTdQlWdLMjQ=;
	b=K6158WcyF+BOJQFTdw7hpnl4LPtjCCwgBiCCZO314UzujaTkx27mAfeDY5kNdNKdVk0isG
	8VPHMrNfvq0ZC1yqFQMz5ULuKEl3qIJpwgDU18sOlqnIo41/WcD7wlhEaCZMekDFokhQDI
	2GEVpL7TtH0CxWs6P7aORkWFNddL+3VOAY8DtBbB+E5av5VXHzz7+L68UlqTmIjOdyeZxu
	HOYZnBAKk8EfJplVInSYNX7G1tUYZHvISQx0Tc8+xC59LATJzNcO+DdghHs6ea1IQgU+mK
	M0nVhp8ia3Bajfz0E/a56fJum/z5GuDpqcUS0w9CVvUe6GM4uJKlzWnIsoWlOQ==
Message-ID: <29bc5e92-04c9-475a-ba3d-a5ea26f1c95a@mailbox.org>
Date: Wed, 22 Oct 2025 15:37:30 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
To: "Musham, Sai Krishna" <sai.krishna.musham@amd.com>,
 "mani@kernel.org" <mani@kernel.org>,
 "Havalige, Thippeswamy" <thippeswamy.havalige@amd.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Bandi, Ravi Kumar"
 <ravib@amazon.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Sean Anderson <sean.anderson@linux.dev>,
 "Yeleswarapu, Nagaradhesh" <nagaradhesh.yeleswarapu@amd.com>
References: <20251021212801.GA1224310@bhelgaas>
 <ab1f7c51-bc41-4774-a0dc-850e53c412eb@mailbox.org>
 <3it5l556vmfpuu6kz5yvulwosi4ecmcgfbzcizrc5wi7ifddkh@mpzfxf2v6v3f>
 <72267a6c-13c7-40bd-babb-f73a28625ca4@mailbox.org>
 <SN7PR12MB7201CF621AF0A38AA905799D8BF3A@SN7PR12MB7201.namprd12.prod.outlook.com>
 <brekq5jmgnotwpshcksxefpg2adm4vlsbuncazdg32sdpxqjwj@annnvyzshrys>
 <SN7PR12MB7201C6B5B64F8847DD6D816D8BF3A@SN7PR12MB7201.namprd12.prod.outlook.com>
 <zuj6puxpqgjmaa3y3wwyixlru7e7locplnjev37i5fnh6zummw@72t5prkfsrpk>
 <DM4PR12MB6158ACBA7BCEDB99A55ACA03CDF3A@DM4PR12MB6158.namprd12.prod.outlook.com>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <DM4PR12MB6158ACBA7BCEDB99A55ACA03CDF3A@DM4PR12MB6158.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4eec622a3ee0e92cfaf
X-MBO-RS-META: bxfn33oh4qooy9od7kb88eg7bpucyym8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063739_156636_2990EF40 
X-CRM114-Status: GOOD (  10.56  )
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

On 10/22/25 14:48, Musham, Sai Krishna wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

<snip>

>>> We even don’t need ravi patch, as we have tested this at our end it
>>> works fine by just updating interrupt-map Property. We need to now understand the
>> difference in design.
>>
>> Ok, please let us know with your findings. In the meantime, I'll keep Ravi's patch in
>> tree, as it seems to be required on his setup.
>>
> 
> We tested on Linux version 6.12.40 without applying either Stefan's or Ravi's patches.
> Instead, we applied only the following interrupt-map property change (entries 0,1,2,3) and verified that
> legacy interrupts are working correctly.
> 
> interrupt-map = <0 0 0 1 &pcie_intc_0 0>,
> <0 0 0 2 &pcie_intc_0 1>,
> <0 0 0 3 &pcie_intc_0 2>,
> <0 0 0 4 &pcie_intc_0 3>;
> 
> 38:       1143          0  pl_dma:RC-Event  16 Level     80000000.axi-pcie
> 39:       1143          0  pl_dma:INTx   0 Level     nvme0q0, nvme0q1

Okay. Same here. I don't need Ravi's patch for the INTx bit enabling.

I understand that you want us to change the interrupt map in the auto-
generated device-tree from Vivado. Which is IMHO a bit "suboptimal".

I would prefer to have a solution which works out-of-the-box, w/o the
need to manually change DT properties. Is it planned to change / fix
this interrupt map in pl.dtsi generated with a newer version of Vivado?

Thanks,
Stefan


