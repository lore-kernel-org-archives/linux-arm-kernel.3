Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31998CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4FHysKmL3sST3B6JYnWBExkNR6TyUEiXRkB5SFBJQA=; b=ejeTB7hufLN72GJj+8MVnMOoRY
	XzPYSu2tiMQ53vJ0bFpioXEHowuwPauMYndpxPRoDeaqyKA4gxWJCPRUnr+tVZWYY4X05vaaan91V
	6mbd4HrWN8EjG9OIdmooafEcJsHL49v/g4Kzp/ddvsdbm0Ei1CCa8lWreQ+J6QcHjQhUZiVxtYV8w
	nQzQCaXrmM5BTiu84Bj0yFs1LMZNyKTz4ehHAyxrOFfN1o7Yjz7hZYFimnCkh63BJdx9V93Wu5KZi
	Xs7tMbmqcydJDD5lvT5d8ly1H7XNaG+AYoS8DasnVJaz8ieZPsi/WGla4xtmUm2HNYcu362vEUaUQ
	ZpX0wRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxhA-00000006m4R-1ENP;
	Wed, 30 Sep 2026 17:02:16 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxh8-00000006m3r-1dma
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:02:15 +0000
Received: from [100.96.208.60] (unknown [52.179.129.152])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3A68720B7166;
	Wed, 30 Sep 2026 10:01:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3A68720B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790787680;
	bh=J4FHysKmL3sST3B6JYnWBExkNR6TyUEiXRkB5SFBJQA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=fqJB8AnY0C0Mq2QOcZ1YCLFv0XUWWYTx2I86zAQN0rU1/2quofja7K/tU0ZKhk715
	 MiLXiQue02RBuXUNUXvWpKyWTl2ECXmL6J5pjVxxqDP3b8/eyTxoei4k09x29s1P6N
	 fBYGiIrKjlCDCa6cbNAiEzSLmOrUJdKEbhL2U/YI=
Date: Wed, 30 Sep 2026 13:02:08 -0400
From: Jeff Barnes <jeffbarnes@linux.microsoft.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: "=?utf-8?Q?linux-pci=40vger.kernel.org?=" <linux-pci@vger.kernel.org>, 
 "=?utf-8?Q?minghuan.Lian=40nxp.com?=" <minghuan.Lian@nxp.com>, 
 "=?utf-8?Q?mingkai.hu=40nxp.com?=" <mingkai.hu@nxp.com>, 
 "=?utf-8?Q?roy.zang=40nxp.com?=" <roy.zang@nxp.com>, 
 "=?utf-8?Q?lpieralisi=40kernel.org?=" <lpieralisi@kernel.org>, 
 "=?utf-8?Q?kwilczynski=40kernel.org?=" <kwilczynski@kernel.org>, 
 "=?utf-8?Q?mani=40kernel.org?=" <mani@kernel.org>, 
 "=?utf-8?Q?robh=40kernel.org?=" <robh@kernel.org>, 
 "=?utf-8?Q?bhelgaas=40google.com?=" <bhelgaas@google.com>, 
 "=?utf-8?Q?Zhiqiang.Hou=40nxp.com?=" <Zhiqiang.Hou@nxp.com>, 
 "=?utf-8?Q?linuxppc-dev=40lists.ozlabs.org?="
 <linuxppc-dev@lists.ozlabs.org>, 
 "=?utf-8?Q?linux-arm-kernel=40lists.infradead.org?="
 <linux-arm-kernel@lists.infradead.org>, 
 "=?utf-8?Q?imx=40lists.linux.dev?=" <imx@lists.linux.dev>, 
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?="
 <linux-kernel@vger.kernel.org>, "=?utf-8?Q?stable=40vger.kernel.org?="
 <stable@vger.kernel.org>
Message-ID: <0FEA6868-5A7C-4955-9FBB-BE9A1AE8D3F7@getmailspring.com>
In-Reply-To: <ar07ubdYLk-Tje1q@SMW015318>
References: <ar07ubdYLk-Tje1q@SMW015318>
Subject: Re: [PATCH] PCI: layerscape: use default error response
 behavior
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_100214_464032_3E269035 
X-CRM114-Status: GOOD (  24.23  )
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



On Sep 30 2026, at 12:41 pm, Frank Li <Frank.li@oss.nxp.com> wrote:

