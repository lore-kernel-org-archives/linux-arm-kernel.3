Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6822FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IV/eaRledv3wz3YnjOQkF7cT8ujId6eN4auig+ZVMkg=; b=Tcq9dBcHFoprhKn0gOQjhhUT+6
	uTIFSIQubj/jZZ32X2dnDeF0+e/4nahjMJd2jZVS6LR45KlrMsGPRCgbJBXDqRPMODVq4umnd94tI
	fWlzZqBhy6kVhGeNUatQqMxlQY7G7uz/JQCCufAaOgHN21uwUmE7y9kLSML81p7EpJyYMEKagiQ0Y
	wZILUiZc/LLXma4sbRtr9sZldlD/zHX+yqefJLWU0owFS0pAhdybl8BltWuQuI2X0a/62UDSnWQ39
	dIzqHdzASdQoS0E5mvZ6VgVCUlHqfJ05aYy4zD0gZ0hBOH+reCFNx8kSzJz0Th1VvJNiuaeFkXZ3a
	eFOOkOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXGI-00000006RUl-0q4D;
	Fri, 21 Feb 2025 17:56:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW8N-00000006EV4-1MXT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Feb 2025 16:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IV/eaRledv3wz3YnjOQkF7cT8ujId6eN4auig+ZVMkg=; b=VemeouthwmTq9N6EPv0ILfHGfg
	opKs8jHMYmHPdHCI0x5//Xtwm/YLFDp0lShq9KksJkV1CgAZs9G2icI4LwkpB93IU4ctOV8gRV88t
	CaVhyZCgDXuSNT0iBU+79uYnFqbqQgqLBUkyHcIRPIRaDg83GHx3r6M8jteWO+zS+G581Waw5N2Tw
	zTUWh2lu1+k3eN+0be2Ch6RkUY+UmKiQAAvtcT2L5jfSehrbV6Is4dJBsoQoniCvaCrvkYFxGFBRb
	sH3nBpZE4hVNDud+JLvdLrsttbfZHNUt/+/7Zh+WVwIgPhBibDUSUfnGPNLUgJO2XB45pfGn9qQun
	Ej57orHg==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlW8K-00000002ger-1RXx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:44:14 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 98B67219E4;
	Fri, 21 Feb 2025 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740156249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IV/eaRledv3wz3YnjOQkF7cT8ujId6eN4auig+ZVMkg=;
	b=Tl8Njgj9VedxyjmpS5wrvRpe2LxdraF3IqJPIj+fEIGVMjpisf3KjIg724mLg6ZWEr6tTA
	Z727h0EmKucabQxdpyhRShQoigobbCkVaQlaZGpntBPP5FdbWBvtGo8Q9TfauA6xHwKZwN
	MkiXeXRmj9/avRaVhbR0+tAicTxiNCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740156249;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IV/eaRledv3wz3YnjOQkF7cT8ujId6eN4auig+ZVMkg=;
	b=W7gCDsBmHiuybtVuvWnSPueBVYIUISbXmtY5/Pz5NCAk9NjNDi94+DLPBtuPkOvqd9P1Mo
	CFS7MkJz2I4NQgAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Tl8Njgj9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=W7gCDsBm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740156249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IV/eaRledv3wz3YnjOQkF7cT8ujId6eN4auig+ZVMkg=;
	b=Tl8Njgj9VedxyjmpS5wrvRpe2LxdraF3IqJPIj+fEIGVMjpisf3KjIg724mLg6ZWEr6tTA
	Z727h0EmKucabQxdpyhRShQoigobbCkVaQlaZGpntBPP5FdbWBvtGo8Q9TfauA6xHwKZwN
	MkiXeXRmj9/avRaVhbR0+tAicTxiNCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740156249;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IV/eaRledv3wz3YnjOQkF7cT8ujId6eN4auig+ZVMkg=;
	b=W7gCDsBmHiuybtVuvWnSPueBVYIUISbXmtY5/Pz5NCAk9NjNDi94+DLPBtuPkOvqd9P1Mo
	CFS7MkJz2I4NQgAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04744136AD;
	Fri, 21 Feb 2025 16:44:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q8rMOVetuGcDNQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 21 Feb 2025 16:44:07 +0000
Message-ID: <a2f6ab00-7b51-483e-ad10-0ea7ef9bfd90@suse.de>
Date: Fri, 21 Feb 2025 18:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 04/11] PCI: brcmstb: Reuse config structure
To: Jim Quinlan <jim2101024@gmail.com>, Stanimir Varbanov
 <svarbanov@suse.de>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-5-svarbanov@suse.de>
 <CANCKTBsm6o9yaSenj-wft+n0uX-HNRjpJjkZaQcn4t474fXtow@mail.gmail.com>
 <CANCKTBuMOk9ASfPydcKHQgaQF4p7m7ryYezcLPdBEM2ao3LY3g@mail.gmail.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <CANCKTBuMOk9ASfPydcKHQgaQF4p7m7ryYezcLPdBEM2ao3LY3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 98B67219E4
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,suse.de,linux.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_164412_645777_DB91B9DD 
X-CRM114-Status: GOOD (  17.93  )
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

