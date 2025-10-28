Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E513BCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wwzCwoll9urQFzaJ2w/bQYJFP3bpkFcySIlakUGODA=; b=aVNy6Kfi+rn0TQ1eB9gF0j8IJB
	UVlhvOW6Kk7tyXEHfuF7K+Old9iMmpmY5Xp+N67NTIhI6PA7+lhDdWsmYVjt9MVCNY2pGlFxtSZRE
	JwkTdzSsuuTrThg2i99IwKLpLeaYCU0IOSASgU/6nOeOakfSX6Gbjvfg66HFmeunaHXtHQS7NjI0a
	V8uW3qZIiSZMyWMztqrWK0G2juKFRxDe1w4zqup0ly0M+XXNanBAHtF+QrqKsACS4Hfo2g9A7ethE
	AjZq0tvdpy31Z+X1QKa+/qPmiBaDpxNTCXCPSK6n0HHq8qGiebrj42YiFyFKkwru8cWebzXrpwm5H
	0r1Z1OIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDptJ-0000000GaJW-1jA3;
	Tue, 28 Oct 2025 20:02:01 +0000
Received: from mail-yw1-x1161.google.com ([2607:f8b0:4864:20::1161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDptF-0000000GaHQ-4A7m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 20:02:00 +0000
Received: by mail-yw1-x1161.google.com with SMTP id 00721157ae682-78485808eb3so72815577b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681716; x=1762286516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wwzCwoll9urQFzaJ2w/bQYJFP3bpkFcySIlakUGODA=;
        b=kZDP6bJnsnZew9FRWcuXkf8UoW7IuIxqnQxIymTsfa4LWo7/TtoSZwisN2rfv+Y7TY
         UTR1P/4l1yxP1NCoZIKqh3hUQwMUFILPbBbomBXWwwMLm2Kh7LiBF0qSVjgLGntiXAvm
         S0PkcMwkL4MrMwQFfoKZ/cmsYUo4dDSNwdDLSok35lb2+mdTDSOHybWA3QFuxD6rpO2S
         OURVEzR8k4F5B5gxhO7yDUpw8f2wJw67MZY2toFtC+6KNiSpiqzWmKxPlUOjLBVaj1pB
         zMSeOMVFp8UrnpNjbgAFVOfQ9SfVVWlrSLE5fbq+L/ozB2burv0Zjjbr2cV524llbAAn
         AH4A==
X-Forwarded-Encrypted: i=1; AJvYcCULsfZMkJh/II0eXe3YHC5MOl/jPUYNKlFsgO+xj1wKM9bUhucQLt9+nOnJ01PkqWYxGk0ikh9L5cZjrFTCn/VS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6tKl2CxH5JaQvBX3CNz1jaTZ+II/8mhQaFmPsVWi6IlITaKhG
	2dL6TH7pHNN/JG+lqIplNNvc3lpTnW1WguwCQbqlbsn8bvG1V+CRLMMi9bhBbk3dMfHs7Xyevj5
	9DYVqT+8UVMdRHntWd7EMhDJ58fCYGeJWyp5PLe+VikYtZOF0oFcaGWbBOyJqA1rDDRXNuUXNI3
	bpO2oeLumTtukt43BRlk1/fVDKQPg5Mkog9+xOWdiZuIra9WGeIUW3w/vJ7jSk1B3C37NnqOQJ5
	0mQ0lKq19+IoaGNIBxAVrXN8UqAvPw=
X-Gm-Gg: ASbGncs8y1MLHJLD5dZr2NHmZ6aubumaRxHW3TW4bVO9G6uWeqEn3j70k6zslA0VFkf
	IB6I6smTzr31tBIQWsWFdbLKa+eDgjsaoWNsebMkHzVgUOVorfQDaHEiqnPUSXdc7lQkN2AzrfZ
	TCJBH/K2+JyN0kMzPRxi2/dn8u9R/f4eV66HZn2MG5ENbWi4swWezLGLallwYemMKjUbFNebUkV
	xMI0AvuTnevg+nM85nI5vQlpv/157vS8OwOi8PeJRU2u3A8FAfrerMpcqSB/JX7Mfp2IBDVGQyr
	Xmi5ghV/SiUph7tS9BV8xF/CsqixxTIYMlidTW6zEAJnTjNT0lDWBTmTypFZj+QxlR9eJe126A0
	xVslwY9j6Aoq1Jp4Ec/LlwyQExA6fJXVYJzGxWXT65nhgJXYD5Df/0aRLSjQI1EOZXNEf8WQwzT
	iHWZXmMSKKk6CNlHwVXf84LWDUv40hE4FMezo=
X-Google-Smtp-Source: AGHT+IEJ7uuDgAsfT6nx7aomOVXIKSI4VnRbSkyZwWmr62T0AT9srGmlEHa8pjaT6gzOjRH28sLXjNSdqSBm
X-Received: by 2002:a05:690c:e08:b0:784:a139:2106 with SMTP id 00721157ae682-78628e827c2mr4784207b3.6.1761681715891;
        Tue, 28 Oct 2025 13:01:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-785ed1de3bdsm7849627b3.27.2025.10.28.13.01.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Oct 2025 13:01:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290b13c5877so129278365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761681714; x=1762286514; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7wwzCwoll9urQFzaJ2w/bQYJFP3bpkFcySIlakUGODA=;
        b=AZNk68vd2rOpLpqigYq10C4C02UrAheraW8GQGn66+pgZZ1WFBU8QTqPWged7wrnpk
         13zSX3N2v7jOdt6mFfbJHKYvsKvJ8MxRft6IDkmb8fJElLI6qaGiF7vuBrwYjL9NNkc6
         aJCKbddDlE0yRx/jpU++DiMwX/8mTu/B80OLE=
X-Forwarded-Encrypted: i=1; AJvYcCWDUlD2PTbCQZvW0pTJtspqxhTcMgBNAdcQ0yxrOCA4vUT5qdNvopLUxvdTODaSYla7LbImuUTiLfuReaB1O8Nw@lists.infradead.org
X-Received: by 2002:a17:902:f681:b0:265:89c:251b with SMTP id d9443c01a7336-294dee98e93mr4778825ad.29.1761681714402;
        Tue, 28 Oct 2025 13:01:54 -0700 (PDT)
X-Received: by 2002:a17:902:f681:b0:265:89c:251b with SMTP id d9443c01a7336-294dee98e93mr4778465ad.29.1761681713837;
        Tue, 28 Oct 2025 13:01:53 -0700 (PDT)
Received: from [10.28.17.173] ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d30030sm124568435ad.65.2025.10.28.13.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 13:01:53 -0700 (PDT)
Message-ID: <5ca0b4a2-ec3a-4fa5-a691-7e3bab88890a@broadcom.com>
Date: Tue, 28 Oct 2025 16:01:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: brcmstb: Fix use of incorrect constant
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251022224553.GA1271981@bhelgaas>
Content-Language: en-US
From: James Quinlan <james.quinlan@broadcom.com>
Autocrypt: addr=james.quinlan@broadcom.com; keydata=
 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
In-Reply-To: <20251022224553.GA1271981@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_130158_167623_50644978 
X-CRM114-Status: GOOD (  32.56  )
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

On 10/22/25 18:45, Bjorn Helgaas wrote:
> On Fri, Oct 03, 2025 at 01:04:36PM -0400, Jim Quinlan wrote:
>> The driver was using the PCIE_LINK_STATE_L1 constant as a field mask for
>> setting the private PCI_EXP_LNKCAP register, but this constant is
>> Linux-created and has nothing to do with the PCIe spec.  Serendipitously,
>> the value of this constant was correct for its usage until after 6.1, when
>> its value changed from BIT(1) to BIT(2);
>> ...
>>   #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
>>   #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK	0x1f0
>> -#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
> This all tangential questions for possible future changes, not
> anything for *this* patch.
>
> We have these in include/uapi/linux/pci_regs.h:
>
>    #define PCI_EXP_LNKCAP          0x0c    /* Link Capabilities */
>    #define  PCI_EXP_LNKCAP_MLW     0x000003f0 /* Maximum Link Width */
>    #define  PCI_EXP_LNKCAP_ASPMS   0x00000c00 /* ASPM Support */
>    #define  PCI_EXP_LNKCAP_ASPM_L0S 0x00000400 /* ASPM L0s Support */
>
> Since you're using PCI_EXP_LNKCAP_ASPM_L0S below for writes to
> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY, I assume
> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY is another name for PCI_EXP_LNKCAP?
yes and no, see below.
>
> If so, it looks like we should also use PCI_EXP_LNKCAP_MLW instead of
> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK (although the
> value is different for some reason; maybe 0x1f0 just reflects the
> limits of brcmstb).
>
> It would be nice to have a #define for the base of the PCIe
> Capability so we could use that plus PCI_EXP_LNKCAP instead of
> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY.

Hi Bjorn,

I believe this has come up before.  Our "priv" registers should be exact 
mirrors of standard PCI config space registers to allow us to set RO 
fields.  Unfortunately, sometimes the "priv" fields do not exactly match 
the standard version.

As you have noticed, our field for MAX_LINK_WIDTH_MASK is 0x1f0 instead 
of 0x3f0.  The reason for this is not necessarily a BRCM limitation; our 
priv register has a CPM field mask of 0x200 (!) instead of where you 
would expect: 0x40000.  Further, everything in this priv register is 
different from its counterpart from bit 18 and higher.

> But you did something like that already for PCI_EXP_LNKCTL2 using
> BRCM_PCIE_CAP_REGS (0x00ac), which means LNKCTL2 and LNKCAP must be
> at:
>
>    LNKCTL2: 0x00dc (0x00ac + 0x30)
>    LNKCAP:  0x04dc (0x04d0 + 0x0c)
>
> which doesn't look at all like they would both be in the actual PCIe
> Capability format.
>
>>   #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
>>   #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK	0xf8

Just like the fields of our "priv" registers may be non-standard, so may 
be the addresses of our "priv" registers.  The first few registers are 
in the same order as EXP_CAP, but then the rest are not, so using 
standard offsets does not work.

I don't know why HW did these things.  I can add a comment to the code 
like "priv register addresses and fields may not correspond to standard 
PCI registers".

Regards,

Jim Quinlan

Broadcom STB/CM

>  From its usage to "un-advertise L1 substates",
> PCIE_RC_CFG_PRIV1_ROOT_CAP looks like it might be related to
> PCI_L1SS_CAP, but 0xf8 doesn't really match up to
> PCI_L1SS_CAP_L1_PM_SS (0x10)
>
> If this is really related to PCI_L1SS_CAP, can we use the names from
> pci_regs.h somehow?
>>   	/* Don't advertise L0s capability if 'aspm-no-l0s' */
>> -	aspm_support = PCIE_LINK_STATE_L1;
>> -	if (!of_property_read_bool(pcie->np, "aspm-no-l0s"))
>> -		aspm_support |= PCIE_LINK_STATE_L0S;
>>   	tmp = readl(base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>> -	u32p_replace_bits(&tmp, aspm_support,
>> -		PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK);
>> +	if (of_property_read_bool(pcie->np, "aspm-no-l0s"))
>> +		tmp &= ~PCI_EXP_LNKCAP_ASPM_L0S;
>>   	writel(tmp, base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>>   
>>   	/* 'tmp' still holds the contents of PRIV1_LINK_CAPABILITY */