> On Tue, Sep 29, 2026 at 03:43:39PM -0400,
> jeffbarnes@linux.microsoft.com wrote:
>> [You don't often get email from jeffbarnes@linux.microsoft.com. Learn
>> why this is important at
>> https://aka.ms/LearnAboutSenderIdentification ]
>> 
>> From: Jeff Barnes <jeffbarnes@linux.microsoft.com>
>> 
>> The Layerscape PCIe driver programs PCIE_ABSERR to forward errors from
>> outbound non-posted requests to the internal AXI interface.
>> 
>> A PCI configuration access can race with the link going down after
>> dw_pcie_other_conf_map_bus() checks the link but before the MMIO access
>> is performed. When the resulting Completion Timeout is forwarded to
>> AXI, it causes an asynchronous SError and kernel panic.
>> 
>> For example:
>> 
>>   Kernel panic - not syncing: Asynchronous SError Interrupt
>>   ...
>>   Call trace:
>>    arm64_serror_panic+0x78/0x90
>>    do_serror+0x84/0x90
>>    el1h_64_error_handler+0x30/0x40
>>    el1h_64_error+0x68/0x70
>>    pci_generic_config_read+0x64/0xb0
>>    dw_pcie_rd_other_conf+0x1c/0x68
>>    pci_bus_read_config_word+0x68/0x118
>>    pcie_capability_read_word+0xa8/0xd8
>>    find_device_iter+0x8c/0x160
>>    pci_walk_bus+0x60/0xb8
>>    find_source_device+0x78/0xb0
>>    aer_isr+0x1dc/0x230
>> 
>> Restore the controller's default error response behavior instead of
>> forwarding these errors to AXI.
>> 
>> Reproduce the race by instrumenting dw_pcie_rd_other_conf() to call
>> map_bus() while the link is up, then schedule a worker on another CPU
>> to set PCI_EXP_LNKCTL_LD. Synchronize the CPUs immediately before the
>> Link Disable DBI write, then perform readl() using the address returned
>> by map_bus() concurrently with the link transition.
>> 
>> Without this change, the overlapping configuration read results in an
>> asynchronous SError and kernel panic. With this change, the same test
>> returns 0xffffffff from the configuration read. In this test, AER
>> reports a non-fatal Completion Timeout, and no SError or kernel panic
>> occurs.
>> 
>> This effectively reverts the error response behavior introduced by
>> commit 84d897d69938
>> ("PCI: layerscape: Change default error response behavior").
> 
> Subject should be revert ...
> 
> I am not sure what's expect behavior by other dwc PCI controller. returns
> 0xfffffffff or report bus error.
> 
> Frank


Thanks, Frank.

Agreed on the subject. This is mechanically a revert of 84d897d69938, so
I'll change the subject to:
Revert "PCI: layerscape: Change default error response behavior"

Regarding the expected behavior on other DWC controllers, I don't have
hardware available to test those implementations, so I don't want to speculate.

What I have verified on Layerscape is that with PCIE_ABSERR programmed,
the failed configuration access is forwarded to AXI and results in an
asynchronous SError and kernel panic. With the controller's default
response, the identical injected race returns 0xffffffff and the kernel survives.

Please let me know if you think the behavior of other DWC
implementations needs to be established before proceeding with this revert.

Thanks, Jeff

> 
>> 
>> Fixes: 84d897d69938 ("PCI: layerscape: Change default error response behavior")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
>> ---
>>  drivers/pci/controller/dwc/pci-layerscape.c | 12 ------------
>>  1 file changed, 12 deletions(-)
>> 
>> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
>> index 14d6ac4fc53f..d333f1ae8a41 100644
>> --- a/drivers/pci/controller/dwc/pci-layerscape.c
>> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
>> @@ -28,8 +28,6 @@
>> 
>>  /* PEX Internal Configuration Registers */
>>  #define PCIE_STRFMR1           0x71c /* Symbol Timer & Filter Mask
>> Register1 */
>> -#define PCIE_ABSERR            0x8d0 /* Bridge Slave Error Response
>> Register */
>> -#define PCIE_ABSERR_SETTING    0x9401 /* Forward error of non-posted
>> request */
>> 
>>  /* PF Message Command Register */
>>  #define LS_PCIE_PF_MCR         0x2c
>> @@ -103,14 +101,6 @@ static void ls_pcie_drop_msg_tlp(struct ls_pcie *pcie)
>>         iowrite32(val, pci->dbi_base + PCIE_STRFMR1);
>>  }
>> 
>> -/* Forward error response of outbound non-posted requests */
>> -static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
>> -{
>> -       struct dw_pcie *pci = pcie->pci;
>> -
>> -       iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
>> -}
>> -
>>  static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
>>  {
>>         if (pcie->big_endian)
>> @@ -180,8 +170,6 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>>         struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>         struct ls_pcie *pcie = to_ls_pcie(pci);
>> 
>> -       ls_pcie_fix_error_response(pcie);
>> -
>>         dw_pcie_dbi_ro_wr_en(pci);
>>         ls_pcie_clear_multifunction(pcie);
>>         dw_pcie_dbi_ro_wr_dis(pci);
>> --
>> 2.43.0
>> 
>> 
> 