Hi Jim,

On 2/21/25 5:36 PM, Jim Quinlan wrote:
> On Fri, Jan 31, 2025 at 11:10 AM Jim Quinlan <jim2101024@gmail.com> wrote:
>>
>> On Mon, Jan 20, 2025 at 8:01 AM Stanimir Varbanov <svarbanov@suse.de> wrote:
>>>
>>> Instead of copying fields from pcie_cfg_data structure to
>>> brcm_pcie reference it directly.
>>>
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> Reviewed-by: Florian Fainelil <florian.fainelli@broadcom.com>
>>> ---
>>> v4 -> v5:
>>>  - No changes.
>>>
>>>  drivers/pci/controller/pcie-brcmstb.c | 70 ++++++++++++---------------
>>>  1 file changed, 31 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
>>> index e733a27dc8df..48b2747d8c98 100644
>>> --- a/drivers/pci/controller/pcie-brcmstb.c
>>> +++ b/drivers/pci/controller/pcie-brcmstb.c
>>> @@ -191,11 +191,11 @@
>>>  #define SSC_STATUS_PLL_LOCK_MASK       0x800
>>>  #define PCIE_BRCM_MAX_MEMC             3
>>>
>>> -#define IDX_ADDR(pcie)                 ((pcie)->reg_offsets[EXT_CFG_INDEX])
>>> -#define DATA_ADDR(pcie)                        ((pcie)->reg_offsets[EXT_CFG_DATA])
>>> -#define PCIE_RGR1_SW_INIT_1(pcie)      ((pcie)->reg_offsets[RGR1_SW_INIT_1])
>>> -#define HARD_DEBUG(pcie)               ((pcie)->reg_offsets[PCIE_HARD_DEBUG])
>>> -#define INTR2_CPU_BASE(pcie)           ((pcie)->reg_offsets[PCIE_INTR2_CPU_BASE])
>>> +#define IDX_ADDR(pcie)                 ((pcie)->cfg->offsets[EXT_CFG_INDEX])
>>> +#define DATA_ADDR(pcie)                        ((pcie)->cfg->offsets[EXT_CFG_DATA])
>>> +#define PCIE_RGR1_SW_INIT_1(pcie)      ((pcie)->cfg->offsets[RGR1_SW_INIT_1])
>>> +#define HARD_DEBUG(pcie)               ((pcie)->cfg->offsets[PCIE_HARD_DEBUG])
>>> +#define INTR2_CPU_BASE(pcie)           ((pcie)->cfg->offsets[PCIE_INTR2_CPU_BASE])
>>>
>>>  /* Rescal registers */
>>>  #define PCIE_DVT_PMU_PCIE_PHY_CTRL                             0xc700
>>> @@ -276,8 +276,6 @@ struct brcm_pcie {
>>>         int                     gen;
>>>         u64                     msi_target_addr;
>>>         struct brcm_msi         *msi;
>>> -       const int               *reg_offsets;
>>> -       enum pcie_soc_base      soc_base;
>>>         struct reset_control    *rescal;
>>>         struct reset_control    *perst_reset;
>>>         struct reset_control    *bridge_reset;
>>> @@ -285,17 +283,14 @@ struct brcm_pcie {
>>>         int                     num_memc;
>>>         u64                     memc_size[PCIE_BRCM_MAX_MEMC];
>>>         u32                     hw_rev;
>>> -       int                     (*perst_set)(struct brcm_pcie *pcie, u32 val);
>>> -       int                     (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
>>>         struct subdev_regulators *sr;
>>>         bool                    ep_wakeup_capable;
>>> -       bool                    has_phy;
>>> -       u8                      num_inbound_wins;
>>> +       const struct pcie_cfg_data      *cfg;
>>>  };
>>>
>>>  static inline bool is_bmips(const struct brcm_pcie *pcie)
>>>  {
>>> -       return pcie->soc_base == BCM7435 || pcie->soc_base == BCM7425;
>>> +       return pcie->cfg->soc_base == BCM7435 || pcie->cfg->soc_base == BCM7425;
>>>  }
>>>
>>>  /*
>>> @@ -855,7 +850,7 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
>>>          * security considerations, and is not implemented in our modern
>>>          * SoCs.
>>>          */
>>> -       if (pcie->soc_base != BCM7712)
>>> +       if (pcie->cfg->soc_base != BCM7712)
>>>                 add_inbound_win(b++, &n, 0, 0, 0);
>>>
>>>         resource_list_for_each_entry(entry, &bridge->dma_ranges) {
>>> @@ -872,10 +867,10 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
>>>                  * That being said, each BARs size must still be a power of
>>>                  * two.
>>>                  */
>>> -               if (pcie->soc_base == BCM7712)
>>> +               if (pcie->cfg->soc_base == BCM7712)
>>>                         add_inbound_win(b++, &n, size, cpu_start, pcie_start);
>>>
>>> -               if (n > pcie->num_inbound_wins)
>>> +               if (n > pcie->cfg->num_inbound_wins)
>>>                         break;
>>>         }
>>>
>>> @@ -889,7 +884,7 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
>>>          * that enables multiple memory controllers.  As such, it can return
>>>          * now w/o doing special configuration.
>>>          */
>>> -       if (pcie->soc_base == BCM7712)
>>> +       if (pcie->cfg->soc_base == BCM7712)
>>>                 return n;
>>>
>>>         ret = of_property_read_variable_u64_array(pcie->np, "brcm,scb-sizes", pcie->memc_size, 1,
>>> @@ -1012,7 +1007,7 @@ static void set_inbound_win_registers(struct brcm_pcie *pcie,
>>>                  * 7712:
>>>                  *     All of their BARs need to be set.
>>>                  */
>>> -               if (pcie->soc_base == BCM7712) {
>>> +               if (pcie->cfg->soc_base == BCM7712) {
>>>                         /* BUS remap register settings */
>>>                         reg_offset = brcm_ubus_reg_offset(i);
>>>                         tmp = lower_32_bits(cpu_addr) & ~0xfff;
>>> @@ -1036,15 +1031,15 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>>>         int memc, ret;
>>>
>>>         /* Reset the bridge */
>>> -       ret = pcie->bridge_sw_init_set(pcie, 1);
>>> +       ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
>>>         if (ret)
>>>                 return ret;
>>>
>>>         /* Ensure that PERST# is asserted; some bootloaders may deassert it. */
>>> -       if (pcie->soc_base == BCM2711) {
>>> -               ret = pcie->perst_set(pcie, 1);
>>> +       if (pcie->cfg->soc_base == BCM2711) {
>>> +               ret = pcie->cfg->perst_set(pcie, 1);
>>>                 if (ret) {
>>> -                       pcie->bridge_sw_init_set(pcie, 0);
>>> +                       pcie->cfg->bridge_sw_init_set(pcie, 0);
>>>                         return ret;
>>>                 }
>>>         }
>>> @@ -1052,7 +1047,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>>>         usleep_range(100, 200);
>>>
>>>         /* Take the bridge out of reset */
>>> -       ret = pcie->bridge_sw_init_set(pcie, 0);
>>> +       ret = pcie->cfg->bridge_sw_init_set(pcie, 0);
>>>         if (ret)
>>>                 return ret;
>>>
>>> @@ -1072,9 +1067,9 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>>>          */
>>>         if (is_bmips(pcie))
>>>                 burst = 0x1; /* 256 bytes */
>>> -       else if (pcie->soc_base == BCM2711)
>>> +       else if (pcie->cfg->soc_base == BCM2711)
>>>                 burst = 0x0; /* 128 bytes */
>>> -       else if (pcie->soc_base == BCM7278)
>>> +       else if (pcie->cfg->soc_base == BCM7278)
>>>                 burst = 0x3; /* 512 bytes */
>>>         else
>>>                 burst = 0x2; /* 512 bytes */
>>> @@ -1199,7 +1194,7 @@ static void brcm_extend_rbus_timeout(struct brcm_pcie *pcie)
>>>         u32 timeout_us = 4000000; /* 4 seconds, our setting for L1SS */
>>>
>>>         /* 7712 does not have this (RGR1) timer */
>>> -       if (pcie->soc_base == BCM7712)
>>> +       if (pcie->cfg->soc_base == BCM7712)
>>>                 return;
>>>
>>>         /* Each unit in timeout register is 1/216,000,000 seconds */
>>> @@ -1277,7 +1272,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
>>>         int ret, i;
>>>
>>>         /* Unassert the fundamental reset */
>>> -       ret = pcie->perst_set(pcie, 0);
>>> +       ret = pcie->cfg->perst_set(pcie, 0);
>>>         if (ret)
>>>                 return ret;
>>>
>>> @@ -1463,12 +1458,12 @@ static int brcm_phy_cntl(struct brcm_pcie *pcie, const int start)
>>>
>>>  static inline int brcm_phy_start(struct brcm_pcie *pcie)
>>>  {
>>> -       return pcie->has_phy ? brcm_phy_cntl(pcie, 1) : 0;
>>> +       return pcie->cfg->has_phy ? brcm_phy_cntl(pcie, 1) : 0;
>>>  }
>>>
>>>  static inline int brcm_phy_stop(struct brcm_pcie *pcie)
>>>  {
>>> -       return pcie->has_phy ? brcm_phy_cntl(pcie, 0) : 0;
>>> +       return pcie->cfg->has_phy ? brcm_phy_cntl(pcie, 0) : 0;
>>>  }
>>>
>>>  static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
>>> @@ -1479,7 +1474,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
>>>         if (brcm_pcie_link_up(pcie))
>>>                 brcm_pcie_enter_l23(pcie);
>>>         /* Assert fundamental reset */
>>> -       ret = pcie->perst_set(pcie, 1);
>>> +       ret = pcie->cfg->perst_set(pcie, 1);
>>>         if (ret)
>>>                 return ret;
>>>
>>> @@ -1582,7 +1577,7 @@ static int brcm_pcie_resume_noirq(struct device *dev)
>>>                 goto err_reset;
>>>
>>>         /* Take bridge out of reset so we can access the SERDES reg */
>>> -       pcie->bridge_sw_init_set(pcie, 0);
>>> +       pcie->cfg->bridge_sw_init_set(pcie, 0);
>>>
>>>         /* SERDES_IDDQ = 0 */
>>>         tmp = readl(base + HARD_DEBUG(pcie));
>>> @@ -1803,12 +1798,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>>>         pcie = pci_host_bridge_priv(bridge);
>>>         pcie->dev = &pdev->dev;
>>>         pcie->np = np;
>>> -       pcie->reg_offsets = data->offsets;
>>> -       pcie->soc_base = data->soc_base;
>>> -       pcie->perst_set = data->perst_set;
>>> -       pcie->bridge_sw_init_set = data->bridge_sw_init_set;
>>> -       pcie->has_phy = data->has_phy;
>>> -       pcie->num_inbound_wins = data->num_inbound_wins;
>>> +       pcie->cfg = data;
>>>
>>>         pcie->base = devm_platform_ioremap_resource(pdev, 0);
>>>         if (IS_ERR(pcie->base))
>>> @@ -1843,7 +1833,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>>>         if (ret)
>>>                 return dev_err_probe(&pdev->dev, ret, "could not enable clock\n");
>>>
>>> -       pcie->bridge_sw_init_set(pcie, 0);
>>> +       pcie->cfg->bridge_sw_init_set(pcie, 0);
>>>
>>>         if (pcie->swinit_reset) {
>>>                 ret = reset_control_assert(pcie->swinit_reset);
>>> @@ -1882,7 +1872,8 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>>>                 goto fail;
>>>
>>>         pcie->hw_rev = readl(pcie->base + PCIE_MISC_REVISION);
>>> -       if (pcie->soc_base == BCM4908 && pcie->hw_rev >= BRCM_PCIE_HW_REV_3_20) {
>>> +       if (pcie->cfg->soc_base == BCM4908 &&
>>> +           pcie->hw_rev >= BRCM_PCIE_HW_REV_3_20) {
>>>                 dev_err(pcie->dev, "hardware revision with unsupported PERST# setup\n");
>>>                 ret = -ENODEV;
>>>                 goto fail;
>>> @@ -1897,7 +1888,8 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>>>                 }
>>>         }
>>>
>>> -       bridge->ops = pcie->soc_base == BCM7425 ? &brcm7425_pcie_ops : &brcm_pcie_ops;
>>> +       bridge->ops = pcie->cfg->soc_base == BCM7425 ?
>>> +                               &brcm7425_pcie_ops : &brcm_pcie_ops;
>>>         bridge->sysdata = pcie;
>>>
>>>         platform_set_drvdata(pdev, pcie);
>>
>> Reviewed-by: Jim Quinlan <james.quinlan@broadcom.com>
> 
> Hi Stan,
> 
> Sorry for the late notice but I get a compilation error on this commit:
> 
> drivers/pci/controller/pcie-brcmstb.c: In function 'brcm_pcie_turn_off':
> drivers/pci/controller/pcie-brcmstb.c:1492:14: error: 'struct
> brcm_pcie' has no member named 'bridge_sw_init_set'; did you mean
> 'bridge_reset'?
>   ret = pcie->bridge_sw_init_set(pcie, 1);
>               ^~~~~~~~~~~~~~~~~~
>               bridge_reset
> make[5]: *** [scripts/Makefile.build:194:
> drivers/pci/controller/pcie-brcmstb.o] Error 1
> 
> It appears to be fixed with the subsequent commit "PCI: brcmstb: Add
> bcm2712 support".
> 
> Can you please look into this and see if you get the same results?

Ah, it is my fault. Thanks for spotting this. This must have happened
when moving this patch earlier in the series.

Krzystof,

I could send a new version of the series or the other option could be to
rework those two patches in controller/brcmstb?

I will post later the fixes here if you choose the second option.

~Stan


